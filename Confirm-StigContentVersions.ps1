<#
.DESCRIPTION
    Check for newer versions of manual STIG benchmarks and STIG download tools defined in stig-info.json.
    For benchmark updates, move the current benchmark zip and its sibling revision history
    file from the repository's Current folder to Archive, then download the newer benchmark
    zip to Current.

    For tool updates, download the newer tool package directly to Archive.
#>
[CmdletBinding()]
param(
    # Download the latest manual benchmark files defined in stig-info.json.
    [bool]$DownloadManualBenchmarks = $true,
    # Download the latest semi-automated benchmark files defined in stig-info.json.
    [bool]$DownloadSemiAutomatedBenchmarks = $true,
    # Download the latest tool files defined in stig-info.json.
    [bool]$DownloadTools = $true
)

begin {
    function Invoke-BenchmarkUpdateDownload {
        param(
            [Parameter(Mandatory = $true)]
            [object[]]$ContentItems,

            [Parameter(Mandatory = $true)]
            [hashtable]$BenchmarkLookup,

            [Parameter(Mandatory = $true)]
            [string]$CurrentContentPath,

            [Parameter(Mandatory = $true)]
            [string]$ArchiveContentPath,

            [Parameter(Mandatory = $true)]
            [string]$BenchmarkTypeLabel
        )

        $downloadedBenchmarks = @()

        Write-Host "Processing $($ContentItems.Count) $BenchmarkTypeLabel benchmark update(s)" -ForegroundColor DarkCyan

        foreach ($contentItem in $ContentItems) {
            $benchmark = $BenchmarkLookup[$contentItem.ItemId]
            $currentZipFileName = $benchmark.ZipFile -replace '{version}', $contentItem.CurrentVersion
            $currentRevisionHistoryFileName = ([System.IO.Path]::GetFileNameWithoutExtension($currentZipFileName)) + '-RevisionHistory.json'
            $currentZipPath = Join-Path -Path $CurrentContentPath -ChildPath $currentZipFileName
            $currentRevisionHistoryPath = Join-Path -Path $CurrentContentPath -ChildPath $currentRevisionHistoryFileName
            $archiveZipPath = Join-Path -Path $ArchiveContentPath -ChildPath $currentZipFileName
            $archiveRevisionHistoryPath = Join-Path -Path $ArchiveContentPath -ChildPath $currentRevisionHistoryFileName

            $newZipFileName = $benchmark.ZipFile -replace '{version}', $contentItem.LatestVersion
            $newZipPath = Join-Path -Path $CurrentContentPath -ChildPath $newZipFileName

            if (Test-Path -LiteralPath $currentZipPath) {
                Move-Item -LiteralPath $currentZipPath -Destination $archiveZipPath -Force
                Write-Host "Archived benchmark zip to $archiveZipPath" -ForegroundColor DarkYellow
            } else {
                Write-Host "benchmark zip not found at $currentZipPath" -ForegroundColor DarkGray
            }

            if (Test-Path -LiteralPath $currentRevisionHistoryPath) {
                Move-Item -LiteralPath $currentRevisionHistoryPath -Destination $archiveRevisionHistoryPath -Force
                Write-Host "Archived revision history to $archiveRevisionHistoryPath" -ForegroundColor DarkYellow
            } else {
                Write-Host "revision history not found at $currentRevisionHistoryPath" -ForegroundColor DarkGray
            }

            if (Test-Path -LiteralPath $newZipPath) {
                Remove-Item -LiteralPath $newZipPath -Force
            }

            Start-BitsTransfer -Source $contentItem.DownloadUri -Destination $newZipPath
            (Get-Item -LiteralPath $newZipPath).LastWriteTime = Get-Date

            $downloadedBenchmarks += [PSCustomObject]@{
                ItemId        = $contentItem.ItemId
                LatestVersion = $contentItem.LatestVersion
                DownloadPath  = $newZipPath
            }

            Write-Host "Downloaded $BenchmarkTypeLabel benchmark file to: $newZipPath" -ForegroundColor Green
        }

        return $downloadedBenchmarks
    }

    function Get-NextBenchmarkVersions {
        <#
        .DESCRIPTION
            Given a STIG benchmark version string, return the next candidate versions to check.
            Supports version formats like "V2R5" and "Y25M09".
        #>
        param (
            [string]$CurrentVersion
        )

        $nextVersions = @()

        if ($CurrentVersion -match 'V(\d+)R(\d+)') {
            $major = [int]$matches[1]
            $minor = [int]$matches[2]

            $nextVersions += "V$($major)R$($minor + 1)"
            $nextVersions += "V$($major + 1)R1"
        } elseif ($CurrentVersion -match 'Y(\d+)M(\d+)') {
            $versionYear = [int]$matches[1]
            $versionMonth = [int]$matches[2]
            $currentYear = (Get-Date).Year % 100
            $currentMonth = (Get-Date).Month
            $checkYear = $versionYear
            $checkMonth = $versionMonth

            while (($checkYear -lt $currentYear) -or (($checkYear -eq $currentYear) -and ($checkMonth -lt $currentMonth))) {
                $checkMonth += 1
                if ($checkMonth -gt 12) {
                    $checkMonth = 1
                    $checkYear += 1
                }

                $nextVersions += "Y{0:D2}M{1:D2}" -f $checkYear, $checkMonth
            }
        } else {
            Write-Warning "Unrecognized benchmark version format: $CurrentVersion"
            throw "Unrecognized benchmark version format: $CurrentVersion"
        }

        return $nextVersions
    }

    function Get-NextDownloadVersions {
        <#
        .DESCRIPTION
            Given a STIG tool/download version string, return the next candidate versions to check.
            Supports version formats like "3-6-0", "5.12.1", "5.14", and "July_2025".
        #>
        param (
            [string]$CurrentVersion
        )

        $nextVersions = @()

        if ($CurrentVersion -match '(\d+)-(\d+)-(\d+)') {
            $major = [int]$matches[1]
            $minor = [int]$matches[2]
            $patch = [int]$matches[3]

            $nextVersions += "$major-$minor-$($patch + 1)"
            $nextVersions += "$major-$($minor + 1)-0"
            $nextVersions += "$($major + 1)-0-0"
        } elseif ($CurrentVersion -match '^(\d+)\.(\d+)(?:\.(\d+))?$') {
            $major = [int]$matches[1]
            $minor = [int]$matches[2]
            $patch = if ($matches[3]) { [int]$matches[3] } else { $null }

            if ($null -ne $patch) {
                $nextVersions += "$major.$minor.$($patch + 1)"
            }

            foreach ($minorOffset in 1..12) {
                $candidateMinor = $minor + $minorOffset
                $nextVersions += "$major.$candidateMinor"
                $nextVersions += "$major.$candidateMinor.0"
            }

            foreach ($majorOffset in 1..3) {
                $candidateMajor = $major + $majorOffset
                $nextVersions += "$candidateMajor.0"
                $nextVersions += "$candidateMajor.0.0"
            }
        } elseif ($CurrentVersion -match '(\w+)_(\d+)') {
            $monthName = $matches[1]
            $versionYear = [int]$matches[2]
            $months = @(
                'January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'
            )
            $versionMonth = 0
            for ($monthIndex = 0; $monthIndex -lt $months.Count; $monthIndex++) {
                if ($months[$monthIndex] -eq $monthName) {
                    $versionMonth = $monthIndex + 1
                    break
                }
            }

            if ($versionMonth -eq 0) {
                Write-Warning "Unrecognized month name: $monthName"
                throw "Unrecognized month name: $monthName"
            }

            $currentYear = (Get-Date).Year
            $currentMonth = (Get-Date).Month
            $checkYear = $versionYear
            $checkMonth = $versionMonth

            while (($checkYear -lt $currentYear) -or (($checkYear -eq $currentYear) -and ($checkMonth -lt $currentMonth))) {
                $checkMonth += 1
                if ($checkMonth -gt 12) {
                    $checkMonth = 1
                    $checkYear += 1
                }

                $nextVersions += "$($months[$checkMonth - 1])_$checkYear"
            }
        } else {
            Write-Warning "Unrecognized download version format: $CurrentVersion"
            throw "Unrecognized download version format: $CurrentVersion"
        }

        return $nextVersions | Select-Object -Unique
    }

    function Test-VersionAvailable {
        <#
        .DESCRIPTION
            Test if a download URI is available by sending a HEAD request.
        #>
        param (
            [string]$DownloadUri
        )

        try {
            $null = Invoke-WebRequest `
                -Uri $DownloadUri `
                -Method Head `
                -TimeoutSec 3 `
                -MaximumRedirection 5 `
                -UseBasicParsing `
                -ErrorAction Stop
            return $true
        } catch {
            return $false
        }
    }

    function Get-LatestAvailableVersion {
        <#
        .DESCRIPTION
            Starting from the current version, continue checking newer candidate versions until no newer version is found.
        #>
        param (
            [string]$ItemName,
            [string]$CurrentVersion,
            [string]$FileTemplate,
            [string]$BaseDownloadUri,
            [scriptblock]$GetCandidateVersions
        )

        $latestVersion = $CurrentVersion
        $latestFileName = $FileTemplate -replace '{version}', $latestVersion
        $latestDownloadUri = "$BaseDownloadUri/$latestFileName"
        $updateAvailable = $false
        $searchVersion = $CurrentVersion

        Write-Host "CurrentVersion: $CurrentVersion" -ForegroundColor DarkCyan

        do {
            $candidateVersions = & $GetCandidateVersions $searchVersion
            if (-not $candidateVersions) {
                break
            }

            if ($searchVersion -eq $CurrentVersion) {
                Write-Host "Next versions to check: $($candidateVersions -join ', ')" -ForegroundColor DarkCyan
            } else {
                Write-Host "Continuing search from version $searchVersion. Next versions to check: $($candidateVersions -join ', ')" -ForegroundColor DarkCyan
            }

            $foundVersionThisPass = $false
            foreach ($candidateVersion in $candidateVersions) {
                $candidateFileName = $FileTemplate -replace '{version}', $candidateVersion
                $candidateDownloadUri = "$BaseDownloadUri/$candidateFileName"

                Write-Host "Checking URI: $candidateDownloadUri" -ForegroundColor DarkCyan

                if (Test-VersionAvailable -DownloadUri $candidateDownloadUri) {
                    $updateAvailable = $true
                    $foundVersionThisPass = $true
                    $latestVersion = $candidateVersion
                    $latestFileName = $candidateFileName
                    $latestDownloadUri = $candidateDownloadUri

                    Write-Host "New version available for ${ItemName}: $candidateVersion" -ForegroundColor Green
                } else {
                    Write-Host "Version: $candidateVersion not found." -ForegroundColor DarkGray
                }
            }

            if ($foundVersionThisPass) {
                $searchVersion = $latestVersion
            }
        } while ($foundVersionThisPass)

        return [PSCustomObject]@{
            CurrentVersion  = $CurrentVersion
            LatestVersion   = $latestVersion
            FileName        = $latestFileName
            UpdateAvailable = $updateAvailable
            DownloadUri     = $latestDownloadUri
        }
    }
}

process {
    $baseDownloadUri = 'https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip'
    $stigsInfoPath = Join-Path -Path $PSScriptRoot -ChildPath 'stig-info.json'
    $currentContentPath = Join-Path -Path $PSScriptRoot -ChildPath 'Current'
    $archiveContentPath = Join-Path -Path $PSScriptRoot -ChildPath 'Archive'

    if (-not (Test-Path -LiteralPath $stigsInfoPath)) {
        Write-Error "stig-info.json file not found at path: $stigsInfoPath"
        exit 1
    }

    New-Item -Path $currentContentPath -ItemType Directory -Force | Out-Null
    New-Item -Path $archiveContentPath -ItemType Directory -Force | Out-Null

    $stigsInfo = Get-Content -LiteralPath $stigsInfoPath | ConvertFrom-Json
    $manualBenchmarks = @($stigsInfo.StigBenchmarks | Where-Object { $_.ScanType -eq 'Manual' })
    $semiAutomatedBenchmarks = @($stigsInfo.StigBenchmarks | Where-Object { $_.ScanType -eq 'SemiAutomated' })
    $contentResults = @()

    foreach ($benchmark in $manualBenchmarks) {
        Write-Host "Checking for new version of manual benchmark $($benchmark.StigDisplayName)" -ForegroundColor DarkCyan

        $versionResult = Get-LatestAvailableVersion `
            -ItemName $benchmark.StigDisplayName `
            -CurrentVersion $benchmark.CurrentVersion `
            -FileTemplate $benchmark.ZipFile `
            -BaseDownloadUri $baseDownloadUri `
            -GetCandidateVersions ${function:Get-NextBenchmarkVersions}

        $contentResults += [PSCustomObject]@{
            Category        = 'ManualBenchmark'
            ItemId          = $benchmark.StigId
            Name            = $benchmark.StigDisplayName
            CurrentVersion  = $versionResult.CurrentVersion
            LatestVersion   = $versionResult.LatestVersion
            FileName        = $versionResult.FileName
            UpdateAvailable = $versionResult.UpdateAvailable
            DownloadUri     = $versionResult.DownloadUri
        }

        if ($versionResult.UpdateAvailable) {
            Write-Host "Update available for $($benchmark.StigDisplayName)" -ForegroundColor Green
        } else {
            Write-Host "No new version available for $($benchmark.StigDisplayName)" -ForegroundColor DarkGray
        }

        Write-Host ('=' * 50) -ForegroundColor DarkGray
    }

    foreach ($benchmark in $semiAutomatedBenchmarks) {
        Write-Host "Checking for new version of semi-automated benchmark $($benchmark.StigDisplayName)" -ForegroundColor DarkCyan

        $versionResult = Get-LatestAvailableVersion `
            -ItemName $benchmark.StigDisplayName `
            -CurrentVersion $benchmark.CurrentVersion `
            -FileTemplate $benchmark.ZipFile `
            -BaseDownloadUri $baseDownloadUri `
            -GetCandidateVersions ${function:Get-NextBenchmarkVersions}

        $contentResults += [PSCustomObject]@{
            Category        = 'SemiAutomatedBenchmark'
            ItemId          = $benchmark.StigId
            Name            = $benchmark.StigDisplayName
            CurrentVersion  = $versionResult.CurrentVersion
            LatestVersion   = $versionResult.LatestVersion
            FileName        = $versionResult.FileName
            UpdateAvailable = $versionResult.UpdateAvailable
            DownloadUri     = $versionResult.DownloadUri
        }

        if ($versionResult.UpdateAvailable) {
            Write-Host "Update available for $($benchmark.StigDisplayName)" -ForegroundColor Green
        } else {
            Write-Host "No new version available for $($benchmark.StigDisplayName)" -ForegroundColor DarkGray
        }

        Write-Host ('=' * 50) -ForegroundColor DarkGray
    }

    foreach ($download in $stigsInfo.Downloads) {
        Write-Host "Checking for new version of tool download $($download.Name)" -ForegroundColor DarkCyan

        $versionResult = Get-LatestAvailableVersion `
            -ItemName $download.Name `
            -CurrentVersion $download.Version `
            -FileTemplate $download.FileName `
            -BaseDownloadUri $baseDownloadUri `
            -GetCandidateVersions ${function:Get-NextDownloadVersions}

        $contentResults += [PSCustomObject]@{
            Category        = 'Download'
            ItemId          = $download.DownloadId
            Name            = $download.Name
            CurrentVersion  = $versionResult.CurrentVersion
            LatestVersion   = $versionResult.LatestVersion
            FileName        = $versionResult.FileName
            UpdateAvailable = $versionResult.UpdateAvailable
            DownloadUri     = $versionResult.DownloadUri
        }

        if ($versionResult.UpdateAvailable) {
            Write-Host "Update available for $($download.Name)" -ForegroundColor Green
        } else {
            Write-Host "No new version available for $($download.Name)" -ForegroundColor DarkGray
        }

        Write-Host ('=' * 50) -ForegroundColor DarkGray
    }
}

end {
    $availableUpdates = @($contentResults | Where-Object { $_.UpdateAvailable })
    $downloadableManualBenchmarks = @($contentResults | Where-Object { $_.Category -eq 'ManualBenchmark' -and $_.DownloadUri })
    $downloadableSemiAutomatedBenchmarks = @($contentResults | Where-Object { $_.Category -eq 'SemiAutomatedBenchmark' -and $_.DownloadUri })
    $downloadableTools = @($contentResults | Where-Object { $_.Category -eq 'Download' -and $_.DownloadUri })
    $downloadedBenchmarks = @()
    $downloadedTools = @()
    $benchmarkLookup = @{}

    foreach ($benchmark in $stigsInfo.StigBenchmarks) {
        $benchmarkLookup[$benchmark.StigId] = $benchmark
    }

    if ($availableUpdates.Count -eq 0) {
        Write-Host 'No new STIG content versions found.' -ForegroundColor Green
    } else {
        Write-Host "$($availableUpdates.Count) STIG content update(s) available." -ForegroundColor Yellow
    }

    $contentResults | Format-Table Category, Name, CurrentVersion, LatestVersion, UpdateAvailable -AutoSize -Wrap

    if ($DownloadManualBenchmarks) {
        $downloadedBenchmarks += Invoke-BenchmarkUpdateDownload `
            -ContentItems $downloadableManualBenchmarks `
            -BenchmarkLookup $benchmarkLookup `
            -CurrentContentPath $currentContentPath `
            -ArchiveContentPath $archiveContentPath `
            -BenchmarkTypeLabel 'manual STIG/SRG'
    }

    if ($DownloadSemiAutomatedBenchmarks) {
        $downloadedBenchmarks += Invoke-BenchmarkUpdateDownload `
            -ContentItems $downloadableSemiAutomatedBenchmarks `
            -BenchmarkLookup $benchmarkLookup `
            -CurrentContentPath $currentContentPath `
            -ArchiveContentPath $archiveContentPath `
            -BenchmarkTypeLabel 'semi-automated STIG'
    }

    if ($DownloadTools) {
        Write-Host "Downloading $($downloadableTools.Count) tool file(s) to Archive" -ForegroundColor DarkCyan

        foreach ($contentItem in $downloadableTools) {
            $downloadPath = Join-Path -Path $archiveContentPath -ChildPath $contentItem.FileName
            if (Test-Path -LiteralPath $downloadPath) {
                Remove-Item -LiteralPath $downloadPath -Force
            }
            Start-BitsTransfer -Source $contentItem.DownloadUri -Destination $downloadPath
            (Get-Item -LiteralPath $downloadPath).LastWriteTime = Get-Date
            $zipHash = (Get-FileHash -LiteralPath $downloadPath -Algorithm SHA256).Hash

            $downloadedTools += [PSCustomObject]@{
                ItemId        = $contentItem.ItemId
                LatestVersion = $contentItem.LatestVersion
                DownloadUri   = $contentItem.DownloadUri
                ZipHash       = $zipHash
            }

            Write-Host "Downloaded tool file to: $downloadPath" -ForegroundColor Green
        }
    }

    $stigInfoUpdated = $false

    foreach ($downloadedBenchmark in $downloadedBenchmarks) {
        $benchmark = $stigsInfo.StigBenchmarks | Where-Object { $_.StigId -eq $downloadedBenchmark.ItemId } | Select-Object -First 1
        if ($benchmark -and $benchmark.CurrentVersion -ne $downloadedBenchmark.LatestVersion) {
            $benchmark.CurrentVersion = $downloadedBenchmark.LatestVersion
            $stigInfoUpdated = $true
        }
    }

    foreach ($downloadedTool in $downloadedTools) {
        $tool = $stigsInfo.Downloads | Where-Object { $_.DownloadId -eq $downloadedTool.ItemId } | Select-Object -First 1
        if ($tool) {
            if ($tool.Version -ne $downloadedTool.LatestVersion) {
                $tool.Version = $downloadedTool.LatestVersion
                $stigInfoUpdated = $true
            }

            if ($tool.DownloadUrl -ne $downloadedTool.DownloadUri) {
                $tool.DownloadUrl = $downloadedTool.DownloadUri
                $stigInfoUpdated = $true
            }

            if ($tool.PSObject.Properties.Name -contains 'ZipHash') {
                if ($tool.ZipHash -ne $downloadedTool.ZipHash) {
                    $tool.ZipHash = $downloadedTool.ZipHash
                    $stigInfoUpdated = $true
                }
            } else {
                Add-Member -InputObject $tool -NotePropertyName 'ZipHash' -NotePropertyValue $downloadedTool.ZipHash
                $stigInfoUpdated = $true
            }
        }
    }

    if ($stigInfoUpdated) {
        $stigsInfo | ConvertTo-Json -Depth 100 | Set-Content -Path $stigsInfoPath -Encoding utf8
        Write-Host "Updated stig-info.json with the latest version info." -ForegroundColor Green
    }
}

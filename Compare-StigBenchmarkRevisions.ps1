<#
.DESCRIPTION
    Compare the current STIG benchmark version in stig-info.json to the previous version
    found in this repository's Current and Archive folders.

    The script matches benchmark packages by the ZipFile template in stig-info.json,
    loads the XCCDF benchmark from the current and previous package, and reports:
    - Changed group IDs for the same rule version
    - Changed rule versions for the same group ID
    - Changed rule IDs/revision suffixes
    - Added and removed groups

    This is intended for STIG automation workflows where the current benchmark version
    is tracked in stig-info.json and revision deltas are derived from the benchmark
    packages stored locally in the repository.
#>
[CmdletBinding()]
param(
    [Parameter()]
    [string]$StigContentLibraryPath = $PSScriptRoot,

    [Parameter()]
    [string]$StigInfoPath = (Join-Path -Path $PSScriptRoot -ChildPath 'stig-info.json'),

    [Parameter()]
    [string[]]$StigId,

    [Parameter()]
    [AllowEmptyString()]
    [string]$OutputPath = (Join-Path -Path $PSScriptRoot -ChildPath "Current\CombinedRevisionHistoryReport.json"),

    [Parameter()]
    [ValidateSet('All', 'Manual', 'SemiAutomated')]
    [string]$ScanType = 'All',

    [Parameter()]
    [switch]$PassThru
)

begin {
    $ErrorActionPreference = 'Stop'

    function Get-VersionSortKey {
        param(
            [Parameter(Mandatory = $true)]
            [string]$Version
        )

        if ($Version -match '^V(\d+)R(\d+)$') {
            return ([int]$matches[1] * 1000) + [int]$matches[2]
        }

        if ($Version -match '^Y(\d+)M(\d+)$') {
            return ([int]$matches[1] * 100) + [int]$matches[2]
        }

        return -1
    }

    function Get-ScapSortKey {
        param(
            [Parameter(Mandatory = $true)]
            [string]$FileName
        )

        # ! What matches "SCAP_" ?
        if ($FileName -match 'SCAP_(\d+)-(\d+)') {
            return ([int]$matches[1] * 100) + [int]$matches[2]
        }

        return 0
    }

    function Get-EnhancedVersionSortKey {
        param(
            [Parameter(Mandatory = $true)]
            [string]$FileName
        )

        if ($FileName -match 'enhancedV(\d+)') {
            return [int]$matches[1]
        }

        return 0
    }

    function Get-ShortId {
        param(
            [Parameter()]
            [AllowEmptyString()]
            [string]$Value,

            [Parameter(Mandatory = $true)]
            [string]$Pattern
        )

        if ([string]::IsNullOrWhiteSpace($Value)) {
            return ''
        }

        if ($Value -match $Pattern) {
            return $matches[0]
        }

        return $Value
    }

    function Resolve-StigContentPaths {
        param(
            [Parameter(Mandatory = $true)]
            [string]$Path
        )

        $resolvedInputPath = (Resolve-Path -LiteralPath $Path).Path
        $inputLeaf = Split-Path -Path $resolvedInputPath -Leaf

        $candidateRoot = $resolvedInputPath
        $candidateCurrent = Join-Path -Path $candidateRoot -ChildPath 'Current'
        $candidateArchive = Join-Path -Path $candidateRoot -ChildPath 'Archive'

        if ((Test-Path -LiteralPath $candidateCurrent) -and (Test-Path -LiteralPath $candidateArchive)) {
            return [ordered]@{
                RootPath    = $candidateRoot
                CurrentPath = (Resolve-Path -LiteralPath $candidateCurrent).Path
                ArchivePath = (Resolve-Path -LiteralPath $candidateArchive).Path
            }
        }

        if ($inputLeaf -in @('Current', 'Archive')) {
            $candidateRoot = Split-Path -Path $resolvedInputPath -Parent
            $candidateCurrent = Join-Path -Path $candidateRoot -ChildPath 'Current'
            $candidateArchive = Join-Path -Path $candidateRoot -ChildPath 'Archive'

            if ((Test-Path -LiteralPath $candidateCurrent) -and (Test-Path -LiteralPath $candidateArchive)) {
                return [ordered]@{
                    RootPath    = (Resolve-Path -LiteralPath $candidateRoot).Path
                    CurrentPath = (Resolve-Path -LiteralPath $candidateCurrent).Path
                    ArchivePath = (Resolve-Path -LiteralPath $candidateArchive).Path
                }
            }
        }

        throw "Expected a repository root containing Current and Archive folders, or one of those folders directly. Path: $Path"
    }

    function Get-RevisionHistoryOutputPath {
        param(
            [Parameter(Mandatory = $true)]
            [string]$CurrentPackagePath
        )

        $packageItem = Get-Item -LiteralPath $CurrentPackagePath
        return Join-Path -Path $packageItem.DirectoryName -ChildPath ($packageItem.BaseName + '-RevisionHistory.json')
    }

    function Save-RevisionHistoryReport {
        param(
            [Parameter(Mandatory = $true)]
            [hashtable]$Result,

            [Parameter(Mandatory = $true)]
            [string]$CurrentPackagePath
        )

        $revisionHistoryPath = Get-RevisionHistoryOutputPath -CurrentPackagePath $CurrentPackagePath
        $Result | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $revisionHistoryPath -Encoding utf8
        Write-Host "Saved revision history to $revisionHistoryPath" -ForegroundColor Green
    }

    function Get-BenchmarkMatchKey {
        param(
            [Parameter(Mandatory = $true)]
            [hashtable]$BenchmarkData
        )

        if (-not [string]::IsNullOrWhiteSpace($BenchmarkData.BenchmarkTitle)) {
            return $BenchmarkData.BenchmarkTitle
        }

        if (-not [string]::IsNullOrWhiteSpace($BenchmarkData.BenchmarkId)) {
            return $BenchmarkData.BenchmarkId
        }

        return $BenchmarkData.FileName
    }

    function Get-PackageMetadata {
        param(
            [Parameter(Mandatory = $true)]
            [System.IO.FileInfo]$File,

            [Parameter(Mandatory = $true)]
            [object]$Benchmark
        )

        $templateParts = $Benchmark.ZipFile -split '\{version\}', 2
        if ($templateParts.Count -ne 2) {
            return $null
        }

        $prefix = $templateParts[0]
        $suffix = $templateParts[1] -replace '\.zip$', ''
        $baseName = $File.BaseName

        if ($baseName.Length -le $prefix.Length) {
            return $null
        }

        if (-not $baseName.StartsWith($prefix)) {
            return $null
        }

        $suffixIndex = $baseName.IndexOf($suffix, $prefix.Length)
        if ($suffixIndex -lt 0) {
            return $null
        }

        $version = $baseName.Substring($prefix.Length, $suffixIndex - $prefix.Length)
        if ($version -notmatch '^(V\d+R\d+|Y\d+M\d+)$') {
            return $null
        }

        $location = if (
            $File.DirectoryName -eq $script:CurrentBenchmarkPath -or
            $File.DirectoryName -like "$($script:CurrentBenchmarkPath)\*"
        ) {
            'Current'
        } elseif (
            $File.DirectoryName -eq $script:ArchiveBenchmarkPath -or
            $File.DirectoryName -like "$($script:ArchiveBenchmarkPath)\*"
        ) {
            'Archive'
        } else {
            'Unknown'
        }

        return [ordered]@{
            StigId             = $Benchmark.StigId
            FileName           = $File.Name
            FullName           = $File.FullName
            Version            = $version
            VersionSortKey     = Get-VersionSortKey -Version $version
            ScapSortKey        = Get-ScapSortKey -FileName $File.Name
            EnhancedSortKey    = Get-EnhancedVersionSortKey -FileName $File.Name
            Signed             = [bool]($File.Name -match '-signed\.zip$')
            Location           = $location
            LocationSortKey    = if ($location -eq 'Current') { 1 } else { 0 }
            ParentDirectory    = $File.Directory.Name
        }
    }

    function Get-BenchmarkPackageCandidates {
        param(
            [Parameter(Mandatory = $true)]
            [object]$Benchmark,

            [Parameter(Mandatory = $true)]
            [object[]]$PackageFiles
        )

        $matching = @()
        foreach ($packageFile in $PackageFiles) {
            $metadata = Get-PackageMetadata -File $packageFile -Benchmark $Benchmark
            if ($null -ne $metadata) {
                $matching += $metadata
            }
        }

        return $matching
    }

    function Select-BestPackage {
        param(
            [Parameter(Mandatory = $true)]
            [object[]]$Candidates
        )

        return $Candidates |
            Sort-Object `
                @{ Expression = { $_.LocationSortKey }; Descending = $true }, `
                @{ Expression = { $_.ScapSortKey }; Descending = $true }, `
                @{ Expression = { $_.EnhancedSortKey }; Descending = $true }, `
                @{ Expression = { $_.Signed }; Descending = $true }, `
                @{ Expression = { $_.FileName }; Descending = $true } |
            Select-Object -First 1
    }

    function Get-PackageBenchmarkData {
        param(
            [Parameter(Mandatory = $true)]
            [string]$PackagePath
        )

        $extractRoot = Join-Path -Path 'C:\Temp' -ChildPath ('StigBenchmarkCompare_' + (Get-Date -Format 'yyyyMMddHHmmssfff') + '_' + (Get-Random -Minimum 1000 -Maximum 9999))
        $benchmarkData = @()

        try {
            New-Item -Path $extractRoot -ItemType Directory -Force | Out-Null
            Expand-Archive -LiteralPath $PackagePath -DestinationPath $extractRoot -Force

            $xmlFiles = Get-ChildItem -Path $extractRoot -Filter '*.xml' -File -Recurse
            foreach ($xmlFile in $xmlFiles) {
                try {
                    [xml]$candidateXml = Get-Content -LiteralPath $xmlFile.FullName
                    if (
                        $null -ne $candidateXml.DocumentElement -and
                        $candidateXml.DocumentElement.LocalName -eq 'Benchmark'
                    ) {
                        $benchmarkTitleNode = $candidateXml.DocumentElement.SelectSingleNode("*[local-name()='title']")
                        $statusNode = $candidateXml.DocumentElement.SelectSingleNode("*[local-name()='status']")
                        $referenceNode = $candidateXml.DocumentElement.SelectSingleNode("*[local-name()='reference']")
                        $releaseInfoNode = $candidateXml.DocumentElement.SelectSingleNode("*[local-name()='plain-text' and @id='release-info']")
                        $groupNodes = $candidateXml.SelectNodes("//*[local-name()='Benchmark']/*[local-name()='Group']")
                        $entries = @()
                        $benchmarkDate = $null

                        if ($null -ne $releaseInfoNode) {
                            $releaseInfoText = $releaseInfoNode.InnerText.Trim()
                            if ($releaseInfoText -match 'Benchmark Date:\s*([^\r\n]+)') {
                                $benchmarkDateValue = $matches[1].Trim()
                                [datetime]$parsedBenchmarkDate = [datetime]::MinValue
                                if ([datetime]::TryParseExact($benchmarkDateValue, 'dd MMM yyyy', [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::None, [ref]$parsedBenchmarkDate)) {
                                    $benchmarkDate = $parsedBenchmarkDate.ToString('yyyy-MM-dd')
                                } else {
                                    $benchmarkDate = $benchmarkDateValue
                                }
                            }
                        }

                        foreach ($groupNode in $groupNodes) {
                            $ruleNode = $groupNode.SelectSingleNode("*[local-name()='Rule']")
                            if ($null -eq $ruleNode) {
                                continue
                            }

                            $groupTitleNode = $groupNode.SelectSingleNode("*[local-name()='title']")
                            $ruleVersionNode = $ruleNode.SelectSingleNode("*[local-name()='version']")
                            $ruleTitleNode = $ruleNode.SelectSingleNode("*[local-name()='title']")

                            $groupIdFull = [string]$groupNode.Attributes['id'].Value
                            $ruleIdFull = [string]$ruleNode.Attributes['id'].Value

                            $entries += [ordered]@{
                                GroupId        = Get-ShortId -Value $groupIdFull -Pattern 'V-\d+'
                                GroupIdFull    = $groupIdFull
                                GroupTitle     = if ($null -ne $groupTitleNode) { $groupTitleNode.InnerText.Trim() } else { '' }
                                RuleVersion    = if ($null -ne $ruleVersionNode) { $ruleVersionNode.InnerText.Trim() } else { '' }
                                RuleId         = Get-ShortId -Value $ruleIdFull -Pattern 'SV-\d+r\d+'
                                RuleIdFull     = $ruleIdFull
                                RuleTitle      = if ($null -ne $ruleTitleNode) { $ruleTitleNode.InnerText.Trim() } else { '' }
                                Severity       = [string]$ruleNode.Attributes['severity'].Value
                            }
                        }

                        $benchmarkItem = [ordered]@{
                            BenchmarkId        = [string]$candidateXml.DocumentElement.GetAttribute('id')
                            BenchmarkTitle     = if ($null -ne $benchmarkTitleNode) { $benchmarkTitleNode.InnerText.Trim() } else { '' }
                            RelativePath       = $xmlFile.FullName.Substring($extractRoot.Length + 1)
                            FileName           = $xmlFile.Name
                            Status             = if ($null -ne $statusNode) { $statusNode.InnerText.Trim() } else { '' }
                            StatusDate         = if ($null -ne $statusNode) { [string]$statusNode.GetAttribute('date') } else { '' }
                            BenchmarkDate      = if ($null -ne $benchmarkDate) { $benchmarkDate } else { '' }
                            ReleaseInfo        = if ($null -ne $releaseInfoNode) { $releaseInfoNode.InnerText.Trim() } else { '' }
                            Reference          = if ($null -ne $referenceNode) { $referenceNode.InnerText.Trim() } else { '' }
                            ReferenceHref      = if ($null -ne $referenceNode) { [string]$referenceNode.GetAttribute('href') } else { '' }
                            Entries            = $entries
                        }
                        $benchmarkItem['MatchKey'] = Get-BenchmarkMatchKey -BenchmarkData $benchmarkItem
                        $benchmarkData += $benchmarkItem
                    }
                } catch {
                    continue
                }
            }

            if ($benchmarkData.Count -eq 0) {
                throw "Unable to locate an XCCDF Benchmark XML inside package: $PackagePath"
            }

            return $benchmarkData
        } finally {
            if (Test-Path -LiteralPath $extractRoot) {
                Remove-Item -LiteralPath $extractRoot -Recurse -Force -ErrorAction SilentlyContinue
            }
        }
    }

    function Compare-BenchmarkEntries {
        param(
            [Parameter(Mandatory = $true)]
            [object[]]$CurrentEntries,

            [Parameter(Mandatory = $true)]
            [object[]]$PreviousEntries
        )

        $previousByRuleVersion = @{}
        $previousByGroupId = @{}
        $currentByRuleVersion = @{}
        $currentByGroupId = @{}

        foreach ($entry in $PreviousEntries) {
            if (-not [string]::IsNullOrWhiteSpace($entry.RuleVersion)) {
                $previousByRuleVersion[$entry.RuleVersion] = $entry
            }
            if (-not [string]::IsNullOrWhiteSpace($entry.GroupId)) {
                $previousByGroupId[$entry.GroupId] = $entry
            }
        }

        foreach ($entry in $CurrentEntries) {
            if (-not [string]::IsNullOrWhiteSpace($entry.RuleVersion)) {
                $currentByRuleVersion[$entry.RuleVersion] = $entry
            }
            if (-not [string]::IsNullOrWhiteSpace($entry.GroupId)) {
                $currentByGroupId[$entry.GroupId] = $entry
            }
        }

        $changedGroupIds = @()
        $changedRuleVersions = @()
        $changedRuleIds = @()
        $addedGroups = @()
        $removedGroups = @()
        $matchedCurrentGroupIds = @{}
        $matchedPreviousGroupIds = @{}

        foreach ($currentEntry in $CurrentEntries) {
            if ($previousByRuleVersion.ContainsKey($currentEntry.RuleVersion)) {
                $previousEntry = $previousByRuleVersion[$currentEntry.RuleVersion]
                $matchedCurrentGroupIds[$currentEntry.GroupId] = $true
                $matchedPreviousGroupIds[$previousEntry.GroupId] = $true

                if ($currentEntry.GroupId -ne $previousEntry.GroupId) {
                    $changedGroupIds += [ordered]@{
                        RuleVersion     = $currentEntry.RuleVersion
                        PreviousGroupId = $previousEntry.GroupId
                        CurrentGroupId  = $currentEntry.GroupId
                        PreviousRuleId  = $previousEntry.RuleId
                        CurrentRuleId   = $currentEntry.RuleId
                        RuleTitle       = $currentEntry.RuleTitle
                    }
                    continue
                }

                if ($currentEntry.RuleId -ne $previousEntry.RuleId) {
                    $changedRuleIds += [ordered]@{
                        GroupId         = $currentEntry.GroupId
                        RuleVersion     = $currentEntry.RuleVersion
                        PreviousRuleId  = $previousEntry.RuleId
                        CurrentRuleId   = $currentEntry.RuleId
                        RuleTitle       = $currentEntry.RuleTitle
                    }
                }

                continue
            }

            if ($previousByGroupId.ContainsKey($currentEntry.GroupId)) {
                $previousEntry = $previousByGroupId[$currentEntry.GroupId]
                $matchedCurrentGroupIds[$currentEntry.GroupId] = $true
                $matchedPreviousGroupIds[$previousEntry.GroupId] = $true

                $changedRuleVersions += [ordered]@{
                    GroupId              = $currentEntry.GroupId
                    PreviousRuleVersion  = $previousEntry.RuleVersion
                    CurrentRuleVersion   = $currentEntry.RuleVersion
                    PreviousRuleId       = $previousEntry.RuleId
                    CurrentRuleId        = $currentEntry.RuleId
                    RuleTitle            = $currentEntry.RuleTitle
                }

                continue
            }

            $addedGroups += [ordered]@{
                GroupId      = $currentEntry.GroupId
                RuleVersion  = $currentEntry.RuleVersion
                RuleId       = $currentEntry.RuleId
                RuleTitle    = $currentEntry.RuleTitle
                Severity     = $currentEntry.Severity
            }
        }

        foreach ($previousEntry in $PreviousEntries) {
            if ($matchedPreviousGroupIds.ContainsKey($previousEntry.GroupId)) {
                continue
            }

            if ($currentByRuleVersion.ContainsKey($previousEntry.RuleVersion)) {
                continue
            }

            if ($currentByGroupId.ContainsKey($previousEntry.GroupId)) {
                continue
            }

            $removedGroups += [ordered]@{
                GroupId      = $previousEntry.GroupId
                RuleVersion  = $previousEntry.RuleVersion
                RuleId       = $previousEntry.RuleId
                RuleTitle    = $previousEntry.RuleTitle
                Severity     = $previousEntry.Severity
            }
        }

        return [ordered]@{
            ChangedGroupIds     = $changedGroupIds
            ChangedRuleVersions = $changedRuleVersions
            ChangedRuleIds      = $changedRuleIds
            AddedGroups         = $addedGroups
            RemovedGroups       = $removedGroups
        }
    }

    function Compare-PackageBenchmarks {
        param(
            [Parameter(Mandatory = $true)]
            [object[]]$CurrentBenchmarks,

            [Parameter(Mandatory = $true)]
            [object[]]$PreviousBenchmarks
        )

        $currentBenchmarkCount = @($CurrentBenchmarks).Count
        $previousByMatchKey = @{}
        foreach ($previousBenchmark in $PreviousBenchmarks) {
            if (-not $previousByMatchKey.ContainsKey($previousBenchmark.MatchKey)) {
                $previousByMatchKey[$previousBenchmark.MatchKey] = $previousBenchmark
            }
        }

        $combinedChangedGroupIds = @()
        $combinedChangedRuleVersions = @()
        $combinedChangedRuleIds = @()
        $combinedAddedGroups = @()
        $combinedRemovedGroups = @()

        foreach ($currentBenchmark in $CurrentBenchmarks) {
            if (-not $previousByMatchKey.ContainsKey($currentBenchmark.MatchKey)) {
                throw "Unable to match benchmark '$($currentBenchmark.MatchKey)' between current and previous packages."
            }

            $comparison = Compare-BenchmarkEntries -CurrentEntries $currentBenchmark.Entries -PreviousEntries $previousByMatchKey[$currentBenchmark.MatchKey].Entries
            $benchmarkLabel = $currentBenchmark.BenchmarkTitle

            foreach ($item in $comparison.ChangedGroupIds) {
                if ($currentBenchmarkCount -gt 1) {
                    $item['BenchmarkTitle'] = $benchmarkLabel
                }
                $combinedChangedGroupIds += $item
            }

            foreach ($item in $comparison.ChangedRuleVersions) {
                if ($currentBenchmarkCount -gt 1) {
                    $item['BenchmarkTitle'] = $benchmarkLabel
                }
                $combinedChangedRuleVersions += $item
            }

            foreach ($item in $comparison.ChangedRuleIds) {
                if ($currentBenchmarkCount -gt 1) {
                    $item['BenchmarkTitle'] = $benchmarkLabel
                }
                $combinedChangedRuleIds += $item
            }

            foreach ($item in $comparison.AddedGroups) {
                if ($currentBenchmarkCount -gt 1) {
                    $item['BenchmarkTitle'] = $benchmarkLabel
                }
                $combinedAddedGroups += $item
            }

            foreach ($item in $comparison.RemovedGroups) {
                if ($currentBenchmarkCount -gt 1) {
                    $item['BenchmarkTitle'] = $benchmarkLabel
                }
                $combinedRemovedGroups += $item
            }
        }

        return [ordered]@{
            ChangedGroupIds     = $combinedChangedGroupIds
            ChangedRuleVersions = $combinedChangedRuleVersions
            ChangedRuleIds      = $combinedChangedRuleIds
            AddedGroups         = $combinedAddedGroups
            RemovedGroups       = $combinedRemovedGroups
        }
    }

    function Write-ChangeSection {
        param(
            [Parameter(Mandatory = $true)]
            [string]$Header,

            [Parameter()]
            [AllowEmptyCollection()]
            [object[]]$Items,

            [Parameter(Mandatory = $true)]
            [string[]]$Properties
        )

        if ($Items.Count -eq 0) {
            return
        }

        Write-Host "  $Header" -ForegroundColor Yellow
        foreach ($item in $Items) {
            $parts = @()
            foreach ($propertyName in $Properties) {
                if ($item.Contains($propertyName)) {
                    $parts += "$propertyName=$($item[$propertyName])"
                }
            }
            Write-Host "    - $($parts -join '; ')" -ForegroundColor Gray
        }
    }
}

process {
    if (-not (Test-Path -LiteralPath $StigContentLibraryPath)) {
        throw "STIG content path not found: $StigContentLibraryPath"
    }

    if (-not (Test-Path -LiteralPath $StigInfoPath)) {
        throw "stig-info.json path not found: $StigInfoPath"
    }

    $resolvedPaths = Resolve-StigContentPaths -Path $StigContentLibraryPath
    $currentPath = $resolvedPaths.CurrentPath
    $archivePath = $resolvedPaths.ArchivePath
    $script:CurrentBenchmarkPath = $currentPath
    $script:ArchiveBenchmarkPath = $archivePath

    if (-not (Test-Path -LiteralPath $currentPath)) {
        throw "Current folder not found under STIG content path: $currentPath"
    }

    if (-not (Test-Path -LiteralPath $archivePath)) {
        throw "Archive folder not found under STIG content path: $archivePath"
    }

    $stigInfo = Get-Content -LiteralPath $StigInfoPath | ConvertFrom-Json
    $benchmarks = @($stigInfo.StigBenchmarks)

    if ($StigId) {
        $benchmarks = @($benchmarks | Where-Object { $_.StigId -in $StigId })
    }

    if ($ScanType -ne 'All') {
        $benchmarks = @($benchmarks | Where-Object { $_.ScanType -eq $ScanType })
    }

    $packageFiles = @(
        Get-ChildItem -Path $currentPath -Filter '*.zip' -File
        Get-ChildItem -Path $archivePath -Filter '*.zip' -File -Recurse
    )

    $results = @()

    foreach ($benchmark in $benchmarks) {
        Write-Host "Processing $($benchmark.StigId) ($($benchmark.CurrentVersion))" -ForegroundColor Cyan

        $candidates = @(Get-BenchmarkPackageCandidates -Benchmark $benchmark -PackageFiles $packageFiles)
        if ($candidates.Count -eq 0) {
            $results += [ordered]@{
                StigId         = $benchmark.StigId
                StigDisplayName = $benchmark.StigDisplayName
                ScanType       = $benchmark.ScanType
                CurrentVersion = $benchmark.CurrentVersion
                PreviousVersion = $null
                Status         = 'No matching benchmark packages found in Current or Archive.'
            }
            Write-Warning "No benchmark packages found for $($benchmark.StigId)."
            continue
        }

        $currentCandidates = @($candidates | Where-Object { $_.Version -eq $benchmark.CurrentVersion })
        if ($currentCandidates.Count -eq 0) {
            $latestDetected = $candidates |
                Sort-Object `
                    @{ Expression = { $_.VersionSortKey }; Descending = $true }, `
                    @{ Expression = { $_.ScapSortKey }; Descending = $true }, `
                    @{ Expression = { $_.EnhancedSortKey }; Descending = $true } |
                Select-Object -First 1

            $results += [ordered]@{
                StigId           = $benchmark.StigId
                StigDisplayName  = $benchmark.StigDisplayName
                ScanType         = $benchmark.ScanType
                CurrentVersion   = $benchmark.CurrentVersion
                PreviousVersion  = $null
                Status           = "Current version package not found. Highest detected version is $($latestDetected.Version)."
                DetectedPackages = @($candidates | ForEach-Object { $_.FileName })
            }
            Write-Warning "Current package not found for $($benchmark.StigId)."
            continue
        }

        $currentPackage = Select-BestPackage -Candidates $currentCandidates
        $previousCandidates = @($candidates | Where-Object { $_.VersionSortKey -lt $currentPackage.VersionSortKey })

        if ($previousCandidates.Count -eq 0) {
            $currentBenchmarks = @(Get-PackageBenchmarkData -PackagePath $currentPackage.FullName)
            $currentBenchmarkMetadata = @(
                $currentBenchmarks |
                    ForEach-Object {
                        [ordered]@{
                            BenchmarkTitle = $_.BenchmarkTitle
                            BenchmarkId    = $_.BenchmarkId
                            FileName       = $_.FileName
                            Status         = $_.Status
                            StatusDate     = $_.StatusDate
                            BenchmarkDate  = $_.BenchmarkDate
                            Reference      = $_.Reference
                            ReferenceHref  = $_.ReferenceHref
                        }
                    }
            )
            $result = [ordered]@{
                StigId            = $benchmark.StigId
                StigDisplayName   = $benchmark.StigDisplayName
                ScanType          = $benchmark.ScanType
                CurrentVersion    = $currentPackage.Version
                CurrentPackage    = $currentPackage.FileName
                CurrentBenchmarks = $currentBenchmarkMetadata
                PreviousVersion   = $null
                PreviousPackage   = $null
                Status            = 'No previous benchmark version found in Archive.'
            }
            $results += $result
            Save-RevisionHistoryReport -Result $result -CurrentPackagePath $currentPackage.FullName
            Write-Warning "No previous package found for $($benchmark.StigId)."
            continue
        }

        $previousCandidates = @(
            $previousCandidates |
                Sort-Object `
                    @{ Expression = { $_.VersionSortKey }; Descending = $true }, `
                    @{ Expression = { $_.ScapSortKey }; Descending = $true }, `
                    @{ Expression = { $_.EnhancedSortKey }; Descending = $true }, `
                    @{ Expression = { $_.Signed }; Descending = $true }
        )

        $highestPreviousVersionKey = $previousCandidates[0].VersionSortKey
        $previousVersionCandidates = @($previousCandidates | Where-Object { $_.VersionSortKey -eq $highestPreviousVersionKey })
        $previousPackage = Select-BestPackage -Candidates $previousVersionCandidates

        $currentBenchmarks = @(Get-PackageBenchmarkData -PackagePath $currentPackage.FullName)
        $previousBenchmarks = @(Get-PackageBenchmarkData -PackagePath $previousPackage.FullName)
        $comparison = Compare-PackageBenchmarks -CurrentBenchmarks $currentBenchmarks -PreviousBenchmarks $previousBenchmarks
        $currentBenchmarkMetadata = @(
            $currentBenchmarks |
                ForEach-Object {
                    [ordered]@{
                        BenchmarkTitle = $_.BenchmarkTitle
                        BenchmarkId    = $_.BenchmarkId
                        FileName       = $_.FileName
                        Status         = $_.Status
                        StatusDate     = $_.StatusDate
                        BenchmarkDate  = $_.BenchmarkDate
                        Reference      = $_.Reference
                        ReferenceHref  = $_.ReferenceHref
                    }
                }
        )
        $previousBenchmarkMetadata = @(
            $previousBenchmarks |
                ForEach-Object {
                    [ordered]@{
                        BenchmarkTitle = $_.BenchmarkTitle
                        BenchmarkId    = $_.BenchmarkId
                        FileName       = $_.FileName
                        Status         = $_.Status
                        StatusDate     = $_.StatusDate
                        BenchmarkDate  = $_.BenchmarkDate
                        Reference      = $_.Reference
                        ReferenceHref  = $_.ReferenceHref
                    }
                }
        )
        $childBenchmarks = @(
            $currentBenchmarks |
                ForEach-Object {
                    [ordered]@{
                        BenchmarkTitle = $_.BenchmarkTitle
                        BenchmarkId    = $_.BenchmarkId
                        FileName       = $_.FileName
                        Status         = $_.Status
                        StatusDate     = $_.StatusDate
                        BenchmarkDate  = $_.BenchmarkDate
                        Reference      = $_.Reference
                        ReferenceHref  = $_.ReferenceHref
                    }
                }
        )

        $result = [ordered]@{
            StigId               = $benchmark.StigId
            StigDisplayName      = $benchmark.StigDisplayName
            ScanType             = $benchmark.ScanType
            CurrentVersion       = $currentPackage.Version
            CurrentPackage       = $currentPackage.FileName
            CurrentBenchmarks    = $currentBenchmarkMetadata
            PreviousVersion      = $previousPackage.Version
            PreviousPackage      = $previousPackage.FileName
            PreviousBenchmarks   = $previousBenchmarkMetadata
            Status               = 'Compared successfully.'
            ChangedGroupIds      = $comparison.ChangedGroupIds
            ChangedRuleVersions  = $comparison.ChangedRuleVersions
            ChangedRuleIds       = $comparison.ChangedRuleIds
            AddedGroups          = $comparison.AddedGroups
            RemovedGroups        = $comparison.RemovedGroups
        }

        if ($childBenchmarks.Count -gt 1) {
            $result['ChildBenchmarks'] = $childBenchmarks
        }

        $results += $result
        Save-RevisionHistoryReport -Result $result -CurrentPackagePath $currentPackage.FullName

        Write-Host "  Current package : $($currentPackage.FileName)" -ForegroundColor DarkCyan
        Write-Host "  Previous package: $($previousPackage.FileName)" -ForegroundColor DarkCyan

        if (
            $comparison.ChangedGroupIds.Count -eq 0 -and
            $comparison.ChangedRuleVersions.Count -eq 0 -and
            $comparison.ChangedRuleIds.Count -eq 0 -and
            $comparison.AddedGroups.Count -eq 0 -and
            $comparison.RemovedGroups.Count -eq 0
        ) {
            Write-Host '  No rule-level changes detected.' -ForegroundColor Green
            continue
        }

        Write-ChangeSection -Header 'Changed group IDs' -Items $comparison.ChangedGroupIds -Properties @('BenchmarkTitle', 'RuleVersion', 'PreviousGroupId', 'CurrentGroupId', 'PreviousRuleId', 'CurrentRuleId')
        Write-ChangeSection -Header 'Changed rule versions' -Items $comparison.ChangedRuleVersions -Properties @('BenchmarkTitle', 'GroupId', 'PreviousRuleVersion', 'CurrentRuleVersion', 'PreviousRuleId', 'CurrentRuleId')
        Write-ChangeSection -Header 'Changed rule IDs' -Items $comparison.ChangedRuleIds -Properties @('BenchmarkTitle', 'GroupId', 'RuleVersion', 'PreviousRuleId', 'CurrentRuleId')
        Write-ChangeSection -Header 'Added groups' -Items $comparison.AddedGroups -Properties @('BenchmarkTitle', 'GroupId', 'RuleVersion', 'RuleId', 'Severity')
        Write-ChangeSection -Header 'Removed groups' -Items $comparison.RemovedGroups -Properties @('BenchmarkTitle', 'GroupId', 'RuleVersion', 'RuleId', 'Severity')
    }

    if ($OutputPath) {
        $results | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $OutputPath -Encoding utf8
        Write-Host "Saved aggregate comparison report to $OutputPath" -ForegroundColor Green
    }

    if ($PassThru) {
        return $results
    }
}
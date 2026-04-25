# STIG-RevisionHistory

## Objective
- Store current STIG/SRG benchmark files from cyber.mil.
- Store previous versions in archive.
- Produce a revision history file for each benchmark file using diff between current and previous version.

## STIG Content Library Structure
- Current
  - U_Container_Platform_V2R4_SRG.zip
  - U_Container_Platform_V2R4_SRG-RevisionHistory.json
  - U_MS_Edge_V2R4_STIG.zip
  - U_MS_Edge_V2R4_STIG-RevisionHistory.json
  - U_MS_Windows_11_V2R6_STIG.zip
  - U_MS_Windows_11_V2R6_STIG-RevisionHistory.json
  - ...
- Archive
  - U_Container_Platform_V2R3_SRG.zip
  - U_Container_Platform_V2R3_SRG-RevisionHistory.json
  - U_MS_Edge_V2R3_STIG.zip
  - U_MS_Edge_V2R3_STIG-RevisionHistory.json
  - U_MS_Windows_11_V2R4_STIG.zip
  - U_MS_Windows_11_V2R4_STIG-RevisionHistory.json
  - ...

> The current Windows 11 STIG is V2R6 and the archive version is V2R4, meaning V2R5 is missing.
> This is not a major concern because we just want to see the differences between the current and previous version.
> Ideally, we'll have each version, but missing a version is not a problem.

## Reference
- [DoD Cyber Exchange Document Library](https://www.cyber.mil/stigs/downloads) to download current STIG/SRG benchmark files.
- [NIWC Atlantic SCAP Team GitHub repo](https://github.com/niwc-atlantic/scap-content-library)

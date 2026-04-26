# STIG-RevisionHistory

- View the latest [Combined Revision History](./Current/CombinedRevisionHistory.md) report.

## Summary of repo purpose
- Store current STIG/SRG benchmark files from cyber.mil in `\Current` directory.
- Store previous versions in `\Archive` directory.
- Produce a revision history file for each benchmark file using diff between current and previous version.
- Produce a combined revision history file that combines all individual revision history files into one document.

## STIG Content Library Structure
- `Current` directory contains the latest benchmark files downloaded from cyber.mil.
  - It also contains the generated revision history files for each benchmark file, which are created by comparing the current version with the previous version in the archive.
- `Archive` directory contains previous versions of the benchmark files.
  - It also contains the generated revision history files for each benchmark file, which compare the specified version with the previous version.

## Reference
- [DoD Cyber Exchange Document Library](https://www.cyber.mil/stigs/downloads) to download current STIG/SRG benchmark files.
- [NIWC Atlantic SCAP Team GitHub repo](https://github.com/niwc-atlantic/scap-content-library)

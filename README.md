# STIG-RevisionHistory

- View the latest [Combined Revision History](./Current/CombinedRevisionHistory.md) report.

## Summary of repo purpose
- Provide a structured way to track revisions of STIG/SRG benchmark files over time.
  - So that users can easily identify the latest version of each STIG/SRG
    and the rules that have been added, removed, or modified in each revision.
- This is accomplished by:
  - Storing current STIG/SRG benchmark files from cyber.mil in `Current` directory.
  - Storing previous versions in `Archive` directory.
  - Producing a revision history file for each benchmark file using diff between current and previous version in JSON format.
  - Producing a combined revision history file that merges all individual revision history information into one document, in both JSON and Markdown formats.

## STIG Content Library Structure
- `Current` directory contains the latest benchmark files downloaded from cyber.mil.
  - It also contains the generated revision history files for each benchmark file, which are created by comparing the current version with the previous version in the archive.
- `Archive` directory contains previous versions of the benchmark files.
  - It also contains the generated revision history files for each benchmark file, which compare the specified version with the previous version.

## Reference
- [DoD Cyber Exchange Document Library](https://www.cyber.mil/stigs/downloads) to download current STIG/SRG benchmark files.
- [NIWC Atlantic SCAP Team GitHub repo](https://github.com/niwc-atlantic/scap-content-library)

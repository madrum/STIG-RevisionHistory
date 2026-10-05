<a id="top"></a>

# Combined Revision History

Generated: 2026-10-05 18:15:00+00:00

## Summary

| StigDisplayName | CurrentVersion | PreviousVersion | ChangedCount | AddedCount | RemovedCount | Status |
| --- | --- | --- | --- | --- | --- | --- |
| [ASD STIG](#asd_stig) | V6R4<br />2025-09-09 | V6R3<br />2025-02-12 | 19 | 0 | 0 | Compared successfully. |
| [Cloud Computing SRG](#cloud_computing_srg) | Y26M06<br />2024-12-20, 2025-08-13 | Y25M12<br />2024-12-20, 2025-08-13 | 0 | 0 | 0 | Compared successfully. |
| [Container Platform SRG](#container_platform_srg) | V2R4<br />2025-09-10 | V2R3<br />2025-05-15 | 13 | 1 | 0 | Compared successfully. |
| [IDPS SRG](#idps_srg) | V3R4<br />2025-09-22 | V3R3<br />2025-05-19 | 17 | 2 | 0 | Compared successfully. |
| [MS Azure SQL DB STIG](#ms_azure_sql_db_stig) | V2R4<br />2026-08-25 <sup>✨</sup> | V2R3<br />2025-06-11 | 11 | 0 | 0 | Compared successfully. |
| [MS Defender Antivirus STIG](#ms_defender_antivirus) | V2R10<br />2026-09-02 <sup>✨</sup> | V2R9<br />2026-05-08 | 12 | 0 | 0 | Compared successfully. |
| [MS DotNet Framework 4-0 STIG](#ms_dot_net_framework) | V2R9<br />2026-05-13 | V2R8<br />2026-02-12 | 0 | 1 | 0 | Compared successfully. |
| [MS Edge STIG](#ms_edge_stig) | V2R5<br />2026-02-25 | V2R4<br />2025-12-11 | 0 | 1 | 0 | Compared successfully. |
| [MS Entra ID STIG](#ms_entra_id_stig) | V1R2<br />2026-09-03 <sup>✨</sup> | V1R1<br />2025-03-17 | 3 | 0 | 0 | Compared successfully. |
| [MS IE11 STIG](#ie_11_stig) | V2R7<br />2026-02-24 | V2R6<br />2025-11-25 | 1 | 0 | 0 | Compared successfully. |
| [MS Intune MDM Service Desktop Mobile STIG](#ms_intune_mdm_service_desktop_mobile_stig) | Y26M07<br />2026-05-27 | Y25M04<br />2025-05-08 | 2 | 1 | 0 | Compared successfully. |
| [Microsoft Windows 11 STIG](#microsoft_windows_11_stig) | V2R9<br />2026-08-06 <sup>✨</sup> | V2R8<br />2026-05-19 | 13 | 1 | 0 | Compared successfully. |
| [Network Infrastructure Policy STIG](#network_infrastructure_policy_stig) | V10R7<br />2024-08-02 |  | 0 | 0 | 0 | No previous benchmark version found in Archive. |
| [Windows Firewall with Advanced Security STIG](#windows_firewall_with_advanced_security) | V2R2<br />2023-08-23 |  | 0 | 0 | 0 | No previous benchmark version found in Archive. |

Legend: ✨ Current version updated within the last 3 months.

---

<a id="asd_stig"></a>

## ASD STIG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | V6R4 |
| Current Version Date | 2025-09-09 |
| Current Version Published | 2025-10-01 |
| Previous Version | V6R3 |
| Previous Version Date | 2025-02-12 |
| Previous Version Published | 2025-04-02 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;222393 | The application must associate organization-defined types of security attributes having organization-defined security attribute values with information in storage. |
| V&#8209;222394 | The application must associate organization-defined types of security attributes having organization-defined security attribute values with information in process. |
| V&#8209;222395 | The application must associate organization-defined types of security attributes having organization-defined security attribute values with information in transmission. |
| V&#8209;222425 | The application must enforce approved authorizations for logical access to information and system resources in accordance with applicable access control policies. |
| V&#8209;222427 | The application must enforce approved authorizations for controlling the flow of information within the system based on organization-defined information flow control policies. |
| V&#8209;222428 | The application must enforce approved authorizations for controlling the flow of information between interconnected systems based on organization-defined information flow control policies. |
| V&#8209;222570 | The application must utilize FIPS-validated cryptographic modules when signing application components. |
| V&#8209;222571 | The application must utilize FIPS-validated cryptographic modules when generating cryptographic hashes. |
| V&#8209;222572 | The application must utilize FIPS-validated cryptographic modules when protecting unclassified information that requires cryptographic protection. |
| V&#8209;222573 | Applications making SAML assertions must use FIPS-approved random numbers in the generation of SessionIndex in the SAML element AuthnStatement. |
| V&#8209;222574 | The application user interface must be either physically or logically separated from data storage and management interfaces. |
| V&#8209;222587 | The application must protect the confidentiality and integrity of stored information when required by DOD policy or the information owner. |
| V&#8209;222591 | The application must maintain a separate execution domain for each executing process. |
| V&#8209;222592 | Applications must prevent unauthorized and unintended information transfer via shared system resources. |
| V&#8209;222597 | The application must implement cryptographic mechanisms to prevent unauthorized disclosure of information and/or detect changes to information during transmission unless otherwise protected by alternative physical safeguards, such as, at a minimum, a Protected Distribution System (PDS). |
| V&#8209;222614 | Security-relevant software updates and patches must be kept up to date. |
| V&#8209;222621 | The ISSO must ensure application audit trails are retained for at least 30 months (12 months active + 18 months cold storage) for applications without SAMI data and five years for applications including SAMI data. |
| V&#8209;222643 | The application must have the capability to mark sensitive/classified output when required. |
| V&#8209;265634 | The application must implement NSA-approved cryptography to protect classified information in accordance with applicable federal laws, Executive Orders, directives, policies, regulations, and standards. |

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

---

<a id="cloud_computing_srg"></a>

## Cloud Computing SRG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | Y26M06 |
| Current Version Date | 2024-12-20, 2025-08-13 |
| Current Version Published | 2025-01-30, 2025-08-13 |
| Previous Version | Y25M12 |
| Previous Version Date | 2024-12-20, 2025-08-13 |
| Previous Version Published | 2025-01-30, 2025-08-13 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

None

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

---

<a id="container_platform_srg"></a>

## Container Platform SRG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | V2R4 |
| Current Version Date | 2025-09-10 |
| Current Version Published | 2025-10-28 |
| Previous Version | V2R3 |
| Previous Version Date | 2025-05-15 |
| Previous Version Published | 2025-07-02 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;233026 | Least privilege access and need-to-know must be required to access the container platform registry. |
| V&#8209;233027 | Least privilege access and need-to-know must be required to access the container platform runtime. |
| V&#8209;233028 | Least privilege access and need-to-know must be required to access the container platform keystore. |
| V&#8209;233029 | The container platform must enforce approved authorizations for controlling the flow of information within the container platform based on organization-defined information flow control policies. |
| V&#8209;233030 | The container platform must enforce approved authorizations for controlling the flow of information between interconnected systems and services based on organization-defined information flow control policies. |
| V&#8209;233114 | The container platform must separate user functionality (including user interface services) from information system management functionality. |
| V&#8209;233127 | The container platform must prohibit containers from accessing privileged resources. |
| V&#8209;233128 | The container platform must prevent unauthorized and unintended information transfer via shared system resources. |
| V&#8209;233221 | The container platform runtime must maintain separate execution domains for each container by assigning each container a separate address space. |
| V&#8209;233233 | The container platform registry must contain the latest images with most recent security-relevant software updates within 30 days unless the time period is directed by an authoritative source (e.g., IAVM, CTOs, DTMs, STIGs). |
| V&#8209;233234 | The container platform runtime must have security-relevant software updates installed within 30 days unless the time period is directed by an authoritative source (e.g., IAVM, CTOs, DTMs, and STIGs). |
| V&#8209;233271 | The container platform must use a valid FIPS 140-2 or FIPS 140-3 approved cryptographic module to generate hashes. |
| V&#8209;233289 | The container platform must use a FIPS-validated cryptographic module to implement encryption services for unclassified information requiring confidentiality. |

### Added Groups

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;278968 | The container platform must be a version supported by the vendor. |

### Removed Groups

None

[Back to top](#top)

---

<a id="idps_srg"></a>

## IDPS SRG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | V3R4 |
| Current Version Date | 2025-09-22 |
| Current Version Published | 2025-10-28 |
| Previous Version | V3R3 |
| Previous Version Date | 2025-05-19 |
| Previous Version Published | 2025-07-02 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;206864 | The IPS must enforce approved authorizations by restricting or blocking the flow of harmful or suspicious communications traffic within the network. |
| V&#8209;206865 | The IPS must restrict or block harmful or suspicious communications traffic between interconnected networks based on attribute- and content-based inspection of the source, destination, headers, and/or content of the communications traffic. |
| V&#8209;206866 | The IDPS must immediately use updates made to policy filters, rules, signatures, and anomaly analysis algorithms for traffic detection and prevention functions. |
| V&#8209;206881 | The IPS must block outbound traffic containing known and unknown denial-of-service (DoS) attacks by ensuring that security policies, signatures, rules, and anomaly detection techniques are applied to outbound communications traffic. |
| V&#8209;206883 | The IPS must block any prohibited mobile code at the enclave boundary when it is detected. |
| V&#8209;206889 | The IPS must block malicious code. |
| V&#8209;206890 | The IPS must quarantine or block malicious code. |
| V&#8209;206893 | The IPS must block outbound Internet Control Message Protocol (ICMP) Destination Unreachable, Redirect, and Address Mask reply messages. |
| V&#8209;206894 | The IPS must block malicious Internet Control Message Protocol (ICMP) packets by properly configuring ICMP signatures and rules. |
| V&#8209;206895 | To protect against unauthorized data mining, the IPS must prevent code injection attacks launched against data storage objects, including, at a minimum, databases, database records, queries, and fields. |
| V&#8209;206896 | To protect against unauthorized data mining, the IPS must prevent code injection attacks launched against application objects including, at a minimum, application URLs and application code. |
| V&#8209;206897 | To protect against unauthorized data mining, the IPS must prevent SQL injection attacks launched against data storage objects, including, at a minimum, databases, database records, and database fields. |
| V&#8209;206905 | The IPS must protect against or limit the effects of known and unknown types of denial-of-service (DoS) attacks by employing rate-based attack prevention behavior analysis. |
| V&#8209;206906 | The IPS must protect against or limit the effects of known and unknown types of denial-of-service (DoS) attacks by employing anomaly-based attack detection. |
| V&#8209;206907 | The IPS must protect against or limit the effects of known types of denial-of-service (DoS) attacks by employing signatures. |
| V&#8209;206915 | The IDPS must send an alert to, at a minimum, the information system security manager (ISSM) and information system security officer (ISSO) when intrusion detection events are detected which indicate a compromise or potential for compromise. |
| V&#8209;263664 | The IDPS must implement physically or logically separate subnetworks to isolate organization-defined critical system components and functions. |

### Added Groups

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;278978 | The IDPS must use organization-defined security attributes associated with organization-defined information, source, and destination objects to enforce organization-defined information flow control policies as a basis for flow control decisions. |
| V&#8209;278979 | The IDPS must provide visibility into network traffic at external and key internal system interfaces to optimize the effectiveness of monitoring devices. |

### Removed Groups

None

[Back to top](#top)

---

<a id="ms_azure_sql_db_stig"></a>

## MS Azure SQL DB STIG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | V2R4 |
| Current Version Date | 2026-08-25 |
| Current Version Published | 2026-09-30 |
| Previous Version | V2R3 |
| Previous Version Date | 2025-06-11 |
| Previous Version Published | 2025-07-02 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;255302 | Azure SQL Database must enforce approved authorizations for logical access to server information and system resources in accordance with applicable access control policies. |
| V&#8209;255303 | Azure SQL Database must enforce approved authorizations for logical access to database information and system resources in accordance with applicable access control policies. |
| V&#8209;255309 | Azure SQL Database contents must be protected from unauthorized and unintended information transfer by enforcement of a data-transfer policy. |
| V&#8209;255313 | Azure SQL Database must associate organization-defined types of security labels having organization-defined security label values with information in storage. |
| V&#8209;255314 | Azure SQL Database must associate organization-defined types of security labels having organization-defined security label values with information in process. |
| V&#8209;255315 | Azure SQL Database must associate organization-defined types of security labels having organization-defined security label values with information in transmission. |
| V&#8209;255320 | Azure SQL Database must use NSA-approved cryptography to protect classified information in accordance with the data owners requirements. |
| V&#8209;255324 | The Azure SQL Database must be configured to generate audit records for DoW-defined auditable events within all DBMS/database components. |
| V&#8209;255336 | Azure SQL Database must map the PKI-authenticated identity to an associated user account. |
| V&#8209;255338 | Azure SQL Database must separate user functionality (including user interface services) from database management functionality. |
| V&#8209;255343 | Azure SQL Database must be able to allocate audit record storage capacity in accordance with organization-defined audit record storage requirements. |

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

---

<a id="ms_defender_antivirus"></a>

## MS Defender Antivirus STIG

| Field | Value |
| --- | --- |
| Scan Type | SemiAutomated |
| Current Version | V2R10 |
| Current Version Date | 2026-09-02 |
| Current Version Published | 2026-09-30 |
| Previous Version | V2R9 |
| Previous Version Date | 2026-05-08 |
| Previous Version Published | 2026-07-01 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;213426 | Microsoft Defender AV must be configured to block the Potentially Unwanted Application (PUA) feature. |
| V&#8209;213442 | Microsoft Defender AV must monitor for incoming and outgoing files. |
| V&#8209;213443 | Microsoft Defender AV must be configured to monitor for file and program activity. |
| V&#8209;213444 | Microsoft Defender AV must be configured to scan all downloaded files and attachments. |
| V&#8209;213445 | Microsoft Defender AV must be configured to always enable real-time protection. |
| V&#8209;213446 | Microsoft Defender AV must be configured to enable behavior monitoring. |
| V&#8209;213448 | Microsoft Defender AV must be configured to scan archive files. |
| V&#8209;213449 | Microsoft Defender AV must be configured to scan removable drives. |
| V&#8209;213450 | Microsoft Defender AV must be configured to perform a weekly scheduled scan. |
| V&#8209;213451 | Microsoft Defender AV must be configured to turn on email scanning. |
| V&#8209;213455 | Microsoft Defender AV must be configured for automatic remediation action to be taken for threat alert level Severe. |
| V&#8209;213463 | Microsoft Defender AV must be configured to prevent user and apps from accessing dangerous websites. |

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

---

<a id="ms_dot_net_framework"></a>

## MS DotNet Framework 4-0 STIG

| Field | Value |
| --- | --- |
| Scan Type | SemiAutomated |
| Current Version | V2R9 |
| Current Version Date | 2026-05-13 |
| Current Version Published | 2026-07-01 |
| Previous Version | V2R8 |
| Previous Version Date | 2026-02-12 |
| Previous Version Published | 2026-04-01 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

None

### Added Groups

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;284958 | The version of .NET running on the system must be a supported version. |

### Removed Groups

None

[Back to top](#top)

---

<a id="ms_edge_stig"></a>

## MS Edge STIG

| Field | Value |
| --- | --- |
| Scan Type | SemiAutomated |
| Current Version | V2R5 |
| Current Version Date | 2026-02-25 |
| Current Version Published | 2026-04-01 |
| Previous Version | V2R4 |
| Previous Version Date | 2025-12-11 |
| Previous Version Published | 2026-01-05 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

None

### Added Groups

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;283439 | Spell checking provided by Microsoft Editor must be disabled. |

### Removed Groups

None

[Back to top](#top)

---

<a id="ms_entra_id_stig"></a>

## MS Entra ID STIG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | V1R2 |
| Current Version Date | 2026-09-03 |
| Current Version Published | 2026-09-30 |
| Previous Version | V1R1 |
| Previous Version Date | 2025-03-17 |
| Previous Version Published | 2025-02-28 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;270204 | Microsoft Entra ID must automatically disable accounts after a 35-day period of account inactivity. |
| V&#8209;270209 | Microsoft Entra ID must display the Standard Mandatory DoW Notice and Consent Banner before granting access to the application. |
| V&#8209;270239 | Microsoft Entra ID must enforce a 180-day maximum password lifetime restriction. |

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

---

<a id="ie_11_stig"></a>

## MS IE11 STIG

| Field | Value |
| --- | --- |
| Scan Type | SemiAutomated |
| Current Version | V2R7 |
| Current Version Date | 2026-02-24 |
| Current Version Published | 2026-04-01 |
| Previous Version | V2R6 |
| Previous Version Date | 2025-11-25 |
| Previous Version Published | 2026-01-05 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;252910 | The version of Internet Explorer running on the system must be a supported version. |

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

---

<a id="ms_intune_mdm_service_desktop_mobile_stig"></a>

## MS Intune MDM Service Desktop Mobile STIG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | Y26M07 |
| Current Version Date | 2026-05-27 |
| Current Version Published | 2026-07-01 |
| Previous Version | Y25M04 |
| Previous Version Date | 2025-05-08 |
| Previous Version Published | 2025-04-22 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;273867 | Microsoft Intune service must initiate a session lock after a 15-minute period of inactivity. |
| V&#8209;273868 | Microsoft Intune service must be configured to transfer Intune logs to another server for storage, analysis, and reporting at least every seven days. |

### Added Groups

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;285327 | The Intune service must be configured to implement Multi-Admin Approval (MAA) for wiping managed devices. |

### Removed Groups

None

[Back to top](#top)

---

<a id="microsoft_windows_11_stig"></a>

## Microsoft Windows 11 STIG

| Field | Value |
| --- | --- |
| Scan Type | SemiAutomated |
| Current Version | V2R9 |
| Current Version Date | 2026-08-06 |
| Current Version Published | 2026-08-10 |
| Previous Version | V2R8 |
| Previous Version Date | 2026-05-19 |
| Previous Version Published | 2026-07-01 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;253296 | The Windows 11 time service must synchronize with an appropriate DoW time source. |
| V&#8209;253300 | The password history must be configured to 24 passwords remembered. |
| V&#8209;253389 | Enhanced anti-spoofing for facial recognition must be enabled on Windows 11. |
| V&#8209;253393 | Windows Telemetry must not be configured to Full. |
| V&#8209;253394 | Windows Update must not obtain updates from other PCs on the internet. |
| V&#8209;253399 | Windows 11 must be configured to disable Windows Game Recording and Broadcasting. |
| V&#8209;253422 | Windows 11 must be configured to prevent Windows apps from being activated by voice while the system is locked. |
| V&#8209;253427 | The DoW Root CA certificates must be installed in the Trusted Root Store. |
| V&#8209;253428 | The External Root CA certificates must be installed in the Trusted Root Store on unclassified systems. |
| V&#8209;253429 | The DoW Interoperability Root CA cross-certificates must be installed in the Untrusted Certificates Store on unclassified systems. |
| V&#8209;253430 | The US DoW CCEB Interoperability Root CA cross-certificates must be installed in the Untrusted Certificates Store on unclassified systems. |
| V&#8209;253470 | Windows 11 must use multifactor authentication for local and network access to privileged and nonprivileged accounts. |
| V&#8209;279688 | Windows 11 systems must block consumer account user authentication. |

### Added Groups

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;288475 | All Wi-Fi Direct adapters must be disabled on the system. |

### Removed Groups

None

[Back to top](#top)

---

<a id="network_infrastructure_policy_stig"></a>

## Network Infrastructure Policy STIG

| Field | Value |
| --- | --- |
| Scan Type | Manual |
| Current Version | V10R7 |
| Current Version Date | 2024-08-02 |
| Current Version Published | 2024-10-24 |
| Previous Version | None |
| Previous Version Date | None |
| Previous Version Published | None |
| Status | No previous benchmark version found in Archive. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

None

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

---

<a id="windows_firewall_with_advanced_security"></a>

## Windows Firewall with Advanced Security STIG

| Field | Value |
| --- | --- |
| Scan Type | SemiAutomated |
| Current Version | V2R2 |
| Current Version Date | 2023-08-23 |
| Current Version Published | 2023-11-09 |
| Previous Version | None |
| Previous Version Date | None |
| Previous Version Published | None |
| Status | No previous benchmark version found in Archive. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

None

### Added Groups

None

### Removed Groups

None

[Back to top](#top)

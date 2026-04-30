<a id="top"></a>

# Combined Revision History

Generated: 2026-04-30 09:33:33-04:00

## Summary

| StigDisplayName | CurrentVersion | PreviousVersion | ChangedCount | AddedCount | RemovedCount | Status |
| --- | --- | --- | --- | --- | --- | --- |
| [ASD STIG](#asd_stig) | V6R4<br />2025-09-09 | V6R3<br />2025-02-12 | 19 | 0 | 0 | Compared successfully. |
| [Cloud Computing SRG](#cloud_computing_srg) | Y25M12<br />2024-12-20, 2025-08-13 | Y25M09<br />2024-12-20, 2025-08-13 | 0 | 0 | 0 | Compared successfully. |
| [Container Platform SRG](#container_platform_srg) | V2R4<br />2025-09-10 | V2R3<br />2025-05-15 | 13 | 1 | 0 | Compared successfully. |
| [IDPS SRG](#idps_srg) | V3R4<br />2025-09-22 | V3R3<br />2025-05-19 | 17 | 2 | 0 | Compared successfully. |
| [MS Azure SQL DB STIG](#ms_azure_sql_db_stig) | V2R3<br />2025-06-11 | V2R2<br />2024-09-04 | 8 | 0 | 0 | Compared successfully. |
| [MS Defender Antivirus STIG](#ms_defender_antivirus) | V2R8<br />2026-02-17 | V2R7<br />2025-11-25 | 40 | 0 | 0 | Compared successfully. |
| [MS DotNet Framework 4-0 STIG](#ms_dot_net_framework) | V2R8<br />2026-02-12 | V2R7<br />2025-05-16 | 5 | 0 | 0 | Compared successfully. |
| [MS Edge STIG](#ms_edge_stig) | V2R5<br />2026-02-25 | V2R4<br />2025-12-11 | 0 | 1 | 0 | Compared successfully. |
| [MS Entra ID STIG](#ms_entra_id_stig) | V1R1<br />2025-03-17 |  | 0 | 0 | 0 | No previous benchmark version found in Archive. |
| [MS IE11 STIG](#ie_11_stig) | V2R7<br />2026-02-24 | V2R6<br />2025-11-25 | 1 | 0 | 0 | Compared successfully. |
| [MS Intune MDM Service Desktop Mobile STIG](#ms_intune_mdm_service_desktop_mobile_stig) | Y25M04<br />2025-05-08 |  | 0 | 0 | 0 | No previous benchmark version found in Archive. |
| [Microsoft Windows 11 STIG](#microsoft_windows_11_stig) | V2R7<br />2026-02-12 | V2R6<br />2025-11-24 | 3 | 0 | 1 | Compared successfully. |
| [Network Infrastructure Policy STIG](#network_infrastructure_policy_stig) | V10R7<br />2024-08-02 |  | 0 | 0 | 0 | No previous benchmark version found in Archive. |
| [Windows Firewall with Advanced Security STIG](#windows_firewall_with_advanced_security) | V2R2<br />2023-08-23 |  | 0 | 0 | 0 | No previous benchmark version found in Archive. |

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
| Current Version | Y25M12 |
| Current Version Date | 2024-12-20, 2025-08-13 |
| Current Version Published | 2025-01-30, 2025-08-13 |
| Previous Version | Y25M09 |
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
| Current Version | V2R3 |
| Current Version Date | 2025-06-11 |
| Current Version Published | 2025-07-02 |
| Previous Version | V2R2 |
| Previous Version Date | 2024-09-04 |
| Previous Version Published | 2024-10-24 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;255301 | Azure SQL Databases must integrate with Azure Active Directory for providing account management and automation for all users, groups, roles, and any other principals. |
| V&#8209;255302 | Azure SQL Database must enforce approved authorizations for logical access to server information and system resources in accordance with applicable access control policies. |
| V&#8209;255303 | Azure SQL Database must enforce approved authorizations for logical access to database information and system resources in accordance with applicable access control policies. |
| V&#8209;255311 | The Azure SQL Database and associated applications must reserve the use of dynamic code execution for situations that require it. |
| V&#8209;255312 | The Azure SQL Database and associated applications, when making use of dynamic code execution, must scan input data for invalid values that may indicate a code injection attack. |
| V&#8209;255334 | The Azure SQL Database must be configured to prohibit or restrict the use of organization-defined functions, ports, protocols, and/or services, as defined in the PPSM CAL and vulnerability assessments. |
| V&#8209;255335 | Azure SQL Database must uniquely identify and authenticate organizational users (or processes acting on behalf of organizational users). |
| V&#8209;255340 | Azure SQL Database must automatically terminate a user session after organization-defined conditions or trigger events requiring session disconnect. |

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
| Current Version | V2R8 |
| Current Version Date | 2026-02-17 |
| Current Version Published | 2026-04-01 |
| Previous Version | V2R7 |
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
| V&#8209;213428 | Microsoft Defender AV must be configured to run and scan for malware and other potentially unwanted software. |
| V&#8209;213429 | Microsoft Defender AV must be configured to not exclude files for scanning. |
| V&#8209;213430 | Microsoft Defender AV must be configured to not exclude files opened by specified processes. |
| V&#8209;213431 | Microsoft Defender AV must be configured to enable the Automatic Exclusions feature. |
| V&#8209;213433 | Microsoft Defender AV must be configured to check in real time with MAPS before content is run or accessed. |
| V&#8209;213436 | Microsoft Defender AV must be configured for protocol recognition for network protection. |
| V&#8209;213441 | Microsoft Defender AV Group Policy settings must take priority over the local preference settings. |
| V&#8209;213442 | Microsoft Defender AV must monitor for incoming and outgoing files. |
| V&#8209;213443 | Microsoft Defender AV must be configured to monitor for file and program activity. |
| V&#8209;213445 | Microsoft Defender AV must be configured to always enable real-time protection. |
| V&#8209;213447 | Microsoft Defender AV must be configured to process scanning when real-time protection is enabled. |
| V&#8209;213448 | Microsoft Defender AV must be configured to scan archive files. |
| V&#8209;213452 | Microsoft Defender AV spyware definition age must not exceed 7 days. |
| V&#8209;213453 | Microsoft Defender AV virus definition age must not exceed 7 days. |
| V&#8209;278647 | Microsoft Defender AV must block Adobe Reader from creating child processes. |
| V&#8209;278648 | Microsoft Defender AV must block credential stealing from the Windows local security authority subsystem. |
| V&#8209;278649 | Microsoft Defender AV must block untrusted and unsigned processes that run from USB. |
| V&#8209;278650 | Microsoft Defender AV must use advanced protection against ransomware. |
| V&#8209;278651 | Microsoft Defender AV must audit process creations originating from PSExec and WMI commands. |
| V&#8209;278652 | Microsoft Defender AV must audit persistence through WMI event subscription. |
| V&#8209;278653 | Microsoft Defender AV must audit executable files from running unless they meet a prevalence, age, or trusted list criterion. |
| V&#8209;278654 | Microsoft Defender AV must block Office communication application from creating child processes. |
| V&#8209;278655 | Microsoft Defender AV must block abuse of exploited vulnerable signed drivers. |
| V&#8209;278656 | Microsoft Defender AV must configure local administrator merge behavior for lists. |
| V&#8209;278658 | Microsoft Defender AV must control whether exclusions are visible to Local Admins. |
| V&#8209;278659 | Microsoft Defender AV must randomize scheduled task times. |
| V&#8209;278660 | Microsoft Defender AV must hide the Family options area. |
| V&#8209;278661 | Microsoft Defender AV must enable the file hash computation feature. |
| V&#8209;278662 | Microsoft Defender AV must enable extended cloud check. |
| V&#8209;278668 | Microsoft Defender AV must enable script scanning. |
| V&#8209;278669 | Microsoft Defender AV must enable real-time protection and Security Intelligence Updates during OOBE. |
| V&#8209;278672 | Microsoft Defender AV must enable network protection to be configured into block or audit mode on Windows Server. |
| V&#8209;278674 | Microsoft Defender AV must enable EDR in block mode. |
| V&#8209;278675 | Microsoft Defender AV must report Dynamic Signature dropped events. |
| V&#8209;278676 | Microsoft Defender AV must scan excluded files and directories during quick scans. |
| V&#8209;278677 | Microsoft Defender AV must convert warn verdict to block. |
| V&#8209;278678 | Microsoft Defender AV must enable asynchronous inspection. |
| V&#8209;278679 | Microsoft Defender AV must scan packed executables. |
| V&#8209;278680 | Microsoft Defender AV must enable heuristics. |
| V&#8209;278863 | Microsoft Defender AV must set cloud protection level to High. |

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
| Current Version | V2R8 |
| Current Version Date | 2026-02-12 |
| Current Version Published | 2026-04-01 |
| Previous Version | V2R7 |
| Previous Version Date | 2025-05-16 |
| Previous Version Published | 2025-07-02 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;225229 | .Net Framework versions installed on the system must be supported. |
| V&#8209;225230 | The .NET CLR must be configured to use FIPS approved encryption modules. |
| V&#8209;225233 | Trust must be established prior to enabling the loading of remote code in .Net 4. |
| V&#8209;225234 | .NET default proxy settings must be reviewed and approved. |
| V&#8209;225236 | Software utilizing .Net 4.0 must be identified and relevant access controls configured. |

### Added Groups

None

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
| Current Version | V1R1 |
| Current Version Date | 2025-03-17 |
| Current Version Published | 2025-02-28 |
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
| Current Version | Y25M04 |
| Current Version Date | 2025-05-08 |
| Current Version Published | 2025-04-22 |
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

<a id="microsoft_windows_11_stig"></a>

## Microsoft Windows 11 STIG

| Field | Value |
| --- | --- |
| Scan Type | SemiAutomated |
| Current Version | V2R7 |
| Current Version Date | 2026-02-12 |
| Current Version Published | 2026-04-01 |
| Previous Version | V2R6 |
| Previous Version Date | 2025-11-24 |
| Previous Version Published | 2026-01-05 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;253260 | Windows 11 systems must use a BitLocker PIN for pre-boot authentication. |
| V&#8209;253264 | The Windows 11 system must use an antivirus program. |
| V&#8209;253338 | The security event log size must be configured to a value that holds at least one week's worth of audit records. |

### Added Groups

None

### Removed Groups

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;253258 | Windows 11 must employ automated mechanisms to determine the state of system components with regard to flaw remediation using the following frequency: Continuously, where ESS is used; 30 days, for any additional internal network scans not covered by ESS; and annually, for external scans by Computer Network Defense Service Provider (CNDSP). |

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

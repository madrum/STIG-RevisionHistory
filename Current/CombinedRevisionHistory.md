<a id="top"></a>

# Combined Revision History

Generated: 2026-10-12 18:51:42+00:00

## Summary

| StigDisplayName | CurrentVersion | PreviousVersion | ChangedCount | AddedCount | RemovedCount | Status |
| --- | --- | --- | --- | --- | --- | --- |
| [ASD STIG](#asd_stig) | V6R5<br />2026-08-25 <sup>✨</sup> | V6R4<br />2025-09-09 | 63 | 0 | 0 | Compared successfully. |
| [Cloud Computing SRG](#cloud_computing_srg) | Y26M06<br />2024-12-20, 2025-08-13 | Y25M12<br />2024-12-20, 2025-08-13 | 0 | 0 | 0 | Compared successfully. |
| [Container Platform SRG](#container_platform_srg) | V2R5<br />2026-09-01 <sup>✨</sup> | V2R4<br />2025-09-10 | 16 | 0 | 0 | Compared successfully. |
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
| Current Version | V6R5 |
| Current Version Date | 2026-08-25 |
| Current Version Published | 2026-09-30 |
| Previous Version | V6R4 |
| Previous Version Date | 2025-09-09 |
| Previous Version Published | 2025-10-01 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;222396 | The application must implement DoW-approved encryption to protect the confidentiality of remote access sessions. |
| V&#8209;222397 | The application must implement cryptographic mechanisms to protect the integrity of remote access sessions. |
| V&#8209;222409 | The application must automatically remove or disable temporary user accounts 72 hours after account creation. |
| V&#8209;222425 | The application must enforce approved authorizations for logical access to information and system resources in accordance with applicable access control policies. |
| V&#8209;222426 | The application must enforce organization-defined discretionary access control policies over defined subjects and objects. |
| V&#8209;222434 | The application must display the Standard Mandatory DoW Notice and Consent Banner before granting access to the application. |
| V&#8209;222435 | The application must retain the Standard Mandatory DoW Notice and Consent Banner on the screen until users acknowledge the usage conditions and take explicit actions to log on for further access. |
| V&#8209;222436 | The publicly accessible application must display the Standard Mandatory DoW Notice and Consent Banner before granting access to the application. |
| V&#8209;222438 | The application must protect against an individual (or process acting on behalf of an individual) falsely denying having performed organization-defined actions to be covered by non-repudiation. |
| V&#8209;222445 | The application must provide audit record generation capability for session timeouts. |
| V&#8209;222447 | The application must provide audit record generation capability for HTTP headers including User-Agent, Referer, GET, and POST. |
| V&#8209;222491 | The application must provide an audit reduction capability that supports after-the-fact investigations of security incidents. |
| V&#8209;222494 | The application must provide a report generation capability that supports after-the-fact investigations of security incidents. |
| V&#8209;222513 | The application must have the capability to prevent the installation of patches, service packs, or application components without verification the software component has been digitally signed using a certificate that is recognized and approved by the organization. |
| V&#8209;222520 | The application must require users to reauthenticate when organization-defined circumstances or situations require reauthentication. |
| V&#8209;222522 | The application must uniquely identify and authenticate organizational users (or processes acting on behalf of organizational users). |
| V&#8209;222524 | The application must accept Personal Identity Verification (PIV) credentials. |
| V&#8209;222525 | The application must electronically verify Personal Identity Verification (PIV) credentials. |
| V&#8209;222526 | The application must use multifactor (e.g., CAC, Alt. Token) authentication for network access to non-privileged accounts. |
| V&#8209;222528 | The application must use multifactor (e.g., CAC, Alt. Token) authentication for local access to nonprivileged accounts. |
| V&#8209;222530 | The application must implement replay-resistant authentication mechanisms for network access to privileged accounts. |
| V&#8209;222531 | The application must implement replay-resistant authentication mechanisms for network access to nonprivileged accounts. |
| V&#8209;222532 | The application must utilize mutual authentication when endpoint device non-repudiation protections are required by DoW policy or by the data owner. |
| V&#8209;222535 | The application must disable device identifiers after 35 days of inactivity unless a cryptographic certificate is used for authentication. |
| V&#8209;222536 | The application must enforce a minimum 15-character password length. |
| V&#8209;222537 | The application must enforce password complexity by requiring that at least one uppercase character be used. |
| V&#8209;222538 | The application must enforce password complexity by requiring that at least one lowercase character be used. |
| V&#8209;222539 | The application must enforce password complexity by requiring that at least one numeric character be used. |
| V&#8209;222540 | The application must enforce password complexity by requiring that at least one special character be used. |
| V&#8209;222541 | The application must require the change of at least eight of the total number of characters when passwords are changed. |
| V&#8209;222542 | The application must only store cryptographic representations of passwords. |
| V&#8209;222543 | The application must transmit only cryptographically-protected passwords. |
| V&#8209;222544 | The application must enforce 24 hours/1 day as the minimum password lifetime. |
| V&#8209;222545 | The application must enforce a 180-day maximum password lifetime restriction. |
| V&#8209;222546 | The application must prohibit password reuse for a minimum of five generations. |
| V&#8209;222547 | The application must allow the use of a temporary password for system logons with an immediate change to a permanent password. |
| V&#8209;222548 | The application password must not be changeable by users other than the administrator or the user with which the password is associated. |
| V&#8209;222557 | The application must accept Personal Identity Verification (PIV) credentials from other federal agencies. |
| V&#8209;222558 | The application must electronically verify Personal Identity Verification (PIV) credentials from other federal agencies. |
| V&#8209;222560 | The application must conform to Federal Identity, Credential, and Access Management (FICAM)-issued profiles. |
| V&#8209;222570 | The application must utilize FIPS-validated cryptographic modules when signing application components. |
| V&#8209;222571 | The application must utilize FIPS-validated cryptographic modules when generating cryptographic hashes. |
| V&#8209;222584 | The application must only allow the use of DoW-approved certificate authorities for verification of the establishment of protected sessions. |
| V&#8209;222587 | The application must protect the confidentiality and integrity of stored information when required by DoW policy or the information owner. |
| V&#8209;222588 | The application must implement approved cryptographic mechanisms to prevent unauthorized modification of organization-defined information at rest on organization-defined information system components. |
| V&#8209;222589 | The application must use appropriate cryptography in order to protect stored DoW information when required by the information owner or DoW policy. |
| V&#8209;222592 | Applications must prevent unauthorized and unintended information transfer via shared system resources. |
| V&#8209;222601 | The application must not store sensitive information in hidden fields. |
| V&#8209;222618 | Unsigned Category 1A mobile code must not be used in the application in accordance with DoW policy. |
| V&#8209;222620 | Application web servers must be on a separate network segment from the application and database servers if it is a tiered application operating in the DoW DMZ. |
| V&#8209;222623 | The ISSO must report all suspected violations of IA policies in accordance with DoW information system IA procedures. |
| V&#8209;222627 | The ISSO must ensure if a DoW STIG or NSA guide is not available, a third-party product will be configured by following available guidance. |
| V&#8209;222628 | New IP addresses, data services, and associated ports used by the application must be submitted to the appropriate approving authority for the organization, which in turn will be submitted through the DoW Ports, Protocols, and Services Management (DoW PPSM) |
| V&#8209;222629 | The application must be registered with the DoW Ports and Protocols Database. |
| V&#8209;222634 | The application services and interfaces must be compatible with and ready for IPv6 networks. |
| V&#8209;222636 | A contingency plan must exist in accordance with DoW policy based on the application's availability requirements. |
| V&#8209;222638 | Data backup must be performed at required intervals in accordance with DoW policy. |
| V&#8209;222641 | The application must use encryption to implement key exchange and authenticate endpoints prior to establishing a communication channel for key exchange. |
| V&#8209;222643 | The application must have the capability to mark sensitive/classified output when required. |
| V&#8209;222645 | Application files must be cryptographically hashed prior to deploying to DoW operational networks. |
| V&#8209;222661 | Unnecessary built-in application accounts must be disabled. |
| V&#8209;222662 | Default passwords must be changed. |
| V&#8209;222671 | Connections between the DoW enclave and the Internet or other public or commercial wide area networks must require a DMZ. |

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
| Current Version | V2R5 |
| Current Version Date | 2026-09-01 |
| Current Version Published | 2026-09-30 |
| Previous Version | V2R4 |
| Previous Version Date | 2025-09-10 |
| Previous Version Published | 2025-10-28 |
| Status | Compared successfully. |

### Changed Group IDs

None

### Changed Rule Versions

None

### Changed Rule IDs

| GroupId | RuleTitle |
| --- | --- |
| V&#8209;233020 | The container platform must automatically remove or disable temporary user accounts after 72 hours. |
| V&#8209;233032 | The container platform must display the Standard Mandatory DoW Notice and Consent Banner before granting access to platform components. |
| V&#8209;233033 | The container platform must retain the Standard Mandatory DoW Notice and Consent Banner on the screen until users acknowledge the usage and conditions and take explicit actions to log on for further access. |
| V&#8209;233038 | The container platform must generate audit records for all DoW-defined auditable events within all components in the platform. |
| V&#8209;233080 | The container platform must use multifactor authentication for network access to nonprivileged accounts. |
| V&#8209;233084 | The container platform must use FIPS-validated SHA-1 or higher hash function to provide replay-resistant authentication mechanisms for network access to privileged accounts. |
| V&#8209;233095 | For container platform using password authentication, the application must store only cryptographic representations of passwords. |
| V&#8209;233098 | The container platform must enforce a 180-day maximum password lifetime restriction. |
| V&#8209;233101 | The container platform must map the authenticated identity to the individual user or group account for PKI-based authentication. |
| V&#8209;233190 | All nonessential, unnecessary, and unsecure DoW ports, protocols, and services must be disabled in the container platform. |
| V&#8209;233193 | The container platform must require users to reauthenticate when organization-defined circumstances or situations require reauthentication. |
| V&#8209;233195 | The container platform must be configured to use multifactor authentication for user authentication. |
| V&#8209;233207 | Container platform applications and Application Program Interfaces (API) used for nonlocal maintenance sessions must use FIPS-validated keyed-hash message authentication code (HMAC) to protect the integrity of nonlocal maintenance and diagnostic communications. |
| V&#8209;233273 | Container platform components must be configured in accordance with the security configuration settings based on DoW security configuration or implementation guidance, including SRGs, STIGs, NSA configuration guides, CTOs, and DTMs. |
| V&#8209;233276 | The container platform must prohibit communication using TLS versions 1.0 and 1.1, and SSL 2.0 and 3.0. |
| V&#8209;233290 | The container platform must prohibit or restrict the use of protocols that transmit unencrypted authentication information or use flawed cryptographic algorithms for transmission. |

### Added Groups

None

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

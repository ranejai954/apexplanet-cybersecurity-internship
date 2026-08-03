# 🔒 Network Security & Scanning - Task 2

## 📌 Project Overview

This project presents a comprehensive network security assessment of a vulnerable target machine (**Metasploitable 2**) using industry-standard penetration testing and network analysis tools.

The assessment covers reconnaissance, port scanning, service enumeration, vulnerability assessment, packet analysis, and basic firewall implementation within a controlled virtual lab environment.

| Item | Details |
|------|---------|
| **Task** | Network Security & Scanning |
| **Timeline** | Days 13–24 (12 Days) |
| **Target Machine** | Metasploitable 2 |
| **Target IP** | 192.168.225.85 |
| **Attacker Machine** | Kali Linux 2025.2 |
| **Virtualization** | Oracle VirtualBox |

---

# 🎯 Objectives

The primary objectives of this task were:

- Perform passive and active reconnaissance.
- Identify open ports and running services.
- Detect known vulnerabilities using OpenVAS/GVM.
- Capture and analyze network packets using Wireshark.
- Demonstrate firewall configuration using iptables.
- Document findings with professional reporting.

---

# 🛠 Tools Used

| Tool | Purpose | Version |
|------|---------|---------|
| Nmap | Port Scanning & Enumeration | 7.95 |
| OpenVAS / GVM | Vulnerability Assessment | 25.04.0 |
| Wireshark | Packet Analysis | 4.x |
| hping3 | SYN Flood Simulation | 3.x |
| iptables | Linux Firewall | 1.8.x |
| Metasploitable 2 | Vulnerable Target | Ubuntu 8.04 |
| Kali Linux | Security Testing Platform | 2025.2 |
| VirtualBox | Virtualization | Latest |

---

# 📅 Project Timeline

| Phase | Activity | Duration |
|------|----------|----------|
| Phase 1 | Lab Setup & Reconnaissance | Days 13–14 |
| Phase 2 | Port & Service Scanning | Days 15–17 |
| Phase 3 | Vulnerability Assessment | Days 18–20 |
| Phase 4 | Packet Analysis | Day 21 |
| Phase 5 | Firewall Configuration | Day 22 |
| Phase 6 | Documentation & Reporting | Days 23–24 |

---

# 📊 Scan Results Summary

## TCP Ports Discovered

| Port | Service | Version |
|------|---------|----------|
| 21 | FTP | vsftpd 2.3.4 |
| 22 | SSH | OpenSSH 4.7p1 |
| 23 | Telnet | Linux telnetd |
| 25 | SMTP | Postfix |
| 53 | DNS | BIND 9.4.2 |
| 80 | HTTP | Apache 2.2.8 |
| 111 | rpcbind | RPC |
| 139 | NetBIOS | Samba |
| 445 | SMB | Samba |
| 512 | rexecd | netkit-rsh |
| 513 | login | rlogin |
| 514 | shell | tcpwrapped |
| 1099 | Java RMI | GNU Classpath |
| 1524 | Root Shell | Metasploitable |
| 2049 | NFS | RPC |
| 2121 | FTP | ProFTPD 1.3.1 |
| 3306 | MySQL | 5.0.51a |
| 5432 | PostgreSQL | 8.3 |
| 5900 | VNC | Protocol 3.3 |
| 6000 | X11 | Access Denied |
| 6667 | IRC | UnrealIRCd |
| 8009 | AJP13 | Apache JServ |
| 8180 | HTTP | Apache Tomcat |

**Total Open TCP Ports:** **23**

---

## UDP Ports Discovered

| Port | Service |
|------|---------|
| 53 | DNS |
| 111 | RPCBind |
| 137 | NetBIOS |
| 2049 | NFS |
| 38412 | Unknown |

**Total Open UDP Ports:** **5**

---

# 🚨 Vulnerability Summary

| Severity | Count |
|----------|------:|
| 🔴 Critical | 3 |
| 🟠 High | 8 |
| 🟡 Medium | 7 |
| 🟢 Low | 2 |

---

## Critical Vulnerabilities

| CVE | Service | Port | Description |
|-----|---------|------|-------------|
| CVE-2011-2523 | vsftpd 2.3.4 | 21 | Backdoor allowing remote root access |
| N/A | Metasploitable Root Shell | 1524 | Unauthenticated root shell |
| CVE-2010-2075 | UnrealIRCd | 6667 | Remote Code Execution |

---

# 📈 Key Findings

- 23 TCP ports and 5 UDP ports were identified.
- Multiple outdated services were discovered.
- Critical backdoors existed on the FTP and IRC services.
- Several services allowed remote exploitation.
- FTP transmitted credentials in plaintext.
- Firewall rules successfully mitigated several attack vectors.

---
# 📁 Repository Structure

```text
Task-2_Network_Security_Scanning/
│
├── Reports/
│   ├── 01_Nmap_Scan_Report.pdf
│   ├── 02_OpenVAS_Report.pdf
│   ├── 03_Packet_Analysis_Report.pdf
│
├── Scan_Results/
│   ├── tcp_scan.txt
│   ├── udp_scan.txt
│   ├── service_version.txt
│   ├── os_detection.txt
│   ├── full_scan.nmap
│   ├── full_scan.xml
│   └── full_scan.gnmap
│
│
├── Scripts/
│   └── firewall_rules.sh
│
├── Screenshots/
│   ├── nmap_scan.png
│   ├── openvas_dashboard.png
│   ├── ftp_credentials.png
│   ├── syn_flood.png
│   └── firewall_blocking.png
│
│
└── README.md 
```

---

# 🔍 Detailed Scan Findings

## 1️⃣ Nmap Port Scanning

### TCP SYN Scan

A TCP SYN scan was performed to quickly identify active services while minimizing network noise.

### Results

- 23 TCP ports discovered
- Multiple outdated services identified
- Legacy protocols such as Telnet, FTP and RSH exposed
- Several services vulnerable to public exploits

---

### UDP Scan

UDP enumeration revealed five accessible services.

Discovered services include:

- DNS
- RPCBind
- NetBIOS
- NFS
- Unknown UDP Service

---

### Service Version Detection

Service fingerprinting identified the following major versions:

| Service | Version | Security Status |
|----------|----------|----------------|
| vsftpd | 2.3.4 | 🔴 Critical |
| OpenSSH | 4.7p1 | 🟠 Outdated |
| Apache HTTP Server | 2.2.8 | 🟠 Outdated |
| Samba | 3.x | 🟠 Vulnerable |
| MySQL | 5.0.51a | 🟠 Outdated |
| PostgreSQL | 8.3 | 🟡 Legacy |
| UnrealIRCd | 3.2.8.1 | 🔴 Critical |

---

### Operating System Detection

Nmap OS fingerprinting successfully identified:

- Linux Kernel 2.6.x
- Oracle VirtualBox virtual environment
- Metasploitable 2 operating system

---

## Banner Grabbing

### FTP Banner

```text
nc -nv 192.168.225.85 21

220 (vsFTPd 2.3.4)
```

---

### vsftpd Backdoor Demonstration

```text
nc -nv 192.168.225.85 6200

whoami
root

id
uid=0(root)
```

The FTP server contained the well-known backdoor (CVE-2011-2523), allowing remote root access after exploitation.

---

# 🛡 OpenVAS / GVM Vulnerability Assessment

## Scan Configuration

| Setting | Value |
|----------|-------|
| Target | 192.168.225.85 |
| Scan Profile | Full and Fast |
| Duration | Approximately 2 Hours |
| Status | Completed Successfully |

---

## Key Findings

OpenVAS detected several critical and high-risk vulnerabilities across the target machine.

Major findings include:

- vsftpd 2.3.4 backdoor
- UnrealIRCd backdoor
- Default credentials
- Outdated Apache services
- Legacy SSH version
- Weak database services
- Information disclosure
- Missing security patches

---

## Critical CVEs

| CVE | CVSS | Service | Impact |
|------|------|---------|--------|
| CVE-2011-2523 | 10.0 | vsftpd | Remote Root Access |
| CVE-2010-2075 | 9.8 | UnrealIRCd | Remote Code Execution |
| CVE-2007-5498 | 7.5 | OpenSSH | Multiple Exploits |
| CVE-2008-0455 | 7.5 | Apache | Remote Vulnerabilities |
| CVE-2008-2079 | 7.5 | MySQL | Authentication Bypass |

---

# 📡 Packet Analysis with Wireshark

Network traffic was captured and analyzed using Wireshark to observe communication between the attacker and target systems.

---

## HTTP Analysis

Captured:

- HTTP Requests
- HTTP Responses
- Server Headers
- Web Traffic

This demonstrated information disclosure through plaintext HTTP communication.

---

## FTP Credential Capture

Captured credentials:

```text
USER msfadmin
PASS msfadmin
```

The analysis confirmed that FTP transmits usernames and passwords in plaintext, making it vulnerable to packet sniffing attacks.

---

## DNS Analysis

Observed:

- DNS Queries
- DNS Responses
- Hostname Resolution
- Internal Network Information

---

## SYN Flood Demonstration

Using **hping3**, a SYN Flood simulation was performed to demonstrate Denial-of-Service (DoS) behavior.

Example command:

```bash
sudo hping3 -S --flood -p 80 192.168.225.85
```

This generated a high volume of SYN packets to simulate a TCP SYN Flood attack.

---

# 🔥 Firewall Configuration (iptables)

Basic firewall rules were configured to reduce attack surface and mitigate common attacks.

---

## Implemented Rules

```bash
# Block incoming HTTP traffic
sudo iptables -A INPUT -p tcp --dport 80 -j DROP

# Limit SYN packets
sudo iptables -A INPUT -p tcp --syn -m limit --limit 5/min -j ACCEPT
sudo iptables -A INPUT -p tcp --syn -j DROP

# Drop NULL packets
sudo iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Drop SYN-FIN packets
sudo iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
```

---

## Demonstration Results

The firewall successfully:

- Blocked unauthorized HTTP traffic
- Prevented aggressive port scanning
- Filtered malformed packets
- Reduced SYN flood effectiveness
- Displayed filtered ports instead of open ports during rescanning

---

# 📸 Screenshots

Include screenshots demonstrating each phase of the assessment.

| Screenshot | Description |
|------------|-------------|
| `nmap_scan.png` | TCP & UDP Scan Results |
| `openvas_dashboard.png` | OpenVAS Vulnerability Dashboard |
| `ftp_credentials.png` | Captured FTP Credentials |
| `syn_flood.png` | SYN Flood Demonstration |
| `firewall_blocking.png` | Firewall Rules in Action |

Example:

```md
![Nmap Scan](Screenshots/nmap_scan.png)

![OpenVAS Dashboard](Screenshots/openvas_dashboard.png)

![FTP Credentials](Screenshots/ftp_credentials.png)

![SYN Flood](Screenshots/syn_flood.png)

![Firewall Blocking](Screenshots/firewall_blocking.png)
```

---
# 🚀 How to Run This Project

## Prerequisites

Ensure the following software is installed before starting:

- Oracle VirtualBox
- Kali Linux (2025.2 or later)
- Metasploitable 2
- Nmap
- OpenVAS / Greenbone Vulnerability Manager (GVM)
- Wireshark
- hping3

---

## Lab Setup

### 1. Start the Virtual Machines

Launch both:

- Kali Linux
- Metasploitable 2

Verify that both systems are connected to the same virtual network.

---

### 2. Verify Network Connectivity

Run the following command from Kali Linux:

```bash
ping 192.168.225.85
```

Successful replies confirm that the target machine is reachable.

---

### 3. Perform Nmap Scans

Basic Scan

```bash
nmap 192.168.225.85
```

Service Detection

```bash
nmap -sV 192.168.225.85
```

Operating System Detection

```bash
sudo nmap -O 192.168.225.85
```

Complete TCP Scan

```bash
sudo nmap -sS -sV -O -Pn 192.168.225.85
```

UDP Scan

```bash
sudo nmap -sU 192.168.225.85
```

---

### 4. Run OpenVAS

1. Start GVM services.
2. Open the Greenbone Security Assistant (GSA) web interface.
3. Create a target using the IP address:

```text
192.168.225.85
```

4. Select **Full and Fast** scan configuration.
5. Start the scan and review the generated vulnerability report.

---

### 5. Capture Network Traffic

Launch Wireshark and select the active network interface.

Capture traffic while performing:

- FTP Login
- HTTP Browsing
- DNS Queries
- Port Scanning

Save the capture as:

```text
wireshark_traffic.pcapng
```

---

### 6. Configure Firewall Rules

Execute the firewall script:

```bash
chmod +x firewall_rules.sh
sudo ./firewall_rules.sh
```

Verify rules:

```bash
sudo iptables -L
```

---

# 📚 Learning Outcomes

This project provided practical experience in:

- Network Reconnaissance
- Port Enumeration
- Service Enumeration
- Banner Grabbing
- Operating System Fingerprinting
- Vulnerability Assessment
- CVE Analysis
- Packet Capture & Analysis
- Firewall Configuration
- Basic Network Defense
- Security Documentation
- Professional Reporting

---

# 🔐 Security Recommendations

Based on the assessment, the following remediation measures are recommended:

- Upgrade outdated software versions.
- Disable unused network services.
- Replace insecure protocols such as FTP and Telnet with secure alternatives (SFTP/SSH).
- Remove default credentials.
- Apply the latest operating system and application patches.
- Restrict unnecessary ports using firewall rules.
- Enable intrusion detection and monitoring.
- Conduct regular vulnerability assessments.
- Encrypt sensitive network communications.
- Follow the Principle of Least Privilege (PoLP).

---

# 📊 Project Statistics

| Metric | Value |
|---------|------:|
| Project Duration | 12 Days |
| Target Machines | 1 |
| Operating Systems | 2 |
| Security Tools Used | 7 |
| Open TCP Ports | 23 |
| Open UDP Ports | 5 |
| Critical Vulnerabilities | 3 |
| High Severity Issues | 8 |
| Medium Severity Issues | 7 |
| Low Severity Issues | 2 |

---

# 🏆 Skills Demonstrated

- Linux Administration
- Network Security
- Ethical Hacking Fundamentals
- Penetration Testing
- Vulnerability Assessment
- Wireshark Packet Analysis
- Firewall Configuration
- Nmap Enumeration
- OpenVAS Security Scanning
- Security Documentation
- Technical Report Writing

---

# 📖 References

The following resources were used during this project:

- Nmap Official Documentation
- Greenbone/OpenVAS Documentation
- Wireshark User Guide
- Kali Linux Documentation
- Metasploitable 2 Documentation
- MITRE CVE Database
- CVE Details
- OWASP Testing Guide

---

# ⚠️ Disclaimer

This project was conducted **only within a controlled virtual lab environment** using the intentionally vulnerable **Metasploitable 2** operating system.

The techniques demonstrated are strictly for:

- Educational purposes
- Security research
- Authorized penetration testing
- Cybersecurity learning

Do **not** perform these activities on systems without explicit authorization.

---

# 👨‍💻 Author

**Jai Rane**

Cybersecurity Enthusiast | B.Sc. Computer Science Student

### Connect with Me

- **GitHub:** https://github.com/ranejai954
- **LinkedIn:** https://www.linkedin.com/in/jai-rane-62ba58352/

---

# 🙏 Acknowledgements

Special thanks to:

- Metasploitable Project
- Kali Linux Team
- Greenbone Security
- Wireshark Foundation
- Nmap Project
- Oracle VirtualBox
- MITRE CVE Program
- OWASP Foundation

---

# 📄 License

This project is intended solely for **educational, research, and authorized penetration testing purposes**.

All demonstrations were performed in a safe virtual laboratory environment.

---

<div align="center">

## ⭐ If you found this project useful, consider giving it a Star!

**Thank you for visiting this repository. Happy Learning and Stay Secure! 🔐**

</div>

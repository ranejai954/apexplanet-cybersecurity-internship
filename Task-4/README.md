# Task 4 – Exploitation & System Security

## ApexPlanet Software Pvt. Ltd. – Cybersecurity & Ethical Hacking Internship

**Intern:** Jai Rane
**Intern ID:** ASPL2518045
**Task:** Task 4 – Exploitation & System Security
**Environment:** Kali Linux / Virtual Lab
**Date:** September 2026

---

## 📌 Overview

This repository contains the work completed for **Task 4 – Exploitation & System Security** as part of the ApexPlanet Cybersecurity & Ethical Hacking Internship.

The task focuses on understanding the penetration-testing workflow and demonstrating common security testing techniques in a controlled laboratory environment.

The practical work covered:

* Metasploit Framework
* Vulnerability exploitation testing
* SSH password testing using Hydra
* Password-hash analysis using John the Ripper
* Phishing-awareness simulation
* Safe script/malware-behavior demonstration
* Firewall configuration using iptables
* Basic system hardening

All activities were performed in a controlled environment for educational purposes.

---

## 🎯 Objectives

The main objectives of this task were:

1. Understand the penetration-testing methodology.
2. Configure and use the Metasploit Framework.
3. Search for and test a known vulnerability.
4. Demonstrate password security testing.
5. Understand password-hash cracking.
6. Create a controlled phishing simulation.
7. Demonstrate safe script execution and malware-analysis concepts.
8. Configure firewall rules to reduce the attack surface.
9. Document findings and recommend appropriate security measures.

The official Task 4 methodology follows the general sequence:

**Reconnaissance → Scanning → Exploitation → Post-Exploitation → Reporting**

---

## 🧪 Laboratory Environment

### Operating Environment

* Kali Linux
* Oracle VirtualBox
* Local/controlled testing environment

### Kali Linux Network

The Kali Linux system used during the testing had the following configuration:

```text
IP Address: 10.0.2.15
Subnet Mask: 255.255.255.0
Broadcast: 10.0.2.255
Loopback: 127.0.0.1
```

---

## 🛠️ Tools Used

| Tool                  | Purpose                                         |
| --------------------- | ----------------------------------------------- |
| Kali Linux            | Main cybersecurity testing environment          |
| Oracle VirtualBox     | Virtual laboratory environment                  |
| Metasploit Framework  | Vulnerability research and exploitation testing |
| Hydra                 | SSH password-guessing demonstration             |
| John the Ripper       | Password-hash cracking                          |
| iptables              | Firewall configuration and system hardening     |
| Bash / Linux Terminal | Command execution and scripting                 |
| Firefox               | Testing the local phishing simulation           |

---

# 🔎 Practical Activities

## 1. Metasploit Framework

The Metasploit Framework was configured and launched in Kali Linux.

PostgreSQL was started before launching Metasploit:

```bash
systemctl start postgresql
systemctl enable postgresql
```

Metasploit was launched using:

```bash
sudo msfconsole
```

The `vsftpd` vulnerability was searched using Metasploit.

The following module was identified:

```text
exploit/unix/ftp/vsftpd_234_backdoor
```

### Exploitation Testing

The identified module was selected for controlled testing.

The exploitation attempt in the captured evidence resulted in:

```text
Exploit failed [unreachable]
Connection refused
No session was created.
```

This indicates that the target FTP service was not reachable at the time of the test.

The failed result was documented rather than presenting it as a successful compromise.

---

## 2. Network Connectivity Testing

Network connectivity was checked using:

```bash
ping 10.0.2.15
```

The captured test showed successful communication with:

```text
25 packets transmitted
25 packets received
0% packet loss
```

This verified network connectivity within the testing environment.

---

## 3. SSH Password Testing Using Hydra

Hydra was used to demonstrate password-guessing against an SSH service in the controlled laboratory environment.

The command shown in the evidence was:

```bash
hydra -l msfadmin -P /usr/share/wordlists/fasttrack.txt ssh://192.168.56.101
```

The test identified:

```text
Username: msfadmin
Password: msfadmin
```

This demonstrates the security risk of weak or default credentials.

### Recommended Mitigations

* Use strong and unique passwords.
* Disable default credentials.
* Prefer SSH key-based authentication.
* Restrict SSH access.
* Implement login-rate limiting.
* Use Fail2Ban where appropriate.
* Monitor authentication logs.

---

## 4. Password Hash Analysis with John the Ripper

The Linux password-hash information was examined in the controlled environment.

John the Ripper was then used to demonstrate password-hash cracking.

Example command:

```bash
john --format=md5 /root/hashes.txt
```

Recovered passwords were displayed using:

```bash
john --show /root/hashes.txt
```

The demonstration showed how weak passwords can potentially be recovered from crackable password hashes.

### Recommended Mitigations

* Use strong passwords.
* Use modern password-hashing algorithms.
* Protect password-hash files.
* Avoid password reuse.
* Rotate compromised credentials.
* Never store passwords in plaintext.

---

## 5. Social Engineering – Phishing Simulation

A controlled phishing-awareness simulation was created using a local HTML page.

The simulation represented a fake company login page containing:

* Username field
* Password field
* Login button
* Simulation/warning information

The purpose was to demonstrate how attackers can use fake login pages to trick users into providing credentials.

No real credentials were intended to be collected.

A simple Bash script was also created and executed during the setup/testing process:

```bash
#!/bin/bash
echo "Hello World"
```

The script was made executable using:

```bash
chmod +x test.sh
```

and executed using:

```bash
./test.sh
```

### Recommended Mitigations

* Conduct regular phishing-awareness training.
* Verify links before entering credentials.
* Use multi-factor authentication.
* Implement email filtering.
* Display external-sender warnings.
* Provide clear phishing-reporting channels.

---

## 6. Malware Basics / Safe Demonstration

A simple Bash script was executed in the Kali Linux environment as a safe demonstration of script behavior.

The activity was performed for educational purposes and did not involve executing real malware.

The demonstration helps highlight the importance of understanding and controlling unknown scripts or executable files.

### Security Recommendations

* Do not execute unknown files.
* Use updated endpoint protection.
* Analyze suspicious files in isolated environments.
* Monitor unusual file and process activity.
* Keep security tools and signatures updated.

---

## 7. System Hardening Using iptables

Firewall rules were configured using `iptables` to block selected TCP ports.

The following rules were applied:

```bash
iptables -A INPUT -p tcp --dport 21 -j DROP
iptables -A INPUT -p tcp --dport 23 -j DROP
iptables -A INPUT -p tcp --dport 6200 -j DROP
iptables -A INPUT -p tcp --dport 80 -j DROP
```

SSH traffic was allowed using:

```bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

The rules were saved using:

```bash
iptables-save > /etc/iptables.rules
```

The firewall configuration was then verified using:

```bash
iptables -L -v
```

This demonstrates the principle of reducing the attack surface by blocking unnecessary services while allowing required administrative access.

---

# 📊 Findings

| Finding                      | Risk                | Observation                                                                     |
| ---------------------------- | ------------------- | ------------------------------------------------------------------------------- |
| vsftpd exploitation attempt  | High/Critical       | Vulnerability module identified; captured exploitation attempt was unsuccessful |
| Weak SSH credentials         | High                | Weak/default credentials were identified using Hydra                            |
| Crackable password hashes    | High                | Password hashes were successfully tested using John the Ripper                  |
| Phishing susceptibility      | Medium              | Controlled fake login page demonstrated the phishing concept                    |
| Script execution             | Low / Informational | Safe Bash script execution was demonstrated                                     |
| Unnecessary network services | Medium              | Selected TCP ports were blocked using iptables                                  |

---

# 🛡️ Remediation

The following security measures are recommended:

1. Remove or patch vulnerable and outdated services.
2. Disable unnecessary network services.
3. Close unused ports using firewall rules.
4. Enforce strong and unique passwords.
5. Use SSH key-based authentication where possible.
6. Implement brute-force protection such as Fail2Ban.
7. Protect password-hash files from unauthorized access.
8. Use modern password-hashing algorithms.
9. Conduct regular phishing-awareness training.
10. Keep operating systems and security tools updated.
11. Monitor authentication and network activity.
12. Perform regular vulnerability assessments and penetration tests.

---

# 📁 Repository Structure

```text
Task-4-Exploitation-System-Security/
│
├── README.md
│
├── Metasploit/
│   ├── 1.png
│   ├── 2.png
│   ├── 3.png
│   ├── 4.png
│   ├── 5.png
│   ├── Gemini_Generated_Image_55y06955y06955y0.png
│   └── Screenshot 2026-09-06 132429.png
│
├── JohnTheRipper/
│   ├── 1.png
│   └── 2, 3.jpg
│
├── Social Engineering/
│   ├── 1.png
│   ├── 2.jpg
│   ├── phishing_page.html
│   └── Screenshot 2026-09-06 214137.png
│
├── Malware Basics/
│   └── Screenshot 2026-09-06 214857.png
│
└── System hardening/
    └── B/
        ├── Screenshot 2026-09-06 215006.png
        └── Screenshot 2026-09-06 215059.png
```

---

# 📸 Evidence

Screenshots documenting the practical activities are included in the respective folders.

The evidence covers:

* Kali Linux network configuration
* PostgreSQL and Metasploit setup
* Metasploit vulnerability search
* Exploitation attempt
* Hydra password testing
* John the Ripper password cracking
* Phishing simulation
* Safe script execution
* iptables firewall configuration
* Firewall-rule verification

---

# ⚠️ Disclaimer

This project was created strictly for educational and cybersecurity training purposes.

All security testing and demonstrations were performed in a controlled laboratory environment.

Do not use these techniques against systems, networks, accounts, or applications without explicit authorization.

---

# ✅ Conclusion

Task 4 provided practical exposure to penetration-testing and system-security concepts.

The work demonstrated vulnerability-testing with Metasploit, password security testing with Hydra and John the Ripper, a controlled phishing simulation, safe script execution, and firewall-based system hardening.

The practical exercises highlighted the importance of strong authentication, secure configurations, network restrictions, security awareness, regular patching, and continuous monitoring.

All activities were performed within a controlled environment for educational purposes.

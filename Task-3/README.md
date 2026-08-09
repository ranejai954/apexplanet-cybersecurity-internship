# 🔐 Task 3 — Web Application Security

> **A controlled web application security assessment of DVWA using OWASP Top 10 concepts, Burp Suite, and manual testing techniques.**

---

## 📌 Project Overview

This project demonstrates the identification, exploitation, and mitigation of common web application vulnerabilities in a controlled laboratory environment using **Damn Vulnerable Web Application (DVWA)**.

The assessment focuses on understanding how vulnerable application behavior can be identified through manual security testing and how appropriate defensive controls can reduce the associated risks.

### Assessment Details

| Field               | Details                           |
| ------------------- | --------------------------------- |
| **Task**            | Web Application Security          |
| **Timeline**        | Days 25–36                        |
| **Target**          | DVWA                              |
| **Target URL**      | `http://localhost:8080`           |
| **Environment**     | Kali Linux + Docker               |
| **Primary Tools**   | Burp Suite, Firefox, cURL, Docker |
| **Security Level**  | Low                               |
| **Assessment Type** | Controlled Lab Assessment         |

---

## 🎯 Objectives

The primary objectives of this assessment were to:

* Identify common web application vulnerabilities.
* Understand how vulnerable input handling can be abused.
* Perform controlled exploitation against DVWA.
* Capture evidence of successful exploitation.
* Analyze HTTP requests and responses using Burp Suite.
* Evaluate security-related HTTP headers.
* Develop appropriate mitigation strategies.
* Document the complete testing process.

---

## 🛡️ Vulnerabilities Assessed

|  # | Vulnerability                        |   Severity  |    Status   |
| -: | ------------------------------------ | :---------: | :---------: |
|  1 | SQL Injection                        | 🔴 Critical | ✅ Exploited |
|  2 | Reflected Cross-Site Scripting (XSS) |   🟠 High   | ✅ Exploited |
|  3 | Stored Cross-Site Scripting (XSS)    |   🟠 High   | ✅ Exploited |
|  4 | Cross-Site Request Forgery (CSRF)    |   🟠 High   | ✅ Exploited |
|  5 | Local File Inclusion (LFI)           |   🟠 High   | ✅ Exploited |
|  6 | Security Headers Analysis            |  🟡 Medium  | ✅ Completed |

> **Note:** Severity classifications are used for educational assessment purposes and may vary depending on application context, exploitability, and business impact.

---

## 🛠️ Tools & Technologies

| Tool / Technology | Purpose                                               |
| ----------------- | ----------------------------------------------------- |
| **DVWA**          | Vulnerable web application used as the testing target |
| **Docker**        | Containerized DVWA deployment                         |
| **Burp Suite**    | HTTP interception, request analysis, and testing      |
| **Firefox**       | Browser-based application testing                     |
| **cURL**          | HTTP header and response analysis                     |
| **Kali Linux**    | Security testing environment                          |

---

## 📁 Repository Structure

```text
Task-3_WebApp_Security/
│
├── Reports/
│   └── Task_3_Security_Testing_Report.pdf
│
├── Screenshots/
│
├── Payloads/
│   ├── sqli_payloads.txt
│   ├── xss_payloads.txt
│   └── csrf_attack.html
│
├── Fixes/
│   ├── prepared_statements.php
│   ├── xss_fix.php
│   ├── csrf_fix.php
│   └── file_inclusion_fix.php
│
├── Config/
│   └── apache_security_headers.conf
│
├── README.md
└── TASK_3_Submissions_Checklist.md
```

> **Note:** The `Screenshots/` directory has been created and is reserved for the evidence collected during the assessment. The screenshot files will be added to this directory as they are captured.

---

# 🚀 Lab Setup

## 1. Start DVWA

DVWA can be launched locally using Docker:

```bash
sudo docker run --rm -it -p 8080:80 vulnerables/web-dvwa
```

Verify that the container is running and access the application through:

```text
http://localhost:8080
```

---

## 2. Login to DVWA

Use the default DVWA credentials:

```text
Username: admin
Password: password
```

---

## 3. Configure Security Level

After logging in:

1. Open **DVWA Security**.
2. Select **Low**.
3. Click **Submit**.

The Low security level is used to demonstrate the underlying vulnerability mechanisms in a controlled environment.

---

# 🔎 Vulnerability Testing

## 1. SQL Injection

### Objective

Test whether user-controlled input is directly incorporated into a database query without appropriate parameterization.

### Example Test Payload

```text
1' OR '1'='1
```

### Result

The application accepted manipulated SQL input and returned unintended database results, demonstrating the presence of a SQL Injection vulnerability.

### Impact

Successful SQL Injection can potentially allow an attacker to:

* Bypass application logic.
* Retrieve unauthorized database information.
* Modify database records.
* Potentially compromise other application functionality.

### Recommended Mitigation

Use **prepared statements / parameterized queries** instead of dynamically constructing SQL queries from user input.

---

## 2. Reflected Cross-Site Scripting (XSS)

### Objective

Determine whether user-supplied input is reflected into an HTTP response without appropriate output encoding.

### Example Test Payload

```html
<script>alert('XSS')</script>
```

### Result

The supplied JavaScript was reflected by the application and executed in the browser.

### Impact

Depending on the application's context, reflected XSS may allow an attacker to:

* Execute arbitrary client-side JavaScript.
* Manipulate page content.
* Perform actions within a victim's browser context.
* Potentially access sensitive browser-accessible information.

### Recommended Mitigation

Implement:

* Context-aware output encoding.
* Input validation.
* Content Security Policy (CSP).
* Secure cookie attributes where appropriate.

---

## 3. Stored Cross-Site Scripting (XSS)

### Objective

Test whether malicious JavaScript submitted through application input is stored and subsequently executed when another user views the affected content.

### Example Test Payload

```html
<script>alert('Stored XSS')</script>
```

### Result

The payload was stored by the application and executed when the affected page was subsequently viewed.

### Impact

Stored XSS is particularly significant because the malicious content can persist within the application and affect multiple users who access the compromised content.

### Recommended Mitigation

Use:

* Context-aware output encoding.
* Strict input validation.
* Content Security Policy.
* Secure application-side handling of stored user content.

---

## 4. Cross-Site Request Forgery (CSRF)

### Objective

Demonstrate how an application that does not adequately verify the origin of state-changing requests can be manipulated into performing an action on behalf of an authenticated user.

### Testing Technique

A controlled HTML form was created to submit a state-changing request to the vulnerable DVWA functionality.

### Result

The application processed the request without requiring an appropriate anti-CSRF token, demonstrating the vulnerability.

### Impact

CSRF can potentially allow an attacker to cause an authenticated user to perform unintended actions, such as:

* Changing account settings.
* Modifying passwords.
* Performing unauthorized transactions.
* Updating sensitive information.

### Recommended Mitigation

Implement:

* Anti-CSRF tokens.
* SameSite cookie protections.
* Origin/Referer validation where appropriate.
* Re-authentication for sensitive operations.

---

## 5. Local File Inclusion (LFI)

### Objective

Test whether user-controlled file paths can be manipulated to access files outside the intended application directory.

### Example Test Payload

```text
../../../../etc/passwd
```

### Result

The application exposed the contents of a sensitive system file, demonstrating insufficient file path validation.

### Impact

LFI may allow unauthorized access to sensitive local files and, depending on the application configuration, may contribute to further compromise.

### Recommended Mitigation

Use:

* Strict file whitelisting.
* Canonical path validation.
* Controlled file identifiers instead of raw file paths.
* Proper filesystem permissions.
* Secure PHP configuration.

---

# 🧪 Burp Suite Testing

Burp Suite was used to inspect and analyze HTTP traffic generated during the assessment.

### Testing Activities

* Intercepted HTTP requests.
* Inspected request parameters.
* Modified request data.
* Analyzed server responses.
* Used Intruder for controlled parameter testing.

Evidence from Burp Suite testing will be stored in the `Screenshots/` directory.

---

# 🔐 Security Headers Analysis

HTTP security headers were reviewed to identify missing or weak browser-side security controls.

### Headers Evaluated

| Header                    | Security Purpose                               |
| ------------------------- | ---------------------------------------------- |
| `X-Frame-Options`         | Helps prevent clickjacking                     |
| `X-Content-Type-Options`  | Prevents MIME-type sniffing                    |
| `Content-Security-Policy` | Restricts permitted content sources            |
| `Referrer-Policy`         | Controls referrer information sent by browsers |

### Recommended Configuration

A sample Apache security-header configuration is provided in:

```text
Config/apache_security_headers.conf
```

---

# 📊 Key Findings

| Vulnerability    | Test Technique                  | Observed Impact                                |
| ---------------- | ------------------------------- | ---------------------------------------------- |
| SQL Injection    | SQL manipulation                | Unauthorized database results                  |
| Reflected XSS    | JavaScript injection            | Script execution in browser                    |
| Stored XSS       | Persistent JavaScript injection | Script execution for subsequent visitors       |
| CSRF             | Crafted state-changing request  | Unauthorized account action                    |
| LFI              | Path traversal                  | Sensitive local file disclosure                |
| Security Headers | HTTP response analysis          | Missing/insufficient browser security controls |

---

# 🛡️ Mitigation Summary

| Vulnerability    | Recommended Mitigation                      |
| ---------------- | ------------------------------------------- |
| SQL Injection    | Prepared statements / parameterized queries |
| Reflected XSS    | Context-aware output encoding + CSP         |
| Stored XSS       | Output encoding + input validation + CSP    |
| CSRF             | Anti-CSRF tokens + SameSite cookies         |
| LFI              | File whitelisting + path validation         |
| Security Headers | Configure appropriate HTTP security headers |

Example mitigation files are available in:

```text
Fixes/
├── prepared_statements.php
├── xss_fix.php
├── csrf_fix.php
└── file_inclusion_fix.php
```

> The files in `Fixes/` are provided as educational examples demonstrating defensive techniques. They are not intended to be drop-in production security solutions without application-specific review and testing.

---

# 📸 Evidence & Screenshots

The `Screenshots/` directory is reserved for screenshots and visual evidence collected during the assessment.

### Planned Evidence

|  # | Evidence                             |
| -: | ------------------------------------ |
| 01 | DVWA setup and configuration         |
| 02 | SQL Injection payload                |
| 03 | SQL Injection results                |
| 04 | Reflected XSS payload                |
| 05 | Reflected XSS alert popup            |
| 06 | Stored XSS entry                     |
| 07 | Stored XSS alert popup               |
| 08 | CSRF attack demonstration            |
| 09 | CSRF password-change result          |
| 10 | Local File Inclusion — `/etc/passwd` |
| 11 | Burp Suite HTTP interception         |
| 12 | Burp Suite Intruder testing          |
| 13 | Security headers analysis            |

### Recommended Naming Convention

```text
Screenshots/
├── 01_dvwa_setup.png
├── 02_sqli_payload.png
├── 03_sqli_results.png
├── 04_xss_reflected_payload.png
├── 05_xss_reflected_popup.png
├── 06_xss_stored_entry.png
├── 07_xss_stored_popup.png
├── 08_csrf_attack.png
├── 09_csrf_password_changed.png
├── 10_lfi_passwd.png
├── 11_burp_intercept.png
├── 12_burp_intruder.png
└── 13_security_headers.png
```

> **Current status:** The `Screenshots/` directory has been created, but the evidence files have not yet been added.

---

# 📝 Deliverables

| Deliverable                  |     Status    |
| ---------------------------- | :-----------: |
| Security Testing Report      |  ✅ Completed  |
| Screenshots Directory        |   ✅ Created   |
| Screenshots / Evidence       | ⏳ To Be Added |
| GitHub Repository            |  ✅ Completed  |
| 8-Minute Demonstration Video |  ✅ Completed  |

---

# 🎬 Demonstration Video

**Demo Video:** `[Add your video link here]`

### Video Timeline

| Time          | Demonstration                |
| ------------- | ---------------------------- |
| `00:00–01:00` | DVWA setup and configuration |
| `01:00–02:30` | SQL Injection                |
| `02:30–04:00` | Reflected + Stored XSS       |
| `04:00–05:30` | CSRF                         |
| `05:30–06:30` | Local File Inclusion         |
| `06:30–07:30` | Burp Suite                   |
| `07:30–08:00` | Findings and recommendations |

---

# 📚 References

* [OWASP Top 10](https://owasp.org/www-project-top-ten/)
* [OWASP SQL Injection Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
* [OWASP Cross Site Scripting Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html)
* [OWASP Cross-Site Request Forgery Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html)
* [OWASP Content Security Policy Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html)
* [OWASP HTTP Headers](https://owasp.org/www-project-secure-headers/)

---

# 👤 Author

**Rohan Patil**

| Field         | Details                           |
| ------------- | --------------------------------- |
| **Intern ID** | ASPL2518045                       |
| **Task**      | Web Application Security — Task 3 |
| **Date**      | 08 August 2026                    |

---

# ⚖️ Legal & Ethical Disclaimer

This project was performed exclusively against **DVWA**, an intentionally vulnerable application deployed in a controlled laboratory environment for educational and security-training purposes.

The techniques demonstrated in this repository must **not** be used against systems, applications, networks, or accounts without explicit authorization from the owner.

The author assumes no responsibility for unauthorized or unlawful use of the information contained in this repository.

---

## 📌 Project Status

**Task 3 — Web Application Security: COMPLETE ✅**

The repository contains the assessment report, payloads, defensive examples, security configuration, and supporting documentation for the controlled DVWA security assessment.

---

**© 2026 Rohan Patil — Web Application Security Assessment**

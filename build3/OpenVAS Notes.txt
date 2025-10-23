OpenVAS (Open Vulnerability Assessment System)

OpenVAS (now part of the Greenbone Vulnerability Management - GVM) is a powerful, enterprise-grade vulnerability scanner that runs deep, intrusive checks.

- Primary Role: Automated, authenticated, and unauthenticated vulnerability testing. It tells you if running services are exploitable.

- Depth: It goes far beyond Nmap by performing checks such as determining if a patch is missing, if an SSL certificate is weak, or if a configuration setting is insecure.

- Key Feature: Uses a large database of Network Vulnerability Tests (NVTs), which are constantly updated to check for the latest CVEs and security flaws.

- Operation: Generally runs as a dedicated server component (the GVM framework) and is controlled via a web interface, which is used for scheduling scans and generating comprehensive reports.

- Reporting: Excellent for compliance and audit, providing detailed reports with severity ratings (High, Medium, Low) and specific mitigation advice for each finding.
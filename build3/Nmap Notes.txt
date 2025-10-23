Nmap (Network Mapper)

Nmap is the industry standard for network discovery and security auditing. It operates at the network and transport layers.

- Primary Role: Host discovery, port scanning, and service version detection. It tells you what is running and where.

- Technique: Uses custom packets (like SYN flags in the popular -sS stealth scan) to map out networks, bypassing basic firewalls and filters.

- Key Feature: The Nmap Scripting Engine (NSE) allows users to write and run thousands of custom scripts for tasks like basic vulnerability detection (--script vuln), brute-forcing, and advanced service enumeration.

- Timing: Highly flexible, using flags like -T4 (Aggressive) to speed up scans or -T0 (Paranoid) to run slowly and stealthily.

- Output: Generates raw text, XML, or grepable output, making it highly suitable for piping into other scripts and tools.
#!/bin/bash

# ============================================
# FIREWALL RULES - Network Security & Scanning
# Task 2: Firewall Basics with iptables
# ============================================
# Author: Jai Bhushan Rane
# Intern ID: ASPL2518045
# Date: 26-07-2026
# Target: Metasploitable 2 (192.168.225.85)
# ============================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}============================================${NC}"
echo -e "${BLUE}    IPTABLES FIREWALL CONFIGURATION        ${NC}"
echo -e "${BLUE}============================================${NC}"
echo ""

# ============================================
# STEP 1: View Current Rules
# ============================================
echo -e "${YELLOW}[1] Viewing Current Firewall Rules...${NC}"
echo -e "${GREEN}Current Rules:${NC}"
sudo iptables -L -v -n
echo ""
echo -e "${GREEN}Current NAT Rules:${NC}"
sudo iptables -t nat -L -v -n
echo ""
echo -e "${GREEN}Current Mangle Rules:${NC}"
sudo iptables -t mangle -L -v -n
echo ""

# ============================================
# STEP 2: Flush All Existing Rules (Start Fresh)
# ============================================
echo -e "${YELLOW}[2] Flushing All Existing Rules...${NC}"
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -t mangle -F
sudo iptables -X
echo -e "${GREEN}✓ All rules flushed!${NC}"
echo ""

# ============================================
# STEP 3: Set Default Policies (DENY by Default)
# ============================================
echo -e "${YELLOW}[3] Setting Default Policies (DENY ALL)...${NC}"
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT
echo -e "${GREEN}✓ Default policies set: INPUT=DROP, FORWARD=DROP, OUTPUT=ACCEPT${NC}"
echo ""

# ============================================
# STEP 4: Allow Established Connections
# ============================================
echo -e "${YELLOW}[4] Allowing Established Connections...${NC}"
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
echo -e "${GREEN}✓ Established/Related connections allowed${NC}"
echo ""

# ============================================
# STEP 5: Allow Localhost (Loopback)
# ============================================
echo -e "${YELLOW}[5] Allowing Localhost (127.0.0.1)...${NC}"
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
echo -e "${GREEN}✓ Localhost traffic allowed${NC}"
echo ""

# ============================================
# STEP 6: Allow Essential Services (SSH - Port 22)
# ============================================
echo -e "${YELLOW}[6] Allowing Essential Services...${NC}"

# Allow SSH (Port 22) - Customize IP as needed
echo -e "${GREEN}Allowing SSH (Port 22)...${NC}"
# Allow from specific IP (replace with your Kali IP)
# sudo iptables -A INPUT -p tcp --dport 22 -s 192.168.225.101 -j ACCEPT

# OR Allow SSH from any IP (for lab environment)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow DNS (Port 53)
echo -e "${GREEN}Allowing DNS (Port 53)...${NC}"
sudo iptables -A INPUT -p tcp --dport 53 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 53 -j ACCEPT

# Allow DHCP (Port 67, 68)
echo -e "${GREEN}Allowing DHCP (Port 67, 68)...${NC}"
sudo iptables -A INPUT -p udp --dport 67 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 68 -j ACCEPT

echo -e "${GREEN}✓ Essential services allowed${NC}"
echo ""

# ============================================
# STEP 7: Block Specific Ports (Demonstration)
# ============================================
echo -e "${YELLOW}[7] Blocking Specific Ports...${NC}"

# Block HTTP (Port 80)
echo -e "${RED}Blocking HTTP (Port 80)...${NC}"
sudo iptables -A INPUT -p tcp --dport 80 -j DROP

# Block Telnet (Port 23)
echo -e "${RED}Blocking Telnet (Port 23)...${NC}"
sudo iptables -A INPUT -p tcp --dport 23 -j DROP

# Block FTP (Port 21)
echo -e "${RED}Blocking FTP (Port 21)...${NC}"
sudo iptables -A INPUT -p tcp --dport 21 -j DROP

# Block vsftpd Backdoor Port (6200)
echo -e "${RED}Blocking vsftpd Backdoor (Port 6200)...${NC}"
sudo iptables -A INPUT -p tcp --dport 6200 -j DROP

echo -e "${GREEN}✓ Ports blocked: 21, 23, 80, 6200${NC}"
echo ""

# ============================================
# STEP 8: Rate Limiting (Prevent Port Scans)
# ============================================
echo -e "${YELLOW}[8] Implementing Rate Limiting...${NC}"

# Allow only 5 SYN connections per minute
sudo iptables -A INPUT -p tcp --syn -m limit --limit 5/min -j ACCEPT
sudo iptables -A INPUT -p tcp --syn -j DROP

echo -e "${GREEN}✓ Rate limiting: 5 SYN connections/minute allowed${NC}"
echo ""

# ============================================
# STEP 9: Block Port Scan Techniques
# ============================================
echo -e "${YELLOW}[9] Blocking Port Scan Techniques...${NC}"

# Block NULL packets (no flags set)
echo -e "${GREEN}Blocking NULL packets...${NC}"
sudo iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Block SYN-FIN packets
echo -e "${GREEN}Blocking SYN-FIN packets...${NC}"
sudo iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

# Block SYN-RST packets
echo -e "${GREEN}Blocking SYN-RST packets...${NC}"
sudo iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

# Block FIN-ACK packets
echo -e "${GREEN}Blocking FIN-ACK packets...${NC}"
sudo iptables -A INPUT -p tcp --tcp-flags FIN,ACK FIN -j DROP

# Block XMAS packets (FIN, URG, PSH flags)
echo -e "${GREEN}Blocking XMAS packets...${NC}"
sudo iptables -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP

echo -e "${GREEN}✓ All port scan techniques blocked${NC}"
echo ""

# ============================================
# STEP 10: Block ICMP (Ping) Requests
# ============================================
echo -e "${YELLOW}[10] Blocking ICMP (Ping) Requests...${NC}"
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
echo -e "${GREEN}✓ ICMP echo-requests blocked${NC}"
echo ""

# ============================================
# STEP 11: Log Dropped Packets (Optional)
# ============================================
echo -e "${YELLOW}[11] Enabling Logging for Dropped Packets...${NC}"
sudo iptables -A INPUT -j LOG --log-prefix "IPTABLES_DROP: " --log-level 4
echo -e "${GREEN}✓ Dropped packet logging enabled${NC}"
echo ""

# ============================================
# STEP 12: Save Rules (Make Persistent)
# ============================================
echo -e "${YELLOW}[12] Saving Rules...${NC}"

# For Debian/Ubuntu/Kali
if [ -d /etc/iptables ]; then
    sudo iptables-save | sudo tee /etc/iptables/rules.v4 > /dev/null
    echo -e "${GREEN}✓ Rules saved to /etc/iptables/rules.v4${NC}"
else
    # Alternative: Save to custom location
    sudo iptables-save > ~/iptables_rules_backup.txt
    echo -e "${GREEN}✓ Rules saved to ~/iptables_rules_backup.txt${NC}"
fi
echo ""

# ============================================
# STEP 13: Display Final Rules
# ============================================
echo -e "${BLUE}============================================${NC}"
echo -e "${BLUE}    FINAL FIREWALL RULES APPLIED           ${NC}"
echo -e "${BLUE}============================================${NC}"
echo ""
sudo iptables -L -v -n --line-numbers
echo ""

# ============================================
# STEP 14: Display Blocked Ports Summary
# ============================================
echo -e "${BLUE}============================================${NC}"
echo -e "${BLUE}    BLOCKED PORTS SUMMARY                  ${NC}"
echo -e "${BLUE}============================================${NC}"
echo -e "${RED}Port 21  (FTP)         → DROPPED${NC}"
echo -e "${RED}Port 23  (Telnet)      → DROPPED${NC}"
echo -e "${RED}Port 80  (HTTP)        → DROPPED${NC}"
echo -e "${RED}Port 6200 (vsftpd Backdoor) → DROPPED${NC}"
echo ""
echo -e "${GREEN}Port 22  (SSH)         → ALLOWED${NC}"
echo -e "${GREEN}Port 53  (DNS)         → ALLOWED${NC}"
echo -e "${GREEN}Port 67/68 (DHCP)      → ALLOWED${NC}"
echo ""

# ============================================
# STEP 15: Test Instructions
# ============================================
echo -e "${BLUE}============================================${NC}"
echo -e "${BLUE}    TESTING INSTRUCTIONS                    ${NC}"
echo -e "${BLUE}============================================${NC}"
echo ""
echo -e "${YELLOW}1. Test SSH Connection:${NC}"
echo "   ssh kali@192.168.225.101"
echo ""
echo -e "${YELLOW}2. Test HTTP (Should FAIL):${NC}"
echo "   curl -v http://192.168.225.85:80"
echo ""
echo -e "${YELLOW}3. Test Nmap Scan (Ports will show FILTERED):${NC}"
echo "   nmap -sS 192.168.225.85"
echo ""
echo -e "${YELLOW}4. Test SYN Flood (Should be rate limited):${NC}"
echo "   sudo hping3 -S -p 80 --flood 192.168.225.85"
echo ""
echo -e "${YELLOW}5. Check Logs:${NC}"
echo "   sudo tail -f /var/log/syslog | grep IPTABLES_DROP"
echo ""

# ============================================
# STEP 16: Restore Rules (If Needed)
# ============================================
echo -e "${YELLOW}To Restore Rules:${NC}"
echo "   sudo iptables-restore < /etc/iptables/rules.v4"
echo ""
echo -e "${YELLOW}To Flush All Rules:${NC}"
echo "   sudo iptables -F"
echo "   sudo iptables -t nat -F"
echo "   sudo iptables -t mangle -F"
echo ""

echo -e "${GREEN}✅ FIREWALL CONFIGURATION COMPLETE!${NC}"
echo -e "${BLUE}============================================${NC}"

# Exit with success
exit 0

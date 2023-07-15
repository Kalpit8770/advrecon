#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m' 
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# This script performs advanced reconnaissance on a target system.
echo 
echo -e "${RED}=================================ADVANCED=========================RECONNAISSANCE=======================================${NC}"
# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run as root.${NC}"
    exit 1
fi

# Prompt the user for the target IP address or domain
echo -e "${CYAN}Enter the target IP address or domain:${NC}"
read -r target

# Perform DNS enumeration using nslookup
echo -e "${GREEN}Performing DNS enumeration...${NC}"
nslookup "$target"

# Perform a TCP port scan using Nmap
echo -e "${GREEN}Performing TCP port scan...${NC}"
nmap -p- "$target"

# Perform a UDP port scan using Nmap
echo -e "${GREEN}Performing UDP port scan...${NC}"
nmap -sU -p- "$target"

# Perform service version detection using Nmap
echo -e "${GREEN}Performing service version detection...${NC}"
nmap -sV "$target"

# Enumerate web directories using dirb
echo -e "${GREEN}Enumerating web directories...${NC}"
dirb "http://$target"

# Enumerate subdomains using sublist3r
echo -e "${GREEN}Enumerating subdomains...${NC}"
sublist3r -d "$target"

# Perform WHOIS lookup
echo -e "${GREEN}Performing WHOIS lookup...${NC}"
whois "$target"

# Perform reverse DNS lookup
echo -e "${GREEN}Performing reverse DNS lookup...${NC}"
host "$target"

# Perform traceroute
echo -e "${GREEN}Performing traceroute...${NC}"
traceroute "$target"

# Perform IP geolocation
echo -e "${GREEN}Performing IP geolocation...${NC}"
curl "ipinfo.io/$target"

# Perform WHOIS lookup for IP range
echo -e "${GREEN}Performing WHOIS lookup for IP range...${NC}"
whois "$(dig +short "$target/cname" | awk -F "." '{print $1"."$2"."$3".0/24"}')"

# Perform SNMP enumeration using snmpwalk
echo -e "${GREEN}Performing SNMP enumeration...${NC}"
snmpwalk -c public -v1 "$target"

# Clean up temporary files or output if necessary
# rm temp_file.txt

echo -e "${RED}Advanced Reconnaissance completed.${NC}"




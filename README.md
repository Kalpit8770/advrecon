# Advance-Recon 
This tool is made to made advance reconnaissance  which is a must needed concept in penetration testing.
---------------------------------------------------------------------------------------------------------------------------------

The script checks if it's being run as the root user using $EUID. Root privileges are often needed for certain reconnaissance tasks. 

The script asks the user to enter the target IP address or domain and stores it in the target variable.

 DNS enumeration is done using the nslookup command to retrieve information about DNS records associated with the target. 
TCP port scanning is performed using nmap with the -p- flag to identify open ports on the target system.

 UDP port scanning is done using nmap with the -sU and -p- flags to scan for open UDP ports.

 Service version detection is carried out using nmap with the -sV flag to determine the version of services running on the target system.

 Web directory enumeration is performed using dirb to discover hidden directories on web servers.

 Subdomain enumeration is done using sublist3r to search for subdomains associated with the target domain.

 WHOIS lookup is performed using the whois command to retrieve registration information about the target.

 Reverse DNS lookup is done using the host command to determine the hostname associated with the target IP address. 
Traceroute is executed using the traceroute command to identify the network path to the target.

 IP geolocation is performed using the curl command to retrieve location information for the target IP address. 

WHOIS lookup for an IP range is done by extracting the IP range using dig and passing it to the whois command.

 SNMP enumeration is carried out using snmpwalk to gather information from SNMP-enabled devices.

 Optional: If you have any temporary files generated during the reconnaissance, you can uncomment the rm command to remove them.

 Finally, the script displays a completion message. Please note that this script provides a starting point for reconnaissance, but it's important to ensure you have proper authorization and adhere to legal and ethical guidelines when conducting security assessments or testing.


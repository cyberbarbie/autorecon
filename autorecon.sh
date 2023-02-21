#!/bin/bash
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
PATH_TO_DIRSEARCH="/home/kali/dirsearch"
TODAY=$(date)
echo "This scan was created on $TODAY"
cat ascii.txt | lolcat
echo "Finding open ports and service versions, directories and subdomains fo>
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY 
nmap -sV -oN $DIRECTORY/nmap $DOMAIN
echo "The results of nmap scan are stored in $DIRECTORY/nmap."
$PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php -o $DIRECTORY/report.txt
echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."
gobuster dns -d $DOMAIN -w /usr/share/seclists/Discovery/DNS/subdomains-top1>
echo "The results of gobuster scan are stored in $DIRECTORY/subdomains."
amass enum -w /usr/share/seclists/Discovery/DNS/subddomains-top1million-2000>
echo "The results of amass scan are stored in $DIRECTORY/amass-enum."
assetfinder $DOMAIN > $DIRECTORY/assetfinder
echo "The results of assetfinder are stored in $DIRECTORY/assetfinder."

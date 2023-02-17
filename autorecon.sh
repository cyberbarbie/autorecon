#!/bin/bash
DOMAIN=$1
DIRECTORY=${DOMAIN}_recon
PATH_TO_DIRSEARCH="/home/kali/dirsearch"
echo "Finding open ports and service versions, directories and subdomains for your target..." 
echo "Creating directory $DIRECTORY."
mkdir $DIRECTORY 
nmap -sV $DOMAIN > $DIRECTORY/nmap
echo "The results of nmap scan are stored in $DIRECTORY/nmap."
touch $Directory/report.txt
$PATH_TO_DIRSEARCH/dirsearch.py -u $DOMAIN -e php -o $DIRECTORY/report.txt
echo "The results of dirsearch scan are stored in $DIRECTORY/dirsearch."
gobuster dns -d $DOMAIN -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt > $DIRECTORY/subdomains
echo "The results of gobuster scan are stored in $Directory/subdomains"
amass enum -w /usr/share/seclists/Discovery/DNS/subddomains-top1million-2000.tx$
echo "The results of amass scan are stored in $DIRECTORY/amass-enum"

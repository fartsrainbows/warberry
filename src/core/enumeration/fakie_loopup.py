#!/usr/bin/env python2.7
#Description: reverse lookup of hosts found on network

import socket

def fakie_ip_lookup(ip):
    if os.path.isfile('../Results/mailcreds'):
        print
        bcolors.WARNING + "[!] Mail Creds Results File Exists. Previous Results will be overwritten\n " + bcolors.ENDC
    with open('../Results/mailcreds', 'w') as mailcreds:
    hostInfo=socket.gethostbyaddr(ip)    #result i wamt hostInfo[2]

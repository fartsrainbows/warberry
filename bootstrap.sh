#!/usr/bin/env bash
# usage: sudo bash warberry/bootstrap.sh

if [ "$(id -u)" != "0" ]; then
	echo "ERROR: Sorry, you are not root. Run this script as root or with sudo."
	exit 1
fi

echo """
        Creating necessary directories...
    """
    mkdir WarBerry
    mv warberry/ WarBerry/
    cd WarBerry
    mkdir Results
    mkdir Tools
    root_dir=$(pwd)

echo """
        Updating Distro...
    """
apt-get update -y


echo """
        Installing necessary tools from apt
    """
apt_app_list="nbtscan python-scapy tcpdump nmap python-nmap python-bluez \
              smbclient samba samba_common_bin unzip python-dev python3-dev \
              libpcap-dev ppp xprobe2 sg3-utils netdiscover macchanger onesixtyone \
              nikto hydra john bridge-utils w3af-console ettercap-text-only cryptcat \
              ike-scan"
apt-get install $apt_app_list -y

echo """
        Installing necessary tools from pip
    """
py_app_list="optparse-pretty netaddr ipaddress subprocess32 pypcap"
pip install $py_app_list

wget http://seclists.org/nmap-dev/2016/q2/att-201/clamav-exec.nse -O /usr/share/nmap/scripts/clamav-exec.nse
wget https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz -O $root_dir/Tools/

cd $root_dir/Tools
tar -zxvf enum4linux-0.8.9.tar.gz
mv enum4linux-0.8.9 enum4linux

echo """
        Cloning some awesome repos...
    """
git clone https://github.com/DanMcInerney/net-creds.git
git clone https://github.com/sqlmapproject/sqlmap.git
git clone https://github.com/CoreSecurity/impacket.git
git clone https://github.com/samratashok/nishang.git
git clone https://github.com/SpiderLabs/Responder.git
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/offensive-security/exploit-database.git
wget https://download.sysinternals.com/files/SysinternalsSuite.zip
unzip SysinternalsSuite.zip -d sysinternals/

echo """
        All done ready to rock...
    """



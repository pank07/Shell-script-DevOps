#!/bin/bash

echo "###⚙ DEVOPS TOOLS INSTALLATION STARTED ###"

# Update repositories
sudo apt update
echo "⚙SYSTEM UPDATE..."

# --------------------
# Docker
# --------------------
sudo apt install -y docker.io
echo "##📦 DOCKER.IO INSTALLED.##"

sudo systemctl enable docker
sudo systemctl start docker
echo "##📦DOCKER SERVICE ENABLED & STARTED##."

# --------------------
# Jenkins (via Debian repo)
# --------------------
sudo apt install -y fontconfig openjdk-17-jre
echo "##☕JAVA RUNTIME INSTALLED FOR JENKINS.##"

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "##🔐 JENKINS GPG KEY ADDED.###"

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
echo "##📚 JENKINS REPOSITORY ADDED##."

sudo apt update
echo "##🧰  REPOSITORY UPDATED (with Jenkins).##"

sudo apt install -y jenkins
echo "##✅  JENKINS INSTALLED.##"

# --------------------
# Java Development Kit
# --------------------
sudo apt install -y default-jdk
echo "##☕ 🔄	DEFAULT-JDK (Java compiler and tools) INSTALLED##."

# --------------------
# pip for Python3
# --------------------
sudo apt install -y python3-pip
echo " ##🐍 PIP for PYTHON 3 INSTALLED##."

# --------------------
# Ansible
# --------------------
sudo apt install -y ansible
echo "##📜ANSIBLE INSTALLED##."

#--------
#Setting timezone and dates
#--------
timedatectl set-timezone Asia/Kolkata
echo ""##🌍 TIME ZONE SET ON +5:30 GMT Asia/Kolkata.##""

echo "###🌐 NETWORK TOOLS INSTALLATION STARTED... ###"

echo "##SYSTEM IS BEING UPDATED##..."
sudo apt update
echo "##🔄	 SYSTEM UPDATED##..."

echo "##INSTALL NETWORKING TOOLS ONE BY ONE##"
sudo apt install -y iproute2
echo "##🧭 🌐 IPROUTE2 (ip, ip r, ss) INSTALLED##."

sudo apt install -y net-tools
echo "##🛰️ NET-TOOLS (ifconfig, netstat) INSTALLED##."

sudo apt install -y iptables
echo "📊 iptables installed."

sudo apt install -y curl
echo "🌐 curl installed."

sudo apt install -y wget
echo "🌐 wget installed."

sudo apt install gping
echo "🌐 gping installed"

sudo apt install -y dnsutils
echo "📡 dnsutils (dig, nslookup) installed."

sudo apt install -y traceroute
echo "🧭 traceroute installed."

sudo apt install -y iputils-ping
echo "📡 ping installed."

sudo apt install bashtop
echo "📊 bashtop installed"
sudo apt install -y nmap
echo "🕵️ nmap installed."

sudo apt install -y lsof
echo "📁 lsof installed."

sudo apt install -y ufw
echo "🛡️ ufw (firewall tool) installed."

sudo apt install -y network-manager
echo "🔄 network-manager (nmcli) installed."

echo "### 📶ALL NETWORK TOOLS INSTALLED SUCCESSFULLY ###"

echo "### ✅ ALL DEVOPS TOOLS INSTALLED SUCCESSFULLY ###"
~
~

#!/bin/bash


echo "###⚙ DEVOPS TOOLS INSTALLATION STARTED ###"

# Update repositories
sudo apt update
echo "⚙  System updated..."

# --------------------
# Docker
# --------------------
sudo apt install -y docker.io
echo "📦 docker.io installed."

sudo systemctl enable docker
sudo systemctl start docker
echo "📦 Docker service enabled and started."

# --------------------
# Jenkins (via Debian repo)
# --------------------
sudo apt install -y fontconfig openjdk-17-jre
echo "☕  Java runtime installed for Jenkins."

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "🔐 Jenkins GPG key added."

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
echo "📚 Jenkins repository added."

sudo apt update
echo "🧰  Repository updated (with Jenkins)."

sudo apt install -y jenkins
echo "✅  Jenkins installed."

# --------------------
# Java Development Kit
# --------------------
sudo apt install -y default-jdk
echo "default-jdk (Java compiler and tools) installed."

# --------------------
# pip for Python3
# --------------------
sudo apt install -y python3-pip
echo " 🐍 pip for Python 3 installed."

# --------------------
# Ansible
# --------------------
sudo apt install -y ansible
echo "📜Ansible installed."



echo "###🌐 NETWORK TOOLS INSTALLATION STARTED... ###"

echo "Update system"
sudo apt update
echo "System updated..."

echo "Install networking tools one by one"
sudo apt install -y iproute2
echo "iproute2 (ip, ip r, ss) installed."

sudo apt install -y net-tools
echo "net-tools (ifconfig, netstat) installed."

sudo apt install -y iptables
echo "iptables installed."

sudo apt install -y curl
echo "curl installed."

sudo apt install -y wget
echo "wget installed."

sudo apt install -y dnsutils
echo "dnsutils (dig, nslookup) installed."

sudo apt install -y traceroute
echo "🧭  traceroute installed."

sudo apt install -y iputils-ping
echo "ping installed."

sudo apt install -y nmap
echo "🕵️ nmap installed."

sudo apt install -y lsof
echo "lsof installed."

sudo apt install -y ufw
echo " 🛡️ ufw (firewall tool) installed."

sudo apt install -y network-manager
echo "network-manager (nmcli) installed."

echo "### 📶ALL NETWORK TOOLS INSTALLED SUCCESSFULLY ###"

echo "### ✅ ALL DEVOPS TOOLS INSTALLED SUCCESSFULLY ###"
~
~

# Install Apache Server
- Update linux Ubuntu(debian-based) system
```bash
sudo apt update
```

suddo apt install apache2 -y
 Sever in 
sudo systemctl enable apache2

sudo systemctl start apache2

# Allow firewall (UFW)
sudo ufw allow "Apache"

sudo ufw enable

sudo ufw status

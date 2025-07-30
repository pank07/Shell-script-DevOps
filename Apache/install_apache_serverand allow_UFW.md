# Install Apache Server
- Update linux Ubuntu(debian-based) system
```bash
sudo apt update
```
- Install Apache server
```bash
sudo apt install apache2 -y
```
- Enable apache server
```bash
sudo systemctl enable apache2
```
- Start apache server
```bash
sudo systemctl start apache2
```
# Allow firewall (UFW)
- Allow UFW for apache
```bash
sudo ufw allow "Apache"
```
- Enable UFW for Apache
```bash
sudo ufw enable
```
- Check status
```bash
sudo ufw status
```

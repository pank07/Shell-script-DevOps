## Install Nginx Server
- Update linux Ubuntu(debian-based) system
```bash
sudo apt update
```
- This installs the NGINX web server from the official Ubuntu repositories.
```bash
sudo apt install nginx -y
```
- Start & enable nginx server
```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```
## Allow nginx through firewall (UFW)
- Allow UFW for apache
```bash
sudo ufw allow "Nginx Full"
```
- Enable UFW for nginx
```bash
sudo ufw enable
```
- Check status
```bash
sudo ufw status
```

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
### Allow firewall (UFW)
- Allow UFW for apache
```bash
sudo ufw allow "Apache"
```
- Enable & check status of UFW for Apache
```bash
sudo ufw enable
sudo ufw status
```

# Below is a full step-by-step guide to *"go live"* with your project on an Apache server (Linux-style).

---

## ✅ STEP-BY-STEP: Deploy Project on Apache Server (Linux)

> 🧭 Assumptions:
>
> * You're using a Linux server (Ubuntu/Debian)
> * Apache is installed
> * Your project is a static website or simple web app (Node/React/etc.)

---

### 🔧 1. **Install Apache Server (If not already)**

```bash
sudo apt update
sudo apt install apache2 -y
```

* Check Apache status:

```bash
sudo systemctl status apache2
```

Should show `active (running)`

---

### 📁 2. **Project Setup: Place Your Project in `/var/www/`**

```bash
sudo mkdir -p /var/www/myproject
sudo cp -r /path/to/your/build/* /var/www/myproject/
```

> If it's a React app, copy the contents of the `/build/` folder.

---

### 🔑 3. **Set Permissions**

```bash
sudo chown -R www-data:www-data /var/www/myproject
sudo chmod -R 755 /var/www/myproject
```

---

### 📝 4. **Create Apache Virtual Host Configuration**

```bash
sudo nano /etc/apache2/sites-available/myproject.conf
```

Paste the following config:

```apache
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName myproject.local
    DocumentRoot /var/www/myproject

    <Directory /var/www/myproject>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/myproject_error.log
    CustomLog ${APACHE_LOG_DIR}/myproject_access.log combined
</VirtualHost>
```

---

### 🔗 5. **Enable Site + Rewrite Module**

```bash
sudo a2ensite myproject.conf
sudo a2enmod rewrite
```
> `a2ensite` command stand for Apache2 Enable Site & its purpose to enables a site’s config file .
`a2enmod` command stand for Apache2 Enable Mod  & its purpose to enables a module like `rewrite`.

---

### 🧹 6. **Disable Default Site (Optional but cleaner)**

```bash
sudo a2dissite 000-default.conf
```
>`a2ensite` enables a virtual host config & Adds symlink to `sites-enabled`
`a2dissite` Disable a virtual host config & Removes symlink from `sites-enabled`

>  This removes the symlink for myproject.conf from the sites-enabled folder, meaning Apache will no longer serve that site after a reload.
---

### 🔄 7. **Restart Apache**

```bash
sudo systemctl reload apache2
```

---

### 🌐 8. **Update Hosts File for Local Testing (Optional)**

If using `myproject.local`, add this to `/etc/hosts`:

```bash
127.0.0.1 myproject.local
```

Then visit: `http://myproject.local`

---

### 🌍 9. **To Host Publicly (Production)**

* Use actual domain instead of `myproject.local`
* Setup DNS A-record → your server's IP
* Update `ServerName` in the `.conf` file

---

### 🔒 10. **Add SSL (Let’s Encrypt - Optional)**

```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```

---

### 🧪 BONUS: Test Page

Create a test index:

```bash
echo "<h1>Deployed Successfully 🎉</h1>" | sudo tee /var/www/myproject/index.html
```

---

## 🎯 Quick Recap:

| Step | What It Does                        |
| ---- | ----------------------------------- |
| 1    | Install Apache                      |
| 2    | Copy your project to web root       |
| 3    | Fix permissions                     |
| 4    | Create virtual host                 |
| 5    | Enable the new config + rewrite mod |
| 6    | (Optional) Disable default site     |
| 7    | Restart Apache                      |
| 8    | (Optional) Use custom local domain  |
| 9    | Host with domain + DNS              |
| 10   | Secure with HTTPS                   |

---


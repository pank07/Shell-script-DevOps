#!/bin/bash

# ----------------------------
# Node Project Nginx Deployment Script
# Author: Mr. Sonwani
# ----------------------------

echo "🚀 Starting Node project deployment to Nginx server..."

# Ask for input details
read -p "Enter Git repository URL: " repo
read -p "Enter your project name (e.g., apcreation): " project
read -p "Enter your project domain (e.g., apcreation.com): " domain
read -p "Enter build folder name (build or dist): " build_folder

# Set paths
WEB_ROOT="/var/www/$project"
NGINX_AVAILABLE="/etc/nginx/sites-available/$project.conf"
NGINX_ENABLED="/etc/nginx/sites-enabled/$project.conf"

echo "📂 Cloning repository..."
git clone "$repo" "/home/pank04/$project" || { echo "❌ Git clone failed!"; exit 1; }

echo "📁 Creating web root directory..."
sudo mkdir -p "$WEB_ROOT"

echo "⚙️ Copying build files..."
if [ -d "/tmp/$project/$build_folder" ]; then
    sudo cp -r "/tmp/$project/$build_folder/"* "$WEB_ROOT/"
else
    echo "❌ Build folder not found. Please check your project structure."
    exit 1
fi

echo "🧾 Creating Nginx configuration..."
sudo tee "$NGINX_AVAILABLE" > /dev/null <<EOF
server {
    listen 80;
    server_name $domain;

    root $WEB_ROOT;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    error_page 404 /index.html;
}
EOF

echo "🔐 Setting permissions..."
sudo chown -R www-data:www-data "$WEB_ROOT"
sudo chmod -R 755 "$WEB_ROOT"

echo "🔗 Enabling Nginx site..."
if [ ! -f "$NGINX_ENABLED" ]; then
    sudo ln -s "$NGINX_AVAILABLE" "$NGINX_ENABLED"
else
    echo "⚠️ Site already enabled, skipping symlink."
fi

echo "🧠 Testing Nginx configuration..."
sudo nginx -t || { echo "❌ Nginx config test failed!"; exit 1; }

echo "♻️ Reloading Nginx..."
sudo systemctl reload nginx

echo "🗺️ Updating /etc/hosts..."
if ! grep -q "$domain" /etc/hosts; then
    echo "127.0.0.1 $domain" | sudo tee -a /etc/hosts > /dev/null
else
    echo "⚠️ Domain already exists in /etc/hosts, skipping."
fi

echo "✅ Deployment complete!"
echo "🌐 Try opening http://$domain in your browser."
echo "🕵️‍♀️ To verify: curl -I http://$domain"


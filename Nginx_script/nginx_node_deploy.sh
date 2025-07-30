#!/bin/bash

set -e

LOCALHOST="" #machine_IP
DOMAIN="$LOCALHOST"
PROJECT_NAME="" # Paste your project name
SOURCE_DIR="/home/ubuntu/$PROJECT_NAME"
DEPLOY_DIR="/var/www/$PROJECT_NAME"
NGINX_CONF="/etc/nginx/sites-available/$PROJECT_NAME"
LINK_DIR="/etc/nginx/sites-enabled/$PROJECT_NAME"
USER="www-data"


echo "👉 ### INSTALLING "$PROJECT_NAME" NODE.JS PROJECT DEPENDENCIES ###"


cd "$SOURCE_DIR"
npm install

echo "🏗️ ### BUILDING THE PROJECT ###...."
npm run build

echo "Check if /build folder or dist folder"
if [ -d "$SOURCE_DIR/build" ]; then
BUILD_DIR="$SOURCE_DIR/build"
echo "📁 Found build directory: $BUILD_DIR"
echo "⚙ Running deployment for build folder..."

elif [ -d "$SOURCE_DIR/dist" ]; then
BUILD_DIR="$SOURCE_DIR/dist"
echo "📁Found build directory: $BUILD_DIR"
echo "⚙ Running deployment for dist folder..."

else
        echo " Neither 'build' or 'dist' folder found in $SOURCE_DIR"
                exit 1
                fi
                echo "build createtd !"

echo "🚚 ### MOVING BUILD/DIST/{Modified files} FILES TO $DEPLOY_DIR..."
sudo mkdir -p "$DEPLOY_DIR"
sudo rm -rf "$DEPLOY_DIR"/*
sudo cp -r "$BUILD_DIR"/* "$DEPLOY_DIR"

echo "🔐 ### SETTING OWNERSHIP & PERMISSIONS ...###"
sudo chown -R $USER:$USER "$DEPLOY_DIR"
sudo chmod -R 755 "$DEPLOY_DIR"

echo "📝 ### CREATING NGINX CONFIGURATION...###"
sudo tee "$NGINX_CONF" > /dev/null <<EOF
server {
    listen 80;
    server_name $DOMAIN;

    root $DEPLOY_DIR;
    index index.html;

    location / {
    try_files \$uri /index.html;
               }

    location ~* \.(jpg|jpeg|png|ico|svg|webp|css|js|woff|woff2|ttf|otf)$ {
              expires 30d;
              access_log off;
              try_files \$uri =404;
              }
        }
EOF

        echo "🔗 ### LINKING CONFIG INTO SITES-ENABLED...###"
        sudo ln -sf "$NGINX_CONF" "$LINK_DIR"

        echo "🧪 ### TESTING NGINX CONFIGURATION...###"
        sudo nginx -t

        echo "🔄 ### RELOADING NGINX...###"
        sudo systemctl reload nginx

        echo "✅  ### DEPLOYMENT COMPLETE !###. Visit: http://$DOMAIN"

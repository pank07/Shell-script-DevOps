#!/bin/bash
set -e
echo "Start to Undeployment"
read -p "🌐 Enter project name (used for folder and Nginx config): " PROJECT_NAME
read -p "📁 Enter your project folder name in /home/ubuntu/: " SOURCE_DIR
echo "### REMOVE "$PROJECT_NAME" NGINX SERVER TO DEPLOY ANOTHER ONE...###"

PROJECT_PATH="/etc/nginx/sites-available/$PROJECT_NAME"
LINK_PATH="/etc/nginx/sites-enabled/$PROJECT_NAME"


if [ -f "$PROJECT_PATH" ]; then
        sudo rm -rf "$PROJECT_PATH"
        echo "✅  Project '$PROJECT_NAME' removed . "
 else
        echo "⚠ No Project found at $PROJECT_PATH. Nothing to remove."
fi



if [ -L "$LINK_PATH" ]; then
        sudo rm -rf "$LINK_PATH"
        echo "✅  Soft link '$PROJECT_NAME' removed . "
else
        echo "⚠ No symlink found at $LINK_PATH. Nothing to remove."
fi

echo " 🔄 RELOADING NGINX... "
sudo systemctl reload nginx
sudo systemctl restart nginx
sudo systemctl start nginx

echo "✅  DONE!"

#!/bin/bash

echo "🚀 Building the frontend..."
npm run build

echo "📁 Copying build to Apache folder..."
sudo rm -rf /opt/lampp/htdocs/project_name/*
sudo cp -r dist/* /opt/lampp/htdocs/project_name/

echo "🔐 Setting permissions..."
sudo chown -R www-data:www-data /opt/lampp/htdocs/project_name
sudo chmod -R 755 /opt/lampp/htdocs/project_name

echo "✅ Deployment complete! Visit http://localhost/Project_name/"

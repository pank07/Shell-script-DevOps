#!/bin/bash

<<task
Deploy a Django-notes-app and handle the code for error
task

code_clone(){
	echo "cloning the Django-notes-app...."
	git clone https://github.com/pank07/django-notes-app.git
}

install_requirements(){
	echo "installing all dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restarts(){
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudosystemctl restart docker
}

deploy(){
	docker build -t notes-app .
docker run -d -p 8000:8000 notes-app:latest
}

echo "***** DEPLOYMENT STARTED *****"
if ! code_clone; then
	echo "code directory already exists"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "installation failed"
	exit 1
fi

if ! required_restarts; then
	echo "systemfault identified"
	exit 1
fi

deploy

echo "***** DEPLOYMENT DONE *****"

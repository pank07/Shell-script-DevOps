#!/bin/bash

read -p "Entr username: " username

echo "you entered $username"

sudo useradd -m $username

echo "new user is added"

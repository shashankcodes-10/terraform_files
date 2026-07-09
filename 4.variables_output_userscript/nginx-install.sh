#!/bin/bash

sudo apt-get update 
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Nginx installed successfully" | sudo tee /var/www/html/index.html
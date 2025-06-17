#!/bin/bash

# Install required packages
apt update
apt install vim iputils-ping -y

# Install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

echo "WordPress downloaded successfully. Database configuration will happen at runtime."
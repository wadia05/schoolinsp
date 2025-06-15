#!/bin/bash

apt update
apt install vim iputils-ping -y

# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

root@643f0149966f:/# env
HOSTNAME=643f0149966f
WP_U_NAME=wait # user name of the new user
PWD=/
WP_U_PASS=wait000 # user password
DB_USER=insp
HOME=/root
WP_U_EMAIL=wait_0@email.com # user email
WP_U_ROLE=editor # author, editor, Administrator ...
WORDPRESS_DB_HOST="mariadb:3306"
TERM=xterm
DOMAIN_NAME=wait-bab.42.fr# domain name of the website
SHLVL=1
WP_ADMIN_P=admin_p# admin password
WP_ADMIN_E=admin_0@email.com # admin email
WP_ADMIN_N=admin # admin name
DB_NAME=wordpress
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WP_TITLE=wait_insp # website title
DB_ROOT_PASS=0000
DB_PASS=0000
_=/usr/bin/env
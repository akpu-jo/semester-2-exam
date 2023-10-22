#!/bin/bash

#Apache 
sudo apt -y install apache2

sudo service apache2 status
sudo service apache2 start


# Restart Apache
sudo service apache2 restart

#Mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt -y install mysql-server
sudo mysqladmin -uroot -proot create coursework
sudo apt -y install php-mysql

#PHP
sudo apt -y install php
sudo apt -y install php-cli php-xml curl php-mbstring unzip
sudo apt -y install php-curl php-zip
sudo apt -y install libapache2-mod-php
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo composer self-update


# Clone Laravel app from github
cd /var/www/html && rm index.html && sudo git clone https://github.com/laravel/laravel.git .
sudo pwd
composer install
cp .env.example .env
sudo chmod -R ugo+rw storage
php artisan key:generate
composer create-project
php artisan cache:clear
php artisan config:clear
  

# sudo apt -y install composer

#Point apache to public folder
cd .. && sudo cp examwork.conf /etc/apache2/sites-available

# disable default config
sudo a2ensite examwork.conf
sudo a2dissite 000-default.conf
sudo apache2ctl configtest


# Restart Apache
sudo service apache2 restart
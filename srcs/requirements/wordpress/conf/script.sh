#! /bin/bash

sleep 10

wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
cd /var/www && tar -xzf wordpress-6.4.3.tar.gz  && rm wordpress-6.4.3.tar.gz

chmod -R 755 /var/www/wordpress

rm /var/www/wordpress/wp-config.php
wp config create --allow-root --path='/var/www/wordpress' --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST
wp core install --allow-root --path='/var/www/wordpress' --url=$DOMAIN --title=inception --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$ADMIN_EMAIL
wp user create --allow-root --path='/var/www/wordpress' $USER $USER@gmail.com --user_pass=$USER

if [ ! -d /run/php ]; then
    mkdir /run/php 
fi

exec php-fpm7.4 -F

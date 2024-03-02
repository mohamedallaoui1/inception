#! /bin/bash

sleep 10

wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
cd /var/www && tar -xzf wordpress-6.4.3.tar.gz  && rm wordpress-6.4.3.tar.gz

chmod -R 755 /var/www/wordpress

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$MYSQL_HOST/g" /var/www/wordpress/wp-config.php


wp core install --allow-root --path='/var/www/wordpress' --url=$DOMAIN --title=inception --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$ADMIN_EMAIL
wp user create --allow-root --path='/var/www/wordpress' $USER $USER@gmail.com --user_pass=$USER


if [ ! -d /run/php ]; then
    mkdir /run/php 
fi

exec php-fpm7.4 -F

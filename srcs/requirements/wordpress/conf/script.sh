#! /bin/bash

sleep 10

wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
cd /var/www && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz

chmod -R 755 /var/www/wordpress

if [ -f /var/www/wordpress/wp-config.php ]; then
    rm /var/www/wordpress/wp-config.php
fi

wp config create --allow-root --path='/var/www/wordpress' --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --extra-php <<EOF
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_CACHE', true);
EOF
wp core install --allow-root --path='/var/www/wordpress' --url=$DOMAIN --title=inception --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$ADMIN_EMAIL
wp user create --allow-root --path='/var/www/wordpress' $USER $USER@gmail.com --user_pass=$USER

wp plugin install redis-cache --activate --allow-root --path='/var/www/wordpress'

until [ -f /var/www/wordpress/rediscache.bck ]
do
    sleep 1
done

sleep 3
wp redis enable --allow-root --path='/var/www/wordpress'


if [ ! -d /run/php ]; then
    mkdir /run/php 
fi

exec php-fpm7.4 -F

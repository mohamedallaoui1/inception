#! /bin/bash

until mariadb -h mariadb -u $MYSQL_USER -p$MYSQL_PASSWORD -e ";"
do
    sleep 1
done

wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
cd /var/www && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz

chmod -R 755 /var/www/wordpress

if [ ! -f /var/www/wordpress/wp-config.php ]; then

wp config create --allow-root --path='/var/www/wordpress' --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --extra-php <<EOF
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_CACHE', true);
EOF
wp core install --allow-root --path='/var/www/wordpress' --url=$DOMAIN --title=inception --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$ADMIN_EMAIL
wp user create --allow-root --path='/var/www/wordpress' $USER $USER@gmail.com --user_pass=$USER
fi

until [ -f /var/www/wordpress/rediscache.bck ]
do
    sleep 1
done

wp redis enable --allow-root --path='/var/www/wordpress'

mkdir /run/php

exec php-fpm7.4 -F

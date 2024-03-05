#!/bin/bash


until [ -f /var/www/wordpress/wp-config.php ]
do
    sleep 1 
done


chmod -R 777 .
chown -R www-data:www-data .

wp plugin install redis-cache --activate --allow-root --path='/var/www/wordpress'
wp plugin update --all --allow-root --path='/var/www/wordpress'

touch /var/www/wordpress/rediscache.bck

redis-server --protected-mode no
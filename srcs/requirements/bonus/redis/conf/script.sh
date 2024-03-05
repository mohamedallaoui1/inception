#!/bin/bash


until [ -f /var/www/wordpress/wp-config.php ]
do
    sleep 1 
done

wp plugin update --all --allow-root --path='/var/www/wordpress'

touch /var/www/wordpress/rediscache.bck

chown -R www-data:www-data /var/www/wordpress

redis-server --protected-mode no
#! /bin/bash

sleep 10

until mariadb -h "mariadb" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e ";" ; do
            echo "Waiting until connect to MariaDB database..."
        sleep 1
done

echo "Connected succefully to MariaDB database..."

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
    cd /var/www && tar -xzf wordpress-6.4.3.tar.gz  && rm wordpress-6.4.3.tar.gz 
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --path='/var/www/wordpress'
    wp core install --allow-root --path='/var/www/wordpress' --url=$DOMAIN --title=inception --admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD --admin_email=$ADMIN_EMAIL
    wp user create --allow-root --path='/var/www/wordpress' $USER $USER@gmail.com --user_pass=$USER
fi

chmod -R 755 /var/www/wordpress
mkdir /run/php

exec php-fpm7.4 -F



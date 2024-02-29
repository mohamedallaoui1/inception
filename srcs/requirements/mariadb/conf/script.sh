#! /bin/bash

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

chown -R mysql:mysql /var/lib/mysql

service mariadb start

sleep 10

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

exec    mysqld_safe
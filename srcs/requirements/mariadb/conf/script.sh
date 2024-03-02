#! /bin/bash

chown -R mysql:mysql /var/lib/mysql

sed -i "s#bind-address            = 127.0.0.1#bind-address=*#g" /etc/mysql/mariadb.conf.d/50-server.cnf


service mariadb start

sleep 10

mariadb -hlocalhost -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

mariadb -hlocalhost -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb -hlocalhost -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb -hlocalhost -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mariadb -hlocalhost -e "FLUSH PRIVILEGES;"

service mariadb stop

exec    mysqld_safe
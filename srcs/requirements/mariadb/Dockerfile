FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

# RUN sed -i "s#bind-address            = 127.0.0.1#bind-address=*#g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/script.sh		/
COPY conf/50-server.cnf		/etc/mysql/mariadb.conf.d/

RUN chmod 755 /script.sh

CMD ["./script.sh"]
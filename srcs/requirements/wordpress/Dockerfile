FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y php7.3 \
    wget \
	php-fpm\
	php-mysql\
	mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/script.sh   /

RUN chmod 755 /script.sh

CMD ["./script.sh"]
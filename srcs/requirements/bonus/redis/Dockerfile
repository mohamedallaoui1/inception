FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server && apt-get install -y php-redis wget php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/script.sh   /
COPY conf/redis.conf /etc/redis/redis.conf
RUN chmod 755 /script.sh

WORKDIR /var/www/wordpress

RUN chmod -R 755 /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress


CMD ["/script.sh"]
FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server && apt-get install -y php-redis wget php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf
RUN echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf
RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf

COPY conf/script.sh   /
RUN chmod 755 /script.sh

CMD ["./script.sh"]
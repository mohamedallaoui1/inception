FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install -y php7.4-cli


WORKDIR /var/www/html/
COPY conf/index.html /var/www/html/

CMD ["php", "-S", "0.0.0.0:8000"]

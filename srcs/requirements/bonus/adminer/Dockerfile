FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install php7.4 php7.4-cli php7.4-mysql wget -y

WORKDIR /var/www/html/

RUN wget https://www.adminer.org/latest.php -O index.php

CMD ["php", "-S", "0.0.0.0:9090", "-t", "/var/www/html/"]
FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd php7.4 wget

COPY conf/script.sh   /

RUN chmod 755 /script.sh

CMD ["./script.sh"]
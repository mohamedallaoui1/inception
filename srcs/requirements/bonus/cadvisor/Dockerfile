FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64

RUN mv cadvisor-v0.47.2-linux-amd64 cadvisor && chmod +x cadvisor

CMD ["./cadvisor", "-port=8080"]
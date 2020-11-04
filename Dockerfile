FROM postgres:12.3

RUN apt-get update && apt install curl -y && apt clean
COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY ops/boot.sh /boot.sh
RUN chmod 755 /boot.sh

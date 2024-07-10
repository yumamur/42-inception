FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server

COPY ./conf/redis.conf /usr/local/etc/redis/redis.conf

RUN echo "include /usr/local/etc/redis/redis.conf" >> /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode no", "--appendonly yes"]
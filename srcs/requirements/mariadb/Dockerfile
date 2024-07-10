FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/init.sql /var/www/

RUN service mysql start && mysql < /var/www/init.sql && rm -f /var/www/init.sql;

CMD ["mysqld"]
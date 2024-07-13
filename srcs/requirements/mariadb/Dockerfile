FROM debian:bullseye

EXPOSE 3306

RUN  apt update && apt upgrade -y && apt install -y mariadb-server

COPY ./conf/rm_anonymous_users.sql /docker-entrypoint-initdb.d/

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/init-edit.sh /tmp/init-edit.sh

RUN  chmod +x /tmp/init-edit.sh

ENTRYPOINT  ["/bin/bash", "/tmp/init-edit.sh"]

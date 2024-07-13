#! /bin/bash

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
    service mariadb start

    mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
    mysql -e "CREATE USER IF NOT EXISTS '${DB_USER_USERNAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER_USERNAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
	sleep 3
	mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown
	mysql stop
fi

exec "$@"

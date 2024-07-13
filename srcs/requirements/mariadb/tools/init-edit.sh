#! /bin/bash

if [ ! -d "/var/lib/mariadb/${DB_NAME}" ]; then
	echo "=> An empty or uninitialized MariaDB volume is detected in /var/lib/mysql"
    service mariadb start

	sed -i "s/DB_ROOT_PASSWORD_HERE/${DB_ROOT_PASSWORD}/g" /tmp/init-edit.sh
    mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
    mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER_USERNAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
    mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER_USERNAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
    mariadb -e "FLUSH PRIVILEGES;"
    mariadb -e "SET PASSWORD FOR root@localhost = PASSWORD('$DB_ROOT_PASSWORD');"
	sleep 3
	mariadb-admin -u root -p${DB_ROOT_PASSWORD} shutdown
	mariadb stop
fi

exec mariadbd-safe

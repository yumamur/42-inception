#!/bin/sh

if [ -f ./wp-config.php ]
then
	exit 0
fi

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
rm -rf latest.tar.gz
mv wordpress/* .
rm -rf wordpress

sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
cp wp-config-sample.php wp-config.php

wp core install --url=$DOMAIN_NAME \
	--title=$DOMAIN_NAME \
	--admin_user=$WP_USER \
	--admin_password=$WP_PASSWORD \
	--admin_email=$WP_EMAIL \
	--allow-root && \
wp config set WP_CACHE true --allow-root && \
wp config set WP_REDIS_SELECTIVE_FLUSH true --allow-root && \
wp config set WP_REDIS_DATABASE 0 --allow-root && \
wp config set WP_REDIS_HOST redis --allow-root && \
wp config set WP_REDIS_PORT 6379 --raw --allow-root && \
wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root && \
wp config set WP_REDIS_CLIENT phpredis --allow-root && \
wp plugin install redis-cache --activate --allow-root && \
wp plugin update --all --allow-root && \
wp redis enable --allow-root

chown -R www-data:www-data .
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

exec "$@"
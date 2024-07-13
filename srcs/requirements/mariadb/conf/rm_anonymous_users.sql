ALTER USER 'root'@'localhost' IDENTIFIED BY 'DB_ROOT_PASSWORD_HERE';
DELETE FROM mysql.user WHERE User='';
UPDATE mysql.user SET Host='localhost' WHERE User='root';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS `wordpress`;
FLUSH PRIVILEGES;

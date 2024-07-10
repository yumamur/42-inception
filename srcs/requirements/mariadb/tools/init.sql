CREATE DATABASE IF NOT EXISTS wp_db DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'igotnoroots';
CREATE USER 'thereisnouser'@'%' IDENTIFIED BY 'nopasswd';
GRANT ALL PRIVILEGES ON wp_db.* TO 'thereisnouser'@'%';
FLUSH PRIVILEGES;
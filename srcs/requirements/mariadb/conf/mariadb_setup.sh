#! /bin/sh

# if mysqld_safe notices that mysqld has crashed, then mysqld_safe will automatically restart mysqld.
# mysqld_safe is the recommended way to start mysqld on Linux and Unix distributions that do not support systemd

# start mysqld and sleep for let mysqld starting
/usr/bin/mysqld -u root & sleep 2

# create if no exist database and user with password in .env
mariadb -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mariadb -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
mariadb -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
mariadb -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';"
mariadb -u root -e "FLUSH PRIVILEGES;"

# change root password
mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

# inject wordpress database only the first time to init tables.
# installation already done for two users : admin and user
# https://www.digitalocean.com/community/tutorials/how-to-migrate-a-mysql-database-between-two-servers
wp_tables=$(mariadb -u root --password=$MYSQL_ROOT_PASSWORD -e "USE $MYSQL_DATABASE; SHOW TABLES;")
if ["$wp_tables" -eq ""]
then
    mariadb -u root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < ./wordpress_db.sql
fi

# restart service in alpine : kill and re-lanch
pkill mariadb
pkill mysqld

# restart mysqld
/usr/bin/mysqld -u root --skip-networking=off

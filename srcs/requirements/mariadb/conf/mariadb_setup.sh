#! /bin/sh

# if mysqld_safe notices that mysqld has crashed, then mysqld_safe will automatically restart mysqld.
# mysqld_safe is the recommended way to start mysqld on Linux and Unix distributions that do not support systemd

#lanch mysql and sleep for lets time to mysql start
/usr/bin/mysqld -u root & sleep 2 ###
# usr/bin/mysqld_safe --datadir=/var/lib/mysql

# create if no exist database and user with password in .env
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
#     CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';\
#     GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; \
#     FLUSH PRIVILEGES;"

 mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
 CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';\
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; \
    FLUSH PRIVILEGES;"

 mysql -u root -e " CREATE USER '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';\
    GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN'@'%'; \
    FLUSH PRIVILEGES;"


# # change root password
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";
# # mysql -u root -e "FLUSH PRIVILEGES;" ###
mysql -u root -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('$MYSQL_ROOT_PASSWORD');"

# restart service in alpine : kill and re-lanch
pkill mysqld
pkill mariadb

# /usr/bin/mysqld -u root 
/usr/bin/mysqld -u root --skip-name-resolve --datadir=/var/lib/mysql --bind_address=0.0.0.0 --port=3306 --skip-networking=off --socket=/var/run/mysqld/mysqld.sock
# usr/bin/mysqld_safe -u root --skip-name-resolve --datadir=/var/lib/mysql --bind_address=0.0.0.0 --port=3306 --skip-networking=off --socket=/var/run/mysqld/mysqld.sock
#! /bin/sh


# initializes the MariaDB data directory and creates the system tables in the mysql database
# start  MariaDB Server's 
# run as root use --user option to indicate the user name that mysqld will run as.
mysql_install_db --user=mysql --datadir=/var/lib/mysql
# mysql_install_db  --user=mysql --datadir=/var/lib/mysql
# RUN 	mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal



# if mysqld_safe notices that mysqld has crashed, then mysqld_safe will automatically restart mysqld.
# mysqld_safe is the recommended way to start mysqld on Linux and Unix distributions that do not support systemd

#lanch mysql and sleep for lets time to mysql start
/usr/bin/mysqld -u root & sleep 2 ###
# usr/bin/mysqld_safe -u root --datadir=/var/lib/mysql

# create if no exist database and user with password in .env
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
#     CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';\
#     GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; \
#     FLUSH PRIVILEGES;"

#  mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
#  CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';\
#     GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; \
#     FLUSH PRIVILEGES;"

# openrc
# touch /run/openrc/softlevel
# /etc/init.d/mariadb setup
# rc-service mariadb start


# mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
# mysql -u root -e "DROP DATABASE test;"
# mysql -u root -e "DELETE FROM mysql.db WHERE Db='test';"
# mysql -u root -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
# mysql -u root $MYSQL_DATABASE < ./wordpress_db.sql

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"


# change root password
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# # # mysql -u root -e "FLUSH PRIVILEGES;" ###
# mysql -u root -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('$MYSQL_ROOT_PASSWORD');"
 
 
 mysql -u root --password=god wordpress_db < ./wordpress_db.sql

# # restart service in alpine : kill and re-lanch
pkill mysqld
pkill mariadb
# # rc-service mariadb restart

/usr/bin/mysqld -u root
/usr/bin/mysqld_safe --datadir=/var/lib/mysql
# /usr/bin/mysqld_safe -u root --skip-name-resolve --datadir=/var/lib/mysql --bind_address=0.0.0.0 --port=3306 --skip-networking=off --socket=/var/run/mysqld/mysqld.sock
# usr/bin/mysqld_safe -u root --skip-name-resolve --datadir=/var/lib/mysql --bind_address=0.0.0.0 --port=3306 --skip-networking=off --socket=/var/run/mysqld/mysqld.sock
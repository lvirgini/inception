#! /bin/sh

# sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
# sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf
# echo "port=3306" >> /etc/my.cnf.d/mariadb-server.cnf ###

#lanch mysql and sleep for lets time to mysql start
/usr/bin/mysqld -u root & sleep 2 ###
# usr/bin/mysqld_safe --datadir=/var/lib/mysql

# create if no exist database and user with password in .env
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
#     CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';\
#     GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'; \
#     FLUSH PRIVILEGES;"

 mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
 CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';\
    GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%'; \
    FLUSH PRIVILEGES;"

# # change root password
# mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";
# # mysql -u root -e "FLUSH PRIVILEGES;" ###
mysql -u root -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('$MYSQL_ROOT_PASSWORD');"

# rc-service mysql restart in alpine
pkill mysqld
pkill mariadb

# /usr/bin/mysqld -u root 
/usr/bin/mysqld -u root --skip-name-resolve --datadir=/var/lib/mysql --bind_address=0.0.0.0 --port=3306 --skip-networking=off --socket=/var/run/mysqld/mysqld.sock
# usr/bin/mysqld_safe -u root --skip-name-resolve --datadir=/var/lib/mysql --bind_address=0.0.0.0 --port=3306 --skip-networking=off --socket=/var/run/mysqld/mysqld.sock
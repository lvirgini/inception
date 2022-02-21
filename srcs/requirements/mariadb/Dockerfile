# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:31 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/21 13:58:58 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 3306
# lien DOCKER wordpress port 3306
# lien VOLUME database
# -------------------------------------------#


FROM alpine:3.14

RUN     apk update -q && apk -q upgrade 
RUN		apk add --no-cache mariadb mariadb-client

RUN     mkdir -p /var/lib/mysql /run/mysqld

# initializes the MariaDB data directory and creates the system tables in the mysql database
	# - start  MariaDB Server's 
	# run as root use --user option to indicate the user name that mysqld will run as.
RUN 	mysql_install_db --user=mysql --datadir=/var/lib/mysql


COPY 	conf/ /
RUN		mv /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

ENTRYPOINT ["sh", "mariadb_setup.sh"]

# CMD ["mysqld_safe", "--skip-networking=off"]




# RUN     apk update -q && apk -q upgrade 
# # RUN     apk add --no-cache mysql mysql-client mariadb-openrc openrc shadow


# RUN     openrc
# RUN     touch /run/openrc/softlevel


# RUN     mkdir -p /var/lib/mysql /run/mysqld
# # RUN		mysql_install_db --user=mysql --datadir=/var/lib/mysql

# RUN     /etc/init.d/mariadb setup
# RUN     /etc/init.d/mariadb start

# COPY  	./mariadb_setup.sh /usr/local/bin/
# RUN		chmod u+x /usr/local/bin/mariadb_setup.sh

# RUN 	rc-update add mariadb default

# # RUN 	mariadb_setup.sh

# # RUN		/usr/sbin/usermod -d /var/lib/mysql mysql

# # RUN mysqld_safe -u root -p


# if mysqld_safe notices that mysqld has crashed, then mysqld_safe will automatically restart mysqld.
# mysqld_safe is the recommended way to start mysqld on Linux and Unix distributions that do not support systemd
# RUN mysql --host 0.0.0.0 --port 3306 -proot -u root
# RUN mysql -e 	"CREATE DATABASE $MYSQL_DATABASE;"

# 			GRANT ALL ON  $MYSQL_DATABASE.* TO '$MYSQL_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;\
# 			FLUSH PRIVILEGES;"

# RUN mysqld_safe -e -h "127.0.0.1" -P 3306
# RUN mysql -e 	"CREATE DATABASE wordpress;"
# ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/run/mysqld/mysqld.sock' (2)

			# GRANT ALL ON wordpress.* TO 'wp_admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
			# FLUSH PRIVILEGES;"


# RUN mysql -e 	"CREATE DATABASE $MYSQL_DATABASE; GRANT ALL ON  $MYSQL_DATABASE.* TO '$MYSQL_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# RUN mysqld_safe -e 	"CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
# 			GRANT ALL ON  $MYSQL_DATABASE.* TO '$MYSQL_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;\
# 			FLUSH PRIVILEGES;"

# RUN mysqld_safe -e 	"CREATE DATABASE $MYSQL_DATABASE; \
# 			GRANT ALL ON  $MYSQL_DATABASE.* TO '$MYSQL_USER'@'$DOMAIN_NAME' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;\
# 			FLUSH PRIVILEGES;"
# RUN echo	"configuration mysql DONE"

# CMD ["/usr/bin/mysqld" , "--user=mysql" ,"--console" ,"--skip-name-resolve", "--skip-networking=0"]

# RUN mysqld_safe -u root -p
# RUN mysql -e "CREATE DATABASE wordpressi;"

# # ENTRYPOINT [ "/usr/local/bin/mariadb_setup.sh" ]
# CMD ["mysqld_safe", "--skip-networking=off"]
# # CMD ["mysqld_safe"]
# # CMD ["mysqld_safe", "--datadir=\"/var/lib/mysql\"", "--skip-networking=off"]
# # CMD ["mysqld_safe", "--datadir='/var/lib/mysql", "--skip-networking=off"]

# EXPOSE  3306
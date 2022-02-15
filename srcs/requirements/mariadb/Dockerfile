# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:31 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/15 00:34:53 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 3306
# lien DOCKER wordpress port 3306
# lien VOLUME database
# -------------------------------------------#

FROM alpine:3.14

# VOLUME [ “/sys/fs/cgroup” ]
# VOLUME ["/var/lib/mysql"]

# RUN   apk add openrc // for rc-service but dont work ?
RUN     apk update -q && apk -q upgrade 
# RUN     apk add --no-cache mariadb mariadb-client mariadb-server-utils openrc


RUN     apk add mysql mysql-client mariadb-openrc openrc 
# rsyslog
# # RUN     apk add mariadb mariadb-client wget openrc
#         # php-mbstring php-zip php-gd php-curl php-intl php-soap php-xml php-xmlrpc

RUN     openrc
RUN     touch /run/openrc/softlevel


# # RUN rc-update add rsyslog default\
# #   && mkdir /run/openrc\
# #   && touch /run/openrc/softlevel\
# #   && rc-service rsyslog start

# # RUN     rc-update add mariadb
# RUN     rc-update add mariadb default


RUN     mkdir -p /var/lib/mysql

RUN     /etc/init.d/mariadb setup
# RUN     /etc/init.d/mariadb start



# if mysqld_safe notices that mysqld has crashed, then mysqld_safe will automatically restart mysqld.
# mysqld_safe is the recommended way to start mysqld on Linux and Unix distributions that do not support systemd
# RUN mysqld_safe
RUN mysqld_safe -e 	"CREATE DATABASE $MYSQL_DATABASE; \
			GRANT ALL ON  $MYSQL_DATABASE.* TO '$MYSQL_ROOT'@'$DOMAIN_NAME' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;\
			FLUSH PRIVILEGES;"
# RUN echo	"configuration mysql DONE"

# CMD ["/usr/bin/mysqld" , "--user=mysql" ,"--console" ,"--skip-name-resolve", "--skip-networking=0"]

CMD ["mysqld_safe", "--skip-networking=off"]
# CMD ["mysqld_safe", "--datadir='/var/lib/mysql", "--skip-networking=off"]

EXPOSE  3306
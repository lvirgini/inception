# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:31 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/12 12:50:42 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 3306
# lien DOCKER wordpress port 3306
# lien VOLUME database
# -------------------------------------------#

FROM alpine:3.14

# VOLUME [ “/sys/fs/cgroup” ]
VOLUME ["/var/lib/mysql"]

# RUN   apk add openrc // for rc-service but dont work ?
RUN     apk update -q && apk -q upgrade 
# RUN     apk add --no-cache mariadb mariadb-client mariadb-server-utils openrc


RUN     apk add mysql mysql-client mariadb-openrc wget openrc 
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


RUN     mkdir -p /var/wwww/phpmyadmin/
RUN     mkdir -p /var/lib/mysql
# COPY    config/config.inc.php /var/www/phpmyadmin/

RUN     /etc/init.d/mariadb setup
# RUN     /etc/init.d/mariadb start



# if mysqld_safe notices that mysqld has crashed, then mysqld_safe will automatically restart mysqld.
# mysqld_safe is the recommended way to start mysqld on Linux and Unix distributions that do not support systemd
RUN mysqld_safe
RUN mysqld_safe -e 	"CREATE DATABASE wordpress; \
			GRANT ALL ON wordpress.* TO 'wp_admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;\
			FLUSH PRIVILEGES;"
RUN echo	"configuration mysql DONE"

# CMD ["/usr/bin/mysqld" , "--user=mysql" ,"--console" ,"--skip-name-resolve", "--skip-networking=0"]

CMD ["mysqld_safe", "--skip-networking=off"]

EXPOSE  3306
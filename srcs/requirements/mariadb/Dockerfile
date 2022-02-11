# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:31 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/11 23:33:58 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 3306
# lien DOCKER wordpress port 3306
# lien VOLUME database
# -------------------------------------------#

FROM alpine:3.14


# RUN   apk add openrc // for rc-service but dont work ?
RUN	    apk update -q && apk -q upgrade 
RUN     apk add mysql mysql-client wget openrc
# RUN     apk add mariadb mariadb-client wget openrc
        # php-mbstring php-zip php-gd php-curl php-intl php-soap php-xml php-xmlrpc

RUN     openrc
RUN     touch /run/openrc/softlevel


RUN     rc-update add mariadb
# RUN     rc-update add mariadb default


# RUN     rc-service mariadb status
RUN     mkdir -p /var/wwww/phpmyadmin/
RUN     mkdir -p /var/lib/mysql
COPY    config/config.inc.php /var/www/phpmyadmin/

RUN     /etc/init.d/mariadb setup
RUN     /etc/init.d/mariadb start

# RUN mysql -e 	"CREATE DATABASE wordpress; \
# 			GRANT ALL ON wordpress.* TO 'wp_admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;\
# 			FLUSH PRIVILEGES;"
# RUN echo	"configuration mysql DONE"



EXPOSE  3306
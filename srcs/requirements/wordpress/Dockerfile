# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:52 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/14 23:58:27 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 9000
# lien DOCKER nginx port 9000
# lien DOCKER mariaDB port 3306
# lien VOLUME Wordpress
# -------------------------------------------#

FROM    alpine:3.14

RUN	    apk update && apk upgrade
# RUN	    apk add wget php-fpm php-mysql php-mbstring php-zip php-gd php-curl php-intl  \
# 	php-soap php-xml php-xmlrpc
RUN    apk add wget php-fpm 
# php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml

RUN	    mkdir -p /var/www/


RUN     wget https://fr.wordpress.org/wordpress-5.9-fr_FR.tar.gz && \
        tar -xzf wordpress-5.9-fr_FR.tar.gz -C /var/www/ && \
        rm -rf wordpress-5.9-fr_FR.tar.gz

# RUN     touch /var/www/wordpress/pouet
    #   && \
    # rm /var/www/wordpress/wordpress-5.9-fr_FR.tar.gz

# RUN  chown -R $MYSQL_USER:$MYSQL_USER /var/www/wordpress

# COPY    conf/ /tmp/
# COPY    conf/wordpress.conf   /etc/nginx/http.d/ 
# COPY    conf/default.conf   /etc/nginx/http.d/ 
# RUN     rm /etc/nginx/http.d/default.conf
# RUN     mv /tmp/wordpress.conf /etc/nginx/sites-available/
	# && \
	#     mv conf/wp-config.php /var/www/wordpress/	&& \




EXPOSE  9000

CMD     ["php-fpm7", "--nodaemonize"]
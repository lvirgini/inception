# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:52 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/13 21:41:54 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 9000
# lien DOCKER nginx port 9000
# lien DOCKER mariaDB port 3306
# lien VOLUME Wordpress
# -------------------------------------------#

FROM    alpine:3.14

RUN	    apk update && apk upgrade
RUN	    apk add wget php-fpm

RUN	    mkdir -p /var/www/wordpress


RUN     wget https://fr.wordpress.org/wordpress-5.9-fr_FR.tar.gz && \
        tar -xzf wordpress-5.9-fr_FR.tar.gz -C /var/www/wordpress 

RUN     touch /var/www/wordpress/pouet
    #   && \
    # rm /var/www/wordpress/wordpress-5.9-fr_FR.tar.gz

# RUN  chown -R $MYSQL_USER:$MYSQL_USER /var/www/wordpress

COPY    conf/ /tmp/
COPY    conf/wordpress.conf   /etc/nginx/http.d/ 
# RUN     rm /etc/nginx/http.d/default.conf
# RUN     mv /tmp/wordpress.conf /etc/nginx/sites-available/
	# && \
	#     mv conf/wp-config.php /var/www/wordpress/	&& \




EXPOSE  9000

CMD     ["php-fpm7", "--nodaemonize"]
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:52 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/24 13:53:02 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 9000
# lien DOCKER nginx port 9000
# lien DOCKER mariaDB port 3306
# lien VOLUME Wordpress
# -------------------------------------------#

FROM    alpine:3.14

# -----------------
#	Installation
# -----------------

RUN	apk update && apk upgrade
RUN     apk add --no-cache wget php-fpm php-json php-mysqli php-curl php7-mbstring php-gd php-zlib

# create parent repository
RUN     mkdir -p /var/www/


# -----------------
#	Configuration
# -----------------

# get wordpress and install it into the volume place (var/www/wordpress)
RUN     wget https://fr.wordpress.org/wordpress-5.9.1-fr_FR.tar.gz    && \
        tar -xzf wordpress-5.9.1-fr_FR.tar.gz -C /var/www/            && \
        rm -rf wordpress-5.9.1-fr_FR.tar.gz

# copy config for passing wordpress manual configuration
COPY    conf/wp-config.php /var/www/wordpress/

# replace php configuration (listen to 0.0.0.0:9000, using env)
COPY    conf/www.conf /etc/php7/php-fpm.d/

RUN     chown -R nobody:nobody /var/www/wordpress/ \
        && chmod -R 775 /var/www/wordpress/

# -----------------
#	Initialisation
# -----------------

EXPOSE  9000

CMD     ["php-fpm7", "--nodaemonize"]
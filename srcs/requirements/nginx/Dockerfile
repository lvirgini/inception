# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:18:40 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/09 14:26:40 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 443
# lien avec DOCKER wordpress/php port 9000
# lien avec VOLUME wordpress
# -------------------------------------------#

#  docker build -t inception_nginx .
#  docker run -ti -p 443:443 inception_nginx bash


FROM debian:buster


# -----------------
#	Installation
# -----------------

#	update and install needed packages
RUN 	apt-get -y update && \
		apt-get -y upgrade && \
		apt-get -y install nginx-light openssl


# -----------------
#	Configuration
# -----------------



# CERTIFICAT SSL:

RUN 	openssl req -x509 -nodes -days 1 -newkey rsa:2048 			\
		-keyout etc/ssl/private/inception_key.pem					\
		-out etc/ssl/certs/inception_cert.pem 						\
		-subj "/C=FR/ST=FRANCE/L=PARIS/O=INCEPTION/CN=127.0.0.1"  	&& \
		openssl dhparam -out /etc/nginx/dhparam.pem 1024

# NGINX:
#	remove default nginx.conf and copy my nginx.conf

COPY	conf/ tmp/
RUN 	rm /etc/nginx/nginx.conf etc/nginx/sites-available/default 	&& \
		mv /tmp/nginx.conf etc/nginx/ 								&& \
		mv /tmp/default etc/nginx/sites-available/
	
# RUN		echo "127.0.0.1 $DOMAIN_NAME" >> /etc/hosts
# RUN		echo "127.0.0.1 www.$DOMAIN_NAME" >> /etc/hosts
# RUN		echo "127.0.0.1 test.test" >> /etc/hosts
# RUN		echo "127.0.0.1 www.test.test" >> /etc/hosts

# restart nginx for update configuration
RUN 	service nginx restart

# -----------------
#	Initialisation
# -----------------

CMD	["nginx", "-g", "daemon off;"]

EXPOSE	443


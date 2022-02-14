# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:18:40 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/14 22:54:14 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 443
# lien avec DOCKER wordpress/php port 9000
# lien avec VOLUME wordpress
# -------------------------------------------#

#  docker build -t inception_nginx .
#  docker run -ti -p 443:443 inception_nginx sh

FROM alpine:3.14

# -----------------
#	Installation
# -----------------

#	update and install needed packages

RUN     apk -q update && apk -q upgrade
RUN     apk add -q --no-cache nginx openssl


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

COPY	./conf/wordpress.conf /etc/nginx/http.d/


# Volume Path

RUN 	mkdir -p /var/www/wordpress

# -----------------
#	Initialisation
# -----------------

CMD	["nginx", "-g", "daemon off;"]

EXPOSE	443


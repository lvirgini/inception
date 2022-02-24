# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:18:40 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/24 21:00:40 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# lien avec DOCKER wordpress/php port 9000
# lien avec VOLUME wordpress
# -------------------------------------------#

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

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]



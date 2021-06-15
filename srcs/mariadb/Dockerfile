# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:31 by lvirgini          #+#    #+#              #
#    Updated: 2021/06/15 14:43:17 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 3306
# lien DOCKER wordpress port 3306
# lien VOLUME database
# -------------------------------------------#

FROM debian:buster

RUN	apt-get -y update && apt-get -y upgrade 
#&& \
#	apt-get -y install mariadb-server mariadb-client php-fpm php-mysql \ 
#	php-mbstring php-zip php-gd php-curl php-intl php-soap php-xml php-xmlrpc

RUN echo $(DOMAIN_NAME)
RUN env

EXPOSE  3306
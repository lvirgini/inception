# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:52 by lvirgini          #+#    #+#              #
#    Updated: 2021/06/14 15:37:57 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PORT 9000
# lien DOCKER nginx port 9000
# lien DOCKER mariaDB port 3306
# lien VOLUME Wordpress
# -------------------------------------------#

FROM debian:buster

RUN	apt-get -y update && apt-get -y upgrade && \
	apt-get -y install wget

RUN	mkdir var/www/$(DOMAIN_NAME)







EXPOSE 9000
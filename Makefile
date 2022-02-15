# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/07 11:17:08 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/15 11:08:01 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ----------------- #
#	  VARIABLES		#
# ----------------- #

DIR		= srcs/
NAME	= docker-compose.yml
ENV		= $(DIR).env

DOCKER_COMPOSE = $(DIR)$(NAME)

# ----------------- #
#	  FUNCTIONS		#
# ----------------- #

# service nginx stop
all:	build run

setup:
		bash ./starter.sh

build:	setup
		cd $(DIR) && docker-compose build
		@echo "\n\033[36;1m\033[4;5mDOCKER BUILD : DONE\033[0m\n"


run:
	cd $(DIR) docker-compose up -d
# cd $(DIR) && UID_GID="$$(id -u):$$(id -g)" docker-compose up -d
# cd $(DIR) && docker-compose up -d
# cd $(DIR) && UID_GID=$(UID) docker-compose up -d
# echo "$$(id -u):$$(id -g)"


config:
	cd $(DIR) && docker-compose config



# ----------------- #
# 		CLEAN		#
# ----------------- #

stop:
		cd $(DIR) && docker-compose down


rmi:
		docker rmi -f $$(docker images -a -q)

rm_volume:
		./cleaner.sh

re: 	stop all

clean:	stop rmi rm_volume


.PHONY: all build run bonus stop rm rmi re
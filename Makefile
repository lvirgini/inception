# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/07 11:17:08 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/15 00:08:24 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ----------------- #
#	  VARIABLES		#
# ----------------- #

DIR		= srcs/
NAME	= docker-compose.yml
ENV		= $(DIR).env


# set same ids for container user and host user
UID_GIDOSEF		= $(shell id -u):$(shell id -g)

DOCKER_COMPOSE = $(DIR)$(NAME)

# ----------------- #
#	  FUNCTIONS		#
# ----------------- #

# service nginx stop
all:	build run

setup:
		bash ./starter.sh

build:	setup
		cd $(DIR) && UID_GID=$(UID_GIDOSEF) docker-compose build
		@echo "\n\033[36;1m\033[4;5mDOCKER BUILD : DONE\033[0m\n"


run:
	cd $(DIR) && UID_GID=$(UID_GIDOSEF) docker-compose up -d



config:
	cd $(DIR) && docker-compose config



# ----------------- #
# 		CLEAN		#
# ----------------- #

stop:
		cd $(DIR) && docker-compose down


rm:
		docker rm $$(docker ps -a -q)

rmi:
		docker rmi -f $$(docker images -a -q)



re: 	stop all

clean:	stop
		./cleaner.sh

# build_old:	
# 		docker-compose -f $(DOCKER_COMPOSE) build 
# 		@echo "\n\033[36;1m\033[4;5mDOCKER BUILD : DONE\033[0m\n"
# run_old:
# 		docker-compose -f $(DOCKER_COMPOSE)  up -d
# config_old:
# 		docker-compose -f $(DOCKER_COMPOSE) config
# bonus: 	all
# stop_old:
# 		docker-compose -f $(DOCKER_COMPOSE) down


.PHONY: all build run bonus stop rm rmi re
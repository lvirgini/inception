# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/07 11:17:08 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/09 14:55:10 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ----------------- #
#	  VARIABLES		#
# ----------------- #

DIR		= srcs/
NAME	= docker-compose.yml

DOCKER_COMPOSE = $(DIR)$(NAME)

ENV_FILE = --env-file .env

# ----------------- #
#	  FUNCTIONS		#
# ----------------- #

all:	build run

		# service nginx stop

build: 
		cd $(DIR) && docker-compose build
build_old:	
		docker-compose -f $(DOCKER_COMPOSE) build 
		@echo "\n\033[36;1m\033[4;5mDOCKER BUILD : DONE\033[0m\n"

run:
	cd $(DIR) && docker-compose up -d

run_old:
		docker-compose -f $(DOCKER_COMPOSE)  up -d

config:
	cd $(DIR) && docker-compose config

config_old:
		docker-compose -f $(DOCKER_COMPOSE) config
# bonus: 	all


# ----------------- #
# 		CLEAN		#
# ----------------- #

stop:
		cd $(DIR) && docker-compose down

stop_old:
		docker-compose -f $(DOCKER_COMPOSE) down

rm:
		docker rm $$(docker ps -a -q)

rmi:
		docker rmi -f $$(docker images -a -q)


re: 	stop all

# fclean: rm rmi
# 		docker volume rm $$(docker volume ls)
# 		docker volume prune

# clean: rm


.PHONY: all build run bonus stop rm rmi re
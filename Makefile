# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/07 11:17:08 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/05 12:25:47 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ----------------- #
#	  VARIABLES		#
# ----------------- #

DIR		= srcs/
NAME	= docker-compose.yml

DOCKER_COMPOSE = $(DIR)$(NAME)

ENV_FILE =--env-file srcs/.env

# ----------------- #
#	  FUNCTIONS		#
# ----------------- #

all:	build run

		# service nginx stop
build:	
		docker-compose -f $(DOCKER_COMPOSE) build 
		@echo "\n\033[36;1m\033[4;5mDOCKER BUILD : DONE\033[0m\n"

run:
		docker-compose -f $(DOCKER_COMPOSE) up -d

# bonus: 	all


# ----------------- #
# 		CLEAN		#
# ----------------- #

stop:
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
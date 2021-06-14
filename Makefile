# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/07 11:17:08 by lvirgini          #+#    #+#              #
#    Updated: 2021/06/14 14:33:42 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ----------------- #
#	  FUNCTIONS		#
# ----------------- #

all:	build run

build:	
		docker-compose --env-file .env build
		@echo "\n\033[36;1m\033[4;5mDOCKER BUILD : DONE\033[0m\n"

run:
		docker-compose up

bonus: 	all


# ----------------- #
# 		CLEAN		#
# ----------------- #

clean:	down

down: 
		docker-compose down

stop: 
		docker stop $$(docker ps -a -q)

rm:		stop
		docker rm $$(docker ps -a -q)

rmi:
		docker rmi -f $$(docker images -a -q)

re: 	down all

.PHONY: all clean flcean re rmi rm down run build
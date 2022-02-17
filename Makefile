# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/07 11:17:08 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/17 16:41:35 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# ----------------- #
#	  VARIABLES		#
# ----------------- #

DIR		= srcs/
NAME	= docker-compose.yml


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
	cd $(DIR) && docker-compose up -d


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
		docker volume rm $$(docker volume ls)
		./clean.sh

re: 	stop all

clean:	stop rmi rm_volume



.PHONY: all setup build run stop rmi rm_volume re
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lvirgini <lvirgini@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 12:19:31 by lvirgini          #+#    #+#              #
#    Updated: 2022/02/24 21:09:44 by lvirgini         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# link DOCKER wordpress port 3306
# link VOLUME database
# -------------------------------------------#

FROM alpine:3.14

# -----------------
#	Installation
# -----------------

RUN     apk update -q && apk -q upgrade 
RUN		apk add --no-cache mariadb mariadb-client openrc

# -----------------
#	Configuration
# -----------------

# create directory for lanch mysqld and for volume
RUN     mkdir -p /var/lib/mysql /run/mysqld
RUN		chown -R mysql:mysql /var/lib/mysql /run/mysqld

# copy configuration files for mariadb and script
COPY 	conf/ /
RUN		mv mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN     chmod +x mariadb_setup.sh

# initializes the MariaDB data directory and creates the system tables in the mysql database
    # start  MariaDB Server's 
    # run as root use --user option to indicate the user name that mysqld will run as.  
RUN     mysql_install_db --user=mysql --datadir=/var/lib/mysql

# -----------------
#	Initialisation
# -----------------

EXPOSE 3306

ENTRYPOINT ["sh", "mariadb_setup.sh"]
# inception
###   Docker-compose: 
####   Docker-compose: 
1.  first
2.  second

* etoile
    * sous etoile
    > fleche
***
## Docker
https://docs.docker.com/engine/reference/commandline/docker/
* COMMANDS & FLAG
    * special for docker run :
        * `-i` : interactive mode
       * `-d` : run docker in detached mode (background)
       * `-p 80:80` : map port 80 of the host to port 80 in the container
    * ` docker build [OPTIONS] PATH | URL | `
        * `-f [PATH]` : -f flag specify the path to a specific docker (Default is 'PATH/Dockerfile')
        * `--add-host` : Add a custom host-to-IP mapping (host:ip)
        * `--no-cache` : Do not use cache when building the image
    * `docker history [IMAGE]` : show history of an image
    * `docker image`
        * `docker image inspect [IMAGE]` : Display detailed information on one or more images
        * `docker image prune` : remove unused image
    * `docker images` : list of image 
        * `-a` list all images (including intermediate)
    * `docker inspect [id or tag]`
    * `docker port [id]` list port

* DOCKER FILE

***
##   Docker-compose: 

* Compose is a tool for defining and running multi-container Docker applications.
    we use a YAML file to configure an application's sevices.
    with a single commande we can create and start all the services.




***
###   Docker-compose: command line 
docker-compose help
* FLAGS:
    * `-f [location/docker-compose.yml]` : -f flag specify the path to a specific docker-compose.
    *  `--project-directory [PATH]` : specify the working directory
    *   `--env-file [FILE]` : specify the path to a custom environnement file
    * ` -p` specify a project name
    #
* COMMANDES:
    * `build` : build or re-build services
    * `down` : stop and remove containers, networks, images and volumes
    * `up` : create and start containers
    * `start` start containers
    * `restart` : restart containers
    * `stop` : stop containers
    * `ps` : list containers
    * `rm`  : remove stopped containers
    * `images` : list images
    * `images ls` : list local images
    * `rmi` : remove images.
    * `port` : print the public port
    * `logs` : view output from containers
    * 

    * for reset ALL :
        * `stop $(docker ps -a -q)`
        * `rm $(docker ps -a -q)`
        * `rmi $(docker images -a -q)`

***
###  docker-compose.yml:
https://docs.docker.com/compose/compose-file/compose-file-v3/
- extra host : https://stackoverflow.com/questions/58170665/docker-compose-extra-hosts-from-env-file-and-not-from-default-env-file
- volume :
    - https://docs.docker.com/storage/volumes/
    - https://blog.code4hire.com/2018/06/define-named-volume-with-host-mount-in-the-docker-compose-file/
    - https://stackoverflow.com/questions/61071981/docker-compose-volumes-syntax-for-local-driver-to-mount-a-file
* `version: "[NUMBER]"` : version of docker-compose
* `services:` : declare behind all services
* `volumes:` : declare behind all volumes
* `command: [CMD]  or ["CMD", "CMD2"]`: override the default command
* `entrypoint:` : override docker entrypoint
* `build: [PATH]` : can be specified as a string containing a path to the build context;
    * `dockerfile: [name of dockerfile]` : declare an alternate pathfile to build
* `container_name: [NAME]` specify a custom container name
* `depends_on: [list of services]` express dependency between services :
    * docker-compose up starts services in dependency order. (dependency are started before this service)
    * docker-compose up this : automatically includes service's dependencies
    * docker-compose stop : stops services in dependency order.
* `env_file: [FILE]` : add environment variables from a file. can be single or list if list there is a override for the same variable.
* `environment:` add environment variables.
* `expose:` expose ports
* `test: ["CMD", "CMD2"]` :


## docker network
Docker networking allows you to atach a container to as many networks as you like : we can also attach an already running container.
    * `network bridge` : default network driver : 
        * communication between containers

## docker volume
Volume for persisting data. A volume does not increase the size of the containers using it, and the volume’s contents exist outside the lifecycle of a given container.
* `-v path_src:path_dst`
* `docker volume create [NAME]` : create a volume
* `docker volume ls` : list volume
* `docker volume inspect [NAME]` : inspect volume. 
- https://docs.docker.com/storage/bind-mounts/
- https://docs.docker.com/compose/compose-file/compose-file-v3/#volume-configuration-reference

### Alpine

- openrc
    - https://www.cyberciti.biz/faq/how-to-enable-and-start-services-on-alpine-linux/
    - https://github.com/gliderlabs/docker-alpine/issues/437
    - https://stackoverflow.com/questions/65627946/how-to-start-nginx-server-within-alpinelatest-image-using-rc-service-command
- mariadb : 
    - https://mariadb.com/kb/en/mysql_install_db/
    - https://wiki.alpinelinux.org/wiki/MariaDB
    - https://www.librebyte.net/en/data-base/how-to-install-mariadb-on-alpine-linux/
    - https://hub.docker.com/r/linuxserver/mariadb
    - https://github.com/yobasystems/alpine-mariadb
    - https://mariadb.com/kb/en/mysqld_safe/
    - https://www.digitalocean.com/community/tutorials/- - -                            how-to-migrate-a-mysql-database-between-two-servers
    - https://stackoverflow.com/questions/5615717/- how-can-i-store-a-command-in-a-variable-in-a-shell-script
    - https://stackoverflow.com/questions/12931991/mysql-what-does-stand-for-in-host-column-and-how-to-change-users-password
- php :  
    - https://www.cyberciti.biz/faq/how-to-install-php-7-fpm-on-alpine-linux/
- wordpress : 
    - https://wiki.alpinelinux.org/wiki/WordPress
    - https://make.wordpress.org/hosting/handbook/server-environment/
- nginx :
    - https://wiki.alpinelinux.org/wiki/Nginx

### LEMP
- https://tech.osteel.me/posts/docker-for-local-web-development-part-1-a-basic-lemp-stack
- https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
- https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a

### USER
 - https://github.com/docker/compose/issues/4725
 - https://stackoverflow.com/questions/40462189/docker-compose-set-user-and-group-on-mounted-volume
 - https://stackoverflow.com/questions/56844746/how-to-set-uid-and-gid-in-docker-compose
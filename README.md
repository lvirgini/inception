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

## Alpine

- openrc
    - https://www.cyberciti.biz/faq/how-to-enable-and-start-services-on-alpine-linux/
- mariadb : 
    - https://wiki.alpinelinux.org/wiki/MariaDB


## LEMP
- https://tech.osteel.me/posts/docker-for-local-web-development-part-1-a-basic-lemp-stack
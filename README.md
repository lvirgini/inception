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
* FLAGS
* COMMANDS
    * `docker inspect [id or tag]`
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
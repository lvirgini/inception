#!/bin/bash

# get .env for DOMAIN_NAME
source ./srcs/.env

# save PATH to volume data : for sudo rm -rf
PATH_TO_DELETE=/home/$LOGIN/data
echo "remove volume dir: $PATH_TO_DELETE" 
sudo rm -rf $PATH_TO_DELETE

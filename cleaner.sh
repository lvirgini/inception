
docker volume rm WordPress_volume 
 docker volume rm db_volume
PATH_TO_DELETE=/home/$USER/data
echo "delete volume : $PATH_TO_DELETE" 
sudo rm -rf $PATH_TO_DELETE



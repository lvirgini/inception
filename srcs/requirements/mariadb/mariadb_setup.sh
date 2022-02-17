#! /bin/sh

# mysqld_safe -e -h "127.0.0.1" -P 3306
mysqld_safe --skip-networking=off

mysql -e 	"CREATE DATABASE wordpressISTHELASTTOCREATE;"


rc-service mysql restart

mysqld_safe
# mysqld_safe --skip-networking=off
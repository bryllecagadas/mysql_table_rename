#!/bin/bash

#string="www8119_test"
#search="www8119_"
#replace=""
#new=${string/$search/$replace}
#echo $new;
#exit 0;

echo "Enter username:"
read user
echo "Enter password:"
read pass
echo "Enter database:"
read db
echo "Enter search string:"
read search
echo "Enter replace string:"
read replace

mysql -u $user --password=$pass $db -e "SHOW TABLES" -N | grep $search | \
while read a; \
do new=${a/$search/$replace} && \
mysql -u $user --password=$pass $db -e "RENAME TABLE $a to $new"; \
done

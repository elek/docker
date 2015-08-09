#!/bin/bash
if [ ! -f /host/mysql.txt ]; then
  echo "First time start: Reseting mysql databases"
  export DB="host"
  #mysql has to be started this way as it doesn't work to call from /etc/init.d
  sleep 10s
  MYSQL_PASSWORD=`pwgen -c -n -1 12`
  DB_PASSWORD=`pwgen -c -n -1 12`
  #This is so the passwords show up in logs. 
  echo mysql root password: $MYSQL_PASSWORD
  echo $DB password: $DB_PASSWORD
  echo $MYSQL_PASSWORD > /host/mysql.txt
  echo $DB_PASSWORD >> /host/mysql.txt
  chmod 600 /host/mysql.txt

  mysqladmin -u root password $MYSQL_PASSWORD
  mysql -uroot -p$MYSQL_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE $DB; GRANT ALL PRIVILEGES ON $DB.* TO '$DB'@'localhost' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;"
fi


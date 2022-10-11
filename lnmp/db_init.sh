#!/bin/bash
/usr/bin/mysql_install_db --user=mysql
sleep 3
/usr/bin/mysqld_safe &
sleep 3
mysql -e "use mysql; grant all privileges on *.* to '$MARIADB_USER'@'%' identified by '$MARIADB_PASS' with grant option;"
h=$(hostname)
mysql -e "use mysql; update user set password=password('$MARIADB_PASS') where user='$MARIADB_USER' and host='$h';"
mysql -e "flush privileges;"


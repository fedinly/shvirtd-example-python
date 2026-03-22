#!/bin/bash
pw= (cat ./secrets/db_root_pw.txt)
pwb= (cat ./secrets/db_backup_pw.txt)
set -e

mysql -u root -p$pw <<EOSQL

CREATE USER IF NOT EXISTS '$MYSQL_BACKUPER_USER'@'%' IDENTIFIED WITH mysql_native_password BY '$pwb';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_BACKUPER_USER'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
EOSQL

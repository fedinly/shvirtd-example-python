#!/bin/bash
NOW=$(date +"%s_%Y-%m-%d")
#AUTH="--default-authentication-plugin=mysql_native_password"
DB_CNTR_NAME=$(docker ps --format "{{.Names}}" | grep db)
NET_NAME=$(docker network ls --format "{{.Name}}" | grep backend)
MYSQL_ROOT_PASSWORD="YtReWq4321"
MYSQL_BACKUPER_PASSWORD="Sd23gf-d1V"
USERNAME="backup-04"
MYSQL_BACKUP_PASSWORD="QwErTy1234"
DATABASE="virtd"
BACKUP_PATH="/opt/backup"

# Body
docker exec -i ${DB_CNTR_NAME} mysql -uroot -p${MYSQL_ROOT_PASSWORD} < Sample.sql 
if [ ! -d "$BACKUP_PATH" ]; then  
    sudo mkdir -p "$BACKUP_PATH"  
    echo "The directory is created."  
fi 
sudo docker run \
	--rm --entrypoint "" \
	-v ${BACKUP_PATH}:/backup \
	--link="${DB_CNTR_NAME}:db" \
	--network="${NET_NAME}" \
	schnitzler/mysqldump \
	mysqldump --opt -h db --no-tablespaces --default-auth=mysql_native_password -u ${USERNAME} -p${MYSQL_BACKUPER_PASSWORD} "--result-file=/backup/${NOW}.sql" ${DATABASE}

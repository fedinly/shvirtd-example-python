#!/bin/bash
cd /opt
sudo git-force-clone https://github.com/fedinly/shvirtd-example-python.git shvirtd/
cd shvirtd/
if [ "$(docker ps -q -f name=web)" ]; then
        echo "Контейнер web запущен."
        docker compose down --rmi all
        docker compose up -d
    else
        echo "Контейнер web не запущен или не существует."
        docker compose up -d
fi

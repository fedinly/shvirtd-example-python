#!/bin/bash
cd ~
eval (ssh-agent)
ssh-add
git-force-clone git@github.com:fedinly/shvirtd-example-python.git shvirtd/
cd shvirtd
docker compose down --rmi


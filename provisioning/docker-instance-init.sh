#!/bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo yum -y update
sudo yum -y install docker
sudo pip install docker-compose
sudo pip install backports.ssl_match_hostname --upgrade

sudo yum -y install git

sudo service docker start
sudo usermod -a -G docker ec2-user

DD_API_KEY=7cd9fb6b0f70ee5cbc976e57e64848b3 bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)"

touch ec2-init-done.markerfile


#!/bin/bash

/usr/bin/docker run --rm --name RenewCert -v "/home/ubuntu/DockerDeploy/certbot/conf:/etc/letsencrypt" certbot/certbot renew

cd /home/ubuntu/DockerDeploy && /usr/bin/docker compose exec -T nginx nginx -s reload
# paste the following in the crontab 
# 0 8 1 * * /home/ubuntu/DockerDeploy/renew.sh >> /home/ubuntu/DockerDeploy/cron.log 2>&1
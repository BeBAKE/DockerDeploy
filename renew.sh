/usr/bin/docker run --rm --name viv -v "/home/ubuntu/DockerDeploy/certbot/conf:/etc/letsencrypt" certbot/certbot renew

# * * * * * /home/ubuntu/DockerDeploy/renew.sh >> /home/ubuntu/DockerDeploy/cron.log 2>&1
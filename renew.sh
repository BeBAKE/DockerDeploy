/usr/bin/docker run --rm --name viv -v "/home/ubuntu/DockerDeploy/certbot/conf:/etc/letsencrypt" certbot/certbot certificates 2>&1 | /usr/bin/tee -a /home/ubuntu/DockerDeploy/one.txt

# * * * * * /home/ubuntu/DockerDeploy/renew.sh >> /home/ubuntu/DockerDeploy/cron.log 2>&1
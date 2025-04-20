#!/bin/bash

echo "starting docker compose up"
sudo docker compose up -d

echo "copying files"
cat ./nginx/afterSSLnginx.txt > ./nginx/nginx.conf

# Wait for nginx container to be up and healthy
echo "Waiting for nginx to be healthy..."
until sudo docker compose exec nginx nginx -t &>/dev/null; do
  sleep 1
done

echo "nginx is ready, reloading..."
sudo docker compose exec nginx nginx -s reload
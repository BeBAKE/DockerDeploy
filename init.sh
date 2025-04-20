#!/bin/bash

echo "starting docker compose up"
sudo docker compose up -d nginx backend

echo "Waiting for nginx to be healthy..."
until sudo docker compose exec nginx nginx -t &>/dev/null; do
  sleep 1
done

echo "starting certbot now"
docker compose up certbot

echo "copying files"
cat ./nginx/afterSSLnginx.txt > ./nginx/nginx.conf

echo "nginx is ready, reloading..."
sudo docker compose exec nginx nginx -s reload
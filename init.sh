#!/bin/bash

echo "starting docker compose up"
sudo docker compose up -d

echo "copying files"
cat ./nginx/afterSSLnginx.txt > ./nginx/nginx.conf

echo "reloading nginx"
sudo docker compose exec nginx nginx -s reload
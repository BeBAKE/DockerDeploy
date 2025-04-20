sudo docker compose down -v
sudo docker rm $(sudo docker stop $(sudo docker ps -aq ))
sudo docker rmi $(sudo docker images -q)

sudo rm -rf cerbot

echo "events {
    worker_connections 1024;
}

http {
    server_tokens off;
    charset utf-8;

    server {
        listen 80 ;
        server_name test-api.projectlive.me;

        location / {
            proxy_pass http://backend:5500/;
        }

        location /.well-known/acme-challenge/ {
            root /var/www/certbot;
        }
    }

}" > nginx/nginx.conf
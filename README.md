# DockerDeploy

This repository is a **demonstration**, designed to show how to set up NGINX as a reverse proxy with free SSL certificates from Let’s Encrypt, using Docker and Certbot as an ACME on an AWS EC2 instance.

## What is This?

- A hands-on example showing how to combine Docker, NGINX, and Let’s Encrypt for HTTPS on the cloud.
- A companion to [my Medium article](https://medium.com/@bebake/setting-up-nginx-and-lets-encrypt-with-docker-on-aws-ec2-f314648fc9fc), which provides a step-by-step tutorial.

## What’s Inside

- **docker-compose.yml:** Orchestrates NGINX and Certbot containers.
- **nginx/conf.d/:** NGINX configuration examples.
- **Basic renewal and HTTPS setup:** The essentials for obtaining and renewing SSL certificates using Cron.

## How to Use

1. **Read the Article:** Start by reading [the full guide on Medium](https://medium.com/@bebake/setting-up-nginx-and-lets-encrypt-with-docker-on-aws-ec2-f314648fc9fc).
2. **Experiment:** Clone the repo and try the steps for yourself if you want hands-on learning.

## Why I Made This

- To help others get started with similar setups.
- To provide a simple, transparent demonstration.

**Questions or feedback?**  
Comment on the Medium article or open an issue!

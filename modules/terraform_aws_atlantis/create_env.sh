#!/usr/bin/env bash
echo "AWS_ACCESS_KEY=${my_aws_access_key}" > /home/ubuntu/.env
echo "AWS_SECRET_KEY=${my_aws_secret_key}" >> /home/ubuntu/.env
echo "ATLANTIS_GH_USER=${github_user}" >> /home/ubuntu/.env
echo "ATLANTIS_GH_TOKEN=${github_token}" >> /home/ubuntu/.env
echo "ATLANTIS_GH_WEBHOOK_SECRET=${github_webhook_secret}" >> /home/ubuntu/.env
echo "ATLANTIS_REPO_ALLOWLIST='${github_allow_list}'" >> /home/ubuntu/.env
echo "INFRACOST_API_KEY"=${infracost_api_key} >> /home/ubuntu/.env
# Start up the container
docker-compose up -d
# Add certbot to the roots crontab
sudo crontab -l | { cat; echo "0 3 * * * certbot renew"; } | sudo crontab -
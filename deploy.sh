#!/bin/bash
# 1. Navigate to your project folder
cd /home/laezy/shivanishaha.com

# 2. Pull the latest code from the feature branch (as seen in your logs)
git pull origin main

# 3. Build the Angular app
npx ng build --configuration production

# 4. Move files to the NEW specific domain folder
sudo rm -rf /var/www/shivanishaha.com/public_html/*
sudo cp -r dist/shivanishaha.com/browser/* /var/www/shivanishaha.com/public_html/

# 5. Reset permissions
sudo chown -R www-data:www-data /var/www/shivanishaha.com/

echo "Deployment to shivanishaha.com successful at $(date)"

NOTIFY_EMAIL="amaykadakia@gmail.com,shivani24.shaha@gmail.com"
DEPLOY_TIME=$(date)

echo "Deployment to shivanishaha.com test was successful at $DEPLOY_TIME. This is an automated notification" \
  | mail -s "✅ Deploy Successful – shivanishaha.com" $NOTIFY_EMAIL

echo "Deployment to shivanishaha.com successful and API activated at $DEPLOY_TIME"
#!/bin/bash

# 1. Navigate to your project folder
cd /home/laezy/shivanishaha.com

# 2. Pull the latest code from the feature branch (as seen in your logs)
git pull origin feature/angular

# 3. Build the Angular app
npx ng build --configuration production

# 4. Move files to the NEW specific domain folder
# Note: Using your project name 'amaykadakia-portfolio' from previous logs
sudo rm -rf /var/www/shivanishaha.com/public_html/*
sudo cp -r dist/amaykadakia-portfolio/* /var/www/shivanishaha.com/public_html/

# 5. Reset permissions
sudo chown -R www-data:www-data /var/www/shivanishaha.com/

echo "Deployment to shivanishaha.com successful at $(date)"
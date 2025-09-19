#!/bin/bash
set -eux  # safer: exit on error and echo commands

# Retry apt-get to avoid dpkg lock issues during boot
for i in {1..5}; do
  if sudo apt-get update -y && sudo apt-get install -y apache2 awscli curl; then
    break
  fi
  echo "apt-get failed, retrying in 15s..."
  sleep 15
done

# Get instance ID from metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id || echo "unknown")

# Create portfolio page
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 { animation: colorChange 2s infinite; }
  </style>
</head>
<body>
  <h1>Terraform Project Server 1</h1>
  <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
  <p>Welcome to Shoaib's DevOps project -1</p>
</body>
</html>
EOF

# Enable & start Apache
sudo systemctl enable apache2
sudo systemctl restart apache2

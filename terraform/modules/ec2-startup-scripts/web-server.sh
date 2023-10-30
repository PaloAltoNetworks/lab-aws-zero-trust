#!/bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Update hostname for better identification
hostname web-app-server

# Updating yum repositories
yum update -y

# Installing httpd
yum install -y httpd

# Installing php
yum install -y php

# Updating the httpd.conf file for domain name configuration
echo "ServerName 127.0.0.1" >> /etc/httpd/conf/httpd.conf

# Start the httpd service
service httpd start

# Create a static webpage
cat <<EOF > /var/www/html/index.php
<!DOCTYPE html>
<html>
<body>
<h1>Hello, World!</h1>
<p>
<?php
    \$ip_server = \$_SERVER['SERVER_ADDR'];
    echo "From: ".\$ip_server;
?>
</p>
</body>
</html>
EOF

echo "Web Server Setup Complete!!"
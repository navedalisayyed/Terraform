#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
sudo systemctl enable httpd

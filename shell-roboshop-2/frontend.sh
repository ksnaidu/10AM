#!/bin/bash

source ./common.sh
check_root

dnf module disable nginx -y 
VALIDATE $? "Disabling default nginx"

dnf module enable nginx:1.24 -y
VALIDATE $? "Enabling nginx:1.24"

dnf install nginx -y 
VALIDATE $? "Installing nginx"

systemctl enable nginx
systemctl start nginx
VALIDATE $? "Starting nginx"

rm -rf /usr/share/nginx/html/* 
VALIDATE $? "Removing default content"

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
VALIDATE $? "Downloading frontend"

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip
VALIDATE $? "Unzipping frontend"

rm -rf /etc/nginx/nginx.conf
VALIDATE $? "Removing default nginx.conf"

cp $SCRIPT_DIR/nginx.conf /etc/nginx/nginx.conf
VALIDATE $? "Copying nginx.conf"

systemctl restart nginx
VALIDATE $? "Restarting nginx"

print_time


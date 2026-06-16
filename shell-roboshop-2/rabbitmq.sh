#!/bin/bash

source ./common.sh
app_name=rabbitmq

check_root

echo "Please enter rabbitmq password to setup"
read -s RABBITMQ_PASSWD

cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>>LOG_FILE
VALIDATE $? "Adding Rabbitmq repo"

dnf install rabbitmq-server -y &>>LOG_FILE
VALIDATE $? "Installing Rabbitmq server"

systemctl enable rabbitmq-server &>>LOG_FILE
VALIDATE $? "Enabling Rabbitmq server"

systemctl start rabbitmq-server &>>LOG_FILE
VALIDATE $? "Starting Rabbitmq server"

rabbitmqctl add_user roboshop $RABBITMQ_PASSWD 
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>LOG_FILE

print_time
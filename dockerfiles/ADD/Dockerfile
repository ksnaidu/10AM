FROM almalinux:9
RUN dnf install nginx -y
run rm -rf /usr/share/nginx/html/index.html 
ADD https://raw.githubusercontent.com/ksnaidu/10AM/refs/heads/main/ansible-roboshop-roles.tf/inventory.ini /usr/share/nginx/html/index.html
RUN chmod +r /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]

# FROM debian:bookworm

# RUN apt update &&  && apt install -y nginx && rm -rf /var/lib/apt/lists/*

# COPY /home/wait-bab/data/html/index.html /var/www/html/index.html

# -----------------------------------------------------
FROM debian:bookworm

RUN apt update && apt  install nginx -y && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /var/www/WordPress
# RUN mkdir -p /etc/nginx
RUN mkdir -p /etc/nginx/certs

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./certs /etc/nginx/certs

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
# daemon off is used to run nginx in the foreground, which is required for Docker containers and 
# keep the container running.
# ////////////////////////

# FROM debian:bullseye

# RUN apt update && apt install -y nginx && rm -rf /var/lib/apt/lists/*

# # Set Nginx to serve files from /var/www/html
# COPY ./html /var/www/html
# COPY ./default.conf /etc/nginx/sites-enabled/default

# COPY ./certs/localhost.crt /etc/nginx/certs/nginx.crt
# COPY ./certs/localhost.key /etc/nginx/certs/nginx.key

# # Replace default site config
# #RUN echo 'server { listen 80; root /var/www/html; index index.html; }' > /etc/nginx/sites-enabled/default

# EXPOSE 80 443

# CMD ["nginx", "-g", "daemon off;"]

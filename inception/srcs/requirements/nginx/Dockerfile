
FROM debian:bookworm

RUN apt update && apt  install nginx  openssl -y && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/wait-bab.42.fr.key \
    -out /etc/nginx/ssl/wait-bab.42.fr.crt \
    -subj "/C=MA/ST=MAROC/L=TETOUAN/O=42/OU=1337/CN=wait-bab.42.fr"

# COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./certs /etc/nginx/certs

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

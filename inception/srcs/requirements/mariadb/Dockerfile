FROM debian:bookworm

RUN apt update && \
    apt install -y mariadb-server &&\
    rm -rf /var/lib/apt/lists/*

COPY ./DB_conf.sh  /bin/DB_conf.sh


RUN chmod +x /bin/DB_conf.sh

# EXPOSE 3306

ENTRYPOINT [ "/bin/DB_conf.sh" ]
# CMD ["/bin/DB_conf.sh"]
# daemon off is used to run nginx in the foreground, which is required for Docker containers and 
# keep the container running.

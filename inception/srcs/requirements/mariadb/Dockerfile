FROM debian:bookworm

RUN apt update && \
    apt install -y mariadb-server &&\
    rm -rf /var/lib/apt/lists/*

COPY ./tools/DB_conf.sh  /bin/DB_conf.sh


RUN chmod +x /bin/DB_conf.sh

EXPOSE 3306

ENTRYPOINT [ "/bin/DB_conf.sh" ]

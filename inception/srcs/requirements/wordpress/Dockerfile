FROM debian:bookworm

RUN apt update && \
    apt install -y \
        curl \
        mariadb-client \
        php \
        php-pdo \
        php-mysql \
        php-zip \
        php-gd \
        php-mbstring \
        php-curl \
        php-xml \
        php-pear \
        php-bcmath \
        php-opcache \
        php-json \
        php-cgi && \
    rm -rf /var/lib/apt/lists/*

CMD ["php-fpm7.4", "-F"]

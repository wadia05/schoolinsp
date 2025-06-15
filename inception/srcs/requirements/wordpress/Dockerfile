FROM debian:bookworm

RUN apt update && \
    apt install -y \
        curl \
        wget \
        mariadb-client \
        php \
        php-fpm \
        php-mysql \
        php-mbstring \
        php-xml \
        php-curl \
        php-zip \
        php-gd && \
    rm -rf /var/lib/apt/lists/*

COPY ./install.sh /bin/install.sh

RUN chmod +x /bin/install.sh && \
    /bin/install.sh

# Find the correct PHP-FPM version
CMD ["php-fpm8.2", "-F"]
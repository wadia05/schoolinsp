FROM debian:bookworm

# Install PHP and required packages
RUN apt update && apt install -y \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-gd \
    php8.2-curl \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-zip \
    curl \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# Copy scripts
COPY ./tools/install.sh /bin/install.sh
COPY ./tools/entrypoint.sh /bin/entrypoint.sh

# Make scripts executable and run install
RUN chmod +x /bin/install.sh /bin/entrypoint.sh && \
    /bin/install.sh

# Configure PHP-FPM
RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/' /etc/php/8.2/fpm/pool.d/www.conf

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set working directory
WORKDIR /var/www/html

# Use entrypoint script
ENTRYPOINT ["/bin/entrypoint.sh"]
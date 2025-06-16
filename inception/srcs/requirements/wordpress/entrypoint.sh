#!/bin/bash

# Wait for database to be ready
# echo "Waiting for database to be ready..."
# while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" --silent; do
#     echo "Database not ready yet. Waiting..."
#     sleep 2
# done
wp core download --allow-root
echo "Database is ready. Configuring WordPress..."

# cd /var/www/html

# Check if wp-config.php already exists
if [ ! -f wp-config.php ]; then
    echo "Creating wp-config.php..."
    wp config create \
        --dbname="$WORDPRESS_DB_NAME" \
        --dbuser="$WORDPRESS_DB_USER" \
        --dbpass="$WORDPRESS_DB_PASSWORD" \
        --dbhost="$WORDPRESS_DB_HOST" \
        --allow-root
fi

# Check if WordPress is already installed
if ! wp core is-installed --allow-root 2>/dev/null; then
    echo "Installing WordPress..."
    wp core install \
        --url="https://$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_N" \
        --admin_password="$WP_ADMIN_P" \
        --admin_email="$WP_ADMIN_E" \
        --allow-root

    # Create additional user
    echo "Creating additional user..."
    wp user create "$WP_U_NAME" "$WP_U_EMAIL" \
        --role="$WP_U_ROLE" \
        --user_pass="$WP_U_PASS" \
        --display_name="$WP_U_NAME" \
        --allow-root
fi

# Set proper permissions
chown -R www-data:www-data /var/www/html

echo "WordPress setup complete!"

# Start PHP-FPM
exec php-fpm8.2 -F
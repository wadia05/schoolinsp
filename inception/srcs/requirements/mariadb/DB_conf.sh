#!/bin/bash

echo "edit 127.0.0.1 ----> 0.0.0.0"
sed -i 's/^\(\s*\)bind-address\s*=.*/\1#bind-address = 127.0.0.1/' /etc/mysql/mariadb.conf.d/50-server.cnf
echo "Starting MariaDB setup..."
# Start MariaDB in background
echo "Starting MariaDB daemon..."
mysqld_safe --user=mysql --datadir=/var/lib/mysql &
MYSQLD_PID=$!

echo "Waiting for MariaDB to start..."
for i in {1..30}; do
    if mysqladmin ping --socket=/run/mysqld/mysqld.sock --silent; then
        echo "MariaDB is ready!"
        break
    fi
    if [ $i -eq 30 ]; then
        echo "Failed to start MariaDB"
        exit 1
    fi
    echo "Waiting for MariaDB... ($i/30)"
    sleep 2
done

# Configure database and users
echo "Configuring database and users..."
mysql --socket=/run/mysqld/mysqld.sock << EOF
# -- Set root password and allow remote connections
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;

# -- Create application database and user
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';
FLUSH PRIVILEGES;
EOF

echo "Database configuration completed successfully!"

# Keep MariaDB running in foreground
wait $MYSQLD_PID

#!/usr/bin/env bash

PASSWORD_ROOT=knkA9n7YnzvrDLE
USER=cobranca
DATABASE=cobranca
PASSWORD=C41ZBxAmSLhRZliF

echo "create database $DATABASE;" | mysql -u root -p$PASSWORD_ROOT || true

echo "GRANT ALL PRIVILEGES ON $DATABASE.* TO $USER@localhost IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION;" | mysql -u root -p$PASSWORD_ROOT || true
echo "FLUSH PRIVILEGES;" | mysql -u root -p$PASSWORD_ROOT || true

cat /tmp/dump.sql | mysql -u root -p$PASSWORD_ROOT cobranca
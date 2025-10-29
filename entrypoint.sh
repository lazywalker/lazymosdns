#!/bin/sh

echo "$CRON /app/update" > /etc/crontabs/root

echo "Starting crond ..."
crond

exec "$@"

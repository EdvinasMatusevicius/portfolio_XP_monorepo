#!/bin/sh
set -e

CERT_PATH="/etc/letsencrypt/live/${DOMAIN_NAME}/fullchain.pem"

if [ -f "$CERT_PATH" ]; then
  envsubst '$$SERVER_SERVICE_PORT $$DOMAIN_NAME' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf
else
  envsubst '$$SERVER_SERVICE_PORT $$DOMAIN_NAME' < /etc/nginx/templates/nginx.http.template > /etc/nginx/nginx.conf
fi

exec nginx -g 'daemon off;'

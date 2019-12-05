#!/usr/bin/env sh
set -eu


envsubst '${API_HOST} ${API_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

envsubst '${testsecret} ${API_HOST} ${API_PORT}' < /etc/nginx/conf.d/index.html.template > /usr/share/nginx/html/index.html

exec "$@"

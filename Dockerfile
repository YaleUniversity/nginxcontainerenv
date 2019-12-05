FROM nginx

COPY files/docker-entrypoint.sh /docker-entrypoint.sh

COPY files/index.html.template /etc/nginx/conf.d/index.html.template

COPY files/nginx-default.conf.template /etc/nginx/conf.d/default.conf.template

RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

FROM registry.access.redhat.com/ubi8/nginx-118

ADD ./nginx.conf /etc/nginx/nginx.conf

CMD nginx -g "daemon off;"

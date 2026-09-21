FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN sed -i 's/index index.html/index ventaentradas.html/' /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

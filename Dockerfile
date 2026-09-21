FROM nginx:alpine

# Copiamos todos los archivos del directorio actual dentro del servidor Nginx
COPY . /usr/share/nginx/html

# Renombramos ventaentradas.html a index.html para que Nginx lo cargue por defecto
RUN mv /usr/share/nginx/html/ventaentradas.html /usr/share/nginx/html/index.html

EXPOSE 80

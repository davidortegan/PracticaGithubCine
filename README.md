# Aplicación Cine con Nginx y Docker

## Descripción

Este proyecto contiene una aplicación web sencilla para la gestión y venta de entradas de cine.

La aplicación utiliza:

- HTML.
- CSS.
- JavaScript.
- Imágenes.
- Nginx.
- Docker.

## Archivos principales

- `ventaentradas.html`: página de venta de entradas.
- `ticket.html`: página del ticket.
- `ventaentradas.css`: estilos de la página de venta.
- `ticket.css`: estilos del ticket.
- `ventaEntradas.js`: lógica JavaScript.
- `img/`: imágenes utilizadas por la aplicación.
- `Dockerfile`: instrucciones para crear la imagen Docker.
- `.dockerignore`: archivos excluidos del contexto de Docker.

## Despliegue con Docker

La aplicación se sirve utilizando Nginx dentro de un contenedor Docker.

### Construcción de la imagen

```bash
docker build -t cine-nginx:1.0 .
```

### Ejecución del contenedor

```bash
docker run -d --name cine-nginx -p 8080:80 cine-nginx:1.0
```

El puerto `8080` del ordenador se conecta con el puerto `80` del contenedor.

### Acceso a la aplicación

Una vez iniciado el contenedor, se puede acceder desde el navegador:

```text
http://localhost:8080/ventaentradas.html
```

También está disponible el ticket:

```text
http://localhost:8080/ticket.html
```

## Comprobación del contenedor

Para comprobar que el contenedor está funcionando:

```bash
docker ps
```

Para consultar los registros de Nginx:

```bash
docker logs cine-nginx
```

## Detener el contenedor

```bash
docker stop cine-nginx
```

## Eliminar el contenedor

```bash
docker rm cine-nginx
```

## Resultado

La aplicación queda desplegada mediante Nginx dentro de Docker y puede abrirse desde el navegador utilizando el puerto `8080`.

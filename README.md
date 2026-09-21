# Aplicación Cine con Nginx y Docker

## Descripción

Este proyecto contiene una aplicación web sencilla para la gestión y venta de entradas de cine, desplegada de forma ágil y ligera utilizando contenedores.

La aplicación utiliza:
- HTML5
- CSS3
- JavaScript (ES6)
- Servidor Web Nginx
- Docker

## Archivos principales

- `ventaentradas.html`: página de venta de entradas (se convierte en la página de inicio dentro del contenedor).
- `ticket.html`: página de visualización del ticket generado.
- `ventaentradas.css`: estilos para la taquilla virtual.
- `ticket.css`: diseño y estilos del ticket de compra.
- `ventaEntradas.js`: lógica del negocio (selección de butacas, cálculo de precios, etc.).
- `img/`: directorio con los recursos gráficos de la aplicación.
- `Dockerfile`: manifiesto de instrucciones para automatizar la construcción de la imagen.
- `.dockerignore`: define qué archivos locales se ignoran al construir el contenedor (como la carpeta `.git`).

---

## 🛠️ Guía de Despliegue con Docker

La aplicación se sirve de forma aislada utilizando **Nginx** como servidor web de alto rendimiento dentro de un contenedor Docker.

### 1. Construcción de la imagen
Para compilar nuestra imagen personalizada empaquetando todos los archivos de la aplicación, ejecutamos el siguiente comando en la raíz del proyecto:
```bash
docker build -t cine-nginx .
```
*(Nota: El punto `.` final indica que el archivo Dockerfile se encuentra en el directorio actual).*

### 2. Ejecución del contenedor
Una vez creada la imagen, levantamos el contenedor mapeando el tráfico web:
```bash
docker run -d -p 8080:80 --name cine-nginx cine-nginx
```
* **`-d`**: Ejecuta el contenedor en segundo plano (detached mode).
* **`-p 8080:80`**: El puerto `8080` de la máquina anfitriona se conecta con el puerto `80` (puerto HTTP estándar) del contenedor.
* **`--name cine-nginx`**: Asigna un nombre único al contenedor para facilitar su administración.

### 3. Acceso a la aplicación desde el Cliente
Dado que el `Dockerfile` renombra automáticamente la vista principal a `index.html`, la aplicación se carga inmediatamente de manera limpia desde el navegador web introduciendo:

```text
http://localhost:8080
```

Si deseas acceder directamente a la pantalla del ticket una vez generada la compra, la ruta es:
```text
http://localhost:8080/ticket.html
```

---

## 📊 Comandos de Gestión y Diagnóstico

Para comprobar el estado del contenedor en tiempo real:
```bash
docker ps
```

Para auditar las peticiones HTTP y consultar los registros de Nginx:
```bash
docker logs cine-nginx
```

Para pausar el servidor web sin borrar sus datos:
```bash
docker stop cine-nginx
```

Para arrancar de nuevo el servidor web si estaba detenido:
```bash
docker start cine-nginx
```

Para destruir el contenedor (por ejemplo, para realizar un nuevo despliegue):
```bash
docker rm -f cine-nginx
```

---

## 📋 Justificación de Criterios de Evaluación (RA2)

Este despliegue cumple de forma estricta con los requerimientos técnicos indicados en el **Resultado de Aprendizaje 2**:

* **c) Se han realizado instalaciones monopuesto:** Toda la configuración, pruebas de rendimiento y el entorno de Docker se han validado y ejecutado localmente de forma autónoma en una única estación de trabajo (entorno monopuesto).
* **d) Se han realizado instalaciones cliente/servidor:** Se implementa una arquitectura desacoplada. El contenedor Docker actúa estrictamente como el **Servidor** (ejecutando Nginx en segundo plano y escuchando peticiones en el puerto 80), mientras que el navegador web del sistema operativo actúa como el **Cliente** que solicita y procesa los documentos estáticos.
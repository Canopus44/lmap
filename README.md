# 🚀 Configuración de Entorno LAMP con MongoDB 📦

Bienvenido a las instrucciones de instalación para tu entorno LAMP con MongoDB. Este entorno te permite desarrollar aplicaciones web utilizando Linux, Apache, MongoDB y PHP. Sigue estos pasos para configurar tu entorno de desarrollo.

## Pasos de Instalación

### 1. Clona el Repositorio

Primero, clona este repositorio en tu máquina local:

```bash
git clone https://github.com/Canopus44/LAMP-MongoDB-Dev-Environment.git
cd LAMP-MongoDB-Dev-Environment
```

### 2. Estructura de Directorios

Asegúrate de tener la siguiente estructura de directorios:

```
.
├── bin
├── config
│   ├── php
│   ├── ssl
│   └── vhosts
├── data
│   └── mongo
├── logs
│   ├── apache2
│   └── xdebug
└── www
    └── html
```

Puedes crear esta estructura utilizando el siguiente comando:

```bash
mkdir -p bin/php config/php config/ssl config/vhosts data/mongo logs/apache2 logs/xdebug www/html
```

### 3. Configura el Archivo .env

Edita el archivo `.env` y personaliza las variables según tus preferencias:

```env
# Configuración del proyecto LAMP con MongoDB
COMPOSE_PROJECT_NAME=lamp

# PHP
PHPVERSION=php8

# Directorio de la aplicación PHP
DOCUMENT_ROOT=./www

# Directorios de configuración de Apache
APACHE_DOCUMENT_ROOT=/var/www/html
VHOSTS_DIR=./config/vhosts
APACHE_LOG_DIR=./logs/apache2
PHP_INI=./config/php/php.ini
SSL_DIR=./config/ssl

# Xdebug
XDEBUG_LOG_DIR=./logs/xdebug
XDEBUG_PORT=9003

# MongoDB
MONGO_INITDB_ROOT_USERNAME=admin
MONGO_INITDB_ROOT_PASSWORD=mongo_password
MONGO_INITDB_DATABASE=mongo_db_name

# Puerto de MongoDB
HOST_MACHINE_MONGO_PORT=27017

# Redis
HOST_MACHINE_REDIS_PORT=6379
```

### 4. Inicia el Entorno

Ejecuta el siguiente comando para iniciar el entorno:

```bash
docker-compose up -d
```

¡Tu entorno LAMP con MongoDB ahora está en funcionamiento! Puedes acceder a tu aplicación PHP en [http://localhost](http://localhost) y administrar MongoDB en el puerto `27017`.

## 🛠️ Personalización

- Reemplaza `www/html/index.php` con tu propia aplicación PHP.
- Personaliza las configuraciones de Apache en `config/vhosts`.
- Ajusta las variables de entorno en el archivo `.env` según tus necesidades.

¡Disfruta desarrollando en tu entorno LAMP con MongoDB! 🎉

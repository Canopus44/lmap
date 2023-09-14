# 🚀 Configuración de Entorno LAMP con MongoDB 📦

Bienvenido a las instrucciones de instalación para tu entorno LAMP con MongoDB. Este entorno te permite desarrollar aplicaciones web utilizando Linux, Apache, MongoDB y PHP. Sigue estos pasos para configurar tu entorno de desarrollo.

## Pasos de Instalación

### 1. Clona el Repositorio

Primero, clona este repositorio en tu máquina local:

```bash
git clone https://github.com/Canopus44/lmap
cd lmap
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
├── logs
│   ├── apache2
│   ├── xdebug
|   └── mongo
└── www
    └── html
```

Puedes crear esta estructura utilizando el siguiente comando:

```bash
mkdir -p bin/php config/php config/ssl config/vhosts logs/mongo logs/apache2 logs/xdebug www/html
```

### 3. Configura el Archivo .env

Edita el archivo `.env` y personaliza las variables según tus preferencias:

```env
# Configuración del proyecto LAMP con MongoDB
COMPOSE_PROJECT_NAME=lmap

# PHP
PHPVERSION=php81

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
MONGO_USERNAME=root
MONGO_PASSWORD=example

# Puerto de MongoDB
MONGO_PORT=27017

# Puerto de Mongo-Express
MONGO_EXPRESS_PORT=8081

# Redis
HOST_MACHINE_REDIS_PORT=6379

# Si ya tienes ocupado el puerto 80, debes cambiar este parametro
HOST_MACHINE_UNSECURE_HOST_PORT=80

# Si ya tienes ocupado el puerto 443, debes cambiar este parametro
HOST_MACHINE_SECURE_HOST_PORT=443
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

## Xdebug

Xdebug viene instalado por defecto y su versión depende de la versión de PHP elegida en el archivo `".env"` .

**Versiones de Xdebug:**

PHP <= 7.3: Xdebug 2.X.X

PHP >= 7.4: Xdebug 3.X.X

Para usar Xdebug necesitas habilitar las configuraciones en el archivo `./config/php/php.ini` según la versión de PHP elegida.

Example:

```
# Xdebug 2
#xdebug.remote_enable=1
#xdebug.remote_autostart=1
#xdebug.remote_connect_back=1
#xdebug.remote_host = host.docker.internal
#xdebug.remote_port=9000

# Xdebug 3
#xdebug.mode=debug
#xdebug.start_with_request=yes
#xdebug.client_host=host.docker.internal
#xdebug.client_port=9003
#xdebug.idekey=VSCODE
```

Xdebug en VS Code: debes instalar la extensión "PHP Debug" de Xdebug. Después de instalarla, ve a Debug y crea el archivo de inicio para que tu IDE pueda escuchar y funcionar correctamente.

Example:

**MUY IMPORTANTE:** los `pathMappings` dependen de cómo has abierto la carpeta en VS Code. Cada carpeta tiene su propia configuración de inicio, que puedes ver en  `.vscode/launch.json`

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for Xdebug",
      "type": "php",
      "request": "launch",
      // "port": 9000, // Xdebug 2
      "port": 9003, // Xdebug 3
      "pathMappings": {
        // "/var/www/html": "${workspaceFolder}/www" /// si has abierto VSCODE en la carpeta raíz
        "/var/www/html": "${workspaceFolder}" // si has abierto VSCODE en la carpeta ./www
      }
    }
  ]
}
```

Ahora, crea un punto de interrupción y ejecuta la depuración.

**Tip!** Después de estas configuraciones, es posible que necesites reiniciar el contenedor.

¡Disfruta desarrollando en tu entorno LAMP con MongoDB! 🎉

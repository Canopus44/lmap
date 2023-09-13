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

## Xdebug

Xdebug comes installed by default and it's version depends on the PHP version chosen in the `".env"` file.

**Xdebug versions:**

PHP <= 7.3: Xdebug 2.X.X

PHP >= 7.4: Xdebug 3.X.X

To use Xdebug you need to enable the settings in the `./config/php/php.ini` file according to the chosen version PHP.

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

Xdebug VS Code: you have to install the Xdebug extension "PHP Debug". After installed, go to Debug and create the launch file so that your IDE can listen and work properly.

Example:

**VERY IMPORTANT:** the `pathMappings` depends on how you have opened the folder in VS Code. Each folder has your own configurations launch, that you can view in `.vscode/launch.json`

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
        // "/var/www/html": "${workspaceFolder}/www" // if you have opened VSCODE in root folder
        "/var/www/html": "${workspaceFolder}" // if you have opened VSCODE in ./www folder
      }
    }
  ]
}
```

Now, make a breakpoint and run debug.

**Tip!** After theses configurations, you may need to restart container.

¡Disfruta desarrollando en tu entorno LAMP con MongoDB! 🎉

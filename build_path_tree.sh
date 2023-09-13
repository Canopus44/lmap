mkdir -p bin/${PHPVERSION}
mkdir -p config/php config/ssl config/vhosts
mkdir -p data/mongo
mkdir -p logs/apache2 logs/xdebug
mkdir -p www

# Crea un archivo PHP de ejemplo en www (puedes reemplazarlo con tu propia aplicación)
echo "<?php phpinfo(); ?>" > www/index.php

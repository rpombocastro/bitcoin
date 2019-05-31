# Instalamos curl
echo "Instalamos curl"
sudo apt-get install -y curl

# Copiamos el script a la carpeta local de ejecutables
echo "Copiamos ejecutable para obtener IP Pública"
sudo cp resources/getpublicip.sh /usr/local/bin

# Ponemos como ejecutable
echo "Hacemos ejecutable el fichero"
sudo chmod +x /usr/local/bin/getpublicip.sh

# Instalamos servicio
echo "Copiamos fichero de servicio en carpeta de sistema"
sudo cp resources/getpublicip.service /lib/systemd/system
sudo systemctl daemon-reload

echo "Iniciamos servicio, comprobamos funcionamiento y activamos servicio manualmente"

# Probamos e iniciamos servicio
#
# Probamos (Inicio de prueba)
# sudo systemctl start getpublicip.service
#
# Probamos si funciona:
# cat /run/publicip
#
# Si nos muestra nuestra IP Externa habilitamos
# sudo systemctl enable getpublicip.service

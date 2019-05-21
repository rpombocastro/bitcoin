#Instalamos servicio en carpeta del sistema
sudo cp bitcoind.service /lib/systemd/system
sudo systemctl daemon-reload

# Probamos servicio
sudo systemctl start bitcoind.service
# Si funciona ponemos como activo
# sudo systemctl enable bitcoind.service
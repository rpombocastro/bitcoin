#Instalamos servicio en carpeta del sistema
sudo cp resources/lnd.service /lib/systemd/system
sudo systemctl daemon-reload

# Probamos servicio
# sudo systemctl start lnd.service
# Si funciona ponemos como activo el servicio para que se reinicie 
# sudo systemctl enable lnd.service
# Actualizamos sistema
echo "Actualizamos sistema..."
sudo apt-get update && sudo apt-get upgrade

sudo groupadd bitcoin
sudo useradd -m -g bitcoin -s /bin/bash bitcoin

# Establecemos contraseña para bitcoin
# sudo passwd bitcoin

# Deshabilitamos cuenta para que no se pueda autentificar el usuario bitcoin
sudo passwd --lock bitcoin

# Configuramos seguridad

# Habilitamos Firewall
sudo apt-get install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow 22 

# allow Bitcoin mainnet
sudo ufw allow 8333

# Allow Lightning
sudo ufw allow 9735

sudo ufw enable
sudo systemctl enable ufw
sudo ufw status

# Intalamos/Habilitamos Fail2ban
sudo apt-get install fail2ban


# Configuramos acceso SSH para acceso sin clave
# https://www.tecmint.com/ssh-passwordless-login-with-putty/

# Recordar en reiniciar servicio SSH
# sudo systemctl restart ssh



# Actualizamos sistema
sudo apt-get update && sudo apt-get upgrade

# La distribución debe tener un usuario llamado bitcoin (con sudo)
sudo addgroup bitcoin
sudo adduser bitcoin bitcoin

# Añadimos repositorio de bitcoin
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update

# Instalamos Berkeley DB (v 4.8) -> Debe ser esta versión
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

# Instalamos dependencias
sudo apt-get install -y build-essential autoconf libtool pkg-config libboost-all-dev libssl-dev libevent-dev doxygen libzmqpp-dev

# Descargamos ultima versión de Bitcoin
sudo git clone https://github.com/bitcoin/bitcoin.git /lib/bitcoin

# Carpetas de uso: (MIRAR)
# /lib/bitcoin -> Código y ejecutables de Bitcoin
# /var/lib/bitcoind -> Data + wallets
# /usr/bin -> Ejecutables de bitcoin
# /etc/bitcoin/bitcoin.conf -> Archivo de configuración
# /run/bitcoind/bitcoind.pid -> Archivo PID

# Compilamos e instalamos en la carpeta de binarios
sudo cd /lib/bitcoin
sudo ./autogen.sh
sudo ./configure --with-gui=no
sudo make
sudo cd src
sudo install -sv bitcoind bitcoin-cli /usr/bin

# Creamos carpeta de data y damos acceso
sudo mkdir /var/lib/bitcoind
sudo chown /var/lib/bitcoind bitcoin
sudo chgrp /var/lib/bitcoind bitcoin

# Creamos carpeta del archivo PID
sudo mkdir /run/bitcoind
sudo chown /run/bitcoind bitcoin
sudo chgrp /run/bitcoind bitcoin
touch /run/bitcoind/bitcoind.pid


# Creamos archivo de configuración
sudo mkdir /etc/bitcoin

sudo touch /etc/bitcoin/bitcoin.conf
sudo echo "server=1" >> /etc/bitcoin/bitcoin.conf
sudo echo "daemon=1" >> /etc/bitcoin/bitcoin.conf
sudo echo "zmqpubrawblock=tcp://127.0.0.1:28332" >> /etc/bitcoin/bitcoin.conf
sudo echo "zmqpubrawtx=tcp://127.0.0.1:28333" >> /etc/bitcoin/bitcoin.conf
sudo echo "rpcuser=UNACLAVECOMPLICADA" >> /etc/bitcoin/bitcoin.conf
sudo echo "rpcpassword= UNACLAVECOMPLICADA" >> /etc/bitcoin/bitcoin.conf
sudo echo "txindex=1" >> /etc/bitcoin/bitcoin.conf
sudo echo "listen=1" >> /etc/bitcoin/bitcoin.conf
sudo echo "externalip=NuestraIPExterna" >> /etc/bitcoin/bitcoin.conf
sudo echo "minrelaytxfee=0.00000000" >> /etc/bitcoin/bitcoin.conf
sudo echo "incrementalrelayfee=0.00000010" >> /etc/bitcoin/bitcoin.conf
sudo echo "disablewallet=1" >> /etc/bitcoin/bitcoin.conf




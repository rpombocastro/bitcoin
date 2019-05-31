# Añadimos repositorio de bitcoi
echo "Añadimos repositorio bitcoin"
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update

# Instalamos Berkeley DB (v 4.8) -> Debe ser esta versión
echo "Instalamos Berkeley DB (v 4.8)"
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

# Instalamos dependencias
echo "Instalamos resto de dependendias"
sudo apt-get install -y build-essential autoconf libtool pkg-config libboost-all-dev libssl-dev libevent-dev doxygen libzmqpp-dev

# Descargamos ultima versión de Bitcoin
# sudo git clone https://github.com/bitcoin/bitcoin.git /lib/bitcoin
echo "Descargamos binarios de Bitcoin"
wget https://github.com/bitcoin/bitcoin/archive/v0.18.0.tar.gz
tar -xzvf v0.18.0.tar.gz
sudo mv bitcoin-0.18.0 /lib/bitcoin
rm v0.18.0.tar.gz

# Carpetas de uso: (MIRAR)
# /lib/bitcoin -> Código y ejecutables de Bitcoin
# /var/lib/bitcoind -> Data + wallets
# /usr/bin -> Ejecutables de bitcoin
# /etc/bitcoin/bitcoin.conf -> Archivo de configuración
# /run/bitcoind/bitcoind.pid -> Archivo PID

# Compilamos e instalamos en la carpeta de binarios
echo "Compilamos e instalamos el demonio de bicoin y el cliente"
cd /lib/bitcoin
sudo ./autogen.sh
sudo ./configure --with-gui=no
sudo make
cd src
sudo install -sv bitcoind bitcoin-cli /usr/bin

# Creamos carpeta de data y damos acceso
echo "Configuramos carpeta de data de Bitcoin"
sudo mkdir /var/lib/bitcoind
sudo chown bitcoin /var/lib/bitcoind 
sudo chgrp bitcoin /var/lib/bitcoind 

# Creamos carpeta del archivo PID
sudo mkdir /run/bitcoind
sudo chown bitcoin /run/bitcoind
sudo chgrp bitcoin /run/bitcoind
# 
# sudo chown bitcoin /run/bitcoind/bitcoind.pid
# sudo chgrp bitcoin /run/bitcoind/bitcoind.pid

# Creamos archivo de configuración
echo "Copiamos archivo de configuración"
sudo mkdir /etc/bitcoin
sudo cp resources/bitcoin.conf /etc/bitcoin

echo "Antes de seguir debemos acabar de configurar el archivo de configuración"

# sudo touch /etc/bitcoin/bitcoin.conf
# sudo echo "server=1" >> /etc/bitcoin/bitcoin.conf
# sudo echo "daemon=1" >> /etc/bitcoin/bitcoin.conf
# sudo echo "zmqpubrawblock=tcp://127.0.0.1:28332" >> /etc/bitcoin/bitcoin.conf
# sudo echo "zmqpubrawtx=tcp://127.0.0.1:28333" >> /etc/bitcoin/bitcoin.conf
# sudo echo "rpcuser=UNACLAVECOMPLICADA" >> /etc/bitcoin/bitcoin.conf
# sudo echo "rpcpassword= UNACLAVECOMPLICADA" >> /etc/bitcoin/bitcoin.conf
# sudo echo "txindex=1" >> /etc/bitcoin/bitcoin.conf
# sudo echo "listen=1" >> /etc/bitcoin/bitcoin.conf
# sudo echo "externalip=NuestraIPExterna" >> /etc/bitcoin/bitcoin.conf
# sudo echo "minrelaytxfee=0.00000000" >> /etc/bitcoin/bitcoin.conf
# sudo echo "incrementalrelayfee=0.00000010" >> /etc/bitcoin/bitcoin.conf
# sudo echo "disablewallet=1" >> /etc/bitcoin/bitcoin.conf




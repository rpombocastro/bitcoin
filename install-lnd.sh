#Instalamos git
sudo apt-get install git

#Instalamos Go
echo "Instalamos Go"
wget https://dl.google.com/go/go1.12.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.3.linux-amd64.tar.gz
rm go1.12.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Comprobamos versión de Go
go version

# Instalamos dep para Go
echo "Instalamos dep para Go"
go get -u github.com/golang/dep/cmd/dep
sudo mv go/bin/dep /usr/local/go/bin/
sudo rm -r go

# Comprobamos versión de dep
dep version

# Instalamos Lightning Network
echo "Instalamos lighting network"
wget https://github.com/lightningnetwork/lnd/releases/download/v0.6.1-beta/lnd-linux-amd64-v0.6.1-beta.tar.gz
tar -xvzf lnd-linux-amd64-v0.6.1-beta.tar.gz
rm lnd-linux-amd64-v0.6.1-beta.tar.gz
mv lnd-linux-amd64-v0.6.1-beta lnd-bin
sudo mv lnd-bin/lncli /usr/bin
sudo mv lnd-bin/lnd /usr/bin
rm -r lnd-bin

# Creamos archivo de configuración en usuario bitcoin
echo "Creamos y configuramos carpeta lighting en usuario bitcoin"
sudo mkdir /home/bitcoin/.lnd
sudo chown bitcoin /home/bitcoin/.lnd
sudo chgrp bitcoin /home/bitcoin/.lnd 

echo "Copiamos y configuramos archivo de configuracion lighting en usuario bitcoin"
sudo cp resources/lnd.conf /home/bitcoin/.lnd/
sudo chown bitcoin /home/bitcoin/.lnd/lnd.conf
sudo chgrp bitcoin /home/bitcoin/.lnd/lnd.conf

# NOTA: Debemos entrar en el perfil de bitcoin y añadir el path de GO
# export PATH=$PATH:/usr/local/go/bin



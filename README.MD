# Nodesig

## Install
```sh
mkdir /tmp/node
```
```sh
cd /tmp/node
```
```sh
wget https://github.com/viaglobe/nodesig/releases/download/beta/nodesig.tar.gz
```
```sh
tar -xf nodesig.tar.gz
```
```sh
cd nodesig
```
```sh
chmod a+rx nodesig
```
```sh
chmod a+rx systemd-service.sh
```
```sh
./systemd-service.sh <your node name> <account id>
```
```sh
systemctl start nodesig.service
```
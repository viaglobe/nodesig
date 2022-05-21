# Nodesig

## Install
```sh
mkdir /tmp/nodesig
```
```sh
cd /tmp/nodesig
```
```sh
wget https://github.com/viaglobe/nodesig/releases/download/beta/nodesig.tar.gz
```
```sh
tar -xf nodesig.tar.gz
```
```sh
chmod a+rx nodesig
chmod a+rx systemd-service.sh
```
```sh
./systemd-service.sh <your node name> <account id>
```
```sh
systemctl start nodesig.service
```
#!/bin/bash

ORIGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST_DIR="/usr/share"
SERVICE_DIR="/usr/lib/systemd/system"

if [ "$UID" -eq 0 ]; then

    mkdir -p                                                            "$DEST_DIR/nodesig"
    mkdir -p                                                            "$DEST_DIR/nodesig/database"

    cp -r   "$ORIGIN_DIR/nodesig"                                       "$DEST_DIR/nodesig"
    cp -r   "$ORIGIN_DIR/nodesig.json"                                  "$DEST_DIR/nodesig"

    rm -f   "$SERVICE_DIR/nodesig.service"

    echo "[Unit]" >>                                                    "$SERVICE_DIR/nodesig.service"
    echo "Description=Nodesig" >>                                       "$SERVICE_DIR/nodesig.service"
    echo "After=network.target" >>                                      "$SERVICE_DIR/nodesig.service"
    echo "" >>                                                          "$SERVICE_DIR/nodesig.service"
    echo "[Service]" >>                                                 "$SERVICE_DIR/nodesig.service"
    echo "Type=simple" >>                                               "$SERVICE_DIR/nodesig.service"
    echo "ExecStart=$DEST_DIR/nodesig/nodesig --chain nodesig.json -d database --name $1 --in-peers 256 --validator --node-key $2" >> "$SERVICE_DIR/nodesig.service"
    echo "Restart=always" >>                                            "$SERVICE_DIR/nodesig.service"
    echo "" >>                                                          "$SERVICE_DIR/nodesig.service"
    echo "[Install]" >>                                                 "$SERVICE_DIR/nodesig.service"
    echo "WantedBy=multi-user.target" >>                                "$SERVICE_DIR/nodesig.service"

    systemctl daemon-reload

    echo
    echo "Done."

else
    echo "Please run as root"
fi
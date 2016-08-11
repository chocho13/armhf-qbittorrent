#!/bin/sh -e

# Default configuration file
if [ ! -f /root/.config/qBittorrent/qBittorrent.conf ]
then
        cp /root/qBittorrent.conf /root/.config/qBittorrent/qBittorrent.conf
fi

# Allow groups to change files.
umask 002

exec "$@"

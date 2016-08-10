#!/bin/sh -e

# Default configuration file
if [ ! -f /config/qBittorrent.conf ]
then
	cp /default/qBittorrent.conf /root/.config/qBittorrent/qBittorrent.conf
fi

# Allow groups to change files.
umask 002

exec "$@"

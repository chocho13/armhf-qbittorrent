FROM armv7/armhf-ubuntu:16.04
LABEL architecture="ARMv7"

RUN apt-get update && \
    apt-get install -y --no-install-recommends libboost-dev \
    libboost-system-dev build-essential geoip-database \
    libtorrent-rasterbar-dev git ca-certificates qtbase5-dev qttools5-dev-tools && \
    cd /tmp && git clone https://github.com/qbittorrent/qBittorrent.git && \
    cd qBittorrent && ./configure --prefix=/usr --disable-gui \
    --with-boost-libdir=/usr/lib/arm-linux-gnueabihf &&  make install && \
    apt-get -y purge build-essential git ca-certificates && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY qBittorrent.conf /root/qBittorrent.conf
COPY entrypoint.sh /
RUN chmod 0755 /entrypoint.sh

VOLUME /root/Downloads
VOLUME /root/.local/share/data/qBittorrent
VOLUME /root/.config/qBittorrent

EXPOSE 8080
EXPOSE 6881

ENTRYPOINT ["/entrypoint.sh"]
CMD ["qbittorrent-nox"]

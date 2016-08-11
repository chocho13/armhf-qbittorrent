FROM armv7/armhf-ubuntu:16.04
LABEL architecture="ARMv7"

RUN apt-get update && \
    apt-get -y --no-install-recommends install qbittorrent-nox && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

COPY qBittorrent.conf /default/qBittorrent.conf
COPY entrypoint.sh /
RUN chmod 0755 /entrypoint.sh

VOLUME /root/Downloads
VOLUME /root/.local/share/data/qBittorrent
VOLUME /root/.config/qBittorrent

EXPOSE 8080
EXPOSE 6881

ENTRYPOINT ["/entrypoint.sh"]
CMD ["qbittorrent-nox"]

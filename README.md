* [`latest` is the latest packaged stable Ubuntu package version (currently 3.3.x)](https://github.com/chocho13/armhf-qbittorrent/blob/master/Dockerfile)

[Docker](https://www.docker.com/) image for [qBittorrent](http://www.qbittorrent.org/) NoX (headless with remote web interface) for armhf based on [armv7/armhf-ubuntu:16.04](https://hub.docker.com/r/armv7/armhf-ubuntu/)

###Usage

All mounts and ports are optional and qBittorrent will work even with only:

    $ docker run chocho13/armhf-qbittorrent

... however that way some ports used to connect to peers are not exposed, accessing the web interface requires you to proxy port 8080, and all settings as well as downloads will be lost if the container is removed.

So let's create some directories :

    $ mkdir config data downloads

... and start using this command:

    $ docker run -d \
        -p 8080:8080 -p 6881:6881/tcp -p 6881:6881/udp \
        -v $PWD/config:/root/.config/qBittorrent \
        -v $PWD/data:/root/.local/share/data/qBittorrent \
        -v $PWD/downloads:/root/Downloads \
        chocho13/armhf-qbittorrent

... to have webUI running on [http://localhost:8080](http://localhost:8080) (username: `admin`, password: `adminadmin`) with config in the following locations mounted:

* `/config`: qBittorrent configuration files
* `/data`: Torrent files
* `/downloads`: Download location

It is probably a good idea to add `--restart=always` so the container restarts if it goes down.

You can map container `6881` port to some random port number and same thing for webui port `8080`, don't change in the qBittorrent settings but in `docker run` command :

    $ docker run -d \
        -p 8181:8080 -p 32620:6881/tcp -p 32620:6881/udp \
        -v $PWD/config:/root/.config/qBittorrent \
        -v $PWD/data:/root/.local/share/data/qBittorrent \
        -v $PWD/downloads:/root/Downloads \
        chocho13/armhf-qbittorrent

Note: For the container to run, the legal notice had to be automatically accepted. By running the container, you are accepting its terms. Toggle the flag in `qBittorrent.conf` to display the notice again.

Feedbacks

Having more issues? [Report a bug on GitHub.](https://github.com/chocho13/armhf-qbittorrent/issues)

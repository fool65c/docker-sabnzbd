Runs a sabnzdb server

listens on port 10000

User sabnzbd is id 1000 this is used on all docker containers to keep access simple
```
RUN useradd --system --uid 1000 -M --shell /usr/sbin/nologin sabnzbd
```

You must export the Config dir and data dir before running

```bash
export SABNZBD_CONFIG_DIR=/srv/download/
export SABNZBD_CONFIG_DIR=/var/lib/application/sabnzbd/
```

 To start run the following
 ```bash
 docker-compose up -d
 ```
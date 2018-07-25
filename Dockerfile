from ubuntu:16.04

ENV DEBIAN_FRONTEND="noninteractive"

# update box
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository multiverse && apt-get update

# install sabnzbdplus
RUN apt-get install -y sabnzbdplus-theme-classic \
	sabnzbdplus-theme-mobile \
  sabnzbdplus-theme-plush \
  par2 python-yenc unzip unrar 

# Clean up
RUN apt-get -y autoremove && \
  apt-get -y clean
RUN rm -rf /var/lib/apt/lists/*

# create sabnzbd user
RUN useradd --system --uid 1000 -M --shell /usr/sbin/nologin sabnzbd

# create directories
RUN mkdir /config
RUN chown sabnzbd /config
RUN mkdir /data
RUN chown sabnzbd /data

#run 
USER sabnzbd

CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--console","--server", "8080"]

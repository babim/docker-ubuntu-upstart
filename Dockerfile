FROM ubuntu-upstart

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN rm -f /etc/motd && \
    echo "---" > /etc/motd && \
    echo "Support by Duc Anh Babim. Contact: ducanh.babim@yahoo.com" >> /etc/motd && \
    echo "---" >> /etc/motd && \
    echo "Babim Container Framework \n \l" > /etc/issue && \
    touch "/(C) Babim"

## Enable Ubuntu Universe and Multiverse.
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list

RUN apt-get clean && \
    apt-get update && \
    apt-get dist-upgrade -y --force-yes && \
    apt-get install nano -y
    
    ## Fix locale.
RUN apt-get install language-pack-en -y
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

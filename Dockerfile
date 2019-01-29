FROM ubuntu:16.04
LABEL maintainer="Aviator" \
      discord="Aviator#1024"

RUN apt-get update &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository ppa:bitcoin/bitcoin &&\
    apt-get update &&\
    apt-get install -y wget libdb4.8-dev libdb4.8++-dev libboost-system1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0  libzmq5 unzip\
    libboost-thread1.58.0 libboost-chrono1.58.0 libevent-2.0-5 libevent-pthreads-2.0-5 libminiupnpc10 &&\
    wget https://github.com/merge-swap/motile-wallet/releases/download/release/Motiled.zip  -O /tmp/Motile.zip &&\
    unzip /tmp/Motile.zip -d /usr/local/bin &&\
    chmod +x /usr/local/bin/Motiled &&\
    apt-get purge -y wget software-properties-common &&\
    rm -rf /tmp/* &&\
    rm -rf /var/lib/apt/lists/* &&\
    apt-get clean &&\
    useradd -ms /bin/bash wallet

VOLUME ["/home/wallet"]
EXPOSE 7218/tcp 
USER wallet 
CMD Motiled --datadir=/home/wallet -printtoconsole

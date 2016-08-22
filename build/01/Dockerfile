FROM anspfeifer/ubuntu-exemplo:1.0

ADD exemplo04.txt /etc/exemplo04.txt

ENV DEBIAN_FRONTEND noninteractive

ENV PKG=git

RUN apt-get -y install $PKG

ADD exemplo05.txt /etc/exemplo05.txt

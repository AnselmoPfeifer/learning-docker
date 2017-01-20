FROM anspfeifer/mysql:1.5

MAINTAINER Anselmo Pfeifer: 0.1

ENV DEBIAN_FRONTEND noninteractive

ENV MYSQL_ROOT_PASSWORD=knkA9n7YnzvrDLE
ENV MYSQL_DATABASE=cobranca
ENV MYSQL_USER=cobranca
ENV MYSQL_PASSWORD=C41ZBxAmSLhRZliF

ADD cobranca.sql /tmp/dump.sql
ADD run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh
RUN /tmp/run.sh >/dev/null 2>&1 &

EXPOSE 3306


FROM container4armhf/armhf-alpine

MAINTAINER stephane@bonnell.fr

RUN apk --no-cache add perl make

ADD https://sourceforge.net/projects/squid-report/files/latest/download?source=files /squidanalyzer.tar.gz

COPY run.sh /run.sh

RUN tar -xvzf squidanalyzer.tar.gz && mv /squidanalyzer-* /squidanalyzer && rm squidanalyzer.tar.gz \
    && mkdir -p /etc/squidanalyzer && mkdir -p /var/www/squidanalyzer && mkdir -p /var/log/squid \
    && cd /squidanalyzer \
    && perl Makefile.PL \
            LOGFILE=/var/log/squid/access.log \
            BINDIR=/usr/local/bin \
            CONFDIR=/etc/squidanalyzer \
            HTMLDIR=/var/www/squidanalyzer \
            BASEURL=/squidanalyzer \
            MANDIR= \
            DOCDIR= \
#    && make && make install \
    && chmod +x /run.sh

VOLUME /et/squidanalyzer
VOLUME /var/log/squid
VOLUME /var/www/squidanalyzer

CMD ["/run.sh"]

#!/bin/sh

cd /squidanalyzer
make
make install

if [ -z "${delay}" ]
then
  delay=3600
fi

while true
do
  /usr/local/bin/squid-analyzer
  sleep ${delay}
done


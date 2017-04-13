# armhf-squidanalyzer

Based on Alpine Linux to be small

Based on Alpine Linux.
Using http://squidanalyzer.darold.net/
To start :
docker run -d -v ~/etc/squidanalyzer:/etc/squidanalyzer -v ~/squid/log:/var/log/squid -v ~/web/squidanalyzer:/var/www/squidanalyzer --name squidanalyzer --restart=always sbonnell/armhf-squidanalyzer

To Build :
docker build -t armhf-squidanalyzer .

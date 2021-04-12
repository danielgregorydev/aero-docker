
FROM composer:2

RUN addgroup -g 1000 aero && adduser -G aero -g aero -s /bin/sh -D aero

WORKDIR /var/www/html

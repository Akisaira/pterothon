FROM python:3.9.10-slim

LABEL author="AutumnSaury" maintainer="autumnsaury@outlook.com"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar fontconfig unzip \
 && adduser --disabled-password --home /home/container container \
 && pip install --upgrade pip

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
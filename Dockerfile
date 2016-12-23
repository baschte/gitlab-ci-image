FROM ubuntu:14.04

MAINTAINER Sebastian Richter <info@baschte.de>

ENV NODEJS_VERSION 6.x
ENV GULP_VERSION 3.9.0

RUN apt-get update \
	&& sudo apt-get install -y \
	software-properties-common \
	python-software-properties \
	&& sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update \
	&& apt-get install -y \
	wget \
	openssl \
	php7.0 \
	php-mbstring \
	php-curl \
	php-xml \
	git \
	ssh \
	curl \
	unzip \
	sudo \
	build-essential \
	libssl-dev \
	libfontconfig \
	&& curl -sL https://deb.nodesource.com/setup_${NODEJS_VERSION} | sudo -E bash -\
	&& sudo apt-get install -y nodejs \
	&& curl -sSL https://get.docker.com/ | sh

## Composer install
RUN curl -sS http://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer && chmod +x /bin/composer

RUN composer self-update \
	&& npm install -g gulp@${GULP_VERSION} \
	&& npm install -g typings \
	&& npm install -g yarn \
	&& npm install -g angular-cli

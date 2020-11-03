FROM ubuntu:xenial

MAINTAINER Sebastian Richter <info@baschte.de>

ENV NODEJS_VERSION 10.x
ENV GULP_VERSION 3.9.0
ENV TZ Europe/Berlin

RUN apt-get update \
	&& apt-get install -y \
	software-properties-common \
	python-software-properties

RUN apt-get update \
	&& apt-get install -y \
	wget \
	openssl \
	php-fpm \
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

## set Timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

## Composer install
RUN curl -sS http://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer && chmod +x /bin/composer

RUN composer self-update \
	&& npm install -g gulp@${GULP_VERSION} \
	&& npm install -g yarn

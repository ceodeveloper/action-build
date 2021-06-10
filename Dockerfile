FROM ubuntu:latest

ENV TZ=GMT+0
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y build-essential
RUN apt-get install -y zip unzip curl git rsync
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
# RUN apt-get update && apt-get install -y nodejs
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.16

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

FROM node:18-alpine

EXPOSE 3012

RUN apk add --no-cache git

WORKDIR /opt/cronicle
RUN apk add --no-cache curl procps coreutils util-linux && \
    curl -L https://github.com/jhuckaby/Cronicle/archive/v0.9.19.tar.gz | tar zxvf - --strip-components 1 && \
    npm install && \
    node bin/build.js dist && \
    apk del --no-cache curl

ENV CRONICLE_base_app_url="http://localhost:5601"
ENV CRONICLE_email_from="cronicle+test@yourDomain.de"
ENV CRONICLE_smtp_hostname="172.17.0.1"
ENV CRONICLE_secret_key="abc123abc"
ENV CRONICLE_WebServer__http_port=5601
ENV CRONICLE_foreground=1
ENV CRONICLE_server_comm_use_hostnames=1
ENV CRONICLE_echo=1
ENV CRONICLE_Storage__Filesystem__base_dir=/opt/cronicle/data
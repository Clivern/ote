FROM golang:1.25.4

ARG OTE_VERSION=0.1.3

RUN mkdir -p /app/configs
RUN mkdir -p /app/var/logs
RUN apt-get update

WORKDIR /app

RUN curl -sL https://github.com/Clivern/Ote/releases/download/v${OTE_VERSION}/ote_linux_x86_64.tar.gz | tar xz
RUN rm LICENSE
RUN rm README.md

COPY ./config.dist.yml /app/configs/

EXPOSE 8080

VOLUME /app/configs
VOLUME /app/var

RUN ./ote version

CMD ["./ote", "server", "-c", "/app/configs/config.dist.yml"]

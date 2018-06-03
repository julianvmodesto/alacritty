FROM ubuntu

ENV USER root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq \
  curl \
  cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y
RUN /root/.cargo/bin/rustup override set stable
RUN /root/.cargo/bin/rustup update stable

WORKDIR /app

ENTRYPOINT /root/.cargo/bin/cargo build --release

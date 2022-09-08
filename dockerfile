FROM debian:stable

ARG USERNAME=dev
ARG USERUID=1000
ARG USERGID=$USERUID

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl git sudo unzip

# disable sudo password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create the user
RUN groupadd --gid $USERGID $USERNAME \
    && useradd --uid $USERUID --gid $USERGID --create-home --shell /bin/bash --groups sudo $USERNAME

USER $USERNAME

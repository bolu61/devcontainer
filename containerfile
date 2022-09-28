FROM debian:stable

ARG USERNAME=dev
ARG USERUID=1000
ARG USERGID=$USERUID

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl git sudo unzip

# add `/opt/bin` to `PATH`
ENV PATH="${PATH}:/opt/bin"

# disable sudo password
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create the user
RUN groupadd --gid $USERGID $USERNAME \
    && useradd --uid $USERUID --gid $USERGID --create-home --shell /bin/bash --groups sudo $USERNAME

USER $USERNAME

# Mount DVD folder to /in, and an output folder to /out, to use scripts.

FROM ubuntu:20.04

ENV DISPLAY=:0 LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive

# Libs / Setup sh
RUN apt-get update && \
    apt-get install -yq libdvd-pkg lsdvd dvdbackup && \
    dpkg-reconfigure libdvd-pkg && \
    rm -rf /var/lib/apt/lists/*

# Scripts
RUN groupadd -g 1000 dvduser && \
    useradd -l -u 1000 -g dvduser dvduser && \
    mkdir -p /sh && \
    mkdir -p /out && \
    mkdir -p /in && \
    mkdir -p /wip && \
    chown --recursive 1000:1000 /sh /out /in /wip
USER dvduser
WORKDIR /wip
COPY *.sh /sh

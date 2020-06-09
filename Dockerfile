# Mount DVD folder to /in, and an output folder to /out, to use scripts.

FROM ubuntu:20.04

ENV DISPLAY=:0 LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive

# Libs / Setup sh
RUN apt-get update && \
    apt-get install -yq libdvd-pkg lsdvd dvdbackup && \
    dpkg-reconfigure libdvd-pkg && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /sh

# Scripts
COPY *.sh /sh

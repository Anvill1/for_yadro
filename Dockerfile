ARG PACKAGE_NAME=argcomplete
ARG VERSION=3.1.6

FROM debian:bullseye-slim as builder

ARG PACKAGE_NAME
ARG VERSION

ENV PACKAGE_NAME=${PACKAGE_NAME}
ENV VERSION=${VERSION}

RUN apt-get update && apt-get install -y make python3-all debhelper dh-python python3-pip \
    && pip3 install stdeb

COPY . .

RUN ./build.sh

FROM ubuntu:20.04

ARG PACKAGE_NAME
ARG VERSION

ENV PACKAGE_NAME=${PACKAGE_NAME}
ENV VERSION=${VERSION}

COPY --from=builder /deb_dist/python3-${PACKAGE_NAME}_${VERSION}-1_all.deb /packages/${PACKAGE_NAME}_${VERSION}-1_all.deb

RUN apt-get update \
    && apt install /packages/${PACKAGE_NAME}_${VERSION}-1_all.deb -y

CMD activate-global-python-argcomplete --user
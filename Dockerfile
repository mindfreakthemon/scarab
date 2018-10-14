FROM ubuntu:cosmic as debian-based

WORKDIR /usr/local/scarab
COPY . /usr/local/scarab
RUN apt-get update && \
    apt-get -yy install libflint-2.5.2 libflint-dev libgmp-dev libmpfr-dev gcc g++ make automake autoconf gyp && \
    gyp --depth=. && \
    find . -type f -exec touch {} + && \
    make

RUN /usr/local/scarab/out/Default/test

FROM centos:7 as rhel-based

WORKDIR /usr/local/scarab
COPY . /usr/local/scarab

ENV LD_LIBRARY_PATH /usr/local/lib/
RUN yum -y update && yum -y install epel-release && \
    yum -y install gcc gcc-c++ make automake autoconf mpfr-devel gmp-devel gyp && \
    mkdir /usr/local/flint && \
    pushd /usr/local/flint && \
    curl http://www.flintlib.org/flint-2.5.2.tar.gz -o flint-2.5.2.tar.gz && \
    tar xzfv flint-2.5.2.tar.gz && \
    pushd flint-2.5.2 && \
    ./configure && \
    make && \
    make install && \
    popd && \
    popd && \
    gyp --depth=. && \
    find . -type f -exec touch {} + && \
    make

RUN /usr/local/scarab/out/Default/test

FROM alpine

WORKDIR /usr/local/scarab

COPY --from=debian-based /usr/local/scarab/out/Default /usr/local/scarab/debian
COPY --from=rhel-based /usr/local/scarab/out/Default /usr/local/scarab/centos

CMD sh
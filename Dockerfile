FROM ubuntu:cosmic

WORKDIR /usr/local/scarab
COPY . /usr/local/scarab
RUN apt-get update && \
    apt-get -yy install libflint-2.5.2 libgmp-dev libmpfr-dev gcc g++ make automake autoconf gyp && \
    gyp --depth=. --no-duplicate-basename-check && \
    make

CMD sh
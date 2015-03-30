# Start from a Debian image.
FROM apacheignite/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

ADD benchmark-load.sh ./

RUN chmod +x benchmark-load.sh

ADD benchmark-wait-server.sh ./

RUN chmod +x benchmark-wait-server.sh

# Run yardstick server.
ENTRYPOINT \
  ./benchmark-load.sh && \
  bin/benchmark-manual-servers-start.sh && \
  ./benchmark-wait-server.sh
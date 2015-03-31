# Start from a Debian image.
FROM apacheignite/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

ADD benchmark-load.sh ./

RUN chmod +x benchmark-load.sh

ADD benchmark-log-server.sh ./

RUN chmod +x benchmark-log-server.sh

# Run yardstick server.
ENTRYPOINT \
  ./benchmark-load.sh && \
  bin/benchmark-manual-servers-start.sh && \
  ./benchmark-log-server.sh

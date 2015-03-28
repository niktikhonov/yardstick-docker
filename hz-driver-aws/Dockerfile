# Start from a Debian image.
FROM ntikhonov/yardstick-aws

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Copy benchmark.
ADD ./benchmark.tar ./

ADD ./benchmark-prepare.sh ./

ADD ./benchmark-upload.sh ./

RUN chmod +x benchmark-prepare.sh

RUN chmod +x benchmark-upload.sh

# Run hazelcast benchmarks.
ENTRYPOINT \
  ./benchmark-prepare.sh && \
  LOCAL_IP=$(ip addr show dev eth0 | sed -nr 's/.*inet ([^ ]+)\/.*/\1/p') \
  bin/benchmark-manual-servers-start.sh config/benchmark-ec2.properties && \
  while pgrep -u root java > /dev/null; do sleep 1; done && \
  ./benchmark-upload.sh && \
  echo "Driver stopped." && \
  while true; do sleep 1000; done
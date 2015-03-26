# Start from a Debian image.
FROM ntikhonov/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Copy benchmark.
ADD ./benchmark.tar ./

# Run ignite server.
ENTRYPOINT bin/benchmark-manual-servers-start.sh config/benchmark-ec2.properties \
  &&  while pgrep -u root benchmark-boots > /dev/null; do sleep 1; done
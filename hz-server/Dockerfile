# Start from a Debian image.
FROM apacheignite/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Copy benchmark.
ADD ./benchmark.tar ./

# Run ignite server.
ENTRYPOINT bin/benchmark-manual-servers-start.sh config/benchmark-docker.properties \
  &&  while pgrep -u root benchmark-boots > /dev/null; do sleep 1; done
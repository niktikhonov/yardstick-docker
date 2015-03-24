# Start from a Debian image.
FROM ntikhonov/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Copy benchmark.
ADD ./benchmark.tar ./

# Run ignite benchmarks.
# Copy logs and results to export directory.
# Container should be run with -v {your dir}:/export
ENTRYPOINT bin/benchmark-manual-drivers-start.sh config/benchmark-docker.properties && \
  while pgrep -u root java > /dev/null; do sleep 1; done && \
  cp -R logs* results* /export
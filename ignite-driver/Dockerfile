# Start from a Debian image.
FROM apacheignite/yardstick-env

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Checkout benchmark.
RUN git clone https://git-wip-us.apache.org/repos/asf/incubator-ignite

# Build benchmark.
WORKDIR /home/benchmark/incubator-ignite

RUN git checkout ignite-497

RUN mvn clean package -Prelease,benchmarks -DskipTests=true -Dmaven.javadoc.skip=true -pl modules/yardstick -am

RUN cp -R modules/yardstick/bin modules/yardstick/libs/ modules/yardstick/config ../

WORKDIR /home/benchmark/

RUN rm -rf /home/benchmark/incubator-ignite

# Run ignite benchmarks.
# Copy logs and results to export directory.
# Container should be run with -v {your dir}:/export
ENTRYPOINT bin/benchmark-manual-drivers-start.sh config/benchmark-docker.properties && \
  while pgrep -u root java > /dev/null; do sleep 1; done && \
  cp -R logs* results* /export
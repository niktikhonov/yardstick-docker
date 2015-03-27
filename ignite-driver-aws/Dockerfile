# Start from a Debian image.
FROM ntikhonov/yardstick-aws

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

ADD ./benchmark-prepare.sh ./

ADD ./benchmark-upload.sh ./

ADD chmod +x benchmark-prepare.sh

ADD chmod +x benchmark-upload.sh

# Run ignite benchmarks.
ENTRYPOINT \
  ./benchmark-prepare.sh && \
  bin/benchmark-manual-drivers-start.sh config/benchmark-ec2.properties && \
  while pgrep -u root java > /dev/null; do sleep 1; done && \
  ./benchmark-upload.sh && \
  echo "Driver stopped." && \
  while true; do sleep 1000; done
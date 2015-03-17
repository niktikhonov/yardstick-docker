# Start from a Debian image.
FROM debian:8

# Install tools.
RUN apt-get update && apt-get install -y --fix-missing \
  wget \
  maven \
  git

# Intasll Oracle JDK
RUN mkdir /opt/jdk

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  http://download.oracle.com/otn-pub/java/jdk/7u76-b13/jdk-7u76-linux-x64.tar.gz

RUN tar -zxf jdk-7u76-linux-x64.tar.gz -C /opt/jdk

RUN update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.7.0_76/bin/java 100

RUN update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.7.0_76/bin/javac 100

# Prepare work directory.
RUN mkdir /home/benchmark

WORKDIR /home/benchmark

# Sets java variables.
ENV JAVA_HOME /opt/jdk/jdk1.7.0_76/

# Checkout benchmark
RUN git clone https://github.com/gridgain/yardstick-gridgain.git

# Build benchmark
WORKDIR /home/benchmark/yardstick-gridgain

RUN mvn clean package

# Start benchmark server
./bin/benchmark-manual-servers-start.sh ./config/benchmark.properties

# User place
ENTRYPOINT /home/benchmark
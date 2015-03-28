# Yardstick Docker
Yardstick Docker is a set of docker images which contains benchmarks written on top of Yardstick framework.

## Yardstick Framework
Visit <a href="https://github.com/gridgain/yardstick" target="_blank">Yardstick Repository</a> for detailed information
on how to run Yardstick benchmarks and how to generate graphs.

## Running Benchmarks
1. Create a local clone of Yardstick Docker repository
2. The easiest way to run benchmark servers is an executing *ignite-server/benchmark-server-run.sh* or *hz-server/benchmark-server-run.sh* script which will pull required docker image and run container. Execute this script so many times as servers one need.

    $ ignite-server/benchmark-server-run.sh

**Another way**

Pull latest image.

    *For Hazelcast:*

    # docker pull ntikhonov/yardstick-hz-server

    *For Ignite:*

    # docker pull ntikhonov/yardstick-ignite-server

Run container.

    *For Hazelcast:*

    # docker run -d --net=host ntikhonov/yardstick-hz-server

    *For Ignite:*

    # docker run -d --net=host ntikhonov/yardstick-ignite-server

3. The easiest way to run benchmark driver is an executing *ignite-server/benchmark-driver-run.sh* or *hz-server/benchmark-driver-run.sh* script which will pull and start docker image. The script requires one argument which is a directory where results uploaded.

    $ ignite-driver/benchmark-driver-run.sh /home/bob/results

**Another way**

Pull latest image.

    For Hazelcast:

    # docker pull ntikhonov/yardstick-hz-driver

    For Ignite:

    # docker pull ntikhonov/yardstick-ignite-driver

Run container.

    For Hazelcast:

    # docker run -d --net=host -v 'dir':/export ntikhonov/yardstick-hz-driver

    For Ignite:

    # docker run -d --net=host -v 'dir':/export ntikhonov/yardstick-ignite-driver

    where 'dir' absolute path to folder where results uploaded.

## Running Benchmarks in AWS
### Using AMI
The easiest way to run benchmarks in AWS is an using created AMI image.

1. Open the Amazon EC2 console.
2. From the Amazon EC2 console dashboard, click Launch Instance.
3. On the Choose an Amazon Machine Image (AMI) page, choose an community AMI and search 'yardstick'.
![alt AMI](https://raw.githubusercontent.com/ntikhonov/yardstick-docker/master/img/bench-AMIs.png)
4. Choose 'yardstick-hazelcast-server-1.0' or 'yardstick-ignite-server-1.0'
5. On the Choose an Instance Type page, select the hardware configuration and size of the instance to launch. Recommend to choose 'c4.4xlarge, c4.2xlarge, c4.xlarge' of instance types.
6. On the Configure Instance Details page choose number of instances. For more information see
[amazon documentation.](https://aws.amazon.com/ru/documentation/).
7. On the Configure Security Group page create or choose security group which has an inbound rule for port 0-65535. For example:
![alt AMI](https://raw.githubusercontent.com/ntikhonov/yardstick-docker/master/img/bench-rul.png)
8. Review and run instance.
9. Connect to instance. For more information [see.](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html)
10. Run './start-benchmark-server.sh' and pass to two arguments: *aws access key* and *aws secret key*. For more information (see.)[http://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSGettingStartedGuide/AWSCredentials.html]

    $ ./start-benchmark-server.sh LKJHDSAHJKHSA ASLKDJSLKDJSAO98790we-werwe

11. Now the instance has a working benchmark server which always starts with instance.
12. Launch benchmark driver instance by doing followed steps: first steps as 2-3, then choose yardstick-hazelcast-driver-1.0 or yardstick-ignite-driver-1.0 AMI, then as 5-8.
13. Connect to drive instance. For more information [see.](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html)
14. Run ./start-benchmark-driver.sh and pass to two mandatory arguments and one optional: *aws access key*, *aws secret key* and ES3 bucket name where will be uploaded benchmark results. Default driver tries upload results to 'yardstick-benchmark' bucket. **ES3 bucket must be exist!**

    $ ./start-benchmark-server.sh LKJHDSAHJKHSA ASLKDJSLKDJSAO98790we-werwe my-bucket

After benchmark execution results will be uploaded to ES3 bucket. If bucket contains previous results yet then driver will generate comparative charts.

![alt AMI](https://raw.githubusercontent.com/ntikhonov/yardstick-docker/master/img/bench-result.png)

![alt AMI](https://raw.githubusercontent.com/ntikhonov/yardstick-docker/master/img/bench-results.png)

## Provided Benchmarks
The following benchmarks are provided:

1. Benchmarks atomic distributed cache put operation
2. Benchmarks atomic distributed cache put and get operations together
3. Benchmarks transactional distributed cache put operation
4. Benchmarks transactional distributed cache put and get operations together
5. Benchmarks distributed SQL query over cached data
6. Benchmarks distributed SQL query with simultaneous cache updates

## License
Yardstick Docker is available under [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) Open Source license.
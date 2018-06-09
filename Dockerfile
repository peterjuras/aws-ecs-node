FROM library/debian:stretch-20180426

# Install dependencies
RUN apt-get update && apt-get install -y \
  python \
  curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && rm get-pip.py

# Install AWS cli
RUN pip install awscli==1.15.35

# Install AWS ECS cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v1.6.0
RUN chmod +x /usr/local/bin/ecs-cli

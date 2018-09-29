FROM library/debian:stretch-20180426

# Install dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  libssl-dev \
  software-properties-common \
  python \
  curl 

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
  stable"

RUN apt-get update && apt-get install -y \
  nodejs=8.12.0-1nodesource1 \
  yarn=1.7.0-1 \
  docker-ce=18.03.1~ce-0~debian

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && rm get-pip.py

# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install AWS cli
RUN pip install awscli==1.15.35

# Install AWS EB CLI
RUN pip install awsebcli==3.14.0 

# Install AWS ECS cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v1.6.0
RUN chmod +x /usr/local/bin/ecs-cli

# Update npm
RUN npm i -g npm@6.1.0

# Install serverless-cli
RUN npm i -g serverless@1.27.3

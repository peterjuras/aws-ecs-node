FROM library/debian:stretch-20180426

# Install dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  libssl-dev \
  python \
  curl 

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
  nodejs=8.11.2-1nodesource1 \
  yarn=1.7.0-1

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && rm get-pip.py

# Install AWS cli
RUN pip install awscli==1.15.35

# Install AWS ECS cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v1.6.0
RUN chmod +x /usr/local/bin/ecs-cli

# Update npm
RUN npm i -g npm@6.1.0

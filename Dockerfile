FROM circleci/node:10.15.0

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py && rm get-pip.py

# Install AWS cli
RUN pip install awscli==1.16.96

# Install AWS EB CLI
RUN pip install awsebcli==3.14.7 

# Install AWS ECS cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v1.12.1
RUN chmod +x /usr/local/bin/ecs-cli

# Update npm
RUN npm i -g npm@6.7.0

# Install serverless-cli
RUN npm i -g serverless@1.36.3

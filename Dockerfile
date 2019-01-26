FROM circleci/node:10.15.0

RUN sudo apt-get update && sudo apt-get install python3-dev

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o ~/get-pip.py && python3 ~/get-pip.py --user && rm ~/get-pip.py && sudo ln -s ~/.local/bin/pip /usr/local/bin/pip

# Install AWS EB CLI
RUN pip install awsebcli==3.14.7 --user && sudo ln -s ~/.local/bin/eb /usr/local/bin/eb

# Install AWS cli
RUN pip install awscli==1.16.96 --user && sudo ln -s ~/.local/bin/aws /usr/local/bin/aws

# Install AWS ECS cli
RUN sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v1.12.1
RUN sudo chmod +x /usr/local/bin/ecs-cli

# Update npm
RUN sudo npm i -g npm@6.7.0

# Install serverless-cli
RUN sudo npm i -g serverless@1.36.3

#!/usr/bin/env bash
# install python 3.7.1 and dependencies
sudo apt-get update

sudo apt-get install -y build-essential checkinstall
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev

cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz
sudo tar xzf Python-3.7.1.tgz

cd Python-3.7.1
sudo ./configure --enable-optimizations
sudo make altinstall

# install pip
curl -O https://bootstrap.pypa.io/get-pip.py
python3.7 get-pip.py --user


# install aws-cli
# pip3 install awscli --upgrade --user
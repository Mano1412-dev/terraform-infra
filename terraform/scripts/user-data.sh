#!/bin/bash

set -e

dnf update -y

dnf install -y \
git \
curl \
wget \
unzip \
tar \
python3 \
python3-pip \
java-21-amazon-corretto \
docker

systemctl enable docker
systemctl start docker

systemctl enable amazon-ssm-agent
systemctl restart amazon-ssm-agent

usermod -aG docker ec2-user

hostnamectl

echo "Bootstrap completed successfully."
#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/bootstrap.log | logger -t bootstrap) 2>&1

dnf update -y

dnf install -y git wget unzip tar python3 python3-pip java-21-amazon-corretto docker

systemctl enable docker
systemctl start docker

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

dnf install -y jenkins

systemctl enable jenkins
systemctl start jenkins

systemctl enable amazon-ssm-agent
systemctl restart amazon-ssm-agent

usermod -aG docker ec2-user

echo "Bootstrap completed successfully"
# EC2 Foundation

## Base Image

Amazon Linux 2023

## Bootstrap

Common user-data script

## Common Software

- Git
- Docker
- Python 3
- Java 21
- Curl
- Wget
- Unzip

## IAM

EC2 Instance Profile

## Key Pair

Terraform imports an externally generated public key.

## Application Servers

The application layer consists of two EC2 instances:

- Stage
- Production

Implementation uses Terraform `for_each` to avoid duplicate resource definitions.

Benefits:

- Reusable
- Easier maintenance
- Scalable for additional environments (QA, UAT, DR)
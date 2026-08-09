resource "aws_iam_role_policy" "jenkins_ec2_read" {
  name = "${local.name_prefix}-jenkins-ec2-read"

  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "ec2:DescribeInstances",
          "ec2:DescribeTags",
          "ec2:DescribeInstanceStatus"
        ]

        Resource = "*"
      }
    ]
  })
}
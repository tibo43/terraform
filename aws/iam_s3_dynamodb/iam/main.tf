resource "aws_iam_policy" "iam_policy" {
    name        = "${var.name}"
    path        = "/"
    description = "IAM policy for ${var.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:ListBucket",
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::${var.name}", "arn:aws:s3:::${var.name}/*"],
      "Effect": "Allow"
    },
    {
      "Action": [
        "iam:GetRole",
        "iam:PassRole"
      ],
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
    EOF

    tags = {
      Team          = "${var.team}"
      Product       = "${var.product}"
      Department    = "${var.department}"
      Environment   = "${var.environment}"
    }
}

resource "aws_iam_user" "iam_user" {
  name =  "${var.name}"

    tags = {
      Team          = "${var.team}"
      Product       = "${var.product}"
      Department    = "${var.department}"
      Environment   = "${var.environment}"
    }
}

resource "aws_iam_user_policy_attachment" "user_policy" {
    user       = aws_iam_user.iam_user.name
    policy_arn = aws_iam_policy.iam_policy.arn
}
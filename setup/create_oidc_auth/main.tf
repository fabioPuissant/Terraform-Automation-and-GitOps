# GitHub OIDC Identity Provider
resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  # AWS manages the thumbprint for GitHub's OIDC provider
  # No thumbprint_list needed as AWS uses its own trusted CA library
}

# Data source to get the current AWS account ID
data "aws_caller_identity" "current" {}

# IAM policy document for the assume role policy
data "aws_iam_policy_document" "github_actions_assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_repo}:*"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

# IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions" {
  name               = var.role_name
  description        = "IAM role for GitHub Actions OIDC authentication for ${var.github_repo}"
  assume_role_policy = data.aws_iam_policy_document.github_actions_assume_role.json

  tags = {
    Purpose    = "GitHub Actions OIDC"
    Repository = var.github_repo
  }
}

# Attach IAM policies to the role
resource "aws_iam_role_policy_attachment" "github_actions" {
  for_each = toset(var.iam_policy_arns)

  role       = aws_iam_role.github_actions.name
  policy_arn = each.value
}

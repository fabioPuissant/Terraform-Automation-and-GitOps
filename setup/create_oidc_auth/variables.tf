variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "github_repo" {
  description = "GitHub repository in the format org-name/repo-name (e.g., octo-org/octo-repo)"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+$", var.github_repo))
    error_message = "The github_repo must be in the format 'org-name/repo-name'."
  }
}

variable "role_name" {
  description = "Name of the IAM role to create for GitHub Actions"
  type        = string
  default     = "github-actions-oidc-role"
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs to attach to the GitHub Actions role"
  type        = list(string)
  default     = []
}

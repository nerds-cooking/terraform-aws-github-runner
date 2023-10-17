variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "eu-west-2"
}

variable "aws_profile" {
  description = "AWS profile to use"
  type        = string
  default     = "github-runners"
}

variable "github_app_id" {
  description = "GitHub App ID"
  type        = string
}

variable "github_app_key_base64" {
  description = "GitHub App Private Key"
  type        = string
}

variable "github_app_webhook_secret" {
  description = "GitHub App Webhook Secret"
  type        = string
}

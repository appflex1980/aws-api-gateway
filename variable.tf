
variable "aws_region" {
default = "us-west-2"
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name for website"
  type        = string
}

variable "bucket_arn" {
  description = "S3 bucket ARN"
  type        = string
}

variable "bucket_domain_name" {
  description = "S3 website or regional domain"
  type        = string
}

variable "website_endpoint" {
  type = string
}

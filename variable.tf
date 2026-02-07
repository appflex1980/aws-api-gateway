
variable "aws_region" {
default = "us-west-2"
}

variable "project_name" {
  description = "Project name used for tagging VPC resources"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create"
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

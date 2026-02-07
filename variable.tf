
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



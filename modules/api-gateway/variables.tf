variable "website_endpoint" {
  description = "S3 static website endpoint for API Gateway integration"
  type        = string
}

variable "project" {
  description = "Project name for API Gateway"
  type        = string
  default     = "my-project"
}

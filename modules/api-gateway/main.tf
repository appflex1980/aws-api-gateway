

resource "aws_api_gateway_rest_api" "this" {
  name        = "${var.project}-api"
  description = "API Gateway for ${var.project}"
}

resource "aws_api_gateway_resource" "website" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  parent_id   = aws_api_gateway_rest_api.this.root_resource_id
  path_part   = "website"
}

resource "aws_api_gateway_method" "get_website" {
  rest_api_id   = aws_api_gateway_rest_api.this.id
  resource_id   = aws_api_gateway_resource.website.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_website" {
  rest_api_id             = aws_api_gateway_rest_api.this.id
  resource_id             = aws_api_gateway_resource.website.id
  http_method             = aws_api_gateway_method.get_website.http_method
  integration_http_method = "GET"
  type                    = "HTTP"
  uri                     = "http://${var.website_endpoint}"
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id
  depends_on  = [aws_api_gateway_integration.get_website]
}

resource "aws_api_gateway_stage" "prod" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.this.id
  deployment_id = aws_api_gateway_deployment.this.id
}


resource "aws_api_gateway_rest_api" "site_api" {
  name = "s3-website-proxy"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.site_api.id
  parent_id   = aws_api_gateway_rest_api.site_api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = aws_api_gateway_rest_api.site_api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"

  request_parameters = {
    "method.request.path.proxy" = true
  }
}

#---🌐 Integration → S3 Website
resource "aws_api_gateway_integration" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.site_api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.proxy.http_method

  type                    = "HTTP_PROXY"
  integration_http_method = "ANY"

  uri = "http://${aws_s3_bucket.site.bucket}.s3-website-${data.aws_region.current.name}.amazonaws.com/{proxy}"

  request_parameters = {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }
}

resource "aws_api_gateway_method" "root" {
  rest_api_id   = aws_api_gateway_rest_api.site_api.id
  resource_id   = aws_api_gateway_rest_api.site_api.root_resource_id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "root" {
  rest_api_id = aws_api_gateway_rest_api.site_api.id
  resource_id = aws_api_gateway_rest_api.site_api.root_resource_id
  http_method = aws_api_gateway_method.root.http_method

  type                    = "HTTP_PROXY"
  integration_http_method = "ANY"

  uri = "http://${aws_s3_bucket.site.bucket}.s3-website-${data.aws_region.current.name}.amazonaws.com"
}

output "route_id" {
  value = aws_apigatewayv2_route.lambda.id
}

output "integration_id" {
  value = aws_apigatewayv2_integration.lambda.id
}

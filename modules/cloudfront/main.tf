resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = var.alb_dns_name
    origin_id = "ALBOrigin"

    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols = [ "TLSv1.2" ]
    }
  }

  enabled = true
  is_ipv6_enabled = true
  comment = "Cloudfront for ALB"

  default_cache_behavior {
    target_origin_id = "ALBOrigin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods = ["GET","HEAD","OPTIONS"]
    cached_methods = [ "GET","HEAD" ]
    compress = true

    forwarded_values {
      query_string = false

      headers = [ "HOST" ]

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }
}
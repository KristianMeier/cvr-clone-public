resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_sse" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "log"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "${var.s3_access_policy_name}-${var.bucket_name}"
  description = "Policy that grants read access to a specific S3 bucket"
  policy      = data.aws_iam_policy_document.s3_access_policy_doc.json
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  count  = var.create_cloudfront ? 1 : 0
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.cloudfront_s3_access_policy_doc[0].json
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  count   = var.create_cloudfront ? 1 : 0
  comment = "OAI for S3 bucket ${var.bucket_name}"
}

resource "aws_cloudfront_distribution" "distribution" {
  count   = var.create_cloudfront ? 1 : 0
  enabled = true

  origin {
    domain_name = aws_s3_bucket.bucket.bucket_domain_name
    origin_id   = "${var.s3_origin_id}-${var.bucket_name}"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai[0].cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = "${var.s3_origin_id}-${var.bucket_name}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "${var.cloudfront_distribution_name}-${var.bucket_name}"
  }
}


resource "aws_acm_certificate" "main" {
  domain_name               = "tatsumi403.com"
  subject_alternative_names = ["*.tatsumi403.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn = aws_acm_certificate.main.arn
  # 実際の検証用DNSレコードは今回は作成しません（学習用）

  timeouts {
    create = "2m" # タイムアウト設定
  }
}

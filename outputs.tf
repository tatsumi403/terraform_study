output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "public_subnet_id" {
  value       = aws_subnet.public[*].id
  description = "パブリックサブネットIDの出力"
}

output "instance_id" {
  value       = aws_instance.my_instance[*].id
  description = "EC2インスタンスのID"
}

output "instance_public_ip" {
  value       = aws_instance.my_instance[*].public_ip
  description = "EC2インスタンスのパブリックIP"
}

output "bucket_name" {
  value       = aws_s3_bucket.my_first_terraform_bucket_tatsumi.id
  description = "バケット名を出力"
}

output "bucket_arn" {
  value       = aws_s3_bucket.my_first_terraform_bucket_tatsumi.arn
  description = "バケットARNを出力"
}

output "bucket_region_domain_name" {
  value       = aws_s3_bucket.my_first_terraform_bucket_tatsumi.bucket_regional_domain_name
  description = "バケットのリージョン固有ドメイン名を出力"
}

output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "現在のAWSアカウントID"
}

output "db_instance_endpoint" {
  value       = aws_db_instance.db.endpoint
  sensitive   = true
  description = "RDSのエンドポイント（接続情報）"
}

output "db_instance_port" {
  value       = aws_db_instance.db.port
  description = "データベースのポート番号"
}

output "db_instance_id" {
  value       = aws_db_instance.db.id
  description = "RDSインスタンスのID"
}

output "db_subnet_group_name" {
  value       = aws_db_subnet_group.default.name
  description = "サブネットグループ名"
}

output "ssl_certificate_arn" {
  value       = aws_acm_certificate.main.arn
  description = "SSL証明書のARN"
}

output "ssl_certificate_domain" {
  value       = aws_acm_certificate.main.domain_name
  description = "証明書のドメイン名"
}

output "https_listener_arn" {
  value       = aws_lb_listener.https.arn
  description = "HTTPSリスナーのARN"
}

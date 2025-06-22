output "vpc_id" {
  value       = aws_vpc.my_first_vpc.id
  description = "VPC ID"
}

output "subnet_id" {
  value       = aws_subnet.my_subnet.id
  description = "サブネットIDの出力"
}

output "instance_id" {
  value       = aws_instance.my_instance.id
  description = "EC2インスタンスのID"
}

output "instance_public_ip" {
  value       = aws_instance.my_instance.public_ip
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

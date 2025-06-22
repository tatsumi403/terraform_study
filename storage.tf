# S3バケット
resource "aws_s3_bucket" "my_first_terraform_bucket_tatsumi" {
  bucket = var.bucket_name
  tags = {
    Name        = "My First Bucket"
    Environment = var.environment
    AccountId   = data.aws_caller_identity.current.account_id
  }
}

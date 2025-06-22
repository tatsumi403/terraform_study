variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "subnet_cidr_block" {
  type        = string
  description = "Subnet CIDR block"
}

variable "key_name" {
  type        = string
  default     = ""
  description = "EC2キーペア名（SSH接続用）"
}

variable "bucket_name" {
  type        = string
  description = "S3バケット名"
}

variable "environment" {
  type        = string
  description = "環境名"
}

variable "region" {
  type        = string
  description = "AWSリージョン"
}

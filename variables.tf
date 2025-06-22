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

variable "availability_zones" {
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c"]
  description = "使用するAZ"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "パブリックサブネットのCIDRブロック"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
  description = "プライベートサブネットのCIDRブロック"
}



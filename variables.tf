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

variable "db_name" {
  type        = string
  default     = "myapp"
  description = "RDSデータベース名"
}

variable "db_username" {
  type        = string
  default     = "admin"
  description = "RDSユーザー名"
}

variable "db_password" {
  type        = string
  description = "RDSパスワード"
  sensitive   = true
}

variable "db_instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "RDS インスタンスクラス"
}

variable "db_storage_size" {
  type        = number
  default     = 20
  description = "RDS 割り当てストレージ"
}

variable "db_storage_max_size" {
  type        = number
  default     = 100
  description = "RDS 最大割り当てストレージ"
}

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Essential Commands

### Terraform Operations
- `terraform init` - Initialize Terraform working directory
- `terraform validate` - Validate Terraform configuration syntax
- `terraform plan` - Preview changes before applying
- `terraform apply` - Apply infrastructure changes
- `terraform destroy` - Destroy all managed infrastructure

### Prerequisites
- AWS CLI configured with appropriate credentials
- Terraform installed (version constraints defined in versions.tf)
- Valid AWS account with necessary permissions

## Architecture Overview

This is a Terraform project that builds a production-ready, multi-AZ AWS infrastructure with high availability.

### Core Infrastructure Components

**Network Architecture:**
- VPC with configurable CIDR (default: 10.0.0.0/16)
- Multi-AZ deployment across ap-northeast-1a and ap-northeast-1c
- Public subnets (10.0.1.0/24, 10.0.2.0/24) with Internet Gateway access
- Private subnets (10.0.11.0/24, 10.0.12.0/24) with NAT Gateway access
- Application Load Balancer (ALB) for traffic distribution with SSL termination

**High Availability Features:**
- Redundant NAT Gateways (one per AZ)
- Elastic IPs for NAT Gateways
- Load balancer with health checks and HTTPS redirection
- EC2 instances distributed across availability zones
- Multi-AZ RDS MySQL database with encryption and automated backups

**Security Features:**
- SSL/TLS certificates via AWS Certificate Manager (ACM)
- Encrypted RDS database storage
- Security groups for EC2, ALB, and RDS
- Private RDS deployment in dedicated DB subnet group

### File Structure and Responsibilities

- `network.tf` - VPC, subnets, NAT gateways, routing tables, ALB with SSL listeners
- `compute.tf` - EC2 instances and related compute resources
- `security.tf` - Security groups for EC2, ALB, RDS, and Auto Scaling Group
- `storage.tf` - S3 bucket and storage resources
- `database.tf` - RDS MySQL instance with Multi-AZ deployment and DB subnet group
- `ssl.tf` - ACM SSL certificates and validation configuration
- `variables.tf` - Variable definitions with defaults including database variables
- `terraform.tfvars` - Environment-specific variable values including DB credentials
- `outputs.tf` - Resource outputs including RDS endpoints and SSL certificate ARNs
- `data.tf` - Data sources for existing AWS resources
- `providers.tf` - AWS provider configuration
- `versions.tf` - Terraform version constraints
- `main.tf` - Main configuration file (currently empty)

### Key Configuration Variables

Located in `terraform.tfvars`:
- `region` - AWS region (ap-northeast-1)
- `environment` - Environment name (dev)
- `vpc_cidr_block` - VPC CIDR block
- `availability_zones` - List of AZs to use
- `public_subnet_cidrs` - Public subnet CIDR blocks
- `private_subnet_cidrs` - Private subnet CIDR blocks
- `bucket_name` - S3 bucket name (must be globally unique)
- `db_name` - RDS database name
- `db_username` - RDS username
- `db_password` - RDS password (sensitive)
- `db_instance_class` - RDS instance type
- `db_storage_size` - Initial storage allocation
- `db_storage_max_size` - Maximum storage for auto-scaling

### Infrastructure Patterns

**Resource Naming:**
- Uses `${var.environment}-<resource-type>` pattern
- Resources are tagged with Environment for organization

**Multi-Resource Management:**
- Uses `count` parameter for creating multiple similar resources
- Subnets, NAT gateways, and EC2 instances are created in pairs across AZs

**Dependencies:**
- Explicit dependency management between resources
- NAT gateways depend on Internet Gateway
- Private route tables reference specific NAT gateways

### Security Model

- Public subnets for load balancers and NAT gateways
- Private subnets for application servers and RDS database
- Security groups control ingress/egress traffic for EC2, ALB, and RDS
- NAT gateways provide controlled outbound internet access from private subnets
- SSL/TLS termination at Application Load Balancer level
- RDS database encrypted at rest with automated backups
- HTTP to HTTPS redirection enforced at load balancer
- Database accessible only from application security group

## Development Workflow

1. Modify `.tf` files as needed
2. Run `terraform validate` to check syntax
3. Run `terraform plan` to review changes
4. Run `terraform apply` to deploy changes
5. Use `terraform destroy` when cleaning up resources

Always review the plan output before applying changes to avoid unintended infrastructure modifications.
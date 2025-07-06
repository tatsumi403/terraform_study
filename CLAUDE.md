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
- Application Load Balancer (ALB) for traffic distribution

**High Availability Features:**
- Redundant NAT Gateways (one per AZ)
- Elastic IPs for NAT Gateways
- Load balancer with health checks
- EC2 instances distributed across availability zones

### File Structure and Responsibilities

- `network.tf` - VPC, subnets, NAT gateways, routing tables, and ALB configuration
- `compute.tf` - EC2 instances and related compute resources
- `security.tf` - Security groups and access controls
- `storage.tf` - S3 bucket and storage resources
- `variables.tf` - Variable definitions with defaults
- `terraform.tfvars` - Environment-specific variable values
- `outputs.tf` - Resource outputs for reference
- `data.tf` - Data sources for existing AWS resources
- `providers.tf` - AWS provider configuration
- `versions.tf` - Terraform version constraints

### Key Configuration Variables

Located in `terraform.tfvars`:
- `region` - AWS region (ap-northeast-1)
- `environment` - Environment name (dev)
- `vpc_cidr_block` - VPC CIDR block
- `availability_zones` - List of AZs to use
- `public_subnet_cidrs` - Public subnet CIDR blocks
- `private_subnet_cidrs` - Private subnet CIDR blocks
- `bucket_name` - S3 bucket name (must be globally unique)

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

- Public subnets for load balancers and bastion hosts
- Private subnets for application servers
- Security groups control ingress/egress traffic
- NAT gateways provide controlled outbound internet access from private subnets

## Development Workflow

1. Modify `.tf` files as needed
2. Run `terraform validate` to check syntax
3. Run `terraform plan` to review changes
4. Run `terraform apply` to deploy changes
5. Use `terraform destroy` when cleaning up resources

Always review the plan output before applying changes to avoid unintended infrastructure modifications.
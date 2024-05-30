variable "environment" {
  description = "Deployment environment (e.g., dev, staging)"
  default = "dev"
}


variable "vpc_id" {
  description = "ID of the VPC"
  type = string
}

variable "availability_zones" {
  description = "List of Availability Zones"
  type = string
}

variable "rds_engine" {
  description = "Database engine for RDS instance (e.g., mysql, postgresql)"
  default = "mysql"
}

variable "rds_engine_version" {
  description = "Version of the database engine (e.g., 8.0)"
  default = "8.0"
}

variable "rds_instance_class" {
  description = "Instance class for the RDS instance (e.g., db.t2.micro)"
  default = "db.t2.micro"
}

variable "rds_username" {
  description = "Username for the RDS database"
}

variable "rds_password" {
  description = "Password for the RDS database"
  sensitive = true
}

variable "rds_allocated_storage" {
  description = "Allocated storage size for the RDS instance (in GB)"
  default = 20
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of Availability Zones for the VPC"
  type = list(string)
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}
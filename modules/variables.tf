variable "aws_region" {
  description = "Used AWS Region."
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "Used CIDR Block Address to VPC."
  default     = "200.0.0.0/16"
}

variable "subnet1_cidr_block" {
  description = "Used CIDR Block Address to the Subnet."
  default     = "200.0.0.0/28"
}

variable "sunet1_availability_zone" {
  description = "Used availability to the Subnet."
  default     = "us-east-1a"
}


variable "subnet2_cidr_block" {
  description = "Used CIDR Block Address to the Subnet."
  default     = "200.0.10.0/28"
}

variable "sunet2_availability_zone" {
  description = "Used availability to the Subnet."
  default     = "us-east-1b"
}

variable "subnet3_cidr_block" {
  description = "Used CIDR Block Address to the Subnet."
  default     = "200.0.16.0/28"
}

variable "sunet3_availability_zone" {
  description = "Used availability to the Subnet."
  default     = "us-east-1c"
}

variable "cluster_name" {
  description = "Name of the Cluster"
  default     = "crate"
}

variable "ec2_instance_type" {
  description = "Instance type for Instances"
  default     = "t2.small"
}

variable "ec2_key_name" {
  description = "Key Pair name for Instances"
  default     = "cratedb-key"
}

variable "ec2_count" {
  description = "Quantity of  Instances"
  default     = "3"
}

variable "ec2_count_max" {
  description = "Max Quantity of  Instances"
  default     = "5"
}

variable "ec2_count_min" {
  description = "Min Quantity of  Instances"
  default     = "1"
}
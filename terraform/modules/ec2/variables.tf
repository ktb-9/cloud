variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  default = "ktb9-ec2-instance"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "instance_security_group" {
  description = "Security group IDs for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access to the instance"
  type        = string
}

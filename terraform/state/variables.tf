variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "AMI ID of joindevops RHEL9"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-0e0551047329b4578"
  description = "VPC ID where the Security Group will be created"
}

variable "subnet_id" {
  type        = string
  default     = "subnet-03a11d7579f295465"
  description = "Subnet ID where the EC2 instance will be launched"
}

variable "ec2_tags" {
  type = map(string)

  default = {
    Name    = "HelloWorld"
    Purpose = "variables-demo"
  }
}

variable "sg_name" {
  type    = string
  default = "satyam"
}

variable "sg_description" {
  type    = string
  default = "allowing all ports from internet"
}

variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type = list(string)

  default = [
    "0.0.0.0/0"
  ]
}

variable "sg_tags" {
  type = map(string)

  default = {
    Name = "satyam"
  }
}
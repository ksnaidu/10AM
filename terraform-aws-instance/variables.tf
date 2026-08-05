variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "AMI ID of the EC2 instance"
}

variable "instance_type" {
    default = "t3.micro"
    type = string
    description = "Instance size"

    validation {
        condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
        error_message = "Valid values for instance_type are: t3.micro, t3.small, t3.medium"
    } 
}

# mandatory to provide
variable "sg_ids" {
    type = list
}

variable "tags" {
    type = map
}
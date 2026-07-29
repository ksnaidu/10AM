variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "Ami id of RHEL9"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "ec2_tags" {
    type = map(string)
    default = {
      name = "roboshop"
      purpose = "variables-demo"

    }  
}

variable "sg_name" {
    default = "allow-all-1"
  
}

variable "from_port" {
    default = 0  
}

variable "to_port" {
    type = number
    default = 0
  
}

variable "cidr_blocks" {
     type = list(string)
     default = [ "0.0.0.0/0" ] 
}

variable "sg_tags" {
     default = {
        Name = "allow-all"
     }  
}

variable "environment" {
    default = "dev"
  
}

variable "instances" {
    default = ["mongodb", "redis", "mysql", "rabbitmq"]
      
}
variable "zone_id" {
     default = "Z06008633JIHZ67B3RC4Q" 
}

variable "domain-name" {
    default = "kimidi.site"
  
}
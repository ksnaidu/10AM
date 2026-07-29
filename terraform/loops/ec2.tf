# Create an EC2 Instance
resource "aws_instance" "roboshop" {
  count=4
  ami           = var.ami_id # Replace with a valid AMI ID for your region
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]

  tags = {
    Name = var.instances [count.index]
  }
}


resource "aws_security_group" "allow_all" {
    name        = var.sg_name
    description = "allow all traffic"

    ingress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
    
}
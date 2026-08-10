###vpc robsohop-dev

resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = "true"  ##host-names enable purpose

  tags = merge(
     var.vpc_tags,
     local.common_tags,
     {
        Name = "${var.project}-${var.environment}"
     }
  )
    
}


# IGW roboshop-dev
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id # association with VPC

  tags = merge(
    ###var.igw_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}
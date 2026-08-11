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
    var.igw_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]  # exicute 2 subnets

  availability_zone = local.az_names[count.index]  ## 0 means inclusive, 2 means exclusive
  map_public_ip_on_launch = true  ##subnet instances must use public-ip required.

  tags = merge(
    var.public_subnet_tags,
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
    }
  )
}



resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]  # exicute 2 subnets

  availability_zone = local.az_names[count.index]  ## 0 means inclusive, 2 means exclusive


  tags = merge(
    var.private_subnet_tags,
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-private-${local.az_names[count.index]}"
    }
  )
}



resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]  # exicute 2 subnets

  availability_zone = local.az_names[count.index]  ## 0 means inclusive, 2 means exclusive


  tags = merge(
    var.database_subnet_tags,
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-database-${local.az_names[count.index]}"
    }
  )
}




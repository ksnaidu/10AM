module "vpc" {
    source = "../terraform-aws-vpc"
    # project = "roboshop"
    # environment = "dev"
    # public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

    project = var.project
    environment = var.environment
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs
}




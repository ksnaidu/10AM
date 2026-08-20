module "frontend" {
    source = "../../terraform-aws-securitygroup"
    project =  var.project
    environment = var.environment

    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description 
    vpc_id = local.vpc_id  ##vpc-id stroed in ssm parameter
}


module "bastion" {
    #source = "../../terraform-aws-securitygroup"
    source = "git::https://github.com/ksnaidu/10AM.git//terraform-aws-securitygroup?ref=main"
    project =  var.project
    environment = var.environment

    sg_name = var.bastion_sg_name
    sg_description = var.bastion_sg_description 
    vpc_id = local.vpc_id  ##vpc-id stroed in ssm parameter
}

resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}


#roboshop-dev-frontend

resource "aws_security_group" "main" {
  name        =  "${var.project}-${var.environment}-${var.sg_name}"
  description = var.sg_description #mandatory for check the secuirty group details.
  vpc_id      = var.vpc_id
  
  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-${var.sg_name}"
    }
  )
}

// Definition of security group
resource "aws_security_group" "sg" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id
  tags = {
    Team        = "${var.team}"
    Product     = "${var.product}"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group_rule" "rules" {
  count = length(var.sg_rules)

  type              = var.sg_rules[count.index].type
  from_port         = var.sg_rules[count.index].from_port
  to_port           = var.sg_rules[count.index].to_port
  protocol          = var.sg_rules[count.index].protocol
  cidr_blocks       = [var.sg_rules[count.index].cidr_block]
  description       = var.sg_rules[count.index].description
  security_group_id = aws_security_group.sg.id
}

output "id" {
  value = aws_security_group.sg.id
}

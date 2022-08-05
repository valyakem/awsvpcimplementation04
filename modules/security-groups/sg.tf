resource "aws_security_group" "security-group" {
  name        = "${var.businessunit}-${var.environment}-${var.security-group-name}"
  description = var.security-group-description
  vpc_id      = var.vpc-id

  tags = local.common_tags

}

resource "aws_security_group_rule" "dynamic-ingress-rules-with-cidr-id" {
  count             = var.create-rules-with-cidr ? length(var.ingress-rules-with-cidr) : 0
  type              = "ingress"
  from_port         = var.ingress-rules-with-cidr[count.index].from-port
  to_port           = var.ingress-rules-with-cidr[count.index].to-port
  protocol          = var.ingress-rules-with-cidr[count.index].protocol
  cidr_blocks       = [var.ingress-rules-with-cidr[count.index].cidr-block]
  description       = var.ingress-rules-with-cidr[count.index].description
  security_group_id = aws_security_group.security-group.id

}

resource "aws_security_group_rule" "dynamic-ingress-rules-with-source-sg-id" {
  count                    = var.create-rules-with-sg-id ? length(var.ingress-rules-with-sg-id) : 0
  type                     = "ingress"
  from_port                = var.ingress-rules-with-sg-id[count.index].from-port
  to_port                  = var.ingress-rules-with-sg-id[count.index].to-port
  protocol                 = var.ingress-rules-with-sg-id[count.index].protocol
  source_security_group_id = var.ingress-rules-with-sg-id[count.index].source-security-group-id
  description              = var.ingress-rules-with-sg-id[count.index].description
  security_group_id        = aws_security_group.security-group.id

}

resource "aws_security_group_rule" "dynamic-ingress-rules-with-self-sg-id" {
  count             = var.create-rules-with-self-sg-id ? length(var.ingress-rules-with-self-sg-id) : 0
  type              = "ingress"
  from_port         = var.ingress-rules-with-self-sg-id[count.index].from-port
  to_port           = var.ingress-rules-with-self-sg-id[count.index].to-port
  protocol          = var.ingress-rules-with-self-sg-id[count.index].protocol
  self              = true
  description       = var.ingress-rules-with-self-sg-id[count.index].description
  security_group_id = aws_security_group.security-group.id

}



resource "aws_security_group_rule" "dynamic-egress-rules" {
  count             = length(var.egress-rules)
  type              = "egress"
  from_port         = var.egress-rules[count.index].from-port
  to_port           = var.egress-rules[count.index].to-port
  protocol          = var.egress-rules[count.index].protocol
  cidr_blocks       = [var.egress-rules[count.index].cidr-block]
  description       = var.egress-rules[count.index].description
  security_group_id = aws_security_group.security-group.id
}

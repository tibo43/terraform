environments = {
  "devops" = {
    KeyNameSSH     = "{aws_key_name}"
    instanceAMI    = "{aws_ami}"
    instanceType   = "t2.large"
    rootVolumeSize = 30
    rootVolumeType = "gp3"
    vpc_id         = "{aws_vpc_id}"
    subnet_id      = "{aws_subnet_id}"
    sg_rules = [
      {
        type        = "ingress"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        description = "INPUT: SSH"
      },
      {
        type        = "ingress"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        description = "INPUT: HTTPS"
      },
      {
        type        = "ingress"
        from_port   = 4443
        to_port     = 4443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
        description = "INPUT: HTTPS for dashboard Traefik"
      },
      {
        type        = "egress"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_block  = "0.0.0.0/0"
        description = "OUTPUT: ALL"
      }
    ]
    team        = "devops"
    product     = "tools"
    environment = "production"
    department  = "tech"
  },
  "blog" = {
    KeyNameSSH     = "{aws_key_name}"
    instanceAMI    = "{aws_ami}"
    instanceType   = "t3.micro"
    rootVolumeSize = 10
    rootVolumeType = "gp3"
    vpc_id         = "{aws_vpc_id}"
    subnet_id      = "{aws_subnet_id}"
    sg_rules = [
      {
        type                     = "ingress"
        from_port                = 22
        to_port                  = 22
        protocol                 = "tcp"
        cidr_block               = "0.0.0.0/0"
        source_security_group_id = ""
        description              = "INPUT: SSH"
      },
      {
        type                     = "ingress"
        from_port                = 80
        to_port                  = 80
        protocol                 = "tcp"
        cidr_block               = "0.0.0.0/0"
        source_security_group_id = ""
        description              = "INPUT: HTTP"
      },
      {
        type                     = "egress"
        from_port                = 0
        to_port                  = 0
        protocol                 = "-1"
        cidr_block               = "0.0.0.0/0"
        source_security_group_id = ""
        description              = "OUTPUT: ALL"
      }
    ]
    team        = "market"
    product     = "blog"
    environment = "production"
    department  = "growth"
  }

}

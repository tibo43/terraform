// Definition of ec2 environment
resource "aws_instance" "instance" {
  ami                    = var.instanceAMI
  instance_type          = var.instanceType
  key_name               = var.KeyNameSSH
  monitoring             = true
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.subnet_id
  root_block_device {
    volume_size           = var.rootVolumeSize
    volume_type           = var.rootVolumeType
    encrypted             = true
    delete_on_termination = false
    tags = {
      Team        = "${var.team}"
      Product     = "${var.product}"
      Department  = "${var.department}"
      Environment = "${var.environment}"
    }
  }
  tags = {
    Name        = "${var.name}"
    Team        = "${var.team}"
    Product     = "${var.product}"
    Department  = "${var.department}"
    Environment = "${var.environment}"
  }
}

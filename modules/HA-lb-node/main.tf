resource "aws_instance" "HA-lb-node" {
  ami                         = var.HA-lb-ami
  instance_type               = var.instance_type
  availability_zone           = var.az_B
  key_name                    = var.keyname
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.securitygroup_id]
  associate_public_ip_address = true
  user_data = templatefile("~/myproject/Module_kubernetes/modules/HA-lb-node/user_data.sh",
    {
        Master1 = var.Master1,
        Master2 = var.Master2,
        Master3 = var.Master3
    }
  )     
  tags = {
      Name = var.HA-lb-node
  }
}
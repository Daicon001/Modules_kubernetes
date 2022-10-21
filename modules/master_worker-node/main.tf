resource "aws_instance" "Master-Worker_node" {
  count                       = 7  
  ami                         = var.Master-Worker_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.securitygroup_id]
  key_name                    = var.keyname
  associate_public_ip_address = true

  tags = {
      Name = "${var.Master-Worker_node}${count.index}"
        }
}
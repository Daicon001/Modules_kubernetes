# Provision Ansible node
resource "aws_instance" "Ansible" {
  ami                    = var.Ansible_ami
  instance_type          = var.instance_type
  availability_zone      = var.az_A
  key_name               = var.keyname
  associate_public_ip_address = var.ass_pub_ip_address
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.securitygroup_id]
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/keypairs/test-key")
  }
  provisioner "file" {
    source      = "~/myproject/Module_kubernetes/environments/dev/playbooks"
    destination = "/home/ubuntu/playbooks"
  }
  provisioner "file" {
    source      = "~/keypairs/test-key"
    destination = "/home/ubuntu/test-key"
  }
  user_data              = templatefile("~/myproject/Module_kubernetes/modules/ansible/user_data.sh",
    {
      Master_IP1 = var.Master_IP1,
      Master_IP2 = var.Master_IP2,
      Master_IP3 = var.Master_IP3,
      Worker1    = var.Worker1
      Worker2    = var.Worker2
      Worker3    = var.Worker3
      Worker4    = var.Worker4
      HA-lb-PubIP= var.HA-lb-PubIP
      HA-lb-PrvIP= var.HA-lb-PrvIP

    }
  ) 
  tags = {
    Name = var.Ansible_Node_Name
  }
}
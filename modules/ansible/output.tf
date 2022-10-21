output "Ansible_pubIP" {
  value = aws_instance.Ansible.public_ip
}
output "Ansible_prvIP" {
  value = aws_instance.Ansible.private_ip
}
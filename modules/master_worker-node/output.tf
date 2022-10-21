output "Master-Worker_IP" {
    value = aws_instance.Master-Worker_node.*.public_ip
}
output "Master-Worker_ID" {
    value = aws_instance.Master-Worker_node.*.id
}
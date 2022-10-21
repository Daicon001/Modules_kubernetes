output "HA-Prv-IP" {
   value = aws_instance.HA-lb-node.private_ip
}
output "HA-Pub-IP" {
  value = aws_instance.HA-lb-node.public_ip
}
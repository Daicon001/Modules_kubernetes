output "Ansible-Node-IP" {
  value = module.dev_ansible.Ansible_pubIP
}
output "Master-Worker-IP" {
  value = module.dev_master_worker-node.Master-Worker_IP
}
output "HA-lb-Pub-IP" {
  value = module.dev_HA-lb-node.HA-Pub-IP
}
output "HA-lb-Prv-IP" {
  value = module.dev_HA-lb-node.HA-Prv-IP
}
output "Worker_lb" {
  value = module.dev_loadbalancer.Worker_lb
}
output "dev_route53" {
  value = module.dev_route53.Rout53_NameServer
}
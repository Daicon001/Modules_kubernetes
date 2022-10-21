variable "Ansible_ami" {
    default = "ami-06640050dc3f556bb"
}
variable "instance_type" {
    default = "t2.medium"
}
variable "az_A"{
    default = "eu-west-1a"
}
variable "securitygroup_id" {
   default="sg-036254702898cb50c"
}
variable "subnet_id" {
  default     = "subnet-76a8163a"
  description = "Subnet ID"
}
variable "keyname" {
    default = "kubenetes-key"  
}
variable "ass_pub_ip_address" {
  type        = bool
  default     = true
}
variable "Ansible_Node_Name" {
  default     = "Ansible_Node"
  description = "Name Tag for Ansible Node"
}
variable "Master_IP1" {
  description = "Master1 IP"
  default = "54.185.12.87"
}
variable "Master_IP2" {
  description = "Master2 IP"
  default = "54.185.12.87"
}
variable "Master_IP3" {
  description = "Master3 IP"
  default = "54.185.12.87"
}
variable "Worker1" {
  description = "Worker1 IP"
  default = "54.185.12.87"
}
variable "Worker2" {
  description = "Worker2 IP"
  default = "54.185.12.87"
}
variable "Worker3" {
  description = "Worker3 IP"
  default = "54.185.12.87"
}
variable "Worker4" {
  description = "Worker4 IP"
  default = "54.185.12.87"
}
variable "HA-lb-PubIP" {
  description = "HA-lb-PubIP IP"
  default = "54.185.12.87"
}
variable "HA-lb-PrvIP" {
  description = "HA-lb-PrvIP IP"
  default = "54.185.12.87"
}

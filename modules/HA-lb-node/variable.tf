variable "HA-lb-ami" {
    default = "ami-06640050dc3f556bb"
}
variable "instance_type" {
    default = "t2.medium"
}
variable "az_B"{
    default = "eu-west-1b"
}
variable "securitygroup_id" {
   default="sg-036254702898cb50c"
}
variable "subnet_id" {
  default     = "subnet-76a8163a"
  description = "Subnet ID"
}
variable "keyname" {
    default = "test-key"  
}
variable "ass_pub_ip_address" {
  type        = bool
  default     = true
}
variable "HA-lb-node" {
  default     = "HA-lb-node"
  description = "Name Tag for Ansible Node"
}
variable "Master1" {
  description = "Master1 IP"
  default = "54.185.12.87"
}
variable "Master2" {
  description = "Master2 IP"
  default = "54.185.12.87"
}
variable "Master3" {
  description = "Master3 IP"
  default = "54.185.12.87"
}
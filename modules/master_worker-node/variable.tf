variable "Master-Worker_ami" {
    default = "ami-06640050dc3f556bb"
}
variable "instance_type" {
    default = "t2.medium"
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
variable "Master-Worker_node" {
  default     = "Master-Worker_node"
  description = "Name Tag for Ansible Node"
}
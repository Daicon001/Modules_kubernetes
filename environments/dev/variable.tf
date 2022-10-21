variable "key" {
  description = "The path on s3-Bucket that state file will be stored"
  default = "global/s3/terraform.tfstate"
}
variable "region" {
  description = "Region where the whole project will be provisioned"
  default = "eu-west-1"
  
}
variable "dev_instance_ami" {
  default = "ami-096800910c1b781ba"
}
variable "dev_key_name" {
  default = "test-key"
}
variable "dev_path_to_public_key" {
  default     = "~/keypairs/test-key.pub"
  description = "path to public key"
}

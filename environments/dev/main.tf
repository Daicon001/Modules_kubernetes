terraform {
  backend "s3" {
    bucket         = "terraformstatedaicon"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state_locking"
    encrypt        = true
  }
}
module "dev_s3_bucket-dynamodb" {
  source = "../../modules/s3_Dynamo_statefile"
}
module "dev_vpc" {
  source = "../../modules/vpc"
}
module "dev_securitygroups" {
  source = "../../modules/securitygroups"
  vpc_id = module.dev_vpc.vpc_id
}
module "keypair" {
  source             = "../../modules/key-pair"
  path_to_public_key = var.dev_path_to_public_key
  key_name           = var.dev_key_name
}
module "dev_master_worker-node" {
  source      = "../../modules/master_worker-node"
  Master-Worker_ami   = var.dev_instance_ami
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id        = module.dev_vpc.PUB_SN1
  keyname          = module.keypair.keypair_id
}
module "dev_HA-lb-node" {
  source      = "../../modules/HA-lb-node"
  HA-lb-ami   = var.dev_instance_ami
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id        = module.dev_vpc.PUB_SN2
  keyname          = module.keypair.keypair_id
  Master1          = module.dev_master_worker-node.Master-Worker_IP[0]
  Master2          = module.dev_master_worker-node.Master-Worker_IP[1]
  Master3          = module.dev_master_worker-node.Master-Worker_IP[2]
}
module "dev_ansible" {
  source           = "../../modules/ansible"
  Ansible_ami      = var.dev_instance_ami
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id        = module.dev_vpc.PUB_SN1
  keyname          = module.keypair.keypair_id
  Master_IP1       = module.dev_master_worker-node.Master-Worker_IP[0]
  Master_IP2       = module.dev_master_worker-node.Master-Worker_IP[1]
  Master_IP3       = module.dev_master_worker-node.Master-Worker_IP[2]
  Worker1          = module.dev_master_worker-node.Master-Worker_IP[3]
  Worker2          = module.dev_master_worker-node.Master-Worker_IP[4]
  Worker3          = module.dev_master_worker-node.Master-Worker_IP[5]
  Worker4          = module.dev_master_worker-node.Master-Worker_IP[6]
  HA-lb-PubIP      = module.dev_HA-lb-node.HA-Pub-IP
  HA-lb-PrvIP      = module.dev_HA-lb-node.HA-Prv-IP
}
module "dev_loadbalancer" {
  source           = "../../modules/loadbalancer"
  subnet_id        = module.dev_vpc.PUB_SN1
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  worker1_id       = module.dev_master_worker-node.Master-Worker_ID[3]
  worker2_id       = module.dev_master_worker-node.Master-Worker_ID[4]
  worker3_id       = module.dev_master_worker-node.Master-Worker_ID[5]
  worker4_id       = module.dev_master_worker-node.Master-Worker_ID[6] 
}
module "dev_route53" {
  source      = "../../modules/route53"
  lb_dns-name = module.dev_loadbalancer.Worker_lb
  lb_zone_id  = module.dev_loadbalancer.Worker_lb_zone_id
}

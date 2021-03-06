# Terraform Configuration used for full integration test

variable "aws_vpc_security_group_ids" {
  type = "list"
}

variable "aws_subnet_id" {}

module "rubrik_aws_cloud_cluster" {
  source = "../"

  aws_disable_api_termination = false
  aws_vpc_security_group_ids  = "${var.aws_vpc_security_group_ids}"
  aws_subnet_id               = "${var.aws_subnet_id}"
  cluster_name                = "terraform-module-cloud-cluster-testing"
  admin_email                 = "build@rubrik.com"
  dns_search_domain           = ["rubrikbuild.com"]
  dns_name_servers            = ["8.8.8.8"]
  timeout                     = 30
}

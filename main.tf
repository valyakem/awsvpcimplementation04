# provider "aws" {
#   region = var.region
# }

locals {
  name   = var.name
  region = var.region
  tags = {
    Owner       = "${var.application-owner}"
    Environment = "${var.environment}"
    Name        = "${var.application-name}"
  }
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "./modules/vpc"

  name = local.name
  cidr = var.cidr # 10.0.0.0/8 is reserved for EC2-Classic

  azs                 = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets

  manage_default_network_acl = var.manage_default_network_acl
  default_network_acl_tags   = { Name = "${local.name}-default" }

  manage_default_route_table = var.manage_default_route_table
  default_route_table_tags   = { Name = "${local.name}-default" }

  manage_default_security_group = var.manage_default_security_group
  default_security_group_tags   = { Name = "${local.name}-default" }

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support


  enable_nat_gateway = var.enable_nat_gateway


  enable_dhcp_options              = var.enable_dhcp_options
  dhcp_options_domain_name         = var.dhcp_options_domain_name
  dhcp_options_domain_name_servers = var.dhcp_options_domain_name_servers

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  enable_flow_log                      = var.enable_flow_log
  create_flow_log_cloudwatch_log_group = var.create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role  = var.create_flow_log_cloudwatch_iam_role
  flow_log_max_aggregation_interval    = var.flow_log_max_aggregation_interval

  tags = local.tags
}



################################################################################
# Supporting Resources
################################################################################

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group" "vpc_tls" {
  name_prefix = "${local.name}-vpc_tls"
  description = var.tlc-description
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  tags = local.tags
}


//SECURITY GROUPS
//============================
module "dynamic-sg-with-egressrule-and-ingressrules" {
  source                     = "./modules/security-groups"

  security-group-name        = var.security-group-name
  security-group-description = var.security-group-description
  vpc-id                     = var.vpc-id
  ingress-rules-with-cidr = var.ingress-rules-with-cidr

  egress-rules             = var.egress-rules
  ingress-rules-with-sg-id = var.ingress-rules-with-sg-id

  # Tagging variabless
  businessunit        = var.businessunit
  data-classification = var.data-classification
  environment         = var.environment
  application-id      = var.application-id
  application-name    = var.application-name
  application-owner   = var.application-owner
  application-role    = var.application-role
  SCOA                = var.SCOA
  project-id          = var.project-id 
  PII                 = var.PII
  compliance          = var.compliance
}

module "vpc_endpoints" {
  source                     = "./modules/vpc-endpoints"
}

//====================================================================//
//                  NETWORKING SETTINGS                               //
//====================================================================//
#information section
name                = "nbvpc"
region              = "us-east-1"
Owner               = "user"
Environment         = "staging"
Name                = "nbvpc"


#network settings
private_subnets     = ["20.10.1.0/24", "20.10.2.0/24", "20.10.3.0/24"]
public_subnets      = ["20.10.11.0/24", "20.10.12.0/24", "20.10.13.0/24"]
# database_subnets    = ["20.10.21.0/24", "20.10.22.0/24", "20.10.23.0/24"]
# elasticache_subnets = ["20.10.31.0/24", "20.10.32.0/24", "20.10.33.0/24"]
# redshift_subnets    = ["20.10.41.0/24", "20.10.42.0/24", "20.10.43.0/24"]
# intra_subnets       = ["20.10.51.0/24", "20.10.52.0/24", "20.10.53.0/24"]

cidr = "20.10.0.0/16"

#parameters acccess control list (ACL)
manage_default_network_acl = true
manage_default_route_table = true
manage_default_security_group = true

#parameters dns
enable_dns_hostnames = true
enable_dns_support   = true

#parameters NAT gw
enable_nat_gateway = true
single_nat_gateway = true


//#parameters dhcp
enable_dhcp_options              = true
dhcp_options_domain_name         = "service.consul"
dhcp_options_domain_name_servers = ["127.0.0.1", "10.10.0.2"]

# VPC Flow Logs (Cloudwatch log group and IAM role will be created)
enable_flow_log                      = true
create_flow_log_cloudwatch_log_group = true
create_flow_log_cloudwatch_iam_role  = true
flow_log_max_aggregation_interval    = 60

#TLS
tlc-description = "Allow TLS inbound traffic"


//=====================================================================//
//                          SECURITY GROUPS                            //
//=====================================================================//
security-group-name         = "sg-with-egressrule-and-ingressrules-sg03"
security-group-description  = "sg-with-egressrule-and-ingressrules-sg03"
# vpc-id                      = module.vpc.vpc_id


//====================================================================//
//                  TAGS SETTINGS                                     //
//====================================================================//
business_unit               = "inf"
data_classification         = "internal"
environment                 = "sandbox"
application-id              = "1234"
application-name            = "tehchub"
application-owner           = "manpreet.singh1@rci.rogers.com"
application-role            = "app"
SCOA                        = "123.1234.1234.1234.12345"
project-id                  = "123456"
PII                         = "NO"
compliance                  = "None"
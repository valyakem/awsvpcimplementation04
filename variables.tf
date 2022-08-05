//====================================================================//
//                  NETWORKING VARIABLE                               //
//====================================================================//
variable "name" { default = "" }
variable "region" { default = "" }
variable "Owner" { default = "" }
variable "Environment" { default = "" }
variable "Name" { default = "" }

variable "private_subnets" { default = []}
variable "public_subnets" { default = []}
variable "database_subnets" { default = []}
variable "elasticache_subnets" { default = []}
variable "redshift_subnets" { default = []}
variable "intra_subnets" { default = []}

variable "cidr" { default = "" }


#parameters database
variable "create_database_subnet_group" { default = "" }

#parameters acccess control list (ACL)
variable "manage_default_network_acl" { default = "" }
variable "manage_default_route_table" { default = "" }
variable "manage_default_security_group" { default = "" }

#parameters dns
variable "enable_dns_hostnames" { default = "" }
variable "enable_dns_support" { default = "" }
variable "enable_classiclink" { default = "" }
variable "enable_classiclink_dns_support" { default = "" }

#parameters NAT gw
variable "enable_nat_gateway" { default = "" }
variable "single_nat_gateway" { default = "" }
variable "enable_vpn_gateway" { default = "" }

//#parameters dhcp
variable "enable_dhcp_options" { default = "" }
variable "dhcp_options_domain_name" { default = "" }
variable "dhcp_options_domain_name_servers" { default = "" }

# VPC Flow Logs (Cloudwatch log group and IAM role will be created)
variable "enable_flow_log" { default = "" }
variable "create_flow_log_cloudwatch_log_group" { default = "" }
variable "create_flow_log_cloudwatch_iam_role" { default = "" }
variable "flow_log_max_aggregation_interval" { default = "" }

#TLS
variable "tlc-description" { default = "" }


//====================================================================//
//                  TAGS VARIABLE                                     //
//====================================================================//
variable "security-group-name" { default = "" }   
variable "security-group-description" { default = "" }   
variable "vpc-id" { default = "" }

//====================================================================//
//                  TAGS VARIABLES                                    //
//====================================================================//
variable "data_classification" { default = "" } 
variable "business_unit" { default = "" }
variable "environment" { default = "" }
variable "application-id" { default = "" }
variable "application-name" { default = "" }
variable "application-owner" { default = "" }
variable "application-role" { default = "" }
variable "SCOA" { default = "" }
variable "project-id" { default = "" }
variable "PII" { default = "" }
variable "compliance" { default = "" }
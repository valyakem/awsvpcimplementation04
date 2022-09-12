/*
PLEASE DECLARE ONLY VARIABLE HERE. ALL DEFAULT VALUES ARE TO BE ENTERED IN THE TERRAFORM.TFVARS FILE FOUND IN THIS ROOT MODULE
THE TERRAFORM.TFVARS FILE WILL NOT BE PUSHED WITH YOUR CODE TO THE REPOSITORY. THIS WAY, YOUR VALUES ARE NOT PUSH TO THE REMOTE REGISTRY
*/

//====================================================================//
//                  NETWORKING VARIABLE                               //
//====================================================================//
variable "name" { 
    default = "" 
    }

variable "region" { 
    default = "" 
    }

//private subnet variable
variable "private_subnets" { 
    description = "Locate this variable in terraform.tfvars file. Declare all private subnets on the space provided."
    default = []

    validation {
    condition     = length(var.private_subnets) > 2
    error_message = "This application requires at least two private subnets.Example [\"xx.xx.xx/xx\", \"xx.xx.xx/xx\", \"xx.xx.xx/xx\"]."
  }
    }

//public subnet variable
variable "public_subnets" { 
    default = []
    }

//Classless Interdomain Routing variable
variable "cidr" { default = "" }


//manged deault network acl
variable "manage_default_network_acl" { 
    default = "" 
    }

//Managed default route table
variable "manage_default_route_table" { 
    default = "" 
    }

//managed default security group
variable "manage_default_security_group" { 
    default = "" 
    }

//Managed dns hostnames
variable "enable_dns_hostnames" { 
    default = "" 
    }

//Enable dns. settings here should be yes or no
variable "enable_dns_support" { 
    default = "" 
    
    }

#Enable default NAT gateway. Only yes or no is acceptable
variable "enable_nat_gateway" { 
    default = "" 
    }

//#parameters dhcp
variable "enable_dhcp_options" { 
    default = "" 
    }

#Set dhcp options
variable "dhcp_options_domain_name" { 
    default = "" 
    }

variable "dhcp_options_domain_name_servers" { 
    default = "" 
    }

# VPC Flow Logs (Cloudwatch log group and IAM role will be created)
variable "enable_flow_log" { 
    default = "" 
    }

//flow log cloudwatch log group
variable "create_flow_log_cloudwatch_log_group" { 
    default = "" 
    }

//flowlog cloudwatch iam role
variable "create_flow_log_cloudwatch_iam_role" { 
    default = "" 
    }

//flowlog max aggregation interval
variable "flow_log_max_aggregation_interval" { 
    default = "" 
    }

#TLS description
#----------------------
variable "tlc-description" { 
    default = "" 
    }


//====================================================================//
//                  SECURITY GROUP VARIABLE                                     //
//====================================================================//
//security group name
variable "security-group-name" {
  default     = ""
  type        = string
  description = "Please enter security-group Name"
}

//security group description
variable "security-group-description" {
  default     = ""
  type        = string
  description = "Please provide security-group description"
}

//virtual private cloud identification
variable "vpc-id" {
  default     = ""
  type        = string
  description = "Please provide VPC ID"
}

//declare all egress rules here. using commas to seperate them e.g. { },{}"
variable "egress-rules" {
  description     = "List of security group rules"
  type            = list(map(string))
  default = [ {
  } ]
}

//declare all ingress rules here. using commas to seperate them e.g. { },{}"
variable "ingress-rules-with-sg-id" {
  description     = "List of security group ingress rules"
  type            = list(map(string))
  default = [ {
  } ]
}

variable "ingress-rules-with-cidr" {
  description     = "List of ingress rules with cidr rules"
  type            = list(map(string))
  default = [ {
  } ]
}
//====================================================================//
//                  TAGS VARIABLES                                    //
//====================================================================//
//data classification.
variable "data-classification" {
  default     = "restricted"
  type        = string
  description = "Please specify the DataClassification type"

  validation {
    condition     = contains(["restricted", "confidential", "internal", "public"], var.data-classification)
    error_message = "Argument \"data-classification\" must be \"restricted\" or \"confidential\" or \"internal\" or \"public\" ."
  }
}

//Area of the business otherwise known as business unit
variable "businessunit" {
  default     = ""
  type        = string
  description = "Provide the businessunit Name"
}

//Where to deploy your vpc. Values within validation
variable "environment" {
  default     = ""
  type        = string
  description = "Please enter the Environment type"

  //validate the entry to make sure only values contained in the conditions are entered.
  validation {
    condition     = contains(["sandbox", "qa", "dev", "ss", "rss", "staging", "prd", "dscworkstation", "dscproduction"], var.environment)
    error_message = "Argument \"environment\" must be one of \"sandbox\", \"qa\", \"ss\", \"rss\", \"staging\",  \"prd\", \"dscworkstation\", \"dscproduction\" ."
  }
}

//If deploying application, what is the application identification?
variable "application-id" {
  default     = "1234"
  type        = string
  description = "Please enter the Application ID"

  validation {
    condition     = can(regex("^[0-9]{4}$", var.application-id))
    error_message = "Please enter the valid application-id."
  }
}

//placeholder or variable for application name
variable "application-name" {
  default     = ""
  type        = string
  description = "Please enter Application Name"
}

//application owner variable
variable "application-owner" {
  default     = ""
  type        = string
  description = "Please enter Email ID of the owner or domain/username or service account"

  //validate to make suer only the rci.rogers.com email extensions are accepted.
  validation {
    condition     = can(regex("^[A-Z0-9a-z._%+-]+@rci.rogers.com$", var.application-owner))
    error_message = "Please enter the valid  mail ID of the application owner or domain/username or service account."
  }
}

//enter application role. 
variable "application-role" {
  default     = ""
  type        = string
  description = "Please enter the Application Role"

  validation {
    condition     = contains(["database", "web", "app"], var.application-role)
    error_message = "Argument \"application-role\" must be \"database\" or \"web\" or \"app\"."
  }
}

variable "SCOA" {
  default     = "123.1234.1234.1234.12345"
  type        = string
  description = "Please enter the SCOA"

  validation {
    condition     = can(regex("^[0-9]{3}[.][0-9]{4}[.][0-9]{4}[.][0-9]{4}[.][0-9]{5}$", var.SCOA))
    error_message = "Please enter the valid SCOA ID."
  }
}


//provide the project id. 
variable "project-id" {
  default     = "123456"
  type        = string
  description = "Please enter the ProjectID ID"

  validation {
    condition     = can(regex("^[0-9]{6}$", var.project-id))
    error_message = "Please enter the valid 6 digit project-id."
  }
}

variable "PII" { 
    default = "" 
    }

variable "compliance" {
  default = "None"
  type    = string

  validation {
    condition     = contains(["None", "PCI", "SOX", "SOX and PCI"], var.compliance)
    error_message = "Argument \"compliance\" must be \"None\" or \"PCI\" or \"SOX\" or \"SOX and PCI\"."
  }
}





















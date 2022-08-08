//====================================================================//
//                  NETWORKING VARIABLE                               //
//====================================================================//
variable "name" { 
    default = "" 
    }

variable "region" { 
    default = "" 
    }

# variable "Owner" { 
#     default = "" 
#     }

# variable "Environment" { 
#     default = "" 
#     }

# variable "Name" { 
#     description = "Locate this Name variable in terraform.tfvars file. What name to be attributed to the VPC"
#     default = "" 

#     validation {
#     condition     = length(var.Name) > 0
#     error_message = "The Name value must be a valid string greater than 10 characters"
#   }
    # }

variable "private_subnets" { 
    description = "Locate this variable in terraform.tfvars file. Declare all private subnets on the space provided."
    default = []

    validation {
    condition     = length(var.private_subnets) > 2
    error_message = "This application requires at least two private subnets.Example [\"xx.xx.xx/xx\", \"xx.xx.xx/xx\", \"xx.xx.xx/xx\"]."
  }
    }

variable "public_subnets" { 
    default = []
    }

variable "cidr" { default = "" }


#parameters acccess control list (ACL)
variable "manage_default_network_acl" { 
    default = "" 
    }

variable "manage_default_route_table" { 
    default = "" 
    }

variable "manage_default_security_group" { 
    default = "" 
    }

#parameters dns
variable "enable_dns_hostnames" { 
    default = "" 
    }

variable "enable_dns_support" { 
    default = "" 
    
    }

#parameters NAT gw
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

variable "create_flow_log_cloudwatch_log_group" { 
    default = "" 
    }

variable "create_flow_log_cloudwatch_iam_role" { 
    default = "" 
    }

variable "flow_log_max_aggregation_interval" { 
    default = "" 
    }

#TLS
#----------------------
variable "tlc-description" { 
    default = "" 
    }


//====================================================================//
//                  SECURITY GROUP VARIABLE                                     //
//====================================================================//
variable "security-group-name" {
  default     = ""
  type        = string
  description = "Please enter security-group Name"
}

variable "security-group-description" {
  default     = ""
  type        = string
  description = "Please provide security-group description"
}

variable "vpc-id" {
  default     = ""
  type        = string
  description = "Please provide VPC ID"
}

//====================================================================//
//                  TAGS VARIABLES                                    //
//====================================================================//
variable "data-classification" {
  default     = "restricted"
  type        = string
  description = "Please specify the DataClassification type"

  validation {
    condition     = contains(["restricted", "confidential", "internal", "public"], var.data-classification)
    error_message = "Argument \"data-classification\" must be \"restricted\" or \"confidential\" or \"internal\" or \"public\" ."
  }
}

variable "businessunit" {
  default     = ""
  type        = string
  description = "Provide the businessunit Name"
}

variable "environment" {
  default     = ""
  type        = string
  description = "Please enter the Environment type"

  validation {
    condition     = contains(["sandbox", "qa", "dev", "ss", "rss", "staging", "prd", "dscworkstation", "dscproduction"], var.environment)
    error_message = "Argument \"environment\" must be one of \"sandbox\", \"qa\", \"ss\", \"rss\", \"staging\",  \"prd\", \"dscworkstation\", \"dscproduction\" ."
  }
}

variable "application-id" {
  default     = "1234"
  type        = string
  description = "Please enter the Application ID"

  validation {
    condition     = can(regex("^[0-9]{4}$", var.application-id))
    error_message = "Please enter the valid application-id."
  }
}

variable "application-name" {
  default     = ""
  type        = string
  description = "Please enter Application Name"
}


variable "application-owner" {
  default     = ""
  type        = string
  description = "Please enter Email ID of the owner or domain/username or service account"

  validation {
    condition     = can(regex("^[A-Z0-9a-z._%+-]+@rci.rogers.com$", var.application-owner))
    error_message = "Please enter the valid  mail ID of the application owner or domain/username or service account."
  }
}

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

#=======================
#### Tagging variables ####

# variable "TFE" {
#   default = "YES"
#   type    = string

#   validation {
#     condition     = contains(["YES"], var.TFE)
#     error_message = "Argument \"TFE\" must be \"YES\"."
#   }
# }





















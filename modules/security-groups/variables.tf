
variable "ingress-rules-with-cidr" {
  type = list(object({
    from-port   = string
    to-port     = string
    protocol    = string
    cidr-block  = string
    description = string

  }))

  default = []
}

variable "ingress-rules-with-sg-id" {
  type = list(object({
    from-port                = string
    to-port                  = string
    protocol                 = string
    source-security-group-id = string
    description              = string

  }))

  default = []
}

variable "ingress-rules-with-self-sg-id" {
  type = list(object({
    from-port   = string
    to-port     = string
    protocol    = string
    description = string

  }))

  default = []
}

variable "egress-rules" {
  type = list(object({
    from-port   = string
    to-port     = string
    protocol    = string
    cidr-block  = string
    description = string

  }))

  default = []
}

variable "create-rules-with-cidr" {
  type        = bool
  default     = true
  description = "This value defines that SG rules will create with cidr blocks."

  validation {
    condition     = contains([true], var.create-rules-with-cidr)
    error_message = "Argument \"create-rules-with-cidr\" must be \"true\"."
  }
}
variable "create-rules-with-sg-id" {
  type        = bool
  default     = true
  description = "This value defines that SG rules will create with source SG ID."

  validation {
    condition     = contains([true], var.create-rules-with-sg-id)
    error_message = "Argument \"create-rules-with-sg-id\" must be \"true\"."
  }
}

variable "create-rules-with-self-sg-id" {
  type        = bool
  default     = true
  description = "This value defines that SG rules will create with self SG ID."

  validation {
    condition     = contains([true], var.create-rules-with-self-sg-id)
    error_message = "Argument \"create-rules-with-self-sg-id\" must be \"true\"."
  }
}


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



#### Tagging variables ####

variable "TFE" {
  default = "YES"
  type    = string

  validation {
    condition     = contains(["YES"], var.TFE)
    error_message = "Argument \"TFE\" must be \"YES\"."
  }
}

variable "data-classification" {
  default     = "restricted"
  type        = string
  description = "Please specify the DataClassification type"

  validation {
    condition     = contains(["restricted", "confidential", "internal", "public"], var.data-classification)
    error_message = "Argument \"data-classification\" must be \"restricted\" or \"confidential\" or \"internal\" or \"public\" ."
  }
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
  default = "NO"
  type    = string

  validation {
    condition     = contains(["NO", "YES"], var.PII)
    error_message = "Argument \"PII\" must be \"NO\" or \"YES\"."
  }
}

variable "compliance" {
  default = "None"
  type    = string

  validation {
    condition     = contains(["None", "PCI", "SOX", "SOX and PCI"], var.compliance)
    error_message = "Argument \"compliance\" must be \"None\" or \"PCI\" or \"SOX\" or \"SOX and PCI\"."
  }
}

variable "businessunit" {
  default     = ""
  type        = string
  description = "Provide the businessunit Name"
}

variable "application-name" {
  default     = ""
  type        = string
  description = "Please enter Application Name"
}

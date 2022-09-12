##################Tags required for all AWS resources############
locals {
  common_tags = {
    Name                = "${var.businessunit}-${var.environment}-${var.security-group-name}"
    environment         = var.environment
    project-id          = var.project-id
    application-owner   = var.application-owner
    data-classification = var.data-classification
    application-id      = var.application-id
    application-role    = var.application-role
    application-name    = var.application-name
    PII                 = var.PII
    compliance          = var.compliance
    SCOA                = var.SCOA
    TFE                 = var.TFE
    businessunit        = var.businessunit
  }
}


# #EC2 instance build
# #-------------------------
# vpc_id = "vpc-040c07e3a2f885807"
# subnet_id = "172.31.0.0/20"
# ami_id = "ami-0d1c65a30da7a25aa"
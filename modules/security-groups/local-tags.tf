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

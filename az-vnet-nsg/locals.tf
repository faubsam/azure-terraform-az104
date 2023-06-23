locals {
  owners = var.business-division
  env = var.environment
  resource-name-prefix = "${var.business-division}-${var.environment}"
  basic_tags = {
    owners = local.owners,
    environment = local.env
  }
}
locals {
  owners = var.business-division
  env = var.environment
  resource-name-prefix = "${var.business-division}-${var.env}"
  basic_tags = {
    owners = local.owners,
    environment = local.env
  }
}
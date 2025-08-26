locals {
  common_Tags = {
    Project = var.project
    Environment = var.environment
    Terraform = true

  }
}
## project name, env these deatials easily identification purpose we create this one.

locals {
  common_tags = {
    project = var.project
    environment = var.environment
    terraform = "true"
  }
}

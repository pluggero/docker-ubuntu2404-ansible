##################################################################################
# VARIABLE DECLARATIONS
##################################################################################

variable "ansible_user" {
  type        = string
  default     = ""
  description = "User for ansible provisioning"
}

variable "image_name" {
  type        = string
  default     = ""
  description = "Name of the Docker image"
}

variable "image_tag" {
  type        = string
  default     = null
  description = "Tag for the Docker image (defaults to current date YYYY.MM.DD)"
}

locals {
  image_tag = var.image_tag != null ? var.image_tag : formatdate("YYYY.MM.DD", timestamp())
}

variable "docker_registry" {
  type        = string
  default     = ""
  description = "Docker registry"
}

variable "maintainer" {
  type        = string
  default     = ""
  description = "Image maintainer"
}


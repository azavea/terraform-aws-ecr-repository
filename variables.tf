variable "repository_name" {}

variable "attach_lifecycle_policy" {
  default = false
}

variable "days_to_retain_images" {
  default = 7
}

variable "lifecycle_policy" {
  default = ""
}

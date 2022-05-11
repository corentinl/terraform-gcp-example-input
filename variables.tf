variable "instance_name" {
  type        = string
  description = "the instance name."
  default     = "gce-defaultname"

  validation {
    condition     = length(var.instance_name) > 4 && substr(var.instance_name, 0, 4) == "gce-"
    error_message = "The instance_name value should start with \"gce-\"."
  }
}

variable "zone_name" {
  type        = list(string)
  description = "the list of zone we want the instance in"
  default = [
    "europe-west1-b",
    "europe-west1-c",
  ]
}

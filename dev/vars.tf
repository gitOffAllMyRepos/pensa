variable "env" {
  description = "The environment name"
  type        = string
}

variable "sub_env" {
  description = "The sub-environment name"
  type        = string
  default     = ""
}

variable "instances" {
  description = "List of instances to create"
  type = list(object({
    name           = string
    size           = string
    type           = string
    instance_count = number
  }))
}

variable "databases" {
  description = "List of databases to create"
  type = list(object({
    name     = string
    size     = string
    db_type  = string
    type     = string
    db_count = number
  }))
}

variable "k8s_containers" {
  description = "List of Kubernetes containers to create"
  type = list(object({
    name      = string
    size      = string
    parent    = string
    type      = string
    k8s_count = number
    mem       = optional(number)
  }))
  default = []
}

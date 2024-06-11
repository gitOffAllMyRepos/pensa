variable "env" {
  description = "The environment name"
  type        = string
}

variable "sub_env" {
  description = "The sub-environment name"
  type        = string
  default     = ""
}

variable "name" {
  description = "The base name of the instance"
  type        = string
}

variable "size" {
  description = "The size of the instance"
  type        = string
}

variable "type" {
  description = "The type of the instance"
  type        = string
}

variable "instance_count" {
  description = "The number of instances to create"
  type        = number
}

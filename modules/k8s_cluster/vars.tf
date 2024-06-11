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
  description = "The base name of the container"
  type        = string
}

variable "size" {
  description = "The size of the container"
  type        = string
}

variable "parent_name" {
  description = "The parent object name"
  type        = string
}

variable "type" {
  description = "The type of the resource"
  type        = string
}

variable "k8s_count" {
  description = "The number of containers to create"
  type        = number
}

variable "mem" {
  description = "Memory size for the container"
  type        = number
  default     = null

}
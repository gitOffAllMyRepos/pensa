variable "name" {
  description = "Name of the Kubernetes container"
  type        = string
}

variable "size" {
  description = "Size of the Kubernetes container"
  type        = string
}

variable "mem" {
  description = "Memory allocated to the Kubernetes container"
  type        = number
}
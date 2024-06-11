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
  description = "The base name of the database"
  type        = string
}

variable "size" {
  description = "The size of the database"
  type        = string
}

variable "db_type" {
  description = "The type of the database"
  type        = string
}

variable "type" {
  description = "The type of the resource"
  type        = string
}

variable "db_count" {
  description = "The number of databases to create"
  type        = number
}
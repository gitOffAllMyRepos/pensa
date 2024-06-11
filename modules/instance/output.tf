output "instance_name" {
  value = terraform_data.instance[*].input.name
}
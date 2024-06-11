output "k8s_container_name" {
  value = terraform_data.k8s_container[*].input.name
}
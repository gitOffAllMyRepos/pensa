output "db_name" {
  value = terraform_data.db[*].input.name
}
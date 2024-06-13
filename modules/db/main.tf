resource "terraform_data" "database" {
  input = {
    name    = var.name
    size    = var.size
    db_type = var.db_type
  }

  lifecycle {
    ignore_changes = [input["name"]]
  }
}
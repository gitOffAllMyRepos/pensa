resource "terraform_data" "instance" {
  input = {
    name = var.name
    size = var.size
  }

  lifecycle {
    ignore_changes = [input["name"]]
  }
}
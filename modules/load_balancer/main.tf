resource "terraform_data" "load_balancer" {
  input = {
    name = var.name
    size = var.size
    type = var.type
  }

  lifecycle {
    ignore_changes = [input["name"]]
  }
}

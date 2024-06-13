resource "terraform_data" "k8s_container" {
  input = {
    name = var.name
    size = var.size
    mem  = var.mem
  }

  lifecycle {
    ignore_changes = [input["name"]]
  }
}
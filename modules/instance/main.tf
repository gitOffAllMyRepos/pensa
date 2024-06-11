resource "terraform_data" "instance" {
  count = var.instance_count
  input = {
    name = "${var.env}${var.sub_env != "" ? "-${var.sub_env}" : ""}-${var.type}-${var.name}-${format("%02d", count.index + 1)}"
    size = var.size
  }
}
resource "terraform_data" "db" {
  count = var.db_count
  input = {
    name    = "${var.env}${var.sub_env != "" ? "-${var.sub_env}" : ""}-${var.type}-${var.db_type}-${var.name}-${format("%02d", count.index + 1)}"
    size    = var.size
    db_type = var.db_type
  }
}
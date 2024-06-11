resource "terraform_data" "k8s_container" {
  count = var.k8s_count
  input = merge(
    {
      name = "${var.env}${var.sub_env != "" ? "-${var.sub_env}" : ""}-${var.parent_name}-${var.type}-${var.name}-${format("%02d", count.index + 1)}"
      size = var.size
    },
    var.mem != null ? { mem = var.mem } : {}
  )
}
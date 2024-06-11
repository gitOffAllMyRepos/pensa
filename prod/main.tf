module "prod_instance" {
  source         = "../modules/instance"
  for_each       = { for idx, inst in var.instances : idx => inst }
  env            = var.env
  sub_env        = var.sub_env
  name           = each.value.name
  size           = each.value.size
  type           = each.value.type
  instance_count = each.value.instance_count
}

module "prod_db" {
  source   = "../modules/db"
  for_each = { for idx, db in var.databases : idx => db }
  env      = var.env
  sub_env  = var.sub_env
  name     = each.value.name
  size     = each.value.size
  db_type  = each.value.db_type
  type     = each.value.type
  db_count = each.value.db_count
}

module "prod_k8s_container" {
  source      = "../modules/k8s_cluster"
  for_each    = { for idx, k8s in var.k8s_containers : idx => k8s }
  env         = var.env
  sub_env     = var.sub_env
  name        = each.value.name
  size        = each.value.size
  parent_name = each.value.parent
  type        = each.value.type
  k8s_count   = each.value.k8s_count
  mem         = each.value.mem
}
module "instances" {
  source   = "./modules/instance"
  for_each = { for inst in local.instance_names : inst.name => inst }
  name     = each.value.name
  size     = each.value.size
}

module "databases" {
  source   = "./modules/db"
  for_each = { for db in local.database_names : db.name => db }
  name     = each.value.name
  size     = each.value.size
  db_type  = each.value.db_type
}

module "k8s_containers" {
  source   = "./modules/k8s_cluster"
  for_each = { for k8s in local.k8s_container_names : k8s.name => k8s }
  name     = each.value.name
  size     = each.value.size
  mem      = each.value.mem
}


module "load_balancers" {
  source   = "./modules/load_balancer"
  for_each = { for lb in local.load_balancer_names : lb.name => lb }
  name     = each.value.name
  size     = each.value.size
  type     = each.value.type
}

output "instance_names" {
  value = [for inst in module.instances : inst.instance_name]
}

output "database_names" {
  value = [for db in module.databases : db.db_name]
}

output "k8s_container_names" {
  value = [for k8s in module.k8s_containers : k8s.k8s_container_name]
}

output "load_balancer_names" {
  value = [for lb in module.load_balancers : lb.load_balancer_name]
}
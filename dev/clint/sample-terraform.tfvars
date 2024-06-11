env     = "dev"
sub_env = "clint"

instances = [
  { name = "wks", size = "xsmall", type = "instance", instance_count = 1 }
]

databases = [
  { name = "nsdb", size = "xsmall", db_type = "nosql", type = "db", db_count = 1 },
  { name = "rdb", size = "xsmall", db_type = "mysql", type = "db", db_count = 1 }
]

k8s_containers = [
  { name = "svc1", size = "xsmall", parent = "kcls", type = "container", k8s_count = 1, mem = 2048 },
  { name = "svc2", size = "xsmall", parent = "kcls", type = "container", k8s_count = 1, mem = 4096 }
]

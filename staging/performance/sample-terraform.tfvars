env     = "staging"
sub_env = "performance"

instances = [
  { name = "wks", size = "xlarge", type = "instance", instance_count = 3 }
]

databases = [
  { name = "nsdb", size = "large", db_type = "nosql", type = "db", db_count = 1 },
  { name = "rdb", size = "large", db_type = "mysql", type = "db", db_count = 1 }
]

k8s_containers = [
  { name = "svc1", size = "xlarge", parent = "kcls", type = "container", k8s_count = 3, mem = 2048 },
  { name = "svc2", size = "xlarge", parent = "kcls", type = "container", k8s_count = 3, mem = 4096 }
]

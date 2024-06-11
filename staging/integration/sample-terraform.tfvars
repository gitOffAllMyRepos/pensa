env     = "staging"
sub_env = "integration"

instances = [
  { name = "wks", size = "large", type = "instance", instance_count = 2 }
]

databases = [
  { name = "nsdb", size = "large", db_type = "nosql", type = "db", db_count = 1 },
  { name = "rdb", size = "large", db_type = "mysql", type = "db", db_count = 1 }
]

k8s_containers = [
  { name = "svc1", size = "large", parent = "kcls", type = "container", k8s_count = 2 },
  { name = "svc2", size = "large", parent = "kcls", type = "container", k8s_count = 2 }
]

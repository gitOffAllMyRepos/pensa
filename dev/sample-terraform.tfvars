env = "dev"

instances = [
  { name = "wks", size = "small", type = "instance", instance_count = 1 }
]

databases = [
  { name = "nsdb", size = "small", db_type = "nosql", type = "db", db_count = 1 },
  { name = "rdb", size = "small", db_type = "mysql", type = "db", db_count = 1 }
]

k8s_containers = [
  { name = "svc1", size = "small", parent = "kcls", type = "container", k8s_count = 1, mem = 2048 },
  { name = "svc2", size = "small", parent = "kcls", type = "container", k8s_count = 1, mem = 4096 }
]

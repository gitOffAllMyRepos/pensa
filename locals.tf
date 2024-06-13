locals {
  environments = {
    "dev" = {
      instances = {
        "wks" = { size = "small", type = "instance", instance_count = 1 }
      },
      databases = {
        "nsdb" = { size = "small", type = "db", db_count = 1, db_type = "nosql" },
        "rdb"  = { size = "small", type = "db", db_count = 1, db_type = "mysql" }
      },
      k8s_containers = {
        "svc1" = { size = "small", parent = "kcls", type = "container", k8s_count = 1, mem = 2048 },
        "svc2" = { size = "small", parent = "kcls", type = "container", k8s_count = 1, mem = 4096 }
      },
      load_balancers = {
        "lb1" = { size = "small", lb_count = 1, type = "application" }
      },
      sub_envs = {
        "clint" = {
          instances = {
            "wks" = { size = "xsmall", type = "instance", instance_count = 1 }
          },
          databases = {
            "nsdb" = { size = "xsmall", type = "db", db_count = 1, db_type = "nosql" },
            "rdb"  = { size = "xsmall", type = "db", db_count = 1, db_type = "mysql" }
          },
          k8s_containers = {
            "svc1" = { size = "xsmall", parent = "kcls", type = "container", k8s_count = 1, mem = 2048 },
            "svc2" = { size = "xsmall", parent = "kcls", type = "container", k8s_count = 1, mem = 4096 }
          }
        },
        "natasha" = {
          instances = {
            "wks" = { size = "xsmall", type = "instance", instance_count = 1 }
          },
          databases = {
            "nsdb" = { size = "xsmall", type = "db", db_count = 1, db_type = "nosql" },
            "rdb"  = { size = "xsmall", type = "db", db_count = 1, db_type = "mysql" }
          },
          k8s_containers = {
            "svc1" = { size = "xsmall", parent = "kcls", type = "container", k8s_count = 1, mem = 2048 },
            "svc2" = { size = "xsmall", parent = "kcls", type = "container", k8s_count = 1, mem = 4096 }
          }
        }
      }
    },
    "staging" = {
      sub_envs = {
        "integration" = {
          instances = {
            "wks" = { size = "large", type = "instance", instance_count = 2 }
          },
          databases = {
            "nsdb" = { size = "large", type = "db", db_count = 1, db_type = "nosql" },
            "rdb"  = { size = "large", type = "db", db_count = 1, db_type = "mysql" }
          },
          k8s_containers = {
            "svc1" = { size = "large", parent = "kcls", type = "container", k8s_count = 2 },
            "svc2" = { size = "large", parent = "kcls", type = "container", k8s_count = 2 }
          }
        },
        "performance" = {
          instances = {
            "wks" = { size = "xlarge", type = "instance", instance_count = 3 }
          },
          databases = {
            "nsdb" = { size = "xlarge", type = "db", db_count = 1, db_type = "nosql" },
            "rdb"  = { size = "xlarge", type = "db", db_count = 1, db_type = "mysql" }
          },
          k8s_containers = {
            "svc1" = { size = "xlarge", parent = "kcls", type = "container", k8s_count = 3, mem = 2048 },
            "svc2" = { size = "xlarge", parent = "kcls", type = "container", k8s_count = 3, mem = 4096 }
          }
        }
      }
    },
    "prod" = {
      instances = {
        "wks" = { size = "xlarge", type = "instance", instance_count = 3 }
      },
      databases = {
        "nsdb"         = { size = "xlarge", type = "db", db_count = 1, db_type = "nosql" },
        "rdb"          = { size = "xlarge", type = "db", db_count = 1, db_type = "mysql" },
        "nsdb-replica" = { size = "xlarge", type = "db", db_count = 1, db_type = "nosql" },
        "rdb-replica"  = { size = "xlarge", type = "db", db_count = 1, db_type = "mysql" }
      },
      k8s_containers = {
        "svc1" = { size = "xlarge", parent = "kcls", type = "container", k8s_count = 3, mem = 2048 },
        "svc2" = { size = "xlarge", parent = "kcls", type = "container", k8s_count = 3, mem = 4096 }
      }
    }
  }

  instance_names = flatten([
    for env, details in local.environments : concat(
      [
        for instance_key, instance_details in lookup(details, "instances", {}) : [
          for i in range(instance_details.instance_count) : {
            env     = env
            sub_env = null
            name    = "${env}-instance-${instance_key}-${format("%02d", i + 1)}"
            size    = instance_details.size
          }
        ]
      ],
      [
        for sub_env_name, sub_env_details in lookup(details, "sub_envs", {}) : [
          for instance_key, instance_details in lookup(sub_env_details, "instances", {}) : [
            for i in range(instance_details.instance_count) : {
              env     = env
              sub_env = sub_env_name
              name    = "${env}-${sub_env_name}-instance-${instance_key}-${format("%02d", i + 1)}"
              size    = instance_details.size
            }
          ]
        ]
      ]
    )
  ])

  database_names = flatten([
    for env, details in local.environments : concat(
      [
        for db_key, db_details in lookup(details, "databases", {}) : [
          for i in range(db_details.db_count) : {
            env     = env
            sub_env = null
            name    = "${env}-db-${db_key}-${format("%02d", i + 1)}"
            size    = db_details.size
            db_type = db_details.db_type
          }
        ]
      ],
      [
        for sub_env_name, sub_env_details in lookup(details, "sub_envs", {}) : [
          for db_key, db_details in lookup(sub_env_details, "databases", {}) : [
            for i in range(db_details.db_count) : {
              env     = env
              sub_env = sub_env_name
              name    = "${env}-${sub_env_name}-db-${db_key}-${format("%02d", i + 1)}"
              size    = db_details.size
              db_type = db_details.db_type
            }
          ]
        ]
      ]
    )
  ])

  k8s_container_names = flatten([
    for env, details in local.environments : concat(
      [
        for k8s_key, k8s_details in lookup(details, "k8s_containers", {}) : [
          for i in range(k8s_details.k8s_count) : {
            env     = env
            sub_env = null
            name    = "${env}-container-${k8s_key}-${format("%02d", i + 1)}"
            size    = k8s_details.size
            mem     = lookup(k8s_details, "mem", null)
          }
        ]
      ],
      [
        for sub_env_name, sub_env_details in lookup(details, "sub_envs", {}) : [
          for k8s_key, k8s_details in lookup(sub_env_details, "k8s_containers", {}) : [
            for i in range(k8s_details.k8s_count) : {
              env     = env
              sub_env = sub_env_name
              name    = "${env}-${sub_env_name}-container-${k8s_key}-${format("%02d", i + 1)}"
              size    = k8s_details.size
              mem     = lookup(k8s_details, "mem", null)
            }
          ]
        ]
      ]
    )
  ])

  load_balancer_names = flatten([
    for env, details in local.environments : concat(
      [
        for lb_key, lb_details in lookup(details, "load_balancers", {}) : [
          for i in range(lb_details.lb_count) : {
            env     = env
            sub_env = null
            name    = "${env}-lb-${lb_key}-${format("%02d", i + 1)}"
            size    = lb_details.size
            type    = lb_details.type
          }
        ]
      ],
      [
        for sub_env_name, sub_env_details in lookup(details, "sub_envs", {}) : [
          for lb_key, lb_details in lookup(sub_env_details, "load_balancers", {}) : [
            for i in range(lb_details.lb_count) : {
              env     = env
              sub_env = sub_env_name
              name    = "${env}-${sub_env_name}-lb-${lb_key}-${format("%02d", i + 1)}"
              size    = lb_details.size
              type    = lb_details.type
            }
          ]
        ]
      ]
    )
  ])
}





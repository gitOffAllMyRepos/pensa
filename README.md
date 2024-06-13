# Terraform Configuration for Dynamic Resource Creation

This Terraform configuration dynamically creates and manages instances, databases, Kubernetes containers, and load balancers across different environments and sub-environments. It uses maps instead of lists to define resource attributes, ensuring flexibility and scalability.

## Overview

The configuration is designed to handle multiple environments (development, staging, production) and their sub-environments. Each environment can have its own set of instances, databases, Kubernetes containers, and load balancers. The resources are dynamically named and managed using Terraform modules.

## Directory Structure

- **`main.tf`**: The main Terraform configuration file.
- **`locals.tf`**: Defines local variables and dynamic naming logic.
- **`outputs.tf`**: Outputs the resource names.
- **`modules/instance`**: Module for managing instances.
- **`modules/db`**: Module for managing databases.
- **`modules/k8s_cluster`**: Module for managing Kubernetes containers.
- **`modules/load_balancer`**: Module for managing load balancers.

## Adding a New Environment

To add a new environment, simply update the locals.tf file with the new environment's configurations.

## Adding a New Resource Type

To add a new resource type, such as a load balancer, update the locals.tf file and create a corresponding module directory with a main.tf file. Then, update the main.tf file to call the new module.

For example, to add a load balancer:

Update locals.tf with load balancers configuration.
Create modules/load_balancer/main.tf to define the load balancer resource.
Update main.tf to call the load balancer module.
By following this structure, you can easily manage and scale your infrastructure with Terraform.
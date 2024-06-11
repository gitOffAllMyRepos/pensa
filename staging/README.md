# Terraform Infrastructure Provisioning

This repository contains Terraform configurations for provisioning infrastructure across multiple environments: development, staging, and production. It is structured to manage resources modularly, allowing for reusability and maintainability.

## Project Structure

- **`/dev`**: Contains Terraform configurations specific to the development environment. subdivided into clint and natasha sub-environments
- **`/staging`**: Includes configurations for staging environments, subdivided into integration and performance sub-environments.
- **`/prod`**: Holds the Terraform setup for the production environment.
- **`/modules`**: Custom Terraform modules used across different environments. Includes modules for database instances, compute instances, and Kubernetes containers.
- **`.github/workflows`**: CI/CD pipeline definitions using GitHub Actions.
- **`.gitignore`**: Specifies intentionally untracked files to ignore.

### Modules

- **Database Module**: Manages database instances with customizable parameters like size and type.
- **Instance Module**: Configures compute instances with options for size and count.
- **Kubernetes Cluster Module**: Provisions Kubernetes containers, allowing configuration of memory and other parameters.

## Setup Instructions

### Prerequisites

- Terraform installed
- Access to an AWS account with permissions to manage S3 resource for backend.
- AWS CLI configured with user credentials.

### Initializing the Project

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/your-repository.git
    cd your-repository
    ```

2. **Initialize Terraform:**

    Navigate to any of the environment directories (e.g., `dev`) and run:

    ```bash
    terraform init
    ```

3. **Create a `terraform.tfvars` file** (or use existing `sample-terraform.tfvars`) in the respective environment directory with necessary variable definitions.

### Deploying Infrastructure

1. **Plan Terraform Deployment:**

    ```bash
    terraform plan -var-file="sample-terraform.tfvars" -out=tfplan
    ```


## Workflow Details

GitHub Actions is configured to automate the Terraform workflows:

- **Terraform Plan**: Automatically runs on  any push to any branch.

## Contributing

To contribute to this project, please fork the repository, make your changes, and submit a pull request to the `dev` branch. Ensure to update the `sample-terraform.tfvars` with example values that do not expose sensitive information.



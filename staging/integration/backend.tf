# terraform {
#   backend "s3" {
#     bucket   = "my-localstack-bucket"
#     key      = "staging/integration/terraform.tfstate"
#     region   = "us-east-1"
#     # endpoint = "http://localhost:4566"
#     endpoints                   = { s3 = "http://localhost:4566" }
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     use_path_style            = true
#   }
# }


# terraform {
#   backend "s3" {
#     bucket                      = "pensa-test-bucket"
#     key                         = "staging/integration/terraform.tfstate"
#     region                      = "eu-west-1"
#     endpoints                   = { s3 = "https://minio.strategybase.io" }
#     skip_region_validation      = true
#     skip_credentials_validation = true
#     skip_metadata_api_check     = true
#     use_path_style              = true
#     skip_requesting_account_id  = true
#   }
# }

terraform {
  backend "s3" {
    bucket         = "pensa-test-bucket"
    key            = "staging/integration/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "pensa-test" 
  }
}
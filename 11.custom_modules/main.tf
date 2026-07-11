module "dev_app" {
  source = "./infra-app"
  env = "dev"
  bucket-name = "my-dev-bucket-terraform-123"
  instance_type = "t3.micro"
  instance_count = 1
  ami_id = "ami-0b6d9d3d33ba97d99"
}

module "prod_app" {
  source = "./infra-app"
  env = "prod"
  bucket-name = "my-prod-bucket-terraform-123"
  instance_type = "t3.micro"
  instance_count = 1
  ami_id = "ami-0b6d9d3d33ba97d99"
}

module "staging_app" {
  source = "./infra-app"
  env = "staging"
  bucket-name = "my-staging-bucket-terraform-123"
  instance_type = "t3.micro"
  instance_count = 1
  ami_id = "ami-0b6d9d3d33ba97d99"
}
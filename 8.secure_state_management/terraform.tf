terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~>6.54.0"
        }
    }
    backend "s3"{
        bucket = "secure-state-management-bucket"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "secure-state-management-table"
    }
}
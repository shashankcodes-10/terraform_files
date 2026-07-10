resource "aws_s3_bucket" "my-bucket"{
    # using if else for conditional expressing 

    bucket = var.env == "prd"? var.prd-bucket : var.dev-bucket
    
}
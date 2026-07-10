resource "aws_s3_bucket" "bucket"{
    bucket = "secure-state-management-bucket"

    tags = {
        Name = "secure-state-management-bucket"
    }
}
resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${var.env}-${var.bucket-name}"

  tags = {
    Name        = "${var.env}-${var.bucket-name}"
    Environment = var.env
  }
  
}
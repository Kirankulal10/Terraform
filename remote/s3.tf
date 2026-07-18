resource "aws_s3_bucket" "example" {
  bucket = "terraform-bucket-kiran-backend"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

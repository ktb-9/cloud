provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_s3_bucket" "ktb9_bucket" {
  bucket = "ktb9-bucket"  # 버킷 이름을 "ktb9-bucket"으로 변경

  tags = {
    environment = "devel"
  }
}

resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.ktb9_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# resource "aws_s3_object" "terraform-sample-txt" {
#   bucket = aws_s3_bucket.ktb9_bucket.id
#   key    = "example.txt"
#   source = "example.txt"
# }

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.ktb9_bucket.id

  depends_on = [
    aws_s3_bucket_public_access_block.public-access
  ]

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"PublicRead",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${aws_s3_bucket.ktb9_bucket.id}/*"]
    }
  ]
}
POLICY
}

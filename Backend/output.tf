output "instance_ip" {
  value = aws_instance.test.public_ip
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.hyndavitest12345.region
}

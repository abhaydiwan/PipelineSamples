# Provider configuration
provider "aws" {
  region = "us-east-1"
}
# Resource configuration
resource "aws_instance" "hello-instance" {
  ami = "ami-1853ac65"
  instance_type = "t2.micro"
  tags {
    Name = "Prod - Instance"
  }
}

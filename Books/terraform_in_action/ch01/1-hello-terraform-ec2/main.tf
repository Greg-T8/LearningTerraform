provider "aws" {
    profile = "tf-user"
    region = "us-west-2"
}

# Data sources are declared having exactly two labels
# The type, "aws_ami", and name, "ubuntu", must be unique within the module
data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    owners = ["099720109477"]
}

# Resources are declared having exactly two labels
resource "aws_instance" "helloworld" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags          = {
    Name = "HelloWorld"
  }
}
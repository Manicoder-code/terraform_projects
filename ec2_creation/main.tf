terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "admin" {
  ami           = "ami-02167eae61967e403"
  instance_type = "t3.micro"
  key_name = "cts_us_west_2_key"
  associate_public_ip_address = true
  subnet_id = "subnet-0bbf374cfc55d293d"
  vpc_security_group_ids = ["sg-0d6dd7e148d7dfa94"]

root_block_device {
    delete_on_termination = true
    encrypted = true
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "admin"
  }
}


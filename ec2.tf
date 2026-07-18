#vpc starts
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
#vpc ends


#security-group starts
resource "aws_security_group" "my_security_group" {
  name        = "my-sg-tf-dev"
  description = "this is for terraform"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "for terraform"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

#inbound and outbound rules end


resource "aws_instance" "my_instance" {
  #  name                   = "terraform-wit-conditon"
  key_name               = "react-key"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  instance_type          = var.instance_type
  ami                    = var.ami_id
  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "terraform-ec2-2"
  }
}


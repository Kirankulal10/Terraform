resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = "ami-0fb110df4c5094d21"
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-ec2_instance"
    Environment=var.env
  }
}

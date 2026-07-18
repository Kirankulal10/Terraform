resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ec2_ami_id
  instance_type = var.instance_type

  tags = {
    Name = "${var.env}-ec2_instance"
    Environment=var.env
  }
}

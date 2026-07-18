module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance-with-module"

  instance_type = "t3.micro"
  key_name      = "react-key"
  monitoring    = true
  subnet_id     = "subnet-09a89db32f5d417d2"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

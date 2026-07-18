#dev
module "dev_infra" {
  source         = "./modules"
  env            = "dev"
  bucket_name    = "tws-bucket-with-own"
  instance_count = 1
  instance_type  = "t3.micro"
  ec2_ami_id     = "ami-0fb110df4c5094d21"
  hash_key       = "My_ID"
}
#prod
module "prod_infra" {
  source         = "./modules"
  env            = "prod"
  bucket_name    = "tws-bucket-with-own"
  instance_count = 2
  instance_type  = "t3.small"
  ec2_ami_id     = "ami-0fb110df4c5094d21"
  hash_key       = "User_ID"
}

#staging
module "stage_infra" {
  source         = "./modules"
  env            = "stage"
  bucket_name    = "tws-bucket-with-own"
  instance_count = 1
  instance_type  = "c7i-flex.large"
  ec2_ami_id     = "ami-0fb110df4c5094d21"
  hash_key       = "Employee_ID"
}




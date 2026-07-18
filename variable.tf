variable "instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ec2_root_storage_size" {
  default = 15
  type    = number
}
variable "ami_id" {
  default = "ami-0fb110df4c5094d21"
  type    = string
}
variable "env" {
  default = "prod"
  type    = string
}


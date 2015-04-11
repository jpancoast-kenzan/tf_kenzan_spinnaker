variable "region" {}
variable "distribution" {}
variable "architecture" {
  default = "amd64"
}
variable "instance_type" {}

module "virttype" {
    source = "github.com/terraform-community-modules/tf_aws_virttype"
    instance_type = "${var.instance_type}"
}

module "ami" {
    architecture = "${var.architecture}"
    virttype = "${module.virttype.prefer_hvm}"
    storagetype = "ebs"
    source = "../"
}

output "ami_id" {
    value = "${module.ami.ami_id}"
}
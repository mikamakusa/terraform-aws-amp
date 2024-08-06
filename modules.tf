module "eks" {
  source = "git@github.com:mikamakusa/terraform-aws-eks.git?ref=1.0.1"
}

module "kms" {
  source = "git@github.com:mikamakusa/terraform-aws-kms.git?ref=1.0.1"
}

module "cloudwatch" {
  source = "git@github.com:mikamakusa/terraform-aws-cloudwatch?ref=1.0.2"
}
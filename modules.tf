module "eks" {
  source  = "git@github.com:mikamakusa/terraform-aws-eks.git?ref=1.0.1"
  cluster = var.cluster
}

module "kms" {
  source = "git@github.com:mikamakusa/terraform-aws-kms.git?ref=1.0.1"
  key    = var.key
}

module "cloudwatch" {
  source    = "git@github.com:mikamakusa/terraform-aws-cloudwatch?ref=1.0.3"
  log_group = var.log_group
}
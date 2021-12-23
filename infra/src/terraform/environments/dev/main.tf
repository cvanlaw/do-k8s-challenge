terraform {
  backend "remote" {}
}

locals {
  tags = [
    "environment:prod",
    "repo:cvanlaw/do-k8s-challenge"
  ]
}
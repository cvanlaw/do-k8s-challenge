terraform {
  backend "remote" {}
}


locals {
  tags = [
    "environment:prod",
    "repo:cvanlaw/do-k8s-challenge"
  ]


}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name         = "k8s-01"
  region       = "sfo3"
  version      = "1.20.2-do.0"
  auto_upgrade = true

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 5
  }

  tags = [
    "environment:prod",
  ]
}
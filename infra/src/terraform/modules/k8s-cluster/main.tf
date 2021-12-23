locals {
  tags = [
    "environment:${var.environment}",
    "repo:${var.repo}"
  ]
}

data "digitalocean_kubernetes_versions" "k8s_version" {
  version_prefix = "1.21."
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name         = "k8s-01"
  region       = "sfo3"
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.k8s_version.latest_version

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
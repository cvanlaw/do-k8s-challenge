# resource "kubernetes_namespace" "gitops" {
#   metadata {
#     annotations = {
#       name = "gitops"
#     }

#     labels = {
#       managed-by = "terraform"
#       repo = var.repo
#     }

#     name = "gitops"
#   }
# }
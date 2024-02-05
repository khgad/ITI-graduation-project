resource "kubernetes_namespace" "ns" {
  metadata {
    name = var.namespaces[count.index]
  }
  count = length(var.namespaces)
}
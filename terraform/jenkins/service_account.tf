resource "kubernetes_cluster_role" "jenkins-admin" {
  metadata {
    name = "jenkins-admin"
  }
  rule {
    api_groups = ["*"]
    resources = ["*"]
    verbs = ["*"]
  }
}

resource "kubernetes_service_account_v1" "jenkins-admin" {
  metadata {
    name = "jenkins-admin"
    namespace = "tools"
  }
  
  # secret {
  #   name = "jenkins-admin"
  # }
  # automount_service_account_token = true
}

# resource "kubernetes_secret_v1" "jenkins-admin" {
#   metadata {
#     name = "jenkins-admin"
#     namespace = "tools"
#     annotations = {
#       "kubernetes.io/service-account.name" = "jenkins-admin"
#     }
#   }

#   type = "kubernetes.io/service-account-token"
# }

resource "kubernetes_cluster_role_binding" "jenkins-admin" {
  metadata {
    name = "jenkins-admin"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = "jenkins-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "jenkins-admin"
    namespace = "tools"
  }
}
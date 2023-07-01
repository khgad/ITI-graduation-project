resource "kubernetes_deployment" "mysql" {
  metadata {
    namespace = "dev"
    name      = "mysql"
    labels = {
      app = "mysql"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }
      spec {
        container {
          image = "mysql"
          name = "mysql"

          port {
            name = "mysql-server"
            container_port = 3306
          }
          env_from {
            secret_ref {
              name = "mysql-secret"
            }
          }
        }
      }
    }
  }
  depends_on = [ kubernetes_secret.mysql-secret ]
}

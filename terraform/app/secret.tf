resource "kubernetes_secret" "app-secret" {
  metadata {
    name      = "app-secret"
    namespace = "dev"
  }
  data = {
    HOST     = "mysql-service"
    USERNAME = "khgad"
    PASSWORD = 1234
    DATABASE = "myapp"
  }
}

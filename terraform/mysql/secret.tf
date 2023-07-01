resource "kubernetes_secret" "mysql-secret" {
  metadata {
    name = "mysql-secret"
    namespace = "dev"
  }
  data = {
    MYSQL_ROOT_PASSWORD = 1234
    MYSQL_USER = "khgad" 
    MYSQL_PASSWORD = 1234 
    MYSQL_DATABASE = "myapp"
  }
}
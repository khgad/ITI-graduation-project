resource "kubernetes_service" "mysql-service" {
  metadata {
    name = "mysql-service"
    namespace = "dev"
  }
  
  spec {
    type = "ClusterIP"

    selector = {
        app = "mysql"
    }

    port {
      port = 3306
      target_port = 3306
    }
  }
}

resource "kubernetes_service" "mysql-service-2" {
  metadata {
    name = "mysql-service-2"
    namespace = "dev"
  }
  
  spec {
    type = "NodePort"

    selector = {
        app = "mysql"
    }

    port {
      port = 3306
      target_port = 3306
      node_port = 32003
    }
  }
}
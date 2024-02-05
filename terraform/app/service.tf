resource "kubernetes_service" "app-service" {
  metadata {
    name = "app-service"
    namespace = "dev"
  }
  
  spec {
    type = "NodePort"

    selector = {
        app = "myapp"
    }

    port {
      port = 3000
      target_port = 3000
      node_port = 32300
    }
  }
}
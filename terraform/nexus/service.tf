resource "kubernetes_service" "nexus-service" {
  metadata {
    name = "nexus-service"
    namespace = "tools"
  }
  
  spec {
    type = "NodePort"

    selector = {
        app = "nexus"
    }

    port {
      name = "nexus"
      port = 8081
      target_port = 8081
      node_port = 32001
    }

    port {
      name = "docker"
      port = 5000
      target_port = 5000
      node_port = 32002
    }
  }
}
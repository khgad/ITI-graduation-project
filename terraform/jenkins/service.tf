resource "kubernetes_service" "jenkins-service" {
  metadata {
    name = "jenkins-service"
    namespace = "tools"
  }
  
  spec {
    type = "NodePort"

    selector = {
        app = "jenkins"
    }

    port {
      port = 8080
      target_port = 8080
      node_port = 32000
    }
  }
}
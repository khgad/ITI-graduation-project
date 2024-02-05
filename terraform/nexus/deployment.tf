resource "kubernetes_deployment" "nexus" {
  metadata {
    name = "nexus"
    namespace = "tools"
    labels = {
      app = "nexus"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nexus"
      }
    }
    template {
      metadata {
        labels = {
          app = "nexus"
        }
      }
      spec {
        container {
          name = "nexus"
          image = "sonatype/nexus3:latest"
          port {
            name = "nexus"
            container_port = 8081
          }
          port {
            name = "docker"
            container_port = 5000
          }
        }
      }
    }
  }
}
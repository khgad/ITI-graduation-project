resource "kubernetes_deployment" "jenkins" {
  metadata {
    namespace = "tools"
    name      = "jenkins"
    labels = {
      app = "jenkins"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "jenkins"
      }
    }

    template {
      metadata {
        labels = {
          app = "jenkins"
        }
      }
      spec {
        service_account_name = "jenkins-admin"
        container {
          image = "khaledgad/jenkins-pod"
          name = "jenkins"

          port {
            container_port = 8080
          }

          volume_mount {
            name = "jenkins-data"
            mount_path = "/var/jenkins_home"
          }

          volume_mount {
            name = "docker-socket"
            mount_path = "/var/run/docker.sock"
          }
        }

        volume {
          name = "jenkins-data"
          empty_dir {}
        }

        volume {
          name = "docker-socket"
          host_path {
            path = "/var/run/docker.sock"
          }
        }
      }
    }
  }
}

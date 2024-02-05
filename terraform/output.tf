# resource "null_resource" "jenkins_pod_name" {
#   provisioner "local-exec" {
#     command     = "kubectl get pod -l app=jenkins -n tools -o jsonpath='{.items[0].metadata.name}'"
#     interpreter = ["sh", "-c"]
#   }
# }

# output "jenkins-admin-password" {
#   value = null_resource.jenkins_pod_name
# }
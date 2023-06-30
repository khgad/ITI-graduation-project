module "namespaces" {
  source = "./namespaces"

  namespaces = [ "tools", "dev" ]
}
module "jenkins" {
  source = "./jenkins"
}
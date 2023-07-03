module "namespaces" {
  source = "./namespaces"

  namespaces = ["tools", "dev"]
}
module "jenkins" {
  source = "./jenkins"
}

module "nexus" {
  source = "./nexus"
}

module "mysql" {
  source = "./mysql"
}

module "nodejs-app" {
  source = "./app"
}
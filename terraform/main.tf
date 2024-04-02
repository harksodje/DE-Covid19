data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "bucket" {
  source  = "./modules/storage"
  bucket-name = var.bucket-name
    location = var.region
    prefix   = var.prefix
  
}

# module "gke" {
#   source  = "./modules/gke"
#   service_account_email = var.service_account_email
#   prefix  = var.prefix
  
# }
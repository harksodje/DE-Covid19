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

# module "composer" {
#   source = "./modules/composer"
#   project = var.project
#   service_account_email = var.service_account_email
# }

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "c3-standard-4"
  zone         = "us-central1-a"

  # tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar",
    
  }

  # metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}
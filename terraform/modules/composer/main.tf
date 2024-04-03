# provider "google" {
#   project = "bigdata-writers"
# }

# resource "google_composer_environment" "test" {
#   name   = "example-composer-env-tf-c2"
#   region = "us-central1"
#   config {

#     software_config {
#       image_version = "composer-2-airflow-2"
#     }

#     workloads_config {
#       scheduler {
#         cpu        = 0.5
#         memory_gb  = 1.875
#         storage_gb = 1
#         count      = 1
#       }
#       web_server {
#         cpu        = 0.5
#         memory_gb  = 1.875
#         storage_gb = 1
#       }
#       worker {
#         cpu = 0.5
#         memory_gb  = 1.875
#         storage_gb = 1
#         min_count  = 1
#         max_count  = 3
#       }


#     }
#     environment_size = "ENVIRONMENT_SIZE_SMALL"

#     node_config {
#       network    = google_compute_network.test.id
#       subnetwork = google_compute_subnetwork.test.id
#       service_account = var.service_account_email
#     }
#   }
# }

# resource "google_compute_network" "test" {
#   name                    = "composer-test-network3"
#   auto_create_subnetworks = false
# }

# resource "google_compute_subnetwork" "test" {
#   name          = "composer-test-subnetwork"
#   ip_cidr_range = "10.2.0.0/16"
#   region        = "us-central1"
#   network       = google_compute_network.test.id
# }

# resource "google_service_account" "test" {
#   account_id   = "composer-env-account"
#   display_name = "Test Service Account for Composer Environment"
# }

# resource "google_project_iam_member" "composer-worker" {
#   project = var.project
#   role    = "roles/composer.worker"
#   member  = "serviceAccount:${google_service_account.test.email}"
# }

resource "google_composer_environment" "composer_env" {
  name   = "composer-env-adis"
  region = "us-central1"

  config {
    node_count = 4

    node_config {
      zone            = "us-central1-a"
      machine_type    = "n1-standard-1"
      network         = "default"
      subnetwork      = "default"
      service_account = var.service_account_email
    }

    software_config {
      python_version = "3"
      airflow_config_overrides = {
        core-load_example = "True"
        core-dags_are_paused_at_creation = "True"
      }

      pypi_packages = {
        numpy = "==1.14.0"
        pandas = "==0.22.0"
      }

      env_variables = {
        FOO = "bar"
      }
    }
  }
}

output "composer_environment_name" {
  value = google_composer_environment.composer_env.name
}
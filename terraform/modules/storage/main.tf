###################################
#       RESOURCES
###################################
resource "google_storage_bucket" "demo-bucket" {
  name          = "${var.prefix}-${var.bucket-name}"
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}













#########################################
#  VARIABLES
#########################################
variable "bucket-name" {}
variable "location" {}
variable "prefix" {}
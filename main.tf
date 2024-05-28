resource "google_storage_bucket" "my-bucket" {
  name                     = "poel-test-s3"
  location                 = "EU"
  project                  = "spa-newlearningdev-dev-001"
  force_destroy            = true
  public_access_prevention = "enforced"
}
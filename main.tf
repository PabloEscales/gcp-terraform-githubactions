resource "google_storage_bucket" {
    name = "poel-test-s3"
    location = "EU"
    force_destroy = true
    public_access_prevention = "enforced"
}
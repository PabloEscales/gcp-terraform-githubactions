resource "google_storage_bucket" "my-bucket" {
  name                     = "poel-test-s3"
  location                 = "EU"
  project                  = "spa-newlearningdev-dev-001"
  force_destroy            = true
  public_access_prevention = "enforced"
}

# Make a new object public
resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.static_site_src.name
  bucket = google_storage_bucket.my-bucket.name
  role   = "READER"
  entity = "allUsers"
}

# Upload the index.html file to the bucket
resource "google_storage_bucket_object" "static_site_src" {
  name   = "index.html"
  source = "./website/index.html"
  bucket = google_storage_bucket.my-bucket.name
}

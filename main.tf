resource "google_storage_bucket" "my-bucket" {
  name                        = "poel-test-s3"
  location                    = "EU"
  project                     = "spa-newlearningdev-dev-001"
  force_destroy               = true
  uniform_bucket_level_access = true
}

# Make a new object public
resource "google_storage_object_acl" "public_rule" {
  bucket = google_storage_bucket.my-bucket.name
  object = google_storage_bucket_object.static_site_src.name
  role   = "READER"
  entity = "allUsers"
}

# Upload the index.html file to the bucket
resource "google_storage_bucket_object" "static_site_src" {
  name   = "index.html"
  source = "./website/index.html"
  bucket = google_storage_bucket.my-bucket.name
}

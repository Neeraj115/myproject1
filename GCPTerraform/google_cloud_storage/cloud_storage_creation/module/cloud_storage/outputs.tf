output "console_link" {
  value = "https://console.cloud.google.com/storage/browser/${local.storage_bucket_name}?project=${var.project_id}"
}

output "project" {
  value = google_storage_bucket.bucket.project
}

output "resource_name" {
  value = local.storage_bucket_name
}

output "resource_id" {
  value = google_storage_bucket.bucket.id
}

output "self_link" {
  value = google_storage_bucket.bucket.self_link
}

output "destination_uri" {
  value = local.destination_uri
}


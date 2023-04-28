module "cloud_storage_bucket" {
  for_each = {
    for k, v in var.cloud_storage : k => v if v.delete_bucket != true
  }
  source              = "./module/cloud_storage"
  project_id          = var.project_id
  storage_bucket_name = each.key
  location            = each.value.location
  retention_policy    = each.value.retention_policy
  storage_class       = each.value.storage_class
  versioning          = each.value.versioning
  labels              = each.value.labels
}

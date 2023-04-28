variable "project_id" {
  type = string
}

variable "storage_bucket_name" {
  type = string
}

variable "location" {
  type    = string
  default = "europe-west3"
}

variable "storage_class" {
  type    = string
  default = "STANDARD"
}

variable "uniform_bucket_level_access" {
  type    = bool
  default = null
}

variable "expiration_days" {
  type    = number
  default = null
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "retention_policy" {
  type = object({
    is_locked             = bool
    retention_period_days = number
  })
  default = null
}

variable "versioning" {
  type    = bool
  default = false
}

variable "labels" {
  type    = map(string)
  default = {}
}

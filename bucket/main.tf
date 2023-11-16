variable "zone" {
  description = "The default availability zone to operate under"
  type        = string
}
variable "folder_id" {
  description = "The ID of the folder to operate under"
  type        = string
}

variable "sa_name" {
  description = "The Service Account name"
  type        = string
}

variable "bucket_name" {
  description = "The Bucket name"
  type        = string
}

variable "token" {
  description = "Security token or IAM token used for authentication in Yandex.Cloud"
  type        = string
}

variable "cloud_id" {
  description = "The ID of the cloud to apply any resources to"
  type        = string
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.102.0"
    }
  }
  required_version = ">=  0.47.0"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = var.sa_name
}

resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
}

resource "yandex_storage_bucket" "state" {
  bucket     = var.bucket_name
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}
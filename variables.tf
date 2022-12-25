variable "folder_id" {
  description = "Default folder ID in yandex cloud"
  type        = string
}
variable "cloud_id" {
  description = "Default cloud ID in yandex cloud"
  type        = string
}
variable "token" {
  description = "Temporarily token, could be requested by command - yc iam create-token"
  type        = string
}
variable "yandex_storage_secret_key" {
  description = "yandex storage secret key for service account"
  type        = string
}
variable "yandex_storage_access_key" {
  description = "yandex storage access key for service account"
  type        = string
}
variable "yandex_storage_key" {
  description = "yandex storage key for service account"
  type        = string
}

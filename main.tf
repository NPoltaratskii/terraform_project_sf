terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.84.0"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}
module "lemp_instance" {
  source                = "C:\\workspace\\modules\\instance_lamp"
  instance_family_image = "lemp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet-1.id
  instance_zone         = "ru-central1-a"
}
module "lamp_instance" {
  source                = "C:\\workspace\\modules\\instance_lamp"
  instance_family_image = "lamp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet-2.id
  instance_zone         = "ru-central1-a"
}

#Добавляю бекап state файла в хранилище, т.к оригинальный файл занят при выполнении "terraform apply"
resource "yandex_storage_object" "new-object" {
  access_key = var.yandex_storage_access_key
  secret_key = var.yandex_storage_secret_key
  bucket     = "second-bucket"
  key        = var.yandex_storage_key
  source     = "C:\\workspace\\terraform.tfstate.backup"
}

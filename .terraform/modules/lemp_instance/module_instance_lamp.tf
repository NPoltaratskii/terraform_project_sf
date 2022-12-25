
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.84.0"
    }
  }
  required_version = ">= 0.13"
}

data "yandex_compute_image" "sf" {
  family = var.instance_family_image
  }

resource "yandex_compute_instance" "vm-lamp" {
  name        = "terraform-${var.instance_family_image}"
  platform_id = "standard-v3"
  zone = var.instance_zone

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.sf.id
    }
  }
  network_interface {
    subnet_id = var.vpc_subnet_id
    nat       = true
  }

  metadata = {
    ssh_keys = "C:\\Users\\NordWest\\.ssh\\yacloudpub"
  }
}

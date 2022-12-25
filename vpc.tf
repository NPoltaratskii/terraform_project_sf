resource "yandex_vpc_network" "network-1" {
  name = "network-1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet-1"
  v4_cidr_blocks = ["192.168.88.0/24"]
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
}

resource "yandex_vpc_subnet" "subnet-2" {
  name           = "subnet-2"
  v4_cidr_blocks = ["192.168.89.0/24"]
  network_id     = yandex_vpc_network.network-1.id
  zone           = "ru-central1-a"
}
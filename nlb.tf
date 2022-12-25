resource "yandex_lb_target_group" "sf-terraform-group" {
  name = "lamp-target-group"
  region_id  = "ru-central1"

  target {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    address   = module.lamp_instance.internal_ip_address_vm_lamp
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = module.lemp_instance.internal_ip_address_vm_lamp
  }

}
resource "yandex_lb_network_load_balancer" "netwlb" {
  name = "netwlb"

  listener {
    name = "lamp-lemp-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.sf-terraform-group.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
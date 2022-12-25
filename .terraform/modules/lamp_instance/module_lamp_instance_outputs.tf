output "internal_ip_address_vm_lamp" {
  value = yandex_compute_instance.vm-lamp.network_interface.0.ip_address
}

output "external_ip_address_vm_lamp" {
  value = yandex_compute_instance.vm-lamp.network_interface.0.nat_ip_address
}

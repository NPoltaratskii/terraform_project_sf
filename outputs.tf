output "yandex_storage_access_key" {
  value = var.yandex_storage_access_key
}
output "yandex_storage_secret_key" {
  value = var.yandex_storage_secret_key
}
output "internal_ip_address_vm_1" {
  value = module.lemp_instance.internal_ip_address_vm_lamp
}

output "external_ip_address_vm_1" {
  value = module.lemp_instance.external_ip_address_vm_lamp

}

output "internal_ip_address_vm_2" {
  value = module.lamp_instance.internal_ip_address_vm_lamp
}

output "external_ip_address_vm_2" {
  value = module.lamp_instance.external_ip_address_vm_lamp
}
output "external_ip_address_nlb" {
  value = yandex_lb_network_load_balancer.netwlb.*
}
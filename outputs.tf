output "external_ip_1" {
  description = "External VM 1 IP"
  value       = module.vm1.external_ip
}
output "internal_ip_1" {
  description = "Internal VM 1 IP"
  value       = module.vm1.internal_ip
}
output "external_ip_2" {
  description = "External VM 2 IP"
  value       = module.vm2.external_ip
}

output "internal_ip_2" {
  description = "Internal VM 2 IP"
  value       = module.vm2.internal_ip
}
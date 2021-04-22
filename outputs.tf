
output "lb_public_ip" {
  description = "The IP of load balancer" 
#   value = data.azurerm_public_ip.ip.ip_address
  value = azurerm_public_ip.pip.*.ip_address
}


output "vm_password" {
  description = "The password is:" 
  value = random_password.password.*.result
}








# output "server_fqdn" {
#   description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
#   value       = azurerm_postgresql_server.pgsql.fqdn
# }

output "db_administrator_login" {
  value = var.db_administrator_login
}

output "db_administrator_password" {
  value     = var.db_administrator_password
  sensitive = true
}

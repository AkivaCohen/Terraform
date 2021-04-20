
output "lb_public_ip" {
  description = "The IP of load balancer" 
  value = azurerm_public_ip.pip.ip
}


output "vm_password" {
  description = "The password is:" 
  value = random_password.password.*.result
}








output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the PostgreSQL server"
  value       = azurerm_postgresql_server.pgsql.fqdn
}

output "administrator_login" {
  value = var.administrator_login
}

output "administrator_password" {
  value     = var.administrator_password
  sensitive = true
}

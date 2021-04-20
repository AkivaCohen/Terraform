resource "azurerm_postgresql_server" "psql" {
  name                = "${var.prefix}-pgsql"
  location            = var.location
  resource_group_name = var.resource_group

  administrator_login          = "psqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_1"
  version    = "11"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

# resource "azurerm_postgresql_firewall_rule" "pgsql_rule" {
#   name                = "${var.prefix}-pgsql-rule"
#   resource_group_name = azurerm_resource_group.main.name
#   server_name         = azurerm_postgresql_server.psql.name
#   start_ip_address    = "0.0.0.0"
#   end_ip_address      = "0.0.0.0"
# }


resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "${var.prefix}-pgsql-endpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = azurerm_subnet.internal.id

  private_service_connection {
    name                           = "${var.prefix}-privateserviceconnection"
    private_connection_resource_id = azurerm_postgresql_server.psql.id
    subresource_names              = [ "postgresqlServer" ]
    is_manual_connection           = false
  }
}
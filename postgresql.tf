resource "azurerm_postgresql_server" "pgsql" {
  name                = "${var.prefix}-pgsql-b"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  administrator_login          = var.db_administrator_login
  administrator_login_password = var.db_administrator_password

  sku_name   = "GP_Gen5_2"
  version    = "11"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = false
}

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "${var.prefix}-pgsql-endpoint"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = azurerm_subnet.internal.id

  private_service_connection {
    name                           = "${var.prefix}-privateserviceconnection"
    private_connection_resource_id = azurerm_postgresql_server.pgsql.id
    subresource_names              = [ "postgresqlServer" ]
    is_manual_connection           = false
  }
}

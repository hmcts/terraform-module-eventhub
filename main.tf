resource "azurerm_eventhub_namespace" "eventhub-namespace" {
  for_each = var.eventhub_namespaces_hubs

  name                 = "${var.product}-eventhub-namespace-${var.env}"
  location             = var.location
  resource_group_name  = var.vnet_rg
  sku                  = "Standard"
  capacity             = 2
  auto_inflate_enabled = true
  zone_redundant       = true
  tags                 = var.comom_tags
}

resource "azurerm_eventhub" "eventhub" {
  name                = "${var.product}-eventhub-${var.env}"
  namespace_name      = azurerm_eventhub_namespace.eventhub-namespace.name
  resource_group_name = var.vnet_rg
  partition_count     = 2
  message_retention   = 1
}

resource "azurerm_eventhub_namespace_authorization_rule" "soc-eventhub-nonprod-sender" {
  name                = "${var.product}-eventhub-namespace-sender"
  namespace_name      = azurerm_eventhub_namespace.eventhub-namespace.name
  resource_group_name = azurerm_resource_group.eventhub-namespace.name

  listen = false
  send   = true
  manage = false
}

resource "azurerm_eventhub_namespace_authorization_rule" "soc-eventhub-nonprod-listener" {
  name                = "${var.product}-eventhub-namespace-listener"
  namespace_name      = azurerm_eventhub_namespace.eventhub-namespace.name
  resource_group_name = azurerm_resource_group.eventhub-namespace.name

  listen = true
  send   = false
  manage = false
}

resource "azurerm_eventhub_namespace_authorization_rule" "soc-eventhub-nonprod-manage" {
  name                = "${var.product}-eventhub-namespace-manage"
  namespace_name      = azurerm_eventhub_namespace.eventhub-namespace.name
  resource_group_name = azurerm_resource_group.eventhub-namespace.name

  listen = true
  send   = true
  manage = true
}
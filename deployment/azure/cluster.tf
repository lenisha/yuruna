resource "azurerm_kubernetes_cluster" "default" {
  name                = var.clusterName
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = var.clusterDnsPrefix
  kubernetes_version  = var.clusterVersion
  node_resource_group = format("%s_nrg", azurerm_resource_group.default.name)

  default_node_pool {
    name            = "default"
    node_count      = var.nodeCount
    vm_size         = var.nodeType
    os_disk_size_gb = 30
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = var.resourceTags
  }

  identity {
    type = "SystemAssigned"
  }
}
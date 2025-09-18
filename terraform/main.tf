provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "rg-aks-demo"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-demo-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "demo-aks"

  default_node_pool {
    name       = "nodepool"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  # ✅ OIDC must be enabled for Workload Identity
  oidc_issuer_enabled = true
}


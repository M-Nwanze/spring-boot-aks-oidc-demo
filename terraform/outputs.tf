output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

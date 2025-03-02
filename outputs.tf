output "policy_id" {
  description = "The Azure Policy ID"
  value       = azurerm_policy_definition.deny_storage_in_regions.id
}

output "assignment_id" {
  description = "The Azure Policy Assignment ID"
  value       = azurerm_policy_assignment.assign_deny_storage.id
}

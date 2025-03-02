output "policy_id" {
  description = "The ID of the Azure Policy created"
  value       = azurerm_policy_definition.deny_storage_in_regions.id
}

output "policy_name" {
  description = "The name of the Azure Policy"
  value       = azurerm_policy_definition.deny_storage_in_regions.name
}

output "policy_display_name" {
  description = "The display name of the Azure Policy"
  value       = azurerm_policy_definition.deny_storage_in_regions.display_name
}

output "policy_assignment_id" {
  description = "The ID of the policy assignment at the subscription level"
  value       = azurerm_subscription_policy_assignment.assign_deny_storage.id
}

output "policy_assignment_name" {
  description = "The name of the policy assignment"
  value       = azurerm_subscription_policy_assignment.assign_deny_storage.name
}

output "policy_assignment_display_name" {
  description = "The display name of the policy assignment"
  value       = azurerm_subscription_policy_assignment.assign_deny_storage.display_name
}

output "assigned_subscription_id" {
  description = "The subscription ID where the policy is assigned"
  value       = azurerm_subscription_policy_assignment.assign_deny_storage.subscription_id
}

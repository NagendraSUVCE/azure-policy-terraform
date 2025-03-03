variable "policy_name" {
  description = "Azure Policy Name"
  type        = string
  default     = "DenyStorageAccountCreationInRegions"
}

variable "policy_display_name" {
  description = "Display Name for Policy"
  type        = string
  default     = "Deny Storage Account Creation in Specific Regions"
}

variable "assignment_name" {
  description = "Policy Assignment Name"
  type        = string
  default     = "DenyStorageAccountCreationAssignment"
}

variable "assignment_display_name" {
  description = "Assignment Display Name"
  type        = string
  default     = "Deny Storage Account Creation Assignment"
}

variable "subscription_id" {
  description = "Azure Subscription ID where the policy is assigned"
  type        = string
  default     = "subscriptions/6a733d98-c87a-49b1-91ed-418b37a57f4e" # Ensure this matches your actual Azure Subscription ID
}

variable "allowed_locations" {
  description = "List of Allowed Azure Regions"
  type        = list(string)
  default     = ["eastus", "westus", "centralus", "eastus2", "westus2", "northeurope", "westeurope", "southeastasia"]
}

variable "default_restricted_locations" {
  description = "Default Restricted Regions"
  type        = list(string)
  default     = ["eastus", "westus"]
}

variable "restricted_locations" {
  description = "Regions where storage account creation is denied"
  type        = list(string)
  default     = ["eastus", "westus"]
}

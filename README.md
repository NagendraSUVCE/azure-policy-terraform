# Terraform Module: Azure Policy to Deny Storage Accounts in Specific Regions

This module creates an Azure Policy to deny storage account creation in specified regions.

## 🚀 Usage Example

```hcl
module "deny_storage_policy" {
  source               = "./azure-policy-terraform"
  scope                = "/subscriptions/YOUR_SUBSCRIPTION_ID"
  restricted_locations = ["eastus", "westus", "centralus"]
}

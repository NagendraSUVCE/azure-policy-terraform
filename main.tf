terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Ensures latest supported version
    }
  }
}

provider "azurerm" {
  features {}
}

# Define Azure Policy
resource "azurerm_policy_definition" "deny_storage_in_regions" {
  name         = var.policy_name
  display_name = var.policy_display_name
  policy_type  = "Custom"
  mode         = "All"

  metadata = jsonencode({
    category = "Storage"
  })

  policy_rule = jsonencode({
    "if" : {
      "allOf" : [
        {
          "field" : "type",
          "equals" : "Microsoft.Storage/storageAccounts"
        },
        {
          "field" : "location",
          "in" : "[parameters('restrictedLocations')]"
        }
      ]
    },
    "then" : {
      "effect" : "Deny"
    }
  })

  parameters = jsonencode({
    "restrictedLocations" : {
      "type" : "Array",
      "metadata" : {
        "displayName" : "Restricted Locations",
        "description" : "List of Azure regions where storage account creation is denied"
      },
      "allowedValues" : var.allowed_locations,
      "defaultValue" : var.default_restricted_locations
    }
  })
}

# Assign Policy at the Subscription Level
resource "azurerm_subscription_policy_assignment" "assign_deny_storage" {
  name                 = var.assignment_name
  display_name         = var.assignment_display_name
  policy_definition_id = azurerm_policy_definition.deny_storage_in_regions.id
  subscription_id      = var.subscription_id

  parameters = jsonencode({
  "restrictedLocations" = {
    "value" = var.restricted_locations
  }
})
}

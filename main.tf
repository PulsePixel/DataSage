# Configure the backend in Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf-migrate-bug-bash-resource-group"
    storage_account_name = "datasagestorage"
    container_name       = "datasagecontainer"
    key                  = "datasage/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "dev-resource-group" {
  name     = "dev-resource-group"
  location = "West US"

  tags = {
    createdFor = "tf-migrate bug bash"
    createdBy  = "terraform"
    canDelete  = "true"
    timestamp  = timestamp()
  }
}

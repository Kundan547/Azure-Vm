Azure VM Setup with Terraform

This repository contains Terraform configuration files and a helper script to provision and configure Azure Virtual Machines with required tools like Docker.

📂 Project Structure

provider.tf
Contains the Azure provider configuration. You’ll need to add your Azure credentials here to authenticate Terraform.

variables.tf
Defines input variables (string types) that are used across the Terraform configuration.

terraform.tfvars
Holds values for the input variables, keeping them separate from the main configuration files.

vm.tf
Main Terraform configuration file that provisions the Azure VM and other required resources.

script.sh
Shell script to update the VM and install required dependencies (e.g., Docker). This script can be executed as part of VM provisioning.

🚀 Usage
1. Clone the Repository
git clone https://github.com/Kundan547/Azure-Vm.git
cd Azure-Vm

2. Configure Variables

Update terraform.tfvars with your values (like resource group, location, VM size, etc.).

Example:

resource_group_name = "my-resource-group"
location            = "East US"
vm_size             = "Standard_B1s"

3. Add Azure Credentials

Update provider.tf with your Azure service principal credentials:

provider "azurerm" {
  features {}

  subscription_id = "<your-subscription-id>"
  client_id       = "<your-client-id>"
  client_secret   = "<your-client-secret>"
  tenant_id       = "<your-tenant-id>"
}

4. Initialize Terraform
terraform init

5. Validate the Configuration
terraform validate

6. Plan and Apply
terraform plan
terraform apply -auto-approve

7. Destroy (when no longer needed)
terraform destroy -auto-approve

🛠 Post-Provisioning

The script.sh can be used to install dependencies (like Docker) inside the VM:

chmod +x script.sh
./script.sh

📌 Notes

Keep your credentials secure. Avoid committing sensitive information into version control.

You can use Azure Key Vault or environment variables for better secrets management.

Recommended Terraform version: ≥ 1.5.0
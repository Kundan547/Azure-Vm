🚀 Azure VM Setup with Terraform

This repository provides a Terraform-based Infrastructure as Code (IaC) setup for provisioning Azure Virtual Machines along with a shell script to configure the VM with required dependencies (like Docker).

| File                 | Description                                                                                                            |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **provider.tf**      | Configures the Azure provider using service principal credentials.                                                     |
| **variables.tf**     | Defines all input variables for the Terraform configuration.                                                           |
| **terraform.tfvars** | Stores the actual values for variables (e.g., resource group, location, VM size), keeping them separate from the code. |
| **vm.tf**            | Main Terraform configuration file — provisions the Azure VM and its related resources.                                 |
| **script.sh**        | Post-provisioning shell script to update the VM and install dependencies (e.g., Docker).                               |

⚡ Getting Started
1️⃣ Clone the Repository
git clone https://github.com/Kundan547/Azure-Vm.git
cd Azure-Vm

2️⃣ Configure Variables

Update terraform.tfvars with your Azure values:

resource_group_name = "my-resource-group"
location            = "East US"
vm_size             = "Standard_B1s"

3️⃣ Add Azure Credentials

Edit provider.tf with your Azure service principal credentials:

provider "azurerm" {
  features {}

  subscription_id = "<your-subscription-id>"
  client_id       = "<your-client-id>"
  client_secret   = "<your-client-secret>"
  tenant_id       = "<your-tenant-id>"
}


👉 For better security, consider environment variables or Azure Key Vault instead of hardcoding secrets.

🏗️ Deployment Steps
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Preview execution plan
terraform plan

# Apply and provision resources
terraform apply -auto-approve

🗑️ Teardown (Clean Up)

When resources are no longer needed, destroy them to avoid costs:

terraform destroy -auto-approve

🔧 Post-Provisioning (VM Setup)

Run the script to update packages and install dependencies (like Docker):

chmod +x script.sh
./script.sh

📌 Notes

🔑 Credentials: Never commit sensitive information (subscription ID, secrets, tenant ID) into version control.

🛡️ Security: Use Azure Key Vault or environment variables for secret management.

🌍 Extensibility: You can expand vm.tf to include networking, security groups, storage, and monitoring.

🏗️ Terraform Version: Recommended ≥ 1.5.0

✅ With this setup, you can provision reproducible and consistent Azure VMs using Infrastructure as Code.
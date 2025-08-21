🚀 Azure VM Setup with Terraform

This repository provides a Terraform-based Infrastructure as Code (IaC) setup for provisioning Azure Virtual Machines along with a shell script to configure the VM with required dependencies (like Docker).

📂 Repository Structure
| File                 | Description                                                                                                            |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **provider.tf**      | Configures the Azure provider using variables or environment-based credentials.                                        |
| **variables.tf**     | Defines all input variables for the Terraform configuration.                                                           |
| **terraform.tfvars** | Stores the actual values for variables (e.g., resource group, location, VM size), keeping them separate from the code. |
| **vm.tf**            | Main Terraform configuration file — provisions the Azure VM and its related resources.                                 |
| **script.sh**        | Post-provisioning shell script to update the VM and install dependencies (e.g., Docker).                               |

⚡ Getting Started
1️⃣ Clone the Repository
git clone https://github.com/Kundan547/Azure-Vm.git
cd Azure-Vm


2️⃣ Configure Variables

Update `terraform.tfvars` with your Azure values:

```hcl
resource_group_name = "my-resource-group"
location            = "East US"
vm_size             = "Standard_B1s"
admin_username      = "azureuser"
admin_password      = "YourStrongP@ssword!"



3️⃣ Setup Azure Credentials (Environment Variables)

Instead of hardcoding credentials in provider.tf, export them as environment variables:

export ARM_SUBSCRIPTION_ID="your-subscription-id"
export ARM_CLIENT_ID="your-client-id"
export ARM_CLIENT_SECRET="your-client-secret"
export ARM_TENANT_ID="your-tenant-id"


Terraform automatically picks these values when running commands.
👉 Safer than committing credentials in code.

4️⃣ Deployment Steps
# 1️⃣ Initialize Terraform (downloads providers and modules)
terraform init

# 2️⃣ Validate the configuration files
terraform validate

# 3️⃣ Preview the execution plan
terraform plan

# 4️⃣ Apply the configuration to provision resources
terraform apply -auto-approve

🗑️ Teardown (Clean Up)

When resources are no longer needed, destroy them to avoid costs:

terraform destroy -auto-approve

🔧 Post-Provisioning (VM Setup)

Run the script inside the VM to update packages and install dependencies (like Docker):

chmod +x script.sh
./script.sh

📌 Notes

🔑 Credentials: Never commit sensitive information (subscription ID, secrets, tenant ID) into version control.

🛡️ Security: Use Azure Key Vault or environment variables for secret management.

🌍 Extensibility: You can expand vm.tf to include networking, security groups, storage, and monitoring.

🏗️ Terraform Version: Recommended ≥ 1.5.0

✅ With this setup, you can provision reproducible and consistent Azure VMs using Infrastructure as Code (IaC).

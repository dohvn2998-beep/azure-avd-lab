# GitHub Actions to Azure with OIDC

The intended flow is GitHub Actions -> OIDC token -> Microsoft Entra ID federated credential -> Azure role assignment.

The apply workflow expects these GitHub environment secrets:

- AZURE_CLIENT_ID
- AZURE_TENANT_ID
- AZURE_SUBSCRIPTION_ID

These are identifiers, not client passwords. Do not store a client secret in the repository.

Use a dedicated Entra application/service principal for the lab and scope its Azure role assignment to the lab resource group when practical.

The azure-lab GitHub environment is used by the apply workflow so environment protection rules can be added later.

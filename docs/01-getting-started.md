# Getting Started

## Required tools

Install Azure CLI, Terraform, Git, PowerShell 7+, a GitHub account, and an Azure subscription.

Verify:

    az version
    terraform version
    git --version
    $PSVersionTable.PSVersion

## Clone

    git clone https://github.com/dohvn2998-beep/azure-avd-lab.git
    cd azure-avd-lab

## Azure login

    az login
    az account show

Select the correct subscription before creating resources.

## Validate Terraform

    cd terraform
    terraform init -backend=false
    terraform fmt -check -recursive
    terraform validate
    terraform plan

Do not apply until variables and backend are configured.

## Cost discipline

Use the smallest resources possible. Deallocate compute when finished and delete resources no longer needed. Avoid enterprise networking services unless they teach a specific lab skill.

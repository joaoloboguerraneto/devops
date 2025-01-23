# Azure CLI

## Criar Resource Group
az group create --name MyResourceGroupCLI --location eastus

## Listar Resource Group
az group list --output table

## Excluir Resource Group
az group delete --name MyResourceGroupCLI --yes --no-wait


# PowerShell

## Criar Resource Group
New-AzResourceGroup -Name MyResourceGroupPS -Location eastus

## Listar Resource Group
Get-AzResourceGroup

## Excluir Resource Group
Remove-AzResourceGroup -Name MyResourceGroupPS -Force



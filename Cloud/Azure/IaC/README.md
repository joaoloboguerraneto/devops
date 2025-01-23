# Infraestrutura como Código (Terraform)

## Inicie o Terraform no diretório do projeto
```bash
terraform init
```

## Visualize o plano de execuçao
```bash
terraform plan
```

## Aplique a configuração para criar o Resource Group
```bash
terraform apply
```
# Digite "yes" para confirmar a aplicação

## Excluir o Resource Group
```bash
terraform destroy
```
# Digite "yes" para confirmar a exclusão

***

# Configuração do Ambiente no Terraform
## Autenticação
O Terraform pode usar as credenciais configuradas pelo Azure CLI. Para isso, basta realizar o login no Azure antes de executar os comandos do Terraform:
```bash
az login
```

## Configuração de Service Principal
Caso deseje configurar um Service Principal, siga os passos abaixo:
1. Crie um Service Principal:
```bash
az ad sp create-for-rbac --name "terraform" --role Contributor --scopes /subscriptions/{your_subscription_id} --sdk-auth
```

2. Configure as variáveis de ambiente com os valores retornados no comando acima:
```bash
export ARM_CLIENT_ID="clientId"
export ARM_CLIENT_SECRET="clientSecret"
export ARM_SUBSCRIPTION_ID="subscriptionId"
export ARM_TENANT_ID="tenantId"
```

Substitua clientId, clientSecret, subscriptionId e tenantId pelos valores obtidos.

***

# Explicação:

```bash
# Verifica se o Resource Group já existe
data "azurerm_resource_group" "existing" {
  name = var.resource_group_name
}

# Cria o Resource Group somente se não existir
resource "azurerm_resource_group" "example" {
  count = length(data.azurerm_resource_group.existing.id) == 0 ? 1 : 0

  name     = var.resource_group_name
  location = var.location
}
```

O bloco data "azurerm_resource_group" tenta buscar o Resource Group com base no nome.
Se o Resource Group já existir (length(data.azurerm_resource_group.existing.id) > 0), ele não será recriado, pois o recurso azurerm_resource_group.example terá count = 0

# Como Usar os Arquivos .tfvars
Escolha o ambiente que deseja aplicar (por exemplo, dev ou prod).

Use o arquivo correspondente ao executar o Terraform:

```bash
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

Para destruir os recursos, use o mesmo arquivo de variáveis:

```bash
terraform destroy -var-file="dev.tfvars"
```
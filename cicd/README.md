# CI/CD

## Instalar Docker

### Passo 1 — Preparar o sistema para a instalação
Antes de instalar o Docker e o Docker Compose, precisamos garantir que o sistema esteja atualizado. Execute os seguintes comandos:

```bash
sudo apt update
sudo apt upgrade -y
```

### Passo 2 — Baixar e instalar o repositório do Docker
O Docker utiliza um repositório para instalação. Para instalar e utilizá-lo, precisamos instalar os seguintes pacotes:

```bash
sudo apt install -y ca-certificates curl gnupg lsb-release
```

Após a instalação dos pacotes, é necessário adicionar a chave GPG do Docker ao sistema, executando os comandos abaixo:

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Agora podemos instalar o repositório do Docker com os seguintes comandos:

```bash
sudo echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
```

### Passo 3 — Instalar o Docker
Para prosseguir com a instalação do Docker, execute o comando abaixo. Este comando iniciará o processo de instalação do Docker no sistema:

```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

### Passo 4 — Verificar a instalação
Após concluir a instalação, você pode usar o seguinte comando para executar um contêiner “Hello World” do Docker. Isso serve como um teste prático para verificar a instalação bem-sucedida do Docker no sistema:

```bash
sudo docker run hello-world
```

Se todos os componentes foram configurados corretamente e a instalação foi bem-sucedida, você deverá observar a seguinte saída.

### Passo 5 — Executar Docker como um usuário não-root
Para executar comandos do Docker, são necessários privilégios de root, razão pela qual é necessário prefixar os comandos com "sudo". No entanto, se você prefere executar o Docker como um usuário sem privilégios de root, será necessário criar um grupo Docker. Esse grupo permitirá que usuários especificados interajam com o Docker sem a necessidade de permissões elevadas.

Crie um grupo chamado "docker" com o seguinte comando:

```bash
sudo groupadd docker
```

Adicione usuários ao grupo Docker com o comando abaixo. Isso permitirá que eles executem comandos Docker sem precisar de privilégios de root:

```bash
sudo usermod -aG docker $USER
```

Lembre-se de que "$USER" é um espaço reservado e deve ser substituído pelo nome real do usuário que você deseja adicionar ao grupo Docker. Para que essas alterações entrem em vigor, será necessário fazer logout da sessão e fazer login novamente. Após isso, você poderá utilizar o Docker sem precisar usar "sudo" em cada comando.

## Instalar Minikube

### Passo 1 — Instalar o Minikube

Utilize o comando abaixo para instalar o Minikube:

```bash
brew install minikube
```

### Passo 2 — Iniciar um cluster usando o driver Docker

Inicie o cluster com o seguinte comando:

```bash
minikube start --driver=docker
```

### Passo 3 — Verificar o status do cluster Kubernetes local

Cheque o status do cluster com o comando:

```bash
minikube status
```

### Passo 4 — Instalar o kubectx

Instale o kubectx para facilitar a troca de clusters no kubeconfig:

```bash
brew install kubectx
```

### Passo 5 — Verificar o cluster no terminal

Digite o comando abaixo no terminal para ver em qual cluster você está atualmente:

```bash
kubectx
```

Ele deve mostrar que você está no Minikube. Se não estiver, use o comando abaixo para mudar para o Minikube:

```bash
kubectx minikube
```

### Passo 6 — Habilitar addons úteis

Habilite addons úteis conforme necessário. No exemplo abaixo, habilitamos "default-storageclass" e "metallb":

```bash
minikube addons enable default-storageclass
```

Verifique a lista de addons habilitados:

```bash
minikube addons list
```

Habilite mais um addon:

```bash
minikube addons enable metallb
```

Configure-o com seus IPs:

```bash
minikube addons configure metallb
```

### Passo 7 — Parar o Minikube

Para parar o Minikube, use o comando:

```bash
minikube stop
```

### Passo 8 — Reiniciar o Minikube

Para reiniciar o Minikube, utilize o comando:

```bash
minikube start
```

## Instalar Jenkins

Execute o seguinte comando para rodar o Jenkins em um contêiner Docker:

```bash
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_data:/var/jenkins_home jenkins/jenkins:lts
```

Execute o seguinte comando para buscar a senha:

```bash
docker logs -f jenkins
```

Agora abra o seu navegador e digite:

```bash
http://localhost:8080
```


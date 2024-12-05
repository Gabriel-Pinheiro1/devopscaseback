# Dockerização da Aplicação Backend

Este projeto foi dockerizado utilizando uma imagem principal:

1. **Imagem Ruby (versão 2.7.7-slim)**: Utilizada para construir e preparar a aplicação Rails, instalando as dependências necessárias e configurando a aplicação com o PostgreSQL.
   
O Dockerfile segue o processo de instalação das dependências do sistema, configurações do Rails, e a definição de um entrypoint para iniciar o servidor corretamente.

### Processo

- **Instalação das dependências**: O contêiner começa com a instalação das dependências do sistema necessárias para o funcionamento da aplicação Rails, como o PostgreSQL e o Node.js.
- **Configuração da aplicação**: O código da aplicação é copiado para dentro do contêiner, e as dependências do Ruby são instaladas usando o `bundle install`.
- **Gerenciamento das chaves de credenciais**: O Dockerfile gerencia a chave mestre do Rails, garantindo que as credenciais sejam configuradas corretamente.
- **Entrypoint**: O contêiner executa um script de inicialização (`entrypoint.sh`), que prepara o ambiente antes de iniciar o servidor Rails.

Após esse processo, o servidor Rails está pronto para rodar na porta 3000.

 ### Repositório da Integração (Back + Front + Db): https://github.com/Gabriel-Pinheiro1/DevopsCase-Integracao

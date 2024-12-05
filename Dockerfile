# Imagem do Ruby (Versão Slim para melhorar a otimização)
FROM ruby:2.7.7-slim

# Instala as dependências do sistema necessárias para o Rails e PostgreSQL
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /app

# Copia os arquivos Gemfile e Gemfile.lock para o contêiner 
COPY Gemfile Gemfile.lock ./

# Instala as dependências do Ruby
RUN bundle install

# Copiar o restante do código da aplicação para o contêiner
COPY . .


# Copia o entrypoint.sh para a raiz do contêiner
COPY entrypoint.sh /entrypoint.sh

# Comando parar gerar uma master key
RUN rm ./config/credentials.* && \
    echo "Gerando uma Master Key" && \
    echo "Master Key" > ./config/master.key && \
    rails credentials:edit

# Corrige as quebras de linha CRLF para LF no entrypoint.sh (evitar problemas de compatibilidade no Linux)
RUN sed -i 's/\r$//' /entrypoint.sh

# Garante que o script entrypoint.sh tenha permissão de execução
RUN chmod +x /entrypoint.sh

# Porta padrão do Rails
EXPOSE 3000

# Usa o entrypoint.sh 
ENTRYPOINT ["/entrypoint.sh"]

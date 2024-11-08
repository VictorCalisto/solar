# Fixe a sua versao de rubi ao subir o projeto
FROM ruby:3.3.5

# Atualizar os pacotes e instalar as dependências
RUN apt-get update -y

# Instala dependencias
RUN apt-get install -qy --no-install-recommends \
    curl \
    postgresql \ 
    postgresql-client \
    build-essential \
    libpq-dev \
    libaio1

# Baixar e instalar o Node.js versão 20.0.0
RUN curl -fsSL https://nodejs.org/dist/v20.0.0/node-v20.0.0-linux-x64.tar.gz -o node-v20.0.0-linux-x64.tar.gz \
    && tar -zxvf node-v20.0.0-linux-x64.tar.gz -C /usr/local --strip-components=1 \
    && rm node-v20.0.0-linux-x64.tar.gz

# Define o diretório de trabalho
WORKDIR /app

# A versao do Rails esta fixada no Gemfile
COPY . /app

# Instala o Bundler
RUN gem install bundler
RUN bundle install -j $(nproc)

# Instalar as dependências do npm
RUN npm install --no-save --no-cache

# Limpar o cache do apt-get e outros arquivos temporários
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Tratamento de erros
RUN mkdir -p /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Sobe o Servidor
CMD [ "sh", "-c", "RAILS_ENV=$RAILS_ENV bundle exec rails server -b 0.0.0.0 -p 3000" ]

# Torna o container debugavel
# CMD ["sh", "-c", "sleep infinity"]
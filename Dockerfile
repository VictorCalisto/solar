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

# Define o diretório de trabalho
WORKDIR /app

# A versao do Rails esta fixada no Gemfile
COPY . /app

# Instala o Bundler
RUN gem install bundler
RUN bundle install -j $(nproc)

# Limpar o cache do apt-get e outros arquivos temporários
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Tratamento de erros
RUN mkdir -p /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Sobe o Servidor
CMD [ "sh", "-c", "bundle exec rails server -b 0.0.0.0" ]

# Torna o container debugavel
# CMD ["sh", "-c", "sleep infinity"]
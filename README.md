# Trabalho Prático: Apache Spark e Delta Lake com MinIO

## Descrição do trabalho

Este projeto tem como objetivo implementar um fluxo de ingestão, processamento e armazenamento de dados utilizando **PostgreSQL, MinIO, Apache Spark e Delta Lake**.

A solução utiliza o PostgreSQL como fonte de dados relacional, o MinIO como armazenamento de objetos e o Apache Spark para processar os arquivos e convertê-los para o formato Delta Lake.

O pipeline é organizado em duas camadas principais:

- **Landing Zone:** armazena os dados extraídos da origem em arquivos CSV.
- **Bronze:** armazena os dados processados no formato Delta Lake.

Além da ingestão e conversão dos dados, o projeto contempla operações de manipulação de registros nas tabelas Delta e a análise das diferenças entre tabelas gerenciadas e não gerenciadas.

### Fluxo de dados

```text
PostgreSQL
    |
    | Extração das tabelas
    v
MinIO - landing-zone
    |
    | Leitura e processamento com PySpark
    v
Apache Spark
    |
    | Gravação no formato Delta Lake
    v
MinIO - bronze
    |
    | Operações DML
    v
INSERT / UPDATE / DELETE
```

## Documentação

A documentação técnica do projeto está disponível no [GitHub Pages](https://jeanvitorvieira.github.io/trabalho-eng-dados-apache-spark-minio/), caso esteja habilitado para este repositório.

Ela também pode ser executada localmente com o MkDocs:

```bash
poetry run mkdocs serve
```

Para gerar os arquivos estáticos da documentação:

```bash
poetry run mkdocs build
```

## Pré-requisitos

- Linux (Debian 13.7 Trixie).
- PostgreSQL ODBC.
- [Python 3.11.9](https://www.python.org/downloads/).
- [Java JDK 17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html).
- [Poetry](https://python-poetry.org/docs/).
- [Git](https://git-scm.com/install/linux).
- [Docker e Docker Compose](https://docs.docker.com/engine/install/).

## Instalação

### 1. Instalar o PostgreSQL ODBC

Atualize a lista de pacotes e instale o driver ODBC para PostgreSQL:

```bash
sudo apt update
sudo apt install odbc-postgresql
```

### 2. Clonar o repositório

Clone o repositório do projeto:

```bash
git clone https://github.com/jeanvitorvieira/trabalho-eng-dados-apache-spark-minio.git
cd trabalho-eng-dados-apache-spark-minio
```

### 3. Configurar as variáveis de ambiente

Crie o arquivo `.env` a partir do modelo disponibilizado:

```bash
cp .env.example .env
```

Preencha as variáveis conforme as configurações locais do PostgreSQL e do MinIO.

**Importante:** não compartilhe credenciais reais nem publique o arquivo `.env` no repositório.

### 4. Instalar as dependências Python

Instale as dependências declaradas no projeto:

```bash
poetry install
```

### 5. Iniciar os serviços

Na raiz do repositório, execute:

```bash
docker compose up -d
```

Verifique se os contêineres foram iniciados:

```bash
docker compose ps
```

O PostgreSQL e o MinIO são utilizados como parte da infraestrutura do pipeline. Consulte o arquivo `docker-compose.yml` para verificar os serviços, as portas e as configurações disponíveis.

## Execução dos notebooks

Os notebooks devem ser executados na ordem correspondente às etapas do pipeline.

### Etapas do processamento

1. **Configuração do ambiente:** preparar as conexões e os recursos necessários para o processamento.
2. **Extração dos dados:** consultar as tabelas do PostgreSQL e armazenar os resultados em CSV no bucket `landing-zone`.
3. **Conversão para Delta Lake:** ler os arquivos de entrada com PySpark e gravar os dados no bucket `bronze`.
4. **Operações DML:** executar operações de inserção, atualização e exclusão em tabelas Delta.
5. **Verificação do histórico:** consultar o histórico transacional das tabelas utilizadas.

Os nomes e caminhos exatos dos notebooks podem ser consultados no diretório `src/`.

Antes de executar cada etapa, verifique se os serviços estão ativos, se as variáveis de ambiente estão configuradas e se os arquivos necessários foram gerados pela etapa anterior.

## Estrutura do repositório

```text
trabalho-eng-dados-apache-spark-minio/
├── data/                   # Dados utilizados pelo projeto
├── docs/                   # Documentação do projeto
│   ├── index.md
│   ├── database_to_landing.md
│   ├── landing_to_bronze.md
│   ├── delta_dml.md
│   ├── tabelas_delta.md
│   └── execucao.md
├── src/                    # Código-fonte e notebooks
├── tests/                  # Testes do projeto
├── .env.example            # Modelo das variáveis de ambiente
├── .gitignore
├── docker-compose.yml      # Configuração dos serviços
├── mkdocs.yml              # Configuração da documentação
├── poetry.lock             # Versões resolvidas das dependências
└── pyproject.toml          # Configuração e dependências Python
```

A estrutura apresentada representa a organização prevista para o projeto. Os arquivos efetivamente presentes nos diretórios podem variar conforme o desenvolvimento.

## Datasets

Os dados de origem são obtidos a partir das tabelas disponibilizadas no PostgreSQL.

Durante o processo de extração, as tabelas são exportadas para arquivos CSV e armazenadas no bucket `landing-zone` do MinIO. Esses arquivos são utilizados como entrada para o processamento com Apache Spark.

Após a conversão, os dados são gravados em formato Delta Lake no bucket `bronze`.

O formato Delta Lake possibilita a execução de operações transacionais, como `INSERT`, `UPDATE` e `DELETE`, além da consulta ao histórico de alterações.

## Referências

- [Apache Spark](https://spark.apache.org/docs/latest/)
- [PySpark](https://spark.apache.org/docs/latest/api/python/)
- [Delta Lake](https://docs.delta.io/)
- [MinIO Documentation](https://min.io/docs/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Poetry](https://python-poetry.org/docs/)
- [MkDocs Material](https://squidfunk.github.io/mkdocs-material/)


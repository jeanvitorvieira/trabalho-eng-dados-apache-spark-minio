# Configuração e execução

## Pré-requisitos

Para executar o projeto, são necessários:

- Git;
- Docker e Docker Compose;
- Python;
- Poetry;
- Dependências do projeto para execução do PySpark e do Delta Lake.

## Obtenção do projeto

Clone o repositório e entre no diretório:

```bash
git clone https://github.com/jeanvitorvieira/trabalho-eng-dados-apache-spark-minio.git

cd trabalho-eng-dados-apache-spark-minio
```

## Configuração das variáveis de ambiente

O projeto disponibiliza o arquivo `.env.example` como referência para a configuração das variáveis de ambiente.

Crie o arquivo `.env` a partir desse modelo:

```bash
cp .env.example .env
```

Preencha as variáveis conforme a configuração local dos serviços.

**Importante:** não publique senhas, chaves de acesso ou outras credenciais reais no repositório.

## Inicialização dos serviços

Na raiz do projeto, inicialize os serviços definidos no Docker Compose:

```bash
docker compose up -d
```

Verifique o estado dos serviços:

```bash
docker compose ps
```

## Instalação das dependências

Instale as dependências declaradas no projeto:

```bash
poetry install
```

A execução dos notebooks também exige um ambiente compatível com as versões de Apache Spark, PySpark e Delta Lake utilizadas na implementação.

## Ordem de execução

Execute as etapas na seguinte ordem:

1. Inicialização e configuração do ambiente.
2. Extração das tabelas do PostgreSQL para arquivos CSV no bucket `landing-zone`.
3. Leitura dos arquivos e conversão para Delta Lake no bucket `bronze`.
4. Execução das operações `INSERT`, `UPDATE` e `DELETE`.
5. Consulta ao histórico e discussão sobre tabelas gerenciadas e não gerenciadas.

## Encerramento

Após concluir a execução, os serviços podem ser encerrados com:

```bash
docker compose down
```

Esse comando encerra os contêineres sem remover os volumes nomeados. Para evitar perda de dados, não remova os volumes sem compreender as consequências.

## Observação

Os comandos e a ordem de execução devem ser conferidos em conjunto com os notebooks e as configurações efetivamente presentes no repositório.

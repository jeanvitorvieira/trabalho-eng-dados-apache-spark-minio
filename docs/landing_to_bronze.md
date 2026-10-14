# MinIO para Delta Lake

## Objetivo

Esta etapa realiza a leitura dos arquivos CSV armazenados no MinIO e a gravação dos dados no formato Delta Lake, utilizando Apache Spark e PySpark.

O objetivo é transformar os arquivos da camada de entrada em tabelas que permitam operações transacionais sobre os dados.

## Origem dos dados

Os arquivos utilizados nesta etapa são provenientes do bucket `landing-zone`, preenchido durante a extração dos dados do PostgreSQL.

## Processamento

O processo de conversão compreende as seguintes etapas:

1. Acessar os arquivos armazenados no MinIO.
2. Ler os arquivos CSV utilizando PySpark.
3. Processar os dados com Apache Spark.
4. Gravar os dados no formato Delta Lake no bucket `bronze`.

## Camada Bronze

A camada `bronze` armazena os dados convertidos para Delta Lake. Esse formato permite registrar alterações transacionais e consultar o histórico de operações realizadas nas tabelas.

A organização dos dados nessa camada facilita a execução das operações de manipulação exigidas no trabalho.

## Resultado esperado

Ao final desta etapa, os dados processados devem estar disponíveis em formato Delta Lake no bucket `bronze`, prontos para serem utilizados nas operações DML.

Consulte o notebook de conversão do projeto para verificar os arquivos processados e os caminhos de armazenamento utilizados.

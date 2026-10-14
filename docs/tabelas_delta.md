# Tabelas gerenciadas e não gerenciadas

## Objetivo

Esta seção apresenta a diferença entre tabelas gerenciadas e não gerenciadas no contexto do Apache Spark e do armazenamento de dados em Delta Lake.

## Tabelas gerenciadas

Em tabelas gerenciadas, o catálogo controla a definição da tabela e gerencia sua localização de armazenamento conforme a configuração do ambiente.

O mecanismo de processamento administra os dados e os metadados associados à tabela.

## Tabelas não gerenciadas

Em tabelas não gerenciadas, a definição da tabela é registrada no catálogo, mas a localização dos dados é definida ou controlada separadamente.

Essa abordagem permite trabalhar com dados armazenados em um caminho específico, independentemente do gerenciamento padrão de armazenamento do catálogo.

## Principais diferenças

| Característica | Gerenciada | Não gerenciada |
|---|---|---|
| Registro no catálogo | Sim | Sim |
| Localização dos dados | Gerenciada conforme a configuração | Pode ser especificada externamente |
| Gerenciamento do armazenamento | Associado ao catálogo | Mais independente do catálogo |
| Exclusão da tabela | O efeito sobre os dados depende do catálogo e da configuração | Em geral, a remoção do registro não exclui os dados externos |

## Considerações

O comportamento exato depende do catálogo, do mecanismo de armazenamento e da forma como a tabela Delta Lake foi criada.

Por isso, é importante distinguir a remoção do registro da tabela no catálogo da exclusão física dos arquivos armazenados no MinIO.

Esta comparação atende à discussão conceitual sobre tabelas gerenciadas e não gerenciadas proposta no trabalho.

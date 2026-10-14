# Operações DML no Delta Lake

## Objetivo

Esta etapa demonstra operações de manipulação de dados em tabelas armazenadas no formato Delta Lake.

As operações são realizadas com o objetivo de demonstrar como os registros podem ser inseridos, atualizados e removidos após a conversão dos dados para a camada `bronze`.

## INSERT

A operação `INSERT` adiciona novos registros à tabela Delta Lake.

Essa operação permite demonstrar a inclusão de dados depois da carga inicial.

## UPDATE

A operação `UPDATE` modifica os valores dos registros que atendem a uma determinada condição.

No Delta Lake, as alterações são registradas por meio do mecanismo transacional do formato.

## DELETE

A operação `DELETE` remove logicamente os registros que atendem à condição definida na operação.

O Delta Lake registra a alteração na tabela, permitindo consultar seu histórico transacional.

## Histórico de operações

O histórico permite consultar as operações registradas na tabela Delta Lake, incluindo informações sobre as alterações realizadas.

Essa funcionalidade auxilia na análise da evolução dos dados e na verificação das operações executadas.

## Resultado

Ao final desta etapa, devem estar demonstradas as operações de inserção, atualização e exclusão, bem como a consulta ao histórico da tabela.

Os comandos e resultados específicos podem ser consultados no notebook de operações DML do projeto.

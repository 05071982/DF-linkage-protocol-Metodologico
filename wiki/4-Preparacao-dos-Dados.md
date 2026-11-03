🌐 [English](4-Data-Preparation) · **Português**

# 4. Preparação dos dados

A qualidade do linkage depende de campos comparáveis. Todas as fontes passam pela mesma preparação antes de qualquer pareamento.

## 4.1 Padronização de texto
Macro **Data Cleansing** do Alteryx (`Cleanse.yxmc`) aplicada a nomes e chaves:
- caixa alta;
- remoção de acentos, pontuação, hífens e caracteres especiais;
- remoção de espaços no início, no fim e duplicados.

## 4.2 Datas
Todas as datas convertidas para `dd/MM/aaaa` (ferramenta DateTime). O ano de nascimento é extraído da data completa.

## 4.3 Municípios
Os códigos de município do IBGE são cruzados com uma tabela auxiliar para obter nomes harmonizados (residência e ocorrência).

## 4.4 Filtro de período
Só ficam eventos entre **2010 e 2022** (data de nascimento, óbito, notificação, procedimento ou internação, conforme o sistema).

## 4.5 Chaves compostas

| Chave | Campos concatenados | Usada em |
|---|---|---|
| Chave da Trilha 1 | sexo + ano de nascimento + **nome da mãe** + data de nascimento + município | PNTN, SINASC, SIM |
| Chave alternativa da Trilha 1 | sexo + ano de nascimento + **nome da criança** + data de nascimento + município | PNTN, SINASC, SIM (linkage final) |
| Chave da Trilha 2 | sexo + ano de nascimento + **nome do paciente** + data de nascimento + município | SINAN, SIA, SIH |
| Segunda chave da Trilha 2 | sexo + ano de nascimento + **nome da mãe** + data de nascimento + município | SINAN, SIH |
| Segunda chave do SIA | sexo + ano de nascimento + **últimos 10 caracteres do nome do paciente** + data de nascimento + município | SIA (sem nome da mãe) |

## 4.6 Codificação fonética
Dentro do Fuzzy Match, as chaves são codificadas com **Double Metaphone** (chave de até 4 caracteres, palavras tratadas separadamente, palavras de uma letra ignoradas), absorvendo variações de grafia de nomes em português.

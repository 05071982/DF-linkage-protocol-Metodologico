🌐 [English](3-Case-Definitions.md) · **Português**

# 3. Definições de caso

## Caso novo (incidente)
Pessoa com DF contada no **ano de nascimento** (a DF é hereditária), qualquer que seja o sistema em que o diagnóstico apareceu primeiro. Quem nasceu em 2010 e foi registrado pela primeira vez em 2022 conta como caso incidente de 2010.

## Caso existente (prevalente)
Pessoa com registro confirmado de DF em qualquer sistema antes ou durante o ano, residente na Bahia e viva naquele ano (óbitos retirados conforme a definição de mortalidade).

## Óbito atribuído à DF

| Categoria | Definição |
|---|---|
| **Declarado** | Causa básica no SIM = CID-10 D57.0, D57.1, D57.2 ou D57.8 |
| **Presumido** | DF não é a causa básica, mas aparece entre as causas associadas ou numa lista ampliada de códigos relacionados à DF |
| **Qualificado** | Declarado + presumido |

O SIM é a referência para óbitos; SINAN, SIH e SIA servem apenas para checar a consistência do linkage.

## Inclusão e exclusão

| Fonte | Incluídos | Excluídos |
|---|---|---|
| PNTN | Padrões de hemoglobina FS, FSC, FSD, FSA | Traço (FAS), alfa-talassemia (FA Bart's), beta-talassemia (F0), normal/indeterminado (FA) |
| SIM, SIH, SIA, SINAN | CID-10 D57.0, D57.1, D57.2, D57.8 | D57.3 (traço falciforme); D57.4 (baixa frequência; recodificado no Brasil como D57.2/D57.8) |
| Todos | Residentes na Bahia | Não residentes (no SIM, residentes que faleceram em outros estados são incluídos) |

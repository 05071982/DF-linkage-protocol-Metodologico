🌐 [English](2-Data-Sources.md) · **Português**

# 2. Fontes de dados

| Sistema | Conteúdo | Cobertura neste estudo | Registros (brutos → únicos) |
|---|---|---|---|
| **PNTN** (SIPNTN) — Programa Nacional de Triagem Neonatal | Resultados do teste do pezinho; serviço de referência APAE Salvador | Bahia, nascidos 2010–2022 | 2.880 → 2.841 |
| **SINASC** — Sistema de Informações sobre Nascidos Vivos | Todos os nascidos vivos; variáveis da mãe e do parto | Bahia, 2010–2022 | 2.609.974 (referência) |
| **SIM** — Sistema de Informações sobre Mortalidade | Declarações de óbito; causas básica e associadas | Residentes na Bahia, 2010–2022 | 1.395 → 1.395 |
| **SINAN** — Sistema de Informação de Agravos de Notificação | Notificações de DF (compulsória na Bahia desde 2009/2017) | Residentes na Bahia, 2010–2022 | 4.963 → 4.802 |
| **SIA/SUS** — Sistema de Informações Ambulatoriais | Procedimentos ambulatoriais (ex.: acompanhamento de hemoglobinopatias, Doppler transcraniano) | Apenas Salvador, 2010–2022 | 13.935 → 4.068 |
| **SIH/SUS** — Sistema de Informações Hospitalares | Internações | Apenas Salvador, 2010–2022 | 833 → 646 |

## Campos usados no linkage

| Campo | PNTN | SINASC | SIM | SINAN | SIA | SIH |
|---|---|---|---|---|---|---|
| Nome da pessoa | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Nome da mãe | ✔ | ✔ | ✔ | ✔ | — | ✔ |
| Sexo | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Data de nascimento | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Município (código IBGE) | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Bairro (checagem de consistência) | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Gravidez múltipla (GRAVIDEZ) | — | ✔ | — | — | — | — |
| Número da declaração de óbito | — | — | ✔ | — | — | — |

## Limitações conhecidas das fontes

- **SIA e SIH** só estavam disponíveis para Salvador; o SIA não tem o nome da mãe.
- **PNTN** não tem indicador de gemelaridade; irmãos da mesma mãe são mantidos e duplicidades exatas, removidas.
- **SINAN**: a notificação da DF passou a ser compulsória em todo o estado apenas em 2017.
- A migração interestadual não pôde ser medida (adotou-se saldo migratório neutro).

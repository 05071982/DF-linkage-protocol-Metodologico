🌐 [English](10-How-to-Use.md) · **Português**

# 10. Como usar

## Requisitos
- Alteryx Designer **2024.2** ou superior (fluxos salvos na versão 2024.2).
- Macros padrão do Alteryx usadas: *Data Cleansing* (`Cleanse.yxmc`) e *Random % Sample* (`RandomRecords.yxmc`), que já vêm com o Designer.
- R ≥ 4.0 para o script do AHP (só R base).

## Estrutura do repositório

```
workflows/   Fluxos do Alteryx (Trilha 1, Trilha 2, Linkage final)
R/           Correção da subnotificação (AHP)
images/      Figuras e diagramas
docs/        Cópia desta wiki (arquivada a cada versão)
data/        (vazia) coloque aqui os arquivos de entrada — nunca os envie ao GitHub
output/      (vazia) arquivos gerados pelos fluxos
```

## Arquivos de entrada
Os dados de entrada **não** são distribuídos. Devem ser solicitados aos detentores (Secretaria da Saúde do Estado da Bahia, Secretaria Municipal de Saúde de Salvador, APAE Salvador), com aprovação ética. Coloque-os em `data/`:

| Fluxo | Entrada esperada |
|---|---|
| Trilha 1 | `PNTN_TRATADO.xlsx`, `2010_2023.csv` (SINASC), `SIM_GERAL_DEC_E_PRESUM.yxdb`, `Tabela_municípios.xlsx` |
| Trilha 2 | `SINAN_2008_2023.yxdb`, `SIA_2010_2022.yxdb`, `SIH_2010_2022_novo.yxdb`, `Tabela_municípios.xlsx` |
| Final | `Trilha1_Vitais_Nova.yxdb`, `Trilha2_Morbidades_Nova.yxdb`, `Encontrados_Trilhs1_e_2_determinístico.yxdb`, `PNTN desduplicado.xlsx` |

## Ordem de execução
1. `Track1_VitalData.yxmd` → grava a base da Trilha 1 em `output/`.
2. `Track2_Morbidity.yxmd` → grava a base da Trilha 2 em `output/`.
3. Copie as bases das trilhas para `data/` com os nomes esperados pelo fluxo final.
4. `FinalLinkage.yxmd` → base consolidada e amostras para validação.

## Adaptando a outros contextos
- Troque as entradas mantendo os nomes de campo, ou ajuste as ferramentas *Select* e *Formula*.
- Revise a chave composta conforme os identificadores disponíveis nos seus sistemas.
- Recalibre o limiar do Fuzzy Match com uma amostra de revisão manual antes do uso em produção.

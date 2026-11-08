🌐 [English](7-Final-Linkage.md) · **Português**

# 7. Linkage final — Trilha 1 × Trilha 2

Fluxo: [`workflows/FinalLinkage.yxmd`](../workflows/FinalLinkage.yxmd)

## Etapas

1. **Entradas** — base da Trilha 1 (status 1–7, exceto 5) e base da Trilha 2 (status 8–14).
2. **Linkage determinístico** — pareamento exato na chave composta; os pares encontrados entram primeiro.
3. **Linkage por similaridade** — Fuzzy Match ≥ 85%, rodado com duas variantes de chave (nome da mãe e nome da criança) para recuperar pares que uma das variantes perderia.
4. **Classificação** — encontrado nas duas trilhas / só na Trilha 1 / só na Trilha 2. A concordância da data de nascimento entre as trilhas é sinalizada (`Mesma_data_Nasc`) para apoiar a revisão manual.
5. **Desduplicação sequencial** — registros únicos em todas as variantes de chave. Os registros do PNTN são reinseridos após a desduplicação, para que nenhum nascido triado se perca.
6. **Validação manual** — ver [Validação](8-Validacao.md).
7. **Saída** — base consolidada com **11.536 pessoas com DF**.

## De 13.752 registros a 11.536 pessoas

| | n |
|---|---|
| Soma dos registros únicos por sistema (exceto SINASC) | 13.752 |
| Registros redundantes unidos pelo linkage (dentro e entre as trilhas) | − 2.216 |
| **Base final consolidada** | **11.536** |

## Canvas do Alteryx

![Canvas do linkage final](../images/final_canvas.png)

🌐 [English](9-Underreporting-Correction-AHP) · **Português**

# 9. Correção da subnotificação (AHP)

Script: [`R/ahp_underreporting.R`](../blob/main/R/ahp_underreporting.R) — R base, sem pacotes.

O SIA e o SIH só estavam disponíveis para Salvador, e o SIA cobria parte dos registros ambulatoriais. Para corrigir a incidência e a prevalência por essa subnotificação, construiu-se um fator de correção ponderado pelo **Processo Analítico Hierárquico** (AHP, Saaty).

## 9.1 Indicadores

| # | Indicador | O que mede |
|---|---|---|
| 1 | Amostral | Registros encontrados vs. esperados com cobertura completa |
| 2 | Regional | Municípios com registro vs. municípios esperados |
| 3 | Temporal | Média anual de registros observados vs. esperados |
| 4 | Casos novos | Nascidos identificados fora do PNTN em relação aos registros do PNTN |
| 5 | Procedimentos | Usuários de hidroxiureia esperados (protocolo clínico) vs. registros no SIA (procedimento 06.04.48.001-6) |

## 9.2 Matriz de comparação pareada (escala de Saaty)

| | Amostral | Regional | Temporal | Casos novos | Procedimentos |
|---|---|---|---|---|---|
| Amostral | 1 | 2 | 3 | 1/2 | 1/3 |
| Regional | 1/2 | 1 | 2 | 1/3 | 1/4 |
| Temporal | 1/3 | 1/2 | 1 | 1/4 | 1/5 |
| Casos novos | 2 | 3 | 4 | 1 | 1/2 |
| Procedimentos | 3 | 4 | 5 | 2 | 1 |

| | Amostral | Regional | Temporal | Casos novos | Procedimentos |
|---|---|---|---|---|---|
| **Peso** | 0,161 | 0,099 | 0,062 | 0,262 | 0,416 |

λmáx = 5,068 · IC = 0,017 · **RC = 0,015** (< 0,10, consistente)

## 9.3 Razões de subnotificação

Para cada sistema, `u = (Esperado − Observado) / Observado`. As razões são convertidas em probabilidades pela distribuição normal acumulada (média e DP do indicador amostral) e tiram-se as médias por indicador.

| Indicador | Probabilidade média | Peso | Contribuição |
|---|---|---|---|
| Amostral | 0,476 | 0,161 | 0,077 |
| Regional | 0,215 | 0,099 | 0,021 |
| Temporal | 0,482 | 0,062 | 0,030 |
| Casos novos | 0,203 | 0,262 | 0,053 |
| Procedimentos | 0,508 | 0,416 | 0,211 |
| **Fator de correção F** | | | **0,3923** |

## 9.4 Aplicação

```
Estimativa ajustada = Estimativa observada × (1 + F)
Exemplo: 132,64 por 100 mil nascidos vivos × 1,3923 = 184,68 por 100 mil
```

O fator foi aplicado à incidência e à prevalência. **Não** foi aplicado à mortalidade, porque o SIM é menos afetado pela subnotificação; SIA e SIH serviram apenas para identificar óbitos presumidos.

## 9.5 Como rodar

```r
source("R/ahp_underreporting.R")
```

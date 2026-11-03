🌐 **English** · [Português](9-Correcao-da-Subnotificacao-AHP.md)

# 9. Underreporting correction (AHP)

Script: [`R/ahp_underreporting.R`](../R/ahp_underreporting.R) — base R, no packages needed.

SIA and SIH were available only for Salvador, and SIA covered part of the outpatient records. To correct incidence and prevalence for this underreporting, a weighted correction factor was built with the **Analytic Hierarchy Process** (Saaty).

## 9.1 Indicators

| # | Indicator | What it measures |
|---|---|---|
| 1 | Sampling | Records found vs records expected with full coverage |
| 2 | Regional | Municipalities with records vs municipalities expected |
| 3 | Temporal | Mean annual records observed vs expected |
| 4 | New cases | Births identified outside the PNTN relative to PNTN records |
| 5 | Procedures | Expected hydroxyurea users (clinical protocol) vs SIA records (procedure 06.04.48.001-6) |

## 9.2 Pairwise comparison matrix (Saaty scale)

| | Sampling | Regional | Temporal | New cases | Procedures |
|---|---|---|---|---|---|
| Sampling | 1 | 2 | 3 | 1/2 | 1/3 |
| Regional | 1/2 | 1 | 2 | 1/3 | 1/4 |
| Temporal | 1/3 | 1/2 | 1 | 1/4 | 1/5 |
| New cases | 2 | 3 | 4 | 1 | 1/2 |
| Procedures | 3 | 4 | 5 | 2 | 1 |

| | Sampling | Regional | Temporal | New cases | Procedures |
|---|---|---|---|---|---|
| **Weight** | 0.161 | 0.099 | 0.062 | 0.262 | 0.416 |

λmax = 5.068 · CI = 0.017 · **CR = 0.015** (< 0.10, consistent)

## 9.3 Underreporting ratios

For each system, `u = (Expected − Observed) / Observed`. Ratios are converted to probabilities with the normal cumulative distribution (mean and SD of the sampling indicator) and averaged per indicator.

| Indicator | Mean probability | Weight | Contribution |
|---|---|---|---|
| Sampling | 0.476 | 0.161 | 0.077 |
| Regional | 0.215 | 0.099 | 0.021 |
| Temporal | 0.482 | 0.062 | 0.030 |
| New cases | 0.203 | 0.262 | 0.053 |
| Procedures | 0.508 | 0.416 | 0.211 |
| **Correction factor F** | | | **0.3923** |

## 9.4 Application

```
Adjusted estimate = Observed estimate × (1 + F)
Example: 132.64 per 100,000 live births × 1.3923 = 184.68 per 100,000
```

The factor was applied to incidence and prevalence. It was **not** applied to mortality, because SIM is less affected by underreporting; SIA/SIH were used only to identify presumed deaths.

## 9.5 Run it

```r
source("R/ahp_underreporting.R")
```

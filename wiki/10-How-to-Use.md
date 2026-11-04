🌐 **English** · [Português](10-Como-Usar)

# 10. How to use

## Requirements
- Alteryx Designer **2024.2** or later (workflows saved in version 2024.2).
- Standard Alteryx macros used: *Data Cleansing* (`Cleanse.yxmc`) and *Random % Sample* (`RandomRecords.yxmc`), shipped with Designer.
- R ≥ 4.0 for the AHP script (base R only).

## Repository layout

```
workflows/   Alteryx workflows (Track 1, Track 2, Final linkage)
R/           AHP underreporting correction
images/      Figures and diagrams
docs/        Copy of this wiki (archived with each release)
data/        (empty) place input files here — never commit them
output/      (empty) files written by the workflows
```

## Input files
Input data are **not** distributed. They must be requested from the data custodians (Bahia State Health Department, Salvador Municipal Health Department, APAE Salvador) with ethics approval. Place them in `data/`:

| Workflow | Expected input |
|---|---|
| Track 1 | `PNTN_TRATADO.xlsx`, `2010_2023.csv` (SINASC), `SIM_GERAL_DEC_E_PRESUM.yxdb`, `Tabela_municípios.xlsx` |
| Track 2 | `SINAN_2008_2023.yxdb`, `SIA_2010_2022.yxdb`, `SIH_2010_2022_novo.yxdb`, `Tabela_municípios.xlsx` |
| Final | `Trilha1_Vitais_Nova.yxdb`, `Trilha2_Morbidades_Nova.yxdb`, `Encontrados_Trilhs1_e_2_determinístico.yxdb`, `PNTN desduplicado.xlsx` |

## Order of execution
1. `Track1_VitalData.yxmd` → writes the Track 1 base to `output/`.
2. `Track2_Morbidity.yxmd` → writes the Track 2 base to `output/`.
3. Auxiliary export (deterministic step): from the Track 1 and Track 2 outputs, export the deterministic-linkage bases expected by the final workflow — `Trilha1_Vitais_Nova.yxdb`, `Trilha2_Morbidades_Nova.yxdb` and `Encontrados_Trilhs1_e_2_determinístico.yxdb` (pairs matched on the exact composite key between the two tracks) — and place them in `data/`.
4. `FinalLinkage.yxmd` → consolidated base and validation samples.

## Adapting to other contexts
- Replace the inputs and keep the field names, or adjust the *Select* and *Formula* tools.
- Review the composite key for the identifiers available in your systems.
- Recalibrate the Fuzzy Match threshold with a clerical-review sample before production use.

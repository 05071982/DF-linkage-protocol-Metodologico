🌐 **English** · [Português](3-Definicoes-de-Caso.md)

# 3. Case definitions

## Incident (new) case
A person with SCD counted in the **year of birth** (SCD is hereditary), whatever the system in which the diagnosis was first recorded. A person born in 2010 and first recorded in 2022 is counted as a 2010 incident case.

## Prevalent (existing) case
A person with a confirmed SCD record in any system before or during the year, resident in Bahia, alive in that year (deaths removed according to the mortality definition).

## Death attributed to SCD

| Category | Definition |
|---|---|
| **Declared** | Underlying cause in SIM = ICD-10 D57.0, D57.1, D57.2 or D57.8 |
| **Presumed** | SCD not the underlying cause, but present among associated causes or in an expanded list of SCD-related codes |
| **Qualified** | Declared + presumed |

SIM is the reference for deaths; SINAN, SIH and SIA are used only for linkage consistency.

## Inclusion and exclusion

| Source | Included | Excluded |
|---|---|---|
| PNTN | Haemoglobin patterns FS, FSC, FSD, FSA | Trait (FAS), alpha-thalassaemia (FA Bart's), beta-thalassaemia (F0), normal/indeterminate (FA) |
| SIM, SIH, SIA, SINAN | ICD-10 D57.0, D57.1, D57.2, D57.8 | D57.3 (sickle-cell trait); D57.4 (low frequency; recoded in Brazil as D57.2/D57.8) |
| All | Residents of Bahia | Non-residents (SIM: residents who died in other states are included) |

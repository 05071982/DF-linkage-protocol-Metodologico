🌐 **English** · [Português](2-Fontes-de-Dados.md)

# 2. Data sources

| System | Content | Coverage in this study | Records (raw → unique) |
|---|---|---|---|
| **PNTN** (SIPNTN) — National Neonatal Screening Programme | Heel-prick results; reference service APAE Salvador | Bahia, births 2010–2022 | 2,880 → 2,841 |
| **SINASC** — Live Birth Information System | All live births; maternal and birth variables | Bahia, 2010–2022 | 2,609,974 (reference) |
| **SIM** — Mortality Information System | Death certificates; underlying and associated causes | Bahia residents, 2010–2022 | 1,395 → 1,395 |
| **SINAN** — Notifiable Diseases Information System | SCD notifications (compulsory in Bahia since 2009/2017) | Bahia residents, 2010–2022 | 4,963 → 4,802 |
| **SIA/SUS** — Outpatient Information System | Outpatient procedures (e.g. follow-up of haemoglobinopathies, transcranial Doppler) | Salvador only, 2010–2022 | 13,935 → 4,068 (3 excluded; 9,864 duplicates) |
| **SIH/SUS** — Hospital Information System | Hospital admissions | Salvador only, 2010–2022 | 833 → 646 |

## Fields used for linkage

| Field | PNTN | SINASC | SIM | SINAN | SIA | SIH |
|---|---|---|---|---|---|---|
| Person's name | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Mother's name | ✔ | ✔ | ✔ | ✔ | — | ✔ |
| Sex | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Date of birth | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Municipality (IBGE code) | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Neighbourhood (consistency check) | ✔ | ✔ | ✔ | ✔ | ✔ | ✔ |
| Multiple birth (GRAVIDEZ) | — | ✔ | — | — | — | — |
| Death certificate number | — | — | ✔ | — | — | — |

## Known limitations of the sources

- **SIA and SIH** were available only for the municipality of Salvador; SIA lacks the mother's name.
- **PNTN** has no twin indicator; siblings of the same mother are kept, exact duplicates removed.
- **SINAN**: SCD notification became compulsory statewide only in 2017.
- Interstate migration could not be measured (neutral balance assumed).

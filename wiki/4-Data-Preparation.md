🌐 **English** · [Português](4-Preparacao-dos-Dados)

# 4. Data preparation

Linkage quality depends on comparable fields. All sources go through the same preparation before any match.

## 4.1 Text standardisation
Alteryx **Data Cleansing** macro (`Cleanse.yxmc`) applied to names and keys:
- upper case;
- removal of accents, punctuation, hyphens and special characters;
- removal of leading, trailing and duplicate spaces.

## 4.2 Dates
All dates converted to `dd/MM/yyyy` (DateTime tool). Birth year is derived from the full date.

## 4.3 Municipalities
IBGE municipality codes are joined to an auxiliary table to obtain harmonised municipality names (residence and occurrence).

## 4.4 Period filter
Only events between **2010 and 2022** are kept (birth, death, notification, procedure or admission date, depending on the system).

## 4.5 Composite keys

| Key | Fields concatenated | Used in |
|---|---|---|
| Track 1 key | sex + birth year + **mother's name** + date of birth + municipality | PNTN, SINASC, SIM |
| Track 1 alternative key | sex + birth year + **child's name** + date of birth + municipality | PNTN, SINASC, SIM (final linkage) |
| Track 2 key | sex + birth year + **patient's name** + date of birth + municipality | SINAN, SIA, SIH |
| Track 2 second key | sex + birth year + **mother's name** + date of birth + municipality | SINAN, SIH |
| SIA second key | sex + birth year + **last 10 characters of patient's name** + date of birth + municipality | SIA (no mother's name available) |

## 4.6 Phonetic encoding
Inside the Fuzzy Match tool, keys are encoded with **Double Metaphone** (maximum key length 4, words considered separately, single-letter words ignored) to absorb spelling variants of Portuguese names.

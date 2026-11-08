🌐 **English** · [Português](8-Validacao.md)

# 8. Validation

Linked pairs were reviewed by **three validators** — members of the research team who work in the municipal and state health departments — each with expertise in the systems under review. The third validator reviewed the cross-track pairs, including all pairs involving the PNTN. All signed a confidentiality agreement (Data Linkage Validation Consent Form).

A random sample of 4% of the records of each track was drawn and its linked pairs were exported (Alteryx *Random % Sample*) with all identifying fields side by side, sorted by match score, for manual classification as true or false pairs.

## Results

| Segment | Systems reviewed | Pairs reviewed | True pairs | False pairs | PPV (95% CI)* |
|---|---|---|---|---|---|
| Validator 1 | SIM, SINASC, SINAN | 89 | 82 | 7 | 92.1% (84.6–96.1) |
| Validator 2 | SIA, SIH | 328 | 302 | 26 | 92.1% (88.6–94.5) |
| Validator 3 | Cross-track (final linkage) | 1,389 | 1,285 | 104 | 92.5% (91.0–93.8) |
| **Total** | | **1,806** | **1,669** | **137** | **92.4% (91.1–93.5)** |

\* Positive predictive value = true pairs / pairs reviewed; Wilson score interval.

Pairs judged false or implausible were removed from the consolidated base.

## Interpretation
PPV measures the proportion of **linked pairs that are correct** (precision). It does not measure how many true pairs the algorithm missed (sensitivity).

# =============================================================================
# AHP-based underreporting correction factor
# Sickle cell disease (SCD) epidemiological indicators - Bahia, Brazil, 2010-2022
#
# Reproduces the correction factor used to adjust SCD incidence and prevalence
# estimates for underreporting (Analytic Hierarchy Process, Saaty).
# Base R only - no packages required.
#
# Steps
#   1. Pairwise comparison matrix of the five underreporting indicators (Saaty scale)
#   2. Priority weights (column-normalised row means) + consistency ratio (CR)
#   3. Underreporting ratio per information system: (Expected - Observed) / Observed
#   4. Ratios converted to probabilities with the normal CDF
#   5. Correction factor F = sum(weight_k * mean probability_k)
#   6. Adjusted estimate = observed estimate * (1 + F)
# =============================================================================

# ---- 1. Pairwise comparison matrix --------------------------------------------
indicators <- c("Sampling", "Regional", "Temporal", "NewCases", "Procedures")

A <- matrix(c(
  1,   2,   3,   1/2, 1/3,
  1/2, 1,   2,   1/3, 1/4,
  1/3, 1/2, 1,   1/4, 1/5,
  2,   3,   4,   1,   1/2,
  3,   4,   5,   2,   1
), nrow = 5, byrow = TRUE, dimnames = list(indicators, indicators))

# ---- 2. Weights and consistency -------------------------------------------------
ahp_weights <- function(A) {
  rowMeans(sweep(A, 2, colSums(A), "/"))          # approximate (Saaty) method
}

ahp_consistency <- function(A) {
  n  <- nrow(A)
  RI <- c(0, 0, 0.58, 0.90, 1.12, 1.24, 1.32, 1.41, 1.45, 1.49)[n]  # Saaty random index
  lambda_max <- max(Re(eigen(A)$values))
  CI <- (lambda_max - n) / (n - 1)
  c(lambda_max = lambda_max, CI = CI, CR = CI / RI)
}

w  <- ahp_weights(A)
cr <- ahp_consistency(A)

# Principal-eigenvector weights, shown for comparison only
ev   <- Re(eigen(A)$vectors[, 1])
w_ev <- setNames(ev / sum(ev), indicators)

# ---- 3. Underreporting ratios per information system --------------------------
# ratio = (Expected - Observed) / Observed ; NA = indicator not applicable to the system
ratio <- function(expected, observed) (expected - observed) / observed

u <- list(
  Sampling   = c(SIM = 0,
                 PNTN  = ratio(3462, 2799),
                 SINAN = ratio(36228, 4802),
                 SIH   = ratio(14333, 695),
                 SIA   = ratio(36228, 4068)),
  Regional   = c(SIM = 0, PNTN = 0,
                 SINAN = ratio(401, 262),
                 SIH   = ratio(244, 82),
                 SIA   = ratio(401, 359)),
  Temporal   = c(SIM = 0, PNTN = 0,
                 SINAN = ratio(3019, 400),
                 SIH   = ratio(1353, 54),
                 SIA   = ratio(3019, 339)),
  NewCases   = c(PNTN = (4 + 82 + 4 + 540) / 2799),
  Procedures = c(SIA = ratio(0.9 * 36228, 4068))
)

# ---- 4. Normal-CDF transformation ----------------------------------------------
# reference = "sampling": every indicator is standardised with the mean and SD of
#                         the sampling indicator (specification used in the study)
# reference = "own":      each indicator uses its own mean and SD (sensitivity analysis)
indicator_probability <- function(u, reference = c("sampling", "own")) {
  reference <- match.arg(reference)
  ref_mean <- mean(u$Sampling)
  ref_sd   <- sd(u$Sampling)
  sapply(u, function(x) {
    if (reference == "own" && length(x) > 1) {
      mean(pnorm(x, mean(x), sd(x)))
    } else if (reference == "own") {
      0.5
    } else {
      mean(pnorm(x, ref_mean, ref_sd))
    }
  })
}

p <- indicator_probability(u, "sampling")

# ---- 5. Correction factor --------------------------------------------------------
F_corr <- sum(w[names(p)] * p)

# ---- 6. Apply to observed estimates ---------------------------------------------
adjust <- function(estimate, F = F_corr) estimate * (1 + F)

# ---- Report ---------------------------------------------------------------------
cat("\nAHP priority weights (approximate method):\n");  print(round(w, 4))
cat("\nAHP priority weights (principal eigenvector):\n"); print(round(w_ev, 4))
cat(sprintf("\nlambda_max = %.4f | CI = %.4f | CR = %.4f -> %s\n",
            cr["lambda_max"], cr["CI"], cr["CR"],
            ifelse(cr["CR"] < 0.10, "consistent (CR < 0.10)", "NOT consistent - revise judgements")))
cat("\nMean normal-CDF probability per indicator:\n"); print(round(p, 4))
cat(sprintf("\nCorrection factor F = %.4f\n", F_corr))
cat(sprintf("Hypothetical example: observed rate 100 per 100,000 -> adjusted %.2f per 100,000\n",
            adjust(100)))

# Sensitivity analysis: each indicator standardised by its own distribution
F_own <- sum(w * indicator_probability(u, "own"))
cat(sprintf("Sensitivity (own-indicator standardisation): F = %.4f\n", F_own))

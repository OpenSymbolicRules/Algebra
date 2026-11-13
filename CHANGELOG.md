# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- v1 artifacts refreshed from Verification report `0a34c711…` (the
  Integration audit grows to 171 rules; this rule set is unchanged).
- v1 artifacts refreshed from Verification report `9705f0ef…` (the
  Integration audit grows to 169 rules; this rule set is unchanged).
- v1 artifacts refreshed from Verification report `29465fa3…` (the
  Integration audit grows to 165 rules; this rule set is unchanged).
- v1 artifacts refreshed from Verification report `577cca61…` (the
  Integration audit grows to 156 rules; this rule set is unchanged).
- OSR v1 rule set and verification report in `v1/` (all 20 rules,
  proved in `OpenSymbolicRules/Lean`), copied from the published
  `OpenSymbolicRules/Verification` report, with a CI check of schema
  validity, source digest and byte identity (`scripts/check-v1.sh`).
- `justfile` entry points (`check`, `validate`, `closure`, `v1`, `update-v1`).
- CI validation that every operator used by a rule has a declared OpenMath
  semantic mapping.
- Safe inverse-power and unit-base simplifications.
- Order-preserving common-factor extraction for differences.
- Stable `identity` values for rule files, completing canonical `identity:id`
  rule identifiers.
- Conditional inverse rule for the exponential and principal natural logarithm,
  with an OpenMath declaration and Fungrim-derived fixture.
- `factor_polynomials` profile with order-preserving common-left and
  common-right factor rules.
- Machine-readable provenance for every rule.
- Initial structure for the Algebra module
- Submodule link to OSR Specification schemas
- OpenMath-semantics fixtures for logarithm and polynomial-distribution rules.
- GitHub Actions validation of schemas, rules, and test fixtures.
- Additive and multiplicative identity simplification rules.
- MIT licensing, an OpenMath attribution notice, and SPDX metadata in the rule manifest.

### Changed
- Refresh the generated OSR v1 files from Lean source digest `dcad68f4…`
  (the calculus rewriter decides closed conditions; this rule set is
  unchanged).
- Refresh the generated OSR v1 files from Lean source digest `a8eff8f4…`
  (Integration rules with residual integrals; this set is unchanged).
- Refresh the generated OSR v1 files from Lean source digest `be6f672a…`
  (Integration rules with conditions; this set is unchanged).
- Refresh the generated OSR v1 files from Lean source digest `68dfb6f0…`,
  which adds the Integration rule set; rule statements and certification
  counts of this set are unchanged.
- Refresh the generated OSR v1 files from Lean source digest `4032322e…`
  after the structural Calculus premise audit; rule statements and
  certification counts are unchanged.
- Updated the Specification submodule to the OSR v1 draft.
- Restrict product-of-powers merging to integer exponents, preventing an
  invalid rewrite for principal complex powers.
- Normalized arithmetic operators, wildcards, and constraints to OSR v0.1 conventions.
- Declared every mathematical operator with its OpenMath Content Dictionary symbol.

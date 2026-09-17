# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Stable `identity` values for rule files, completing canonical `identity:id`
  rule identifiers.
- Conditional inverse rule for the exponential and principal natural logarithm,
  with an OpenMath declaration and Fungrim-derived fixture.
- Initial structure for the Algebra module
- Submodule link to OSR Specification schemas
- OpenMath-semantics fixtures for logarithm and polynomial-distribution rules.
- GitHub Actions validation of schemas, rules, and test fixtures.
- Additive and multiplicative identity simplification rules.
- MIT licensing, an OpenMath attribution notice, and SPDX metadata in the rule manifest.

### Changed
- Normalized arithmetic operators, wildcards, and constraints to OSR v0.1 conventions.
- Declared every mathematical operator with its OpenMath Content Dictionary symbol.

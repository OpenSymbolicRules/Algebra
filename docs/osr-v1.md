# OSR v1 files

`v1/` holds the Algebra rule set in the OSR v1 interchange format
(Specification, `docs/osr-v1.md`).  These files are generated, never edited
by hand:

| File | Content |
|---|---|
| `v1/algebra.osr.json` | The 16 migrated rules: OpenMath patterns, conditions, profiles, and per-domain verification records (Lean theorem, status, assurance). |
| `v1/algebra.report.json` | Machine-readable audit: metrics per domain, the rules not migrated, and the termination proof of every profile. |
| `v1/algebra.report.md` | The same audit for humans. |

## Where they come from

1. `OpenSymbolicRules/Lean` states each rule and proves it with Mathlib, over
   ℝ and ℂ (`OSR/Algebra.lean`).  `scripts/Export.lean` writes the files
   above.
2. `OpenSymbolicRules/Verification` publishes the export under
   `reports/<source digest>/` and can rebuild it independently
   (`scripts/recheck.sh`).
3. This repository copies the published files.  The CI checks that they
   validate against the v1 schema, share one source digest, and are
   byte-identical to the published report.

## Differences from v0.1

The v0.1 files in `rules/` remain for the v0.1 loader of OpenSymbolicRules.jl
and will be removed in a later breaking release.  In v1:

- 16 of the 20 rules are migrated and proved: 16 over ℝ, 15 over ℂ.
  `ln(a b) = ln a + ln b` is stated over ℝ only, because its conditions
  `a > 0` and `b > 0` have no complex meaning;
- 4 rules are not migrated, because they use symbolic exponents that the v1
  fragment does not represent: `(x^p)^q`, `x^p x^q`, `1^x` and `log(a^b)`.
  The report lists them with the reason;
- `exp(ln z) = z` keeps the v0.1 condition `z ≠ 0`.  Over ℝ it holds only
  because `ln z` is defined for `z > 0` alone: engines must not apply it to a
  negative real `z`;
- the two profiles `default` (simplification and expansion) and
  `factor_polynomials` are proved to terminate under the reference strategy
  (Lean `OSR.Algebra.default_terminates`, `OSR.Algebra.factor_terminates`);
- the reference engine applies unconditional rules only; `x^0 = 1`,
  `x^(-1) = 1/x`, `ln(a b)` and `exp(ln z)` are carried with their conditions for engines
  that can decide them.

## Updating

```bash
just update-v1 <Verification>/reports/<digest>
```

Then update the Verification commit pinned in
`.github/workflows/validate-schemas.yml`.

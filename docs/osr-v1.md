# OSR v1 files

`v1/` holds the Algebra rule set in the OSR v1 interchange format
(Specification, `docs/osr-v1.md`).  These files are generated, never edited
by hand:

| File | Content |
|---|---|
| `v1/algebra.osr.json` | The 20 rules: OpenMath patterns, conditions, profiles, and per-domain verification records (Lean theorem, status, assurance). |
| `v1/algebra.report.json` | Machine-readable audit: metrics per domain and the termination proof of every profile. |
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

- all 20 rules are migrated and proved: 20 over ℝ, 18 over ℂ.
  `ln(a b) = ln a + ln b` and `ln(a^b) = b ln a` are stated over ℝ only,
  because their positivity conditions have no complex meaning;
- `IntegerQ p` becomes the condition `p ∈ ℤ` (`set1#in` with `setname1#Z`);
- powers (`arith1#power`) are interpreted for integer exponents only, so
  `1^x = 1` and `ln(a^b) = b ln a` are certified where the exponent is an
  integer;
- `exp(ln z) = z` keeps the v0.1 condition `z ≠ 0`.  Over ℝ it holds only
  because `ln z` is defined for `z > 0` alone: engines must not apply it to a
  negative real `z`;
- the two profiles `default` (simplification and expansion) and
  `factor_polynomials` are proved to terminate under the reference strategy
  (Lean `OSR.Algebra.default_terminates`, `OSR.Algebra.factor_terminates`);
- the reference engine applies unconditional rules only; the power rules
  with conditions, `ln(a b)`, `ln(a^b)` and `exp(ln z)` are carried with their conditions for engines
  that can decide them.

## Updating

```bash
just update-v1 <Verification>/reports/<digest>
```

Then update the Verification commit pinned in
`.github/workflows/validate-schemas.yml`.

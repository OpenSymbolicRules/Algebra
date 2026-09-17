# Exponent domain safety

OpenMath `arith1#power` can denote principal complex powers. Therefore the
identity `x^p x^q = x^(p + q)` is loaded only when both exponents are proven
integers; without that restriction it is not generally valid on principal
branches.

The profile also includes `x^(-1) = 1 / x` under `NonzeroQ(x)` and the safe
unit-base identity `1^x = 1`.

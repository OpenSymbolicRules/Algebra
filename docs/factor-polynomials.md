# Polynomial factorisation profile

The default algebra manifest contains distributive expansion. Its inverse must
not be loaded in the same unrestricted rewrite profile because the pair can
oscillate indefinitely.

`factor_polynomials` therefore selects only common-factor extraction and
identity simplifications. It includes both order-sensitive forms:

- `a b + a c → a (b + c)`;
- `b a + c a → (b + c) a`.

Neither rule exchanges factors, so both remain valid when multiplication is
not commutative.

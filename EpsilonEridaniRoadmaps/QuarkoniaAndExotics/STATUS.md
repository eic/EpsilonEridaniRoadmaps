<!--epsiloneridani-status:v1 {"roadmap":"QuarkoniaAndExotics","to_sha":"a9971beba03fd56a12966d8ff45879817ec47288","ts":"2026-11-26T13:26:20+00:00"}-->
<!--epsiloneridani-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"NRQCD bilinear basis and exhaustiveness, conditional existence and regulator independence of matching, RG flow, potential NRQCD","state":"partial"},{"id":"Layer 1","remaining":"state-space tensor product, spin decomposition, P and C derived from bilinears, bound-state spectrum, spin-dependent corrections, wave function at origin","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"1027be54523a2855d9d5ab19b23407a1d561a997594ac14efa4dbe0cf0d5ec70","roadmap":"QuarkoniaAndExotics","to_sha":"a9971beba03fd56a12966d8ff45879817ec47288"}-->
# Status: QuarkoniaAndExotics

This file documents the status of the QuarkoniaAndExotics roadmap up until `a9971be` (2026-11-26T13:26:20+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/eic/EpsilonEridaniProgress for what that means.

## Where this roadmap stands

**At a glance.** The effective-theory skeleton of Layer 0 is in place: the scale hierarchy, a velocity power counting with finite truncations, and a matching condition whose coefficients are proved unique under a rank condition. The NRQCD Lagrangian, the renormalisation-group flow and potential NRQCD are not. Layer 1 has its colour decomposition and the `J^{PC}` classification, but no spin decomposition or spectrum. Nothing has landed for production, polarisation, amplitude analysis or exotics (Layers 2–5).

### Named results

- **Uniqueness of the matching coefficients** — two coefficient assignments that reproduce the same full-theory amplitudes through a given total degree agree on every retained operator exactly when the matching matrix has full column rank at each degree, so the README's sufficient condition is also shown necessary ([`IsMatching.forall_eqOn_truncation_iff`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/Matching.html#EpsilonEridani.QFT.Quarkonium.PowerCounting.IsMatching.forall_eqOn_truncation_iff)).
- **Finiteness of each truncation** — if every bilinear is velocity- or `1/m`-suppressed and each total degree is reached by finitely many bilinears, only finitely many composite operators have total degree at most `n`, and these hypotheses are also necessary ([`finite_totalDegree_compositeDeg_le`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/PowerCounting.html#EpsilonEridani.QFT.Quarkonium.finite_totalDegree_compositeDeg_le), [`finite_totalDegree_compositeDeg_le_iff`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/PowerCounting.html#EpsilonEridani.QFT.Quarkonium.finite_totalDegree_compositeDeg_le_iff)).
- **The singlet–octet decomposition** — the colour space of a quark-antiquark pair splits into singlet and octet channels by complete orthogonal idempotents built from the `su(N)` generators, with traces `1` and `N² − 1` and the Casimir equal to `N` times the octet projector ([`completeOrthogonalIdempotents_colorSingletProj_colorOctetProj`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/ColorDecomposition.html#EpsilonEridani.QFT.Quarkonium.completeOrthogonalIdempotents_colorSingletProj_colorOctetProj), [`casimir_genM_eq`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/ColorDecomposition.html#EpsilonEridani.QFT.Quarkonium.casimir_genM_eq)).
- **The exotic `J^{PC}` list** — the assignments with `J ≤ 3` that no quark-antiquark pair reaches are exactly `0^{−−}`, `0^{+−}`, `1^{−+}`, `2^{+−}`, `3^{−+}`, derived from a decidable closed-form attainability predicate ([`not_qqbarAttainable_and_J_le_three_iff`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/QuantumNumbers.html#EpsilonEridani.QFT.Quarkonium.QuantumNumbers.not_qqbarAttainable_and_J_le_three_iff)).
- **Coulombic scaling is an assumption** — for any mass, relative momentum and constant `K`, some binding energy obeying `0 < E < p < m` violates `E ~ m v²`, so the scaling must be carried as a hypothesis ([`exists_not_coulombicScaling`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/Scales.html#EpsilonEridani.QFT.Quarkonium.HeavyQuarkScales.exists_not_coulombicScaling)).

### Notable definitions and infrastructure

- **The heavy-quark scales** ([`HeavyQuarkScales`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/Scales.html#EpsilonEridani.QFT.Quarkonium.HeavyQuarkScales)) record `m`, `p`, `E`, `Λ` with their ordering, so the weakly and strongly coupled regimes are named propositions a theorem can assume.
- **A velocity power counting** ([`PowerCounting`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/PowerCounting.html#EpsilonEridani.QFT.Quarkonium.PowerCounting)) is declared data on a family of bilinears, as Convention 2 asks; it is general, not tied to a specific NRQCD basis, and every later truncation can cite its finiteness theorem.
- **Approximation to a given order** ([`ApproximatesToOrder`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/Analysis/Asymptotics/ApproximatesToOrder.html#EpsilonEridani.ApproximatesToOrder)) packages an `O(λ^n)` remainder with uniqueness of correction coefficients; the [matching condition](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Quarkonium/NRQCD/Matching.html#EpsilonEridani.QFT.Quarkonium.PowerCounting.IsMatching) is stated through it, and the TMD power-correction code shares it.

### Roadmap coverage

Layer 0 is partial: 0.1 and 0.2 are done, and 0.4 has its definition and uniqueness theorem but neither conditional existence nor regulator independence; 0.3 (the bilinear basis and its exhaustiveness), 0.5 (renormalisation-group flow), 0.6 (potential NRQCD) and the worked examples are untouched. Layer 1 is partial: 1.2 is done, and 1.4 is done except that parity and charge conjugation are defined by the formulas `(−1)^(L+1)` and `(−1)^(L+S)` rather than derived from the bilinears; 1.1, 1.3, 1.5, 1.6 and 1.7 are untouched. Layers 2, 3, 4 and 5 are untouched.

## The frontier

- **Spin decomposition (1.3)** — singlet and triplet projectors on `2 ⊗ 2` from TauCeti's Clebsch-Gordan decomposition, with total-spin Casimir values `0` and `2`; together with 1.2 this gives the four colour-spin channels that index every sum in Layer 2.
- **Exotic quantum numbers (5.2)** — define quantum-number exoticity as failure of the existing attainability predicate, which is already decidable; what remains is flavour exoticity and the two examples showing the notions independent.
- **The NRQCD bilinear basis (0.3) and the Layer 0 examples** — the graded basis needs the notion of equivalence under graded field redefinitions before exhaustiveness can be stated; tree-level matching of the electromagnetic current would be the first discharge of the uniqueness theorem.
- **Renormalisation-group flow (0.5)** — the coefficient flow as a semigroup via `TauCeti.Analysis.Semigroups`, and triangular mixing with respect to the grading.
- **The bound-state spectrum (1.5)** — discreteness from a compact resolvent and the variational bound; this needs a self-adjoint radial Hamiltonian, of which nothing exists yet.

<!--epsiloneridani-status:v1 {"roadmap":"MesonStructure","to_sha":"2850fc345081721cfab1cb25d26f69467b9e9e02","ts":"2026-11-15T00:39:57+00:00"}-->
<!--epsiloneridani-coverage:v1 {"layers":[{"id":"Layer 0","state":"untouched"},{"id":"Layer 1","remaining":"neutral pion; meson valence sum rules; isospin, charge-conjugation and SU(3) density relations; evolution and large-x statements (1.2-1.7)","state":"partial"},{"id":"Layer 2","remaining":"Gegenbauer moments, weighted isometry and completeness; the amplitude (2.1); ERBL semigroup and diagonalisation (2.3-2.6)","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"b23908ebb419b4e4a1f5e4314589a2227e97f97c8e0c156097a1bbf154c0ebf9","roadmap":"MesonStructure","to_sha":"2850fc345081721cfab1cb25d26f69467b9e9e02"}-->
# Status: MesonStructure

This file documents the status of the MesonStructure roadmap up until `2850fc3` (2026-11-15T00:39:57+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/eic/EpsilonEridaniProgress for what that means.

## Where this roadmap stands

**At a glance.** The first foundations are in place for two layers. In Layer 2, the Gegenbauer polynomials of index 3/2 now have their recurrence, weight measure and orthogonality with squared norms. In Layer 1, the pseudoscalar meson and the flavour-breaking parameters exist as data. No layer is complete. Nothing has landed for the spin-zero hadronic tensor, the form factors, the chiral relations or the Sullivan process.

### Named results

- **Orthogonality of the Gegenbauer polynomials of index 3/2.** Against the weight 1 − x² on [−1, 1], distinct polynomials are orthogonal and the n-th has squared norm 2(n+1)(n+2)/(2n+3). The norm is stated as a rational expression rather than a ratio of Gamma functions ([`integral_gegenbauerThreeHalves_mul_gegenbauerThreeHalves`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/Gegenbauer/Measure.html#EpsilonEridani.integral_gegenbauerThreeHalves_mul_gegenbauerThreeHalves)).
- **The Gegenbauer differential equation of index 3/2.** (1 − x²)C″ = 4xC′ − n(n+3)C, also in Sturm–Liouville form. The eigenvalue n(n+3) is what the ERBL diagonalisation of 2.4 will be read against ([`one_sub_X_sq_mul_derivative_derivative_gegenbauerThreeHalves`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/Gegenbauer/Basic.html#EpsilonEridani.one_sub_X_sq_mul_derivative_derivative_gegenbauerThreeHalves)).
- **Symmetry of Sturm–Liouville operators on polynomials.** The operator p ↦ (wp′)′ is symmetric under integration on [a, b] whenever w vanishes at both endpoints. This general lemma is what the orthogonality proof rests on ([`Polynomial.integral_derivative_mul_derivative_mul_comm`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/Calculus/Polynomial.html#Polynomial.integral_derivative_mul_derivative_mul_comm)).
- **The isospin limit is strictly weaker than the SU(3) limit.** Degenerate up and down masses with a heavier strange quark satisfy the first limit but not the second ([`FlavorBreaking.exists_isIsospinLimit_not_isSU3Limit`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Meson/Basic.html#EpsilonEridani.Particles.Meson.FlavorBreaking.exists_isIsospinLimit_not_isSU3Limit)).
- **Charge conjugation negates valence numbers.** For a generic parton density, conjugation flips the sign of the net quark number of every flavour. A conjugation-invariant density therefore carries no valence quarks ([`PDF.valenceNumber_chargeConj`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Parton/PDF/ChargeConjugation.html#EpsilonEridani.Particles.Parton.PDF.valenceNumber_chargeConj)).

### Notable definitions and infrastructure

- **The pseudoscalar meson as data.** A meson is a mass, a decay constant in a fixed axial-current convention, a charge and a valence pair. Charge conjugation and net valence numbers are defined on it, and the charged pions and kaons are given Particle Data Group values. ([`PseudoscalarMeson`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Meson/Basic.html#EpsilonEridani.Particles.Meson.PseudoscalarMeson)).
- **Flavour breaking as an explicit parameter.** The breaking data are the mass differences m_d − m_u and m_s − (m_u + m_d)/2, so the isospin and SU(3) limits are propositions that these vanish. The flavour relations of 1.3 and 1.4 will take one of these propositions as a hypothesis ([`FlavorBreaking`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Meson/Basic.html#EpsilonEridani.Particles.Meson.FlavorBreaking)).
- **Charge conjugation of parton densities.** Parton species now come with a conjugation that swaps quark and antiquark. The induced map on densities preserves the density assumptions, the sum-rule bundle and the summed moments ([`PDF.chargeConj`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Parton/PDF/ChargeConjugation.html#EpsilonEridani.Particles.Parton.PDF.chargeConj)).

### Roadmap coverage

Layer 2 is partial. Of the milestones in 2.2, the recurrence, leading coefficient and parity (1), the finite weight measure (2) and orthogonality with squared norms (3) are done. The moments (4), the weighted isometry onto ℓ² (5), completeness (6) and the change of variable to the unit interval all remain. The amplitude itself (2.1), the ERBL kernel and its semigroup (2.3–2.4), the identification with the GPD kernel (2.5) and higher twist (2.6) have not started. Layer 1 is partial. Most of 1.1 is done, but the neutral pion is missing. Valence-number and conjugation machinery exists for generic densities, but no meson-specific sum rule, isospin relation, SU(3) relation, evolution statement or large-x statement (1.2–1.7) has landed. Layers 0, 3, 4, 5 and 6 are untouched.

## The frontier

- **Gegenbauer moments and the weighted isometry.** Milestones 4 and 5 of 2.2 are next: the moments against 1 − x², and the isometry from the weighted L² space onto ℓ². Orthogonality and the finite measure are already in place for both.
- **Completeness of the Gegenbauer family.** Milestone 6 of 2.2 is to prove the family is a Hilbert basis by polynomial density in the weighted space. The README flags this as the hardest result in the layer, since the Chebyshev route through Fourier series has no index-3/2 analogue.
- **The neutral pion and the pion density relations.** Define π⁰ to finish 1.1. Then state the 1.3 relations. The π⁻ relation follows from the existing density conjugation and pion conjugation. The isospin and π⁰ relations need the isospin hypothesis, and the converse of the first relation is also a milestone.
- **Meson valence sum rules.** For 1.2, connect the meson's net valence numbers to the density valence numbers under the upstream sum-rule bundle, and prove that this fixes the valence normalisation uniquely.
- **The spin-zero hadronic tensor.** Layer 0 has not started. Its central result, that parity kills the antisymmetric part, needs upstream Levi-Civita contractions, not anything built here.

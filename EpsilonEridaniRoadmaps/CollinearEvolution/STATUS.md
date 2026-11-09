<!--epsiloneridani-status:v1 {"roadmap":"CollinearEvolution","to_sha":"f8d9db760d4639c3753a44e20ecdb794fd745b3c","ts":"2026-11-02T21:25:52+00:00"}-->
<!--epsiloneridani-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"convolution associativity and delta unit, normal-form uniqueness, Mellin injectivity and inversion, higher-weight sums and polylogarithms","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"33b6af7827fda0247c85611a3152bafd07136fc101c89d752cced784a4cf4455","roadmap":"CollinearEvolution","to_sha":"f8d9db760d4639c3753a44e20ecdb794fd745b3c"}-->
# Status: CollinearEvolution

This file documents the status of the CollinearEvolution roadmap up until `f8d9db7` (2026-11-02T21:25:52+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/eic/EpsilonEridaniProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the pure-mathematics foundation, is partly built. Harmonic sums with their quasi-shuffle algebra and the continuation of S₁ are in place, as are a Mellin convolution on the interval with its moment-product theorem and the plus distributions with their harmonic-number moments. Nothing has yet landed for the splitting kernels, the running coupling, the semigroup formulation of DGLAP, or the scheme and two-loop layers.

### Named results

- **The quasi-shuffle relation for nested harmonic sums.** The product of two nested sums S_m(N)·S_m′(N) equals the evaluated quasi-shuffle product of the multi-indices, alternating indices included. The roadmap's check S₁² = 2S₁,₁ − S₂ follows as a corollary for every N ([`harmonicSum_mul_harmonicSum`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/HarmonicSum/QuasiShuffle.html#EpsilonEridani.harmonicSum_mul_harmonicSum)).
- **The pole structure of the continued harmonic sum.** S₁(s) = ψ(s+1) + γ is meromorphic on ℂ with a simple pole of residue −1 at each negative integer. It also satisfies the recurrence and the reflection formula S₁(−s) = S₁(s−1) + π cot(πs) ([`tendsto_mul_complexHarmonic_neg_nat_succ`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/HarmonicSum/Continuation.html#EpsilonEridani.tendsto_mul_complexHarmonic_neg_nat_succ)).
- **The convolution theorem on the interval.** The moment of a Mellin convolution is the product of the moments. It holds under the hypotheses of the convolution theorem already proved for the collinear convolution, to which this result reduces ([`mellinDis_mellinConv`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Factorization/Convolution/Algebra.html#EpsilonEridani.QFT.Factorization.Convolution.mellinDis_mellinConv)).
- **No unit among functions.** No function e satisfies e ⊗ 1 = 1 almost everywhere on (0,1], so δ(1−x) really is needed as the identity ([`not_mellinConv_indicator_one_ae_eq`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Factorization/Convolution/Algebra.html#EpsilonEridani.QFT.Factorization.Convolution.not_mellinConv_indicator_one_ae_eq)).
- **The moments of [1/(1−z)]₊ are harmonic numbers.** Pairing with zⁿ gives −Hₙ. This is the bridge from plus distributions to harmonic sums, and together with the vanishing on constants it completes the roadmap's first acceptance example ([`plusOneMinus_pow`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/Distribution/PlusFunctional.html#EpsilonEridani.plusOneMinus_pow)).

### Notable definitions and infrastructure

- **Nested harmonic sums** ([`harmonicSum`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/HarmonicSum/Basic.html#EpsilonEridani.harmonicSum)) are defined for arbitrary integer multi-indices with weight as a grading. This general form is what every kernel moment will be reduced to, and second-order large-N asymptotics are already proved for S₁ and for digamma along the integers.
- **The plus functional** ([`plusFunctional`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/Distribution/PlusFunctional.html#EpsilonEridani.plusFunctional)) is the functional attached to a kernel singular at z = 1. It comes with a convergence theorem and the multiplication identity that moves a smooth factor onto its value at 1, which is what Layer 1 will use to put kernels into normal form.
- **The Mellin convolution on (0,1]** ([`mellinConv`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Factorization/Convolution/Algebra.html#EpsilonEridani.QFT.Factorization.Convolution.mellinConv)) is extended by zero and comes with bilinearity, commutativity, support and positivity preservation, the positivity statement being the one other roadmaps will cite.

### Roadmap coverage

Layer 0 is partial. Sections 0.2, 0.3 and 0.5 have substantial content. Missing from 0.2 are associativity and the unit δ(1−x). In 0.3 the plus distributions have their convergence theorem only for test functions that are Lipschitz at 1, and they lack the log^k(1−z) family and the uniqueness of the normal form. From 0.4 only the convolution theorem has landed: holomorphy in the strip, injectivity, inversion and the compactness statement are open. Section 0.5 lacks the uniqueness of the continuation, higher-weight sums and their asymptotics, and the polylogarithms. Nothing has been established for the weighted spaces and endpoint behaviours of 0.1. Layers 1 through 5 are untouched by this roadmap's own work. The README records pre-existing base modules for them, such as the one-loop beta coefficient, which this report has not assessed against the milestones.

## The frontier

- **Associativity and the unit of the convolution algebra.** The remaining items are associativity via Tonelli on the ordered simplex, then δ(1−x) as the identity once distributions are adjoined. The no-unit half of acceptance example 3 is already done.
- **Normal form of a distribution.** This needs the du Bois-Reymond uniqueness statement on [0,1] and the log^k(1−z) plus distributions. It must be in place before acceptance example 5 and the Layer 1 kernels can be stated.
- **Mellin transform on the interval.** What remains is holomorphy in the strip, injectivity on a vertical line, and contour inversion. Inversion depends on the continuation of the harmonic sums, which now exists at weight one only.
- **Higher-weight harmonic sums.** The remaining work is to continue them through polygamma functions or an integral representation, prove that the continuation is unique, and give their large-N asymptotics. Polylogarithms are needed later, for Layer 5.4.
- **Leading-order kernels (Layer 1).** These can start in parallel once the normal form is available. Their moments then reduce to the harmonic-sum and plus-distribution results above.

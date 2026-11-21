# Roadmap: Feynman graphs and Feynman integrals: parametric representations, convergence, and dimensional regularisation

A Feynman integral is an integral attached to a finite multigraph. This roadmap builds the graph,
the integral, and the theorems that say when the integral exists, what it equals in parametric
form, how it continues in the space-time dimension, and what its boundary values and
discontinuities are in Minkowski signature. It is the lowest rung of the perturbative programme:
everything in it is a statement about finite graphs, polynomials, and Lebesgue integrals of
explicit functions, and every later statement about renormalisation, infrared structure or
factorisation is a statement about the objects defined here.

The development runs in one direction. First the combinatorics: a Feynman graph as a finite
multigraph with external legs, over Mathlib's `Graph`, with deletion, contraction, connectedness,
one-particle irreducibility, the cycle rank, spanning trees and spanning two-forests, and the
linear algebra of momentum routing. Then the two Symanzik polynomials, defined by spanning trees
and two-forests and identified with determinants by a weighted matrix-tree theorem for
multigraphs. Then the scalar Feynman integral in Euclidean signature at integer dimension, with
its Schwinger and Feynman parametrisations proved equal to the momentum-space integral. Then
power counting: the superficial degree of divergence, Hepp sectors, and Weinberg's convergence
theorem. Then dimensional regularisation, not as a list of axioms but as a theorem: the
parametric integral is holomorphic in the dimension on its convergence domain and has a unique
meromorphic continuation, whose pole positions are computed and whose algebraic properties —
translation invariance, scaling, the vanishing of scaleless integrals, integration-by-parts
identities — are proved. Then Minkowski signature: the `iε` prescription, Wick rotation,
analyticity in the external invariants, and boundary values as tempered distributions. Then the
Feynman rules, connecting graphs to the Wick theorem of Physlib and fixing the scalar, QED and QCD
rules. Finally cut graphs: the largest-time equation, the Cutkosky rules, and the cut-graph sums
on which every later cancellation argument rests.

The pinned libraries already carry a shape for some of this. `EpsilonEridani` records a one-loop
integral as a Laurent expansion at `ε = 0` with a pole coefficient, a finite part and a remainder
(`LaurentExpansionAtZero`, `ScalarMasterIntegral`), with the coefficient supplied by the caller;
it records a diagram topology as lists of node and edge kinds with a natural-number symmetry
factor (`TopologyGraph`); and it defines `+iε` propagator denominators with their conjugation
symmetry. What is absent is the integral itself. This roadmap supplies it and proves that the
records are what they are named after: the pole coefficient of `masslessBubble` is the residue of
an actual integral, the symmetry factor of a `TopologyGraph` is the order of an automorphism
group, and the `ε → 0⁺` limit of a product of `regularizedDenominator`s exists as a distribution.

The application the roadmap is built towards is a library in which "the Feynman integral of the
graph `G` in dimension `d`" is a term, its convergence is a decidable combinatorial condition on
subgraphs, its dimensionally regularised value is a meromorphic function with a proof, and its
discontinuity is a sum over cuts. `Renormalization` subtracts the divergences of these integrals;
`InfraredStructure` classifies their singularities at the pinch surfaces; `FactorizationTheorems`
proves statements about sums of them to all orders. None of those can be stated until the
integrals are objects.

## Scope

Included:

- Feynman graphs: finite multigraphs over Mathlib's `Graph α β` with a separate type of external
  legs; vertex degree; walks, connectedness and components; edge deletion and contraction; the
  cycle rank; spanning trees and spanning `k`-forests with their equivalent characterisations;
  the cycle matroid of a multigraph as a `Matroid`; bridges, one-particle irreducibility and the
  decomposition into one-particle-irreducible blocks; automorphisms and the symmetry factor.
- The signed incidence matrix, the cycle and cut spaces, fundamental cycles, and momentum routing:
  momentum conservation as a linear system, its solvability, its solution space, and the
  unimodularity of a change of loop-momentum basis.
- The first and second Symanzik polynomials as multivariate polynomials: their spanning-tree and
  two-forest definitions, the weighted matrix-tree theorem for multigraphs, the determinant and
  Schur-complement forms, homogeneity, deletion–contraction, matroid duality, and the
  factorisation of the leading terms under a rescaling of the parameters of a subgraph.
- The scalar Feynman integral in Euclidean signature at natural-number dimension with real
  positive propagator powers; its independence of routing; the Schwinger representation; the
  Feynman-parameter representation on the standard simplex with the Cheng–Wu freedom; tensor
  numerators and their reduction to scalar integrals.
- Ultraviolet power counting: the superficial degree of divergence, Hepp sectors, Weinberg's
  theorem as a necessary and sufficient condition for absolute convergence of a massive Euclidean
  integral, and the convergence criterion for massless propagators at non-exceptional momenta.
- Dimensional regularisation: the integral as a function of a complex dimension, holomorphy on
  the convergence domain, meromorphic continuation with pole locations and a bound on pole
  orders, the Laurent expansion at an integer dimension and its relation to the existing
  `LaurentExpansionAtZero` records, the algebraic properties usually taken as axioms, the
  integration-by-parts and dimension-shift identities, and the closed forms of the one-loop
  tadpole and bubble.
- Minkowski signature: a regulated integrand whose integral converges absolutely, Wick rotation,
  the Minkowski parametric representation, holomorphy in the complexified external invariants
  below the lowest normal threshold, and the `ε → 0⁺` boundary value as a tempered distribution.
- Feynman rules: a perturbative theory as data, the passage from Physlib's Wick contractions to
  labelled graphs with the symmetry-factor theorem, the exponential and Legendre relations among
  all, connected and one-particle-irreducible graph sums, and the scalar, QED and QCD rules with
  their numerator and colour algebra.
- Cut graphs: admissible cuts, the largest-time equation, the Cutkosky rules, perturbative
  unitarity for graph sums, and cut-graph sums with a measurement function.

Not included. The subtraction of ultraviolet divergences — forests, the R-operation, counterterms,
schemes, the renormalisation group, composite operators, the Slavnov–Taylor identities and the
operator product expansion — is `Renormalization`; this roadmap proves where the poles are and
`Renormalization` removes them. Singularities of an integral as a function of its external
invariants beyond the lowest normal threshold — the Landau equations, pinch surfaces, reduced
graphs, infrared power counting at a pinch surface, and the cancellation of infrared divergences
in sums over cuts — are `InfraredStructure`; this roadmap supplies the parametric representation
and the cut-graph sums those arguments are about. Factorisation statements for cross sections are
`FactorizationTheorems`. The Lorentz-invariant phase-space measure over which a cut graph is
integrated is `EventGeneration` Layer 0.3, cited and not rebuilt. The one-loop QCD beta-function
pipeline in `EpsilonEridani.QFT.QCD` — counterterm weights, the pole-to-beta-function bridge and
the Casimir derivations — stays where it is; this roadmap proves the pole coefficients it consumes
and changes none of its statements. The construction of an interacting quantum field, the
convergence or Borel summability of the perturbation series, and the
Lehmann–Symanzik–Zimmermann reduction as a theorem about operators on a Hilbert space are not
roadmap subjects in this collection: an amplitude here is a formal power series in the coupling
whose coefficients are finite sums of Feynman integrals. Algorithms for reducing a family of
integrals to master integrals, and numerical evaluation of integrals, are not roadmap subjects:
the integration-by-parts identities are theorems of Layer 4, a reduction is a certified linear
relation among dimensionally regularised integrals, and how such a relation is found is not
specified here.

The material belongs in `EpsilonEridani/QFT/PerturbationTheory/FeynmanIntegrals/`, alongside the
existing `EpsilonEridani/QFT/PerturbationTheory/FeynmanDiagrams/` and
`.../DimensionalRegularization/`, which it imports and whose records it gives values to. The
graph theory that is not specific to physics — connectedness, contraction, the cycle matroid and
the matrix-tree theorem for Mathlib's `Graph` — belongs in `EpsilonEridani/Mathematics/Graph/`,
written in the shape Mathlib would want.

## Conventions and coordination with upstream

1. A graph is a term of Mathlib's `Graph α β`: a vertex set, an edge set and the predicate
   `IsLink e x y`, with subgraphs as terms of the same type ordered by `≤`. A Feynman graph is
   that term together with finiteness of both sets and additional data. No second graph type is
   introduced, and no statement about subgraphs uses a subtype of vertices. The trap this avoids
   is a private graph theory that cannot use `Graph.deleteEdges`, `Graph.IsBridge` or the
   subgraph order, and that has to reprove each of them.
2. External legs are not edges. They are elements of a separate finite type with an attachment
   map to vertices, and they carry the external momenta. The trap this avoids is a graph in which
   an external line is an edge to a univalent vertex: such an edge is a bridge, so no graph with
   external lines would be one-particle irreducible, and the edge would carry a Schwinger
   parameter and appear in the Symanzik polynomials.
3. An orientation of the edges is auxiliary data chosen to write the incidence matrix and the
   momentum-conservation equations. Every quantity that survives into Layer 1 or later — the
   cycle rank, the Symanzik polynomials, the integral — is proved independent of it. The trap
   this avoids is a definition that silently depends on the orientation and a theorem that is
   then false for the reversed one.
4. The number of independent loops is the cycle rank `|E| − |V| + c`, with Lean name
   `loopNumber`. The word "loop" in Mathlib's `Graph` API (`IsLoopAt`, `loopSet`) means an edge
   with equal ends; in prose that is a *self-loop* here. The trap this avoids is a theorem about
   "one-loop graphs" being read as a theorem about graphs with one self-loop.
5. The Symanzik polynomials have Lean names `symanzikU` and `symanzikF`, are elements of
   `MvPolynomial` in the edge variables, and `symanzikF` includes the mass term: `F = F₀ + U ·
   Σ_e m_e² α_e`, with `F₀` the two-forest sum. In Euclidean signature `F₀` has non-negative
   coefficients; the Minkowski polynomial is obtained by the substitution of Convention 6 and is a
   different term with its own name `symanzikFMink`. The trap this avoids is a sign error in `F`
   that is invisible in a formula and reverses the direction of every analytic continuation.
6. Euclidean signature is primary. Minkowski vectors are Physlib's `Lorentz.Vector 3` with the
   product `⟪p, q⟫ₘ` of signature `(+, −, −, −)`, as already used by
   `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.minkowskiSquare`, and a Euclidean square
   `p_E²` corresponds to `−⟪p, p⟫ₘ`. The trap this avoids is a Wick-rotation statement in which
   the two sides use different sign conventions for the same invariant.
7. The loop measure is `d^d k / π^{d/2}` per loop in Euclidean signature and `d^d k / (i π^{d/2})`
   per loop in Minkowski signature. Every other normalisation in use — `d^d k / (2π)^d`, the
   factor `μ^{4−d}`, the `\overline{\rm MS}` factor — is related to it by an explicit constant
   that is a named definition with a conversion lemma (Layer 4.7). The trap this avoids is a
   finite part that is wrong by `log 4π − γ` because two results in different normalisations were
   added.
8. The dimension `d` is a natural number in Layers 2 and 3 and a complex number in Layer 4. The
   regulator `ε` is tied to it by the existing `regularizedDimension ε = 4 − ε` of
   `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization`, so `d = 4 − ε` and *not*
   `4 − 2ε`. Every expansion in this roadmap is written in that convention and says so. The trap
   this avoids is a pole coefficient that is wrong by a factor of two when a textbook formula in
   the other convention is transcribed.
9. Propagator powers `ν_e` are real and positive in Layers 2 and 3 and complex with positive real
   part in Layer 4; the integer case is an instance. The trap this avoids is a parametric formula
   proved only for unit powers and then applied to a graph with a squared propagator produced by
   a mass derivative or an integration-by-parts identity.
10. "The dimensionally regularised integral" is a function `ℂ → ℂ` together with a proof that it
    is meromorphic and agrees with the convergent integral on a stated open set. It is never a
    formal symbol manipulated by rules. The properties usually listed as axioms of dimensional
    regularisation are theorems of Layer 4.4. The trap this avoids is a calculus whose consistency
    is assumed and in which `0 = 1` can be derived by an unlicensed exchange of operations.
11. Mathlib's Bochner integral of a non-integrable function is zero. Every equality between
    integrals in this roadmap therefore either carries integrability as a hypothesis or proves it
    as part of the conclusion, and the theorems of Layer 2 that hold without it are stated for the
    lower Lebesgue integral of the non-negative integrand. The trap this avoids is a "proof" that
    a divergent integral vanishes.
12. Convergence hypotheses are explicit `Prop` arguments: positivity of masses, non-exceptionality
    of external momenta, negativity of the degree of divergence of every one-particle-irreducible
    subgraph. They are never typeclasses and never fields with a witness. The trap this avoids is
    the one this repository has met before: a hypothesis encoded as a field that any caller can
    fill with `True`.
13. The `iε` prescription is a positive real parameter and a limit. The limit is taken in the
    space of tempered distributions in the external momenta (`𝓢'` of Mathlib's
    `Analysis.Distribution.TemperedDistribution`), and a boundary value is never evaluated
    pointwise on the singular set. The existing `regularizedDenominator`, `advancedDenominator`
    and `rightLimitAtZero` are used for the single-propagator statements. The trap this avoids is
    a pointwise limit that does not exist being treated as a function.
14. The *symmetry factor* `S` of a graph is a natural number: the order of its half-edge
    automorphism group of Layer 0.8, which contains the exchange of the two ends of each
    self-loop. It is not the order of the group `Aut G` of vertex and edge bijections, from which
    it differs by `2^s` for `s` self-loops, and it is not the weight: a graph enters an amplitude
    with weight `1/S`. The existing `TopologyGraph.symmetryFactor : ℕ` is `S`, and Layer 0.8
    proves it for the topologies the code enumerates. The trap this avoids is a factor of two
    from counting, or not counting, the exchange of the two ends of a self-loop: for the
    one-edge tadpole `|Aut G| = 1` and `S = 2`.
15. An amplitude is an element of a power-series ring in the coupling over `ℂ` (Mathlib's
    `PowerSeries`), order by order a finite sum of integrals. No statement asserts convergence of
    the series. The trap this avoids is an all-orders statement being read as a statement about a
    sum that is not known to exist.
16. Where this roadmap needs an object that is absent upstream — connectedness and contraction for
    `Graph`, the cycle matroid, the Cauchy–Binet formula, the matrix-tree theorem for weighted
    multigraphs, the multivariate Gaussian integral over a positive-definite form — it builds it
    in the shape the upstream library would want and says so in the layer that needs it. It does
    not wait for an upstream change, and no milestone is contingent on one.

## Existing upstream material used by the roadmap

From Mathlib:

- `Mathlib.Combinatorics.Graph.Basic` for `Graph α β`, `IsLink`, `Inc`, `Adj`, `IsLoopAt`,
  `IsNonloopAt`, `incidenceSet`, `loopSet`, and the examples `Graph.noEdge`, `Graph.banana` and
  `Graph.bouquet`, which are exactly the vacuum, the multi-edge two-point and the tadpole
  topologies. `Mathlib.Combinatorics.Graph.Subgraph` for the subgraph order `≤`, the spanning
  subgraph relation `≤s` (`Graph.IsSpanningSubgraph`), the induced relation `≤i` and the closed
  relation `≤c` (`Graph.IsClosedSubgraph`, a union of components).
  `Mathlib.Combinatorics.Graph.Delete` for `Graph.restrict`, `Graph.deleteEdges`, `Graph.induce`
  and `Graph.deleteVerts`. `Mathlib.Combinatorics.Graph.Maps` for `Graph.map` along a function on
  vertices, from which contraction is built. `Mathlib.Combinatorics.Graph.Connected.EdgeCut` for
  `Graph.edgeCut`, `Graph.IsEdgeCut`, `Graph.IsBridge` and `Graph.IsBond`.
  `Mathlib.Combinatorics.Graph.Simple` for `Graph.Loopless`, `Graph.Simple`,
  `Graph.toSimpleGraph` and `Graph.ofSimpleGraph`.
- `Mathlib.Combinatorics.Matroid.Basic`, `.Dual`, `.Minor.Delete`, `.Minor.Contract` and
  `.Rank.Finite` for `Matroid`, its bases, `Matroid.dual`, `Matroid.delete` and
  `Matroid.contract`. The cycle matroid of a multigraph is built here as a term of this type.
- `Mathlib.Combinatorics.SimpleGraph.LapMatrix` for `SimpleGraph.lapMatrix`, its positive
  semidefiniteness (`posSemidef_lapMatrix`) and the identification of the dimension of its kernel
  with the number of components
  (`card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix`). This module is about simple graphs
  with unit weights and contains no matrix-tree theorem; `Mathlib.Combinatorics.SimpleGraph.Acyclic`
  supplies trees for simple graphs only. The weighted statement for multigraphs is built in Layer 1
  and is proved to reduce to `lapMatrix` on `Graph.ofSimpleGraph`.
- `Mathlib.LinearAlgebra.Matrix.Determinant.Basic`, `.Determinant.TotallyUnimodular`
  (`Matrix.IsTotallyUnimodular`, the property of the incidence matrix that makes every loop-basis
  change have determinant `±1`), `Mathlib.LinearAlgebra.Matrix.SchurComplement` and
  `Mathlib.LinearAlgebra.Matrix.PosDef`. The Cauchy–Binet formula for the determinant of a product
  of rectangular matrices is not in `Determinant.Basic` and is built in Layer 1.2.
- `Mathlib.Algebra.MvPolynomial.Basic`, `Mathlib.Algebra.MvPolynomial.Degrees` and
  `Mathlib.RingTheory.MvPolynomial.Homogeneous` (`MvPolynomial.IsHomogeneous`) for the Symanzik
  polynomials; `Mathlib.RingTheory.PowerSeries.Basic` for amplitudes as power series in the
  coupling; `Mathlib.RingTheory.LaurentSeries` for Laurent coefficients at a pole.
- `Mathlib.MeasureTheory.Integral.Bochner.Basic`, `.Integral.Prod` (Fubini and Tonelli),
  `.Integral.Pi` (`MeasureTheory.integral_fintype_prod_eq_prod` and its relatives),
  `.Integral.DominatedConvergence`, `.Integral.IntegralEqImproper`,
  `.Measure.Lebesgue.EqHaar`, `.Measure.Haar.InnerProductSpace` and
  `.Measure.Lebesgue.VolumeOfBalls` for the momentum-space integrals; and
  `Mathlib.Analysis.Calculus.ParametricIntegral`
  (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`) for holomorphy of a parametric integral.
- `Mathlib.Analysis.SpecialFunctions.Gamma.Basic` (`Complex.Gamma`, `Real.Gamma`,
  `Real.integral_rpow_mul_exp_neg_mul_Ioi` and `Complex.integral_cpow_mul_exp_neg_mul_Ioi`, which
  are the Schwinger trick for one propagator), `.Gamma.Beta` (`Complex.betaIntegral`,
  `Complex.Gamma_mul_Gamma_eq_betaIntegral`, the Feynman-parameter formula for two propagators),
  `.Gamma.Deriv` (`Complex.differentiableAt_Gamma`, `Complex.tendsto_self_mul_Gamma_nhds_zero`,
  the residue of the pole at zero), `Mathlib.MeasureTheory.Integral.Gamma`,
  `Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral` (`integral_gaussian`,
  `integral_gaussian_complex`) and `Mathlib.NumberTheory.Harmonic.EulerMascheroni`
  (`Real.eulerMascheroniConstant`).
- `Mathlib.Analysis.Meromorphic.Basic` (`MeromorphicAt`, `MeromorphicOn`, `Meromorphic`),
  `.Meromorphic.Order` (`meromorphicOrderAt`) and `.Meromorphic.Complex` (`Meromorphic.Gamma`),
  the vocabulary in which a dimensionally regularised integral is stated;
  `Mathlib.Analysis.Analytic.Uniqueness` and `.Analytic.IsolatedZeros` for uniqueness of the
  continuation; `Mathlib.Analysis.Complex.CauchyIntegral` for contour rotation.
- `Mathlib.Analysis.MellinTransform` (`mellin`, `MellinConvergent`, `HasMellin`): a one-parameter
  Schwinger integral is a Mellin transform, and the sector integrals of Layer 4.2 are iterated
  Mellin transforms of functions smooth at the origin.
- `Mathlib.Analysis.Distribution.SchwartzSpace.Basic`, `.SchwartzSpace.Fourier`,
  `Mathlib.Analysis.Distribution.TemperedDistribution` (`TemperedDistribution`, notation `𝓢'(E,
  F)`, `Function.HasTemperateGrowth`-based embeddings and `lineDerivOp`) for the boundary values
  of Layer 5. `Mathlib.Analysis.Convex.StdSimplex` (`stdSimplex`) for the Feynman-parameter
  domain.

From Physlib:

- `Physlib.QFT.PerturbationTheory.WickAlgebra.WicksTheorem` (`wicks_theorem`: the time-ordered
  product of a list of field operators is the sum over `WickContraction`s of `wickTerm`),
  `.WickAlgebra.WicksTheoremNormal` (`wicks_theorem_normal_order`), `.WickAlgebra.StaticWickTheorem`
  (`static_wick_theorem`), `Physlib.QFT.PerturbationTheory.WickContraction.Basic`
  (`WickContraction n`), `.WickContraction.IsFull` (`WickContraction.IsFull`, the contractions
  with no uncontracted field, which are the ones a vacuum expectation value keeps),
  `Physlib.QFT.PerturbationTheory.FieldSpecification.Basic` (`FieldSpecification`, with its
  position and asymptotic labels and its statistics) and
  `Physlib.QFT.PerturbationTheory.Koszul.KoszulSign` for fermion signs.
- `Physlib.QFT.PerturbationTheory.FeynmanDiagrams.Basic` contains a module docstring and no
  declarations: it states the intent that a Feynman diagram is a partition of a multiset of field
  operators into pairs and marks the directory as work in progress. Layer 6 builds the object in
  this repository, on `WickContraction`, and does not wait for it.
- `Physlib.Relativity.Tensors.RealTensor.Vector.Basic` and `.Vector.MinkowskiProduct` for
  `Lorentz.Vector` and its Minkowski product, `Physlib.Relativity.MinkowskiMatrix`, and
  `Physlib.Relativity.CliffordAlgebra` for the Dirac numerator algebra of Layer 6.
- `Physlib.Mathematics.Distribution.Basic` for the distribution type `E →d[𝕜] F` and its
  conversion `Distribution.toTemperedDistribution` to Mathlib's tempered distributions, so that a
  boundary value built here is usable by Physlib's distributional electromagnetism and conversely.

From EpsilonEridani:

- `QFT.PerturbationTheory.DimensionalRegularization.Basic`: `regularizedDimension`,
  `LaurentExpansionAtZero` (a real pole coefficient, a complex finite part and a remainder
  function, with `eval`, `principalPart` and `IsRegular`) and `RenormalizationScheme`. The type
  admits at most a simple pole. Layer 4.3 constructs terms of it from actual integrals and proves
  when a simple pole suffices.
- `QFT.PerturbationTheory.DimensionalRegularization.OneLoopScalars`: `ScalarMasterIntegral`,
  `OneLoopScalarIntegrand`, `ScalarIntegrandReduction`, and the records `masslessBubble`,
  `massiveBubble` and `tadpole`, each of which takes its pole coefficient (and for the latter two
  its finite part) as an argument. `OneLoopScalarIntegrand.evaluate` returns a field of the record.
  `ScalarIntegrandReduction` is a structure with no fields. Layer 4.6 computes the integrals these
  are named after and Layer 4.5 gives the reduction witness a statement.
- `QFT.PerturbationTheory.DimensionalRegularization.TensorReduction`: `isotropicRankTwoReduction`
  with a caller-supplied coefficient. Layer 2.4 proves the coefficient is `1/d`.
- `QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`: `Momentum` (`Lorentz.Vector 3`),
  `minkowskiSquare`, `massShellPolynomial`, `regularizedDenominator`, `advancedDenominator`,
  `rightLimitAtZero`, `boundaryValuesAtZeroPlus`, the conjugation lemmas, the propagators
  `gluonPropagator`, `quarkPropagator`, `ghostPropagator` — each documented there as a
  placeholder and each equal to the reciprocal scalar denominator, the gluon propagator ignoring
  its Lorentz indices and gauge parameter — and the rule bundles `GaugeFeynmanRules`,
  `qcdStandardRules`, `u1AbelianGaugeRules`. Layers 5 and 6 use the denominators as they are and
  give the propagators their tensor structure.
- `QFT.PerturbationTheory.FeynmanDiagrams.TopologyEnumeration`, `.CrossingSymmetry`,
  `.FiniteSearch`: `TopologyGraph` (lists of external-leg, node and edge kinds and a
  natural-number symmetry factor), its external-leg permutation action and crossing equivalence.
  A `TopologyGraph` carries no incidence relation. Layer 0.8 defines the forgetful map from a
  labelled Feynman graph to a `TopologyGraph` and proves the symmetry-factor field correct on its
  image.
- `QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation`, `.TwoLoopEvaluation`,
  `.TwoLoopDiagrammaticBridge` and `.YangMillsGaugeData` for the self-energy integrand records and
  the gauge-group data (`YangMillsGaugeData`, `suNYangMillsGaugeData`) that the QCD rules of
  Layer 6 take their colour factors from; `QFT.QCD.SUNStructureConstants`, `.SUNGenerators`,
  `.CasimirDerivation` and `.RepresentationColor` for the colour algebra;
  `QFT.QCD.OneLoopCounterterms` and `.OneLoopBeta` as the consumers of the pole coefficients.
- `Mathematics.Distribution.BasicExtensions` and `.PlusFunctional` for the conventions under which
  this library already treats a singular kernel as a functional on test functions.

From TauCeti:

- `TauCeti.Analysis.SpecialFunctions.Beta` for the real-variable beta integrals
  (`integral_rpow_mul_one_sub_rpow`, `integral_rpow_mul_one_add_rpow`), which are the
  two-propagator Feynman-parameter integral and its half-line form, and
  `TauCeti.Analysis.SpecialFunctions.Gamma` (`Real.measurable_Gamma`) for measurability of
  formulae containing the Gamma function of a variable.
- `TauCeti.MeasureTheory.Integral.Pi` (`lintegral_fintype_prod_eq_prod`, the lower-integral
  product formula that Layer 2.2 needs because it is stated without integrability hypotheses) and
  `TauCeti.MeasureTheory.Integral.Dilation` (`lintegral_comp_smul`) for the scaling law of
  Layer 2.5 in lower-integral form.
- `TauCeti.Analysis.Contour.PerWindow.CPV` for the principal value at a simple pole on a contour,
  used for the Sokhotski–Plemelj decomposition of a single propagator in Layer 5.4, and
  `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` (`dense_hasCompactSupport`) for passing a
  boundary-value statement from compactly supported test functions to Schwartz functions.
- `TauCeti.Combinatorics.RibbonGraph.Basic` is a development of bipartite ribbon graphs encoded by
  permutations. It is not the multigraph-with-legs of this roadmap and is not used; it is named
  here so that a contributor does not mistake it for the intended base. These are citations of
  where the mathematics should come from; `EpsilonEridani` does not currently import them.

Absent upstream at the pinned revisions, and therefore targets here: a connectedness predicate,
walks and components for `Graph`; edge contraction for `Graph`; spanning trees and forests of a
multigraph; the cycle matroid; the Cauchy–Binet formula; the weighted matrix-tree theorem; the
Gaussian integral over a positive-definite quadratic form on a finite-dimensional space as a
determinant; any Feynman integral.

---

## Layer 0: Feynman graphs

References: Nakanishi, *Graph Theory and Feynman Integrals*, ch. 1; Itzykson and Zuber, *Quantum
Field Theory*, §6-2; Bogner and Weinzierl, *Int. J. Mod. Phys. A* **25** (2010) 2585, §2–3; Oxley,
*Matroid Theory*, ch. 1 and 5.

### 0.1 Finite multigraphs with external legs

A *Feynman graph* is a `G : Graph α β` with `V(G)` and `E(G)` finite, together with a finite type
`L` of external legs and an attachment `L → V(G)`. Edges are internal lines; an edge may be a
self-loop and several edges may share their ends.

- Definitions: the structure; the degree of a vertex, counting a self-loop twice and each attached
  leg once; the valence profile of a graph.
- Statements to prove: the handshake identity `Σ_v deg v = 2 |E(G)| + |L|`; invariance of every
  definition under `Graph.copy`; the three Mathlib examples `Graph.noEdge`, `Graph.banana` and
  `Graph.bouquet` as Feynman graphs, with their degrees.

### 0.2 Walks, connectedness and components

`Graph` at the pinned revision has the subgraph orders, closed subgraphs, edge cuts, bridges and
bonds, and no walk or connectedness predicate.

- Definitions: `Graph.Reachable` as the reflexive–transitive closure of `Graph.Adj` on `V(G)`;
  `Graph.Connected`, which requires `V(G)` to be non-empty; the components of `G` as the
  equivalence classes, each a subgraph.
- Statements to prove: reachability is an equivalence relation on `V(G)`; a subgraph is closed
  (`≤c`) if and only if its vertex set is a union of components; a graph with at least one vertex is
  connected if and only if its only closed subgraphs are the empty one and itself; `e` is a bridge
  (`Graph.IsBridge`) if and
  only if `G.deleteEdges {e}` has one more component than `G`; connectedness is preserved by
  `Graph.map` and reflected by `Graph.toSimpleGraph` on loopless graphs, so that the statement
  agrees with `SimpleGraph.Connected` where both apply.

### 0.3 Deletion and contraction

Deletion is `Graph.deleteEdges`. Contraction of an edge set `F` is built here: `Graph.map` along
the quotient of `V(G)` by reachability in `G.restrict F`, followed by `Graph.deleteEdges F`.

- Definitions: `Graph.contract G F`; for a subgraph `γ ≤ G`, the quotient `G / γ` as the
  contraction of `E(γ)`; the induced Feynman-graph structure on `G / γ` and on `γ`, where the
  external legs of `γ` are the legs of `G` attached to `V(γ)` together with one leg for each
  end of an edge of `G` outside `γ` that lies in `V(γ)`.
- Statements to prove: `E(G / F) = E(G) \ F`; contraction and deletion of disjoint edge sets
  commute; contraction is transitive, `(G / F₁) / F₂ = G / (F₁ ∪ F₂)`; contraction of a single
  non-self-loop edge lowers `|V|` by one; contraction of a self-loop equals its deletion;
  contraction preserves connectedness.

### 0.4 The cycle rank, spanning trees and forests, and the cycle matroid

- Definitions: `loopNumber G = |E(G)| − |V(G)| + c(G)` with `c` the number of components; a
  *spanning forest* as an edge set containing no cycle and meeting every component in a connected
  spanning subgraph, a *spanning tree* as a spanning forest of a connected graph, and a *spanning
  `k`-forest* as an acyclic edge set whose spanning subgraph has exactly `c(G) + k − 1`
  components; the *cycle matroid* `Graph.cycleMatroid G : Matroid β` on ground set `E(G)` whose
  bases are the spanning forests.
- Statements to prove: `0 ≤ loopNumber G`, with equality if and only if `G` is a forest;
  additivity over components; `loopNumber G = loopNumber γ + loopNumber (G / γ)` for every
  subgraph `γ`; the equivalence, for a connected graph, of "acyclic and connected", "connected
  with `|V| − 1` edges", "minimal connected spanning" and "maximal acyclic"; existence of a
  spanning tree; every spanning tree has `|V(G)| − 1` edges and its complement has `loopNumber G`
  edges; the basis-exchange property, which is the matroid axiom; `(cycleMatroid G).delete F =
  cycleMatroid (G.deleteEdges F)` and `(cycleMatroid G).contract F = cycleMatroid (G / F)`; the
  rank of the cycle matroid is `|V| − c` and the rank of its dual is `loopNumber G`; the circuits
  of the dual are the bonds (`Graph.IsBond`).

### 0.5 Bridges, one-particle irreducibility and blocks

- Definitions: `G` is *one-particle irreducible* if it is connected and has no bridge; a
  *one-particle-irreducible block* of `G` is a maximal bridgeless connected subgraph with at least
  one edge or a single vertex; the *tree of blocks* obtained by contracting every block.
- Statements to prove: `G` is one-particle irreducible if and only if it is connected and remains
  connected after deletion of any one edge; the blocks partition the non-bridge edges; `G`
  contracted along its blocks is a forest whose edges are the bridges of `G`; `loopNumber G` is
  the sum of the loop numbers of the blocks; a graph with a bridge whose removal leaves a
  component with no external leg (a *tadpole attachment*) is characterised; the subgraph `γ` of
  0.3 is one-particle irreducible if and only if it is so as a graph, independently of its
  induced legs — the statement that makes Convention 2 necessary.

### 0.6 Orientation, the incidence matrix, cycle space and cut space

- Definitions: an orientation as a pair of maps `src tgt : β → α` with `G.IsLink e (src e) (tgt
  e)` on `E(G)`; the signed incidence matrix `∂ : V × E → ℤ`, with a self-loop column zero; the
  cycle space `ker ∂` and the cut space `im ∂ᵀ` over a field `K`; the fundamental cycle of an
  edge outside a spanning tree `T`.
- Statements to prove: every column of `∂` sums to zero; `rank ∂ = |V| − c`; `dim ker ∂ =
  loopNumber G`; cycle space and cut space are orthogonal complements; the fundamental cycles of
  the complement of a spanning tree form a basis of the cycle space; `∂` is totally unimodular
  (`Matrix.IsTotallyUnimodular`), hence the matrix of a change between two fundamental-cycle bases
  has determinant `±1`; reversing the orientation of an edge negates one column and changes none
  of these statements.

### 0.7 Momentum routing

Let `M` be a finite-dimensional real vector space of momenta.

- Definitions: a *momentum routing* for external momenta `p : L → M` as `k : E → M` with, at each
  vertex `v`, `Σ_e ∂_{v e} k_e + Σ_{l ↦ v} p_l = 0`; a *loop-momentum basis* as a spanning tree
  `T` together with the momenta of the edges outside `T` as free variables.
- Statements to prove: a routing exists if and only if the external momenta attached to each
  component sum to zero; the set of routings is an affine space over `ker ∂ ⊗ M`, of dimension
  `loopNumber G · dim M`; for a spanning tree `T`, every routing is determined by its values on
  `E \ T` and each tree-edge momentum is an explicit signed sum of loop and external momenta; the
  linear change of variables between two loop-momentum bases has determinant `±1` on `M^L`, so it
  preserves Lebesgue measure — the fact Layer 2.1 uses to make the integral well defined; for a
  bridge `e`, `k_e` is independent of the loop momenta and equals the external momentum flowing
  across the bridge.

### 0.8 Automorphisms and the symmetry factor

- Definitions: `Aut G`, the group of pairs of a permutation of `V(G)` and a permutation of `E(G)`
  preserving `IsLink` and fixing the attachment of every external leg, extended to preserve
  vertex and edge labels when the graph is labelled (Layer 6.1); the *half-edge automorphism
  group*, which additionally records the exchange of the two ends of each self-loop; the symmetry
  factor `S` as the order of the latter (Convention 14); the forgetful map from a labelled Feynman
  graph to the
  existing `TopologyGraph`.
- Statements to prove: `Aut G` is finite; the order of the half-edge group is `|Aut G| · 2^s`
  with `s` the number of self-loops; for `Graph.banana` with `n` edges and one leg at each end the
  order is `n!`, for the two-vertex one-loop self-energy it is `2`, for the tadpole
  `Graph.bouquet` with one edge it is `2`; the `symmetryFactor` field of a `TopologyGraph` in the
  image of the forgetful map equals the order of the half-edge group, proved for the one-loop
  self-energy topologies the code enumerates; crossing-equivalent graphs
  (`TopologyGraph.IsCrossingEquivalent`) have equal symmetry factors.

### Examples

- `Graph.banana u v E` with `|E| = n` and one leg at each vertex: `loopNumber = n − 1`, exactly
  `n` spanning trees (the singletons), one-particle irreducible for `n ≥ 2`.
- The one-loop triangle and box: loop number one, spanning trees are the complements of single
  edges.
- The two-loop sunrise and the two-loop "figure eight" vacuum graph `Graph.bouquet v {e₁, e₂}`.
- A self-energy insertion on a line: two blocks joined by a bridge, not one-particle irreducible,
  loop number the sum.
- Counterexample-shaped: the bubble with its two external lines modelled as edges to univalent
  vertices has two bridges and is not one-particle irreducible, although the Feynman graph of
  Convention 2 is. This is the example that fixes the convention.
- Counterexample-shaped: two orientations of the triangle with different incidence matrices and
  the same cycle space.

### Dependencies

`Mathlib.Combinatorics.Graph.Basic`, `.Graph.Subgraph`, `.Graph.Delete`, `.Graph.Maps`,
`.Graph.Simple`, `.Graph.Connected.EdgeCut`; `Mathlib.Combinatorics.Matroid.Basic`,
`.Matroid.Dual`, `.Matroid.Minor.Delete`, `.Matroid.Minor.Contract`, `.Matroid.Rank.Finite`;
`Mathlib.LinearAlgebra.Matrix.Determinant.TotallyUnimodular`;
`Mathlib.LinearAlgebra.Dimension.Finrank`;
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.TopologyEnumeration` and
`.CrossingSymmetry`.

---

## Layer 1: the Symanzik polynomials

References: Kirchhoff, *Ann. Phys. Chem.* **72** (1847) 497; Nakanishi, ch. 2; Itzykson and Zuber,
§6-2-3; Bogner and Weinzierl (2010), §3–5; Weinzierl, *Feynman Integrals*, ch. 3.

### 1.1 The first Symanzik polynomial

- Definition: for a Feynman graph `G`, `symanzikU G = Σ_T ∏_{e ∈ E(G) \ T} X_e` in
  `MvPolynomial E ℤ`, the sum over spanning forests `T` (spanning trees when `G` is connected).
- Statements to prove: `symanzikU G` is homogeneous of degree `loopNumber G`
  (`MvPolynomial.IsHomogeneous`); it has degree at most one in each variable; every coefficient
  is `0` or `1`; it is non-zero; it is `1` if and only if `G` is a forest; it is strictly positive
  on the open positive orthant; it is independent of the orientation and of the legs; it is
  multiplicative over disjoint unions and over two graphs glued at a single vertex; the variable
  of a bridge does not occur; the variable of a self-loop `e` divides it, with quotient
  `symanzikU (G.deleteEdges {e})`.

### 1.2 The matrix-tree theorem for weighted multigraphs

- Definitions: for weights `x : E → R` in a commutative ring, the weighted Laplacian `Λ_{vw} =
  Σ_e ∂_{v e} x_e ∂_{w e}`; the reduced Laplacian obtained by deleting the row and column of one
  vertex in each component; for a cycle basis `C` (a `loopNumber G × E` integer matrix whose rows
  span the cycle space), the *loop matrix* `A_{ij} = Σ_e C_{ie} α_e C_{je}`.
- Statements to prove: the Cauchy–Binet formula `det (A B) = Σ_S det A_S det B_S` for
  `A : Matrix m n R`, `B : Matrix n m R`, in the shape of `Matrix.det_mul`; a square submatrix of
  the reduced incidence matrix indexed by an edge set `S` has determinant `±1` if `S` is a
  spanning forest and `0` otherwise; **the matrix-tree theorem**: the determinant of the reduced
  weighted Laplacian is `Σ_T ∏_{e ∈ T} x_e`; its independence of the deleted vertices; the dual
  form `det A = symanzikU G` evaluated at `α` for the fundamental-cycle basis of any spanning
  tree, and hence for any basis related to it by a unimodular matrix; the relation `symanzikU G
  (α) = (∏_e α_e) · Σ_T ∏_{e ∈ T} α_e⁻¹` between the two forms over a field; positive
  definiteness of the loop matrix for positive `α`; for `G = Graph.ofSimpleGraph H` and unit
  weights, the weighted Laplacian is `SimpleGraph.lapMatrix`; the all-minors extension, in which
  deleting `k` rows and columns gives a sum over spanning `k`-forests separating the deleted
  vertices.

### 1.3 The second Symanzik polynomial

Fix external momenta `p : L → M` summing to zero on each component and a positive-semidefinite
quadratic form on `M`, and masses `m : E → ℝ`.

- Definitions: for a spanning two-forest `(T₁, T₂)` of a connected `G`, `q(T₁, T₂)` is the square
  of the sum of the external momenta attached to `T₁`; `symanzikF₀ G = Σ_{(T₁, T₂)} q(T₁, T₂)
  ∏_{e ∉ T₁ ∪ T₂} X_e`; `symanzikF G = symanzikF₀ G + symanzikU G · Σ_e m_e² X_e`, in
  `MvPolynomial E ℝ`; `symanzikFMink` the same with `q` replaced by minus the Minkowski square.
- Statements to prove: `q(T₁, T₂) = q(T₂, T₁)`, by momentum conservation; `symanzikF₀` and
  `symanzikF` are homogeneous of degree `loopNumber G + 1`; `symanzikF₀` depends on the momenta
  only through the Gram matrix of partial sums and has non-negative coefficients; the quadratic
  form identity `F₀ / U = Σ_e α_e q_e² − Qᵀ A⁻¹ Q`, with `q_e` the tree routing of the external
  momenta, `Q` its projection on the cycle basis and `A` the loop matrix, proved through
  `Matrix.SchurComplement`; `symanzikF₀ G = 0` at given momenta if and only if every edge cut
  separating the legs has zero momentum transfer; for strictly positive masses `symanzikF` is
  strictly positive on the positive orthant.

### 1.4 Deletion and contraction

- Statements to prove: for an edge `e` that is neither a bridge nor a self-loop, `U_G = X_e ·
  U_{G \ e} + U_{G / e}`, and the same recursion for `F₀`; for a bridge, `U_G = U_{G / e}` and
  `F₀_G = F₀_{G / e} + X_e q_e² U_{G / e}` with `q_e` the momentum across the bridge; for a
  self-loop, `U_G = X_e U_{G \ e}` and `F₀_G = X_e F₀_{G \ e}`; the two recursions determine `U`
  and `F₀` from the one-vertex graph, which is the induction principle used for every polynomial
  identity in this layer.

### 1.5 Factorisation under rescaling of a subgraph

Let `γ ≤ G` be a subgraph and let `ρ_λ` rescale `X_e ↦ λ X_e` for `e ∈ E(γ)` and fix the others.

- Statements to prove: `ρ_λ (U_G) = λ^{loopNumber γ} · (U_γ · U_{G/γ} + λ R)` for a polynomial
  `R`, where `U_γ` is in the variables of `γ` and `U_{G/γ}` in the others; `ρ_λ (F_G) =
  λ^{loopNumber γ} · (U_γ · F_{G/γ} + λ R')` when no mass term or momentum invariant is rescaled,
  with the exact form of the next term stated; the complementary statement for the top-degree
  part in the variables of `E(G) \ E(γ)`: the highest power of `λ` in the rescaling of the
  complement is `loopNumber (G/γ)` with coefficient `U_γ · U_{G/γ}` again; for a nested chain
  `γ₁ ≤ γ₂ ≤ … ≤ G`, the iterated factorisation that Layer 3.2 uses.

These identities are the single combinatorial input to Weinberg's theorem (Layer 3), to the
forest formula of `Renormalization` Layer 1 and to the power counting of `InfraredStructure`
Layer 3.

### 1.6 Duality

- Statements to prove: for a matroid `N` with finite ground set define `U_N = Σ_B ∏_{e ∉ B} X_e`
  over bases; then `U_{N✶}(X) = (∏_e X_e) · U_N(X⁻¹)` over a field, with `N✶` the `Matroid.dual`;
  `symanzikU G = U_{cycleMatroid G}`; consequently two graphs with isomorphic cycle matroids have
  equal first Symanzik polynomials, and a graph whose cycle matroid is dual to that of `G*` has
  `symanzikU G* (X) = (∏ X_e) symanzikU G (X⁻¹)`.

### Examples

- One-loop bubble: `U = X₁ + X₂`, `F = p² X₁ X₂ + (X₁ + X₂)(m₁² X₁ + m₂² X₂)`.
- One-loop `n`-gon: `U = Σ X_i`, `F₀ = Σ_{i<j} q_{ij}² X_i X_j` with `q_{ij}` the momentum between
  the two cut edges.
- Sunrise: `U = X₁X₂ + X₁X₃ + X₂X₃`, `F₀ = p² X₁X₂X₃`.
- Two-loop vacuum bouquet: `U = X₁ X₂`.
- The triangle and its matroid dual, the three-edge banana: `X₁ + X₂ + X₃` against `X₁X₂ + X₁X₃ +
  X₂X₃`, an instance of 1.6.
- Counterexample-shaped: the tree-sum formula applied to a disconnected graph with "spanning
  tree" read literally gives zero; with spanning forests it gives the product over components.
  The definition in 1.1 uses forests for this reason.

### Dependencies

Layer 0. `Mathlib.Algebra.MvPolynomial.Basic`, `.MvPolynomial.Degrees`,
`Mathlib.RingTheory.MvPolynomial.Homogeneous`, `Mathlib.LinearAlgebra.Matrix.Determinant.Basic`,
`.Determinant.TotallyUnimodular`, `Mathlib.LinearAlgebra.Matrix.SchurComplement`,
`Mathlib.LinearAlgebra.Matrix.PosDef`, `Mathlib.Combinatorics.SimpleGraph.LapMatrix`,
`Mathlib.Combinatorics.Matroid.Dual`.

---

## Layer 2: the scalar Feynman integral in Euclidean signature

References: Itzykson and Zuber, §6-2-3 and §8-1; Nakanishi, ch. 2; Smirnov, *Evaluating Feynman
Integrals*, ch. 2–3; Weinzierl, ch. 2; Cheng and Wu, *Expanding Protons*, appendix on Feynman
parameters.

### 2.1 The momentum-space integral

Data: a connected Feynman graph `G`, a dimension `d : ℕ` with `1 ≤ d`, masses `m_e ≥ 0`, powers
`ν_e > 0`, and external momenta in `EuclideanSpace ℝ (Fin d)` summing to zero.

- Definitions: the integrand `∏_e (|k_e|² + m_e²)^{−ν_e}` as a function on the affine space of
  routings of 0.7; for a loop-momentum basis, the integral over `(EuclideanSpace ℝ (Fin d))^{L}`
  with `L = loopNumber G` against the product Lebesgue measure divided by `π^{L d / 2}`; the
  lower-integral version valued in `ℝ≥0∞`.
- Statements to prove: the integrand is measurable and non-negative; the lower integral is
  independent of the loop-momentum basis and of the orientation, by 0.7 and translation and
  linear-change invariance of Lebesgue measure; it is invariant under a simultaneous orthogonal
  transformation of all external momenta and therefore a function of their Gram matrix; it is
  finite if and only if the integrand is integrable, in which case the Bochner integral equals
  its real value; for a bridge the propagator factors out of the integral; for a disconnected or
  one-vertex-glued graph the integral is the product of the integrals of the pieces.

### 2.2 The Schwinger representation

- Statements to prove: the one-propagator identity `D^{−ν} = Γ(ν)⁻¹ ∫_{α > 0} α^{ν−1} e^{−α D}`
  for `D > 0`, from `Real.integral_rpow_mul_exp_neg_mul_Ioi`; the Gaussian integral over a
  positive-definite quadratic form: for `A` a positive-definite real `L × L` matrix and `b ∈
  (ℝ^d)^L`, `∫ ∏ d^d k_i / π^{d/2} · exp(−Σ A_{ij} k_i·k_j + 2 Σ b_i·k_i) = (det A)^{−d/2}
  exp(Σ (A⁻¹)_{ij} b_i·b_j)`, built from `integral_gaussian`, the product formula of
  `MeasureTheory.Integral.Pi` and the diagonalisation of `Matrix.PosDef`; the exchange of the
  `α` and `k` integrations by Tonelli for the lower integral, with no hypothesis; **the Schwinger
  representation**:

      I_G = ∏_e Γ(ν_e)⁻¹ ∫_{α ∈ (0,∞)^E} ∏_e α_e^{ν_e − 1} · U(α)^{−d/2} · exp(−F(α) / U(α)) dα

  as an identity in `ℝ≥0∞`, where `U` and `F` are the evaluations of `symanzikU` and `symanzikF`;
  consequently the momentum-space integral converges if and only if the parametric one does.

### 2.3 The Feynman-parameter representation

Write `ν = Σ_e ν_e` and `L = loopNumber G`.

- Definitions: the measure on `stdSimplex ℝ E` obtained from Lebesgue measure on the first `|E| −
  1` coordinates; more generally, for a non-empty `S ⊆ E`, the measure on the hypersurface `Σ_{e ∈
  S} α_e = 1` of the positive orthant.
- Statements to prove: the radial decomposition `α = t β` with `β` on the hypersurface, with
  Jacobian `t^{|E|−1}`; the radial integral evaluated by homogeneity (1.1, 1.3) and the Gamma
  integral; **the Feynman-parameter representation**, valid when `ν − L d / 2 > 0` and the right
  side is finite:

      I_G = Γ(ν − L d/2) / ∏_e Γ(ν_e) · ∫_{Σ α = 1} ∏_e α_e^{ν_e − 1} ·
            U(α)^{ν − (L+1) d/2} / F(α)^{ν − L d/2}

  **the Cheng–Wu theorem**: the same formula with the simplex replaced by the hypersurface of any
  non-empty `S`; the two-propagator case identified with `Complex.betaIntegral` and with
  `TauCeti`'s `integral_rpow_mul_one_sub_rpow`; Feynman's formula `∏_e D_e^{−ν_e} = Γ(ν) / ∏ Γ(ν_e)
  · ∫_{Σ α = 1} ∏ α_e^{ν_e−1} (Σ α_e D_e)^{−ν}` for positive `D_e`.

### 2.4 Tensor numerators

- Definitions: a numerator as a polynomial in the components of the loop and external momenta;
  the tensor integral with that numerator.
- Statements to prove: the Gaussian moment formula, giving the parametric form of a tensor
  integral as a finite sum of scalar parametric integrals with polynomial prefactors in `α`,
  shifted powers of `U` and explicit tensors built from the metric and the external momenta; the
  rank-two one-loop identity `∫ k_μ k_ν f(|k|²) = (δ_{μν} / d) ∫ |k|² f(|k|²)` for integrable
  radial `f`, which is the content of the existing `isotropicRankTwoReduction` with its
  coefficient equal to `1/d`; the general statement that a rotation-covariant tensor integral is
  a combination of products of `δ_{μν}` and external momenta with scalar-integral coefficients,
  with the rank-one and rank-two one-loop two-point reductions given explicitly; the effect of a
  numerator of degree `n` on the degree of divergence, `ω ↦ ω + n`.

### 2.5 Scaling, mass derivatives and elementary evaluations

- Statements to prove: the scaling law `I_G(λ p, λ m) = λ^{L d − 2ν} I_G(p, m)` for `λ > 0`, by
  `MeasureTheory.Measure.integral_comp_smul` and, in lower-integral form, `TauCeti`'s
  `lintegral_comp_smul`; `∂ I_G / ∂ m_e² = −ν_e I_G` with `ν_e` raised by one, under the
  convergence hypothesis, by differentiation under the integral; monotonicity of `I_G` in the
  masses and in the Euclidean invariants; the tadpole `∫ d^d k / π^{d/2} (|k|² + m²)^{−ν} =
  Γ(ν − d/2) / Γ(ν) · (m²)^{d/2 − ν}` for `ν > d/2` and `m > 0`; the massless bubble with unit
  powers for `2 < d < 4`, that is `d = 3`: `π^{3/2} / |p|`.

### Examples

- The massive tadpole in `d = 1`: `√π / m`.
- The equal-mass bubble in `d = 2` and `d = 3` from the Feynman-parameter form.
- The massless bubble in `d = 3`: `π^{3/2}/|p|`, from both the momentum-space convolution and the
  parametric form, as a check of 2.3.
- Counterexample-shaped: the massive tadpole with `ν = 1` in `d = 3`. The integrand is not
  integrable, the Bochner integral is zero by convention, and the value that Layer 4 assigns to
  the continued function at `d = 3` is `Γ(−1/2) m = −2√π m`. Neither is "the integral"; the
  example fixes Convention 11.
- Counterexample-shaped: the massless tadpole in any `d`: the lower integral is infinite for every
  `d` and every `ν`, because the ultraviolet and infrared conditions are incompatible.

### Dependencies

Layers 0 and 1. `Mathlib.MeasureTheory.Integral.Bochner.Basic`, `.Integral.Prod`, `.Integral.Pi`,
`.Integral.IntegralEqImproper`, `.Measure.Lebesgue.EqHaar`, `.Measure.Haar.InnerProductSpace`,
`Mathlib.Analysis.SpecialFunctions.Gamma.Basic`, `.Gamma.Beta`,
`Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral`,
`Mathlib.Analysis.Convex.StdSimplex`, `Mathlib.Analysis.Calculus.ParametricIntegral`,
`Mathlib.LinearAlgebra.Matrix.PosDef`, `TauCeti.MeasureTheory.Integral.Pi`,
`TauCeti.MeasureTheory.Integral.Dilation`, `TauCeti.Analysis.SpecialFunctions.Beta`,
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.TensorReduction`.

---

## Layer 3: ultraviolet power counting and convergence

References: Weinberg, *Phys. Rev.* **118** (1960) 838; Hepp, *Commun. Math. Phys.* **2** (1966)
301; Speer, *Generalized Feynman Amplitudes*, ch. 2; Lowenstein and Zimmermann, *Commun. Math.
Phys.* **44** (1975) 73; Itzykson and Zuber, §8-1.

### 3.1 The superficial degree of divergence

- Definition: for a subgraph `γ ≤ G`, `ω(γ) = d · loopNumber γ − 2 Σ_{e ∈ E(γ)} ν_e`, a real
  number; with a numerator of degree `n_γ` in the loop momenta of `γ`, `ω(γ)` is increased by
  `n_γ`.
- Statements to prove: `ω(G) = ω(γ) + ω(G / γ)`; `ω` is additive over disjoint unions and
  one-vertex gluings; `ω(G)` is the scaling exponent of 2.5; for unit powers in `d = 4`, `ω = 4 L
  − 2 |E|`, and for a scalar theory with only quartic vertices `ω = 4 − n` with `n` the number of
  legs, by the handshake identity of 0.1.

### 3.2 Hepp sectors

- Definitions: for a bijection `σ : Fin |E| ≃ E`, the sector `{α : α_{σ 1} ≤ α_{σ 2} ≤ … ≤ α_{σ
  |E|}}`; the sector variables `t_j` with `α_{σ j} = ∏_{i ≥ j} t_i`, so `t_j ∈ (0, 1]` for `j <
  |E|` and `t_{|E|} ∈ (0, ∞)`; the flag of subgraphs `γ_j` spanned by the first `j` edges of `σ`.
- Statements to prove: the sectors cover the positive orthant and overlap in sets of measure
  zero; the Jacobian of the change of variables is `∏_j t_j^{j − 1}`; **the sector factorisation**:
  in sector `σ`, `U(α) = ∏_j t_j^{loopNumber γ_j} · (1 + P_σ(t))` with `P_σ` a polynomial with
  non-negative coefficients, by iterating 1.5 along the flag; the corresponding statement for
  `F`, with `F(α) = ∏_j t_j^{loopNumber γ_j} · t_{|E|} · Q_σ(t)` and `Q_σ` bounded below by a
  positive constant on the sector when all masses are positive; the resulting form of the
  Schwinger integrand in each sector as `∏_j t_j^{a_j − 1} · g_σ(t)` with `a_j = Σ_{i ≤ j} ν_{σ i}
  − (d/2) loopNumber γ_j = −ω(γ_j)/2` and `g_σ` smooth and bounded on the closed sector.

### 3.3 Weinberg's theorem

- Statements to prove: **convergence**: for strictly positive masses, the Euclidean integral of
  2.1 is absolutely convergent if and only if `ω(γ) < 0` for every one-particle-irreducible
  subgraph `γ ≤ G` with at least one loop, `G` included. Sufficiency is Weinberg's theorem;
  necessity holds because the integrand is positive and is read off the sector in which the
  divergent subgraph comes first. The equivalent statement with "every subgraph" in place of
  "every one-particle-irreducible subgraph"; convergence is uniform on compact sets of external
  momenta and masses bounded away from zero, and the integral is then continuous in them and
  infinitely differentiable in the external momenta; **asymptotics by scaling**: `I_G(λ p, m) =
  λ^{ω(G)} I_G(p, m/λ)`, so the large-momentum behaviour is `λ^{ω(G)}` times the massless integral
  exactly when the latter converges (3.4); differentiating `n` times with respect to an external
  momentum lowers `ω` of every subgraph through which that momentum is routed by `n`.

### 3.4 Massless propagators and non-exceptional momenta

- Definitions: a set of external momenta is *non-exceptional* if no proper non-empty subset of the
  legs has zero total momentum; for a non-empty set `S` of massless edges, the *infrared quotient*
  is `G / (E(G) \ S)` with its induced legs, and `S` is *infrared-sensitive* at the given momenta
  if the
  two-forest polynomial `F₀` of the infrared quotient vanishes identically at those momenta.
- Statements to prove: under the rescaling `α_e ↦ λ α_e` for `e ∈ S`, `λ → ∞`, the leading power of
  `U` is `loopNumber (G / (E \ S))`, by the complementary statement of 1.5; **convergence with
  massless lines**: the integral of 2.1 converges if and only if the ultraviolet condition of 3.3
  holds and, for every non-empty infrared-sensitive set `S` of massless edges,
  `d · loopNumber (G / (E \ S)) − 2 Σ_{e ∈ S} ν_e > 0`; the massless one-loop `n`-gon with unit
  powers at non-exceptional momenta
  satisfies the infrared condition in `d = 4`, the only infrared-sensitive sets being single edges;
  a self-energy insertion on a massless line, which leaves two massless propagators carrying the
  same momentum, violates it in `d = 4`, and this is the standard failure.

### 3.5 The convergence domain

- Statements to prove: for fixed graph, masses and momenta, the set of `(d, ν) ∈ ℝ × ℝ^E` for
  which the integral converges is the intersection of finitely many open half-spaces indexed by
  subgraphs, hence open and convex; for positive masses it is non-empty and contains every point
  with `d < d₀(ν) = min_γ 2 ν(γ) / loopNumber γ`; for the massless tadpole it is empty.

### Examples

- Bubble with unit powers: convergent exactly for `d < 4`; sunrise: `ω = 2d − 6`, with the
  one-loop subgraphs requiring `d < 4`, hence convergent exactly for `d < 3`.
- A graph with `ω(G) < 0` and a divergent subgraph: a bubble inserted in one line of a box in
  `d = 4`. Counterexample-shaped: overall power counting alone does not give convergence.
- A triangle with two massless propagators adjacent to a massless on-shell leg is outside the
  Euclidean non-exceptional hypothesis; the Euclidean statement of 3.4 does not apply, and its
  singularities are `InfraredStructure` Layer 1.
- Counterexample-shaped: the massless propagator squared with zero momentum transfer through an
  inserted massless tadpole — the infrared-sensitive set has `ω_IR ≤ 0`.

### Dependencies

Layers 0–2. `Mathlib.MeasureTheory.Integral.Prod`, `.Integral.DominatedConvergence`,
`Mathlib.Analysis.Calculus.ParametricIntegral`.

---

## Layer 4: dimensional regularisation

References: 't Hooft and Veltman, *Nucl. Phys. B* **44** (1972) 189; Bollini and Giambiagi, *Nuovo
Cim. B* **12** (1972) 20; Speer, *J. Math. Phys.* **9** (1968) 1404 and *Ann. Inst. H. Poincaré A*
**23** (1975) 1; Collins, *Renormalization*, ch. 4; Chetyrkin and Tkachov, *Nucl. Phys. B* **192**
(1981) 159; Tarasov, *Phys. Rev. D* **54** (1996) 6479; Smirnov, ch. 2 and 5.

### 4.1 The integral as a function of a complex dimension

- Definition: for `d ∈ ℂ` and `ν_e ∈ ℂ`, `I_G(d)` is the Schwinger parametric integral of 2.2
  with complex exponents, defined on the *convergence domain* `D_G`, the set of `d` whose real
  part lies in the domain of 3.5 at `Re ν`.
- Statements to prove: on `D_G` the parametric integrand is absolutely integrable, with the bound
  given by the real case; `I_G` is holomorphic on `D_G`, by
  `hasDerivAt_integral_of_dominated_loc_of_deriv_le`; at every natural number `d ∈ D_G` it equals
  the momentum-space integral of 2.1; on `D_G` it also equals the Feynman-parameter form of 2.3;
  it is jointly holomorphic in `d` and each `ν_e` on the corresponding open set.

### 4.2 Meromorphic continuation

- Statements to prove: the one-variable lemma: for `g` smooth on `[0, 1]`, `a ↦ ∫₀¹ t^{a−1} g(t)
  dt` is holomorphic for `Re a > 0` and extends to a meromorphic function on `ℂ` with at most
  simple poles at `a ∈ {0, −1, −2, …}` and residue `g^{(n)}(0)/n!` at `a = −n`; its
  several-variable form for a product of such factors against a function smooth on the closed
  cube; **the continuation theorem** (Speer): for positive masses and fixed `ν` with positive real
  parts, `I_G` extends from `D_G` to a function that is `Meromorphic` on `ℂ` in `d`; its poles lie
  in the set of `d` for which `(d/2) · loopNumber γ − ν(γ)` is a non-negative integer for some
  one-particle-irreducible subgraph `γ`; the order of a pole is at most `loopNumber G`. The
  bound by the length of the longest nested chain of such subgraphs is false, and is not a
  target: two massive tadpoles joined by a bridge have a double pole at `d = 4` with no nested
  pair, because disjoint divergent subgraphs also raise the order. The continuation is unique,
  by the identity theorem; the same statement with massless lines at non-exceptional Euclidean
  momenta, where the pole set additionally contains the infrared values `(d/2) · loopNumber (G /
  (E \ S)) − ν(S) ∈ {0, −1, …}` for infrared-sensitive `S`; meromorphy in each `ν_e` at fixed
  `d`, which is analytic regularisation.

### 4.3 Laurent expansions and the existing records

- Definitions: the Laurent coefficients of `I_G` at a point `d₀`, as a `LaurentSeries ℂ`; with
  `d = regularizedDimension ε = 4 − ε`, the expansion in `ε`; `toLaurentExpansionAtZero`, the term
  of the existing `LaurentExpansionAtZero` built from a function with at most a simple pole at
  `ε = 0`, with `regularPart` the remainder.
- Statements to prove: `meromorphicOrderAt I_G 4 ≥ −loopNumber G` for positive masses; for a
  one-loop graph with positive masses the order is at least `−1`, so `LaurentExpansionAtZero`
  represents it exactly, and `(toLaurentExpansionAtZero I).eval ε = I (4 − ε)` for all
  sufficiently small `ε > 0`; the pole coefficient and the finite part are real for real Euclidean
  momenta, which is what the type of `poleCoeff : ℝ` requires; the remainder tends to zero as `ε
  → 0⁺`, the analytic condition the docstring of `LaurentExpansionAtZero` leaves open; the pole
  coefficient of a one-loop graph is a polynomial in the external momenta and masses of degree
  `ω(G)`; the massless on-shell triangle has order `−2`, so the simple-pole record does not
  represent it — the boundary of the existing type, stated as a theorem.

### 4.4 The properties of dimensional regularisation, as theorems

Each statement is about the continued functions of 4.2 and is proved on a convergence domain and
extended by uniqueness.

- Statements to prove: linearity in the integrand; invariance under a shift of a loop momentum by
  a linear combination of external momenta, which is independence of routing; the scaling law of
  2.5 for complex `d`; covariance under rotations, with the trace of the metric equal to `d`, so
  that the rank-two reduction of 2.4 holds with coefficient `1/d` for complex `d`; iterated
  integration: if `γ` is a one-particle-irreducible subgraph whose integral is `c(d) · (q²)^{a(d)}`
  in the momentum through it, then `I_G` equals the integral of `G / γ` with the corresponding
  edge of complex power, so nested bubbles are evaluated one loop at a time; commutation with
  differentiation in external momenta and masses.
- **Scaleless integrals.** For the massive tadpole, `I(d, m) = Γ(ν − d/2) / Γ(ν) · (m²)^{d/2 −
  ν}`, and for `Re d > 2 Re ν` the limit `m → 0⁺` is zero. The dimensionally regularised value of
  a massless integral with empty convergence domain is *defined* as the continuation in `d` of
  the `m → 0⁺` limit of the mass-regulated continuation, taken where that limit exists.
  Statements to prove: the limit exists on a non-empty open set for every massless vacuum graph
  and every massless graph with a self-loop, and is zero there, so those integrals are identically
  zero; the same value is obtained by continuation in the powers `ν_e`; for a massless graph with
  non-empty convergence domain the definition agrees with 4.2.

### 4.5 Integration-by-parts and dimension-shift identities

- Statements to prove: for each loop momentum `k_i` and each vector `q` among the loop and external
  momenta, the integral of `∂/∂k_i^μ (q^μ · integrand)` is zero as an identity among continued
  functions, proved on a convergence domain by the divergence theorem with decaying boundary term
  and extended by 4.2; its expansion as a linear relation among integrals of the same graph and its
  contractions with shifted powers, with coefficients polynomial in `d`, the invariants and the
  powers; the one-loop bubble and triangle relations written out; Lorentz invariance identities;
  **dimension shift**: `I_G(d − 2) = symanzikU G (𝐞⁺) I_G(d)`, where the operator `𝐞_e⁺` substituted
  for the variable `X_e` raises `ν_e` by one and multiplies by `ν_e`, read off the Schwinger form in
  the normalisation of Convention 7.
- Definition and statements: `IsReductionOf`, the proposition that the continued function of an
  integrand equals a stated linear combination of continued functions of others with coefficients
  rational in `d` and the invariants. The existing `ScalarIntegrandReduction integrand target`,
  which has no fields, is given this meaning by a theorem producing it from `IsReductionOf`, and the
  three reductions recorded in
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation` — of the gauge-boson,
  ghost and fermion self-energy integrands to their scalar masters — are proved in that sense.

### 4.6 One-loop closed forms and the pole coefficients

All in the normalisation of Convention 7 and with `d = 4 − ε`.

- Statements to prove: the tadpole with unit power, `A(d, m) = Γ(1 − d/2) (m²)^{d/2 − 1}`,
  `Meromorphic` in `d`, with `A(4 − ε, m) = m² (−2/ε + γ − 1 + log m²) + O(ε)`; the massless
  bubble with unit powers, `B(d, p²) = Γ(2 − d/2) Γ(d/2 − 1)² / Γ(d − 2) · (p²)^{d/2 − 2}`, with
  `B(4 − ε, p²) = 2/ε − γ + 2 − log p² + O(ε)`; the massive bubble as the one-parameter integral
  `Γ(2 − d/2) ∫₀¹ (x(1−x) p² + x m₁² + (1−x) m₂²)^{d/2 − 2} dx`, with pole `2/ε` and finite part
  `−γ − ∫₀¹ log(x(1−x)p² + x m₁² + (1−x) m₂²) dx`; here `γ` is `Real.eulerMascheroniConstant`.
- **The records.** `(masslessBubble 2).poleCoeff` is the residue at `ε = 0` of `B(4 − ε, p²)`;
  `(tadpole (−2 m²) f).poleCoeff` and `(massiveBubble 2 f).poleCoeff` likewise, and with `f` the
  finite parts above the records satisfy `(…).eval ε − I(4 − ε) → 0` as `ε → 0⁺`. For
  `masslessBubble`, whose record has finite part zero, the statement is about the pole only, and
  the target includes the term of `ScalarMasterIntegral` with the correct finite part `2 − γ −
  log p²` built by 4.3. The pole coefficients of the three one-loop self-energies in covariant
  gauge, with the numerators of Layer 6, are computed and shown equal to the coefficients that
  `EpsilonEridani.QFT.QCD.OneLoopCounterterms` takes as weights.

### 4.7 Normalisations

- Definitions and statements: the constants relating `d^d k / π^{d/2}` to `d^d k / (2π)^d`
  (`(4π)^{−d/2}` per loop) and to the `\overline{\rm MS}` measure (`(4π)^{−d/2} · (4π)^{ε/2}
  e^{−γ ε/2}` per loop in `d = 4 − ε`, times `μ^{ε}`); the lemma that changing between them
  multiplies a simple-pole expansion `c/ε + f` by `1 + a ε + O(ε²)` and shifts the finite part by
  `a c`; the conversion applied to 4.6. `Renormalization` Layer 2 consumes these.

### Examples

- The two-loop sunrise vacuum graph with one mass, evaluated by 4.4's iterated integration.
- The one-loop bubble with powers `(2, 1)` obtained from the unit-power bubble by an
  integration-by-parts identity of 4.5 and independently by a mass derivative (2.5).
- The massless bubble inserted in a massless bubble: a product of two Gamma-function ratios, with
  a double pole at `d = 4`, an instance of the order bound of 4.2 being attained.
- Counterexample-shaped: `∫ d^d k / π^{d/2} |k|^{−4}`: its ultraviolet and infrared poles at `d =
  4` cancel in the continued value `0`. A statement that "the integral has no divergence" is
  false in the sense of 3.4 and true in the sense of 4.4; the two are different propositions.
- Counterexample-shaped: a formal manipulation exchanging the `ε → 0` limit with the `m → 0`
  limit of the tadpole gives a different answer; the order is fixed by the definition in 4.4.

### Dependencies

Layers 0–3. `Mathlib.Analysis.Meromorphic.Basic`, `.Meromorphic.Order`, `.Meromorphic.Complex`,
`Mathlib.Analysis.Analytic.Uniqueness`, `Mathlib.Analysis.MellinTransform`,
`Mathlib.Analysis.SpecialFunctions.Gamma.Basic`, `.Gamma.Beta`, `.Gamma.Deriv`,
`Mathlib.NumberTheory.Harmonic.EulerMascheroni`, `Mathlib.RingTheory.LaurentSeries`,
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`, `.OneLoopScalars`,
`.TensorReduction`, `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation`,
`EpsilonEridani.QFT.QCD.OneLoopCounterterms`.

---

## Layer 5: Minkowski signature

References: Zimmermann, *Commun. Math. Phys.* **11** (1968) 1; Hepp (1966); Speer, *Generalized
Feynman Amplitudes*, ch. 3; Itzykson and Zuber, §6-2 and §6-3; Nakanishi, ch. 3.

### 5.1 The regulated Minkowski integrand

A product of denominators `m² − ⟪k, k⟫ₘ − iε` is not absolutely integrable over Minkowski space
for fixed `ε > 0`, because the denominators are bounded by `1/ε` on non-compact hyperboloids.

- Definitions: the covariant denominator, `−regularizedDenominator (massShellPolynomial k m) ε`
  in the existing vocabulary; Zimmermann's denominator `m² − ⟪k, k⟫ₘ − iε (|𝐤|² + m²)`, with
  `|𝐤|²` the existing `spatialNormSq`; the Minkowski integral `I_G^M(ε)` with Zimmermann's
  denominators and measure `d^d k / (i π^{d/2})` per loop.
- Statements to prove: for `ε > 0`, Zimmermann's denominator is bounded below in modulus by
  `c(ε) (k₀² + |𝐤|² + m²)`; hence, for positive masses, `I_G^M(ε)` converges absolutely exactly
  under the condition of 3.3 (Zimmermann's power-counting theorem); it is independent of routing;
  it is smooth in the external momenta.

### 5.2 Wick rotation

- Statements to prove: for external momenta with real Euclidean continuation — every partial sum
  of external momenta space-like or zero in a common frame with vanishing energy components —
  `lim_{ε → 0⁺} I_G^M(ε)` exists and equals the Euclidean integral of 2.1 at `p_E² = −⟪p, p⟫ₘ`,
  with the factor of `i` per loop absorbed by the measure of Convention 7; the proof by rotating
  the Schwinger parameters, and independently for one loop by rotating the energy contour with
  `Mathlib.Analysis.Complex.CauchyIntegral`; the single-propagator instance in `d = 1` as the
  base case.

### 5.3 The Minkowski parametric representation and analyticity in the invariants

- Definitions: `symanzikFMink`, a polynomial in `α` whose coefficients are affine in the
  Minkowski invariants `s_I = ⟪p_I, p_I⟫ₘ` of the partial sums; the *complexified* integral as a
  function of complex invariants, by the Feynman-parameter formula of 2.3 with `F` replaced by
  `symanzikFMink`.
- Statements to prove: the parametric formula holds for `I_G^M(ε)` with `F_M − iε · (\text{a
  positive form})`; the complexified integral is holomorphic on the open set of invariants for
  which `symanzikFMink` has no zero on the closed simplex, and coincides with the Euclidean
  integral on the Euclidean region; **the two-point function**: for a connected graph with two
  legs and positive masses, `symanzikFMink = U · Σ m_e² α_e − s · F₀'` with `F₀' ≥ 0`, the
  function is holomorphic in `s ∈ ℂ \ [s_th, ∞)`, and `s_th = (\min_C Σ_{e ∈ C} m_e)²` over edge
  cuts `C` separating the two legs — the lowest normal threshold, proved as the infimum of `U Σ
  m² α / F₀'` over the simplex; real-analyticity and the Schwarz reflection `I(\bar s) =
  \overline{I(s)}` below threshold.

Singularities other than the lowest normal threshold are `InfraredStructure` Layer 1.

### 5.4 Boundary values as tempered distributions

- Statements to prove: the single-denominator limit: as `ε → 0⁺`, `(x + iε)⁻¹` converges in
  `𝓢'(ℝ, ℂ)` to the principal value minus `iπ δ`, with the principal value identified with
  `TauCeti.Analysis.Contour.PerWindow.CPV` on a straight contour and the statement related to the
  existing `rightLimitAtZero` away from `x = 0`; its covariant form for one propagator in
  momentum space; **existence of the boundary value**: for positive masses and under the
  convergence condition of 3.3, `lim_{ε → 0⁺} I_G^M(ε)` exists in `𝓢'` of the independent external
  momenta, is invariant under the proper orthochronous Lorentz group, and is independent of
  whether the covariant or Zimmermann's denominators are used; on the open set of 5.3 it is the
  holomorphic function restricted to real invariants; for the two-point function it is the
  boundary value from the upper half `s`-plane, and its imaginary part is supported in `s ≥ s_th`;
  the dimensionally continued version: for `d` in the convergence domain the boundary value is
  holomorphic in `d` as a distribution-valued function, and its meromorphic continuation exists
  with the pole set of 4.2.

### Examples

- The massive bubble in `d = 4 − ε`: finite part `−γ − ∫₀¹ log(m² − x(1−x) s − i0) dx`, with
  imaginary part `π √(1 − 4m²/s)` for `s > 4m²` and zero below, and real part matching the
  Euclidean value at `s < 0`.
- The massless bubble: `2/ε − γ + 2 − log(−s − i0)`, imaginary part `π` for `s > 0`.
- The triangle with equal masses below its normal threshold: holomorphic, real.
- Counterexample-shaped: the pointwise limit of the bubble at `s = 4m²` in `d = 2` does not
  exist; the distributional limit does.
- Counterexample-shaped: the covariant-`iε` bubble integrand at fixed `ε` in `d = 3` is not
  absolutely integrable, while Zimmermann's is; both have the same boundary value.

### Dependencies

Layers 0–4. `Mathlib.Analysis.Distribution.SchwartzSpace.Basic`,
`Mathlib.Analysis.Distribution.TemperedDistribution`, `Mathlib.Analysis.Complex.CauchyIntegral`,
`Mathlib.Analysis.Analytic.Uniqueness`, `TauCeti.Analysis.Contour.PerWindow.CPV`,
`TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff`, `Physlib.Mathematics.Distribution.Basic`,
`Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`,
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`.

---

## Layer 6: Feynman rules

References: Wick, *Phys. Rev.* **80** (1950) 268; Itzykson and Zuber, ch. 4 and 6; 't Hooft and
Veltman, *Diagrammar*, CERN 73-9 (1973); Collins, *Renormalization*, ch. 2–4; Breitenlohner and
Maison, *Commun. Math. Phys.* **52** (1977) 11.

### 6.1 A perturbative theory as data

- Definitions: a *perturbative theory* over a Physlib `FieldSpecification`: for each field a
  propagator (a numerator polynomial in the momentum over a denominator of 5.1, with index
  structure), and a finite list of interaction vertices, each with a multiset of fields, a
  coupling order and a vertex factor polynomial in the incident momenta; a *labelled Feynman
  graph* of the theory: a Feynman graph with each edge labelled by a field (with an orientation
  for a charged field), each vertex by an interaction whose field multiset matches the incident
  half-edges, and each leg by a field.
- Statements to prove: finiteness of the set of labelled graphs with given legs and coupling
  order, up to isomorphism; the relation between coupling order, loop number and number of legs
  for a theory with one coupling; the forgetful map to `TopologyGraph` of 0.8 commutes with
  external-leg permutations.

### 6.2 From Wick contractions to graphs

Physlib's `wicks_theorem` expresses a time-ordered product of field operators as a sum over
`WickContraction`s; the vacuum expectation value keeps the contractions with `IsFull`.

- Definitions: for a product of `n` interaction monomials and `r` external fields, the map from
  full Wick contractions that pair only fields a propagator connects to labelled Feynman graphs
  with `n` vertices and `r` legs; the group acting on contractions by permuting the `n`
  interaction monomials and the identical fields within each monomial.
- Statements to prove: the map is constant on orbits; **the symmetry-factor theorem**: the number
  of contractions mapping to a given labelled graph is `(n! · ∏_v (\text{vertex symmetry order}))
  / (\text{half-edge automorphism order of 0.8})`, by orbit–stabiliser; consequently the `n`-th
  order term of the Dyson expansion, with its `1/n!` and the vertex normalisations, is the sum
  over isomorphism classes of labelled graphs of the graph value divided by the symmetry factor;
  for fermions, the sign of a contraction (Physlib's Koszul sign) depends only on the graph and
  is `(−1)` to the number of closed fermion cycles times the sign of the external-leg permutation.
- The amplitude of a theory with given legs is then *defined* as the power series in the coupling
  whose coefficients are these finite sums, with graph values the integrals of Layers 2–5
  (Convention 15).

### 6.3 Connected, amputated and one-particle-irreducible sums

- Statements to prove, as identities of formal power series weighted by symmetry factors: the sum
  over all graphs is the exponential of the sum over connected graphs; vacuum graphs factor out of
  every sum with legs; a connected graph is uniquely a tree of one-particle-irreducible blocks
  (0.5), so the connected two-point sum is the geometric series in the one-particle-irreducible
  self-energy, and the connected `n`-point sums are trees of one-particle-irreducible vertices
  joined by full propagators — the combinatorial Legendre transform; amputation of external
  propagators as an operation on graph sums.

### 6.4 Scalar, QED and QCD rules

- Definitions: the theories `φ³` and `φ⁴`; QED and QCD in a covariant gauge with parameter `ξ`,
  with the gauge-boson propagator `−i [g_{μν} − (1 − ξ) k_μ k_ν / (k² + iε)] / (k² + iε)` times
  the colour delta, the fermion propagator `i (\slashed{k} + m) / (k² − m² + iε)`, the ghost
  propagator, and the three-gluon, four-gluon, quark–gluon and ghost–gluon vertices with
  structure constants and generators from `QFT.QCD.SUNStructureConstants` and `.SUNGenerators`.
- Statements to prove: the scalar denominators of these propagators are the existing
  `gluonPropagator`, `quarkPropagator` and `ghostPropagator`; the existing
  `gluonPropagatorTensor`, `quarkPropagatorLifted` and the vertex data of `GaugeFeynmanRules` are
  related to the full expressions by explicit lemmas, and `qcdStandardRules g` is the coupling
  assignment of the QCD theory defined here; the rules are covariant under Lorentz
  transformations and global colour rotations; Bose symmetry of the three- and four-gluon
  vertices; the Jacobi identity in the form the four-gluon vertex needs; transversality of the
  three-gluon vertex contracted with a momentum up to terms that vanish on shell. The
  Slavnov–Taylor identities that these contractions feed are `Renormalization` Layer 4.

### 6.5 Numerator algebra in `d` dimensions

- Definitions: the `d`-dimensional metric and Dirac algebra as an algebra over the ring of
  polynomials in `d`: generators `γ_μ` with `{γ_μ, γ_ν} = 2 g_{μν}`, `g^μ_μ = d`, and a trace
  normalised by `tr 1 = 4`; the 't Hooft–Veltman `γ₅`, anticommuting with the four-dimensional
  `γ_μ` and commuting with the rest.
- Statements to prove: the specialisation at `d = 4` is the Dirac algebra of
  `Physlib.Relativity.CliffordAlgebra`; the trace of a product of `γ` matrices is determined by
  the relations and is a polynomial in `d` and the metric, with the two- and four-matrix traces
  and the contraction identities `γ^μ γ_μ = d`, `γ^μ γ_ν γ_μ = (2 − d) γ_ν`, `γ^μ γ_ν γ_ρ γ_μ = 4
  g_{νρ} − (4 − d) γ_ν γ_ρ` explicit; no `γ₅` that anticommutes with all `γ_μ` and has `tr(γ₅ γ_μ
  γ_ν γ_ρ γ_σ) ≠ 0` exists for `d ≠ 4`, which is why the 't Hooft–Veltman definition is used; the
  colour factor of a labelled graph is a polynomial in the Casimirs, with the one-loop
  self-energy and vertex factors `C_F`, `C_A`, `T_F n_f` derived from
  `QFT.QCD.CasimirDerivation`.

### 6.6 The value of a graph

- Statements to prove: the value of a labelled graph is its colour factor times a finite sum of
  tensor integrals, each reduced by 2.4 and 4.4 to scalar integrals of the same graph and its
  contractions; the degree of divergence of a QCD graph in `d = 4` in terms of its legs, `ω = 4 −
  n_g − (3/2) n_q − n_{gh}` for gluon, quark and ghost legs, from 3.1 and 0.1; the one-loop
  gauge-boson, ghost and fermion self-energies in covariant gauge as explicit combinations of the
  tadpole and bubble of 4.6, giving the pole coefficients claimed in 4.6; the gauge-boson
  self-energy is transverse at one loop.

### Examples

- `φ⁴` at second order: the three graphs of the four-point function with their symmetry factors
  `1/2`, and the sunrise self-energy with `1/6`, counted from contractions and from automorphisms.
- The one-loop QED vacuum polarisation: the trace, the tensor reduction, transversality, and the
  pole coefficient of the transverse structure `p² g_{μν} − p_μ p_ν` in the normalisation of
  Convention 7.
- The one-loop quark self-energy in covariant gauge and its `ξ`-dependence.
- Counterexample-shaped: the gluon self-energy without the ghost graph is not transverse.
- Counterexample-shaped: the trace `tr(γ₅ γ_μ γ_ν γ_ρ γ_σ)` computed with a fully anticommuting
  `γ₅` and cyclicity gives a multiple of `(d − 4)` times itself, forcing zero.

### Dependencies

Layers 0–5. `Physlib.QFT.PerturbationTheory.WickAlgebra.WicksTheorem`,
`.WickAlgebra.WicksTheoremNormal`, `Physlib.QFT.PerturbationTheory.WickContraction.Basic`,
`.WickContraction.IsFull`, `Physlib.QFT.PerturbationTheory.FieldSpecification.Basic`,
`Physlib.QFT.PerturbationTheory.Koszul.KoszulSign`, `Physlib.Relativity.CliffordAlgebra`,
`Mathlib.RingTheory.PowerSeries.Basic`,
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`,
`.FeynmanDiagrams.YangMillsGaugeData`, `.FeynmanDiagrams.OneLoopEvaluation`,
`EpsilonEridani.QFT.QCD.SUNStructureConstants`, `.SUNGenerators`, `.CasimirDerivation`,
`.RepresentationColor`.

---

## Layer 7: cut graphs and unitarity

References: Cutkosky, *J. Math. Phys.* **1** (1960) 429; Veltman, *Physica* **29** (1963) 186;
't Hooft and Veltman, *Diagrammar*, §6; Veltman, *Diagrammatica*, ch. 8; Itzykson and Zuber, §6-3.

### 7.1 Cut graphs

- Definitions: a *cut* of a Feynman graph as a set `S ⊆ V(G)` of vertices (the side of the
  amplitude) with complement the side of the conjugate amplitude; its cut edges are `Graph.edgeCut
  G S`; a cut is *admissible* for a partition of the legs into incoming and outgoing if the
  incoming legs attach to `S`, the outgoing to the complement, and both induced subgraphs are
  connected to their legs; a *cut graph* is a graph with an admissible cut.
- Statements to prove: the cut edges of an admissible cut form an edge cut (`Graph.IsEdgeCut`)
  separating incoming from outgoing legs; the two sides are Feynman graphs whose legs are the
  original legs together with the cut edges; a one-particle-irreducible two-point graph has at
  least two cut edges in every admissible cut; finiteness of the set of cuts.

### 7.2 The largest-time equation

- Definitions: the position-space propagator of a scalar field as a tempered distribution, its
  decomposition `Δ_F(x) = θ(x⁰) Δ⁺(x) + θ(−x⁰) Δ⁻(x)` with `Δ^±` the Fourier transforms of
  `2π θ(±k⁰) δ(k² − m²)`; for a subset `S` of vertices ("circled" vertices), the circled graph
  value, in which an edge between two uncircled vertices carries `Δ_F`, between two circled
  vertices its complex conjugate, and between a circled and an uncircled vertex `Δ^±` directed
  towards the circled one, with a factor `−1` per circled vertex.
- Statements to prove: `Δ⁺ + Δ⁻`-identities following from the decomposition, in particular
  `Δ_F + \overline{Δ_F} = Δ⁺ + Δ⁻`; **the largest-time equation**: for a graph value regularised
  as in 5.1 and tested against Schwartz functions of the vertex positions, the sum over all
  `2^{|V|}` subsets `S` of the circled values is zero; its proof by pairing each `S` with `S`
  with the vertex of largest time toggled; the momentum-space form, in which `Δ^±` on an edge
  from an uncircled to a circled vertex forces positive energy flow in that direction, and the
  consequent vanishing of every term in which the circled set is not the future side of an
  admissible cut for the given external energies.

### 7.3 The Cutkosky rules

- Statements to prove: for a graph with incoming and outgoing legs and positive masses, let `A_G` be
  the boundary value of 5.4 in Veltman's convention — a factor `i` per vertex and `−i / (m² − k² −
  iε)` per propagator — with the loop measure of Convention 7 and its explicit conversion constant;
  then `A_G + \overline{A_G} = −Σ_{\text{admissible cuts } S} A_S ⋆ \overline{A_{S^c}}`, where `⋆`
  denotes integration over the cut momenta with each cut propagator replaced by `2π θ(k⁰) δ(k² −
  m²)`; the cut integral is an integral against the Lorentz-invariant phase-space measure of
  `EventGeneration` Layer 0.3 for the cut lines, times the stated power of `2π`; for the two-point
  function the right side is supported in `s ≥ s_th` and gives the imaginary part of 5.4; the sign
  and factor conventions relating `A_G`, the scattering-matrix element and the statement `2
  \operatorname{Im}` are fixed by an explicit lemma for the bubble.

### 7.4 Perturbative unitarity

- Statements to prove: for a theory of 6.1 with real couplings and scalar or fermion fields, the
  sum over labelled graphs of the Cutkosky identities, with symmetry factors, gives order by
  order `T − T^† = i T^† T` as an identity of power series, where the product on the right is the
  phase-space integral over intermediate states; the combinatorial lemma behind it: the symmetry
  factor of a cut graph, counted with the symmetry factors of its two sides and the factorial of
  identical cut lines, equals that of the uncut graph times the number of cuts in its orbit; for
  gauge theories in covariant gauge, the same identity holds with the sum over intermediate
  states running over all four gluon polarisations and ghosts. The restriction of that sum to
  physical polarisations uses the Slavnov–Taylor identities and is `Renormalization` Layer 4.

### 7.5 Cut-graph sums with a measurement function

- Definitions: a *measurement function* as a bounded measurable function of the cut momenta,
  symmetric under permutations of identical lines; the *weighted cut-graph sum* of a forward
  graph: the sum over admissible cuts of the cut integral against the measurement function.
- Statements to prove: with measurement function `1`, the weighted sum is the right side of 7.3,
  hence the discontinuity of the forward graph — the optical theorem at graph level; **the
  subgraph cancellation**: if a subgraph `γ` of a cut graph is attached to the rest only through
  vertices on which the measurement function does not depend on how `γ` is cut, the sum over all
  positions of the cut through `γ`, including the two in which `γ` lies entirely on one side, is
  zero — the largest-time equation applied to `γ`; the dimensionally regularised version of every
  statement in this layer, for `d` in the convergence domain and by continuation.

Weighted cut-graph sums are the objects on which `InfraredStructure` Layers 4 and 6 and
`FactorizationTheorems` state their cancellations.

### Examples

- The bubble: one admissible cut, two-body phase space, `π √(1 − 4m²/s)` in the normalisation of
  5.4, checked against the imaginary part computed there.
- The triangle: the cut in the channel of one external invariant, and the absence of a cut in a
  channel below its threshold.
- A two-loop self-energy with a bubble insertion: the two-particle and three-particle cuts and
  their sum.
- Counterexample-shaped: a single cut of a QCD self-energy with only transverse gluon
  polarisations on the cut is not the discontinuity; the ghost cut is needed.
- Counterexample-shaped: with a measurement function that distinguishes the cuts of `γ`, the
  subgraph cancellation of 7.5 fails; the hypothesis is used.

### Dependencies

Layers 0–6. `Mathlib.Combinatorics.Graph.Connected.EdgeCut`,
`Mathlib.Analysis.Distribution.TemperedDistribution`,
`Mathlib.Analysis.Distribution.SchwartzSpace.Fourier`,
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`. From `EventGeneration`:
the Lorentz-invariant phase-space measure of its Layer 0.3.

---

## Dependency graph

```
   Mathlib Graph, Matroid, Matrix         Physlib Wick theorem      EventGeneration L0.3
            |                                     |                        |
            v                                     |                        |
  Layer 0  Feynman graphs, cycle rank,            |                        |
           trees, routing, symmetry factor        |                        |
            |                                     |                        |
            v                                     |                        |
  Layer 1  Symanzik polynomials,                  |                        |
           matrix-tree, factorisation             |                        |
            |                                     |                        |
            v                                     |                        |
  Layer 2  Euclidean integral, Schwinger          |                        |
           and Feynman parameters                 |                        |
            |                                     |                        |
            v                                     |                        |
  Layer 3  power counting, Hepp sectors,          |                        |
           Weinberg's theorem                     |                        |
            |                                     |                        |
            v                                     |                        |
  Layer 4  dimensional regularisation,            |                        |
           continuation, Laurent records, IBP     |                        |
            |                                     |                        |
            v                                     |                        |
  Layer 5  Minkowski signature, Wick rotation,    |                        |
           boundary values                        |                        |
            |                                     |                        |
            v                                     v                        |
  Layer 6  Feynman rules, symmetry-factor theorem, QED and QCD             |
            |                                                              |
            v                                                              v
  Layer 7  cut graphs, largest-time equation, Cutkosky rules, cut-graph sums
            |
            +--------------------+-------------------------+
            v                    v                         v
     Renormalization      InfraredStructure       FactorizationTheorems
```

Layers 0 and 1 are combinatorics and algebra and need no analysis. Layer 2 needs only measure
theory and the Gamma function. Layer 3 needs Layer 1.5 and Layer 2.2. Layer 4 needs Layer 3 for
the sector form and Mathlib's meromorphic functions. Layer 5 needs Layer 4 only for its last
statement and can otherwise be read after Layer 3. Layer 6 needs Layer 0.8 for the symmetry
factor and Layers 2–5 for graph values. Layer 7 needs Layers 5 and 6 and, for the phase-space
form of the cut integral, `EventGeneration`.

## Acceptance examples

The roadmap is complete when the following are statements in EpsilonEridani with proofs:

1. `Graph.Connected` and `Graph.contract` for Mathlib's `Graph`, with `loopNumber G = loopNumber
   γ + loopNumber (G / γ)` and the characterisation of bridges by component count.
2. The cycle matroid of a finite multigraph as a `Matroid`, with deletion and contraction
   commuting with `Matroid.delete` and `Matroid.contract`, and its dual rank equal to
   `loopNumber`.
3. The Cauchy–Binet formula and the weighted matrix-tree theorem for multigraphs, with its
   reduction to `SimpleGraph.lapMatrix` on `Graph.ofSimpleGraph`.
4. `symanzikU G` homogeneous of degree `loopNumber G`, equal to the determinant of the loop
   matrix, satisfying deletion–contraction, and factorising as `λ^{loopNumber γ} (U_γ U_{G/γ} +
   O(λ))` under rescaling of a subgraph; the bubble, triangle and sunrise polynomials computed.
5. The unimodularity of loop-basis changes and the resulting independence of the Euclidean
   integral of routing.
6. The Schwinger representation as an identity of lower integrals with no convergence hypothesis,
   and the Feynman-parameter representation with the Cheng–Wu theorem.
7. Weinberg's theorem for positive masses as an equivalence: absolute convergence if and only if
   every one-particle-irreducible subgraph has negative degree of divergence; with the
   box-with-bubble counterexample.
8. The convergence criterion for massless lines at non-exceptional momenta, and the proof that
   the massless tadpole has empty convergence domain.
9. The continuation theorem: `I_G` is `Meromorphic` in `d`, with its pole set contained in the
   stated union over subgraphs and its pole order at most `loopNumber G`.
10. Translation invariance, scaling, rotation covariance with `g^μ_μ = d`, iterated integration,
    and the vanishing of scaleless integrals, each as a theorem about the continued functions.
11. The integration-by-parts identities and the dimension-shift relation, and the three
    self-energy reductions of `OneLoopEvaluation` as instances of `IsReductionOf`.
12. The closed forms of the tadpole and the massless and massive bubble, their expansions at `d =
    4 − ε` with `Real.eulerMascheroniConstant`, and the theorems that `(masslessBubble
    2).poleCoeff`, `(tadpole (−2m²) f).poleCoeff` and `(massiveBubble 2 f).poleCoeff` are the
    residues of the actual integrals, with terms of `LaurentExpansionAtZero` whose `eval` agrees
    with the integral for small `ε > 0`.
13. Wick rotation, and holomorphy of the two-point function of any graph in `s ∈ ℂ \ [s_th, ∞)`
    with `s_th` the squared minimal cut mass.
14. Existence of the `ε → 0⁺` boundary value in `𝓢'`, and for the bubble its imaginary part `π
    √(1 − 4m²/s) θ(s − 4m²)`.
15. The symmetry-factor theorem from Physlib's full Wick contractions, with the `φ⁴`
    second-order examples, and the proof that the `symmetryFactor` of the enumerated one-loop
    `TopologyGraph`s is the half-edge automorphism order.
16. The QCD covariant-gauge rules with the existing scalar denominators proved to be theirs, the
    `d`-dimensional contraction identities, the non-existence of an anticommuting `γ₅` with
    non-zero four-matrix trace for `d ≠ 4`, and the one-loop self-energy pole coefficients equal
    to the weights consumed by `QFT.QCD.OneLoopCounterterms`.
17. The largest-time equation, the Cutkosky rules with the bubble as a checked instance, order-
    by-order unitarity for a scalar theory, and the subgraph cancellation of Layer 7.5 with the
    counterexample showing its hypothesis is used.

## References

- G. Kirchhoff, "Ueber die Auflösung der Gleichungen, auf welche man bei der Untersuchung der
  linearen Vertheilung galvanischer Ströme geführt wird", *Ann. Phys. Chem.* **72** (1847) 497.
- G. C. Wick, "The evaluation of the collision matrix", *Phys. Rev.* **80** (1950) 268.
- S. Weinberg, "High-energy behavior in quantum field theory", *Phys. Rev.* **118** (1960) 838.
- R. E. Cutkosky, "Singularities and discontinuities of Feynman amplitudes", *J. Math. Phys.*
  **1** (1960) 429.
- M. Veltman, "Unitarity and causality in a renormalizable field theory with unstable
  particles", *Physica* **29** (1963) 186.
- K. Hepp, "Proof of the Bogoliubov–Parasiuk theorem on renormalization", *Commun. Math. Phys.*
  **2** (1966) 301.
- W. Zimmermann, "The power counting theorem for Minkowski metric", *Commun. Math. Phys.* **11**
  (1968) 1.
- E. R. Speer, "Analytic renormalization", *J. Math. Phys.* **9** (1968) 1404.
- E. R. Speer, *Generalized Feynman Amplitudes*, Annals of Mathematics Studies 62, Princeton
  University Press (1969).
- N. Nakanishi, *Graph Theory and Feynman Integrals*, Gordon and Breach (1971).
- G. 't Hooft and M. Veltman, "Regularization and renormalization of gauge fields", *Nucl. Phys.
  B* **44** (1972) 189.
- C. G. Bollini and J. J. Giambiagi, "Dimensional renormalization: the number of dimensions as a
  regularizing parameter", *Nuovo Cim. B* **12** (1972) 20.
- G. 't Hooft and M. Veltman, "Diagrammar", CERN Yellow Report 73-9 (1973).
- E. R. Speer, "Ultraviolet and infrared singularity structure of generic Feynman amplitudes",
  *Ann. Inst. H. Poincaré A* **23** (1975) 1.
- J. H. Lowenstein and W. Zimmermann, "The power counting theorem for Feynman integrals with
  massless propagators", *Commun. Math. Phys.* **44** (1975) 73.
- P. Breitenlohner and D. Maison, "Dimensional renormalization and the action principle",
  *Commun. Math. Phys.* **52** (1977) 11.
- G. Passarino and M. Veltman, "One-loop corrections for e⁺e⁻ annihilation into μ⁺μ⁻ in the
  Weinberg model", *Nucl. Phys. B* **160** (1979) 151.
- C. Itzykson and J.-B. Zuber, *Quantum Field Theory*, McGraw-Hill (1980).
- K. G. Chetyrkin and F. V. Tkachov, "Integration by parts: the algorithm to calculate
  β-functions in 4 loops", *Nucl. Phys. B* **192** (1981) 159.
- J. C. Collins, *Renormalization*, Cambridge University Press (1984).
- H. Cheng and T. T. Wu, *Expanding Protons: Scattering at High Energies*, MIT Press (1987).
- J. G. Oxley, *Matroid Theory*, Oxford University Press (1992).
- M. Veltman, *Diagrammatica: The Path to Feynman Diagrams*, Cambridge University Press (1994).
- O. V. Tarasov, "Connection between Feynman integrals having different values of the space-time
  dimension", *Phys. Rev. D* **54** (1996) 6479.
- V. A. Smirnov, *Evaluating Feynman Integrals*, Springer Tracts in Modern Physics 211 (2004).
- C. Bogner and S. Weinzierl, "Feynman graph polynomials", *Int. J. Mod. Phys. A* **25** (2010)
  2585.
- S. Weinzierl, *Feynman Integrals*, Springer (2022).

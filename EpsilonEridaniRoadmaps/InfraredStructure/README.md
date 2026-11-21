# Roadmap: infrared structure of perturbative amplitudes: pinch surfaces, power counting, and the soft and collinear approximations

The long-distance behaviour of Feynman integrals with massless lines: where their singularities
are, how strongly each configuration of nearly on-shell lines contributes, which contributions
cancel in inclusive sums, and how the ones that do not cancel are approximated by Wilson-line
matrix elements with a controlled remainder. This is the machinery that every all-orders
factorisation argument uses and that no process-specific roadmap in the collection builds.

The development runs in one direction. First the light-cone kinematics of a loop momentum and
the notion of a *scaling*: a triple of exponents saying how the three light-cone components of a
momentum shrink with a small parameter. Then the analytic input, which is independent of any
power counting: an integral over a real domain is analytic in its external parameters unless the
integration contour is pinched between singularities of the integrand, the pinch condition is the
set of Landau equations, and for physical-region solutions those equations are equivalent to the
existence of a classical spacetime picture of the process. Then the combinatorial consequence
for a massless gauge theory: every physical pinch surface is described by a reduced graph with
hard, jet and soft subgraphs, and for each class of process the admissible reduced graphs form a
finite, enumerable set. Then infrared power counting, which assigns to each reduced graph a
degree of divergence and singles out the *leading regions*, and the cancellation theorems that
remove infrared sensitivity from sufficiently inclusive quantities. Then the approximations
valid in each leading region, the Ward identities that turn the approximated subgraphs into
Wilson lines, and the nested subtraction that assembles the regions into an identity with a
power-suppressed remainder. Then the Glauber region, where the soft approximation fails, the
contour deformation that rescues it, the obstruction to that deformation, and the cancellation
of the obstruction in sums over final-state cuts. Finally the hard, jet and soft functions as
operator matrix elements, their rapidity divergences, and one process carried through to the
end: the Sudakov form factor, factorised to all orders, with the Collins–Soper equation derived
from the operator definitions.

Nothing here is specific to a hadronic process. The theorems are about a graph, its external
kinematics and a gauge choice; they quantify over graphs, and "to all orders" always means "for
every graph", never a statement about the sum of the perturbation series. Parton densities,
fragmentation functions and cross sections do not appear. `FactorizationTheorems` instantiates
these results process by process; this roadmap is what it instantiates.

The application the roadmap is built towards is that the four hypotheses which
`TransverseMomentumDistributions` Layer 2.4 names and does not prove — completeness of the
region decomposition, validity of the eikonal approximation for spectator interactions,
cancellation of the Glauber region, and the power counting — become instances of general
theorems with stated hypotheses, and that the same theorems serve inclusive deep-inelastic
scattering, annihilation, Drell–Yan and hard exclusive processes without being reproved. The
arguments in the literature for several of these statements are diagrammatic and all-orders in
form but are not written at theorem level. For each such statement this roadmap gives the precise
theorem that is the target, says which parts of the published argument are already rigorous
mathematics and which are made precise here, and never records the conclusion as a field or an
instance that could be supplied without proof.

## Scope

Included:

- Light-cone components of loop and external momenta, rapidity, and the action of a longitudinal
  boost on them; scalings as exponent triples; the hard, collinear, soft, ultrasoft and Glauber
  scalings; the virtuality exponent of a scaling; region assignments on the lines of a graph and
  their compatibility with momentum conservation; the scaling of the integration measure and of
  propagator denominators.
- The analyticity theorem for integrals over a real domain under a contour deformation, in one
  and in several integration variables, and its converse form: non-analyticity forces a pinch.
- The Landau equations in parametric form and in momentum form, their equivalence for
  first-type solutions, the necessity theorem, and explicit examples showing that the equations
  are not sufficient.
- The Coleman–Norton theorem: physical-region solutions of the Landau equations correspond
  exactly to assignments of spacetime points to the vertices of the reduced graph.
- Pinch surfaces as sets, reduced graphs as combinatorial data, and regions as scaling
  neighbourhoods, kept as three distinct types; the partial order on pinch surfaces.
- The classification of physical pinch surfaces of a massless theory into hard, jet and soft
  subgraphs for four classes of kinematics: the two-jet form factor, annihilation into hadrons,
  deep-inelastic scattering, and the Drell–Yan process; finiteness and explicit enumeration of
  the admissible reduced graphs at one and two loops for the form factor.
- Infrared power counting: normal and intrinsic coordinates, the infrared degree of a reduced
  graph in a stated gauge and dimension, the convergence and suppression theorem, the
  characterisation of leading regions in a renormalisable gauge theory in four dimensions, and
  the gauge dependence of the counting, including super-leading contributions in covariant
  gauge.
- Infrared cancellation: the abstract Kinoshita–Lee–Nauenberg theorem for degenerate
  perturbation theory, the finiteness of the total annihilation cross section for every graph,
  the all-orders finiteness of infrared-and-collinear-safe weighted cross sections, and the
  abelian soft-photon cancellation for final-state sums.
- The soft and collinear approximations with explicit error bounds, the Grammer–Yennie
  decomposition, the abelian and non-abelian Ward-identity decoupling of scalar-polarised
  collinear gluons from the hard subgraph and of soft gluons from jets, and the resulting
  Wilson-line vertices.
- Region approximators, the nested subtraction, its equivalence with a Möbius inversion on the
  poset of regions, and the remainder theorem; the equivalence with the mode decomposition used
  in soft-collinear effective theory at the level of individual graphs.
- The Glauber region: failure of the soft approximation there, the contour-deformation theorem
  and the sign rule for the resulting Wilson line, the trapped-contour obstruction with an
  explicit graph, light-front time-ordered perturbation theory as far as it is needed, and the
  cancellation of final-state poles in complete sums over cuts.
- Hard, jet and soft functions as operator matrix elements and as sums of region contributions;
  rapidity divergences and their cancellation between the factors; the Sudakov form factor of a
  massless quark factorised for every graph, its evolution equation and its leading-logarithmic
  exponentiation; the derivation of the Collins–Soper equation and of the properties of its
  kernel; and the cut jet, beam and soft functions of inclusive observables with their
  factorised form on cut graphs.

Not included. Graphs, momentum routing, Symanzik polynomials, the parametric representation,
ultraviolet convergence, dimensional regularisation, the `iε` prescription, Feynman rules and the
cutting rules are `FeynmanIntegrals`; this roadmap consumes them and proves nothing about
ultraviolet behaviour. Subtraction of ultraviolet divergences, the renormalisation group,
Slavnov–Taylor and Ward identities as identities among renormalised Green functions, and the
renormalisation of Wilson-line operators including the cusp anomalous dimension are
`Renormalization`; Layer 5 here applies those identities to subgraphs and does not rederive
them. Every statement that names a hadronic process, a parton density or a fragmentation
function — in particular each factorisation theorem and the discharge of the process-specific
hypotheses of the other roadmaps — is `FactorizationTheorems`. The definition of an infrared and
collinear safe observable, jet algorithms, event shapes and the resummation of their logarithms
are `JetsAndEventShapes`; Layer 4 takes its safety predicate as given and proves the all-orders
finiteness that its Layer 0.5 states at one order. The transverse-momentum-dependent
distributions, the three rapidity regulators and the solution of the two-scale evolution
equations are `TransverseMomentumDistributions`; Layer 7 derives the Collins–Soper equation and
stops at the equation. First-order QED corrections to lepton scattering, the photon-mass
regularisation, the Yennie–Frautschi–Suura exponentiation and the structure-function method are
`RadiativeCorrections`; Layer 4 proves that its first-order cancellation statements are
instances of the general theorems and does not restate the exponentiation. The no-emission
probability of a parton shower and the veto algorithm are `EventGeneration`. The high-energy
limit at fixed momentum transfer — rapidity ordering, Reggeisation, the BFKL equation — is
`SmallXAndSaturation`; the Glauber scaling appears here only as the region in which the soft
approximation fails in a hard process. Soft-collinear effective theory as a Lagrangian field
theory — its fields, its power-counted Lagrangian and the renormalisation of its operators — is
not a subject of this roadmap: Layer 5.7 proves the graph-level equivalence of its mode
decomposition with the region subtraction, and that equivalence is the whole of the contact.
Collinear and soft singularities of amplitudes with massive coloured particles in the initial
state are not treated, and no cancellation theorem is claimed for them.

The material belongs in `EpsilonEridani/QFT/PerturbationTheory/Infrared/`, with subdirectories
`Regions/` (Layer 0), `Landau/` (Layers 1 and 2), `PowerCounting/` (Layer 3), `Cancellation/`
(Layer 4), `Approximation/` (Layer 5), `Glauber/` (Layer 6) and `Functions/` (Layer 7). The
several-variable contour-deformation theorem of Layer 1.1 and the theorem of alternatives of
Layer 1.2 are mathematics with no physics in them and belong in
`EpsilonEridani/Mathematics/Analysis/ContourDeformation/` and
`EpsilonEridani/Mathematics/LinearAlgebra/Alternative/` respectively.

## Conventions and coordination with upstream

1. Light-cone components are those of
   `EpsilonEridani.Mathematics.LinearAlgebra.BilinearForm.LightConeBasis`: `v⁺ = n₋ · v`,
   `v⁻ = n₊ · v`, with `n₊ · n₋ = 1`, so that `u · v = u⁺ v⁻ + u⁻ v⁺ + u_T · v_T` and
   `k² = 2 k⁺ k⁻ + k_T · k_T`, the last term being non-positive. Lean names are `plus`, `minus`
   and `transverseProj`. The trap this avoids is the factor of two between this normalisation and
   the one with `v^± = v⁰ ± v³`, which changes every eikonal denominator.
2. A scaling is an exponent triple `(a, b, c)`, meaning `(k⁺, k⁻, |k_T|)` of order
   `Q (lam^a, lam^b, lam^c)`. The words "collinear", "soft", "ultrasoft" and "Glauber" are names
   of specific triples or sets of triples, fixed in Layer 0.2, and a theorem that depends on the
   scaling takes the triple as an argument. The trap this avoids is the word "soft", which in the
   literature denotes `(1, 1, 1)` in some papers and `(2, 2, 2)` in others, with different
   leading terms in the eikonal denominator.
3. The small parameter is the positive real `lam`, and limits are along
   `EpsilonEridani.Particles.Parton.TMD.PowerCorrections.smallRatio`, the filter of positive
   reals tending to zero. The photon mass of `RadiativeCorrections`, which that roadmap writes
   `λ`, is called `photonMass` wherever the two meet. The trap this avoids is one symbol for a
   dimensionless expansion parameter and a dimensionful regulator.
4. A *pinch surface* is a set of points in the integration domain of one graph at fixed external
   momenta; a *reduced graph* is a labelling of the lines of the graph as hard, jet-`i` or soft;
   a *region* is a family of neighbourhoods of a pinch surface indexed by `lam`. They are three
   types with maps between them, and no statement identifies two of them. The trap this avoids
   is a power-counting bound proved for a labelling and applied to a neighbourhood whose points
   do not all satisfy it.
5. "Singular at `z₀`" means: not the restriction of a function analytic on a neighbourhood of
   `z₀`, in Mathlib's `AnalyticAt`. The Landau equations are a necessary condition for that and
   are never used as a sufficient one. The trap this avoids is concluding from a solution of the
   equations that an integral diverges; Layer 1.6 has the counterexamples.
6. Infrared divergences are regulated by the dimensional regularisation of `FeynmanIntegrals`
   Layer 4, written with the regulator of `Renormalization` Convention 1, `d = 4 - 2 ε`, which
   is half the regulator of the existing `regularizedDimension`; and a statement of infrared
   finiteness is the statement that a function meromorphic in `ε` is analytic at `ε = 0`. A
   gluon mass is never used. The trap this avoids is a regulator that breaks the Ward identities
   on which Layer 5 depends.
7. The gauge is an explicit argument of every power-counting statement: `covariant ξ` or
   `axial n`. The infrared degree of an individual reduced graph depends on it; the theorems
   that do not depend on it say so and are proved, not assumed. The trap this avoids is quoting a
   physical-gauge power count for a covariant-gauge graph, where scalar-polarised gluons change
   it.
8. Every all-orders statement is universally quantified over graphs, or over the finite set of
   graphs of a given order. No statement is made about convergence of the sum over orders, and
   no definition takes that sum. The trap this avoids is a theorem about a formal power series
   read as a theorem about a function.
9. An eikonal denominator carries its `iε` as data: `1 / (n · k + iε)` or `1 / (n · k - iε)`.
   The sign is determined in Layer 6.2 by the half-plane into which the contour is deformed and
   corresponds to a future-pointing or past-pointing Wilson line; it agrees with the `LinkPath`
   datum of `TransverseMomentumDistributions` Layer 1.2. The trap this avoids is a Wilson line
   whose direction is chosen by convention when it is fixed by analyticity, which is exactly the
   content of the sign change between processes.
10. The *Sudakov form factor* is the electromagnetic form factor of a massless quark at large
    momentum transfer, Lean name `sudakovFormFactor`. The *Sudakov factor* of a parton shower,
    `EpsilonEridani.QFT.Shower.Sudakov.sudakov`, is a no-emission probability. They are
    different objects with a leading-logarithmic relation that is a theorem of Layer 7.3. The
    trap this avoids is a lemma about a probability applied to an amplitude.
11. A hypothesis that a theorem needs is an explicit `Prop` argument of that theorem. No
    hypothesis is a typeclass, a default argument or a `Prop`-valued structure field with a
    witness. In particular "the contour can be deformed" and "the sum over cuts is complete" are
    arguments, since they are precisely the hypotheses that fail in Layer 6.3 and Layer 6.5. The
    trap this avoids is a factorisation statement that inherits an unproved analytic condition
    silently.
12. A remainder bound is stated after pairing with a test function of the external kinematics
    and has the form `O(lam^n |log lam|^m)` with both exponents explicit. The pure-power
    predicate `ApproximatesToOrder` of `EpsilonEridani.Particles.Parton.TMD.PowerCorrections` is
    the case `m = 0`; the logarithmic refinement is built in Layer 0.5 and reduces to it. The
    trap this avoids is a claim of power suppression that is false by a logarithm at the stated
    order.
13. Colour factors of eikonal vertices are generator matrices in a stated representation, taken
    from `EpsilonEridani.QFT.QCD.RepresentationColor`, and their order along a line is the path
    order. An abelian statement is the instance with commuting generators and is proved as such.
    The trap this avoids is an exponentiation theorem valid for commuting matrices stated for
    non-commuting ones.
14. Ultraviolet, infrared and rapidity divergences are three different things with three
    different regulators: dimensional regularisation handles the first two and does not handle
    the third. A rapidity regulator is the structure defined in `TransverseMomentumDistributions`
    Layer 2.3 and is always named. The trap this avoids is an integral reported as finite in
    dimensional regularisation because a scaleless rapidity integral was set to zero.
15. Where this roadmap needs an object that is absent upstream, it builds it in the shape the
    upstream library would want and says so in the layer that builds it. No milestone is
    contingent on an upstream change.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `Mathematics.LinearAlgebra.BilinearForm.LightConeBasis` — the structure `LightConeBasis` with
  `plus`, `minus`, `longitudinal`, `transverse`, `transverseProj`, the decomposition
  `plus_smul_add_minus_smul_add_transverseProj_eq` and the projector property
  `isProj_transverseProj`. Layer 0 uses these for every loop momentum and adds nothing to the
  linear algebra.
- `Relativity.LightConeBasis` — `minkowskiAxis`, `minkowskiAxis_plus_apply`,
  `minkowskiAxis_minus_apply`, and `finrank_transverse_minkowskiProduct_eq_two`, which is the
  statement that the transverse space is two-dimensional in four dimensions and is what the
  measure scaling of Layer 0.4 counts.
- `Relativity.Tensors.RealTensor.Vector.MinkowskiProductExtensions` — `minkowskiProduct_sub_self`
  and `isSymm_toBilinForm_minkowskiProduct`, used when a propagator denominator is expanded
  around an on-shell momentum.
- `QFT.Scattering.Kinematics.Emission` — `emissionVirtuality` and
  `emissionVirtuality_zero_pos_iff`. The latter is the exact form of the statement that a mass
  cuts off the collinear singularity, and Layer 1.5 cites it for the massive contrast case.
- `QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions` — `regularizedDenominator`,
  `advancedDenominator`, `regularizedDenominator_ne_zero` and `rightLimitAtZero`: the `±iε`
  denominators and the `ε → 0⁺` limit in which Layers 1 and 6 are stated.
- `Particles.Parton.TMD.PowerCorrections` — `smallRatio`, `ApproximatesToOrder`,
  `ApproximatesToOrder.mono`, `isBigO_pow_of_le`. Remainder statements are written in this
  vocabulary, extended by logarithms in Layer 0.5.
- `Particles.Parton.TMD.CollinsSoper` — `TmdRgSystem`, `SatisfiesMuRg`, `SatisfiesZetaRg`,
  `CuspConsistent` and `csKernel_eq_of_cuspConsistent`. That module records as inputs that the
  Collins–Soper kernel is independent of the rapidity scale and of the distribution, and carries
  `CuspConsistent` as a hypothesis bundle. Layer 7.4 proves those inputs from the operator
  definitions, so that an instance of `TmdRgSystem` with a proof of `CuspConsistent` is
  constructed and not postulated.
- `QFT.Shower.Sudakov` — `sudakov`, `sudakov_pos`, `sudakov_le_one`: the shower's no-emission
  probability, cited only for the comparison theorem of Layer 7.3 under Convention 10.
- `Mathematics.OrderedSimplexIntegral` — `orderedProdIntegral` and `orderedProdIntegral_eq`, the
  identity that an ordered `n`-fold integral of a product is the `n`-th power of the single
  integral over `n!`. This is the abelian exponentiation of an eikonal line, and Layer 5.5 uses
  it directly.
- `QFT.QCD.RepresentationColor`, `QFT.QCD.Basic` — normalised generator data and `ColorFactors`
  for the colour matrices of Convention 13.
- `Mathematics.Distribution.PlusFunctional` — the plus prescription as a functional, which is
  the form in which a real-emission singularity combined with its virtual counterpart appears
  in the examples of Layer 4.

From TauCeti (cited as the source of the one-variable complex analysis; `EpsilonEridani` does
not presently import these modules):

- `TauCeti.Analysis.Contour.HomologyCauchy` — `homologyCauchyTheorem`, and
  `TauCeti.Analysis.Contour.Cauchy.Homotopy` — `cauchyTheorem_of_pathHomotopy_refl`. These are
  the one-variable deformation statements from which Layer 1.1 and Layer 6.2 are built.
- `TauCeti.Analysis.Contour.Residue.Theorem` — `classicalResidueTheorem_circle`, used to carry
  out the light-cone energy integrals that produce light-front perturbation theory in Layer 6.4.
- `TauCeti.Analysis.Contour.JordanLemma` — the arc estimates needed to close those contours.
- `TauCeti.Analysis.Contour.PerWindow.CPV` — the principal value at a simple pole, for the real
  part of an eikonal denominator in the limit of Convention 9.

TauCeti's contour library is a theory of curves in one complex variable. It has no integration
of holomorphic forms over real domains of higher dimension and no deformation theorem for them;
Layer 1.1 builds the several-variable statement.

From Physlib:

- `Physlib.Relativity.Tensors.RealTensor.Vector.Basic` and `.MinkowskiProduct` for Lorentz
  vectors and their product.
- `Physlib.Relativity.Tensors.RealTensor.Vector.Causality.LightLike` and `.Causality.TimeLike`
  for the causal character of a momentum; `lightlike_spatial_parallel_implies_proportional` is
  the starting point of the parallelism lemma of Layer 1.5.
- `Physlib.Relativity.LorentzGroup.Boosts.Basic` and `.Boosts.Apply` for the longitudinal boost
  whose action on light-cone components is computed in Layer 0.1.

From Mathlib:

- `Mathlib.Analysis.Analytic.Basic` (`AnalyticAt`, `AnalyticOnNhd`), `.Uniqueness` and
  `.IsolatedZeros` for analyticity in several variables and the identity theorem;
  `Mathlib.Analysis.Complex.CauchyIntegral` (`DifferentiableOn.analyticAt`,
  `DifferentiableOn.analyticOnNhd`) for passing from complex differentiability to analyticity.
- `Mathlib.Analysis.Calculus.ParametricIntegral`
  (`hasFDerivAt_integral_of_dominated_of_fderiv_le`) and
  `Mathlib.MeasureTheory.Integral.DominatedConvergence` for differentiating an integral in a
  parameter, and `Mathlib.MeasureTheory.Integral.DivergenceTheorem` for the boundary term in the
  deformation argument of Layer 1.1.
- `Mathlib.Topology.PartitionOfUnity` for gluing local deformation directions into a global
  vector field.
- `Mathlib.Analysis.Convex.Hull`, `Mathlib.Analysis.Convex.Caratheodory` and
  `Mathlib.Geometry.Convex.Cone.Dual` for the convex geometry behind the theorem of alternatives
  of Layer 1.2; `Mathlib.Analysis.Calculus.LagrangeMultipliers` for the comparison with the
  constrained-extremum form of the Landau equations.
- `Mathlib.Analysis.Asymptotics.Defs` for `IsBigO` along a filter.
- `Mathlib.Combinatorics.Enumerative.IncidenceAlgebra` for Möbius inversion on the finite poset
  of regions in Layer 5.6.
- `Mathlib.Topology.Homotopy.Path` for the homotopies that TauCeti's Cauchy theorem consumes.

Absent upstream and therefore built here: scalings and regions; a deformation theorem for
integrals over real domains in several variables; a theorem of alternatives in the form of
Gordan; the Landau equations in either form; reduced graphs; any notion of infrared degree; the
abstract Kinoshita–Lee–Nauenberg theorem; the Grammer–Yennie decomposition; eikonal identities
beyond the abelian one-photon current of `RadiativeCorrections`; light-front time-ordered
denominators; and operator definitions of jet and soft functions. The graph, the parametric
integrand, the cut graph, the Slavnov–Taylor identity and the Wilson-line operator are the
sibling roadmaps' and are cited by layer.

---

## Layer 0: light-cone kinematics, scalings and momentum regions

References: Collins, *Foundations of Perturbative QCD*, Cambridge (2011), §5.5 and §5.8; Sterman,
*An Introduction to Quantum Field Theory*, Cambridge (1993), §13.4; Beneke and Smirnov,
*Nucl. Phys.* B522 (1998) 321; Smirnov, *Applied Asymptotic Expansions in Momenta and Masses*,
Springer (2002), ch. 2 and 8.

### 0.1 Light-cone components, rapidity and boosts

For a light-cone basis `L` of Minkowski space, write a momentum as `(k⁺, k⁻, k_T)`. Statements
to prove, all on top of the existing `LightConeBasis` API:

- `k² = 2 k⁺ k⁻ + k_T · k_T` and `k_T · k_T ≤ 0`, the latter from the signature and the
  dimension count of `finrank_transverse_minkowskiProduct_add_one_eq`.
- For the standard basis `minkowskiAxis i`, a boost of rapidity `ψ` along the axis `i` acts by
  `(k⁺, k⁻, k_T) ↦ (e^ψ k⁺, e^{-ψ} k⁻, k_T)`, proved from Physlib's boost.
- The rapidity `y k = (1/2) log (k⁺ / k⁻)` for `k⁺, k⁻ > 0`, its shift by `ψ` under that boost,
  and the on-shell relation `k⁻ = (|k_T|² + m²) / (2 k⁺)`.
- A light-like vector with `k⁻ = 0` and `k_T = 0` is a multiple of `n₊`, and conversely.

### 0.2 Scalings

Define `Scaling` as a triple of real exponents `(a, b, c)`. Define the predicate
`HasScaling s Q k`: there are constants `0 < C₁ ≤ C₂` such that, eventually along `smallRatio`,
each of `|k⁺| / Q`, `|k⁻| / Q`, `|k_T| / Q` lies between `C₁ lam^e` and `C₂ lam^e` for the
corresponding exponent `e`, with `k` a function of `lam`. Define the upper-bound-only variant
`HasScalingLE`. Name the scalings:

| name | `(a, b, c)` |
| --- | --- |
| `hard` | `(0, 0, 0)` |
| `collinearPlus` | `(0, 2, 1)` |
| `collinearMinus` | `(2, 0, 1)` |
| `soft` | `(1, 1, 1)` |
| `ultrasoft` | `(2, 2, 2)` |

and the *Glauber set*: all `(a, b, 1)` with `a + b > 2`. Define the virtuality exponent
`virtExp (a, b, c) = min (a + b) (2 c)`. Statements to prove:

- If `HasScalingLE s Q k` then `k² / Q² = O(lam^(virtExp s))`; with the two-sided predicate and
  `a + b ≠ 2 c` the bound is attained.
- `virtExp` is `0`, `2`, `2`, `2`, `4` on the five named scalings and `2` on the Glauber set.
- The defining property of the Glauber set: `|k⁺ k⁻| / |k_T|²` tends to zero, so that
  `k² = k_T · k_T (1 + o(1))`; and no element of the Glauber set equals a boost of `soft`,
  whereas `soft` and `ultrasoft` are boost invariant and the two collinear scalings are not.
- Two distinct scalings are eventually disjoint: no `lam`-dependent momentum satisfies both
  two-sided predicates. This is the general form of the disjointness statement of
  `TransverseMomentumDistributions` Layer 2.1.
- Addition: if `k₁` and `k₂` have scalings `s₁` and `s₂` then `k₁ + k₂` satisfies the
  upper-bound predicate for the componentwise minimum of the exponents.

### 0.3 Region assignments on a graph

For a graph `G` of `FeynmanIntegrals` Layer 0 with a momentum routing, a *region assignment* is
a map from the lines of `G` to `Scaling`. It is *admissible* if at every vertex the assignment
is compatible with momentum conservation: no component exponent of one line at the vertex is
strictly smaller than the minimum of that component's exponents over the remaining lines at the
vertex. Statements to prove: admissibility is necessary for the assignment to be realised by a
family of routed momenta; the set of admissible assignments with values in a fixed finite set of
scalings is finite and decidable; an admissible assignment determines, and is determined by, an
assignment of scalings to a loop-momentum basis together with the scalings of the external
momenta, whenever the basis is adapted to the assignment in a sense the layer defines.

### 0.4 Scaling of the measure and of denominators

Statements to prove:

- In `d` dimensions the measure `d^d k = dk⁺ dk⁻ d^{d-2} k_T` restricted to
  `HasScalingLE (a, b, c)` has volume `O(Q^d lam^(a + b + (d - 2) c))`.
- A denominator `k² - m² + iε` with `m = 0` scales as `lam^(virtExp s)`.
- The mixed case: for `p` of scaling `collinearPlus` and `k` of scaling `(a, b, c)`,
  `(p + k)² - p² = 2 p⁺ k⁻ + R` with `R = O(Q² lam^(min (a + 2) (c + 1) (2 c) (a + b)))`, so
  that the eikonal term `2 p⁺ k⁻`, of order `lam^b`, dominates exactly when `b` is strictly
  smaller than each of `a + 2`, `c + 1`, `2 c` and `a + b`. For `soft` this holds; for
  `ultrasoft` it holds and the eikonal term is of the same order as `p²`; on the Glauber set it
  fails whenever `b ≥ 2`. This single lemma is the reason Layer 6 exists.

### 0.5 Remainders with logarithms

Define `ApproximatesToOrderLog W Wapp n m`: `W lam - Wapp lam = O(lam^n |log lam|^m)` along
`smallRatio`. Statements to prove: the case `m = 0` is `ApproximatesToOrder`; monotonicity in
both indices; `ApproximatesToOrderLog W Wapp (n + 1) m` implies `ApproximatesToOrder W Wapp n`;
closure under sums and under multiplication by a function bounded by a power of `|log lam|`; and
uniqueness of the coefficient of `lam^n |log lam|^m`, extending `coeff_unique`.

### Examples

- The one-loop vertex graph with massless lines and external momenta `p₁` of scaling
  `collinearPlus` with `p₁² = 0`, `p₂` likewise along the minus direction, and
  `(p₁ + p₂)² = Q²`: the admissible assignments with values in the five named scalings,
  enumerated, with the virtuality of each line.
- A momentum of scaling `soft` and one of scaling `(2, 2, 1)`: both tend to zero, the first has
  `k² ≠ k_T · k_T` at leading order and the second has `k² = k_T · k_T` at leading order. This is
  the counterexample to treating "small momentum" as one region.
- A boost of rapidity `log (1 / lam)` maps `collinearPlus` to `soft`-like components in one
  direction and not the other; the worked computation shows why collinear scalings are frame
  dependent and virtuality exponents are not.

### Dependencies

`EpsilonEridani.Mathematics.LinearAlgebra.BilinearForm.LightConeBasis`,
`EpsilonEridani.Relativity.LightConeBasis`,
`EpsilonEridani.Relativity.Tensors.RealTensor.Vector.MinkowskiProductExtensions`,
`EpsilonEridani.Particles.Parton.TMD.PowerCorrections`,
`Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`,
`Physlib.Relativity.LorentzGroup.Boosts.Basic`, `Physlib.Relativity.LorentzGroup.Boosts.Apply`,
`Mathlib.Analysis.Asymptotics.Defs`. From `FeynmanIntegrals` Layer 0: graphs and momentum
routings.

---

## Layer 1: Landau equations and pinch surfaces

References: Landau, *Nucl. Phys.* 13 (1959) 181; Coleman and Norton, *Nuovo Cimento* 38 (1965)
438; Eden, Landshoff, Olive and Polkinghorne, *The Analytic S-Matrix*, Cambridge (1966), ch. 2;
Sterman, *An Introduction to Quantum Field Theory*, §13.1–13.2; Collins, *Foundations of
Perturbative QCD*, §5.1–5.3.

### 1.1 Analyticity under contour deformation

The statement that an integral can only be singular where its contour is trapped. It is ordinary
complex analysis and is at theorem level in the mathematical literature; what is absent is a
formal statement in the generality the physics needs.

One variable. Let `f(w, z)` be holomorphic in `(w, z)` on an open set of `ℂ × ℂ^m`, let `γ` be a
piecewise-`C¹` path, and suppose that for `z` near `z₀` the path `γ` can be deformed, with
endpoints fixed and by a homotopy staying in the domain of holomorphy of `f(·, z)`, to a path
`γ'` on a neighbourhood of which `f` is holomorphic for all `z` near `z₀`. Then
`z ↦ ∫_γ f(w, z) dw` is `AnalyticAt` `z₀`. Prove it from `cauchyTheorem_of_pathHomotopy_refl`
and differentiation under the integral.

Several variables. Let `K ⊂ ℝ^n` be compact with piecewise-smooth boundary, let `D₁, …, D_r` be
real-analytic functions of `(k, z)` near `K × {z₀}`, real for real arguments, let `N` be
analytic, and let

`I(z) = lim_{ε → 0⁺} ∫_K N(k, z) / ∏_j (D_j(k, z) + iε)^{a_j} d^n k`.

**Theorem (deformation).** Suppose there is a `C¹` vector field `v` on `K`, tangent to the
boundary strata of `K`, such that at every `k ∈ K` and every `j` with `D_j(k, z₀) = 0` one has
`∇_k D_j(k, z₀) · v(k) > 0`. Then the limit exists for `z` in a neighbourhood of `z₀` and `I` is
`AnalyticAt` `z₀`. The proof target: for small `t > 0` the displaced integral over
`k ↦ k + i t v(k)`, with the Jacobian `det (1 + i t ∂v)`, has an integrand free of zeros of the
denominators uniformly in `ε ≥ 0`; its derivative in `t` is the integral of a divergence and
vanishes by the tangency condition; so it equals `I` and is manifestly analytic. Build this in
`EpsilonEridani/Mathematics/Analysis/ContourDeformation/`, stated for a general integrand
holomorphic on the displaced domain, with the rational form above as a corollary.

Also prove the local-to-global step: if at each `k ∈ K` there is a vector `v_k` with the
positivity property for the denominators vanishing at `k`, then a vector field as above exists,
by `Mathlib.Topology.PartitionOfUnity` and the convexity of the set of admissible vectors at a
point.

### 1.2 The theorem of alternatives and the necessity of the Landau equations

Gordan's theorem: for vectors `g₁, …, g_r` in a finite-dimensional real inner-product space,
exactly one of the following holds: there is `v` with `g_j · v > 0` for all `j`; or there are
`α_j ≥ 0`, not all zero, with `∑ α_j g_j = 0`. Prove it from the cone duality of
`Mathlib.Geometry.Convex.Cone.Dual`, in `EpsilonEridani/Mathematics/LinearAlgebra/Alternative/`,
together with the constrained version in which `v` is required to lie in a given polyhedral
cone (needed at boundary points of `K`).

**Theorem (necessity).** In the setting of 1.1, if `I` is not `AnalyticAt` `z₀`, then there are
a point `k ∈ K` and multipliers `α_j ≥ 0`, not all zero, such that `α_j D_j(k, z₀) = 0` for each
`j` and `∑ α_j ∇_k D_j(k, z₀)` annihilates every direction tangent to the boundary stratum of
`K` containing `k`. These are the Landau equations for `(K, D)`. The proof is the contrapositive
of 1.1 through Gordan's theorem. The literature states this as "a singularity requires a pinch";
the roadmap's theorem is that sentence with the domain, the boundary and the uniformity in `ε`
made explicit.

### 1.3 The two forms for a Feynman integral

Apply 1.2 to the two representations of `FeynmanIntegrals`.

- Parametric form (`FeynmanIntegrals` Layers 1 and 2). The domain is the simplex of Feynman
  parameters and there is one denominator, built from the Symanzik polynomials `U` and `F`. The
  Landau equations read: for each line `e`, either `α_e = 0` or `∂F/∂α_e = 0`, with `F = 0`. A
  solution with `U ≠ 0` is of the *first type*. Zeros of `U` in the closed simplex give
  *second-type* candidates; state the necessity theorem with both, and prove that in the
  dimensionally regulated integral with Euclidean-region convergence (`FeynmanIntegrals` Layers
  3 and 4) second-type points are not singular for real external momenta in the physical region.
- Momentum form (`FeynmanIntegrals` Layer 5). For each line `e`, `α_e (q_e² - m_e²) = 0`, and
  for each cycle `C` of the graph, `∑_{e ∈ C} ± α_e q_e = 0`, signs given by the orientation of
  `e` relative to `C`.

**Theorem (equivalence).** First-type solutions of the parametric equations at external momenta
`p` correspond bijectively, up to common rescaling of `α`, to solutions of the momentum-form
equations with the same `α`, the line momenta `q_e` being the unique critical point of the
quadratic form in the loop momenta. Prove it from the completion-of-the-square identity that
defines `F`.

### 1.4 The Coleman–Norton theorem

A solution of the momentum-form equations is *physical* if all `α_e ≥ 0` and all momenta are
real. Its *reduced graph* is obtained by contracting every line with `α_e = 0`.

**Theorem (Coleman–Norton).** For a connected graph and real external momenta, physical
solutions with a given reduced graph `R` and given on-shell line momenta `q_e` correspond
bijectively, modulo an overall translation, to assignments `x` of points of Minkowski space to
the vertices of `R` such that for every line `e` of `R` from vertex `u` to vertex `w`,
`x_w - x_u = α_e q_e` with `α_e > 0`. The proof is linear algebra over the cycle space of
`FeynmanIntegrals` Layer 0: the cycle conditions say that the 1-cochain `e ↦ α_e q_e` is closed,
and on a connected graph a closed 1-cochain is a coboundary, uniquely up to a constant. This is
at theorem level in the original paper; the formal statement fixes the orientation conventions
and the treatment of external lines.

Corollaries to prove: `α_e q_e⁰` has the sign of the time separation, so every on-shell line
propagates forward in time in the direction of its energy; a reduced graph with a closed
directed cycle of on-shell lines of positive energy admits no physical solution.

### 1.5 Pinch surfaces, and the massless case

Define the *pinch surface* of a reduced graph `R` at external momenta `p` as the set of
line-momentum configurations admitting multipliers that solve the momentum-form equations with
reduced graph `R`. Statements to prove: it is closed in the configuration space of on-shell
momenta; it is invariant under the rescaling of all momenta and external momenta together; for
all masses strictly positive and generic `p` it is a finite set.

For massless lines the surfaces are positive-dimensional, and three lemmas describe them.

- Parallelism: two real light-like vectors of positive energy with vanishing Minkowski product
  are positive multiples of each other. Build on
  `lightlike_spatial_parallel_implies_proportional`.
- Collinear degeneracy: if a massless on-shell line of momentum `q` splits at a vertex into
  massless on-shell lines, each is `z_i q` with `z_i ∈ [0, 1]` summing to one, and the
  Coleman–Norton condition holds for every such `z`. So a one-parameter family of solutions
  exists for each collinear splitting.
- Soft degeneracy: a line with `q_e = 0` satisfies its on-shell condition, and its contribution
  to every cycle condition vanishes for every `α_e`. So a soft line imposes no constraint.

State the contrast with the massive case using `emissionVirtuality_zero_pos_iff`: a massive
emitter cannot emit an on-shell collinear massless line while remaining on shell, so the
collinear family is empty.

### 1.6 The Landau equations are not sufficient

Three statements, each proved by explicit computation with the one-loop integrals of
`FeynmanIntegrals` Layer 4, establish Convention 5.

- The massive bubble at the normal threshold `s = (m₁ + m₂)²`: a physical solution, and the
  integral is not analytic there.
- The same bubble at the pseudo-threshold `s = (m₁ - m₂)²`: a solution with one negative
  multiplier, and the boundary value from the physical region is analytic there.
- A graph with a numerator vanishing on the pinch surface: the Landau equations are satisfied
  and the integral is analytic.

### Examples

- The one-loop triangle with masses: the leading Landau curve, the range of external invariants
  on which its solution is physical (the anomalous threshold), and the Coleman–Norton triangle
  in spacetime for one explicit numerical choice of masses.
- The one-loop massless vertex with `p₁² = p₂² = 0`: the complete solution set — the soft point
  `k = 0`, the two collinear segments `k = z p₁` and `k = -z p₂` with `z ∈ [0, 1]`, and nothing
  else — with a proof of completeness.
- A deformation that exists: the same vertex with `p₁² < 0` and `p₂² < 0`, where the vector
  field of 1.1 is written down explicitly.

### Dependencies

Layer 0. `TauCeti.Analysis.Contour.HomologyCauchy`, `TauCeti.Analysis.Contour.Cauchy.Homotopy`,
`Mathlib.Analysis.Analytic.Basic`, `Mathlib.Analysis.Analytic.Uniqueness`,
`Mathlib.Analysis.Complex.CauchyIntegral`, `Mathlib.Analysis.Calculus.ParametricIntegral`,
`Mathlib.MeasureTheory.Integral.DivergenceTheorem`, `Mathlib.Topology.PartitionOfUnity`,
`Mathlib.Geometry.Convex.Cone.Dual`, `Mathlib.Analysis.Convex.Hull`,
`Mathlib.Analysis.Calculus.LagrangeMultipliers`,
`Physlib.Relativity.Tensors.RealTensor.Vector.Causality.LightLike`,
`EpsilonEridani.QFT.Scattering.Kinematics.Emission`,
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`. From
`FeynmanIntegrals`: Layer 0 (cycle space, contraction), Layers 1–2 (Symanzik polynomials and the
parametric form), Layer 4 (one-loop integrals), Layer 5 (Minkowski-signature integrals and their
boundary values).

---

## Layer 2: reduced graphs and the classification of pinch surfaces in massless gauge theory

References: Sterman, *Phys. Rev.* D17 (1978) 2773; Libby and Sterman, *Phys. Rev.* D18 (1978)
3252 and 4737; Landshoff, *Phys. Rev.* D10 (1974) 1024; Collins, Soper and Sterman, in
*Perturbative QCD*, ed. Mueller, World Scientific (1989), §4; Collins, *Foundations of
Perturbative QCD*, §5.4.

### 2.1 Reduced graphs

Define a `ReducedGraph` on a graph `G` with a finite set `ι` of jet directions as a map from the
lines of `G` to the labels `hard`, `jet i` for `i : ι`, and `soft`. Define the hard subgraph
`H`, the jet subgraphs `J_i` and the soft subgraph `S` as the subgraphs spanned by the lines of
each label, using the subgraph and contraction API of `FeynmanIntegrals` Layer 0. Statements to
prove: the three kinds of subgraph partition the lines; contraction of `H` to vertices gives the
graph of 1.4; relabelling the jet directions by a permutation gives an isomorphic reduced
graph; the set of reduced graphs on a finite graph with finite `ι` is finite.

Define the associated region assignment of Layer 0.3: `hard` lines get scaling `hard`, `jet i`
lines get the collinear scaling of direction `i`, `soft` lines get a scaling supplied as an
argument (Convention 2). Prove that the assignment is admissible exactly when the conditions of
2.2 hold at each vertex.

### 2.2 The classification theorem

A *kinematic class* is a description of the external momenta: which are light-like and in which
of finitely many pairwise non-parallel directions, and which are off shell by an amount of order
`Q²`. Four classes are defined: `formFactor` (one off-shell current, two light-like directions),
`annihilation` (one time-like off-shell current, cut graphs with all final-state lines on shell,
cut graphs from `FeynmanIntegrals` Layer 7), `dis` (a space-like off-shell current and one
incoming light-like direction, cut graphs), and `drellYan` (two incoming light-like directions
and a time-like off-shell current in the final state, cut graphs).

**Theorem (classification).** Let `G` be a graph, or cut graph, all of whose lines are massless,
with external momenta in one of the four classes at a generic point. At every physical solution
of the Landau equations:

1. every line with non-zero on-shell momentum is parallel to one of the external light-like
   directions, or, in the classes with cut final states, to the direction of a final-state
   line;
2. the lines parallel to a given direction form the jet subgraph of that direction, and each
   jet subgraph is connected to the external line or lines of its direction;
3. the lines of zero momentum form the soft subgraph, which may attach to any jet subgraph and
   to the hard subgraph;
4. the remaining lines are off shell, and for `formFactor`, `annihilation` and `dis` they form a
   connected hard subgraph on each side of the cut containing the off-shell current; for
   `drellYan` the same holds given that the two incoming directions are distinct;
5. conversely every reduced graph satisfying 1–4 and the vertex conditions of 2.1 is realised
   by a physical solution.

The published argument is the Coleman–Norton picture together with the observation that massless
particles leaving a common point on distinct light rays cannot meet again. The roadmap's proof
target makes that observation two lemmas and one class-specific step.

- *Vertex lemma.* At a vertex of the reduced graph at which every line is on shell, massless
  and of non-zero momentum, momentum conservation holds among those lines; call the vertex
  *direction-preserving* if all of them are parallel and *direction-changing* otherwise.
- *No-reunion lemma.* Let `x_0` and `x_m` be two points of Minkowski space joined by two arcs
  of on-shell lines, with displacements `± β_j q_j`, `β_j > 0`, `q_j` light-like of positive
  energy and the signs given by the orientation of the lines along the arc. Suppose every
  interior vertex of each arc is direction-preserving, so that each arc has a single direction,
  `a` and `b`, and suppose the signed sum of the `β_j` along at least one arc is non-zero. Then
  `a` and `b` are parallel. The proof is one line: `s a = t b` with `s ≠ 0` or `t ≠ 0` for
  light-like `a`, `b`.
- *Class-specific step.* For each of the four classes, the direction-changing vertices lie in
  the subgraph of item 4: prove from the external kinematics of the class that a
  direction-changing vertex cannot be joined to the external lines by on-shell lines alone
  except through the vertex carrying the current.

The no-reunion lemma does not say that a cycle of signed light-like displacements has parallel
sides. The cycle `(0,0,0,0) → (1,1,0,0) → (2,0,0,0) → (1,−1,0,0) → (0,0,0,0)` has signs
`+,+,−,−`, all `β_j = 1`, and two directions; it has four direction-changing vertices and is a
picture of two separate hard scatterings, the subject of 2.3. It is recorded as an example so
that the lemma is not applied to it.

The classification then follows by 1.4 and 1.5. The converse direction is by explicit
construction of the position assignment.

### 2.3 What the theorem does not say: multiple hard scatterings

The connectedness statement in item 4 is specific to the four classes. Statement to prove, as a
counterexample: for elastic scattering of two systems of two collinear massless lines each at
wide angle, there is a physical solution of the Landau equations whose reduced graph has two
disconnected hard vertices separated by a space-like interval transverse to the scattering
plane. This is the Landshoff pinch. The kinematic classes of 2.2 exclude it by having a single
off-shell current, and the proof of item 4 uses that hypothesis; the example shows that it is
used.

### 2.4 Enumeration and the order on pinch surfaces

Statements to prove: for each of the four classes the set of reduced graphs on `G` satisfying
the classification is a decidable finite set; for `formFactor` it is computed explicitly for the
one-loop vertex (four elements: all hard, soft gluon, gluon collinear to `p₁`, gluon collinear
to `p₂`) and for the two two-loop vertex topologies (ladder and crossed ladder), with the
complete lists.

Define the order: `R₁ ≤ R₂` when the pinch surface of `R₁` is contained in the closure of that
of `R₂`. Prove that it is a partial order on the reduced graphs of a fixed graph and class; that
it is characterised combinatorially — `R₁ ≤ R₂` exactly when `R₁` is obtained from `R₂` by
relabelling some jet lines as soft, or some hard lines as jet or soft, compatibly with 2.2; that
the all-hard reduced graph is the greatest element; and that the poset is graded by the
dimension of the pinch surface. The order is the index set of the subtraction of Layer 5.6.

### Examples

- The one-loop vertex: the four reduced graphs, their pinch surfaces from the example of Layer
  1, and the Hasse diagram of the order (soft below both collinear, both below hard).
- A two-loop ladder: a reduced graph in which the inner gluon is collinear and the outer gluon
  is soft is admissible; the one in which the outer gluon is collinear to `p₁` and the inner
  gluon is collinear to `p₂` is not, and the proof exhibits the violated vertex condition.
- A self-energy insertion on a jet line: all three lines collinear is admissible, giving a jet
  subgraph with a loop.

### Dependencies

Layers 0 and 1. `Physlib.Relativity.Tensors.RealTensor.Vector.Causality.LightLike`,
`Physlib.Relativity.Tensors.RealTensor.Vector.Causality.TimeLike`,
`Mathlib.Order.Interval.Finset.Defs`. From `FeynmanIntegrals`: Layer 0 (subgraphs, contraction,
connectedness), Layer 7 (cut graphs).

---

## Layer 3: infrared power counting

References: Sterman, *Phys. Rev.* D17 (1978) 2773 and 2789; Weinberg, *Phys. Rev.* 118 (1960)
838; Hepp, *Commun. Math. Phys.* 2 (1966) 301; Labastida and Sterman, *Nucl. Phys.* B254 (1985)
425; Collins, *Foundations of Perturbative QCD*, §5.8; Sterman, *An Introduction to Quantum
Field Theory*, §13.4.

### 3.1 Normal and intrinsic coordinates

At a pinch surface of a reduced graph `R`, split the loop-momentum coordinates into *intrinsic*
coordinates, which parametrise the surface (the momentum fractions `z` of 1.5 and their
analogues), and *normal* coordinates, which vanish on it. Define the homogeneous scaling: each
normal coordinate is assigned the exponent it has under the region assignment of 2.1, and the
neighbourhood `U_R(lam)` is the set of configurations whose normal coordinates are bounded by
the corresponding powers of `lam` times a fixed constant. Statements to prove: the split exists
for every reduced graph satisfying 2.2, with the number of normal coordinates given by an
explicit count in terms of the loop numbers of `S` and of the `J_i`; `U_R(lam)` decreases to the
pinch surface as `lam → 0`; for `R₁ ≤ R₂` in the order of 2.4, `U_{R₁}(lam) ⊂ U_{R₂}(C lam)`
for a constant `C`.

### 3.2 The infrared degree and the suppression theorem

Define the *infrared degree* `irDegree R g d` of a reduced graph in gauge `g` and dimension `d`:
the sum over normal coordinates of their measure exponents (Layer 0.4), minus the sum over jet
and soft lines of their denominator exponents, plus the minimal numerator exponent, the minimum
taken over the monomials of the numerator of `FeynmanIntegrals` Layer 6 after the scaling is
inserted. Statements to prove about the definition: additivity over the soft subgraph and the
jet subgraphs; the closed formula in `d = 4` for a theory with gluons, quarks and scalars in
terms of the numbers of soft loops, soft lines of each spin, jet loops, jet lines and
three-point vertices in each jet; invariance under the common rescaling of `lam`.

**Theorem (suppression).** Let `G` be a graph in one of the classes of 2.2, dimensionally
regulated, and let `p_min` be the minimum of `irDegree R g d` over the reduced graphs `R` of 2.4
other than the all-hard one. Then:

- if `p_min > 0`, the integral is infrared finite at `d = 4`;
- if `p_min = 0`, the integral has at most a pole of order `2 L` in `ε`, `L` the loop number,
  and paired with a test function its `lam`-dependence is `O(|log lam|^(2 L))`;
- for any `R` with `irDegree R g d = p > 0`, the contribution of `U_R(lam)` minus the
  neighbourhoods of all strictly smaller pinch surfaces is `O(lam^p |log lam|^(2 L))`.

Sterman's power counting is a superficial count supplemented by an induction on subregions; it
is the infrared counterpart of Weinberg's theorem and has not been written with the same
rigour. The roadmap's proof target is the direct analogue of the proof of `FeynmanIntegrals`
Layer 3: decompose the neighbourhood of the pinch surfaces into sectors in which the normal
coordinates are ordered, show that in each sector the integrand is bounded by a monomial in the
ordered variables whose exponents are the infrared degrees of the nested reduced graphs, and
integrate. The hypothesis under which the monomial bound is proved — that denominators do not
cancel against each other beyond the stated scaling, which is where the Glauber configurations
of Layer 6 enter — is an explicit argument, `NoAccidentalCancellation R`, and is proved for
scalar denominators at non-exceptional intrinsic coordinates.

### 3.3 Leading regions of a renormalisable gauge theory

**Theorem (leading regions, physical gauge).** In `d = 4`, in an axial gauge, for a theory of
gluons and massless quarks and for any of the four classes, `irDegree R ≥ 0` for every reduced
graph satisfying 2.2, with equality exactly when:

1. every soft line is a gluon, and no soft line attaches to the hard subgraph;
2. soft gluons attach to jet subgraphs only through three-point vertices;
3. each jet subgraph is connected to each hard subgraph it touches by exactly one line.

**Theorem (leading regions, covariant gauge).** In a covariant gauge the same holds with 3
replaced by: each jet subgraph is connected to each hard subgraph it touches by exactly one
line of physical polarisation, together with any number of gluons whose polarisation at the
hard vertex is proportional to their momentum. Prove both from the closed formula of 3.2 and
the numerator lemma: the Dirac numerator of a jet of momentum direction `n₊` contributes one
power of `lam` for each three-point vertex internal to the jet beyond those needed to carry the
large component, and a gluon attaching a jet to the hard subgraph contributes `lam^0` for the
component along its own momentum and `lam^1` for a transverse component.

Statements to prove in addition: a soft quark or soft scalar line raises the degree by one, and
a soft gluon attached to the hard subgraph raises it by at least one; in the scalar cubic theory
in six dimensions every reduced graph with a non-empty soft subgraph has strictly positive
degree, so that theory has collinear but no soft leading regions.

### 3.4 Gauge dependence and super-leading contributions

Statements to prove:

- The infrared degree of an individual reduced graph differs between the two gauges of 3.3 by an
  explicit amount counted by the scalar-polarised gluons.
- For a jet whose physical connection to the hard subgraph is a gluon, a single covariant-gauge
  graph with every connecting gluon scalar-polarised has contribution of order `lam^(-1)`
  relative to the leading power: a *super-leading* term.
- The sum of such terms over all attachments of the scalar-polarised gluons to the hard subgraph
  vanishes at order `lam^(-1)`, by the Ward identity of Layer 5.4; what remains is of order
  `lam^0`. This cancellation is stated here and proved in Layer 5.4, and is the standard
  example of a power count that is true of the sum and false of the terms.

### 3.5 Region completeness

**Theorem (region completeness).** For a graph `G` in one of the four classes, paired with a
test function of the external kinematics, the integral over the complement of the union of the
neighbourhoods `U_R(lam^θ)` of the leading reduced graphs, for any fixed `θ ∈ (0, 1)`, is
`O(lam^(θ p₁) |log lam|^(2 L))` relative to the leading power, with `p₁ > 0` the smallest
positive infrared degree occurring for `G`. It is a corollary of 3.2 and 3.3 and inherits the
hypothesis `NoAccidentalCancellation`.

This is the general statement of which the *region completeness* hypothesis of
`TransverseMomentumDistributions` Layer 2.4 is the semi-inclusive instance; the instantiation
for that process is `FactorizationTheorems` Layer 3.

### Examples

- The one-loop vertex in Feynman gauge: degrees `0` for the soft and both collinear reduced
  graphs, the resulting `1/ε²` pole, and its coefficient.
- A soft quark exchanged between two jets: a pinch surface satisfying the Landau equations and
  the classification of 2.2, with infrared degree `1`. This is the counterexample to "every
  pinch surface is a leading region".
- The scalar cubic theory in six dimensions at one loop: collinear degree `0`, soft degree `2`.
- The super-leading graph of 3.4 for the lowest-order gluon-initiated process, with the
  individual `lam^(-1)` terms written out and their sum computed.

### Dependencies

Layers 0, 1 and 2. `EpsilonEridani.Particles.Parton.TMD.PowerCorrections`,
`Mathlib.Analysis.Asymptotics.Defs`. From `FeynmanIntegrals`: Layer 3 (sector decomposition and
Weinberg's theorem, whose proof is the template), Layer 4 (pole structure in `ε`), Layer 6
(numerators and Feynman rules in the two gauges).

---

## Layer 4: infrared cancellation

References: Bloch and Nordsieck, *Phys. Rev.* 52 (1937) 54; Kinoshita, *J. Math. Phys.* 3 (1962)
650; Lee and Nauenberg, *Phys. Rev.* 133 (1964) B1549; Sterman, *Phys. Rev.* D14 (1976) 2123;
Poggio and Quinn, *Phys. Rev.* D14 (1976) 578; Sterman and Weinberg, *Phys. Rev. Lett.* 39
(1977) 1436; Sterman, *Phys. Rev.* D17 (1978) 2789; Sterman, *An Introduction to Quantum Field
Theory*, §13.5.

### 4.1 Inclusive quantities as sums over cuts

For a graph `G` contributing to a forward amplitude or current correlator, the cut graphs of
`FeynmanIntegrals` Layer 7 are indexed by a finite set, and the cutting rules express the
discontinuity of `G` as the sum over that set. Define a *weighted cut sum*: the sum over cuts
`c` of the cut-graph integral with a weight `w c` depending on the final state of the cut.
Statements to prove: the unweighted sum is the discontinuity (restating Layer 7 of
`FeynmanIntegrals` in the form used below); linearity in the weight; and the refinement in
which the cuts of `G` are grouped by the cut restricted to a subgraph.

### 4.2 Finiteness of the total annihilation cross section

**Theorem.** For every graph `G` with massless lines contributing to the two-point function of a
conserved current at momentum `q`, the sum over cuts of `G` is, after ultraviolet
renormalisation, analytic at `ε = 0` for `q² > 0`. Proof target, in three steps each of which is
a statement of an earlier layer or a sibling roadmap: (i) at Euclidean `q² < 0` the single
external momentum is non-exceptional and the integral is infrared finite by `FeynmanIntegrals`
Layer 3; (ii) a massless graph depending on the one invariant `q²`, together with its counterterm
graphs, is a finite combination of powers `(-q² - iε)^(-j ε)`, `0 ≤ j ≤ L`, with coefficients
meromorphic in `ε` alone, so the cancellation of poles at `ε = 0` for `q² < 0` is an identity
among those coefficients, persists for `q² > 0`, and the discontinuity is finite; (iii) the
discontinuity is the sum over cuts by 4.1. This argument is at theorem level given the cited
inputs; it uses no power counting.

Corollary to prove: individual cuts are not finite. For the one-loop correction the two-particle
and three-particle cuts have poles `1/ε²` and `1/ε` with opposite coefficients, computed in the
Examples.

### 4.3 The Kinoshita–Lee–Nauenberg theorem

The abstract statement is about perturbation theory for an operator and has no field theory in
it. Let `H₀` be a self-adjoint operator on a finite-dimensional inner-product space with an
orthonormal eigenbasis indexed by `a`, eigenvalues `E_a`, let `V` be self-adjoint, and let
`U(g)` be the formal power series in `g` for the unitary that diagonalises `H₀ + g V`,
constructed by time-independent perturbation theory; its coefficients are sums of products of
matrix elements of `V` with energy denominators `(E_a - E_b)⁻¹` between distinct eigenvalues.

**Theorem (Lee–Nauenberg).** Let `H₀` depend continuously on a parameter `m > 0` such that the
eigenvalues with index in a set `D` coalesce as `m → 0` while remaining separated from the rest
of the spectrum. Then for each order in `g` and all indices `i`, `j` outside `D`, the
coefficient of `∑_{a ∈ D} conj(U_{ia}) U_{ja}` has a finite limit as `m → 0`, although the
individual terms of the sum have poles in the differences `E_a - E_b`, `a, b ∈ D`.
Consequently every transition probability summed over the full coalescing sets of initial and
of final states has a finite limit order by order. The original proof is at theorem level for
this setting; the target is its formal statement for formal power series
(`Mathlib.RingTheory.PowerSeries.Basic`) over a finite-dimensional space, built in
`Infrared/Cancellation/` on `Mathlib.Analysis.InnerProductSpace.Spectrum`.

State the two field-theoretic readings as corollaries with their hypotheses explicit: a sum
over degenerate final states alone suffices when the initial state has no degenerate partners
(the situation of 4.2 and 4.4); when the initial state contains massless coloured or charged
particles, the sum over initial states is not performed by any experiment, and the uncancelled
collinear singularities are the ones a factorisation theorem absorbs. Prove that
`kln_final_state` and `kln_initial_state_survives` of `RadiativeCorrections` Layer 0.4 are the
first-order QED instances of these two corollaries.

### 4.4 Soft-photon cancellation

**Theorem (Bloch–Nordsieck, graph form).** In an abelian gauge theory with massive charged
particles, for every graph and every weight that is unchanged by the addition of photons of
total energy below a resolution `ω₀`, the weighted cut sum is analytic at `ε = 0`. The proof
target uses the abelian eikonal identity of Layer 5.5 to write the soft-photon dependence of
each cut as an exponential of a one-photon integral, and the cancellation of the real and
virtual one-photon integrals. Prove that `ir_cancellation` and
`ir_cancellation_regulator_independent` of `RadiativeCorrections` Layer 0.3 are the first-order
instance with the photon-mass and dimensional regulators respectively. The exponentiated form is
`yfs_exponentiation` of `RadiativeCorrections` Layer 0.5 and is cited, not restated.

The non-abelian analogue for final-state sums is 4.5. No statement is made for sums over
initial-state colour.

### 4.5 Infrared-and-collinear-safe weights to all orders

The predicate `IsIRCSafe` of `JetsAndEventShapes` Layer 0.3 asserts limits, not rates, and a
limit is not enough to integrate against `dλ/λ`: thrust composed with `τ ↦ 1/log(e/τ)` near
zero is still `IsIRCSafe`, and its soft integral `∫ dλ / (λ log(e/λ))` diverges. The hypothesis
on a weight is therefore quantitative. Define `IsIRCSafeOfOrder δ w`, for `δ > 0`: the change
of `w` under the addition of a soft momentum `p`, and under the replacement of two collinear
momenta at relative transverse momentum `p` by their sum, is `O(‖p‖^δ)`, uniformly on compact
sets of the remaining final state. For `δ = 1` and soft emission this is the soft safety of
order one of `JetsAndEventShapes` Layer 0.3. Prove that `IsIRCSafeOfOrder δ w` implies
`IsIRCSafe w`, that the converse fails by the example above, and that thrust and the weights
of `JetsAndEventShapes` Layer 1 satisfy it with `δ = 1`.

**Theorem.** For every graph `G` of the class `annihilation` and every weight `w` on final
states with `IsIRCSafeOfOrder δ w` for some `δ > 0`, the weighted cut sum of `G` is analytic at
`ε = 0`.
The published argument (Sterman 1978) is diagrammatic: at each pinch surface the leading
contribution is common to the cuts that differ by soft and collinear rearrangements of the
final state, a safe weight takes equal values on those cuts, and the unweighted sum over them
has degree of divergence raised by one. The roadmap's proof target states this as: for each
leading reduced graph `R` of the uncut graph, the cuts of `G` compatible with `R` are those
that cut `R`'s jets and soft subgraph in all possible ways; on `U_R(lam)` the weight is
constant up to `O(lam^δ)` by the quantitative hypothesis; the sum over those cuts of the integrand
restricted to
`U_R(lam)` has infrared degree raised by at least `δ`, by the largest-time equation of
`FeynmanIntegrals`
Layer 7 applied to the jet and soft subgraphs; and Layer 3.2 concludes. Its hypotheses are
`IsIRCSafeOfOrder δ w` with `δ > 0` and `NoAccidentalCancellation`.

This is the all-orders form of the finiteness milestone of `JetsAndEventShapes` Layer 0.5, which
is stated there at one order with the soft and collinear limits of the real matrix element as
data. Prove the converse in the form used there: for a weight that fails collinear safety on a
set of positive measure, some graph has a weighted cut sum with a pole at `ε = 0`.

### Examples

- One-loop annihilation: the two-particle cut with its `1/ε²` and `1/ε` poles, the
  three-particle cut with the opposite poles, and the finite sum `α_s / π` times the colour
  factor relative to lowest order.
- The same graph with the weight "number of final-state particles": the weighted sum has a
  pole, exhibiting the converse of 4.5.
- A two-level system with a third level coalescing with the lower one: the Lee–Nauenberg sum
  computed to second order in `g`, with the divergent terms and their cancellation explicit.
- The plus-prescription form of the cancellation: the combination of the real-emission
  distribution in an energy fraction with the virtual term is the functional of
  `EpsilonEridani.Mathematics.Distribution.PlusFunctional` applied to the weight.

### Dependencies

Layers 0–3; Layer 5.5 for the eikonal identity used in 4.4.
`EpsilonEridani.Mathematics.Distribution.PlusFunctional`. From `FeynmanIntegrals`: Layer 3
(Euclidean infrared finiteness), Layer 4 (dimensional regularisation, scaling of massless
integrals), Layer 7 (cut graphs, the largest-time equation). From `Renormalization`: Layer 2
(ultraviolet renormalisation of the current correlator). From `JetsAndEventShapes`: Layer 0.3
(`IsIRCSafe`). From `RadiativeCorrections`: Layers 0.3–0.5, as the statements shown to be
instances.

---

## Layer 5: approximators and subtractions

References: Grammer and Yennie, *Phys. Rev.* D8 (1973) 4332; Collins, Soper and Sterman, *Nucl.
Phys.* B261 (1985) 104 and B308 (1988) 833; Bodwin, *Phys. Rev.* D31 (1985) 2616; Collins,
*Foundations of Perturbative QCD*, ch. 10 and 11; Beneke and Smirnov, *Nucl. Phys.* B522 (1998)
321; Jantzen, *JHEP* 12 (2011) 076; Bauer, Fleming, Pirjol and Stewart, *Phys. Rev.* D63 (2001)
114020; Manohar and Stewart, *Phys. Rev.* D76 (2007) 074002.

### 5.1 The soft approximation

For a gluon of momentum `k` attaching to a line of a jet in the plus direction, define
`softApprox`: in the jet subgraph, `k` is replaced by its minus component `k⁻ n₋` — the only
component that enters `2 p⁺ k⁻` — and the vertex `J^μ g_{μν} S^ν` is replaced by `J⁺ S⁻`.
Statements to prove: on a single massless line with on-shell external momentum `p` the result
is the eikonal factor `p^μ / (p · k + iε)` times the line without the gluon; the difference
between the exact and approximated integrands is bounded by `C lam^δ` times the approximated
one on the set where `k` has a scaling for which the dominance condition of Layer 0.4 holds
with margin `δ`; the approximation is exact for a scalar-polarised gluon on an on-shell line.
The abelian one-photon case is the eikonal current of `RadiativeCorrections` Layer 0.5, and its
error statement `eikonal_error` there is the instance of the bound here.

### 5.2 The collinear approximation

For a gluon of momentum `k` collinear to the plus direction attaching a jet `A` to the hard
subgraph `H`, define `collinearApprox` with an auxiliary vector `w` satisfying `w · n₊ ≠ 0`:

`H_μ(k) A^μ(k)  ↦  H_μ(k̂) k̂^μ (w · A(k)) / (w · k̂ + iε)`,  `k̂ = (k · w / n₊ · w) n₊`.

Statements to prove: the difference is suppressed by one power of `lam` relative to the leading
term when `k` has scaling `collinearPlus`; the result does not depend on `w` at leading power;
for the physical parton line the corresponding approximator projects onto the large Dirac
components and sets the parton's momentum in `H` to `k̂`; and the approximated hard subgraph is
contracted with the gluon's own momentum, which is the form to which a Ward identity applies.

### 5.3 The Grammer–Yennie decomposition

Define, for a gluon propagator connecting subgraphs with distinguished direction `w`,
`g^{μν} = K^{μν} + G^{μν}` with `K^{μν} = k^μ w^ν / (k · w)`. Statements to prove: the identity;
`G^{μν}` contracted into a jet in the direction for which 5.2 applies contributes one power of
`lam` more than `K^{μν}`; in the covariant-gauge characterisation of leading regions of 3.3, the
"scalar-polarised gluons" are exactly the `K` terms. This last statement makes the informal
phrase in 3.3 a definition.

### 5.4 Ward-identity decoupling of collinear gluons from the hard subgraph

Abelian, tree level. The identity
`(p̸ + k̸ - m)⁻¹ k̸ (p̸ - m)⁻¹ = (p̸ - m)⁻¹ - (p̸ + k̸ - m)⁻¹` and its consequence: the sum over all
insertions of one `K` photon on an open fermion line with `n` other photon vertices telescopes
to the difference of two terms with the photon momentum routed into one or the other end. Prove
it for all `n` by induction, for several `K` photons by symmetrisation, and prove that
insertions on a closed fermion loop sum to zero. These are theorem-level algebraic identities.

Abelian, all orders. **Theorem.** For a hard subgraph `H` with on-shell external charged lines
of physical polarisation and `n` additional `K` photons from a jet, the sum over all graphs for
`H` at a given order is equal to the corresponding sum for `H` without the photons, multiplied
by the product over photons of the eikonal vertex `w^μ / (w · k_j + iε)` attached to a Wilson
line in the direction `w`, summed over the orderings on the line.

Non-abelian. **Theorem.** The same statement holds in a non-abelian gauge theory, with the
colour matrices path-ordered along the Wilson line in the representation of the physical
parton, the Wilson-line operator being that of `Renormalization` Layer 5, provided the sum is
over all graphs for `H` at the given order including ghost contributions, and the external
lines of `H` other than the `K` gluons are on shell with physical polarisations. The proof
target is by induction on `n` using the Slavnov–Taylor identity of `Renormalization` Layer 4 for
the Green function with one scalar-polarised gluon: the identity expresses that Green function
through ghost-line terms; terms in which the ghost line ends on a physical on-shell external
line vanish; the remaining terms are the commutator terms that rebuild the path ordering. The
published proofs (Collins, Soper and Sterman 1985; Collins 2011, ch. 11) give this induction
diagrammatically. The roadmap's statement fixes the class of graphs summed, the on-shell and
polarisation hypotheses as explicit arguments, and the treatment of the `iε` of the eikonal
denominators, which the Ward identity alone does not determine and which Layer 6 supplies.

Prove the cancellation claimed in 3.4 as a corollary: the super-leading terms are the `n`-gluon
terms with no physical line, and their sum is the Wilson-line operator acting on the hard
subgraph with no physical parton, which vanishes at the super-leading order.

### 5.5 Decoupling of soft gluons from jets

**Theorem (eikonal identity).** For a jet subgraph `J` in the plus direction with `n` soft
gluons attached, after the soft approximation of 5.1 the sum over all attachments of the soft
gluons to `J`, over all graphs for `J` at a given order, is equal to `J` without the soft
gluons times the product of eikonal vertices `n₊^μ / (n₊ · k_j ± iε)` on a Wilson line in the
plus direction, path-ordered in colour, with the sign of `iε` an explicit argument. The proof
is the Ward identity of 5.4 applied to the jet, the soft gluons being scalar-polarised from the
jet's point of view after 5.1.

Abelian exponentiation. **Theorem.** With commuting charges, the sum over orderings of `n`
eikonal vertices on a line is `(1/n!)` times the `n`-th power of the single-vertex factor, in
both momentum space (the eikonal identity `∑_σ ∏_j (∑_{i ≤ j} a_{σ i})⁻¹ = ∏_j a_j⁻¹`) and
position space, where it is `orderedProdIntegral_eq` of
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`. Prove the momentum-space identity and
derive it from the position-space one.

### 5.6 Region approximators and the nested subtraction

For each leading reduced graph `R` of a graph `Γ`, define the *approximator* `T_R`: the
operator on integrands that applies 5.1 to every soft attachment and 5.2 to every collinear
attachment of `R`, with a rapidity regulator (Convention 14) as an argument. Define the *region
contribution* recursively over the poset of Layer 2.4:

`C_R Γ = T_R (Γ - ∑_{R' < R} C_{R'} Γ)`.

Statements to prove:

- Möbius form: `C_R Γ = ∑_{chains R₁ < ⋯ < R_n = R} (-1)^(n-1) T_{R_n} ⋯ T_{R_1} Γ`, by
  inversion in `Mathlib.Combinatorics.Enumerative.IncidenceAlgebra`. This is combinatorics and
  is at theorem level; it is the infrared counterpart of the forest formula of `Renormalization`
  Layer 1, and the correspondence is stated as a theorem relating the two index sets.
- Idempotence where it holds: `T_R T_R = T_R`, and `T_{R₁} T_{R₂} = T_{R₁}` for `R₁ ≤ R₂` up
  to terms of higher infrared degree, with the exponent explicit.

**Theorem (remainder).** For a graph `Γ` in one of the four classes, paired with a test
function,

`Γ - ∑_{R leading} C_R Γ = O(lam^p |log lam|^(2 L))` relative to the leading power,

with `p > 0` the smallest positive infrared degree of `Γ`, under the hypotheses: (i)
`NoAccidentalCancellation` for `Γ`; (ii) the Glauber condition of Layer 6.2 at every soft
attachment, as an explicit `Prop` argument; (iii) the rapidity regulator is the same in every
`T_R` and is removed after the sum. The proof target: on `U_R(lam)` minus the neighbourhoods of
smaller surfaces, `Γ - ∑_{R' ≤ R} C_{R'} Γ` has infrared degree raised by at least the margin of
5.1 and 5.2, by induction over the poset; then Layer 3.2 and 3.5. The published argument
(Collins 2011, ch. 10) is of this form and is not at theorem level: it argues the induction step
region by region. The roadmap's theorem states the three hypotheses that the argument uses and
proves the induction step as a statement about the poset.

Hypothesis (ii) is the *eikonal validity* hypothesis of `TransverseMomentumDistributions` Layer
2.4 in general form.

### 5.7 Equivalence with the mode decomposition

Define the *expansion by regions* of a dimensionally regulated graph: for each admissible region
assignment of Layer 0.3 with values in a chosen finite set of scalings, expand the integrand in
`lam` according to the assignment and integrate each term over the whole of loop-momentum space.

**Theorem.** For a graph `Γ` in one of the four classes and a set of scalings containing those
of its leading reduced graphs, the leading term of the expansion by regions for the assignment
of `R`, minus the same term further expanded in the scalings of the regions below `R` (the
overlap, or zero-bin, subtractions), is equal to `C_R Γ` with the rapidity regulator fixed to
the analytic one; and when every overlap integral is scaleless, hence zero by `FeynmanIntegrals`
Layer 4, the unsubtracted sum over regions is equal to `∑_R C_R Γ`. The published statements
(Beneke and Smirnov 1998; Manohar and Stewart 2007; Jantzen 2011) establish this for classes of
examples; the target is the graph-level identity under the stated scalelessness hypothesis,
which is an explicit argument.

This identity is the whole of the roadmap's contact with soft-collinear effective theory: the
collinear, soft and hard modes of that theory are the scalings of the leading reduced graphs,
and its zero-bin subtraction is the nested subtraction of 5.6. The effective Lagrangian is not
constructed.

### Examples

- The one-loop vertex: `C_soft`, `C_{coll 1}`, `C_{coll 2}` and `C_hard` computed in closed form
  in dimensional regularisation with an off-light-cone rapidity regulator; their sum equals the
  full vertex up to `O(lam)`; the regulator dependence cancels in the sum.
- The same with the analytic regulator, where the soft contribution is scaleless: the instance
  of 5.7 in which the unsubtracted sum is already correct.
- The collinear approximation applied without subtraction and with `w` light-like: the integral
  over the gluon's rapidity diverges at fixed transverse momentum. This is the
  counterexample-shaped example that motivates Convention 14 and Layer 7.2.
- The super-leading cancellation of 3.4 carried out with the Ward identity of 5.4 for two
  scalar-polarised gluons.
- The abelian eikonal identity for `n = 2` and `n = 3`, by hand, and by `orderedProdIntegral_eq`.

### Dependencies

Layers 0–3; Layer 6.2 for hypothesis (ii) of the remainder theorem.
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`, `EpsilonEridani.QFT.QCD.RepresentationColor`,
`EpsilonEridani.Particles.Parton.TMD.PowerCorrections`,
`Mathlib.Combinatorics.Enumerative.IncidenceAlgebra`. From `FeynmanIntegrals`: Layer 4
(scaleless integrals vanish), Layer 6 (Feynman rules, numerators). From `Renormalization`:
Layer 1 (the forest formula, for the comparison), Layer 4 (Slavnov–Taylor and Ward identities),
Layer 5 (Wilson-line operators and their Feynman rules). From `TransverseMomentumDistributions`:
Layer 2.3 (the rapidity-regulator structure). From `RadiativeCorrections`: Layer 0.5 (the
abelian eikonal current).

---

## Layer 6: the Glauber region

References: Bodwin, Brodsky and Lepage, *Phys. Rev. Lett.* 47 (1981) 1799; Bodwin, *Phys. Rev.*
D31 (1985) 2616; Collins, Soper and Sterman, *Nucl. Phys.* B261 (1985) 104 and B308 (1988) 833;
Collins and Metz, *Phys. Rev. Lett.* 93 (2004) 252001; Collins, *Foundations of Perturbative
QCD*, §5.6, §5.9 and ch. 14.

### 6.1 Failure of the soft approximation

Statement to prove, from Layer 0.4: for `k` in the Glauber set with `b ≥ 2` attaching to a jet
line of scaling `collinearPlus`, the ratio of the exact denominator to the eikonal denominator
does not tend to one; exhibit the limit as an explicit function of `k⁻ p⁺ / |k_T|²`. So the
soft approximation of 5.1 has error of relative order one on that part of the integration
domain, and the Glauber set is not covered by any of the approximators of Layer 5.

Prove also that the Glauber set has infrared degree zero for a gluon exchanged between two
oppositely directed jets: it is a leading configuration and cannot be discarded by power
counting.

### 6.2 The contour-deformation theorem

**Theorem (one soft momentum).** Let `F(k⁻)` be the integrand of a graph as a function of the
minus component of one soft momentum, the other components held fixed with `|k⁺| ≤ C lam Q` and
`|k_T| ≤ C lam Q`, and suppose that every pole of `F` at `|k⁻| ≤ lam Q` arising from the
denominators of the plus-direction jet lies in the lower half-plane, and that `F` has no
singularity of any other origin in the closed region swept between the real segment
`|Re k⁻| ≤ lam Q` and the contour displaced into the upper half-plane by `c lam Q` there, for a
constant `c > 0`. Then the integral of `F` over real `k⁻` equals the integral over the
displaced contour, and on it the dominance condition of Layer 0.4 holds with a margin
proportional to `c` and independent of `lam`. Consequently the soft approximation of 5.1 applies
with its stated error, and the eikonal denominators it produces are `n₊ · k + iε`. The same
holds with the half-planes exchanged and `- iε`. Prove it from
`TauCeti.Analysis.Contour.HomologyCauchy` with the arc estimates of
`TauCeti.Analysis.Contour.JordanLemma`.

The pole-free hypothesis is not implied by the condition on the jet poles. The soft line's own
propagator has a pole at `k⁻ = (|k_T|² − iε) / (2 k⁺)`, in the upper half-plane for `k⁺ < 0`,
and the denominators of the opposite jet and of other soft lines contribute further poles.
Statements to prove, which discharge the hypothesis where the deformation is needed: on the
Glauber set, where `|k_T| ≥ c₀ lam Q` and `|k⁺| ≤ C lam Q`, the soft line's own pole lies at
distance at least `c₀² lam Q / (2 C)` from the real axis, so that any `c < c₀² / (2 C)` avoids
it; and for the classes `formFactor`, `annihilation` and `dis`, the poles in `k⁻` of the
opposite jet and of the hard subgraph lie at distance of order `Q` or in the lower half-plane.
For several soft momenta the deformation is a joint one and the same hypothesis is imposed on
the full integrand along the homotopy.

**Theorem (sign rule).** In a jet subgraph, a soft momentum `k` flowing into a line that
subsequently reaches the final state produces poles in `k⁻` in the lower half-plane, and one
flowing into a line that comes from the initial state produces poles in the upper half-plane,
for jets in the plus direction with the routing conventions of `FeynmanIntegrals` Layer 0. So
if all attachments of the soft subgraph to a jet are to final-state lines, the deformation
exists and the Wilson line is future-pointing; if all are to initial-state lines, it exists and
the Wilson line is past-pointing. This is Convention 9 as a theorem, and it is the general
statement behind the path assignment that `TransverseMomentumDistributions` Layer 2.4 derives
for its two processes.

**Theorem (several soft momenta).** The same for the product contour in the minus components of
all soft momenta attached to one jet, under the hypothesis that the half-plane is the same for
every attachment; the hypothesis is the `Prop` argument `GlauberDeformable R` used in Layer 5.6.
Prove `GlauberDeformable` for every leading reduced graph of the classes `formFactor`,
`annihilation` and `dis`.

### 6.3 The obstruction

Statement to prove, as a counterexample: in the class `drellYan`, the one-loop graph in which a
gluon is exchanged between the spectator lines of the two incoming hadron-like systems, each
system modelled as an active and a spectator line emerging from a vertex, has poles in `k⁻` on
both sides of the real axis at distance `O(lam² Q)` from each other — one from the active line
before the hard vertex and one from the spectator line reaching the final state — and likewise
in `k⁺`. The contour cannot be displaced by `lam Q` in either variable, `GlauberDeformable`
fails for the corresponding reduced graph, and the contribution of the Glauber set to this graph
and cut is of leading power.

### 6.4 Light-front perturbation theory and the cancellation in sums over cuts

Light-front form. For a jet subgraph in the plus direction, integrate the minus components of
its loop momenta by residues (`TauCeti.Analysis.Contour.Residue.Theorem`). **Theorem.** The
result is a sum over orderings of the vertices in the light-front time `x⁺` of products of
factors `(P⁻ - ∑_{lines in state} κ_j⁻ ± iε)⁻¹`, one per intermediate state, with `κ_j⁻` the
on-shell minus momentum of line `j`, `+ iε` for states before the hard vertex in the amplitude
and the complex conjugate in the conjugate amplitude; lines of negative plus momentum do not
occur. Prove it for scalar lines and then with numerators, the instantaneous terms being
tracked explicitly.

The algebraic identity. For real `D_1, …, D_n` and real `E`,

`∑_{c = 0}^{n} [∏_{f ≤ c} (E - D_f + iε)⁻¹] [∏_{f > c} (E - D_f - iε)⁻¹] × (cut factor at c)`

summed over the position `c` of the final-state cut among `n` successive intermediate states,
with the cut factor `-2πi δ(E - D_c)` realised as the difference of the two `iε` prescriptions,
telescopes to the difference of the all-`+iε` and all-`-iε` products. Prove it as an identity of
tempered distributions in `E`. It is at theorem level; it is the largest-time equation of
`FeynmanIntegrals` Layer 7 restricted to a chain of states.

**Theorem (cancellation of final-state poles).** Let `R` be a leading reduced graph of the class
`drellYan`, and let the weight on final states be independent of the final state of the
spectator part of a jet `J` (the part not entering the hard subgraph). Then, in the sum over
all cuts of the final-state interactions of `J` at fixed attachments of the soft subgraph, the
intermediate states after the hard vertex contribute no pole in the minus components of the
soft momenta: the summed integrand depends on those components only through the states before
the hard vertex, whose poles all lie in one half-plane. Consequently `GlauberDeformable` holds
for the cut-summed integrand, the Wilson line is past-pointing, and the remainder theorem of 5.6
applies to the sum over cuts.

The published proofs (Collins, Soper and Sterman 1985 and 1988; Collins 2011, ch. 14) establish
this by the light-front argument above applied to general graphs; the argument is intricate and
is not at theorem level. The roadmap's target isolates the two ingredients — the light-front
form of a jet, and the telescoping identity — as theorems, and states the cancellation for a
reduced graph with the completeness of the sum over spectator cuts as an explicit `Prop`
argument, `SpectatorInclusive w J`.

This is the general statement behind the *Glauber cancellation* hypothesis of
`TransverseMomentumDistributions` Layer 2.4; the process-specific instances are
`FactorizationTheorems` Layers 3 and 4.

### 6.5 When the sum over cuts is incomplete

Statement to prove, as a counterexample: for the graph of 6.3 with a weight that distinguishes
the two cuts of the spectator exchange — for instance one that requires the spectator system of
one hadron to emerge with fixed momentum — `SpectatorInclusive` fails, the telescoping identity
does not apply, and the weighted cut sum retains a leading-power contribution from the Glauber
set, computed explicitly. The consequences for hard diffraction in hadron–hadron collisions and
for transverse-momentum-dependent factorisation with observed hadrons in hadron–hadron
collisions are `FactorizationTheorems` Layer 7.

### Examples

- One gluon exchanged between an outgoing quark and a spectator in the class `dis`: the poles in
  `k⁻`, both in one half-plane, the displaced contour, and the future-pointing eikonal
  denominator.
- The spectator–spectator exchange of 6.3 with all masses and transverse momenta given
  numerically: the two pole positions and their separation as a function of `lam`.
- The telescoping identity for `n = 1` and `n = 2`, written out.
- The sum over the three cuts of the one-loop spectator–spectator exchange with an inclusive
  weight: the trapped poles cancel, and the remaining integrand is deformable.

### Dependencies

Layers 0, 2, 3 and 5. `TauCeti.Analysis.Contour.HomologyCauchy`,
`TauCeti.Analysis.Contour.Cauchy.Homotopy`, `TauCeti.Analysis.Contour.JordanLemma`,
`TauCeti.Analysis.Contour.Residue.Theorem`, `TauCeti.Analysis.Contour.PerWindow.CPV`,
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`,
`Mathlib.Analysis.Distribution.TemperedDistribution`. From `FeynmanIntegrals`: Layer 0 (routing
conventions), Layer 5 (the `iε` prescription), Layer 7 (cut graphs and the largest-time
equation).

---

## Layer 7: hard, jet and soft functions; rapidity divergences; the Sudakov form factor

References: Sudakov, *Sov. Phys. JETP* 3 (1956) 65; Mueller, *Phys. Rev.* D20 (1979) 2037;
Collins, *Phys. Rev.* D22 (1980) 1478; Sen, *Phys. Rev.* D24 (1981) 3281; Collins and Soper,
*Nucl. Phys.* B193 (1981) 381; Magnea and Sterman, *Phys. Rev.* D42 (1990) 4222; Collins, in
*Perturbative QCD*, ed. Mueller, World Scientific (1989); Collins, *Foundations of Perturbative
QCD*, ch. 10.

### 7.1 Operator definitions and their graph expansions

Define, for a finite set of light-like or near-light-like directions with representations and
`iε` signs:

- the *soft function*: the vacuum expectation value of the product of the Wilson lines of
  `Renormalization` Layer 5 along those directions, joined at a point;
- the *jet function* of a direction: the matrix element between the vacuum and the on-shell
  parton of that direction of the parton field multiplied by a Wilson line in the direction `w`
  of 5.2;
- the *hard function*: defined by the subtraction of 5.6 as `C_hard` summed over graphs, and
  not by an independent operator formula.

**Theorem (factorised form).** For the class `formFactor`, at each order, the sum over graphs
`Γ` and over leading reduced graphs `R` of `C_R Γ` is equal to the order-by-order expansion of
the product of the hard function, the two jet functions, and the soft function divided by the
two eikonal jet functions that remove the double counting of the soft–collinear overlap, each
factor with the same rapidity regulator. The proof assembles 5.4, 5.5 and the Möbius form of
5.6: after the Ward identities, the approximated integrand of a reduced graph is a product of
the graphs of the three kinds of factor, and the sum over reduced graphs with given subgraphs
is the product of the sums. State the theorem with the classification of 2.2 and the
deformability of 6.2 as the facts it uses.

### 7.2 Rapidity divergences

Statements to prove:

- For exactly light-like `w`, the one-loop jet function and the one-loop soft function each
  contain an integral `∫ dk⁺ / k⁺` at fixed transverse momentum that is not regulated by
  dimensional regularisation: the integral over the rapidity of the gluon diverges at both ends
  for the soft function and at one end for the jet function.
- These divergences arise only from the region-overlap terms of 5.6, and they cancel in
  `∑_R C_R Γ` for each graph, because `Γ` has none. Consequently the product of 7.1 has a
  finite limit when the rapidity regulator is removed, for any regulator satisfying the axioms
  of the structure in `TransverseMomentumDistributions` Layer 2.3.
- With the off-light-cone regulator, each factor depends on the rapidity parameter
  `ζ = (2 p · w)² / |w²|` and the dependence is logarithmic, with the coefficient identified in
  7.4.

The cancellation theorem of `TransverseMomentumDistributions` Layer 2.3 is the statement of the
second item for the semi-inclusive combination of distribution, fragmentation function and soft
factor with its three named regulators; the item here is its graph-level cause for a general
product.

### 7.3 The Sudakov form factor to all orders

Define `sudakovFormFactor`: the coefficient of `γ^μ` in the on-shell matrix element of the
electromagnetic current between massless quark states of momenta `p₁` and `p₂`, with momentum
transfer `q` satisfying `|q²| = Q²`, space-like or time-like as an explicit argument,
dimensionally regulated, as a formal power series in the coupling
with coefficients meromorphic in `ε`.

Statements to prove:

- Factorisation: the instance of 7.1, with every hypothesis discharged — the classification by
  2.2, the leading regions by 3.3, deformability by 6.2 for the class `formFactor`, the Ward
  identities by 5.4 and 5.5, and `NoAccidentalCancellation` for the graphs of this class. This
  is the one process for which the roadmap carries the whole argument through, and it is the
  test that the general theorems have usable hypotheses.
- The evolution equation: `∂ log F / ∂ log Q² = (1/2) [K(ε, α_s(μ)) + G(Q²/μ², α_s(μ), ε)]`,
  with `K` a pure counterterm series defined from the soft function and `G` finite at `ε = 0`,
  and `dK / d log μ = - dG / d log μ = - γ_K`, where `γ_K = 2 Γ_cusp` is twice the light-like
  cusp anomalous dimension of `Renormalization` Layer 5.3. Derive it from the `ζ`-dependence of 7.2.
- One loop: the coefficients of `1/ε²` and `1/ε` and the finite part of `F` at order `α_s`,
  from the region contributions of the Layer 5 examples.
- Leading logarithms: from the evolution equation with the one-loop cusp anomalous dimension,
  the coefficient of `α_s^n log^{2n}` in `log F` vanishes for `n ≥ 2`; equivalently the leading
  double logarithms exponentiate.
- The comparison of Convention 10: with the kernel `K(t) = (α_s C_F / π) log(Q² / t) / t` at
  fixed coupling, `EpsilonEridani.QFT.Shower.Sudakov.sudakov K t Q²` equals the exponential of
  the leading double logarithm of `|F|²` with the infrared scale identified with `t`. The two
  objects agree at this accuracy and at no higher one, and the theorem states the accuracy.

### 7.4 The Collins–Soper equation

For a jet function with the off-light-cone regulator, at transverse separation `b_T` in the
Fourier-conjugate variable, **Theorem:**

`∂ log J / ∂ log √ζ = K(b_T, μ)`,

where `K` is defined as the corresponding derivative of the logarithm of the soft function with
respect to the rapidity of one of its Wilson lines. Statements to prove:

- the equation, from the factorised dependence on `w` established by 5.4: a change of `w`
  changes the jet function only through gluons in the soft-overlap region, whose effect is the
  stated derivative of the soft function;
- `K` does not depend on `ζ`;
- `K` does not depend on the jet function it acts on — not on the parton's momentum fraction,
  and on its flavour only through the colour representation;
- `dK / d log μ = - γ_K`, and the anomalous dimension of `J` in `μ` is linear in `log ζ`
  with slope `- γ_K / 2`, where `γ_K = 2 Γ_cusp` with `Γ_cusp` the light-like cusp anomalous
  dimension of `Renormalization` Layer 5.3, so that `γ_K = 2 α_s C_F / π` at one loop, in
  agreement with the one-loop kernel below; `γ_K` is the argument `gammaCusp` of the existing
  `CuspConsistent`;
- `K` is the same for a jet function with a past-pointing and with a future-pointing Wilson
  line, and for the cut jet functions of 7.5 in the initial and in the final state: the
  derivative of the soft function with respect to the rapidity of one line does not depend on
  the `iε` signs of the others. This is what makes one kernel govern distributions and
  fragmentation functions alike;
- one loop: `K = - (α_s C_F / π) log(μ² b_T² e^{2 γ_E} / 4)`.

The second, third and fourth items are, respectively, the property that
`EpsilonEridani.Particles.Parton.TMD.CollinsSoper.TmdRgSystem` builds into the type of
`csKernel`, the property that module records as an input, and the two clauses of
`CuspConsistent`. Construct the `TmdRgSystem` of the jet function and prove `CuspConsistent`,
`SatisfiesMuRg` and `SatisfiesZetaRg` for it. The solution of the equations, the transform to
impact-parameter space as a theory, and the non-perturbative region of large `b_T` are
`TransverseMomentumDistributions` Layer 3.

### 7.5 Cut functions for inclusive observables

The functions of 7.1 are amplitude-level. An inclusive cross section needs their counterparts
on cut graphs, built with the cut-graph sums of `FeynmanIntegrals` Layer 7.

Define:

- the *inclusive jet function* of a direction: the sum over cuts of the two-point function of
  the parton field with its Wilson line in the direction `w`, as a function of the invariant
  mass of the cut, or of the transverse position conjugate to the transverse momentum of the
  observed parton;
- the *beam function*: the same cut two-point function with the parton entering the hard
  subgraph from an initial-state jet, as a function of the light-cone fraction and of the
  virtuality or transverse position; it is defined for an on-shell partonic initial state, and
  its matrix element in a hadron belongs to `FactorizationTheorems`;
- the *cut soft function*: the sum over cuts of the product of Wilson lines of 7.1, with a
  weight function of the momenta crossing the cut as explicit data.

Statements to prove:

- **Factorised form on cut graphs.** For the classes `annihilation` and `dis`, and a weight
  that is additive over the final-state momenta and is the sum of a function of each jet's
  momenta and of the soft momenta at leading power, the cut-graph sum with the subtractions of
  5.6 is the product of the hard function, its conjugate, the cut jet or beam functions and the
  cut soft function, convolved in the variable conjugate to the weight. The proof is that of
  7.1 on each side of the cut together with the sum over cuts of Layer 6.4 inside each factor.
- **Unweighted cuts.** With weight one, the cut soft function is one at every order, and the
  inclusive jet function integrated over its invariant mass is one: the cancellations of Layer
  4 inside each factor.
- **Rapidity divergences.** The cut jet and beam functions at fixed transverse position carry
  the rapidity divergences of 7.2, which cancel against the cut soft function in the product;
  the functions at fixed invariant mass have none.
- **One loop.** The inclusive jet function at fixed invariant mass and the cut soft function
  for the hemisphere weight, at first order, with their poles.

The thrust distribution and its deep-inelastic counterpart are the instances with the
hemisphere weight; their statements as cross sections, and the relation of the beam function to
a parton density, are `FactorizationTheorems` Layer 6.

### Examples

- The one-loop soft function for two light-like directions with the off-light-cone regulator,
  and the one-loop `K` obtained from it.
- The one-loop quark jet function and its `ζ`-dependence, checked against the Collins–Soper
  equation.
- The abelian form factor with a photon mass, in the leading double-logarithmic approximation:
  `F = exp(-(α / 4π) log²(Q² / photonMass²))`, obtained from the abelian exponentiation of 5.5,
  compared with the dimensional-regularisation form.
- `sudakovLogTmd` of `EpsilonEridani.Particles.Parton.TMD.CollinsSoper` as the solution of the
  system constructed in 7.4 at one loop with fixed coupling.

### Dependencies

Layers 0–6. `EpsilonEridani.Particles.Parton.TMD.CollinsSoper`,
`EpsilonEridani.QFT.Shower.Sudakov`, `EpsilonEridani.QFT.QCD.RepresentationColor`,
`EpsilonEridani.QFT.QCD.Basic`. From `FeynmanIntegrals`: Layer 4 (Laurent expansions in `ε`),
Layer 6 (the electromagnetic vertex). From `Renormalization`: Layer 2 (renormalisation-group
equations), Layer 5 (Wilson-line operators, the cusp anomalous dimension). From
`TransverseMomentumDistributions`: Layer 2.3 (rapidity regulators).

---

## Dependency graph

```
   FeynmanIntegrals (L0-L7)            Renormalization (L4, L5)
          |                                     |
          v                                     |
  Layer 0  light-cone components, scalings,     |
           region assignments                   |
          |                                     |
          v                                     |
  Layer 1  contour deformation, Landau          |
           equations, Coleman-Norton            |
          |                                     |
          v                                     |
  Layer 2  reduced graphs, classification,      |
           order on pinch surfaces              |
          |                                     |
          v                                     |
  Layer 3  infrared degree, suppression,        |
           leading regions, completeness        |
          |            \                        |
          v             \                       v
  Layer 4  cancellation  +---->  Layer 5  approximators, Ward-identity
           (KLN, safe             ^        decoupling, nested subtraction
           weights)               |              |          ^
             ^                    |              v          |
             |                    +------  Layer 6  Glauber region:
   JetsAndEventShapes L0.3                 deformation, obstruction,
   RadiativeCorrections L0.3-0.5           cancellation over cuts
                                                 |
                                                 v
                                  Layer 7  hard, jet, soft functions;
                                           Sudakov form factor;
                                           Collins-Soper equation
                                                 |
                                                 v
                         FactorizationTheorems; TransverseMomentumDistributions L3
```

Layers 0–2 need only `FeynmanIntegrals`. Layer 3 adds the Feynman rules. Layer 4 needs Layers
0–3 and, for the abelian soft theorem alone, the eikonal identity of Layer 5.5. Layers 5 and 6
are mutually dependent in one place: the remainder theorem of 5.6 takes the deformability of
6.2 as a hypothesis, and 6.2 uses the soft approximation of 5.1; neither uses the other's
conclusions. Layer 7 needs everything before it.

## Acceptance examples

The roadmap is complete when the following are statements in EpsilonEridani with proofs, or,
where marked, with explicitly named hypotheses:

1. `k² = 2 k⁺ k⁻ + k_T · k_T` for every light-cone basis of Minkowski space, the boost law
   `(k⁺, k⁻, k_T) ↦ (e^ψ k⁺, e^{-ψ} k⁻, k_T)`, and the table of virtuality exponents of the
   named scalings.
2. The mixed-denominator lemma of Layer 0.4 with its remainder exponent, and its three
   corollaries for the soft, ultrasoft and Glauber scalings.
3. The several-variable deformation theorem of Layer 1.1 for an integral over a compact real
   domain, and Gordan's theorem, each in its mathematics directory with no physics hypotheses.
4. The necessity of the Landau equations in parametric form for the dimensionally regulated
   Feynman integral, and the equivalence with the momentum form for first-type solutions.
5. The Coleman–Norton bijection between physical solutions with a given reduced graph and
   vertex-position assignments modulo translation.
6. For the one-loop massless vertex with on-shell legs: the complete solution set of the Landau
   equations, with a proof that there are no further solutions.
7. The bubble at its normal threshold is singular and at its pseudo-threshold is not, certifying
   that the Landau equations are necessary and not sufficient.
8. The classification theorem for the four kinematic classes, both directions, and the Landshoff
   configuration as a physical solution with two disconnected hard vertices outside those
   classes.
9. The partial order on reduced graphs, its combinatorial characterisation, and the explicit
   posets for the one-loop vertex and the two two-loop vertex topologies.
10. The suppression theorem of Layer 3.2 with `NoAccidentalCancellation` as an explicit
    hypothesis, that hypothesis proved for scalar denominators at non-exceptional intrinsic
    coordinates, and the leading-region theorem in axial and in covariant gauge.
11. A soft-quark exchange exhibited as a pinch surface of infrared degree one, and the scalar
    cubic theory in six dimensions shown to have no soft leading regions.
12. The sum over cuts of every massless graph of the current two-point function is analytic at
    `ε = 0` for time-like momentum; at one loop the two cuts have opposite `1/ε²` and `1/ε`
    poles and the sum is computed.
13. The Lee–Nauenberg theorem for formal perturbation series over a finite-dimensional space,
    and proofs that `kln_final_state`, `kln_initial_state_survives`, `ir_cancellation` and
    `ir_cancellation_regulator_independent` of `RadiativeCorrections` are instances of the
    statements of Layer 4.
14. All-orders finiteness of the weighted cut sum for an `IsIRCSafeOfOrder δ` weight in
    annihilation,
    with its hypotheses, and a weight failing collinear safety for which a graph has a pole.
15. The Grammer–Yennie identity; the abelian Ward identity for any number of `K` photons on an
    open line and on a closed loop; the abelian eikonal identity in momentum space, derived from
    `orderedProdIntegral_eq`.
16. The non-abelian decoupling theorems of Layers 5.4 and 5.5 with the summed class of graphs,
    the on-shell and polarisation conditions and the `iε` sign as explicit arguments, proved
    from the Slavnov–Taylor identity of `Renormalization` Layer 4; and the super-leading
    cancellation of Layer 3.4 as a corollary.
17. The Möbius form of the region contributions and the remainder theorem of Layer 5.6 with its
    three hypotheses; the one-loop vertex decomposed into four region contributions whose sum
    reproduces it up to `O(lam)`, with two different rapidity regulators.
18. The graph-level equivalence of Layer 5.7 between the nested subtraction and the expansion
    by regions with overlap subtractions, under the scalelessness hypothesis.
19. The contour-deformation theorem and the sign rule of Layer 6.2; `GlauberDeformable` proved
    for all leading reduced graphs of the form-factor, annihilation and deep-inelastic classes.
20. The spectator–spectator exchange in the Drell–Yan class with poles pinching at separation
    `O(lam² Q)`, certifying that `GlauberDeformable` is a genuine hypothesis.
21. The light-front form of a jet subgraph, the telescoping identity as an identity of tempered
    distributions, the cancellation theorem of Layer 6.4 under `SpectatorInclusive`, and the
    counterexample of Layer 6.5 when that hypothesis fails.
22. The Sudakov form factor of a massless quark: factorised for every graph with no remaining
    hypothesis, its evolution equation with the cusp anomalous dimension, its one-loop
    coefficients, the exponentiation of the leading double logarithms, and the stated-accuracy
    comparison with `EpsilonEridani.QFT.Shower.Sudakov.sudakov`.
23. The Collins–Soper equation derived from the operator definitions, with the kernel proved
    independent of the rapidity scale and of the jet function, and a constructed instance of
    `TmdRgSystem` satisfying `CuspConsistent`, `SatisfiesMuRg` and `SatisfiesZetaRg`.

## References

- L. D. Landau, "On analytic properties of vertex parts in quantum field theory", *Nucl. Phys.*
  13 (1959) 181.
- S. Coleman and R. E. Norton, "Singularities in the physical region", *Nuovo Cimento* 38 (1965)
  438.
- R. J. Eden, P. V. Landshoff, D. I. Olive and J. C. Polkinghorne, *The Analytic S-Matrix*,
  Cambridge University Press (1966).
- S. Weinberg, "High-energy behavior in quantum field theory", *Phys. Rev.* 118 (1960) 838.
- K. Hepp, "Proof of the Bogoliubov–Parasiuk theorem on renormalization", *Commun. Math. Phys.*
  2 (1966) 301.
- F. Bloch and A. Nordsieck, "Note on the radiation field of the electron", *Phys. Rev.* 52
  (1937) 54.
- T. Kinoshita, "Mass singularities of Feynman amplitudes", *J. Math. Phys.* 3 (1962) 650.
- T. D. Lee and M. Nauenberg, "Degenerate systems and mass singularities", *Phys. Rev.* 133
  (1964) B1549.
- D. R. Yennie, S. C. Frautschi and H. Suura, "The infrared divergence phenomena and high-energy
  processes", *Ann. Phys.* 13 (1961) 379.
- G. Grammer and D. R. Yennie, "Improved treatment for the infrared-divergence problem in
  quantum electrodynamics", *Phys. Rev.* D8 (1973) 4332.
- P. V. Landshoff, "Model for elastic scattering at wide angle", *Phys. Rev.* D10 (1974) 1024.
- G. Sterman, "Kinoshita's theorem in Yang–Mills theories", *Phys. Rev.* D14 (1976) 2123.
- E. C. Poggio and H. R. Quinn, "The infrared behavior of zero-mass Green's functions and the
  absence of quark confinement in perturbation theory", *Phys. Rev.* D14 (1976) 578.
- G. Sterman and S. Weinberg, "Jets from quantum chromodynamics", *Phys. Rev. Lett.* 39 (1977)
  1436.
- G. Sterman, "Mass divergences in annihilation processes. I. Origin and nature of divergences
  in cut vacuum polarization diagrams", *Phys. Rev.* D17 (1978) 2773; "II. Cancellation of
  divergences in cut vacuum polarization diagrams", *Phys. Rev.* D17 (1978) 2789.
- S. B. Libby and G. Sterman, "Jet and lepton-pair production in high-energy lepton-hadron and
  hadron-hadron scattering", *Phys. Rev.* D18 (1978) 3252; "Mass divergences in two-particle
  inelastic scattering", *Phys. Rev.* D18 (1978) 4737.
- V. V. Sudakov, "Vertex parts at very high energies in quantum electrodynamics", *Sov. Phys.
  JETP* 3 (1956) 65.
- A. H. Mueller, "Asymptotic behavior of the Sudakov form factor", *Phys. Rev.* D20 (1979) 2037.
- J. C. Collins, "Algorithm to compute corrections to the Sudakov form factor", *Phys. Rev.* D22
  (1980) 1478.
- A. Sen, "Asymptotic behavior of the Sudakov form factor in quantum chromodynamics", *Phys.
  Rev.* D24 (1981) 3281.
- J. C. Collins and D. E. Soper, "Back-to-back jets in QCD", *Nucl. Phys.* B193 (1981) 381.
- G. T. Bodwin, S. J. Brodsky and G. P. Lepage, "Initial-state interactions and the Drell–Yan
  process", *Phys. Rev. Lett.* 47 (1981) 1799.
- G. T. Bodwin, "Factorization of the Drell–Yan cross section in perturbation theory", *Phys.
  Rev.* D31 (1985) 2616.
- J. M. F. Labastida and G. Sterman, "Inclusive hadron-hadron scattering in the Feynman gauge",
  *Nucl. Phys.* B254 (1985) 425.
- J. C. Collins, D. E. Soper and G. Sterman, "Factorization for short distance hadron-hadron
  scattering", *Nucl. Phys.* B261 (1985) 104; "Soft gluons and factorization", *Nucl. Phys.*
  B308 (1988) 833; "Factorization of hard processes in QCD", in *Perturbative QCD*, ed. A. H.
  Mueller, World Scientific (1989).
- J. C. Collins, "Sudakov form factors", in *Perturbative QCD*, ed. A. H. Mueller, World
  Scientific (1989).
- L. Magnea and G. Sterman, "Analytic continuation of the Sudakov form factor in QCD", *Phys.
  Rev.* D42 (1990) 4222.
- G. Sterman, *An Introduction to Quantum Field Theory*, Cambridge University Press (1993).
- M. Beneke and V. A. Smirnov, "Asymptotic expansion of Feynman integrals near threshold",
  *Nucl. Phys.* B522 (1998) 321.
- V. A. Smirnov, *Applied Asymptotic Expansions in Momenta and Masses*, Springer (2002).
- C. W. Bauer, S. Fleming, D. Pirjol and I. W. Stewart, "An effective field theory for collinear
  and soft gluons: heavy to light decays", *Phys. Rev.* D63 (2001) 114020.
- J. C. Collins and A. Metz, "Universality of soft and collinear factors in hard-scattering
  factorization", *Phys. Rev. Lett.* 93 (2004) 252001.
- A. V. Manohar and I. W. Stewart, "The zero-bin and mode factorization in quantum field
  theory", *Phys. Rev.* D76 (2007) 074002.
- B. Jantzen, "Foundation and generalization of the expansion by regions", *JHEP* 12 (2011) 076.
- J. C. Collins, *Foundations of Perturbative QCD*, Cambridge University Press (2011).

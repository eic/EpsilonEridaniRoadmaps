# Roadmap: jets, event shapes, and the strong coupling

Observables built from the whole hadronic final state rather than from a single identified
hadron: jet definitions and the theorems that make them calculable, event shapes, and the
extraction of the strong coupling from their distributions. Heavy-quark jets are here too,
because their definition is a jet definition.

The organising idea is that a jet algorithm and an event shape are the same kind of object — a
real-valued function on a finite multiset of momenta — and that what makes either useful is a
theorem, not a recipe. An observable earns a fixed-order prediction by being infrared and
collinear safe, so safety is the first thing defined here and the property every later definition
is measured against. A jet algorithm earns its name by terminating, by partitioning its input,
and by being safe in that same sense. An event shape earns a resummation by having a controlled
logarithmic structure at the endpoint of its distribution. Each is stated as a theorem with
hypotheses, and where the theorem is not available in the generality one would like, this roadmap
says so rather than asserting it.

The final application is the extraction of `α_s` from a measured distribution, formulated as an
inverse problem: the perturbative prediction is a map from the coupling to a distribution and the
fit is its inversion, so the roadmap asks for the conditions under which that inversion is well
posed. That framing also makes the scheme dependence explicit — an extracted coupling is a number
in a renormalisation scheme at a scale, and two extractions are comparable only after a stated
conversion.

The deep-inelastic setting adds one structural ingredient that electron–positron annihilation
does not need: a frame. The hadronic final state is not back-to-back in the laboratory, so every
definition here is stated in the Breit frame, where the exchanged boson is purely spacelike and
the struck-quark direction defines a current hemisphere. The Breit frame is therefore built in
this roadmap, not assumed.

## Scope

- Infrared and collinear safety of an observable on a final state, stated as a limit condition,
  with the Kinoshita–Lee–Nauenberg finiteness statement and with explicit counterexamples.
- Recombination schemes, and the theorem that a scheme preserves safety.
- The Breit frame for deep-inelastic kinematics: its construction from `DisKinematics`, the
  current and target hemispheres, and the observables that depend on the hemisphere split.
- Sequential recombination jet algorithms as a family parameterised by the distance exponent,
  covering the anti-`k_T`, Cambridge–Aachen and `k_T` cases; termination, the partition
  property, and infrared and collinear safety of jet multiplicity and jet momenta.
- The exclusive Durham algorithm, its resolution scales, and the monotonicity that makes
  `n`-jet rates well defined as functions of the cut.
- Cone algorithms, the stability condition, and a precise statement of the collinear-safety
  failure of the naive seeded cone.
- Thrust, the jet broadenings, the `C` parameter and the angularities, each as a function on
  final states, each proved safe, each with its two-jet endpoint identified.
- Fixed-order event-shape distributions at leading and next-to-leading order in the coupling,
  with the endpoint singularities explicit.
- Resummation: the Sudakov exponent of an event shape, exponentiation to next-to-leading
  logarithmic accuracy under a stated recursive-safety hypothesis, and matching to the
  fixed-order result under a stated matching scheme.
- Extraction of the coupling as an inverse problem, with local well-posedness proved and the
  scheme and scale of the extracted value carried in the statement.
- Flavoured jets: the infrared-safety failure of naive flavour assignment, and a flavoured
  algorithm whose safety is proved.
- Heavy-quark jets, jet substructure observables for them, and the dead-cone statement.

Not included. The inclusive spectrum of identified final-state hadrons and the fragmentation
functions describing it belong to `Hadronization`; this roadmap consumes from there the
non-perturbative power corrections to event-shape means and supplies nothing to it. Jets as a
probe of the nuclear medium — quenching, transport coefficients, medium-induced broadening — are
`NuclearMedium`, which cites the definitions established here and does not restate them. The
running of the coupling, the beta function, and the DGLAP splitting kernels governing the
collinear limits belong to `CollinearEvolution`; this roadmap uses the coupling as a function of
scale and the kernels as given data. The normalising inclusive cross section is
`InclusiveStructureFunctions`. Transverse-momentum-dependent factorisation and Collins–Soper
evolution are `TransverseMomentumDistributions` even where the observable is a transverse
momentum; the boundary is that a jet observable here is a function of a final state, while a
transverse-momentum distribution there is a matrix element. Small-`x` jet production and the
saturation scale are `SmallXAndSaturation`; jets in photoproduction, including the
resolved-photon contribution, `Photoproduction`; quarkonium production inside a jet,
`QuarkoniaAndExotics`; rapidity-gap and diffractive jet topologies, `Diffraction`; the underlying
event and multi-parton interactions, `MultiPartonCorrelations`; QED radiative corrections to the
measured lepton and the reconstructed kinematics, `RadiativeCorrections`. Lattice determinations
of the coupling are `LatticeBridge`, and this roadmap's extraction is comparable to a lattice
value only through the scheme conversion of Layer 5.

Material developed by this roadmap belongs under `EpsilonEridani/QFT/Jets/`, with
`Jets/Observable/` for safety and the counterexamples, `Jets/Frame/` for the Breit frame,
`Jets/Algorithm/` for the clustering and cone algorithms, `Jets/EventShape/` for the shape
observables and their fixed-order distributions, `Jets/Resummation/` for the Sudakov exponent
and matching, `Jets/Coupling/` for the extraction, and `Jets/Flavour/` for flavoured and
heavy-quark jets.

## Conventions and coordination with upstream

1. **A final state is a finite multiset of momenta in an abstract real vector space carrying a
   bilinear form**: `V` with `[AddCommGroup V] [Module ℝ V]` and
   `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bilin V`, exactly as `DisKinematics` uses them.
   A multiset, not a list and not a finite set: a list would burden every observable with an
   irrelevant ordering hypothesis, and a finite set would identify two partons of equal momentum,
   which is precisely the configuration the collinear limit produces. The trap avoided is proving
   safety for an observable that was secretly order-dependent.

2. **Energies and angles are relative to an explicit timelike reference vector, never implicit.**
   A frame is `n : V` with `g n n > 0`; the energy of `p` is `g p n` normalised by `n`. Every
   distance measure, event shape and hemisphere assignment takes the frame as an argument. The
   trap avoided is treating Breit-frame and laboratory-frame statements as interchangeable; a
   theorem proved in one frame is a different theorem in the other.

3. **For deep-inelastic kinematics the frame is the Breit frame unless another is named**, fixed
   by `q` purely spacelike as `(0,0,0,-Q)` with the incoming parton along `+z`. Layer 1
   constructs it and proves it unique up to a rotation about the `q` axis. A laboratory-frame
   statement is obtained by applying the boost, not by restating the definition.

4. **The `+z` axis of the Breit frame points along the incoming parton, so the struck quark
   recoils into `-z` at leading order**; the current hemisphere is `-z`, the target hemisphere
   `+z`. Fixing this once avoids the sign trap that makes current-hemisphere event shapes
   disagree between sources by a reflection.

5. **Safety is a limit condition, not continuity.** Collinear safety is exact invariance under
   replacing `p` by `z • p` and `(1 - z) • p` for `z ∈ [0,1]`; infrared safety is that adding `p`
   and letting `p → 0` returns the value on the original state, phrased with `Filter.Tendsto`
   into `nhds`. An observable satisfying both need not be continuous in the final state — a
   recombination algorithm's jet multiplicity is not, because the clustering sequence jumps at a
   tie in the distance measure. The trap avoided is assuming continuity and so proving nothing.

6. **A jet algorithm is specified as a relation between an input multiset and an output
   partition; the algorithm is then an existence-and-uniqueness theorem for that relation.**
   Writing the recursion first and asking afterwards what it computes fuses the termination
   argument with the mathematical content. Separated, the safety theorems are about the
   specification and hold for every implementation meeting it.

7. **The distance exponent is a real parameter `p`**, with `p = 1` the `k_T` algorithm, `p = 0`
   Cambridge–Aachen and `p = -1` anti-`k_T`. No theorem is stated separately for the three unless
   its hypothesis genuinely differs; a theorem needing `p < 0` says `p < 0` rather than naming
   anti-`k_T`.

8. **Recombination is the `E` scheme by default: a merged pseudojet is the momentum sum, and is
   massive even when its constituents are not.** Schemes that rescale to keep pseudojets massless
   are separate data and inherit no theorem proved for the `E` scheme. The trap avoided is
   applying a massless-derived distance measure to a massive pseudojet silently.

9. **Event shapes are normalised so the two-jet configuration sits at zero**, on a bounded
   interval to its right. The thrust variable is therefore `τ = 1 - T`, and "the endpoint"
   unqualified means `τ = 0`, where the logarithms live.

10. **An angularity carries its exponent `a` and its hypotheses explicitly.** `τ_a` interpolates
    between thrust at `a = 0` and broadening at `a = 1`; the Layer 4 resummation statements
    require `a < 1` and say so, because the broadening endpoint is governed by a different
    exponent.

11. **A resummed prediction carries a named logarithmic accuracy as part of its statement.** A
    theorem asserting exponentiation says which logarithms it controls; there is no unqualified
    "resummed distribution" here.

12. **An extracted coupling is a triple: value, renormalisation scheme, scale.** No Layer 5
    definition returns a bare real, and scheme conversion is an explicit map with its own lemmas.
    The trap avoided is attributing a scheme difference to the data.

13. **A flavoured jet carries its flavour assignment as part of the algorithm's output, not as a
    function applied afterwards.** Flavour safety is then a property of the algorithm, which is
    the only way it can be proved: post-hoc assignment is not infrared safe, and Layer 6 exhibits
    why.

14. **Names follow the upstream libraries' vocabulary**: `Multiset`, `Finpartition` where the
    object really is a partition of a finite set, `Filter.Tendsto` for limits, Mathlib's
    `Asymptotics` for order relations, no private partition type and no bespoke order relation.
    Where Mathlib has no name for something needed here, it is built here in the shape Mathlib
    would want and the absence is recorded below.

## Existing upstream material used by the roadmap

- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` supplies `Bilin V`, `DisKinematics` with
  its `p`, `k`, `kPrime`, `q` and the relation `q = k - kPrime`, and the invariants `Q2`, `xBj`,
  `yInel`, `W2` with `W2_eq_with_Q2`. Layer 1 builds the Breit frame from exactly this data, so
  no separate kinematic vocabulary is introduced. `.Bounds` and `.AccessMethods` give the
  physical region and the reconstruction of `x` and `Q²` from measured quantities, which Layer 5
  needs to say over what region a fit ranges.
- `EpsilonEridani.QFT.QCD.Basic` supplies `ColorFactors`, `beta0`, `beta1`,
  `IsAsymptoticallyFree`, and `oneLoopAlphaS` with `oneLoopAlphaS_nonneg`. The coupling here is
  that function of scale; nothing rederives it. `EpsilonEridani.QFT.QCD.OneLoopBeta` and
  `.OneLoopBetaFromScalars` are its provenance. `EpsilonEridani.QFT.QCD.CasimirDerivation`,
  `.SUNGenerators`, `.RepresentationColor` and `EpsilonEridani.Mathematics.LieAlgebra.Casimir`
  give the colour factors appearing in the Layer 4 anomalous dimensions.
- `EpsilonEridani.QFT.Shower.Sudakov` supplies `sudakov K t T = Real.exp (-(∫ s in t..T, K s))`
  with `sudakov_pos`, `sudakov_self` and `sudakov_le_one`, and the veto identity
  `vetoSeries_eq_exp_neg` resting on `EpsilonEridani.Mathematics.OrderedSimplexIntegral`. Layer 4
  defines the event-shape Sudakov exponent as an instance of this `sudakov`, inheriting the
  positivity and boundary properties rather than reproving them.
- `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.TopologyEnumeration` and
  `.OneLoopEvaluation` for the Layer 3 fixed-order ingredients, with
  `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` and `.OneLoopScalars`
  for the regularisation in which the real–virtual cancellation of Layer 0 is stated.
- `EpsilonEridani.QFT.Factorization.Scales.Basic` for the two-scale hard kernel and the
  factorisation-scale-independence statements, which fix what "the prediction depends on the
  renormalisation scale" means in Layer 5;
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin` for the transform of Layer 4, with
  `.Collinear` and `.Properties` for the convolution algebra.
- `EpsilonEridani.QFT.Scattering.DIS.CrossSection` for the inclusive cross section that
  event-shape distributions are divided by, and
  `EpsilonEridani.Particles.Parton.Basic` for the flavour type of Layer 6.
- `EpsilonEridani.Relativity.LorentzGroup.Restricted.FromBoostRotationExtensions` for the
  boost–rotation decomposition, used in Layer 1 to state the Breit frame's uniqueness up to a
  rotation about the `q` axis; `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` for
  the momentum tensor of the `C` parameter.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator` and `.CauchyProblem.Basic` for the Layer 4
  resummation kernel: the renormalisation-group evolution of the soft function is a one-parameter
  semigroup with a generator, and this roadmap reproves neither existence nor uniqueness for it.
- `TauCeti.Analysis.Contour.PerWindow.CPV` and `TauCeti.Analysis.Contour.Cauchy.IntegralFormula`
  for the inverse transform recovering a distribution from a resummed exponent, with
  `TauCeti.Analysis.Contour.HigherOrder.Asymptotics` for the inverted integral near the endpoint.
- `TauCeti.Analysis.Calculus.InverseFunctionTheorem` and `.ImplicitFunctionTheorem` for the local
  invertibility making the Layer 5 extraction well posed, and `TauCeti.Analysis.Fredholm.Criteria`
  and `.CompactPerturbation` for the statement that a fit over a continuum of observable values
  is an inverse problem for a compact operator and so ill posed without regularisation.
- `TauCeti.Analysis.Asymptotics.Lemmas` and `.SumWindow` for the Layer 4 logarithmic counting;
  `TauCeti.Analysis.SpecialFunctions.Beta` and `.IncompleteBeta` for the Layer 3 phase-space
  integrals; `TauCeti.Analysis.Matrix.Spectrum` for the momentum-tensor eigenvalues;
  `TauCeti.Probability.Moments.Basic` for the event-shape moments that the Layer 5
  power-correction statements are about.
- `TauCeti.Order.Partition.Finpartition` for the jet assignment as a partition, with
  `TauCeti.Data.Finset.Basic` and `TauCeti.Data.Multiset.Filter` for the clustering recursion's
  finite bookkeeping.
- Mathlib: `Mathlib.Data.Multiset.Basic` and `Mathlib.Data.Sym.Sym2` for final states and the
  unordered pairs the distance measure lives on; `Mathlib.Order.WellFounded` and
  `Mathlib.Order.WellFoundedSet` for clustering termination;
  `Mathlib.Topology.MetricSpace.Basic` and `Mathlib.Order.Filter.AtTopBot.Basic` for the limit
  conditions; `Mathlib.Analysis.SpecialFunctions.Log.Basic`, `.Log.Deriv` and
  `Mathlib.Analysis.SpecialFunctions.Pow.Real` for the logarithms and the distance exponent;
  `Mathlib.Analysis.SpecialFunctions.Exponential`, `Mathlib.Analysis.SpecificLimits.Normed`,
  `Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic` and
  `Mathlib.Analysis.SpecialFunctions.Integrals.Basic` for the Sudakov exponential and its
  integrals; `Mathlib.Topology.Order.IntermediateValue`, `Mathlib.Analysis.Calculus.MeanValue`
  and `Mathlib.Analysis.Convex.Function` for the monotonicity, inversion and convexity
  arguments; `Mathlib.LinearAlgebra.BilinearForm.Basic` for the metric.
- ⚠ **There is no Breit frame anywhere upstream.** The string does not occur in EpsilonEridani,
  and neither Mathlib nor TauCeti has any notion of a distinguished frame for a scattering
  process. Layer 1 builds it, in `EpsilonEridani/QFT/Jets/Frame/`, as a structure over the same
  abstract `(V, g)` that `DisKinematics` uses, so that `NuclearMedium` and `Hadronization` can
  consume it from there rather than each constructing their own.
- ⚠ **There is no real-valued jet algorithm upstream.** `EpsilonEridani.Generator.Jets` contains
  an executable Durham implementation — `durhamY`, `closestPair`, `mergeClosest`, `clusterTo`,
  `durhamJets`, `jetMultiplicity`, `mergeScales` — but it is `Float`-valued over
  `EpsilonEridani.Numerics.FourMom`, its recursion `clusterTo` is bounded by an explicit `Nat`
  fuel argument rather than by a termination proof, and it carries no safety theorem. None of
  the theorems in this roadmap can be stated about it as it stands. Layer 2 therefore builds the
  real-valued specification here, and its final subsection states the refinement obligation
  relating the two: that the executable algorithm agrees with the specification up to the
  floating-point error, and that the fuel bound is never reached. That obligation is a theorem
  this roadmap asks for, not a change requested of the generator.
- ⚠ **Polylogarithms and harmonic sums are absent from both Mathlib and TauCeti.** The
  next-to-leading-order event-shape coefficient functions of Layer 3 need the dilogarithm. The
  roadmap builds the dilogarithm on the unit interval as an integral of `Real.log (1 - t) / t`,
  with the reflection and inversion identities it actually uses, in
  `EpsilonEridani/QFT/Jets/EventShape/Dilog.lean`, in the shape Mathlib would want for a special
  function: a `noncomputable def` on a stated domain, plus differentiability and the functional
  equations. Nothing in the roadmap is contingent on the dilogarithm arriving upstream.
- ⚠ **There is no Mellin or Laplace transform in TauCeti, and no saddle-point or steepest-descent
  machinery, and no Watson's lemma.** The inverse transform of Layer 4 therefore rests on
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin` for the forward transform and on
  TauCeti's contour integration for the inversion, and the endpoint asymptotics of the inverted
  integral are obtained by an explicit contour deformation stated in Layer 4, not by invoking a
  general asymptotic method. The asymptotic estimate needed is proved for the specific exponent
  at hand.
- ⚠ **`TauCeti.Analysis.PDE` is elliptic theory only and does not apply here.** The
  renormalisation-group evolution of Layer 4 is an evolution equation and is treated with
  `TauCeti.Analysis.Semigroups`.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.LorentzGroup.Boosts.Basic` and
  `Physlib.Relativity.LorentzGroup.Rotations` for the frame changes the recombination schemes of
  Layer 0 must commute with, and `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`
  for the invariant mass.

## Layer 0: final states, observables, and infrared and collinear safety

References: Sterman and Weinberg (1977); Kinoshita (1962); Lee and Nauenberg (1964); Catani and
Seymour (1997); Frixione, Kunszt and Signer (1996); Salam, *Towards jetography* (2010), §2.

### 0.1 Final states and observables

A `FinalState V` is a `Multiset V`, with `V` the abstract momentum space of convention 1. An
`Observable V` is a function `FinalState V → ℝ`. Prove the basic algebra of this type: it is a
commutative ring under pointwise operations, the constant observables are a subring, and an
observable that factors through `Multiset.card` is exactly one that depends only on the number
of particles. This last is stated because multiplicity is the standard unsafe observable and it
is convenient to have it characterised.

Define the total momentum `totalMomentum : FinalState V → V` as the multiset sum, the invariant
mass squared as `g (totalMomentum s) (totalMomentum s)`, and prove that both are additive under
multiset union. Prove that total momentum is invariant under collinear splitting and continuous
in the added momentum, so it is safe by the definitions below; it is the trivial example that
anchors the definition.

### 0.2 The soft and collinear operations

Two operations on final states, which are the whole content of the safety definition.

`addSoft s p = p ::ₘ s.momenta` adds one momentum. `splitCollinear s p z`, for `p` a member of
`s.momenta` and `z ∈ [0,1]`, erases one copy of `p` and inserts `z • p` and `(1 - z) • p`. Prove
that `splitCollinear` preserves `totalMomentum`, that `splitCollinear s p 0` and
`splitCollinear s p 1` return a state differing from `s` by the addition of a zero momentum, and
that the two operations commute in the sense that splitting a momentum other than the added one
commutes with adding it. These lemmas are needed because every safety proof below reasons by
cases on which momentum was split.

### 0.3 Infrared and collinear safety

An observable `O` is **collinear safe** if
`O (splitCollinear s p z) = O s` for every `s`, every `p ∈ s.momenta` and every `z ∈ [0,1]`.

It is **infrared safe** if for every `s`,
`Filter.Tendsto (fun p => O (addSoft s p)) (nhds 0) (nhds (O s))`,
with the topology on `V` the one it carries as a finite-dimensional real vector space.

`IsIRCSafe g O` is the conjunction. Prove: the safe observables form a subring; a composition
`f ∘ O` with `f : ℝ → ℝ` continuous is safe when `O` is; a finite sum or product of safe
observables is safe; and safety is preserved under restriction to a subset of the final state
only when that subset is itself defined safely, which is the statement that makes the
hemisphere definitions of Layer 1 nontrivial.

State the weaker notion that the literature also uses: an observable is **soft safe of order
`k`** if `O (addSoft s p) - O s = O(‖p‖^k)` as `p → 0`, using Mathlib's `Asymptotics`
vocabulary. Prove that order-`1` soft safety implies infrared safety, and that event shapes are
order-`1` soft safe while jet multiplicity is not soft safe at any order.

### 0.4 Counterexamples

The definitions are only useful with counterexamples, so these are milestones, not
illustrations.

Prove that `multiplicity s = (s.momenta.card : ℝ)` is neither collinear safe nor infrared safe,
exhibiting the witnesses in both cases. Prove that the observable "energy of the most energetic
particle" is infrared safe but not collinear safe, with an explicit `z` witnessing the failure.
Prove that "number of particles with energy above a fixed threshold `E₀`" is collinear unsafe and
also fails infrared safety at the threshold, and that it becomes safe if the threshold is
replaced by a sum of energies. Prove that the observable "invariant mass of the two most
energetic particles" is collinear unsafe.

### 0.5 Finiteness of the fixed-order prediction

The Kinoshita–Lee–Nauenberg statement. Working in dimensional regularisation as provided by
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`, fix a hard process with
a real-emission contribution `R` and a virtual contribution `V`, each a distribution on phase
space with poles in the regulator `ε`. The observable-weighted prediction at one order is the
sum of the real contribution weighted by `O` on the `(n+1)`-particle state and the virtual
contribution weighted by `O` on the `n`-particle state.

Milestone: for `O` infrared and collinear safe in the sense of 0.3, the `ε → 0` limit of that
sum exists and is finite. State it as the finiteness of a limit of a sum, not as a
regularisation recipe: the two terms diverge individually, and the theorem is that the
combination does not. The hypotheses are the safety of `O`, the factorisation of `R` in the soft
and collinear limits into the singular kernel times the lower-multiplicity matrix element, and
the corresponding pole structure of `V`. The soft and collinear factorisation is data taken from
`CollinearEvolution`; this layer states the finiteness theorem given it.

Prove the converse direction as a separate statement with a weaker conclusion: if `O` fails
collinear safety at a configuration of nonzero measure, the limit does not exist. That is what
makes the safety condition not merely sufficient.

### 0.6 Recombination schemes

A `RecombinationScheme` is a map `V → V → V`, used by the algorithms of Layer 2 to merge two
pseudojets. The `E` scheme is addition. The `p` scheme rescales the sum to be massless with
respect to a frame; the `E₀` scheme rescales the spatial part.

Milestone: a recombination scheme that is additive, positively homogeneous of degree one, and
symmetric preserves the safety of every observable defined from the resulting jets. Prove this,
and prove that the `E` scheme satisfies the three conditions. Prove that the `p` scheme is not
additive, exhibit the failure, and state what survives: the observables defined from `p`-scheme
jets are still safe, but the proof goes through the homogeneity and the frame vector rather than
through additivity, and the theorem carries a hypothesis on the frame.

### Examples

- `totalMomentum` and its invariant mass: safe, proved directly.
- `multiplicity`: unsafe in both senses, with explicit witnesses.
- The energy of the leading particle: infrared safe, collinear unsafe.
- The energy sum over a fixed angular region about a fixed axis: safe, and the base case for the
  hemisphere observables of Layer 1.
- The two-particle final state: every observable is trivially collinear safe on states of
  cardinality one, which fixes the base case of the inductive safety proofs.

### Dependencies

Mathlib multisets, topology and asymptotics; `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`
for `Bilin V`; `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` for the
regulator; `CollinearEvolution` for the soft and collinear factorisation of the real-emission
contribution.

---

## Layer 1: the Breit frame and the hemisphere decomposition

References: Streng, Walsh and Zerwas (1979); Ellis, Stirling and Webber, *QCD and Collider
Physics* (1996), §9; Dasgupta and Salam (2004), §4; Antonelli, Dasgupta and Salam (2000);
Kang, Lee and Stewart (2013).

### 1.1 Frames

A `Frame g` is a vector `n : V` with `0 < g n n`. Define `energy g F p = g p F.n / Real.sqrt (g
F.n F.n)`, the spatial part of `p` relative to `F` as `p - (energy g F p / Real.sqrt (g F.n
F.n)) • F.n`, and the cosine of the angle between two momenta relative to `F`. Prove: the
spatial part is `g`-orthogonal to `F.n`; the energy is linear in `p`; for a momentum with
`g p p = 0` and positive energy the spatial part has `g`-norm equal to the energy up to sign, so
that the massless relative-angle factor `1 - cos θ` is well defined. This last is the lemma that
the distance measure of Layer 2 needs, and the reason a massive pseudojet requires the separate
treatment named in convention 8.

### 1.2 The Breit frame of a deep-inelastic configuration

Given `K : DisKinematics V` with `Q2 g K > 0`, a **Breit frame** is a frame together with an
orthonormal spatial triple in which `K.q` has vanishing time component and spatial part of
`g`-norm `Real.sqrt (Q2 g K)` along the third axis. Define the structure carrying that data and
its defining equations.

Milestones. Existence: for `Q2 g K > 0`, and given that `g` restricted to the span of `K.p` and
`K.q` has signature `(1,1)`, a Breit frame exists. Uniqueness: any two Breit frames for the same
`K` differ by a rotation about the `q` axis composed with the reflection exchanging the two
hemispheres, and fixing the incoming-parton direction to `+z` as in convention 4 removes the
reflection. State the uniqueness using the boost–rotation decomposition from
`EpsilonEridani.Relativity.LorentzGroup.Restricted.FromBoostRotationExtensions`.

Prove the relation between the Breit-frame energies and the invariants: the incoming parton has
energy `Real.sqrt (Q2 g K) / 2` at leading order in `xBj`, and the struck quark recoils with the
same energy into the current hemisphere. This is the statement that makes `Q/2` the natural hard
scale for current-hemisphere observables, and it is used to normalise every event shape in Layer
3.

### 1.3 The hemispheres

The **current hemisphere** of a Breit frame is the set of momenta with negative third spatial
component; the **target hemisphere** is its complement. Define `currentHemisphere` and
`targetHemisphere` as maps `FinalState V → FinalState V` by `Multiset.filter`.

Milestone: the hemisphere split is collinear safe in the sense that a collinear splitting of a
momentum strictly inside a hemisphere leaves both hemispheres' contents unchanged as multisets
of total momentum, and infrared safe in the sense that a momentum tending to zero contributes to
neither hemisphere's energy in the limit. Prove both, and prove the accompanying negative
statement: the hemisphere split is *not* a continuous function of the final state, because a
momentum crossing the plane moves between hemispheres discontinuously. Consequently an
observable defined as an energy sum over a hemisphere is safe, while one defined as a
*multiplicity* within a hemisphere is not, and the proof of the former does not extend to the
latter.

### 1.4 The beam remnant and what is excluded from the observable

In deep-inelastic scattering the target hemisphere contains the beam remnant, whose momentum is
not calculable in fixed-order perturbation theory. Define an observable's **current-hemisphere
restriction** as its composition with `currentHemisphere`, and prove that the restriction of a
safe observable is safe.

Milestone: state and prove the sense in which a current-hemisphere observable is insensitive to
the target hemisphere — namely that it is literally a function of `currentHemisphere s` — and
state the accompanying limitation honestly: this insensitivity is exact for the observable as
defined and is not a statement that the *measured* current hemisphere is free of target
contamination, which is a matter of the kinematic reconstruction in
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.AccessMethods` and of the radiative corrections in
`RadiativeCorrections`.

### 1.5 Frame transformations of observables

Given two frames related by a restricted Lorentz transformation, and an observable defined
relative to a frame, define the transported observable and prove the functoriality: transporting
along a composition is the composition of transports, and transporting a safe observable gives a
safe observable. Prove that the *value* of a frame-dependent observable is not invariant, and
give the explicit thrust example: the thrust of a fixed final state computed in the Breit frame
and in the laboratory frame differ, so convention 3 is not a cosmetic choice.

### Examples

- The Breit frame of a leading-order two-particle final state, computed explicitly, with the
  struck quark exactly along `-z`.
- A configuration with one extra gluon emission, where the current hemisphere contains two
  momenta and the event shape is nonzero.
- A configuration where the emitted gluon lies exactly in the hemisphere plane, which witnesses
  the discontinuity of 1.3.
- The laboratory frame of the same configuration, witnessing the non-invariance of 1.5.

### Dependencies

Layer 0 for observables and safety;
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds`;
`EpsilonEridani.Relativity.LorentzGroup.Restricted.FromBoostRotationExtensions`;
`Mathlib.LinearAlgebra.BilinearForm.Basic`.

---

## Layer 2: jet algorithms

References: Catani, Dokshitzer, Olsson, Turnock and Webber (1991); Dokshitzer, Leder, Moretti and
Webber (1997); Wobisch and Wengler (1999); Cacciari, Salam and Soyez (2008); Salam and Soyez
(2007); Salam, *Towards jetography* (2010); Cacciari, Salam and Soyez, *FastJet* (2012).

### 2.1 Distance measures

A `ClusteringMeasure` over `(V, g)` and a frame is a nonnegative function `V → V → ℝ` carrying
symmetry and nonnegativity as fields, together with a single-particle "beam" distance `V → ℝ`.
A function on `Sym2 V` would make symmetry structural, but every distance instantiated here —
the Durham, generalised-`k_T` and flavour-`k_T` measures — is written on ordered arguments, and
the flavour variant of 4.2 branches on a property of the ordered pair; the symmetry field is the
price of that uniformity and is discharged once per algorithm. Define the generalised measure with exponent `p` and
radius `R`:

the pair distance is `min (energy a ^ (2 * p)) (energy b ^ (2 * p))` times the squared angular
separation divided by `R²`, and the beam distance is `energy a ^ (2 * p)`.

Define the Durham measure separately, since it uses `1 - cos θ` rather than a small-angle
approximation and is normalised to a hard scale `Q²` supplied as an argument:
`2 * min (energy a ^ 2) (energy b ^ 2) * (1 - cos θ) / Q²`.

Prove the soft and collinear behaviour that every safety proof below consumes: as the energy of
one member of a pair tends to zero, the generalised distance tends to zero when `p > 0` and
diverges when `p < 0`; as the angular separation tends to zero the distance tends to zero for
every `p`. Prove that the Durham distance vanishes when either momentum vanishes and when the
two are collinear, and that it is bounded by `4 * max (energy a ^ 2) (energy b ^ 2) / Q²`.

### 2.2 The clustering specification

Rather than a recursive function, specify the algorithm. A `ClusterStep` on a multiset either
merges the pair minimising the pair distance, when that minimum is below the smallest beam
distance and below the cut, or declares the particle minimising the beam distance to be a
completed jet. A `ClusterHistory` is a finite list of steps from the input multiset to a
terminal multiset on which no step applies.

Milestones. **Termination**: every `ClusterHistory` is finite, proved by well-founded recursion
on `Multiset.card`, which strictly decreases at a merge and at a jet declaration. **Existence**:
a history exists for every input. **Uniqueness**: if the pair distances and beam distances of the
input are pairwise distinct at every step, the history is unique; and if they are not, the
terminal multiset may genuinely differ, which is exhibited by an explicit tie. This last is the
honest form of the uniqueness statement and is the source of the discontinuity in convention 5.

Define `jets m R yCut s` as the terminal multiset of a chosen history, `jetMultiplicity` as its
cardinality, and prove that `jets` is a function of the input when the distinctness hypothesis
holds.

### 2.3 The partition property

Every output jet is the recombination of a submultiset of the input, the submultisets are
pairwise disjoint, and their union is the whole input. State this as the existence of a map from
input particles to output jets, and prove that the fibres give a `Finpartition` of the input when
the input is a finite set of distinguishable particles.

Milestone: with the `E` scheme, total momentum is conserved — the sum of the jet momenta equals
`totalMomentum s`. Prove it. Prove the corresponding statement for the `p` scheme, which is that
total momentum is *not* conserved, and quantify the defect.

### 2.4 Safety of the jet observables

Milestones, each proved from 2.1 and the partition property:

- Jet multiplicity is collinear safe: a collinear splitting produces a pair at zero distance,
  which is merged first, and the recombination in the `E` scheme returns the original momentum.
  The proof needs the hypothesis that the split pair's distance is strictly below every other
  distance, which holds for small enough angular separation; state that hypothesis rather than
  suppressing it.
- Jet multiplicity is infrared safe for `p < 0` and for the Durham measure. For `p > 0` a soft
  particle clusters with its nearest neighbour and multiplicity is again safe, but the *jet
  momenta* acquire a soft contribution that vanishes in the limit; the two statements differ and
  both are proved.
- The multiset of jet momenta is infrared and collinear safe as an observable, in the sense that
  any continuous symmetric function of it is safe.
- The hardest jet's momentum is infrared safe and collinear safe, with the collinear proof
  needing the same distance-separation hypothesis.

Also prove the negative statement that pins the definition down: jet multiplicity is not a
continuous function of the input momenta, with the tie configuration of 2.2 as the witness.

### 2.5 The exclusive Durham algorithm and the resolution scales

For the Durham measure with no beam distance, clustering proceeds until a single pseudojet
remains. Define `mergeScales s Q²` as the list of distances at which merges occurred, in the
order they occurred.

Milestone: the merge scales are non-decreasing. Prove it — the minimum distance cannot decrease
once the closest pair is removed, given that the recombined momentum's distances are bounded
below by the merged distance, which is where the hypothesis on the recombination scheme enters.
Deduce that `jetMultiplicity s Q² yCut` is a non-increasing step function of `yCut`, that the
`n`-jet rate is well defined as the indicator that `yCut` lies between the `n`-th and
`(n+1)`-th merge scales, and that the `n`-jet rates sum to one at every cut.

Define `y₂₃` as the scale at which three jets become two, and prove it is infrared and collinear
safe. It is the single most important observable of this layer for the strong-coupling extraction
of Layer 5, because at leading order it is proportional to the coupling.

### 2.6 Cone algorithms and the seeded-cone counterexample

A **cone** about an axis `n` of radius `R` is the submultiset of momenta within angular distance
`R` of `n`. A cone is **stable** if the axis of the recombined momentum of its contents is `n`
itself. Define a `StableConeSet` as a set of stable cones, and define the split–merge procedure
that resolves overlaps with an overlap threshold `f`.

Milestones:

- A stable cone exists for every input, proved by a fixed-point argument on the finite set of
  candidate axes obtained from submultisets.
- The set of all stable cones is infrared and collinear safe: adding a zero momentum and
  splitting a momentum collinearly do not change it.
- A **seeded** cone algorithm, which searches only over axes that are input momenta or
  recombinations of subsets reached from input momenta, is **not** collinear safe. Prove it by
  exhibiting a configuration in which splitting one momentum collinearly changes the set of seeds
  and therefore the set of jets found, and prove that the resulting jet multiplicity differs.
  This counterexample is the point of the subsection.
- The split–merge procedure terminates, with the termination argument given explicitly, and the
  resulting jets partition the input for `f > 1/2`.

### 2.7 The refinement obligation against the executable algorithm

`EpsilonEridani.Generator.Jets` implements the Durham algorithm over `Float`, with a fuel-bounded
recursion. State the two theorems that connect it to this layer:

- **Fuel adequacy**: for an input of cardinality `n`, the fuel argument `n` suffices, so the
  recursion never truncates. This is a statement about the executable definition and is provable
  from the cardinality decrease of 2.2.
- **Numerical agreement**: under a hypothesis bounding the floating-point error of the distance
  evaluation and a hypothesis that the minimising pair is separated from the runner-up by more
  than that bound, the executable clustering sequence agrees with the specification's history,
  and hence the jet multiplicities agree exactly.

The second theorem's hypotheses are not always satisfied, and the roadmap does not claim they
are; the content is that the failure mode is exactly a near-tie, which is the same configuration
that makes the specification's history non-unique. Nothing about `Generator.Jets` is required to
change.

### Examples

- A three-particle configuration clustered under `p = 1`, `p = 0` and `p = -1`, giving three
  different jet assignments from the same input, computed explicitly.
- A soft particle at wide angle, clustered by anti-`k_T` into the nearest hard jet and by `k_T`
  into its own jet, witnessing that the safety statements of 2.4 differ between the two.
- A collinear pair, witnessing that the merge happens first and the multiplicity is unchanged.
- A tie configuration with two equal minimal distances, witnessing the non-uniqueness of 2.2 and
  the discontinuity of 2.4.
- A four-particle configuration where a seeded cone misses a stable cone, witnessing 2.6.
- The leading-order deep-inelastic final state in the Breit frame, giving exactly one
  current-hemisphere jet at every cut.

### Dependencies

Layer 0 for safety and recombination schemes; Layer 1 for the frame and the hemispheres;
`Mathlib.Order.WellFounded` and `Mathlib.Data.Sym.Sym2`; `TauCeti.Order.Partition.Finpartition`;
`EpsilonEridani.Generator.Jets` for the refinement target of 2.7 only.

---

## Layer 3: event shapes and their fixed-order distributions

References: Farhi (1977); Catani, Turnock and Webber (1992); Berger, Kucs and Sterman (2003);
Dasgupta and Salam (2004); Antonelli, Dasgupta and Salam (2000); Gehrmann-De Ridder, Gehrmann,
Glover and Heinrich (2007); Salam and Wicke (2001).

### 3.1 Thrust and the thrust axis

Define the thrust of a final state relative to a frame as the supremum over unit spatial
directions `n` of the sum of `|g p n|` divided by the sum of spatial momentum magnitudes. Prove
that the supremum is attained, so that a **thrust axis** exists — the function being maximised is
continuous on a compact set — and that the axis is unique up to sign for a final state not
invariant under a rotation. Define `τ = 1 - T` per convention 9.

For deep-inelastic kinematics define also the **`q`-axis thrust**, where the axis is fixed to be
the `q` direction of the Breit frame rather than optimised. Prove that the two agree in the
two-particle limit and differ at higher multiplicity, and that both are safe. Both are used in
practice and neither should be called "the" thrust.

Milestone: `τ` is infrared and collinear safe, `τ ≥ 0`, `τ = 0` exactly on the configurations
whose momenta are all parallel to a single axis, and `τ` is bounded above by an explicit constant
determined by the frame. The two-jet endpoint is `τ = 0`.

### 3.2 Broadening, the `C` parameter, and the angularities

Define the **broadening** as the sum of the transverse momenta with respect to the thrust axis,
normalised by the total momentum magnitude, and separately the current-hemisphere broadening
that deep-inelastic measurements use.

Define the **`C` parameter** from the linearised momentum tensor: `C = 3 (λ₁λ₂ + λ₂λ₃ + λ₃λ₁)`
with `λ_i` the eigenvalues of the normalised tensor `Σ_p (p_i p_j / ‖p‖) / Σ_p ‖p‖`. Prove that
the tensor is symmetric positive semidefinite with unit trace — using
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` and
`TauCeti.Analysis.Matrix.Spectrum` for the spectrum — that `C ∈ [0,1]`, and that `C = 0` exactly
on the two-jet configurations.

Define the **angularity** family `τ_a` with exponent `a < 2`, as the energy-weighted sum over
particles of `(sin θ)^a (1 - |cos θ|)^{1-a}` relative to the thrust axis, normalised to the
total energy. Prove: `τ_0 = τ` and `τ_1` is the broadening, up to the normalisation fixed in
convention 9; `τ_a ≥ 0` with equality exactly on two-jet configurations; `τ_a` is infrared and
collinear safe for every `a < 2`, and collinear safety fails at `a = 2`, with the failure
exhibited.

Milestone: each of these observables is safe, each has its endpoint at zero, and the
endpoints coincide — the configurations with `τ = 0` are exactly those with `C = 0` and exactly
those with `τ_a = 0` for any `a < 2`. Prove the coincidence; it is what allows one endpoint
analysis to serve them all in Layer 4.

### 3.3 The two-jet limit and the endpoint structure

For a three-particle final state parameterise phase space by two energy fractions and compute
each observable of 3.1 and 3.2 explicitly as a function of them. Prove that each observable
vanishes on the boundary of phase space where the third particle becomes soft or collinear, and
identify the rate: `τ_a` vanishes linearly in the soft energy fraction and like a power of the
angle determined by `a`.

Milestone: the **endpoint logarithm**. Prove that the leading-order differential distribution of
each observable behaves like `log(1/v) / v` as the observable value `v → 0`, by computing the
phase-space integral of the leading-order matrix element with the observable held fixed. State
precisely what "behaves like" means, using Mathlib's asymptotics: the distribution times `v`
divided by `log(1/v)` tends to an explicit constant. That constant is proportional to the colour
factor `C_F` from `EpsilonEridani.QFT.QCD.Basic` and to the coupling, and its value is the first
thing a resummation must reproduce.

### 3.4 The fixed-order distributions

Define the **cumulative distribution** `Σ(v) = ∫₀^v dσ/dv' dv'` divided by the inclusive cross
section from `EpsilonEridani.QFT.Scattering.DIS.CrossSection`, so that `Σ` is a probability and
`Σ(v_max) = 1`.

Milestones:

- The leading-order cumulative distribution for each observable of 3.1 and 3.2, as an explicit
  function of `v` and the coupling, with the phase-space integral done. Prove `Σ` is
  non-decreasing, prove the normalisation, and prove the `v → 0` asymptotics of 3.3 from the
  closed form.
- The next-to-leading-order cumulative distribution, expressed as the leading order plus a
  coefficient function. The coefficient function involves the dilogarithm, which is built in
  `EpsilonEridani/QFT/Jets/EventShape/Dilog.lean` as recorded above. Prove the cancellation of
  the regulator poles between the real and virtual contributions, as an instance of the
  finiteness theorem of 0.5 rather than as a separate calculation.
- The structure of the logarithms at next-to-leading order: the coefficient of `log²(1/v)` and of
  `log(1/v)` in the expansion of `Σ`, computed and related to the colour factors and to `beta0`.
  These are the coefficients that the resummation of Layer 4 must reproduce, and the matching of
  4.5 is stated as the requirement that it does.
- The dependence on the renormalisation scale: the derivative of `Σ` with respect to the scale is
  of one order higher in the coupling, stated using the two-scale machinery of
  `EpsilonEridani.QFT.Factorization.Scales.Basic`.

### 3.5 Hadron-mass and recombination-scheme dependence

An event shape defined with energies and one defined with three-momentum magnitudes agree for
massless particles and differ for massive ones, and the difference is not a power correction of
the kind Layer 5 treats. Define the `E`-scheme, `p`-scheme and decay-scheme variants of each
observable, prove they agree on massless final states, and prove that the differences are
proportional to the particle masses with an explicit coefficient.

Milestone: state which variant each subsequent layer uses — the `E` scheme, per convention 8 —
and prove that the safety statements of 3.1 and 3.2 hold for all three variants, so the choice
affects the value and the power corrections but not the calculability.

### Examples

- The two-particle final state: every observable is exactly zero.
- The symmetric three-particle configuration: every observable computed in closed form.
- The configuration with one particle exactly along the thrust axis, where the thrust axis is
  degenerate and the uniqueness of 3.1 fails.
- A final state with one massive hadron, witnessing the scheme dependence of 3.5.
- The angularity at `a = 2`, witnessing the collinear-safety failure of 3.2.

### Dependencies

Layers 0–2; `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation` and
`.TopologyEnumeration`; `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.OneLoopScalars`;
`EpsilonEridani.QFT.Scattering.DIS.CrossSection`; `EpsilonEridani.QFT.QCD.Basic` for the colour
factors and the coupling; `TauCeti.Analysis.SpecialFunctions.Beta` and
`TauCeti.Analysis.Matrix.Spectrum`; `CollinearEvolution` for the splitting kernels;
`InclusiveStructureFunctions` for the normalising cross section.

---

## Layer 4: resummation and matching

References: Catani, Trentadue, Turnock and Webber (1993); Catani, Turnock and Webber (1992);
Banfi, Salam and Zanderighi (2005); Becher and Schwartz (2008); Abbate, Fickinger, Hoang, Mateu
and Stewart (2011); Hoang, Kolodrubetz, Mateu and Stewart (2015).

### 4.1 The Sudakov exponent of an event shape

Define the **radiator** `R(v)` of an observable as the integral over the single-emission phase
space of the emission probability restricted to the region where a single emission would produce
an observable value above `v`. Define the resummed cumulative distribution as
`EpsilonEridani.QFT.Shower.sudakov` applied to the radiator's kernel, so that
`Σ_res(v) = Real.exp (-R(v))` by construction.

Milestones, each inherited from the upstream `sudakov` rather than reproved: `Σ_res(v) > 0` for
every `v`; `Σ_res` at the endpoint of the radiator's range is one; `Σ_res ≤ 1` when the radiator
is nonnegative. What must be proved here is that the radiator of each observable of Layer 3 is
nonnegative, non-increasing in `v`, and tends to infinity as `v → 0`, so that `Σ_res(v) → 0`.

Prove the explicit leading-logarithmic form of the radiator: `R(v) = (C_F α_s / π) log²(1/v)`
plus subleading terms, with the coefficient computed from the soft-collinear emission
probability, and verify that it reproduces the `log²(1/v)` coefficient computed independently in
3.4. That agreement is a genuine check and is a milestone.

### 4.2 Logarithmic accuracy

Define what it means for a resummed prediction to be accurate to **leading logarithmic** and to
**next-to-leading logarithmic** order, as statements about the difference between `log Σ_res` and
`log Σ` order by order in the coupling: at leading logarithmic accuracy the terms
`α_s^n log^{n+1}(1/v)` agree, at next-to-leading accuracy also the terms `α_s^n log^n(1/v)`.
State these as definitions on formal power series in the coupling with coefficients that are
polynomials in the logarithm, so that "accuracy" is a decidable relation between two
predictions rather than an informal claim.

Milestone: the accuracy relation is an equivalence relation on predictions, is preserved by
multiplication by a function analytic at the origin in the coupling, and is *not* preserved by
composition with a general function of the observable. The last is why the matching scheme of 4.5
must be specified rather than chosen freely.

### 4.3 The exponentiation theorem, with its hypothesis named

The claim to be formalised is that for an observable satisfying a recursive safety condition, the
all-order distribution exponentiates: `Σ(v) = Real.exp (-R(v)) * F(R'(v)) * (1 + O(α_s))` with
`F` a function of the radiator's logarithmic derivative that accounts for multiple emissions.

State the **recursive infrared and collinear safety** hypothesis precisely: the observable's
value on a configuration of many soft-collinear emissions, all scaled together, scales
homogeneously, and the observable's value is unchanged in the limit where any one emission
becomes much softer or more collinear than the others. Define it as a property of an observable
in the sense of Layer 0.

Milestones:

- Prove that thrust, the broadenings, the `C` parameter and `τ_a` for `a < 1` satisfy the
  recursive safety hypothesis. Prove that `τ_1` does not satisfy it in the same form, which is
  why the broadening carries a different exponent — state what the broadening satisfies instead.
- Prove the exponentiation theorem to next-to-leading logarithmic accuracy for thrust and for the
  `C` parameter, with `F` computed explicitly, by the single-emission-dominance argument: the
  multiple-emission correction factorises into the function `F` of the radiator's derivative.
- **Open question, not a milestone.** Whether the exponentiation theorem can be proved at
  next-to-leading logarithmic accuracy for the whole angularity family from the recursive safety
  hypothesis alone, uniformly in `a` on `a < 1`, is open in this formalisation. The literature's
  general treatment establishes the result by an argument that is automated numerically rather
  than carried out symbolically for general `a`. The roadmap asks for the two named cases as
  theorems and for the general statement as a conjecture with the hypothesis written down; it
  does not ask a contributor to discharge the general case, and a contribution that proves it for
  a further specific `a` is progress.

### 4.4 The inverse transform

The radiator is naturally computed in moment space, and the distribution is wanted in `v`. Define
the Mellin transform of the cumulative distribution using
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`, and the inversion contour integral using
`TauCeti.Analysis.Contour.Cauchy.IntegralFormula` and
`TauCeti.Analysis.Contour.PerWindow.CPV` for the principal value at the contour's crossing of
the real axis.

Milestones: the transform of `Real.exp (-R)` for the explicit leading-logarithmic radiator, in
closed form; the inversion of that transform, with the contour chosen explicitly and the
deformation justified; and the small-`v` asymptotics of the result, proved by an explicit
estimate on the deformed contour rather than by a general asymptotic method, since no such
method exists upstream. The asymptotic statement is that the inverted distribution agrees with
the direct `Real.exp (-R(v))` form up to terms beyond the stated accuracy.

State the obstruction that the literature calls the Landau pole honestly: the radiator involves
the coupling at the scale `v Q`, which for small enough `v` leaves the perturbative domain, so
the radiator as defined is finite only for `v` above a threshold determined by `beta0` and the
coupling. Prove that threshold's existence and give it explicitly. Every statement in this layer
carries the hypothesis that `v` is above it.

### 4.5 Matching

Define a **matching scheme** as a map taking a fixed-order cumulative distribution of Layer 3 and
a resummed one of 4.1 to a single prediction. Define the two standard schemes explicitly: `log R`
matching, which adds the logarithms of the two and subtracts their common expansion, and `R`
matching, which does the same for the distributions themselves.

Milestones:

- Each scheme reproduces the fixed-order expansion to the order used, and the resummed logarithms
  to the stated accuracy. Prove both, as the two defining properties of a matching scheme.
- The matched prediction is normalised: it equals one at the observable's maximum. Prove this for
  `R` matching and prove that it *fails* for `log R` matching without an additional modification,
  and state the modification.
- The difference between the two schemes is beyond the stated accuracy. Prove it, as a statement
  in the formal-series language of 4.2. This difference is the standard estimate of the
  resummation uncertainty and the proof is what licenses that use.

### Examples

- The leading-logarithmic radiator for thrust, in closed form, and the resulting `Σ_res`.
- The expansion of `Σ_res` to second order in the coupling, checked against the fixed-order
  coefficients of 3.4.
- The `a = 0` and `a = 1/2` angularities, where the exponentiation theorem of 4.3 applies.
- The broadening, where it does not, and the modified statement that holds instead.
- The value of `v` at which the Landau-pole threshold of 4.4 is reached for a representative
  `Q`, computed from `beta0`.

### Dependencies

Layers 0–3; `EpsilonEridani.QFT.Shower.Sudakov`;
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`;
`TauCeti.Analysis.Contour.Cauchy.IntegralFormula`, `.PerWindow.CPV` and
`.HigherOrder.Asymptotics`; `TauCeti.Analysis.Semigroups.Generator` for the
renormalisation-group evolution of the soft function; `TauCeti.Analysis.Asymptotics.Lemmas`;
`CollinearEvolution` for the coupling's running and for the soft and collinear anomalous
dimensions.

---

## Layer 5: extraction of the strong coupling

References: Becher and Schwartz (2008); Abbate, Fickinger, Hoang, Mateu and Stewart (2011);
Dokshitzer and Webber (1995); Korchemsky and Sterman (1999); EIC Yellow Report (2021), §7.1.7.

### 5.1 The prediction as a map from the coupling

Fix an observable, a matching scheme from 4.5, a renormalisation scale and a fit range
`[v₁, v₂]`. The prediction is a map from the coupling to a function on the fit range. Define it,
and prove it is continuous and, on the range where the coupling is small enough that the series
is meaningful, differentiable with respect to the coupling, with the derivative computed from
the leading-order term.

Define the **extracted coupling** as a structure carrying a real value, a renormalisation scheme
tag, and a scale, per convention 12. Never as a bare real.

### 5.2 Well-posedness of the inversion

Milestone: at a single observable value `v` in the interior of the fit range, and under the
hypothesis that the derivative of the prediction with respect to the coupling is nonzero there,
the prediction is locally invertible and the extracted coupling is a differentiable function of
the measured value. Prove it with
`TauCeti.Analysis.Calculus.InverseFunctionTheorem`. Prove that the derivative is indeed nonzero
at leading order, where the prediction is linear in the coupling with a nonzero colour
coefficient, so the hypothesis is discharged rather than assumed at that order.

Milestone: the extraction from a continuum of observable values is a different problem. The map
from the coupling — a single real number — to a function on `[v₁, v₂]` is not surjective, so the
inversion is an overdetermined least-squares problem; define the least-squares functional, prove
it is strictly convex in a neighbourhood under the derivative hypothesis, and conclude existence
and uniqueness of the minimiser there.

Milestone, stated as a limitation: if the fit is allowed to vary a non-perturbative parameter
alongside the coupling, as 5.4 requires, the inverse problem becomes one for an operator with
nontrivial kernel in the limit of a narrow fit range, and the parameters are not separately
determined. State this using `TauCeti.Analysis.Fredholm.Criteria`: the degeneracy is the
statement that the linearised map from the two-parameter space to observables has a
near-kernel. Prove the degeneracy statement in the narrow-range limit, and prove that it is
resolved by a fit range wide enough that the `1/Q` and `α_s` dependences are distinguishable,
with an explicit condition on the range.

### 5.3 Scheme and scale

Define the conversion between renormalisation schemes as a map on extracted couplings, given as a
power series with stated coefficients, and prove it is a groupoid action: converting and
converting back is the identity to the order used, and conversions compose. Define the running
of an extracted coupling from one scale to another using `oneLoopAlphaS` and the beta function
from `EpsilonEridani.QFT.QCD.Basic`, and prove the two operations commute to the order used.

Milestone: two extracted couplings are comparable exactly when they have been brought to a common
scheme and scale, and the comparison map is the composite of a conversion and a running. State it
as a definition plus the well-definedness lemma, so that a statement comparing two extractions
cannot typecheck without the conversion.

### 5.4 Power corrections, consumed from `Hadronization`

The mean of an event shape receives a correction suppressed by one power of the hard scale,
conventionally written as a shift `v → v - a_v Λ / Q` in the distribution with `a_v` an
observable-dependent coefficient and `Λ` a non-perturbative parameter.

This roadmap does not derive the power correction; `Hadronization` supplies the shape function
and its first moment. What is proved here:

- Given the shift as data, the shifted prediction is again continuous and differentiable in the
  coupling, and the well-posedness statements of 5.2 apply to the two-parameter problem with the
  degeneracy condition made explicit.
- The coefficients `a_v` for thrust, the broadenings and the `C` parameter stand in fixed ratios
  determined by the observables' soft limits. Prove those ratios from the definitions of Layer 3.
  This is a statement about the observables, which is why it belongs here and not in
  `Hadronization`.
- **Hypothesis, not a milestone.** The universality of the non-perturbative parameter across
  observables — that a single `Λ` with observable-dependent `a_v` describes all of them — is a
  hypothesis. It is what makes the ratio statement above useful and it is not proved here or in
  `Hadronization`. The roadmap states it as a named hypothesis that the ratio theorem is
  conditional on, and asks for the conditional theorem, not for the hypothesis.

### 5.5 Deep-inelastic specifics

Milestones: the extraction from a current-hemisphere event shape in the Breit frame depends on
`x` and `Q²` through the parton densities, so the prediction of 5.1 carries the densities as
data from `InclusiveStructureFunctions`; state the dependence, and prove that the leading-order
derivative with respect to the coupling remains nonzero for densities that are positive on the
fit range, so 5.2 applies. Prove that the `y₂₃` extraction of 2.5 is linear in the coupling at
leading order with a coefficient independent of the densities up to normalisation, which is why
it is a cleaner extraction, and state precisely in what sense.

### Examples

- The leading-order extraction from `y₂₃`: an explicit closed-form inversion.
- The extraction from thrust at leading order with the fit range `[v₁, v₂]`, where the
  least-squares minimiser is computed in closed form.
- A two-parameter fit on a narrow range, exhibiting the degeneracy of 5.2.
- The same two-parameter fit on a range satisfying the explicit width condition, where the
  minimiser is unique.
- A conversion between two schemes applied twice, returning the original value to the order used.

### Dependencies

Layers 0–4; `EpsilonEridani.QFT.QCD.Basic` for `oneLoopAlphaS`, `beta0`, `beta1`;
`EpsilonEridani.QFT.Factorization.Scales.Basic`;
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` and `.AccessMethods`;
`TauCeti.Analysis.Calculus.InverseFunctionTheorem`; `TauCeti.Analysis.Fredholm.Criteria` and
`.CompactPerturbation`; `TauCeti.Probability.Moments.Basic`; `Hadronization` for the shape
function and the value of `Λ`; `InclusiveStructureFunctions` for the parton densities and the
normalising cross section; `CollinearEvolution` for the running.

---

## Layer 6: flavoured and heavy-quark jets, and the dead cone

References: Banfi, Salam and Zanderighi (2006); Caletti, Larkoski, Marzani and Reichelt (2022);
Czakon, Mitov and Poncelet (2023); Dokshitzer, Khoze and Troyan (1991); ALICE Collaboration
(2022); Marzani, Soyez and Spannowsky (2019); Larkoski, Moult and Nachman (2020); EIC Yellow
Report (2021), §7.3.6.

### 6.1 Flavour as part of the final state

Extend the final state of Layer 0 to carry a flavour label on each momentum: a
`FlavouredFinalState` is a `Multiset (Flavor × V)` for a flavour type with a distinguished
neutral element and an involution giving the antiparticle, taking `Flavor` from
`EpsilonEridani.Particles.Parton.Basic`. Define the **net flavour** of a submultiset as the
signed count. Extend `addSoft` and `splitCollinear` to the flavoured setting: a soft addition
adds a flavoured momentum, and a collinear splitting must specify how the flavour is
distributed, with the two physical cases being a quark splitting to a quark and a gluon, which
keeps the flavour on one branch, and a gluon splitting to a quark–antiquark pair, which creates a
cancelling pair.

Milestone: the net flavour of the whole final state is invariant under both operations. Prove it.
This is the conservation statement that makes flavour safety a meaningful question.

### 6.2 The failure of naive flavour assignment

Define **post-hoc flavour assignment**: cluster with an unflavoured algorithm from Layer 2, then
assign each jet the net flavour of its constituents.

Milestone: post-hoc assignment is **not** infrared safe. Prove it by exhibiting a configuration
in which a soft quark–antiquark pair from a gluon splitting is clustered into two different jets,
changing both jets' flavours, while the two momenta tend to zero and the unflavoured jets tend to
their unmodified values. Prove that the resulting jet-flavour multiplicity does not converge as
the pair's momenta tend to zero, which is the precise form of the failure.

Prove the accompanying statement that localises the damage: the *net* flavour summed over all
jets is safe, by 6.1, so the failure is specifically in the assignment of flavour to individual
jets.

### 6.3 A flavoured algorithm that is safe

Define the **flavour-`k_T`** measure: the pair distance of the generalised measure of 2.1, except
that when exactly one of the pair carries nonzero flavour the `min` of the energies is replaced
by the `max`. Define the flavoured clustering specification exactly as in 2.2 with this measure,
with the flavour of a merged pseudojet the net flavour of its constituents.

Milestones:

- The soft behaviour that the modification buys: for a pair in which one member is soft and
  flavoured, the flavoured distance does not vanish as the soft momentum tends to zero, whereas
  the unflavoured distance does. Prove it from the definition; this is the whole mechanism.
- The flavoured algorithm's jet momenta agree with the unflavoured algorithm's in the limit of
  vanishing soft flavoured momenta. Prove it, so that the modification does not change the
  kinematics.
- **Flavour safety**: the multiset of pairs (jet flavour, jet momentum) is infrared and collinear
  safe, with the collinear case including the gluon-splitting case of 6.1. Prove it.
- Termination and the partition property, inherited from 2.2 and 2.3 by instantiating the
  specification with the flavoured measure, not reproved.

**Open question, not a milestone.** Several more recent flavour definitions — flavour dressing of
anti-`k_T` jets, and the flavoured anti-`k_T` variants — are designed to preserve the anti-`k_T`
jet kinematics exactly rather than only in the limit. Whether their flavour safety can be proved
in the sense of this layer, rather than verified at a fixed order in the coupling, is open. The
roadmap asks for the definitions to be stated and for the fixed-order statements that are
provable, and records the general safety claim as a conjecture.

### 6.4 Massive partons and the heavy-quark jet

Extend the final state to carry a mass: a momentum with `g p p = m² > 0`. Define the **heavy-quark
jet** as a jet of the flavoured algorithm of 6.3 whose net flavour is a heavy flavour.

Redo the pieces of Layers 0 and 2 that the mass touches, rather than assuming they carry over.
Prove: the collinear splitting operation of 0.2 does not preserve the mass shell, so the
collinear limit for a massive parton is the limit of small angle at fixed mass rather than the
exactly-collinear configuration; the angular separation of 1.1 remains well defined for massive
momenta but `1 - cos θ` is no longer the massless factor, as convention 8 warns; and the safety
statements of 2.4 hold in the modified collinear sense, with the modification stated explicitly.

Milestone: for a heavy quark of mass `m` and energy `E`, there is a minimum angular separation
between the quark and any collinear emission it can be resolved from, of order `m / E`. State it
as a lower bound on the angle at which the massive collinear splitting function has support
above a stated fraction of its massless value, and prove the bound.

### 6.5 The dead cone

The massive splitting function for a heavy quark emitting a gluon differs from the massless one
by a factor that suppresses emission at angles below `θ_0 ≈ m / E`.

Milestone: define the massive quark-to-quark-gluon splitting function as data from
`CollinearEvolution`, with the mass dependence explicit, and prove the **dead-cone theorem** at
that order: the ratio of the massive to the massless splitting function, at fixed gluon energy
fraction, is bounded above by a function of the angle that tends to zero as the angle tends to
zero at fixed `m / E`, and the suppression sets in at an angle of order `m / E` with an explicit
constant. Prove that the integral of the massive splitting function over angles below `θ_0` is
bounded by an explicit constant times the massless integral over the same region times `(θ/θ_0)²`.

Milestone: the observable consequence. Define the **angular emission spectrum** of a jet as the
distribution of the angular separation between the jet's flavour-carrying constituent and the
other constituents, weighted by their energies, and prove that for a heavy-flavour jet the
spectrum is suppressed relative to a light-flavour jet in the region below `θ_0`, at the order at
which the splitting function controls it.

**Open question, not a milestone.** Whether the dead-cone suppression survives as a statement
about the all-order observable — that is, whether the suppression of the angular emission
spectrum below `θ_0` holds for the resummed spectrum and not only at the order of a single
splitting — is open. The roadmap asks for the fixed-order theorem and states the all-order claim
as a conjecture with the observable written down, so that a contributor knows what would have to
be proved.

### 6.6 Substructure observables for a heavy-quark jet

Define, on the constituents of a single jet, the **jet mass** as the invariant mass of the
recombined momentum, the **`n`-subjettiness** relative to `n` axes as the energy-weighted minimum
angular distance to the axes, and the **groomed** jet obtained by reclustering with the Durham
measure of 2.5 and discarding branches failing a soft-drop condition with parameters `z_cut` and
`β`.

Milestones: each of these is infrared and collinear safe as an observable on the final state,
given that the jet it is computed on is itself safe; prove each. Prove that the groomed jet mass
is safe and additionally that it is insensitive to the addition of a soft momentum at wide angle
in a stronger sense than ungroomed jet mass — quantify the sense, as the order in the added
momentum's energy at which the two observables' responses differ. Prove that for a heavy-flavour
jet the jet mass is bounded below by the quark mass, and that the bound is attained exactly on
the single-constituent configuration.

### Examples

- A gluon splitting to a soft quark–antiquark pair separated into two jets, witnessing 6.2.
- The same configuration under the flavour-`k_T` measure, where the pair is clustered together
  and the flavours cancel.
- A heavy quark with `m / E = 1/10`, with the dead-cone angle computed explicitly and the
  suppression factor evaluated at a few angles.
- A heavy-flavour jet with one constituent, attaining the jet-mass bound of 6.6.
- A light-flavour and a heavy-flavour jet with identical momenta and different angular emission
  spectra, witnessing 6.5.

### Dependencies

Layers 0–3, and Layer 2 in particular for the clustering specification that 6.3 instantiates;
`EpsilonEridani.Particles.Parton.Basic` for the flavour type;
`EpsilonEridani.QFT.QCD.RepresentationColor` for the colour factors of the splitting functions;
`CollinearEvolution` for the massive splitting function; `Hadronization` for the relation between
a jet's flavour and the identified heavy hadrons in it, which this layer does not restate;
`NuclearMedium`, which consumes these definitions and is not depended on.

---

## Dependency graph

```
                    Layer 0  safety, counterexamples, KLN finiteness
                       |
        +--------------+--------------+
        |                             |
   Layer 1  Breit frame          (CollinearEvolution: coupling,
   and hemispheres                splitting kernels)
        |                             |
   Layer 2  jet algorithms  <---------+
        |    (termination, partition, safety, Durham scales,
        |     cones, refinement of Generator.Jets)
        |
   Layer 3  event shapes, fixed-order distributions  <--- (InclusiveStructureFunctions:
        |                                                  normalising cross section)
   Layer 4  resummation, matching
        |    (uses EpsilonEridani.QFT.Shower.sudakov)
        |
   Layer 5  extraction of the coupling  <--- (Hadronization: shape function, Λ)
        |
   Layer 6  flavoured and heavy-quark jets, dead cone
             (instantiates Layer 2; depends on Layers 0-3, not on 4-5)
```

Layer 6 depends on Layers 0–3 only, so it can be developed in parallel with Layers 4 and 5.
`NuclearMedium` consumes Layers 1, 2 and 6 and this roadmap does not depend on it.

## Acceptance examples

These are the specific statements that certify the roadmap. Each is checkable and none of them is
a headline result standing alone.

1. `multiplicity` is not infrared safe and not collinear safe, with both witnesses exhibited, and
   the observable "energy of the leading particle" is infrared safe but not collinear safe.
2. For an infrared and collinear safe observable, the `ε → 0` limit of the sum of the real and
   virtual contributions exists, given the soft and collinear factorisation as data.
3. A Breit frame exists for every `DisKinematics` with `Q2 > 0` and a `(1,1)`-signature
   restriction, and any two differ by a rotation about the `q` axis once the incoming-parton
   direction is fixed.
4. Every clustering history terminates, by well-founded recursion on `Multiset.card`; a history
   exists for every input; and the terminal multiset is unique when the distances are pairwise
   distinct at every step, with an explicit tie showing that the distinctness hypothesis cannot
   be dropped.
5. The jet momenta of the generalised algorithm in the `E` scheme sum to the total momentum of
   the input, and the jets partition the input.
6. Jet multiplicity is collinear safe under the stated distance-separation hypothesis, and is not
   a continuous function of the input momenta.
7. The Durham merge scales are non-decreasing, and consequently the `n`-jet rates are well
   defined at every cut and sum to one.
8. A naive seeded cone algorithm is not collinear safe, with an explicit configuration whose jet
   multiplicity changes under a collinear splitting.
9. A thrust axis exists for every final state, and is unique up to sign for a final state not
   invariant under a rotation about it.
10. `τ = 0`, `C = 0` and `τ_a = 0` cut out the same set of final states, for every `a < 2`.
11. `τ_a` is collinear safe for `a < 2` and is not collinear safe at `a = 2`.
12. The leading-order differential distribution of each event shape times `v` divided by
    `log(1/v)` tends to an explicit constant proportional to `C_F` as `v → 0`.
13. The `log²(1/v)` coefficient of the next-to-leading-order cumulative distribution, computed
    from the fixed-order phase-space integral, equals the corresponding coefficient of the
    expansion of `Real.exp (-R(v))` with the radiator of 4.1.
14. `Σ_res(v) = EpsilonEridani.QFT.Shower.sudakov` of the radiator's kernel, so that
    `0 < Σ_res(v) ≤ 1` follows from `sudakov_pos` and `sudakov_le_one` without a new proof.
15. Thrust and the `C` parameter satisfy recursive infrared and collinear safety, and their
    exponentiation holds to next-to-leading logarithmic accuracy with `F` computed explicitly.
16. `log R` and `R` matching differ by terms beyond the stated accuracy, proved in the
    formal-series sense of 4.2.
17. The radiator is finite only for `v` above an explicit threshold determined by `beta0` and the
    coupling, and every statement of Layer 4 carries that hypothesis.
18. The leading-order extraction of the coupling from `y₂₃` is a closed-form inversion, and its
    derivative with respect to the coupling is nonzero, so the inverse function theorem applies
    without an assumed hypothesis.
19. The two-parameter fit of the coupling and the power-correction parameter is degenerate in the
    narrow-fit-range limit, with the degeneracy stated as a near-kernel of the linearised map,
    and non-degenerate under an explicit width condition.
20. An extracted coupling cannot be compared with another without the conversion map, because the
    comparison is defined only on couplings brought to a common scheme and scale.
21. Post-hoc flavour assignment is not infrared safe, with the soft quark–antiquark witness,
    while the net flavour of the whole final state is safe.
22. The flavour-`k_T` algorithm's jet flavours and momenta are infrared and collinear safe, and
    its jet momenta agree with the unflavoured algorithm's in the soft limit.
23. The integral of the massive splitting function over angles below `θ_0 ≈ m / E` is suppressed
    relative to the massless one by an explicit factor.
24. A heavy-flavour jet's mass is bounded below by the quark mass, with equality exactly on the
    single-constituent configuration.
25. For an input of cardinality `n`, the fuel argument `n` suffices in
    `EpsilonEridani.Generator.Jets.clusterTo`, so the executable recursion never truncates.

## References

- R. Abdul Khalek et al., *Science Requirements and Detector Concepts for the Electron-Ion
  Collider: EIC Yellow Report*, Nucl. Phys. A 1026 (2022) 122447, arXiv:2103.05419. Volume II,
  Chapter 7, §7.1.7 (global event shapes and the strong coupling constant) and §7.3.6 (special
  opportunities with jets and heavy quarks).
- G. Sterman and S. Weinberg, *Jets from Quantum Chromodynamics*, Phys. Rev. Lett. 39 (1977) 1436.
- T. Kinoshita, *Mass singularities of Feynman amplitudes*, J. Math. Phys. 3 (1962) 650.
- T. D. Lee and M. Nauenberg, *Degenerate systems and mass singularities*, Phys. Rev. 133 (1964)
  B1549.
- S. Catani and M. H. Seymour, *A general algorithm for calculating jet cross sections in NLO
  QCD*, Nucl. Phys. B 485 (1997) 291, arXiv:hep-ph/9605323.
- S. Frixione, Z. Kunszt and A. Signer, *Three-jet cross sections to next-to-leading order*, Nucl.
  Phys. B 467 (1996) 399, arXiv:hep-ph/9512328.
- S. Catani, Yu. L. Dokshitzer, M. Olsson, G. Turnock and B. R. Webber, *New clustering algorithm
  for multijet cross sections in e+e- annihilation*, Phys. Lett. B 269 (1991) 432.
- Yu. L. Dokshitzer, G. D. Leder, S. Moretti and B. R. Webber, *Better jet clustering algorithms*,
  JHEP 08 (1997) 001, arXiv:hep-ph/9707323.
- M. Wobisch and T. Wengler, *Hadronization corrections to jet cross sections in deep-inelastic
  scattering*, in Proceedings of the Monte Carlo Generators for HERA Physics Workshop (1999),
  arXiv:hep-ph/9907280.
- M. Cacciari, G. P. Salam and G. Soyez, *The anti-k_t jet clustering algorithm*, JHEP 04 (2008)
  063, arXiv:0802.1189.
- G. P. Salam and G. Soyez, *A practical seedless infrared-safe cone jet algorithm*, JHEP 05
  (2007) 086, arXiv:0704.0292.
- G. P. Salam, *Towards jetography*, Eur. Phys. J. C 67 (2010) 637, arXiv:0906.1833.
- M. Cacciari, G. P. Salam and G. Soyez, *FastJet user manual*, Eur. Phys. J. C 72 (2012) 1896,
  arXiv:1111.6097.
- M. Streng, T. F. Walsh and P. M. Zerwas, *Quark and gluon jets in the Breit frame of
  lepton–nucleon scattering*, Z. Phys. C 2 (1979) 237.
- R. K. Ellis, W. J. Stirling and B. R. Webber, *QCD and Collider Physics*, Cambridge University
  Press (1996), Chapter 9.
- E. Farhi, *Quantum chromodynamics test for jets*, Phys. Rev. Lett. 39 (1977) 1587.
- S. Catani, G. Turnock and B. R. Webber, *Jet broadening measures in e+e- annihilation*, Phys.
  Lett. B 295 (1992) 269.
- S. Catani, L. Trentadue, G. Turnock and B. R. Webber, *Resummation of large logarithms in e+e-
  event shape distributions*, Nucl. Phys. B 407 (1993) 3.
- C. F. Berger, T. Kucs and G. Sterman, *Event shape/energy flow correlations*, Phys. Rev. D 68
  (2003) 014012, arXiv:hep-ph/0303051.
- A. Banfi, G. P. Salam and G. Zanderighi, *Principles of general final-state resummation and
  automated implementation*, JHEP 03 (2005) 073, arXiv:hep-ph/0407286.
- V. Antonelli, M. Dasgupta and G. P. Salam, *Resummation of thrust distributions in DIS*, JHEP 02
  (2000) 001, arXiv:hep-ph/9912488.
- M. Dasgupta and G. P. Salam, *Event shapes in e+e- annihilation and deep inelastic scattering*,
  J. Phys. G 30 (2004) R143, arXiv:hep-ph/0312283.
- D. Kang, C. Lee and I. W. Stewart, *Using 1-jettiness to measure two jets in DIS three ways*,
  Phys. Rev. D 88 (2013) 054004, arXiv:1303.6952.
- A. Gehrmann-De Ridder, T. Gehrmann, E. W. N. Glover and G. Heinrich, *NNLO corrections to event
  shapes in e+e- annihilation*, JHEP 12 (2007) 094, arXiv:0711.4711.
- G. P. Salam and D. Wicke, *Hadron masses and power corrections to event shapes*, JHEP 05 (2001)
  061, arXiv:hep-ph/0102343.
- T. Becher and M. D. Schwartz, *A precise determination of α_s from LEP thrust data using
  effective field theory*, JHEP 07 (2008) 034, arXiv:0803.0342.
- R. Abbate, M. Fickinger, A. H. Hoang, V. Mateu and I. W. Stewart, *Thrust at N3LL with power
  corrections and a precision global fit for α_s(m_Z)*, Phys. Rev. D 83 (2011) 074021,
  arXiv:1006.3080.
- A. H. Hoang, D. W. Kolodrubetz, V. Mateu and I. W. Stewart, *C-parameter distribution at N3LL'
  including power corrections*, Phys. Rev. D 91 (2015) 094017, arXiv:1411.6633.
- Yu. L. Dokshitzer and B. R. Webber, *Calculation of power corrections to hadronic event shapes*,
  Phys. Lett. B 352 (1995) 451, arXiv:hep-ph/9504219.
- G. P. Korchemsky and G. Sterman, *Power corrections to event shapes and factorization*, Nucl.
  Phys. B 555 (1999) 335, arXiv:hep-ph/9902341.
- A. Banfi, G. P. Salam and G. Zanderighi, *Infrared safe definition of jet flavor*, Eur. Phys. J.
  C 47 (2006) 113, arXiv:hep-ph/0601139.
- S. Caletti, A. J. Larkoski, S. Marzani and D. Reichelt, *A fragmentation approach to jet
  flavor*, JHEP 10 (2022) 158, arXiv:2205.01109.
- M. Czakon, A. Mitov and R. Poncelet, *Infrared-safe flavoured anti-k_T jets*, JHEP 04 (2023)
  138, arXiv:2205.11879.
- Yu. L. Dokshitzer, V. A. Khoze and S. I. Troyan, *On specific QCD properties of heavy quark
  fragmentation*, J. Phys. G 17 (1991) 1602.
- ALICE Collaboration, *Direct observation of the dead-cone effect in quantum chromodynamics*,
  Nature 605 (2022) 440, arXiv:2106.05713.
- S. Marzani, G. Soyez and M. Spannowsky, *Looking inside jets: an introduction to jet substructure
  and boosted-object phenomenology*, Lect. Notes Phys. 958 (2019), arXiv:1901.10342.
- A. J. Larkoski, I. Moult and B. Nachman, *Jet substructure at the Large Hadron Collider: a review
  of recent advances in theory and machine learning*, Phys. Rept. 841 (2020) 1, arXiv:1709.04464.
- A. J. Larkoski, S. Marzani, G. Soyez and J. Thaler, *Soft drop*, JHEP 05 (2014) 146,
  arXiv:1402.2657.
- J. Thaler and K. Van Tilburg, *Identifying boosted objects with N-subjettiness*, JHEP 03 (2011)
  015, arXiv:1011.2268.

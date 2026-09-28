# Roadmap: collinear evolution, moments, and the running coupling

The scale dependence of collinear parton densities and fragmentation functions: the DGLAP
equations, the splitting kernels, the Mellin-moment formulation in which the equations
diagonalise, the running coupling, and the factorisation-scheme dependence that relates the
kernels to coefficient functions. The roadmap builds the machinery from the bottom: first the
convolution algebra on the momentum-fraction interval and the distributions that live in it,
then the kernels as elements of that algebra, then the coupling, then the evolution itself as a
one-parameter semigroup, and finally the transformations under which the whole construction is
covariant.

This is the shared dependency of most other roadmaps in this collection, and it exists as its
own area so that they can cite it rather than each restating an evolution equation. It is the
one roadmap here that corresponds to no single measurement: it is the machinery the
measurements are interpreted with. A consequence of that position is that its boundaries matter
more than its depth. Everything in this area is about the *kernels* and the *flow they
generate*; nothing in it is about a particular structure function, a particular hadron, or a
particular experiment.

The final application is a single statement that can be made once and used everywhere: given a
collinear density at a reference scale, there is exactly one family of densities at all higher
scales solving the DGLAP system, it depends on the reference scale only through the composition
law of a semigroup, it preserves the momentum and valence sum rules, and in moment space it is
a matrix exponential whose exponent is built from harmonic sums and the proved colour factors
of QCD. Every other roadmap that says "evolved to the scale of the measurement" is invoking
that statement.

Evolution is posed as a semigroup rather than as an integro-differential equation with a
solution formula, and this is a deliberate structural choice, not a stylistic one. The
composition law, the uniqueness of the solution, the generator and its domain, and the
continuity of the flow in the scale are then theorems about an object with known properties,
proved once upstream, rather than four separate facts about a particular integral equation.

## Scope

Included:

- The Mellin convolution on the momentum-fraction interval: its bilinearity, associativity,
  commutativity, the identity element, and the algebra structure that these make.
- Plus distributions, defined as functionals on a space of test functions rather than through a
  regularisation prescription, with their pairing rule, their moments, and the endpoint
  behaviour of the functions they are built from.
- The Mellin transform on the interval, the convolution theorem, the strip of convergence, and
  the inversion contour.
- Harmonic sums: the nested family, its shuffle and stuffle relations, its analytic
  continuation in the index, and the asymptotic expansion at large argument. These are built in
  this roadmap because they are absent upstream.
- The four leading-order splitting kernels, as distributions in normal form, together with
  their symmetry relations, their conservation identities, their Mellin moments in closed form,
  and the leading-order anomalous dimension matrix.
- The two-loop kernels' structure: their normal form, the identities they satisfy, the scheme
  in which they are stated, and their moments.
- The DGLAP system: the flavour decomposition into singlet and non-singlet sectors, the
  equation as an abstract Cauchy problem, the evolution family as a one-parameter semigroup, the
  generator, existence, uniqueness, and the preservation of the sum rules.
- The moment-space solution: diagonalisation of the singlet anomalous dimension matrix, the
  eigenvalue projectors, and the evolution operator as an exponential.
- The polarised kernels and the evolution of helicity densities; the transversity kernel and its
  non-singlet character; the timelike kernels governing fragmentation functions, and their
  relation to the spacelike case.
- The beta function as a formal power series in the coupling, its first two coefficients in
  terms of the colour factors and the number of active flavours, the solution of the
  renormalisation-group equation at one and two loops, and asymptotic freedom.
- Flavour thresholds: the matching conditions on the coupling and on the densities across a
  quark mass threshold, derived from continuity of physical predictions.
- The factorisation scheme as a simultaneous redefinition of densities and coefficient
  functions, the invariance of physical structure functions under it, and modified minimal
  subtraction as one member of that family.

Not included. This roadmap does not define or compute any structure function: the definitions
of `F₂`, `F_L` and their coefficient functions belong to `InclusiveStructureFunctions`, and the
polarised structure functions and their sum rules to `SpinStructure`. It does not fit densities
to data, and it contains no inverse problem: extracting a density from measurements, and the
non-uniqueness of that extraction, belong to `InclusiveStructureFunctions` and
`NuclearPartonDistributions`. It does not treat evolution in any variable other than the
factorisation scale: rapidity evolution and the resummation of small-`x` logarithms belong to
`SmallXAndSaturation`, and Collins–Soper evolution in the transverse-momentum scale to
`TransverseMomentumDistributions`. It does not treat the skewed kernels of generalised parton
distributions, whose evolution has an ERBL region absent here — those belong to
`GeneralizedPartonDistributions`, which takes the forward-limit kernels from here. It does not
define fragmentation functions as physical objects, only the timelike kernels that evolve them;
the objects belong to `Hadronization`. It does not treat double parton densities or their
inhomogeneous evolution, which belong to `MultiPartonCorrelations`. It does not treat nuclear
modification of densities: the evolution kernels are the same and are taken from here, while
the nuclear initial condition and its `A` dependence belong to `NuclearPartonDistributions`. It
does not treat QED or electroweak splitting, mixed QCD–QED evolution, or photon densities,
which belong to `RadiativeCorrections`. It does not resum logarithms of any ratio other than
the factorisation scale, so threshold and jet resummation belong to `JetsAndEventShapes`. It
does not derive the factorisation formula itself: the all-order statement that a hadronic cross
section is a convolution of a density with a coefficient function is a hypothesis here, stated
and used but not proved, and the roadmap that owns the statement is
`InclusiveStructureFunctions`. Finally, it does not derive the two-loop or three-loop kernels
from Feynman diagrams; see the honest statement of that boundary in Layer 5.

Material from this roadmap belongs under `EpsilonEridani/QFT/Factorization/`, in the existing
`Convolution/` and `Evolution/` subtrees, with two exceptions that are mathematics rather than
physics and belong under `EpsilonEridani/Mathematics/`: the harmonic sums of Layer 0 and the
plus distributions of Layer 0, both of which are written in the shape Mathlib would want so
that they can be contributed upstream unchanged.

## Conventions and coordination with upstream

1. **The evolution variable is `t = log (Q² / μ₀²)`**, a real number, with `μ₀` the reference
   scale carried as explicit data. The trap this avoids: `Q²` and `log Q²` differ by a Jacobian
   in every kernel, and a roadmap that leaves the variable implicit will state the DGLAP
   right-hand side with a spurious factor of `Q²`. Any statement in the scale itself is a
   corollary obtained by composing with `Real.log`.

2. **Kernels are normalised to the coupling `a = α_s / (2π)`.** The DGLAP right-hand side is
   `a(t) · (P ⊗ f)`, with no further numerical factor. The alternative normalisation
   `α_s / (4π)`, standard in the anomalous-dimension literature, is recorded once as a proved
   rescaling lemma and never used silently. The trap: the two-loop kernel differs by a factor
   of four between the conventions, and a mismatch is invisible at leading order.

3. **The beta function is normalised to `a₄ = α_s / (4π)`**, in which `β₀ = (11/3) C_A −
   (4/3) T_F n_f`. This is the opposite convention to the kernels, and it is chosen because it
   is the one in which `β₀` and `β₁` have their familiar values; the conversion between the two
   is a single proved lemma stated in Layer 2 and is the only place the factor appears. Naming
   both normalisations explicitly, rather than picking one and hoping, is what keeps the
   conversion auditable.

4. **Splitting kernels are distributions, in a fixed normal form**, carrying three pieces of
   data: a locally integrable regular part on the open interval, a real coefficient of the plus
   distribution `[1/(1−z)]₊`, and a real coefficient of `δ(1−z)`. The trap: writing a kernel as
   the function `C_F (1 + z²)/(1 − z)` "with the plus prescription understood" makes the
   momentum sum rule unstatable, because the identity it needs is an identity between
   functionals and not between functions. The normal form is unique, and that uniqueness is a
   theorem of Layer 0.

5. **Kernel subscripts read "daughter inside parent".** `P_{ab}` is the kernel for finding
   parton `a` inside parton `b`, so the DGLAP system is `∂_t f_a = a(t) Σ_b P_{ab} ⊗ f_b`. The
   trap: the opposite reading is also in the literature, and it exchanges `P_qg` with `P_gq`,
   which are different functions with different singularities — one is singular at `z → 0` and
   the other is not.

6. **Moments are indexed by `M[f](N) = ∫₀¹ x^(N−1) f(x) dx`.** Quark number is the moment at
   `N = 1` and the momentum fraction is the moment at `N = 2`. The trap: the convention
   `∫ x^N f(x)` shifts every harmonic-sum argument by one and turns a correct sum rule into an
   incorrect one; the indexing is stated once here and the two conservation theorems of Layer 1
   are the check that it has been applied consistently.

7. **Colour factors are the proved values, never numerals.** `C_F`, `C_A` and `T_F` come from
   `EpsilonEridani.QFT.QCD.RepresentationColor`, and `n_f`, the number of active flavours, is a
   natural-number parameter. No statement in this roadmap is specialised to `N_c = 3` or to a
   numeric `n_f`; specialisations appear only in the Examples of each layer. The trap: a kernel
   written with `4/3` in it cannot be used at the supersymmetric point, where the relation of
   Layer 1 is one of the few available checks on the kernels.

8. **Polarised objects carry a `Delta` prefix and transversity a `deltaT` prefix**, uniformly:
   `DeltaPqq` is the helicity kernel, `deltaTPqq` the transversity kernel, `Pqq` the
   unpolarised one. The prefixes differ by more than capitalisation on purpose, since a pair of
   names distinguished only by case is a hazard in its own right. The trap the convention
   avoids: the three kernels agree in their plus-distribution and delta-function coefficients
   and differ only in their regular parts, so a naming collision between them would be silent.

9. **Timelike kernels are named, spacelike kernels are the default.** `Pqq` is spacelike;
   `PqqTimelike` is the fragmentation kernel. The trap: the two coincide at leading order, which
   is a theorem of Layer 4 and not a definition, and conflating them makes that theorem
   unstatable.

10. **A factorisation scheme is explicit data, a structure, and never a typeclass.** The
    structure carries the transformation matrix relating one scheme's densities to another's,
    together with the compensating shift of the coefficient functions. The trap a typeclass
    would create: two different scheme choices in one statement would unify by instance
    resolution, and the scheme-change theorem of Layer 5 would become vacuous.

11. **The semigroup parameter is `t`, not the coupling.** The evolution family is indexed by the
    logarithm of the scale, on which the composition law is `U(t₂) ∘ U(t₁) = U(t₁ + t₂)` only
    for the moment-space non-singlet case at fixed coupling; with a running coupling the flow is
    a two-parameter family `U(t₁, t₂)`, and the reduction to a one-parameter semigroup is
    achieved by reparametrising to the variable `τ` defined in Layer 3.3 as the integral of the
    coupling. The trap: asserting a one-parameter composition law directly in `t` with a running
    coupling is false, and it is false in a way that is invisible at leading-logarithmic
    accuracy.

12. **Densities are functions of the momentum fraction supported in the closed unit interval**,
    extended by zero outside it, and the support condition is carried as a hypothesis on the
    statements that need it rather than built into the type. The trap of building it into the
    type: the Mellin transform and the analytic continuation in `N` both want the ambient real
    line, and a subtype would force a coercion into every statement.

13. **No `Prop`-valued structure field stands in for an unproved fact.** Where this roadmap
    depends on something it does not prove — the all-order factorisation hypothesis, the
    explicit two-loop kernels — the dependence is stated in prose in the layer that uses it, and
    the object is carried as explicit data with the identities it must satisfy proved as
    theorems about that data. A field of type `Prop` populated by a placeholder asserts nothing
    while looking like a hypothesis, and this project's own audit found that pattern hiding
    obligations across the library.

## Existing upstream material used by the roadmap

In `EpsilonEridani`:

- `EpsilonEridani.QFT.Factorization.Convolution.Basic`, `.Collinear`, `.Mellin` and
  `.Properties` supply the convolution and its collinear specialisation. Layer 0 completes them
  into an algebra with a proved identity element rather than starting over.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.QCDCore`, `.CollinearForm`,
  `.MomentSpace`, `.Solutions`, `.Consistency`, `.Reciprocity` and `.SmallX` are the existing
  base for Layers 1, 3 and 4. `.Reciprocity` is where the spacelike–timelike relation of Layer
  4.4 lives; `.SmallX` holds the boundary with `SmallXAndSaturation` and is not extended here.
- `EpsilonEridani.QFT.QCD.RepresentationColor`, `.SU3Generators`, `.SUNGenerators`,
  `.SUNStructureConstants`, `.CasimirDerivation` and `.SUNDerivation` supply the colour factors
  as proved values, per convention 7.
- `EpsilonEridani.QFT.QCD.OneLoopBeta`, `.OneLoopBetaFromScalars`, `.OneLoopCounterterms` and
  `.Renormalization` are the existing base for Layer 2. The one-loop coefficient is there; the
  two-loop coefficient and the scheme-independence statement are what Layer 2 adds.
- `EpsilonEridani.Particles.Parton.PDF.Basic` and `.Model` supply the density objects that
  evolve; `EpsilonEridani.Particles.Fragmentation.Basic` supplies the fragmentation functions of
  Layer 4.4. `EpsilonEridani.Particles.Parton.PDF.Positivity` and `.MsbarPositivity` are used in
  Layer 5.4, where the scheme dependence of positivity is the point.
- `EpsilonEridani.Particles.Parton.Unified.Basic` and `.Consistency` fix the relation between
  the collinear densities of this roadmap and the transverse-momentum-dependent and generalised
  distributions of the neighbouring ones; Layer 3.1 uses them to state the forward reduction
  that neighbouring roadmaps cite.
- `EpsilonEridani.Mathematics.Distribution.BasicExtensions` and
  `EpsilonEridani.Mathematics.OrderedSimplexIntegral` are used by Layer 0.3 and Layer 0.5
  respectively, the latter for the iterated-integral representation of nested harmonic sums.
- `EpsilonEridani.QFT.Factorization.Scales.Basic` carries the scale data of convention 1, and
  `EpsilonEridani.QFT.Factorization.HigherOrder.Basic` and `.Basic` in `Factorization` carry the
  order bookkeeping used in Layer 5.5.

In `TauCeti`:

- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.Generator.Basic`, `.Generator.Uniqueness`,
  `.CauchyProblem.Basic` and `.CauchyProblem.Uniqueness` are the home of Layer 3. The evolution
  operator is a one-parameter semigroup whose generator is the splitting kernel, so existence,
  uniqueness and the composition law come from that theory and are not reproved here. This is
  the single most important upstream dependency of the roadmap.
- `TauCeti.Analysis.Semigroups.BoundedGenerator.Basic` and `.Resolvent`, together with
  `.UniformlyContinuous`, supply the finite-dimensional case: the moment-space singlet system
  has a bounded generator on a two-dimensional space, and its semigroup is the matrix
  exponential of Layer 3.5 without a separate construction.
- `TauCeti.Analysis.Semigroups.Similarity` and `.Identity` are used in Layer 3.5: the
  diagonalisation of the singlet matrix is a similarity, and the similarity transport of a
  semigroup is the statement that conjugating the generator conjugates the flow.
- `TauCeti.Analysis.Semigroups.GrowthBound` and `.ExponentialShift` are used in Layer 3.4 to
  state the growth of the evolved density in `t`, and in Layer 4.4 where the timelike kernel has
  a different sign of the leading moment and so a different bound.
- `TauCeti.Analysis.ODE.Linear`, `.InitialCondition` and `.GlobalSolution` are used in Layer 2.3
  for the renormalisation-group equation, which is a scalar nonlinear ODE and not a semigroup,
  and in Layer 3.5 for the finite-dimensional moment-space system.
- `TauCeti.Analysis.Matrix.Spectrum` supplies the spectral material of Layer 3.5;
  `TauCeti.Analysis.Matrix.Normed` the operator norm used in the growth bounds.
- `TauCeti.Analysis.SpecialFunctions.Gamma` and `.Beta` are used throughout Layer 0.5 and Layer
  1.5: the moments of the regular parts of the kernels are Euler Beta functions, and the
  analytic continuation of the first harmonic sum is the logarithmic derivative of Gamma.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and `TauCeti.Analysis.Distribution.DuBoisReymond`
  are used in Layer 0.3: the uniqueness of the normal form of a kernel is a du Bois-Reymond
  statement, that a distribution annihilating all test functions is zero.
- `TauCeti.Analysis.Contour.Cauchy.IntegralFormula` and
  `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` are used in Layer 0.4 for the Mellin
  inversion contour, and `TauCeti.Analysis.Analytic.IsolatedZeros` in Layer 0.5 for the
  uniqueness of the analytic continuation in the moment index.
- `TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank` and `.CompactPerturbation` are cited for
  one statement only, in Layer 0.4: the Mellin convolution against a fixed kernel is a compact
  operator on the relevant space, which is what makes the inversion of a convolution an
  ill-posed problem. This roadmap does not invert anything; it records the fact so that
  `InclusiveStructureFunctions` and `NuclearPartonDistributions` can cite a proved statement
  rather than an assertion.
- `TauCeti.RingTheory.PowerSeries.Order`, `.Exp` and `.Log` are used in Layer 2.1, where the
  beta function is a formal power series and the scheme change is a substitution in it, and in
  Layer 5.1, where the scheme-change matrix is a power series in the coupling.

In `Mathlib`: `Analysis.MellinTransform` for the transform on the half-line;
`Analysis.SpecialFunctions.Gamma.Basic` and `Analysis.SpecialFunctions.Gamma.Beta`;
`Analysis.SpecialFunctions.Log.Basic`; `MeasureTheory.Integral.IntervalIntegral` and
`Analysis.SpecialFunctions.Integrals` for the explicit moment computations;
`Analysis.ODE.PicardLindelof` and `Analysis.ODE.Gronwall` for the running-coupling ODE;
`RingTheory.PowerSeries.Basic`; `Analysis.Analytic.Basic`;
`LinearAlgebra.Matrix.Charpoly.Basic` for the two-dimensional singlet eigenvalues;
`Analysis.Calculus.Deriv.Basic`; `Topology.Algebra.InfiniteSum.Basic` and
`Analysis.SpecificLimits.Basic` for the harmonic-sum asymptotics.

Genuine absences, all verified against the revisions pinned in `lake-manifest.json`:

- ⚠ **Harmonic sums are absent from both Mathlib and TauCeti.** Occurrences of "harmonic" in
  either library are harmonic *functions* in potential theory. Since every moment of every
  splitting kernel is expressed in harmonic sums, there is nothing to defer to, and Layer 0.5
  builds them — as the general nested family with its shuffle algebra, analytic continuation and
  asymptotics, which is the form that would belong in Mathlib, and not as the three particular
  sums the leading-order kernels happen to need.
- ⚠ **Polylogarithms are absent from both.** They are needed in Layer 5.4 for the
  next-to-leading-order coefficient functions. Layer 0.5 builds the classical polylogarithm as
  the analytic object and the Nielsen generalisations as the iterated integrals that the
  harmonic-sum generating functions require, in the same shape and for the same reason.
- ⚠ **The digamma function is absent**, and with it the analytic continuation of the first
  harmonic sum. Mathlib's Gamma material provides the function and its functional equation but
  not its logarithmic derivative. Layer 0.5 defines it as that logarithmic derivative and proves
  the recurrence, the reflection formula and the asymptotic expansion, which are exactly the
  three facts the kernel moments need.
- ⚠ **There is no Mellin convolution on a bounded interval upstream, and no convolution theorem
  for it.** Mathlib's `Analysis.MellinTransform` is the transform on the half-line with its
  multiplicative structure, which is the right ambient object but not the statement needed:
  the densities here are supported in `[0,1]` and the convolution is the one with the
  `x/y` argument. Layer 0.2 and Layer 0.4 build it, using Mathlib's transform for the analytic
  properties in the strip.
- ⚠ **There is no theory of distributions with endpoint singularities on a bounded interval.**
  TauCeti's `Analysis.Distribution.*` and Mathlib's `Analysis.Distribution.SchwartzSpace` are
  built on Schwartz space on the whole line, in which `[1/(1−z)]₊` is not an object. Layer 0.3
  builds the plus distributions directly as functionals on continuous functions on `[0,1]`,
  which is the weakest ambient space in which the kernels' identities hold, and proves the
  du Bois-Reymond uniqueness statement it needs there.
- ⚠ **There is no moment problem upstream and no notion of ill-posedness.** This roadmap needs
  neither: it uses moments in the forward direction, from a known density to its moments, and
  the one reverse statement it makes in Layer 0.4 is a compactness statement about a Fredholm
  operator, for which `TauCeti.Analysis.Fredholm.*` suffices. Reconstructing a density from
  finitely many moments is an inverse problem and belongs to the roadmaps that do inference.

In every case the roadmap builds what it needs in the shape the upstream library would want and
does not become contingent on an upstream change.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Mathematics.Distribution.Basic` and `Physlib.Mathematics.Distribution.PowMul`
  for the distributional objects the splitting kernels are, which is where the plus-prescription
  of Convention 4 belongs, and `Physlib.Mathematics.Calculus.ParametricIntegration` for
  differentiating the convolution under the integral.

## Layer 0: the convolution algebra, plus distributions, and harmonic sums

References: Yndurain, *The Theory of Quark and Gluon Interactions*, 4th ed., ch. 4; Blümlein and
Kurth, Phys. Rev. D 60 (1999) 014018, for the harmonic sums and their continuation; Vermaseren,
Int. J. Mod. Phys. A 14 (1999) 2037, for the nested-sum algebra.

This layer is pure mathematics. It contains no physics and mentions no parton, and that is
deliberate: everything in it is a statement about functions and functionals on the unit
interval, and it should be readable and provable without any of the rest of the collection.

### 0.1 The momentum-fraction interval and the space of densities

- The carrier: real-valued functions on `ℝ` supported in `[0,1]`, with local integrability on
  the open interval as the standing hypothesis. Per convention 12 this is a predicate on
  functions and not a subtype.
- The weighted spaces `L¹(x^(σ−1) dx)` for real `σ`, on which the Mellin transform converges.
  The theorem: a density integrable against `x^(σ₀−1)` and against `x^(σ₁−1)` is integrable
  against `x^(σ−1)` for every `σ` between them, so the domain of convergence is an interval.
  This is the interval version of the statement that the domain of convergence of a Mellin
  transform is a strip.
- The two endpoint behaviours that matter: `f(x) ~ x^(−1−λ)` as `x → 0`, controlling which
  moments exist, and `f(x) ~ (1−x)^β` as `x → 1`, controlling the large-`N` asymptotics. Both
  are defined as `IsBigO` statements along the relevant filter, not as ansätze.

### 0.2 Mellin convolution and the algebra it generates

- Definition: `(f ⊗ g)(x) = ∫_x^1 (dy / y) f(y) g(x/y)`, for `x ∈ (0,1]`, extended by zero.
- Theorems: bilinearity; commutativity, by the substitution `y ↦ x/y`; associativity, by
  Tonelli on the ordered simplex `{(y,z) : x ≤ yz, y ≤ 1, z ≤ 1}`, which is where
  `EpsilonEridani.Mathematics.OrderedSimplexIntegral` is used; and the support statement that
  the convolution of two densities supported in `[0,1]` is supported in `[0,1]`.
- The identity element is `δ(1−x)`, which is not a function. The theorem to prove, and the point
  of the subsection: the space of locally integrable densities under `⊗` is a commutative
  associative algebra *without* unit, and it acquires one exactly upon adjoining the
  distributions of Layer 0.3. The trap this closes: a great deal of the literature writes
  `f ⊗ δ = f` as though it were an identity of functions.
- Positivity: the convolution of two non-negative densities is non-negative. This is the one
  statement of this layer that other roadmaps cite directly, since it is what makes a positivity
  constraint survive a factorisation formula.
- The hypotheses each theorem needs are stated separately. Associativity needs joint
  integrability on the simplex and is false without it; commutativity needs only measurability.

### 0.3 Plus distributions

- The space of test functions: continuous real functions on `[0,1]`. This is weaker than
  Schwartz space and is the right choice, because the kernels are not smooth at the endpoints
  and the identities they satisfy hold against continuous test functions.
- Definition: for a function `K` locally integrable on `[0,1)` and singular at `1`, the
  associated plus functional is `φ ↦ ∫₀¹ K(z) (φ(z) − φ(1)) dz`, together with the theorem that
  this integral converges whenever `K(z) (1−z)` is bounded near `1` — which is the precise
  hypothesis, and is satisfied by `1/(1−z)` and by `1/(1−z)` times a polynomial but not by
  `1/(1−z)²`.
- The pairing rule for the standard case `[1/(1−z)]₊`, and the general rule for
  `[log^k(1−z) / (1−z)]₊`, which is what the two-loop kernels need.
- Moments: `⟨[1/(1−z)]₊, z^(N−1)⟩ = −S₁(N−1)`, with `S₁` the first harmonic sum. This single
  identity is the bridge between Layer 0.3 and Layer 0.5, and it is the reason the moments of
  the kernels are harmonic sums at all.
- The normal form: every distribution that is a locally integrable function on `(0,1)` plus a
  plus-part plus a multiple of `δ(1−z)` is so decomposable in exactly one way. Proved from the
  du Bois-Reymond lemma. This theorem is what makes convention 4 well-posed.
- Multiplication by a smooth function, and the resulting identity
  `g(z) [1/(1−z)]₊ = g(1) [1/(1−z)]₊ + (g(z) − g(1))/(1−z)`, where the second term is an
  ordinary integrable function. This is the identity that puts any kernel into normal form, and
  it is used in every kernel computation in Layer 1.

### 0.4 The Mellin transform on the interval

- Definition `M[f](N) = ∫₀¹ x^(N−1) f(x) dx` for complex `N`, per convention 6; extended to
  distributions by the pairing of Layer 0.3.
- Holomorphy in the strip of convergence, with the strip determined by the endpoint behaviour of
  Layer 0.1. Taken from Mathlib's `Analysis.MellinTransform` by restriction.
- **The convolution theorem**: `M[f ⊗ g](N) = M[f](N) · M[g](N)` on the intersection of the two
  strips, proved by the same simplex Tonelli argument as associativity. This is the theorem that
  makes moment space useful, and it is the technical heart of the roadmap: it is what turns the
  integro-differential DGLAP system into an ordinary differential equation.
- Injectivity: a density whose moments vanish on a vertical line in its strip is zero almost
  everywhere. Proved through Mathlib's transform, and used in Layer 3.5 to conclude that a
  statement proved in moment space is a statement about densities.
- Inversion: the contour formula `f(x) = (1/2πi) ∫ x^(−N) M[f](N) dN` along a vertical line in
  the strip, with the hypotheses under which it holds. Uses
  `TauCeti.Analysis.Contour.Cauchy.IntegralFormula`.
- The compactness statement, for the neighbouring roadmaps to cite: convolution against a fixed
  density with an integrable Mellin transform is a compact operator on the weighted space of
  Layer 0.1, so it has no bounded inverse. Stated with
  `TauCeti.Analysis.Fredholm.CompactPerturbation` and `.Criteria`. This roadmap proves the
  statement and stops; it draws no inference conclusion from it.

### 0.5 Harmonic sums, the digamma function, and polylogarithms

Built here because they are absent upstream, in the general form rather than the form the
kernels need, per the discussion above.

- The nested harmonic sums `S_{m₁,…,m_k}(N)` for a multi-index of non-zero integers, defined by
  the standard nested recursion, with negative indices giving the alternating sums. Depth and
  weight as defined quantities.
- The quasi-shuffle algebra: the product of two harmonic sums of the same argument is a linear
  combination of harmonic sums of that argument, with the recursion that computes it. This is
  the finite analogue of the shuffle relations, and it is what reduces any moment expression to
  a basis.
- The digamma function as the logarithmic derivative of Mathlib's Gamma, with the recurrence
  `ψ(N+1) = ψ(N) + 1/N`, the value `ψ(1) = −γ`, the reflection formula, and the asymptotic
  expansion `ψ(N) = log N − 1/(2N) + O(N^(−2))`.
- **Analytic continuation.** `S₁(N) = ψ(N+1) + γ` continues `S₁` to a meromorphic function with
  simple poles at the non-positive integers, and the continuation is the unique meromorphic
  function with that restriction, by `TauCeti.Analysis.Analytic.IsolatedZeros`. For the higher
  sums the continuation is stated through the polygamma functions and, for the weight-three and
  alternating cases, through the Mellin transforms of polylogarithms; the roadmap constructs the
  continuation for weights one and two in closed form and for general weight through the
  integral representation.
- Why the continuation is needed and not a luxury: the inversion contour of Layer 0.4 runs
  through complex `N`, and every statement about the `x`-space behaviour of an evolved density
  is a statement about the singularities of its moments in the complex plane. Without the
  continuation, the moment-space solution of Layer 3.5 cannot be converted back.
- The large-`N` asymptotics `S₁(N) = log N + γ + O(1/N)` and the corresponding statements for
  higher weight, as `IsBigO` statements. These are what relate the large-`N` behaviour of the
  anomalous dimensions to the `z → 1` behaviour of the kernels, used in Layer 1.3.
- The classical polylogarithm `Li_n` on the unit disc and its continuation, and the Nielsen
  generalisations as iterated integrals, with the functional equations of weight two. Needed in
  Layer 5.4. The roadmap builds the definitions, the derivative relations, the values at `0` and
  `1`, and the weight-two functional equations, and does not attempt a general theory of
  multiple polylogarithms.

### Examples

- `⟨[1/(1−z)]₊, 1⟩ = 0`. The defining property, and a one-line check that the definition is
  right.
- `M[x^a](N) = 1/(N+a)` for `a > −N`, and `M[(1−x)^b](N) = B(N, b+1)` in terms of TauCeti's Beta
  function. Every regular part of every kernel in Layer 1 is a finite combination of these two.
- `M[δ(1−x)](N) = 1` for all `N`, which together with the convolution theorem re-proves that
  `δ(1−x)` is the algebra identity.
- `S₁(1) = 1`, `S₁(2) = 3/2`, `S₂(2) = 5/4`, computed by `decide`-level evaluation, as a check
  on the recursion.
- `S₁(N) · S₁(N) = 2 S_{1,1}(N) − S₂(N)`, the simplest quasi-shuffle relation, proved for all
  `N`.
- The convolution `x^a ⊗ x^b = (x^a − x^b)/(a − b)` for `a ≠ b`, with the `a = b` case
  `x^a log(1/x)`, as a concrete check of the convolution theorem against a direct computation.

### Dependencies

Mathlib and TauCeti analysis only, as listed above, plus
`EpsilonEridani.QFT.Factorization.Convolution.*` and
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`. No other roadmap and no other layer. This
layer is the foundation and depends on nothing in the collection.

---

## Layer 1: the leading-order splitting kernels

References: Gribov and Lipatov, Sov. J. Nucl. Phys. 15 (1972) 438; Altarelli and Parisi, Nucl.
Phys. B 126 (1977) 298; Dokshitzer, Sov. Phys. JETP 46 (1977) 641; Ellis, Stirling and Webber,
*QCD and Collider Physics*, ch. 4.

### 1.1 Colour factors as proved data

- The kernels are parametrised by a record of colour data — `C_F`, `C_A`, `T_F`, `n_f` — rather
  than by numerals, per convention 7.
- The instantiation lemma: for `SU(N_c)` the record takes the values proved in
  `EpsilonEridani.QFT.QCD.RepresentationColor` and `.SUNGenerators`, and for `N_c = 3` it takes
  the familiar numeric values. Both directions are theorems, and the numeric one is used only in
  the Examples.
- The supersymmetric point: the record with `C_F = C_A = 2 n_f T_F`. Defined here because Layer
  1.3 needs it; it is not a physical QCD configuration but it is a valid instantiation of the
  record, and that is exactly what makes it usable as a check.

### 1.2 The four kernels in normal form

Each kernel is given as the triple of convention 4 — regular part, plus coefficient, delta
coefficient — and the equality with the familiar unregularised expression is then a theorem
about distributions, proved with the multiplication identity of Layer 0.3.

- `P_qq(z) = C_F [ 2 [1/(1−z)]₊ − (1 + z) + (3/2) δ(1−z) ]`. The theorem: this is the normal
  form of `C_F [(1+z²)/(1−z)]₊`.
- `P_gq(z) = C_F (1 + (1−z)²)/z`. No plus part and no delta part; singular at `z → 0` and
  integrable there against `z^(N−1)` only for `Re N > 1`, which is the statement that the gluon
  density rises at small `x`.
- `P_qg(z) = T_F (z² + (1−z)²)`, per flavour. Regular on the whole interval. The
  singlet-normalised entry carries a factor `2 n_f`, and the distinction between the per-flavour
  and singlet-normalised forms is a named definition with a stated relation, because conflating
  them breaks the momentum sum rule by exactly that factor.
- `P_gg(z) = 2 C_A [ [z/(1−z)]₊ + (1−z)/z + z(1−z) ] + ((11/6) C_A − (2/3) n_f T_F) δ(1−z)`.
  The `n_f` dependence in the delta coefficient is the only place the number of flavours enters
  a kernel other than through the singlet normalisation of `P_qg`, and it is there for the
  momentum sum rule to hold, which Layer 1.4 proves rather than assumes.
- The infrared structure common to all four: the residue of the `z → 1` singularity of `P_qq` is
  `2 C_F` and of `P_gg` is `2 C_A`, and these are the colour charges of the emitting parton.
  Stated as a theorem about the plus coefficient, because it is the form in which
  `JetsAndEventShapes` cites it.

### 1.3 Symmetry and consistency relations

- `P_qg(z) = P_qg(1−z)`, and `P_gg(z) = P_gg(1−z)` as distributions, which requires the plus
  part and the delta part to be handled as functionals and is not visible in the unregularised
  form.
- `P_gq(z) = P_qq(1−z)` on the regular parts: the regular part of `P_qq` reflected is the
  `1/z`-singular kernel, which is the statement that the same real emission vertex reads two
  ways. Stated precisely, with the plus and delta terms excluded from the claim, since they have
  no reflected counterpart.
- **The supersymmetric relation.** At the point of Layer 1.1, the singlet-normalised moments
  satisfy `γ_qq(N) + γ_gq(N) − γ_qg(N) − γ_gg(N) = 0` for every `N`. Proved in moment space from
  the closed forms of Layer 1.5. This is a genuine check: it fails if any of the four kernels
  carries a wrong coefficient, and it is independent of the two conservation identities.
- The large-`N` behaviour: `γ_qq(N) = −2 C_F log N + O(1)` and `γ_gg(N) = −2 C_A log N + O(1)`,
  from the harmonic-sum asymptotics of Layer 0.5. These are the statements that the neighbouring
  roadmaps use to say that evolution is slow.

### 1.4 Conservation as theorems about the kernels

These two identities are the roadmap's internal check that the kernels are right, and the
direction of the reasoning matters: they are *proved from* the kernels, not used to fix them.

- **Quark number**: `M[P_qq](1) = 0`. The valence-number moment of the non-singlet kernel
  vanishes, so the number of quarks minus antiquarks of each flavour is unchanged by evolution.
- **Momentum**: `M[P_qq](2) + M[P_gq](2) = 0` and `M[P_gg](2) + M[P_qg^singlet](2) = 0`. The
  total momentum-fraction moment of each column of the anomalous dimension matrix vanishes, so
  the total momentum carried by all partons is unchanged.
- Each is proved by direct computation of the moments from Layer 1.5 and the explicit values
  `M[P_qq](2) = −(4/3) C_F`, `M[P_gq](2) = (4/3) C_F`, `M[P_gg](2) = −(2/3) n_f T_F`, and
  `M[P_qg^singlet](2) = (2/3) n_f T_F`.
- The interpretation theorem, which is what other roadmaps cite: the two identities imply the
  corresponding sum rules are preserved by the flow of Layer 3, and that implication is a
  separate theorem stated in Layer 3.6 because it needs the flow to exist.

### 1.5 Moments and the leading-order anomalous dimension matrix

- The four moments in closed form, as functions of `N` with the harmonic sums of Layer 0.5:
  `γ_qq(N) = C_F [ 3/2 − 2 S₁(N) + 1/(N(N+1)) ]`;
  `γ_gq(N) = C_F (N² + N + 2) / ((N−1) N (N+1))`;
  `γ_qg(N) = 2 n_f T_F (N² + N + 2) / (N (N+1) (N+2))`;
  `γ_gg(N) = 2 C_A [ −S₁(N) + 1/(N−1) − 1/N + 1/(N+1) − 1/(N+2) ] + (11/6) C_A − (2/3) n_f T_F`.
  Each is proved from the normal form of Layer 1.2 and the moment rules of Layer 0.3 and the
  Examples of Layer 0.
- The singlet matrix `γ^S(N)`, a two-by-two matrix over the field of meromorphic functions of
  `N`, assembled from the four entries in the basis `(Σ, g)` of Layer 3.1.
- The pole structure in `N`: `γ_gq` and `γ_gg` have simple poles at `N = 1`, with residues
  `2 C_F` and `4 C_A` respectively, and `γ_qq` and `γ_qg` are regular there. The `N = 1` pole is
  the moment-space expression of the small-`x` rise of the gluon, and its residue is what
  `SmallXAndSaturation` resums. This roadmap states the pole and its residue and stops; the
  resummation is not here.
- The non-singlet anomalous dimension is `γ_qq` itself, in each of the non-singlet channels, and
  the theorem that all non-singlet combinations evolve with the same leading-order anomalous
  dimension — the flavour independence that makes the non-singlet sector one-dimensional.

### Examples

- For `N_c = 3` and `n_f = 4`: the numeric values of the four moments at `N = 2, 3, 4`, as a
  check on the closed forms against direct integration of the kernels.
- `M[P_qq](1) = 0` and the two momentum identities, evaluated with symbolic colour factors, as
  the three concrete instances of Layer 1.4.
- The supersymmetric relation at `N = 2, …, 6`, evaluated at the supersymmetric point, as
  concrete instances of the general theorem.
- The non-singlet moment `γ_qq(3) = C_F(3/2 − 11/3 + 1/12)`, in a form a contributor can check
  by hand.
- `γ_gq(N)` has a pole at `N = 1` with residue `2 C_F`, exhibited by the explicit limit.

### Dependencies

Layer 0, all five subsections. `EpsilonEridani.QFT.QCD.RepresentationColor`, `.SU3Generators`,
`.SUNGenerators`, `.SUNStructureConstants`. `EpsilonEridani.QFT.Factorization.Evolution.QCDCore`
and `.CollinearForm` for the existing kernel material.
`TauCeti.Analysis.SpecialFunctions.Beta` for the regular-part moments. No other roadmap.

---

## Layer 2: the running coupling, the beta function, and flavour thresholds

References: Gross and Wilczek, Phys. Rev. Lett. 30 (1973) 1343; Politzer, Phys. Rev. Lett. 30
(1973) 1346; Caswell, Phys. Rev. Lett. 33 (1974) 244, for the two-loop coefficient; Chetyrkin,
Kniehl and Steinhauser, Phys. Rev. Lett. 79 (1997) 2184, for the threshold matching.

This layer comes before the evolution because the evolution operator of Layer 3 is an
exponential in a variable built from the coupling, so the coupling must exist first.

### 2.1 The beta function as a formal power series

- The beta function is `PowerSeries ℝ` in the coupling `a₄ = α_s/(4π)`, with vanishing constant
  and linear coefficients and the normalisation `β(a₄) = −β₀ a₄² − β₁ a₄³ − ⋯`, per convention 3.
- The sign convention is fixed once, and the statement that fixes it is the definition of
  asymptotic freedom in Layer 2.3: with this sign, `β₀ > 0` is the condition for the coupling to
  decrease with scale.
- The conversion lemma between the coupling normalisations of conventions 2 and 3, stated as an
  isomorphism of the power series rings induced by the rescaling `a = 2 a₄`, with the induced
  transformation of the coefficients. This is the only place the factor of two appears.

### 2.2 The first two coefficients

- `β₀ = (11/3) C_A − (4/3) T_F n_f`, in terms of the proved colour factors.
  `EpsilonEridani.QFT.QCD.OneLoopBeta` and `.OneLoopBetaFromScalars` already contain the
  one-loop calculation; this subsection is the statement of the result in the colour-factor form
  the rest of the roadmap uses, together with the proof that the two agree.
- `β₁ = (34/3) C_A² − 4 C_F T_F n_f − (20/3) C_A T_F n_f`. The two-loop coefficient is stated as
  data with its colour decomposition, not derived: deriving it requires the two-loop
  renormalisation of the coupling, which is not in this roadmap. This is an honest dependency
  and is recorded as such — the roadmap uses `β₁`, proves things about it, and does not claim to
  have computed it. What it *does* prove about it is the scheme-independence of Layer 2.4 and
  the sign statements of the Examples.
- The theorem that `β₀ > 0` if and only if `n_f < 11 C_A / (4 T_F)`, which for `SU(3)` is
  `n_f < 16.5` and so holds for every physical flavour number. Proved from the colour factors,
  with the numeric specialisation in the Examples.

### 2.3 Solving the renormalisation-group equation

- The equation `da₄/dt = β(a₄)` truncated at a given order is a scalar autonomous ODE with a
  locally Lipschitz right-hand side on any interval bounded away from the origin. Existence and
  uniqueness from `Mathlib.Analysis.ODE.PicardLindelof`; the global-in-`t` statement and the
  monotonicity from `TauCeti.Analysis.ODE.GlobalSolution` and `.Linear` for the linearised
  comparison.
- The one-loop solution in closed form, `a₄(t) = a₄(0) / (1 + β₀ a₄(0) t)`, and the theorem that
  it is the unique solution with that initial value. The `Λ` parameter as the value of `t` at
  which the denominator vanishes, defined as a derived quantity rather than a primitive, with
  the theorem that it is invariant under a change of reference scale.
- **Asymptotic freedom**: `a₄(t) → 0` as `t → ∞`, and the rate `a₄(t) = 1/(β₀ t) + O(t^(−2))`,
  both at one loop and with the truncated two-loop equation. This is the theorem that makes the
  perturbative expansion of everything else in this roadmap meaningful, and it is why it is
  stated here and not assumed.
- The two-loop solution implicitly, as the statement that `t` is an explicit function of `a₄`
  obtained by integrating `1/β`, with the inverse-function theorem giving the coupling as a
  function of `t` on the region where `β` does not vanish. No closed form in `t` is claimed,
  because none exists; the implicit statement is the honest one and is sufficient for every use
  in Layers 3 and 5.
- The Landau pole: the truncated one-loop solution diverges at a finite negative `t`, and the
  theorem states precisely that the solution does not extend below that point. This is a
  property of the truncation, not of QCD, and the roadmap says so.

### 2.4 Scheme independence of the first two coefficients

- A redefinition of the coupling is a formal power series substitution `a₄ ↦ a₄ + c₁ a₄² +
  c₂ a₄³ + ⋯` with unit leading coefficient, forming a group under composition, taken from
  `TauCeti.RingTheory.PowerSeries.*`.
- The transformation of the beta function under such a substitution, computed by the chain rule
  in the power series ring.
- **The theorem**: `β₀` and `β₁` are invariant, and `β₂` is not, with the explicit shift of `β₂`
  as a function of `c₁`. This is what "the first two coefficients are scheme independent" means
  precisely, and it is the statement that licenses quoting `β₀` and `β₁` without naming a
  scheme.
- The corollary that the `Λ` parameter is scheme dependent at one loop through the reference
  value of the coupling, with the explicit relation between the `Λ` parameters of two schemes.

### 2.5 Flavour thresholds

- The coupling and the densities are defined for a fixed number of active flavours; crossing a
  quark mass threshold changes that number, and the objects on either side are different
  objects.
- The matching condition is a relation between the coupling with `n_f` and with `n_f + 1` active
  flavours at a matching scale, as a power series in the coupling with coefficients depending on
  the logarithm of the ratio of the matching scale to the quark mass. At leading order the
  coupling is continuous; at next-to-leading order it is not, and the discontinuity is the
  matching coefficient.
- The corresponding matching for the densities: the `n_f + 1` densities are convolutions of the
  `n_f` densities with matching kernels, with the heavy-quark density vanishing at the matching
  scale at leading order.
- **The principle that fixes the conditions**: a physical structure function computed with
  `n_f` active flavours below the threshold and `n_f + 1` above must agree at the matching
  scale, order by order in the coupling. The matching coefficients are what they must be for
  this to hold, and the roadmap states the requirement as a theorem-shaped constraint and proves
  the leading-order case. The next-to-leading-order matching coefficients are stated as data,
  with the same honesty as `β₁`: they are used, not derived.
- The theorem that the number of matching scales is finite and the composite flow across several
  thresholds is well defined, which is the statement that lets a roadmap evolve from a low
  reference scale to a high measurement scale without tracking the thresholds by hand.

### Examples

- `β₀ = 11 − 2 n_f / 3` for `SU(3)`, and the values `9`, `25/3`, `23/3` for `n_f = 3, 4, 5`.
- `β₁ = 102 − 38 n_f / 3` for `SU(3)`, and the values `64`, `154/3`, `116/3` for the same.
- The one-loop coupling is monotonically decreasing in `t` for `n_f ≤ 6` and `N_c = 3`, as a
  concrete instance of asymptotic freedom.
- The ratio `Λ_{n_f=4} / Λ_{n_f=5}` at one loop, from the leading-order threshold matching, as a
  closed-form expression in the charm and bottom masses.
- A coupling redefinition with `c₁ ≠ 0` and `c₂ = 0`, with `β₀`, `β₁` unchanged and `β₂` shifted
  by the explicit amount, as a concrete instance of Layer 2.4.

### Dependencies

Layer 0.5, for the asymptotics. `EpsilonEridani.QFT.QCD.OneLoopBeta`, `.OneLoopBetaFromScalars`,
`.OneLoopCounterterms`, `.Renormalization`, `.RepresentationColor`.
`Mathlib.Analysis.ODE.PicardLindelof`, `Mathlib.Analysis.ODE.Gronwall`,
`Mathlib.RingTheory.PowerSeries.Basic`, `TauCeti.Analysis.ODE.GlobalSolution`, `.Linear`,
`.InitialCondition`, `TauCeti.RingTheory.PowerSeries.Order`, `.Exp`, `.Log`. Independent of
Layer 1. No other roadmap.

---

## Layer 3: the DGLAP system as a one-parameter semigroup

References: Altarelli, Phys. Rep. 81 (1982) 1; Furmanski and Petronzio, Z. Phys. C 11 (1982) 293,
for the moment-space singlet solution; Engel, Nagel, *One-Parameter Semigroups for Linear
Evolution Equations*, for the abstract theory, which is what TauCeti's semigroup material
develops.

### 3.1 Flavour space and its decomposition

- The flavour space: the `2 n_f + 1` densities for quarks, antiquarks and the gluon, as a
  function space valued in a finite-dimensional real vector space.
- The singlet combination `Σ = Σ_i (q_i + q̄_i)` and the gluon, forming a two-dimensional
  subspace; the non-singlet combinations, `2 n_f − 1` of them, spanning the complement. The
  theorem: this is a direct sum decomposition of flavour space that is invariant under the
  leading-order generator, and it is the reason the singlet sector is two-dimensional rather
  than `2 n_f + 1`-dimensional.
- The valence combinations `q_i − q̄_i` and the flavour-difference combinations as two named
  families of non-singlet densities, with the theorem that both evolve with the same
  leading-order anomalous dimension and that they differ at next-to-leading order, where the
  kernels for `q + q̄` and `q − q̄` non-singlet combinations separate.
- The forward reduction: the densities evolved here are the forward limits of the distributions
  in `EpsilonEridani.Particles.Parton.Unified.Basic`, and the compatibility statement is proved
  through `.Consistency`. This is the hook that `GeneralizedPartonDistributions` and
  `TransverseMomentumDistributions` cite; those roadmaps' distributions reduce to these
  densities, and their own evolution equations reduce to this one in the appropriate limit — a
  statement each of those roadmaps owns, not this one.

### 3.2 The equation as an abstract Cauchy problem

- The generator: for fixed colour data and fixed `n_f`, the operator `A : f ↦ P ⊗ f` on the
  weighted space of Layer 0.1, with `P` the matrix of kernels of Layer 1.
- Its domain: the densities for which the convolution is again in the space, characterised
  through the endpoint behaviour of Layer 0.1. The theorem: the domain contains the densities
  with `f(x) = O(x^(−1+ε))` at small `x` and is dense.
- The DGLAP system as the abstract Cauchy problem `∂_t u(t) = a(t) A u(t)`, `u(0) = f₀`, in the
  sense of `TauCeti.Analysis.Semigroups.CauchyProblem.Basic`, with `a(t)` the running coupling
  of Layer 2.3.
- The non-singlet case as a scalar problem and the singlet case as a two-component one, stated
  as the same Cauchy problem on different spaces so that the two are not two developments.

### 3.3 The evolution as a semigroup

- **The reparametrisation.** Define `τ(t) = ∫₀^t a(s) ds`, which is strictly increasing by
  asymptotic freedom and positivity of the coupling from Layer 2.3, hence invertible. In the
  variable `τ` the problem is `∂_τ u = A u` with `A` independent of the parameter, and this is
  the point at which the evolution becomes a one-parameter semigroup. Convention 11 is the
  statement of exactly this.
- The theorem, from `TauCeti.Analysis.Semigroups.Defs` and `.Generator`: the family
  `U(τ) = exp(τ A)` is a one-parameter semigroup with generator `A`, satisfying
  `U(τ₁ + τ₂) = U(τ₁) ∘ U(τ₂)` and `U(0) = id`, and the orbit `τ ↦ U(τ) f₀` is the unique
  solution of the Cauchy problem for `f₀` in the domain of `A`. Existence and uniqueness are
  *not* proved here; they are the upstream theorem, and the work of this subsection is to
  exhibit `A` as a generator satisfying the upstream hypotheses.
- The generator hypotheses that must be discharged: closedness of `A` on its domain, density of
  the domain, and the resolvent estimate. Closedness and density are proved from Layer 0; the
  resolvent estimate is proved in moment space, where the resolvent is an explicit rational
  function of the anomalous dimensions, and transported back by the injectivity of Layer 0.4.
- The physical evolution operator as the composite `U(τ(t₂)) ∘ U(τ(t₁))^(−1)`, with the
  two-parameter composition law `E(t₂, t₁)` and the theorem that it is a cocycle:
  `E(t₃, t₂) ∘ E(t₂, t₁) = E(t₃, t₁)`. This is what a physicist means by "evolve from `μ₁` to
  `μ₂`", and stating it as a cocycle over a one-parameter semigroup is what makes the scale
  independence of Layer 5.5 provable rather than assertable.
- **An open analytic question, named as such.** Whether `A` generates a semigroup on a space
  containing densities that rise as fast as `x^(−1)` at small `x` — the region where the `N = 1`
  pole of Layer 1.5 sits — is not settled by this roadmap. The construction above works on the
  space of Layer 0.1 with `Re N > 1`, which excludes exactly those densities. The roadmap states
  the semigroup on the space where it holds and records the exclusion; whether the flow extends,
  and in what space, is a question `SmallXAndSaturation` shares and neither roadmap claims to
  answer.

### 3.4 Growth, positivity, and continuity

- The growth bound, from `TauCeti.Analysis.Semigroups.GrowthBound`: the semigroup is bounded by
  `exp(ω τ)` with `ω` the supremum of the real parts of the spectrum of `A`, which in moment
  space is the largest eigenvalue of `γ^S(N)` over the relevant line, and the theorem computes
  `ω` explicitly.
- Continuity in the initial condition: two initial densities differing by `ε` in the weighted
  norm evolve to densities differing by at most `exp(ω τ) ε`. This is the statement that makes
  evolution a well-posed operation, and it is what distinguishes the forward evolution of this
  roadmap from the inverse problem that the inference roadmaps face — a distinction Layer 0.4's
  compactness statement makes precise in the other direction.
- Positivity preservation at leading order: the evolved density of a non-negative initial
  density is non-negative, proved from the positivity of the convolution in Layer 0.2 and the
  structure of the plus distribution, for the singlet system. The corresponding statement at
  next-to-leading order is **false in general**, because the next-to-leading-order kernels are
  not positive; the roadmap states the leading-order theorem, states the next-to-leading-order
  failure, and points to `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` for what survives
  in the modified-minimal-subtraction scheme. Dressing the failure as a milestone is exactly
  what the standing checklist forbids.

### 3.5 The moment-space solution

- The moment transform intertwines the generator with multiplication by the anomalous dimension
  matrix: `M[A f](N) = γ(N) M[f](N)`, which is the convolution theorem of Layer 0.4 applied to
  the generator. The whole point of moment space is this one line.
- The non-singlet solution in closed form:
  `M[q^NS](N, t) = M[q^NS](N, 0) · exp(τ(t) γ_qq(N))`, and at one loop, after substituting
  `τ` from the one-loop coupling, the familiar power `(a₄(t)/a₄(0))^(γ_qq(N)/(2 π β₀))` — stated
  with its normalisation factor derived from convention 2 and 3 rather than quoted.
- The singlet solution: `γ^S(N)` is a two-by-two matrix; its eigenvalues `γ_±(N)` are the roots
  of its characteristic polynomial, computed explicitly from
  `Mathlib.LinearAlgebra.Matrix.Charpoly.Basic`, and the spectral projectors `P_±` are
  `(γ^S − γ_∓)/(γ_± − γ_∓)`. The theorem: `exp(τ γ^S) = exp(τ γ_+) P_+ + exp(τ γ_-) P_-` wherever
  the eigenvalues are distinct. Diagonalisability is proved for the specific matrix by exhibiting
  the projectors, which avoids needing any general theory of non-normal diagonalisation.
- The degenerate locus where `γ_+ = γ_-` is identified explicitly as the zero set of the
  discriminant, and the theorem states the exponential there in Jordan form. The roadmap does
  not claim the locus is empty; it computes it and handles it.
- The transport theorem: `TauCeti.Analysis.Semigroups.Similarity` gives that the semigroup of a
  conjugated generator is the conjugated semigroup, so the diagonalisation in moment space is a
  statement about the flow and not only about the matrix.
- Reconstruction: the `x`-space solution is the inverse Mellin transform of the moment-space
  solution along the contour of Layer 0.4, and the theorem that this is the same function as the
  semigroup orbit, by the injectivity of Layer 0.4. Without this subsection the moment-space
  solution would be a computation about moments and not about densities.

### 3.6 Conservation laws under the flow

- The momentum sum rule is preserved: `Σ_a M[f_a](2, t)` is independent of `t`, proved from the
  momentum identity of Layer 1.4 and the moment-space solution. The mechanism, stated as a
  lemma, is that `N = 2` is an eigenvalue-zero direction of `γ^S`, and the sum rule is the
  corresponding conserved quantity.
- The valence numbers are preserved: `M[q_i − q̄_i](1, t)` is independent of `t`, from the
  quark-number identity.
- The general statement: a left null vector of `γ(N)` at a fixed `N` gives a conserved linear
  functional of the moments, and the two sum rules are the two instances of it that QCD has.
  Stating the general form is what makes the two instances checkable rather than coincidental.
- The consistency statement in `EpsilonEridani.QFT.Factorization.Evolution.Consistency` is the
  natural home for these, and the existing material there is extended rather than duplicated.

### Examples

- A non-singlet density `x^a (1−x)^b` at the reference scale, evolved in closed form in moment
  space, with the explicit `t` dependence of its second moment.
- The momentum sum rule evaluated on a two-component initial condition with the gluon carrying
  half the momentum, checked to be `t`-independent.
- `γ_+(2) = 0` and `γ_-(2) = −(4/3) C_F − (2/3) n_f T_F` at leading order: the vanishing
  eigenvalue at `N = 2` is the momentum sum rule, and exhibiting it is the concrete form of the
  mechanism lemma of Layer 3.6.
- The asymptotic partition of momentum between quarks and the gluon as `t → ∞`, as the
  eigenvector of `γ^S(2)` with eigenvalue zero, giving the gluon fraction
  `4 C_F / (4 C_F + 2 n_f T_F)` — a closed-form consequence of Layers 1 and 3 with no new input.
- The cocycle identity `E(t₃, t₂) ∘ E(t₂, t₁) = E(t₃, t₁)` on a non-singlet moment, as an
  explicit check of the composition law with a running coupling.

### Dependencies

Layers 0, 1 and 2, all of them. `TauCeti.Analysis.Semigroups.Defs`, `.Generator`,
`.Generator.Basic`, `.Generator.Uniqueness`, `.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness`,
`.BoundedGenerator.Basic`, `.BoundedGenerator.Resolvent`, `.UniformlyContinuous`, `.Similarity`,
`.Identity`, `.GrowthBound`, `.ExponentialShift`. `TauCeti.Analysis.Matrix.Spectrum`, `.Normed`.
`Mathlib.LinearAlgebra.Matrix.Charpoly.Basic`.
`EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.Solutions`, `.MomentSpace`,
`.Consistency`. `EpsilonEridani.Particles.Parton.PDF.Basic`, `.Positivity`, `.MsbarPositivity`,
`EpsilonEridani.Particles.Parton.Unified.Basic`, `.Consistency`. No other roadmap; the forward
reduction of Layer 3.1 is stated here and *used* by `GeneralizedPartonDistributions` and
`TransverseMomentumDistributions`, which is the opposite direction of dependency.

---

## Layer 4: polarised, transversity, and timelike kernels

References: Altarelli and Parisi, Nucl. Phys. B 126 (1977) 298, for the polarised kernels;
Artru and Mekhfi, Z. Phys. C 45 (1990) 669, for transversity; Curci, Furmanski and Petronzio,
Nucl. Phys. B 175 (1980) 27, for the timelike case; Dokshitzer, Marchesini and Salam, Phys.
Lett. B 634 (2006) 504, for the status of reciprocity beyond leading order.

Each of the three families below is a different generator on the same flavour space of Layer
3.1, so the whole of Layer 3 applies to each without restatement. That is the payoff of posing
evolution abstractly, and this layer is where it is collected.

### 4.1 The polarised kernels

- `ΔP_qq(z) = P_qq(z)`: the helicity kernel for quark-to-quark splitting coincides with the
  unpolarised one at leading order. This is a theorem, proved by comparing normal forms, not a
  definition.
- `ΔP_gq(z) = C_F (2 − z)`; `ΔP_qg(z) = T_F (2z − 1)` per flavour;
  `ΔP_gg(z) = 2 C_A [ [1/(1−z)]₊ − 2z + 1 ] + ((11/6) C_A − (2/3) n_f T_F) δ(1−z)`.
  The delta coefficients coincide with the unpolarised ones, which is convention 8's trap made
  concrete.
- The moments `Δγ(N)`, in closed form in harmonic sums, and the polarised singlet matrix.
- The conservation identity available here: `Δγ_qq(1) = 0`, so the first moment of the
  non-singlet helicity density is `t`-independent. The corresponding singlet statement is
  different: `Δγ(1)` has a non-zero entry mixing the gluon into the singlet at next-to-leading
  order, and the first moment of the singlet helicity density is therefore **not** conserved
  beyond leading order. The roadmap states the leading-order conservation, states the
  next-to-leading-order failure, and does not resolve its interpretation: the axial anomaly and
  the decomposition of the proton spin belong to `SpinStructure`, which takes `Δγ` from here and
  owns everything about what the non-conservation means.
- The positivity constraint `|Δf(x)| ≤ f(x)` and the theorem that it is preserved by leading-order
  evolution, taken by `SpinStructure` and by `EpsilonEridani.Particles.Parton.PDF.Positivity`.

### 4.2 The transversity kernel

- `δP_qq(z) = C_F [ 2 [1/(1−z)]₊ − 2 + (3/2) δ(1−z) ]`, differing from the unpolarised kernel
  only in its regular part, per convention 8.
- **There is no gluon transversity.** A gluon has helicity `±1` and no transverse-spin density
  exists for it, because the corresponding operator would have to change the helicity by two
  units and there is no such twist-two gluon operator. Consequently the transversity system has
  no singlet sector: every transversity density evolves as a non-singlet, with a single
  anomalous dimension, and the two-dimensional machinery of Layer 3.5 is not used. The absence
  is a statement about the operator content and is proved here as such, rather than asserted;
  the proof is a weight-counting argument on the twist-two operators and is the only
  representation-theoretic statement in this roadmap.
- The moment `δγ_qq(N) = C_F [ 3/2 − 2 S₁(N) + 1/N ]`, and the leading-order Soffer bound
  `2 |δf(x)| ≤ f(x) + Δf(x)` with the theorem that it is preserved by leading-order evolution.
  `TransverseMomentumDistributions` takes the transversity anomalous dimension from here; the
  Soffer bound's relation to the transverse-momentum-dependent distributions belongs there.

### 4.3 The timelike kernels

- The timelike kernels govern the evolution of fragmentation functions. At leading order they
  coincide with the spacelike ones — `P^T = P^S` — which is the **Gribov–Lipatov relation** and
  is a theorem at this order, proved by comparing normal forms.
- Beyond leading order the relation **fails**: the two-loop timelike and spacelike kernels
  differ, and the difference is known. The roadmap states the failure as a fact about the
  two-loop kernels of Layer 5, states the modified relation that replaces it — that a
  single reciprocity-respecting kernel governs both when the evolution variable is chosen as the
  parton's own virtuality rather than the factorisation scale — and labels the modified relation
  as a **conjecture supported to three loops, not a theorem**. Both live in
  `EpsilonEridani.QFT.Factorization.Evolution.Reciprocity`. Presenting the modified relation as
  a milestone to be discharged would be exactly the dishonesty the standing checklist names.
- The timelike momentum sum rule: `Σ_h ∫₀¹ z D_h(z) dz = 1` for each parton, the statement that
  the parton's momentum is shared among the hadrons it fragments into, and the theorem that
  leading-order timelike evolution preserves it — the same Layer 3.6 mechanism with the timelike
  kernel.
- The sign of the leading moment differs between the timelike and spacelike cases, so the growth
  bound of Layer 3.4 has a different constant; this is stated explicitly, using
  `TauCeti.Analysis.Semigroups.ExponentialShift`.

### 4.4 The three systems as three generators

- The collecting theorem: each of the unpolarised, polarised, transversity and timelike kernel
  matrices generates a one-parameter semigroup on the appropriate space, by the same argument as
  Layer 3.3 with the kernel changed. Stated once, quantified over the kernel, so that the four
  cases are four instances and not four developments.
- The uniform statement of the conservation laws: for each system, the conserved functionals are
  the left null vectors of its anomalous dimension matrix at the relevant `N`, and the table of
  which system conserves what follows from computing those null spaces. The unpolarised system
  conserves momentum at `N = 2` and valence number at `N = 1`; the transversity system conserves
  nothing, since `δγ_qq(1) = C_F(3/2 − 2 + 1) = C_F/2 ≠ 0`; the polarised system conserves the
  non-singlet first moment only.

### Examples

- `ΔP_qq = P_qq` as an identity of distributions, exhibited on the normal forms.
- `Δγ_qq(1) = 0` and `δγ_qq(1) = C_F / 2`, computed from the closed forms, as the concrete
  content of the conservation table.
- A transversity density evolved in closed form in moment space, with no singlet mixing, as a
  concrete instance of the non-singlet-only statement.
- The leading-order Gribov–Lipatov relation checked on all four kernel moments at `N = 3`.
- The Soffer bound checked to be preserved on an explicit initial condition saturating it at one
  point.

### Dependencies

Layers 0, 1, 2 and 3. `EpsilonEridani.QFT.Factorization.Evolution.Reciprocity` and `.QCDCore`.
`EpsilonEridani.Particles.Fragmentation.Basic` for the fragmentation functions,
`EpsilonEridani.Particles.Parton.PDF.Positivity` for the bounds.
`TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight` for the weight-counting argument
of Layer 4.2. `SpinStructure` takes `Δγ` from here and owns the interpretation of the singlet
first moment; `TransverseMomentumDistributions` takes `δγ` from here; `Hadronization` takes the
timelike kernels from here and owns the fragmentation functions themselves.

---

## Layer 5: factorisation scheme, the two-loop kernels, and order-by-order independence

References: Furmanski and Petronzio, Phys. Lett. B 97 (1980) 437; Curci, Furmanski and
Petronzio, Nucl. Phys. B 175 (1980) 27; Moch, Vermaseren and Vogt, Nucl. Phys. B 688 (2004) 101
and B 691 (2004) 129, for the three-loop kernels; Collins, *Foundations of Perturbative QCD*,
ch. 9, for what the factorisation scheme is.

### 5.1 The scheme as a transformation

- A factorisation scheme change is explicit data, per convention 10: a matrix `Z(N, a)` of power
  series in the coupling with unit leading term, acting on the vector of moments of the
  densities, together with the compensating transformation of the coefficient functions.
- The group law: scheme changes compose, and the composite is again a scheme change, giving a
  group acting on the pair (densities, coefficient functions). Proved in the power series ring.
- The induced transformation of the anomalous dimension matrix:
  `γ → Z γ Z^(−1) + (dZ/dτ) Z^(−1)`, an inhomogeneous conjugation. This is the formula that
  makes the next two subsections statable.

### 5.2 What is invariant

- **The leading-order kernels are scheme independent.** From the transformation formula with `Z`
  having unit leading term, the order-`a` part of `γ` is unchanged. This is the theorem that
  licenses Layer 1 to speak of "the" leading-order kernels without naming a scheme, and it is
  the exact analogue of the scheme independence of `β₀` in Layer 2.4.
- **The next-to-leading-order kernels are scheme dependent**, with the explicit shift as a
  function of the order-`a` term of `Z`. Layer 5.4's kernels therefore carry a scheme label, and
  a statement quoting them without one is incomplete. The roadmap states this and labels
  accordingly.
- The invariant combination: the physical structure function, a convolution of a density with a
  coefficient function, is unchanged. Proved as a theorem about the pair, with the convolution
  theorem of Layer 0.4 doing the work in moment space.
- Modified minimal subtraction as one member of the family, specified by its data — the pole
  subtraction in dimensional regularisation, taken from
  `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` — and the DIS scheme as
  another, specified by the requirement that the `F₂` coefficient function is unity to all
  orders. The theorem relating the two is the explicit `Z` between them at order `a`.

### 5.3 What the scheme is not

- A scheme change is not a change of the physical prediction, and it is not a change of the
  factorisation *scale*: the two are independent transformations and Layer 5.5 treats the
  second. Stating the distinction is worth a subsection because conflating them is common, and
  it makes the scale-independence theorem of Layer 5.5 look like a scheme-independence theorem,
  which it is not.
- A scheme change does not preserve positivity of a density, and the roadmap records this
  explicitly with a pointer to `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity`: the
  positivity of a modified-minimal-subtraction density is a statement about that scheme and
  about that order, not a property of densities.

### 5.4 The two-loop kernels

This subsection is where the roadmap is most careful about what it claims.

- The two-loop kernels are **stated as explicit data** in the modified-minimal-subtraction
  scheme, in the normal form of convention 4, with their regular parts involving the
  polylogarithms of Layer 0.5 and their plus parts involving `[log^k(1−z)/(1−z)]₊` for `k ≤ 1`.
  Deriving them from Feynman diagrams requires the two-loop real-virtual calculation and is not
  in this roadmap; no such derivation is claimed here or anywhere in the collection.
- What the roadmap **proves** about them: the momentum and quark-number identities at two loops,
  the correct separation of the `q + q̄` and `q − q̄` non-singlet channels, the large-`N`
  behaviour, the scheme label's consistency with Layer 5.2, and the moments in closed form in
  harmonic sums of weight up to three. Each of these is a genuine theorem about the stated data
  and each would fail if a coefficient were wrong, so together they are a real check.
- Stating data and proving its identities is the honest arrangement here, and the roadmap says
  so plainly rather than letting the reader infer a derivation. It is also the arrangement the
  three-loop kernels would require, and those are cited in the references and not stated.
- The next-to-leading-order coefficient functions for `F₂` and `F_L` in the same scheme, stated
  as data on the same terms, with the theorem that their convolution with the evolved densities
  is factorisation-scale independent to the order considered — which is Layer 5.5.
  `InclusiveStructureFunctions` owns the structure functions themselves; this subsection
  supplies only the coefficient functions that pair with the kernels, because the pairing is a
  scheme statement and scheme statements live here.

### 5.5 Factorisation-scale independence order by order

- The factorisation scale is a free parameter; a physical structure function must not depend on
  it. The derivative of the structure function with respect to the factorisation scale is
  computed by the chain rule through the DGLAP equation and through the explicit scale
  dependence of the coefficient functions.
- **The theorem**: with the leading-order kernels and the leading-order coefficient functions,
  the derivative vanishes at order `a`; with the two-loop kernels and the next-to-leading-order
  coefficient functions, it vanishes at order `a²` and the residual is `O(a³)`. Stated with the
  order bookkeeping of `EpsilonEridani.QFT.Factorization.HigherOrder.Basic`.
- The interpretation, stated precisely so it cannot be overread: the theorem does not say the
  prediction is scale independent, it says the scale dependence is of higher order than the
  calculation. The residual scale dependence is the standard estimate of the size of the
  uncalculated orders, and that estimate is a heuristic, not a theorem; the roadmap says so.
- The all-order statement — that a scale-independent structure function exists at all, of which
  the order-by-order statements are truncations — is the **factorisation hypothesis**. It is used
  here and not proved here, and `InclusiveStructureFunctions` is the roadmap that owns it. No
  milestone in this roadmap is contingent on it: every theorem above is a statement about
  truncated series and is provable without it.

### Examples

- An explicit order-`a` scheme change between modified minimal subtraction and the DIS scheme,
  with the leading-order kernels unchanged and the two-loop kernels shifted by the computed
  amount.
- The two-loop non-singlet momentum identity, checked on the stated kernel data.
- The `F_L` coefficient function at order `a` and the verification that the leading-order `F_L`
  vanishes, which is the Callan–Gross relation and is owned by `InclusiveStructureFunctions`;
  the example here is only the coefficient function's value.
- The scale derivative of `F₂` at order `a`, computed and shown to vanish, on a one-parameter
  family of densities.
- The composite of two scheme changes with order-`a` data, exhibiting the group law.

### Dependencies

Layers 0 through 4. `EpsilonEridani.QFT.Factorization.Basic`, `.HigherOrder.Basic`,
`.Scales.Basic`, `.DIS.HardKernel`, `.DIS.LO`.
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`.
`EpsilonEridani.Particles.Parton.PDF.MsbarPositivity`.
`TauCeti.RingTheory.PowerSeries.Order`, `.Exp`, `.Log`. Takes the factorisation hypothesis and
the structure function definitions from `InclusiveStructureFunctions`;
`RadiativeCorrections` takes the scheme machinery from here to build the mixed QCD–QED case,
which is not in this roadmap.

---

## Dependency graph

```
Layer 0  convolution algebra, plus distributions, harmonic sums
           |                                    \
           v                                     \
Layer 1  LO splitting kernels, moments, γ^(0)     \
           |                                       \
           |          Layer 2  β function, running coupling, thresholds
           |         /   (independent of Layer 1; both feed Layer 3)
           v        v
Layer 3  DGLAP as a one-parameter semigroup; moment-space solution
           |
           +--------------------------+
           v                          v
Layer 4  polarised, transversity,   Layer 5  scheme change, two-loop kernels,
         timelike kernels                    order-by-order scale independence
```

Layer 0 depends on nothing in this collection. Layers 1 and 2 are independent of each other and
both are needed by Layer 3. Layers 4 and 5 both depend on Layer 3 and are independent of each
other: Layer 4 changes the generator and keeps the scheme fixed, Layer 5 changes the scheme and
keeps the generator fixed.

External flows, all of them outward except two:

- Into this roadmap: the factorisation hypothesis and the structure function definitions from
  `InclusiveStructureFunctions` (Layer 5); nothing else.
- Out of it: `γ` and the flow to `InclusiveStructureFunctions`, `NuclearPartonDistributions`,
  `MesonStructure`, `Diffraction`, `LatticeBridge`, `Photoproduction` and `JetsAndEventShapes`;
  `Δγ` to `SpinStructure`; `δγ` to `TransverseMomentumDistributions`; the timelike kernels to
  `Hadronization` and `NuclearMedium`; the forward-limit reduction to
  `GeneralizedPartonDistributions`, `TransverseMomentumDistributions` and `WignerDistributions`;
  the `N = 1` pole and its residue to `SmallXAndSaturation`; the running coupling and the
  thresholds to every roadmap that computes anything; the momentum sum rule's kernel-level
  identity to `HadronMassAndEnergyMomentumTensor`, which owns the sum rule's interpretation as
  an energy-momentum tensor matrix element; the scheme machinery to `RadiativeCorrections`; the
  homogeneous kernels to `MultiPartonCorrelations`, which owns the inhomogeneous term;
  `Layer 0`'s compactness statement to the roadmaps that do inference.

## Acceptance examples

The roadmap is certified by these statements. Each is checkable, each rests only on material in
this roadmap or upstream, and together they exercise every layer.

1. `[1/(1−z)]₊` applied to the constant function `1` is zero, and applied to `z^(N−1)` is
   `−S₁(N−1)`.
2. The Mellin convolution of two densities supported in `[0,1]` has moment equal to the product
   of their moments, on the intersection of their strips of convergence.
3. `δ(1−x)` is the identity of the convolution algebra, and the algebra of locally integrable
   densities alone has no identity.
4. `S₁(N)² = 2 S_{1,1}(N) − S₂(N)` for every `N`, and `S₁` continues to `ψ(N+1) + γ` with simple
   poles at the non-positive integers.
5. `C_F [(1+z²)/(1−z)]₊` equals `C_F[2[1/(1−z)]₊ − (1+z) + (3/2)δ(1−z)]` as distributions, and
   the normal form of any kernel is unique.
6. `M[P_qq](1) = 0`; `M[P_qq](2) + M[P_gq](2) = 0`; `M[P_gg](2) + M[P_qg^singlet](2) = 0`; and
   the explicit values are `∓(4/3) C_F` and `∓(2/3) n_f T_F`.
7. At the point `C_F = C_A = 2 n_f T_F`, the singlet-normalised leading-order moments satisfy
   `γ_qq + γ_gq − γ_qg − γ_gg = 0` for every `N`.
8. `β₀ = (11/3) C_A − (4/3) T_F n_f` reduces to `11 − 2 n_f / 3` for `SU(3)`, and `β₀ > 0` for
   every `n_f ≤ 6`.
9. The one-loop coupling tends to zero as `t → ∞` with rate `1/(β₀ t)`, and `β₀` and `β₁` are
   invariant under a redefinition of the coupling while `β₂` is not.
10. The operator `f ↦ P ⊗ f` is closed and densely defined on the weighted space of Layer 0.1,
    and generates a one-parameter semigroup in the variable `τ = ∫ a dt`.
11. The evolution family satisfies `U(τ₁ + τ₂) = U(τ₁) ∘ U(τ₂)` and the physical two-parameter
    family satisfies the cocycle identity; the solution of the Cauchy problem with a given
    initial density is unique.
12. `exp(τ γ^S(N)) = exp(τ γ_+) P_+ + exp(τ γ_-) P_-` off the discriminant locus, with `P_±` the
    explicit projectors, and the inverse Mellin transform of the result is the semigroup orbit.
13. `Σ_a M[f_a](2, t)` and `M[q_i − q̄_i](1, t)` are independent of `t`, and each is the conserved
    functional attached to a left null vector of `γ`.
14. `γ_±(2)` are `0` and `−(4/3) C_F − (2/3) n_f T_F`, and the asymptotic gluon momentum fraction
    is `4 C_F / (4 C_F + 2 n_f T_F)`.
15. `ΔP_qq = P_qq` as distributions; `Δγ_qq(1) = 0`; `δγ_qq(1) = C_F / 2`, so the transversity
    system has no conserved first moment.
16. The transversity system is entirely non-singlet, and the absence of a gluon transversity
    density follows from the twist-two operator content.
17. `P^T = P^S` at leading order; the equality fails at two loops; the reciprocity-respecting
    reformulation is recorded as a conjecture and not as a target to discharge.
18. The leading-order kernels are invariant under a factorisation scheme change, the two-loop
    kernels transform by the computed inhomogeneous conjugation, and the physical structure
    function is invariant.
19. The two-loop kernels as stated satisfy the momentum and quark-number identities and have the
    stated large-`N` behaviour; they are stated data, and the roadmap makes no claim to have
    derived them.
20. The factorisation-scale derivative of `F₂` vanishes at order `a` with leading-order input and
    at order `a²` with next-to-leading-order input.

## References

- V. N. Gribov and L. N. Lipatov, "Deep inelastic `e p` scattering in perturbation theory",
  Sov. J. Nucl. Phys. 15 (1972) 438.
- L. N. Lipatov, "The parton model and perturbation theory", Sov. J. Nucl. Phys. 20 (1975) 94.
- G. Altarelli and G. Parisi, "Asymptotic freedom in parton language", Nucl. Phys. B 126 (1977)
  298.
- Yu. L. Dokshitzer, "Calculation of structure functions of deep-inelastic scattering and
  `e⁺e⁻` annihilation by perturbation theory in quantum chromodynamics", Sov. Phys. JETP 46
  (1977) 641.
- G. Altarelli, "Partons in quantum chromodynamics", Phys. Rep. 81 (1982) 1. The standard review
  of the leading-order and next-to-leading-order structure, and the source for the moment-space
  singlet treatment of Layer 3.5.
- W. Furmanski and R. Petronzio, "Singlet parton densities beyond leading order", Phys. Lett. B
  97 (1980) 437; "Lepton-hadron processes beyond leading order in quantum chromodynamics",
  Z. Phys. C 11 (1982) 293.
- G. Curci, W. Furmanski and R. Petronzio, "Evolution of parton densities beyond leading order:
  the non-singlet case", Nucl. Phys. B 175 (1980) 27. The source for the two-loop kernels of
  Layer 5.4 and for the timelike case of Layer 4.3.
- S. Moch, J. A. M. Vermaseren and A. Vogt, "The three-loop splitting functions in QCD: the
  non-singlet case", Nucl. Phys. B 688 (2004) 101; "...the singlet case", Nucl. Phys. B 691
  (2004) 129. Cited for the structure of the higher orders; not stated in this roadmap.
- J. Blümlein and S. Kurth, "Harmonic sums and Mellin transforms up to two-loop order",
  Phys. Rev. D 60 (1999) 014018. The reference for Layer 0.5, including the analytic
  continuation.
- J. A. M. Vermaseren, "Harmonic sums, Mellin transforms and integrals", Int. J. Mod. Phys. A 14
  (1999) 2037. The algebra of nested sums, for the quasi-shuffle relations of Layer 0.5.
- D. J. Gross and F. Wilczek, "Ultraviolet behavior of non-abelian gauge theories", Phys. Rev.
  Lett. 30 (1973) 1343; H. D. Politzer, "Reliable perturbative results for strong interactions?",
  Phys. Rev. Lett. 30 (1973) 1346.
- W. E. Caswell, "Asymptotic behavior of non-abelian gauge theories to two-loop order",
  Phys. Rev. Lett. 33 (1974) 244. The source for `β₁`.
- K. G. Chetyrkin, B. A. Kniehl and M. Steinhauser, "Decoupling relations to `O(α_s³)` and their
  connection to low-energy theorems", Nucl. Phys. B 510 (1998) 61, and Phys. Rev. Lett. 79
  (1997) 2184. The source for the threshold matching of Layer 2.5.
- X. Artru and M. Mekhfi, "Transversely polarized parton densities, their evolution and their
  measurement", Z. Phys. C 45 (1990) 669. The source for Layer 4.2.
- J. Soffer, "Positivity constraints for spin-dependent parton distributions", Phys. Rev. Lett.
  74 (1995) 1292.
- Yu. L. Dokshitzer, G. Marchesini and G. P. Salam, "Revisiting parton evolution and the
  large-`x` limit", Phys. Lett. B 634 (2006) 504. The status of reciprocity beyond leading
  order, for Layer 4.3.
- J. C. Collins, *Foundations of Perturbative QCD*, Cambridge University Press, 2011, ch. 9. The
  definition of the factorisation scheme used in Layer 5.
- R. K. Ellis, W. J. Stirling and B. R. Webber, *QCD and Collider Physics*, Cambridge University
  Press, 1996, ch. 4.
- F. J. Yndurain, *The Theory of Quark and Gluon Interactions*, 4th ed., Springer, 2006, ch. 4.
- K.-J. Engel and R. Nagel, *One-Parameter Semigroups for Linear Evolution Equations*, Springer,
  2000. The abstract theory that TauCeti's semigroup material develops, and the reference for
  the generator hypotheses discharged in Layer 3.3.
- R. Abdul Khalek et al., "Science requirements and detector concepts for the Electron-Ion
  Collider: EIC Yellow Report", Nucl. Phys. A 1026 (2022) 122447, arXiv:2103.05419. This
  roadmap corresponds to no single subsection of Volume II Chapter 7; it is the machinery those
  subsections are interpreted with.

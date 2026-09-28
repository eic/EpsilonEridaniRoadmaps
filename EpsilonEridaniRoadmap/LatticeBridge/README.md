# Roadmap: the bridge between Euclidean lattice quantities and light-cone distributions

A parton distribution is defined by the matrix element of a quark or gluon bilinear whose two
field operators sit at points separated along the light cone. A Euclidean calculation produces
matrix elements of operators separated by a real Euclidean vector, and the continuation of such a
vector to Minkowski space is always strictly spacelike. There is therefore no Euclidean
calculation whose output *is* a parton distribution, and the gap is not one of precision or of
computer time: it is a statement about the domain of a holomorphic function. This roadmap
develops that statement, and then develops the constructions that bridge it — Euclidean-calculable
quantities related to a light-cone distribution by a perturbative matching kernel valid in a
stated region, with a remainder bounded by an explicitly quantified power correction.

The roadmap has two halves. The first is about the relations: what is computed, what is wanted,
and what theorem connects them, with every hypothesis of that theorem visible. Four routes are
developed — moments of local twist-two operators, the quasi-distribution of large-momentum
effective theory, the Ioffe-time and pseudo-distribution construction, and the general
good-lattice-cross-section criterion of which the previous two are instances. The second half is
about what the relations can be used for. A Euclidean calculation returns finitely many numbers
with a covariance, and the map from a light-cone distribution to those numbers has an
infinite-dimensional kernel. The final layer turns that into a theorem: a linear functional of a
light-cone distribution is determined by a finite Euclidean dataset exactly when it lies in the
span of the kernel functionals of the sampled points, and evaluation at a point never does. The
sharpest result of the roadmap is that negative one, together with the quantitative statement of
what a smoothness hypothesis buys back.

The light-cone objects are not defined here. Collinear densities come from
`InclusiveStructureFunctions` and `SpinStructure`, off-forward distributions from
`GeneralizedPartonDistributions`, transverse-momentum-dependent functions from
`TransverseMomentumDistributions`, and light-cone distribution amplitudes from `MesonStructure`.
This roadmap takes those definitions as given and formalises the bridge.

One scope decision governs everything below and is made explicitly rather than by omission.
Neither Mathlib nor TauCeti contains any lattice field theory: no lattice action, no transfer
matrix, no Osterwalder-Schrader reconstruction, no hypercubic lattice as a spacetime. Building
those is not this roadmap's subject and the roadmap does not wait for them. The output of a
Euclidean calculation is axiomatised as data — a finite indexed family of renormalised matrix
elements with a positive semidefinite covariance, together with the parameters each was obtained
at — and every theorem below is a theorem about that data and the continuum theory it is claimed
to approximate. Where a step needs a property only a lattice construction could supply, such as
reflection positivity or a transfer matrix, that property is a named hypothesis on the data.

## Scope

Included:

- The Euclidean data object: a finite family of renormalised matrix elements with a covariance,
  the parameters each is indexed by, and the hypotheses (spectral gap, multiplicative
  renormalisability, continuum extrapolation) that theorems about it may assume.
- The continuation map from Euclidean to Minkowski separations, its domain, the uniqueness of the
  continuation on that domain, and the failure of uniform stability at the boundary.
- The null-separation obstruction, as a theorem about the image of the continuation and about the
  boundary behaviour of the matrix element as the separation becomes null.
- The operator-product route: Mellin moments of a collinear density as forward matrix elements of
  local twist-two operators, the mixing those operators acquire when O(4) is replaced by the
  hypercubic group, and the resulting bound on the accessible moments.
- The finite-moment inverse problem: its exact non-uniqueness, the determinacy statement for the
  full moment sequence that isolates finiteness as the obstruction, and the hypotheses that make
  the truncated problem stable.
- Quasi-distributions and large-momentum effective theory: definition, support, the matching
  theorem with its power counting, the order in which the ultraviolet and large-momentum limits
  must be taken, the non-uniformity of the expansion near the endpoints in the momentum fraction,
  and the linear divergence of the gauge link with the renormalisation that removes it.
- The Ioffe-time distribution and the pseudo-distribution: the Lorentz-invariance theorem that
  makes the two-variable description possible, the ratio construction, the proof that the link's
  linear divergence cancels in the ratio, and short-distance factorisation stated as a condition
  on the separation rather than on the momentum.
- Good lattice cross sections: the criterion characterising which Euclidean quantities admit such
  a factorisation, with the quasi- and pseudo-distributions recovered as instances.
- The bridges for off-forward distributions, for transverse-momentum-dependent functions and for
  distribution amplitudes, and a common interface that all four instantiate.
- The inverse problem in full: the design operator as a finite-rank map, the compactness of its
  continuum limit, the error bound a stated smoothness hypothesis provides, and the
  identifiability theorem characterising which functionals a finite Euclidean dataset determines.

Not included. The construction and analysis of a lattice regularisation — actions, discretised
Dirac operators, transfer matrices, reflection positivity as a theorem, Euclidean reconstruction
of a Minkowski theory — is outside this roadmap; where such a property is needed it enters as a
hypothesis on the data object. Numerical algorithms, correlator fitting and the estimation of
excited-state parameters are likewise outside it: the roadmap consumes a covariance, it does not
produce one. The light-cone distributions and their evolution belong to
`InclusiveStructureFunctions`, `SpinStructure`, `GeneralizedPartonDistributions`,
`TransverseMomentumDistributions` and `MesonStructure`; the splitting kernels, the running
coupling and the Mellin-moment machinery the matching coefficients are expanded in belong to
`CollinearEvolution`. The deconvolution ambiguity of exclusive amplitudes belongs to
`GeneralizedPartonDistributions`, and this roadmap proves only the comparative statement that the
Euclidean map has a different kernel. Global fits belong to `InclusiveStructureFunctions`; Layer 5
uses the experimental design operator defined there and does not reconstruct it. No Euclidean
route to the Wigner distribution of `WignerDistributions` is developed and none is claimed: a
Wigner distribution is not the matrix element of a single bilinear and does not instantiate the
bridge interface of Layer 4. Lattice-computable quantities that are not light-cone distributions —
spectra, form factors at fixed momentum transfer, decay constants — are not bridge targets.

Material developed here belongs in `EpsilonEridani/QFT/Lattice/`: the continuation and
obstruction in `Continuation/`, the local-operator route in `Moments/`, the quasi-distribution in
`Quasi/`, the Ioffe-time route in `Ioffe/`, the general criterion in `CrossSections/`, the inverse
problem in `Inverse/`. Matching relations use the existing convolution vocabulary of
`EpsilonEridani/QFT/Factorization/Convolution/` rather than a new one.

## Conventions and coordination with upstream

1. **Euclidean and Minkowski objects are distinct types and the continuation is a named map.** A
   Euclidean separation is never silently reread as a Minkowski four-vector. *Trap avoided:* a
   sign error in `z^2` is invisible in prose and turns a spacelike statement into a timelike one;
   the obstruction theorem of Layer 0 is a statement about exactly that sign.
2. **The five parameters are explicit arguments, never typeclass parameters or ambient
   variables:** hadron momentum `P`, separation `z`, renormalisation scale `mu`, lattice spacing
   `a`, spatial extent `L`. *Trap avoided:* a theorem whose hypothesis is a limit in one parameter
   at fixed others is unfalsifiable if the others are ambient.
3. **A limit is a filter, and an iterated limit names its order.** That an order may be exchanged
   is a theorem with hypotheses, not a convention. *Trap avoided:* the ultraviolet and
   large-momentum limits do not commute (Layer 2.4), and writing them unordered makes a false
   statement look true.
4. **The light-cone direction, the plus-momentum convention and the momentum fraction are fixed
   once, agreeing with `EpsilonEridani.Particles.Parton.PDF.Basic`.** *Trap avoided:* two
   conventions for `x` differing by a sign or a factor of two make kernel and distribution
   incompatible while each is internally consistent.
5. **A gauge link is explicit data: a path, a representation, a regularisation.** Straight
   spacelike, staple-shaped and light-like links are different data, and no theorem proved for one
   is stated for another. *Trap avoided:* the linear divergence, the rapidity divergence and
   multiplicative renormalisability all depend on the path geometry.
6. **A matching relation is an equality modulo an explicitly quantified remainder,** of the form
   `computed = kernel (convolved with) light-cone + R` with a hypothesis bounding `R` in a named
   norm on a named region. *Trap avoided:* a power correction dropped at the point of statement
   cannot be restored later, and the milestone stops being checkable.
7. **Every matching kernel carries its perturbative order as data,** and a theorem using a
   one-loop kernel says so and includes the higher-order term in its remainder. *Trap avoided:*
   quoting a fixed-order kernel as exact turns a perturbative statement into a false one.
8. **The renormalisation scheme is data and scheme conversions are theorems.** RI-MOM, the ratio
   scheme and MS-bar are distinguished at every occurrence. *Trap avoided:* the caveat recorded in
   `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` — that positivity is not a property of
   the MS-bar density — applies here, and a scheme-blind statement would silently assume it away.
9. **An inverse problem is an operator equation between named spaces.** Domain, codomain and
   norms are part of the statement. *Trap avoided:* an identifiability or stability claim without
   a topology is not a claim.
10. **Euclidean data is finite and carries a covariance,** positive semidefinite in the sense of
    `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`; any continuum statement is a
    separate hypothesis about a family of datasets. *Trap avoided:* drawing a continuum conclusion
    from finite data is the error this roadmap exists to prevent.
11. **Unproved material is a `sorry`-ed theorem or a named gap in prose, never a `Prop`-valued
    structure field.** A field of proposition type inhabited by a placeholder asserts nothing
    while reading like a hypothesis; hypotheses that theorems need are explicit arguments.
12. **Discretisation enters only through named hypotheses.** No lattice action is assumed
    anywhere; where a statement depends on the regularisation (Layers 1.3, 2.5) the dependence is
    a hypothesis naming the property used, so the theorem applies to any discretisation with that
    property and to no other. *Trap avoided:* a result proved for one action, stated for all.
13. **The light-cone limit is a limit and its existence is a hypothesis.** Statements about
    `z^2 -> 0` distinguish the divergence of the bare object from the finite limit of the
    renormalised one. *Trap avoided:* treating the light-cone operator as the `z^2 = 0` evaluation
    of the spacelike one, the step the obstruction theorem forbids.

## Existing upstream material used by the roadmap

From EpsilonEridani: `Particles.Parton.PDF.Basic` for the light-cone definition and the momentum
fraction, and `Particles.Parton.Basic` for parton labels and the invariant decomposition of a
bilinear matrix element; `Particles.Parton.PDF.Positivity` and `.MsbarPositivity` for which
positivity statements a matched distribution may be held to, and `Particles.Parton.PDF.Model` for
the model families of the examples; `QFT.Factorization.Convolution.Basic`, `.Collinear` and
`.Properties` for the convolution every matching relation is written in, and
`QFT.Factorization.Convolution.Mellin` for the Mellin transform the moment route is stated
against; `QFT.Factorization.Basic` and `QFT.Factorization.Scales.Basic` for the factorisation
vocabulary, with `QFT.Factorization.HigherOrder.Basic` for perturbative bookkeeping;
`QFT.Factorization.Evolution.MomentSpace` and `QFT.Factorization.Evolution.Basic` for the
evolution a matched distribution must satisfy; `QFT.Factorization.DIS.HardKernel` for the
coefficient function the current-current example is checked against; `QFT.QCD.Renormalization` and
`QFT.PerturbationTheory.DimensionalRegularization.Basic` for the one-loop computations;
`Particles.Parton.GPD.Basic`, `.Moments` and `.Polynomiality` for the off-forward targets and the
polynomiality check, with `Particles.Parton.GPD.Ambiguity` and
`QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness` for the exclusive ambiguity Layer 4.1
contrasts against; `Particles.Parton.TMD.Basic`, `.CollinsSoper` and `.Reduction` for the
transverse-momentum-dependent definitions and the kernel Layer 4.2 extracts;
`Particles.Parton.Unified.Basic` and `.Consistency` for the relations a bridge must respect;
`QFT.Scattering.DIS.Inference.Identifiability`, `.Unfolding` and `.Basic` for the identifiability,
unfolding and design-operator patterns Layer 5 instantiates for Euclidean data;
`Mathematics.Distribution.BasicExtensions` for test-function manipulations and
`Mathematics.DataStructures.Matrix.PosSemidef` for covariances.

From TauCeti:

- `TauCeti.Analysis.Analytic.IsolatedZeros` and `TauCeti.Analysis.Complex.HalfPlaneIdentity` for
  uniqueness of the continuation on a connected domain, with
  `TauCeti.Analysis.Complex.Conformal.Continuation.Basic` for the continuation vocabulary: this is
  what makes the obstruction a statement about domains rather than about technique.
- `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`, `.CompleteBernstein` and `.Uniqueness`
  for the Euclidean correlator as a Laplace transform of a positive spectral measure, the form the
  spectral-gap hypothesis of Layer 0.5 is stated against.
- `TauCeti.Analysis.CompletelyMonotone.Bernstein.HausdorffBernsteinWidder`,
  `TauCeti.Probability.Moments.Determinacy` and `TauCeti.Probability.Moments.CompactDeterminacy`
  for determinacy of a measure on a compact interval by its full moment sequence, which isolates
  truncation as the only obstruction in Layer 1.4.
- `TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank`, `.ClosedRange`, `.Adjoint`, `.Index` and
  `.CompactPerturbation` for the inverse problem: non-uniqueness is a statement about a kernel,
  and Layer 5.1 is exactly the finite-rank case.
- `TauCeti.Analysis.Normed.Operator.Compact.Basic` and `.RieszTheory` for compactness of the
  continuum design operator, with `TauCeti.Analysis.InnerProductSpace.Variational.Spectrum`,
  `TauCeti.Analysis.InnerProductSpace.Variational.Fredholm` and `TauCeti.Analysis.Matrix.Spectrum`
  for the singular-value decomposition and the truncation estimates of Layers 5.2 and 5.3.
- `TauCeti.Analysis.Sobolev.Embedding`, `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and
  `TauCeti.Analysis.Sobolev.Mollification` for the smoothness class of Layer 5.3.
- `TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.HilbertBasis`, `.Span`, `.Parseval`
  and `.Moments` for the orthogonal expansion that exhibits functions with equal low moments and
  states the truncation error, and `TauCeti.Analysis.SpecialFunctions.Beta` for the moments of the
  model family `x^a (1-x)^b` used throughout Layers 1 and 5.
- `TauCeti.Analysis.Fourier.RiemannLebesgue`, `.Decay` and `.Integrable` for the transform in the
  separation defining the quasi-distribution and the decay its support theorem needs, and
  `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` for localisation in the separation.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.CauchyProblem.Basic` and
  `.CauchyProblem.Uniqueness` for the scale evolution against which Layer 3.3 checks a matching
  kernel; existence and uniqueness for that Cauchy problem are not reproved.
  `TauCeti.Analysis.PDE` is elliptic theory and does not apply to an evolution equation.
- `TauCeti.RepresentationTheory.ClassicalGroups.Decomposition` for the symmetric traceless tensor
  representations whose restriction to a finite subgroup is the subject of Layer 1.3.

From Mathlib: `Analysis.SpecialFunctions.Complex.Analytic` for the analyticity used in the
continuation, `Analysis.Complex.CauchyIntegral` for the integral representation on the
analyticity domain, `Analysis.Fourier.FourierTransform` for the transform in the separation,
`Analysis.InnerProductSpace.l2Space` and `Analysis.InnerProductSpace.Basic` for the Hilbert-space
setting of the inverse problem, `Analysis.SpecialFunctions.Pow.Real` and
`Analysis.SpecialFunctions.Log.Basic` for the functions the one-loop kernels are built from,
`MeasureTheory.Measure.Lebesgue.Basic` for the integrals and `LinearAlgebra.Matrix.Trace` for the
Dirac-structure contractions.

Genuine absences, and what the roadmap does instead:

- **No lattice field theory upstream.** No action, transfer matrix or Osterwalder-Schrader
  reconstruction exists in either library. The roadmap neither builds them nor waits: the
  Euclidean output is a finite data object and the properties a lattice construction would supply
  are named hypotheses on it.
- **No Bessel functions in Mathlib or TauCeti.** The transverse Fourier transform of Layer 4.2 and
  the free-field Ioffe-time correlator need modified Bessel functions. The roadmap defines what it
  needs by the integral representation, in the shape TauCeti's special-function subtree uses, and
  proves only the decay and asymptotic bounds it consumes.
- **No polylogarithms and no harmonic sums upstream.** These enter matching kernels beyond one
  loop. One-loop kernels are stated explicitly in logarithms and rational functions, and every
  theorem that would need a higher-order kernel is stated against an abstract kernel constrained
  by named properties, so no milestone is contingent on a missing special function.
- **No notion of an ill-posed problem and no Tikhonov regularisation in TauCeti.** Layer 5 builds
  the fragment it needs — unboundedness of the inverse on the range of a compact operator, the
  truncated singular-value reconstruction, a penalised least-squares functional with its stability
  bound — in the Fredholm and variational shapes the library already uses.
- **No Mellin transform in TauCeti.** `EpsilonEridani.QFT.Factorization.Convolution.Mellin` is
  used instead.
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.LatticeQFT.Basic` for the lattice formulation itself — the only area whose
  subject Physlib names directly — with
  `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the continuation of Layer 1.

## Layer 0: Euclidean data, the continuation, and the null-separation obstruction

References: K. Osterwalder and R. Schrader, Commun. Math. Phys. 31 (1973) 83 and 42 (1975) 281;
R. F. Streater and A. S. Wightman, *PCT, Spin and Statistics, and All That*, Chapter 3;
J. C. Collins, *Foundations of Perturbative QCD*, Chapters 6 and 7; B. L. Ioffe, Phys. Lett. B 30
(1969) 123; X. Ji, Y.-S. Liu, Y. Liu, J.-H. Zhang and Y. Zhao, Rev. Mod. Phys. 93 (2021) 035005,
Sections II and III.

### 0.1 The Euclidean data object

A *Euclidean observation* is a renormalised matrix element together with the parameters it was
obtained at: a Euclidean separation `z_E`, a hadron momentum `P`, a scale `mu` with a scheme
label, a lattice spacing `a`, a spatial extent `L`. A *Euclidean dataset* is a finite indexed
family of observations with a positive semidefinite covariance on the index set, in the sense of
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`.

Definitions: the parameter record; the observation as a real scalar with labels for its Dirac
and colour structure; the dataset; the *continuum family*, a map from a sequence of lattice
spacings to datasets together with the hypothesis that a limit exists at fixed physical
parameters. The continuum limit is a hypothesis about a family, never a property of one dataset.

Theorems: the covariance of any subfamily is positive semidefinite; a linear functional of the
data has variance given by the quadratic form, and vanishing variance characterises the
functionals exactly determined by the sampled index set. Elementary, and stated because Layer 5
needs them as its noise model.

### 0.2 The continuation map and its domain

Definitions: the complexified separation space; the *Euclidean section*, on which the time
component is purely imaginary, and the *Minkowski section* of real four-vectors; the continuation
map from one to the other; the *analyticity domain*, an open connected subset of the complexified
space containing the Euclidean section and the spacelike Minkowski vectors, on which the matrix
element is holomorphic. Holomorphy on that domain is a hypothesis — it is what a
Wightman-axiomatic or reflection-positive construction supplies — and it is named at every use.

Theorems: (i) *uniqueness*: two functions holomorphic on the domain agreeing on the Euclidean
section agree throughout, from the identity theorem via `TauCeti.Analysis.Analytic.IsolatedZeros`
and `TauCeti.Analysis.Complex.HalfPlaneIdentity`; (ii) *integral representation*: on a closed ball
inside the domain the function is recovered from boundary values, via
`Mathlib.Analysis.Complex.CauchyIntegral`, the form Layer 5 uses; (iii) *no uniform stability*:
any bound on the continued function in terms of data on a compact subset of the Euclidean section
degrades without bound as the evaluation point approaches the boundary, stated as a lower bound on
the constant in such an estimate. Statements (i) and (ii) are encouraging; (iii) is the
quantitative content of the obstruction and is proved, not asserted.

### 0.3 The null-separation obstruction

**Theorem (image of the continuation).** For a nonzero real Euclidean four-vector `z_E` with image
`z`, one has `z^2 = -|z_E|^2 < 0` in the Minkowski metric: the image is strictly spacelike. The
image of the Euclidean section contains no nonzero null vector, and the only null vector in its
closure is the origin.

**Corollary (no Euclidean preimage).** The bilinear whose fields are separated by a nonzero null
vector is not the continuation of any operator at real Euclidean separation. A parton
distribution, the Fourier transform in the light-cone separation of such a matrix element, is
therefore not the continuation of any single Euclidean observation.

**Theorem (null separation is a boundary point).** A nonzero null vector lies in the boundary of
the analyticity domain, not its interior; its value is a boundary value obtained as a limit along
a path in the domain, and 0.2(i), which speaks about points of the domain, does not supply it.

**Theorem (the bare boundary value diverges).** For the unrenormalised bilinear the matrix element
diverges as `z^2 -> 0`, at leading order logarithmically in `z^2 mu^2` in the twist-two structure;
the light-cone matrix element is finite only after the multiplicative renormalisation whose
renormalisation group is recorded in `EpsilonEridani.QFT.Factorization.Evolution.Basic`.

The obstruction is thus of two kinds, a domain statement and a renormalisation statement, and the
roadmap keeps them apart: Layers 2 and 3 confront them in different orders, and a discrepancy
between the routes is diagnosable only if the two kinds are not conflated. These four statements
are the precise content of the informal claim that a lattice calculation cannot compute a parton
distribution directly.

### 0.4 What a Euclidean calculation does determine

Local operators (`z = 0`): a forward matrix element of a local operator is the continuation of the
Euclidean one with no domain obstruction, renormalisation being the only scheme-dependent step.
Input to Layer 1.

Spacelike-separated non-local operators (`z^2 < 0`): these lie in the interior of the analyticity
domain and are the continuation of Euclidean observations at the corresponding `z_E`, for every
nonzero `z_E`. Input to Layers 2, 3 and 4.

One statement delimits the roadmap and is made once: these two classes exhaust what the
continuation gives. Every construction below extracts light-cone information from one of them
together with a *perturbative* relation to the light-cone object, and none evades the obstruction
by continuation alone.

### 0.5 Single-hadron matrix elements from Euclidean correlators

Definitions: two-point and three-point Euclidean correlators as functions of the Euclidean time
separations; the spectral decomposition into a ground-state term and a remainder; the *spectral
gap* hypothesis, that excited energies exceed the ground-state energy by a positive amount at the
given momentum.

Theorems: (i) the correlator is the Laplace transform of a positive spectral measure, stated
against `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` and `.CompleteBernstein`, so
positivity is a hypothesis rather than a reproof; (ii) under the gap hypothesis the ratio of the
three-point to the two-point correlator converges to the ground-state matrix element, with
remainder bounded by a constant times an exponential in the gap times the time separation;
(iii) the spectral measure is determined by the correlator on a half-line, via
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Uniqueness`. Unlike the null-separation
obstruction, excited-state contamination is an estimation problem and not an obstruction of
principle, and the roadmap says so.

A gap named honestly: the constant in (ii) is not fixed by the gap alone but involves the overlaps
of the interpolating operator with the excited states, which no theorem here bounds; the theorem
is stated with that constant as a hypothesis.

### Examples

- The free scalar propagator: analyticity domain and continuation computed explicitly, with the
  verification that the image of the Euclidean section is the spacelike region.
- The free quark bilinear at spacelike separation: the logarithmic behaviour as `z^2 -> 0`
  computed rather than assumed.
- The local vector current: its forward matrix element is the quark number, the normalisation
  every construction in Layers 2 to 4 must reproduce.
- A two-state spectral model: the ratio of 0.5(ii) computed exactly, the remainder matching the
  stated bound, and the demonstration that fitting only the leading exponential biases the matrix
  element by the same order as that bound.

### Dependencies

Mathlib complex and Fourier analysis; TauCeti's identity theorem and Stieltjes-Laplace material;
`EpsilonEridani.Particles.Parton.PDF.Basic` for the obstructed light-cone definition;
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`. No other roadmap: this layer
underlies all the others and depends on none of them.

---

## Layer 1: the operator-product route and the finite-moment problem

References: N. Christ, B. Hasslacher and A. H. Mueller, Phys. Rev. D 6 (1972) 3543; M. Göckeler
et al., Phys. Rev. D 53 (1996) 2317; W. Detmold, W. Melnitchouk and A. W. Thomas, Eur. Phys. J.
direct 3 (2001) 13; M. Baake, B. Gemünden and R. Oedingen, J. Math. Phys. 23 (1982) 944;
J. A. Shohat and J. D. Tamarkin, *The Problem of Moments*, AMS 1943.

### 1.1 Moments of a collinear density as local matrix elements

Definitions: the tower of local twist-two operators, symmetric and traceless in their Lorentz
indices, built from a bilinear with covariant derivatives; their forward matrix elements reduced
to scalar coefficients by the invariant decomposition of `EpsilonEridani.Particles.Parton.Basic`.

**Theorem (moment identity).** Under the hypothesis that the Mellin moment integral converges, the
`n`-th Mellin moment of the collinear density of `EpsilonEridani.Particles.Parton.PDF.Basic`
equals the reduced forward matrix element of the spin-`n` twist-two operator, with a stated
normalisation, stated against `EpsilonEridani.QFT.Factorization.Convolution.Mellin`. The proof is
the term-by-term Taylor expansion of the light-cone separation with the gauge link expanded to the
same order; the hypothesis that makes it a theorem is the interchange of expansion and Fourier
integral, which needs the decay proved in Layer 3.1. That dependency is recorded, not hidden.

**Theorem (the operator measured is the operator evolved).** Moment evolution is diagonal in `n`
for non-singlet combinations and a two-by-two matrix in the singlet sector, as established in
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` and in `CollinearEvolution`, which this
roadmap uses and does not restate. What it adds is that the operator whose matrix element a
Euclidean calculation returns is the operator whose anomalous dimension appears there — a claim
about the renormalisation condition, proved by comparing the two conditions and their conversion
factor, and false if the scheme labels of Convention 8 are dropped.

### 1.2 Mixing in the continuum

Definitions: the operator basis at fixed dimension; the mixing matrix under renormalisation; the
triangular structure following from dimensional analysis together with rotational invariance of
the regularisation.

**Theorem.** In a continuum scheme preserving O(4) and chiral symmetry, twist-two operators of
different spin do not mix, lying in inequivalent irreducible representations of the rotation
group; the mixing matrix is block diagonal in spin. The representation-theoretic input is the
irreducibility of the symmetric traceless tensor representations, from
`TauCeti.RepresentationTheory.ClassicalGroups.Decomposition`. The theorem is proved in order to be contradicted
in 1.3: its loss on a discretised space is the whole content of the limitation.

### 1.3 The discretisation obstruction, derived

On a hypercubic lattice the rotation group is replaced by the finite hypercubic symmetry group.
The spin-`n` symmetric traceless representation is no longer irreducible under restriction, and
its decomposition can share an irreducible constituent with that of an operator of *lower* mass
dimension.

Definitions: the hypercubic group; the restriction of the symmetric traceless tensor
representations to it; a *dangerous mixing pair*, two operators of different mass dimension whose
restrictions share an irreducible constituent.

**Theorem (branching).** Decompose the restriction of the spin-`n` symmetric traceless
representation for `n` up to a stated bound and prove that for `n` at least four a dangerous
mixing pair exists. The content is a finite character computation with the orthogonality relations
of the finite group, and it is unconditional.

**Theorem (power divergence).** If an operator of mass dimension `d` mixes with one of dimension
`d'` less than `d`, the mixing coefficient in a lattice scheme carries a factor `a^(d'-d)`, which
diverges as the spacing goes to zero; the continuum limit of the higher moment then requires
cancelling a power divergence against a measured lower-dimensional matrix element. Hypotheses: the
basis respects the lattice symmetry, and the dangerous mixing coefficient is nonvanishing.

Whether *every* hypercubic-symmetric basis has a nonvanishing dangerous mixing coefficient for `n`
at least four is **an open question** in this roadmap. The theorem is stated conditionally on the
coefficient being nonzero and the unconditional version is named as the open problem, not
presented as a dischargeable milestone. What is unconditional is the branching theorem.

**Corollary (bound on accessible moments).** Under those hypotheses only moments up to the stated
`n` are obtainable from local operators with a finite continuum limit and no power-divergent
subtraction. The bound is stated as a function of the hypotheses, not as a number, because the
number depends on a discretisation that Convention 12 forbids fixing.

### 1.4 The truncated moment problem

Setting: a function `f` on the unit interval in a stated space; the map to its first `N` Mellin
moments; the data, a vector in `R^N` with a covariance from 0.1.

Theorems: (i) *exact non-uniqueness*: the truncated moment map is bounded onto a
finite-dimensional space, so its kernel is closed and infinite dimensional and the consistent set
is a closed affine subspace of infinite dimension, via `TauCeti.Analysis.Fredholm.FiniteRank`;
(ii) *the obstruction is exactly finiteness*: a positive measure on a compact interval is
determined by its full moment sequence, via
`TauCeti.Analysis.CompletelyMonotone.Bernstein.HausdorffBernsteinWidder`,
`TauCeti.Probability.Moments.Determinacy` and `.CompactDeterminacy`, so nothing is lost in passing
to moments and the difficulty is the truncation; (iii) *explicit non-uniqueness*: construct for
each `N` two distinct functions with identical first `N` moments and a stated supremum-norm
separation, using the orthogonality of the Chebyshev or Jacobi basis of
`TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Span` and `.HilbertBasis` against
monomials of degree below `N`; (iv) *what restores well-posedness*: under the hypothesis that `f`
lies in a ball of a stated smoothness class, the truncated moments determine `f` up to the ball
radius times the expansion tail plus amplified noise, the quantitative form being Layer 5.3
specialised to the moment kernel.

An honest labelling, preserved from this roadmap's specification: the hypothesis in (iv) is a
hypothesis and not a result. It cannot be checked against the data it constrains, and presenting a
smoothness assumption as a derivation would be wrong.

### Examples

- The family `x^a (1-x)^b`: moments in closed form via `TauCeti.Analysis.SpecialFunctions.Beta`,
  with the map from the two parameters to the first two moments proved injective — a model
  replaces the missing information, it does not recover it.
- Two functions with equal first six moments: an explicit pair from the Jacobi expansion with a
  stated supremum-norm difference, so that (iii) is a construction.
- The spin-four operator on a hypercubic lattice: branching computed and a dangerous mixing pair
  exhibited.
- The second moment of the unpolarised density, compared with the energy-momentum-tensor matrix
  element whose definition is taken from `HadronMassAndEnergyMomentumTensor`.

### Dependencies

Layer 0 for the accessibility of local matrix elements, Layer 3.1 for the decay hypothesis of the
moment identity. `CollinearEvolution` for moment evolution and anomalous dimensions;
`InclusiveStructureFunctions` and `SpinStructure` for the densities;
`HadronMassAndEnergyMomentumTensor` for the energy-momentum-tensor matrix elements of the
second-moment example, whose hadron-mass decomposition is not restated here. TauCeti's
determinacy, Fredholm finite-rank and Chebyshev material.

---

## Layer 2: quasi-distributions and large-momentum effective theory

References: X. Ji, Phys. Rev. Lett. 110 (2013) 262002; X. Ji, Sci. China Phys. Mech. Astron. 57
(2014) 1407; X. Xiong, X. Ji, J.-H. Zhang and Y. Zhao, Phys. Rev. D 90 (2014) 014051; X. Ji,
J.-H. Zhang and Y. Zhao, Phys. Rev. Lett. 120 (2018) 112001; T. Ishikawa, Y.-Q. Ma, J.-W. Qiu and
S. Yoshida, Phys. Rev. D 96 (2017) 094019; T. Izubuchi, X. Ji, L. Jin, I. W. Stewart and Y. Zhao,
Phys. Rev. D 98 (2018) 056004; V. S. Dotsenko and S. N. Vergeles, Nucl. Phys. B 169 (1980) 527;
X. Ji et al., Rev. Mod. Phys. 93 (2021) 035005.

### 2.1 Definition

Definitions: the equal-time quark bilinear at spacelike separation along a fixed spatial
direction with a straight link along that direction; its matrix element in a hadron state of large
momentum in the same direction; the *quasi-distribution* as the Fourier transform in the
separation, via `Mathlib.Analysis.Fourier.FourierTransform`, with the conjugate variable
identified as the momentum fraction. The Dirac structure is explicit data: `gamma^0` and
`gamma^3` give different quasi-distributions, and which structures avoid mixing between bilinears
under renormalisation is part of the definition.

Theorems: the quasi-distribution is well defined as a tempered distribution given the decay
hypothesis, via `TauCeti.Analysis.Fourier.Integrable` and `TauCeti.Analysis.Fourier.RiemannLebesgue`;
it is real for the stated Dirac structures; and it is even or odd in the momentum fraction
according to the parton-antiparton symmetry of the structure chosen.

### 2.2 Support and the sum rule

**Theorem (support).** The quasi-distribution has support on the whole real line, not the unit
interval: at any finite momentum there are momentum-fraction values outside `[-1,1]` at which it
is nonzero, exhibited by computation rather than by appeal to intuition.

**Theorem (sum rule).** Its integral over the momentum fraction equals the local matrix element of
the corresponding current, so the normalisation is momentum-independent and agrees with the
light-cone one. This is the one exact relation to a light-cone quantity, follows from 0.4, and is
the check every matching kernel must preserve.

**Theorem (positivity is not inherited).** A quasi-distribution need not be nonnegative when the
light-cone density of `EpsilonEridani.Particles.Parton.PDF.Positivity` is, and the matching
convolution does not preserve nonnegativity; made precise by exhibiting a kernel and a nonnegative
input whose convolution is somewhere negative. The caveat of
`EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` compounds it.

### 2.3 The matching theorem

**Theorem (LaMET factorisation).** Under the hypotheses below the renormalised quasi-distribution
equals the convolution of a perturbative kernel with the light-cone density, plus a remainder
bounded by `C (Lambda^2/P^2 + M^2/P^2)` in a stated norm on a stated region of the momentum
fraction, with `Lambda` the hadronic scale and `M` the hadron mass. The convolution is
`EpsilonEridani.QFT.Factorization.Convolution.Basic` and the kernel carries its order as data.

Hypotheses, none suppressed: the light-cone density exists and is the one of
`EpsilonEridani.Particles.Parton.PDF.Basic`; collinear factorisation of the quasi-distribution's
collinear region holds in the sense of `EpsilonEridani.QFT.Factorization.Basic`, inherited from
`CollinearEvolution` and not reproved; the scheme of the quasi-distribution is the one the kernel
was computed in; and the window condition of 2.4 holds.

The one-loop kernel is stated explicitly in logarithms and rational functions, with its endpoint
behaviour, its support in the convolution variable, and the check that it integrates to unity so
that the sum rule survives order by order. Beyond one loop the kernel appears only as an abstract
object constrained by named properties.

### 2.4 The order of the limits

**Theorem (the limits do not commute).** For the bare correlator the iterated limit taking the
spacing to zero first and the momentum to infinity second differs from the opposite order; the
difference is exhibited at one loop, where the second order produces a term diverging with the
momentum. The correct order is therefore part of the matching theorem: renormalise at fixed
separation and momentum, take the continuum limit, and only then expand in the inverse momentum.

**The window condition.** The hypothesis of 2.3 includes `Lambda << P << 1/a`. It is stated with
both inequalities, because a calculation violating the upper one has no continuum limit at the
momentum used, however small its statistical error.

**Theorem (the expansion is not uniform in the momentum fraction).** The remainder bound holds on
a region bounded away from the endpoints and from zero; near `x = 0` and `x = 1` the correction is
enhanced and the bound fails. What is proved is the enhancement: the remainder at `x` is bounded
by a constant times the inverse squared momentum divided by a positive power of `x(1-x)`. The
*optimal* uniformity statement — the largest region and weakest power for which a bound holds — is
**an open question**, recorded as one rather than replaced by a uniform bound.

### 2.5 Linear divergences and the renormalisation of the link

Definitions: the Wilson-line self-energy; the linear divergence, a factor `exp(-delta_m |z|)` with
`delta_m` growing as the inverse spacing; the RI-MOM scheme for the spacelike bilinear.

**Theorem (multiplicative renormalisability).** The spacelike quark bilinear with a straight link
renormalises multiplicatively: the factor is a `z`-independent factor times a factor depending on
the separation only through its length, with no mixing among bilinears of different separation.
Hypotheses: a straight link, a regularisation in which the self-energy exponentiates, and the
Dirac structures of 2.1. The proof combines exponentiation with the absence of `z`-dependent
mixing in the operator basis.

**Theorem (what the divergence does).** Without that renormalisation, the continuum limit of the
bare matrix element at fixed physical separation does not exist: the exponential factor diverges.
The linear divergence is thus a property of the object, not an artefact of a scheme.

Schemes: RI-MOM with its condition and its conversion factor to MS-bar; the *ratio* scheme, which
exploits the structure of the theorem above, is defined here and proved to cancel the divergence
in Layer 3.2.

### Examples

- The one-loop quasi-distribution of a quark in a quark state in a stated scheme, with the
  verification that inverting the one-loop kernel returns the known light-cone result.
- The free-field limit in closed form, exhibiting the support statement of 2.2.
- A Gaussian model matrix element whose quasi-distribution is nonzero at momentum fraction two.
- The one-loop check that the kernel integrates to unity.

### Dependencies

Layer 0 for spacelike accessibility and the Fourier setting, Layer 1 for the normalising local
matrix element. `CollinearEvolution` for the factorisation hypothesis, the splitting kernels and
the coupling; `InclusiveStructureFunctions` and `SpinStructure` for the targets. TauCeti's Fourier
material; `EpsilonEridani.QFT.QCD.Renormalization` and
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` for the one-loop work.

---

## Layer 3: Ioffe time, pseudo-distributions, and good lattice cross sections

References: A. V. Radyushkin, Phys. Rev. D 96 (2017) 034025, and Phys. Lett. B 767 (2017) 314;
K. Orginos, A. Radyushkin, J. Karpie and S. Zafeiropoulos, Phys. Rev. D 96 (2017) 094503;
J. Karpie, K. Orginos and S. Zafeiropoulos, JHEP 11 (2018) 178; Y.-Q. Ma and J.-W. Qiu,
Phys. Rev. Lett. 120 (2018) 022003, and Phys. Rev. D 98 (2018) 074021; K. Cichy and
M. Constantinou, Adv. High Energy Phys. 2019 (2019) 3036904.

### 3.1 The Ioffe-time distribution

**Theorem (two invariants suffice).** For the stated Dirac structures the matrix element of the
spacelike bilinear in a hadron state is a function of the invariants `nu = P.z` and `z^2` alone,
times kinematic structures fixed by the invariant decomposition of
`EpsilonEridani.Particles.Parton.Basic`. Proved from Lorentz covariance, this is why the route
exists: organising the same data by `nu` and `z^2` separates the two obstructions of 0.3.

Definitions: the *Ioffe-time distribution* as the invariant amplitude at fixed `z^2`; the
light-cone Ioffe-time distribution as the Fourier transform of the collinear density in `nu`.

Theorems: the light-cone Ioffe-time distribution and the collinear density determine each other,
via `Mathlib.Analysis.Fourier.FourierTransform` and inversion; its value at `nu = 0` is the
normalisation of 2.2; and under a stated integrability hypothesis on the density it decays at
large `nu`. This is the only place that decay is proved, and Layer 1.1 cites it.

### 3.2 The ratio and the cancellation of the linear divergence

Definitions: the *reduced* Ioffe-time distribution, the ratio of the matrix element at `(nu, z^2)`
to that at `(0, z^2)` with the *same* `z^2`; the double ratio dividing further by the free-field
or rest-frame quantity.

**Theorem (cancellation).** Assume the multiplicative renormalisability of 2.5 and equality of
`z^2` between numerator and denominator. Then the `z`-dependent renormalisation factor, including
`exp(-delta_m |z|)` and the lattice wave-function factor, cancels identically, and the ratio has a
finite continuum limit at fixed physical `z^2`.

Both hypotheses appear in the theorem deliberately: with both stated, a failure of the ratio to
have a continuum limit implicates either renormalisability or the equal-`z^2` condition and
nothing else. A precisely narrowed hypothesis is worth more than a broad claim.

**Theorem (what the ratio does not cancel).** It does not remove the logarithmic `z^2` dependence,
which is physical and is what 3.3 exploits, and it does not remove higher-twist contributions,
which remain as a power correction in `z^2 Lambda^2`.

### 3.3 Short-distance factorisation

**Theorem (factorisation in Ioffe time).** Under the hypothesis `z^2 Lambda^2 << 1`, with `nu`
arbitrary, the reduced Ioffe-time distribution equals a convolution in the Ioffe-time variable of
a perturbative kernel with the light-cone Ioffe-time distribution, plus a remainder bounded by a
constant times `z^2 Lambda^2`. The kernel depends logarithmically on `z^2 mu^2` and is stated at
one loop. The region of validity is a condition on the separation, not on the momentum: the two
routes use the same data, expand in different small parameters, and fail in different places.

**Theorem (evolution consistency).** The kernel's logarithmic `z^2` dependence generates, through
the convolution, exactly the scale evolution of the light-cone density given by
`EpsilonEridani.QFT.Factorization.Evolution.Basic` and `CollinearEvolution`, at one loop. Posed as
a semigroup statement against `TauCeti.Analysis.Semigroups.Defs` and `.Generator`, with existence
and uniqueness for the Cauchy problem taken from `TauCeti.Analysis.Semigroups.CauchyProblem.Basic`
and `.CauchyProblem.Uniqueness` and not reproved. This is a nontrivial check on the kernel and is
stated as a theorem to be proved.

### 3.4 Relation between the two routes

**Theorem (equivalence of the extractions).** Under the hypotheses of both 2.3 and 3.3 on an
overlapping parameter region, the light-cone density extracted by either route is the same, and
the two kernels are related by the Fourier transform in the Ioffe-time variable with the stated
change of variables.

The purpose is diagnostic: given it, a numerical disagreement between the routes on the same data
implicates a specific hypothesis — the window condition of 2.4, the short-distance condition of
3.3, the renormalisability of 2.5, or the equal-`z^2` condition of 3.2. Whether the equivalence
persists beyond one loop in the kernels is **a conjecture** here, stated with the order at which
it is established.

### 3.5 Good lattice cross sections

A *good lattice cross section* is a Euclidean quantity satisfying three conditions, each a
separate named hypothesis:

- **(i) Calculability.** It is the continuation of a matrix element at real Euclidean separation,
  in the sense of 0.4.
- **(ii) Renormalisability.** It has a finite continuum limit after a renormalisation independent
  of the hadron state and momentum.
- **(iii) Short-distance factorisation.** It admits a small-separation expansion whose leading
  term is a convolution of a perturbative coefficient function with a light-cone distribution,
  with power-suppressed corrections.

**Theorem (the criterion).** If a Euclidean quantity satisfies (i) and (ii) and its short-distance
operator-product expansion has a twist-two leading term, then it satisfies (iii), with the
coefficient function given by that expansion's coefficient. Proved once.

**Corollaries.** The quasi-distribution of 2.1 and the reduced Ioffe-time distribution of 3.2 are
good lattice cross sections, and the matching theorems of 2.3 and 3.3 are instances of the
criterion with their coefficient functions identified. Deriving them as corollaries rather than
separately is what makes this a library rather than a collection.

**An honest gap.** Condition (ii) does not follow from (i) and (iii): a quantity can be calculable
and admit a formal expansion while its renormalisation depends on the state. Whether (ii) follows
from (i) plus a twist-two leading term under additional hypotheses is **an open question**; (ii)
is stated as an independent hypothesis to be verified per candidate.

Further member: the current-current correlator, the matrix element of two spacelike-separated
vector currents, is developed as a good lattice cross section with its one-loop coefficient
function, because it is not a quark bilinear and therefore tests the criterion.

### Examples

- The free-field reduced Ioffe-time distribution, identically one, so any deviation measures
  interaction and systematic error.
- The current-current coefficient function at one loop, checked against
  `EpsilonEridani.QFT.Factorization.DIS.HardKernel` in the appropriate limit.
- The pion distribution amplitude from a ratio, with the normalisation fixed by the decay constant
  of `MesonStructure`.
- A one-loop check that the kernel of 3.3 reproduces the leading-order splitting kernel of
  `CollinearEvolution` through the evolution-consistency theorem.

### Dependencies

Layers 0, 1 and 2. `CollinearEvolution` for the evolution and splitting kernels; `MesonStructure`
for the distribution amplitude; `InclusiveStructureFunctions` for the densities. TauCeti's
semigroup theory for the evolution statement and its Fourier material for 3.1;
`EpsilonEridani.QFT.Factorization.DIS.HardKernel` for the check in the examples.

---

## Layer 4: off-forward, transverse-momentum-dependent, and distribution-amplitude bridges

References: X. Ji, A. Schäfer, X. Xiong and J.-H. Zhang, Phys. Rev. D 92 (2015) 014039;
A. V. Radyushkin, Phys. Rev. D 100 (2019) 116011; X. Ji, P. Sun, X. Xiong and F. Yuan,
Phys. Rev. D 91 (2015) 074009; M. A. Ebert, I. W. Stewart and Y. Zhao, Phys. Rev. D 99 (2019)
034505, and JHEP 09 (2019) 037; X. Ji, Y. Liu and Y.-S. Liu, Nucl. Phys. B 955 (2020) 115054;
V. M. Braun and D. Müller, Eur. Phys. J. C 55 (2008) 349; J. C. Collins, *Foundations of
Perturbative QCD*, Chapters 13 and 14.

### 4.1 The off-forward bridge

Definitions: quasi- and pseudo-distributions off forward, with skewness and invariant momentum
transfer as additional parameters; the light-cone targets taken from
`EpsilonEridani.Particles.Parton.GPD.Basic` and `GeneralizedPartonDistributions`, not restated.

Theorems: (i) the off-forward matching relation, with a kernel depending on the skewness and, at
leading power, not on the momentum transfer, which enters only through the distribution — stated
with its power counting and the hypothesis that makes it leading power; (ii) the polynomiality
constraint of `EpsilonEridani.Particles.Parton.GPD.Polynomiality` is preserved by the matching, so
an extracted distribution violating it indicates a failed hypothesis rather than a physical
finding, which makes polynomiality an acceptance check on the bridge; (iii) the forward limit of
the off-forward kernel is the kernel of 2.3 or 3.3, proved and not assumed.

**Theorem (the Euclidean and exclusive maps have different kernels).** Compare the map from a
generalized parton distribution to the Compton form factor, whose kernel is characterised in
`EpsilonEridani.Particles.Parton.GPD.Ambiguity` and
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness`, with the map from the
distribution to its pseudo-distribution at all Ioffe times and all small separations. Under
hypotheses of continuum data at all `nu`, an exact kernel and leading power, the second map has
trivial kernel while the first does not; the two ambiguities are distinct and the Euclidean route
is not subject to the exclusive deconvolution ambiguity.

Deliberately not overstated: this concerns an idealised map with continuum data. The finite-data
version is Layer 5, whose conclusion is that the trivial-kernel statement survives to no finite
dataset. Both are stated and the first is not to be read as the second.
`GeneralizedPartonDistributions` owns the exclusive ambiguity; this roadmap proves the comparison
only.

### 4.2 The transverse-momentum-dependent bridge

Definitions: the quasi-TMD as the matrix element of a bilinear with a staple-shaped link of finite
length, with transverse separation and staple length explicit data; targets, rapidity divergence
and the Collins-Soper kernel taken from `TransverseMomentumDistributions`,
`EpsilonEridani.Particles.Parton.TMD.Basic` and `EpsilonEridani.Particles.Parton.TMD.CollinsSoper`
and not restated.

Theorems: (i) two divergences, not one — the link's linear divergence as in 2.5 but with the path
length entering separately, and the rapidity divergence of the long staple — with a statement of
which combinations are free of each; (ii) factorisation of the quasi-TMD into a perturbative
kernel, the light-cone TMD and a soft factor, with the soft factor identified as the object the
quasi-TMD alone does not determine; (iii) **the extraction theorem**: the Collins-Soper kernel
equals a logarithmic derivative in the hadron momentum of the ratio of quasi-TMDs at two momenta
at equal transverse separation, in which the soft factor cancels, so the kernel is accessible
without the soft function. Hypotheses: finite staple length and the window condition of 2.4 at
both momenta.

The transverse Fourier transform relating separation and momentum representations involves
modified Bessel functions, absent from both upstream libraries; the roadmap builds the integral
representation and the two bounds it consumes, and does not wait.

### 4.3 The distribution-amplitude bridge

Definitions: the light-cone distribution amplitude of `MesonStructure` as target, its quasi- and
pseudo- counterparts, and the moment route through local operators.

Theorems: the matching relation with the kernel at one loop; the normalisation fixed by the decay
constant defined in `MesonStructure`; the statement that the moment route for amplitudes suffers
exactly the mixing limitation of 1.3 with the same representation-theoretic input, so it is not an
independent difficulty; and the endpoint statement — an amplitude's endpoints are where the
non-uniformity of 2.4 is worst and are therefore the least constrained part of it.

### 4.4 The common bridge interface

A `Bridge` bundles the Euclidean observable, the light-cone target, the kernel with its order, the
validity region as a subset of the parameter space, and the remainder bound on that region. The
interface is the layer's deliverable: what all four constructions have in common, in a form a new
construction can be shown to instantiate.

Theorems: each of 2.3, 3.3, 4.1 and 4.2 instantiates the interface with its kernel, region and
bound identified; composing a bridge with the evolution of `CollinearEvolution` is consistent, in
that matching then evolving agrees with evolving then matching to the kernel's order; and a bridge
determines its target uniquely given continuum data on its validity region — the idealised
uniqueness whose finite-data failure is Layer 5.

### Examples

- The second moment of the pion distribution amplitude by both the Layer 1 and the Layer 3 route,
  with agreement as an acceptance check.
- The Collins-Soper kernel at one loop from the ratio of 4.2(iii) on a perturbative model
  quasi-TMD, checked against `EpsilonEridani.Particles.Parton.TMD.CollinsSoper`.
- The zero-skewness off-forward bridge reducing to the impact-parameter density of
  `GeneralizedPartonDistributions`, giving the check of
  `EpsilonEridani.Particles.Parton.Unified.Consistency`.
- A candidate quantity satisfying (i) and (iii) of 3.5 but not (ii), exhibited explicitly, so the
  independence of (ii) is a construction rather than a caveat.

### Dependencies

Layers 0 to 3. `GeneralizedPartonDistributions` for the off-forward targets, polynomiality and the
exclusive ambiguity; `TransverseMomentumDistributions` for the TMD definitions, the rapidity
divergence and Collins-Soper evolution; `MesonStructure` for the amplitudes and decay constants;
`CollinearEvolution` for the evolution in the interface consistency theorem.

---

## Layer 5: the inverse problem and identifiability from finite Euclidean data

References: J. Karpie, K. Orginos, A. Rothkopf and S. Zafeiropoulos, JHEP 04 (2019) 057;
H. W. Engl, M. Hanke and A. Neubauer, *Regularization of Inverse Problems*, Kluwer 1996;
P. C. Hansen, *Discrete Inverse Problems*, SIAM 2010; L. Del Debbio, T. Giani, J. Karpie,
K. Orginos, A. Radyushkin and S. Zafeiropoulos, JHEP 02 (2021) 138.

### 5.1 The data map is finite rank

Definitions: a light-cone distribution space `X`, Banach with a stated norm; the *design operator*
of a Euclidean dataset, the map from `X` to `R^N` whose `i`-th component integrates the bridge
kernel of 4.4 at the `i`-th parameter point against the distribution; the noise model of 0.1.

Theorems: (i) the design operator is bounded, with a norm bound in terms of the kernels; (ii) it
has rank at most `N`, hence is finite rank in the sense of `TauCeti.Analysis.Fredholm.FiniteRank`,
its range is closed and its kernel has codimension at most `N`; (iii) *exact non-uniqueness*: for
infinite-dimensional `X` the kernel is infinite dimensional and the consistent set is a closed
affine subspace of infinite dimension. The non-uniqueness of a lattice extraction is therefore the
rank of a linear map, not a matter of statistics.

### 5.2 The continuum limit of the data map, and instability

Definitions: the *continuum design operator*, the same kernel without discretising the parameters,
mapping `X` to a function space on a window of Ioffe time and separation.

Theorems: (i) with a continuous kernel on a compact window it is compact, via
`TauCeti.Analysis.Normed.Operator.Compact.Basic`; (ii) its range is not closed unless it is finite
rank and its inverse on its range is unbounded, via
`TauCeti.Analysis.Normed.Operator.Compact.RieszTheory` — the precise sense in which the problem is
unstable; (iii) the singular values accumulate only at zero, via
`TauCeti.Analysis.InnerProductSpace.Variational.Spectrum`, and the error of the truncated
singular-value inversion at index `k` is bounded below by the noise divided by the `k`-th singular
value, so resolution amplifies noise at a rate set by the decay.

TauCeti has no notion of an ill-posed problem by name and the roadmap introduces none: these three
statements are the content that word summarises, each a theorem about a compact operator in the
vocabulary the library already has.

### 5.3 Regularisation under a smoothness hypothesis

Definitions: a *source condition*, the hypothesis that the distribution lies in a ball of stated
radius in a smoothness class — a Sobolev-type ball via `TauCeti.Analysis.Sobolev.Embedding` and
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, or a ball in the Jacobi coefficients of 1.4; the
penalised least-squares functional; the truncated singular-value reconstruction.

Theorems: (i) the penalised functional has a unique minimiser for positive penalty, from
`TauCeti.Analysis.InnerProductSpace.Variational.Fredholm`; (ii) **the error bound**: the
reconstruction error is bounded by an approximation term decreasing in the truncation index and
proportional to the ball radius, plus a noise term increasing in that index and proportional to
the noise level divided by the smallest retained singular value; (iii) the optimal truncation
balances the two and gives a convergence rate in the noise level, with exponent set by the
smoothness index and the singular-value decay; (iv) without the source condition no rate holds, so
a statement of reconstruction error unaccompanied by a source condition is not a statement.

The roadmap is explicit that (ii) and (iii) trade an assumption for a rate. What the data
determine is 5.4; what the hypothesis adds is quantified here; the two are not mixed.

### 5.4 Identifiability

Definitions: the *identifiable subspace* of a dataset, the annihilator of the kernel of the design
operator — equivalently, the span in the dual space of the kernel functionals of the sampled
points.

**Theorem (characterisation).** A continuous linear functional of the distribution is determined
by the data — takes the same value on every consistent distribution — if and only if it lies in
the identifiable subspace; its variance is then the quadratic form of 0.1 in the coefficients
expressing it in the sampled functionals, so determination and uncertainty come together.

**Theorem (the pointwise value is not identifiable).** For any finite Euclidean dataset and any
interior point of the momentum-fraction interval, evaluation at that point is not in the
identifiable subspace, and evaluation is not a bounded functional in the natural `L^2` setting, so
no finite dataset determines the value of a light-cone distribution at a point. A plotted curve
for an extracted distribution is therefore a consequence of the regularisation of 5.3 and of the
parametrisation chosen, in an amount 5.3(ii) quantifies, and not of the data alone.

This is the roadmap's sharpest target and it is negative. It does not say Euclidean data are
uninformative; it says which functionals they inform — integrals against functions in the span of
the kernels, moments inside the identifiable subspace, differences lying in it — and makes those
the quantities to report. The pattern is that of
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`, instantiated for Euclidean data,
reusing the vocabulary of `EpsilonEridani.QFT.Scattering.DIS.Inference.Unfolding`.

**Theorem (quantitative version).** For a functional outside the identifiable subspace, the
diameter of its value on the consistent set is bounded below by the ball radius times its distance
to the subspace, and above by that distance times the radius plus the amplified noise. A
functional is usefully constrained to the extent that it is close to the subspace, and that
distance is computable from the kernels.

### 5.5 Euclidean and experimental data together

Definitions: the experimental design operator, taken from `InclusiveStructureFunctions` and
`EpsilonEridani.QFT.Scattering.DIS.Inference.Basic` and not reconstructed; the joint design
operator, the direct sum.

Theorems: (i) the identifiable subspace of the joint dataset is the sum of the two subspaces, with
dimension the sum of the dimensions minus that of the intersection; (ii) the newly identified
directions are a complement of the intersection in the Euclidean subspace, so the useful question
about a lattice calculation is which functionals it adds; (iii) a consistency test: on the
intersection both datasets determine the same values, so a discrepancy there is a failed
hypothesis of one of the bridges, with the test statistic the combined covariance quadratic form
restricted to the intersection. Complementarity becomes a statement about a sum of subspaces with
a computable dimension.

### Examples

- Six Mellin moments: the identifiable subspace as the span of six monomials, the annihilator
  exhibited, and a functional outside it whose diameter bound is evaluated.
- A stated geometric singular-value decay and noise level: the optimal truncation index and rate
  computed, instantiating 5.3(iii).
- The family `x^a (1-x)^b`: two moments identify the two parameters exactly, making precise how
  much of a published curve is the model.
- A joint dataset whose Euclidean identifiable subspace is contained in the experimental one, so
  that 5.5(ii) returns no new directions — the case worth being able to recognise.

### Dependencies

Layers 0 to 4, in particular the bridge interface of 4.4 that supplies the kernels.
`InclusiveStructureFunctions` for the experimental design operator of 5.5. TauCeti's Fredholm,
compact-operator, variational-spectrum and Sobolev material; Mathlib's Hilbert-space material.

---

## Dependency graph

```
Layer 0  Euclidean data, continuation, the null-separation obstruction
   |                              (0.4 gives the two accessible classes)
   +---------------------------+
   |                           |
Layer 1  local operators,   Layer 2  quasi-distributions: matching,
   |  moments, mixing,          |  limit order, linear divergences
   |  truncated moments         |
   |                       Layer 3  Ioffe time, ratio, short-distance
   |  (1.1 uses the decay      |  factorisation, good lattice cross sections
   |   proved in 3.1)          |  (3.5 subsumes 2.3 as a corollary)
   +---------------------------+
                               |
                         Layer 4  off-forward, transverse-momentum-dependent,
                               |  distribution amplitudes, the bridge interface
                               |
                         Layer 5  design operator, instability, regularisation,
                                  identifiability, joint data
```

Layers 1 and 2 are independent of each other and rest on Layer 0. Layer 3 rests on Layers 0 and 2
and supplies to Layer 1 the decay statement its moment identity needs. Layer 4 rests on Layers 0
to 3 and produces the interface Layer 5 consumes.

## Acceptance examples

1. The continuation of a nonzero real Euclidean four-vector has strictly negative Minkowski
   square, and no nonzero null vector lies in the image of the Euclidean section.
2. Two matrix elements holomorphic on the analyticity domain that agree on the Euclidean section
   agree at every spacelike separation.
3. The forward matrix element of the local vector current equals the quark number, and the
   quasi-distribution's integral over the momentum fraction equals it at any hadron momentum.
4. The quasi-distribution of a free quark is nonzero at momentum fraction two.
5. There exist two distinct functions on the unit interval with identical first six Mellin moments
   and supremum-norm distance at least a stated positive number.
6. A positive measure on the unit interval is determined by its full Mellin moment sequence.
7. For `n` at least four, the restriction of the spin-`n` symmetric traceless representation to
   the hypercubic group shares an irreducible constituent with that of an operator of lower mass
   dimension.
8. The `z`-dependent renormalisation factor of the straight-link bilinear cancels in the ratio at
   equal `z^2`, and the reduced Ioffe-time distribution of the free theory is identically one.
9. The one-loop kernel of 3.3, inserted into the short-distance factorisation, reproduces the
   leading-order evolution of `CollinearEvolution` through the semigroup generator.
10. The quasi-distribution and the reduced Ioffe-time distribution both satisfy conditions (i) and
    (iii) of 3.5, and a candidate quantity exists satisfying (i) and (iii) but not (ii).
11. The Collins-Soper kernel is a logarithmic derivative in the hadron momentum of a ratio of
    quasi-TMDs in which the soft factor cancels.
12. The design operator of any finite Euclidean dataset has rank at most the number of
    observations, and infinite-dimensional kernel on an infinite-dimensional distribution space.
13. The continuum design operator with a continuous kernel on a compact window is compact and its
    inverse on its range is unbounded.
14. Evaluation at an interior momentum-fraction point is not in the identifiable subspace of any
    finite Euclidean dataset.
15. The identifiable subspace of a joint Euclidean and experimental dataset is the sum of the two
    identifiable subspaces.

## Open questions and conjectures

- Whether every hypercubic-symmetric operator basis has a nonvanishing dangerous mixing
  coefficient for `n` at least four (1.3). The branching statement is proved; the nonvanishing is
  a hypothesis.
- The optimal uniformity statement for the quasi-distribution power correction near the endpoints
  in the momentum fraction (2.4): the largest region and weakest power of `x(1-x)` admitting a
  bound.
- Whether the equivalence of the quasi- and pseudo- extractions persists beyond one loop (3.4).
- Whether condition (ii) of the good-lattice-cross-section criterion follows from (i) together
  with a twist-two leading term under additional hypotheses (3.5).
- The rate at which the identifiable subspace fills out as parameter points are added (4.1 and
  5.4): Layer 5 shows the idealised trivial-kernel statement fails for every finite dataset, but
  the sharp threshold is not determined here.

## References

- K. Osterwalder and R. Schrader, *Axioms for Euclidean Green's functions*, Commun. Math. Phys. 31
  (1973) 83; II, Commun. Math. Phys. 42 (1975) 281.
- R. F. Streater and A. S. Wightman, *PCT, Spin and Statistics, and All That*, Benjamin 1964, Ch. 3.
- B. L. Ioffe, Phys. Lett. B 30 (1969) 123.
- N. Christ, B. Hasslacher and A. H. Mueller, Phys. Rev. D 6 (1972) 3543.
- V. S. Dotsenko and S. N. Vergeles, *Renormalizability of phase factors in non-abelian gauge
  theory*, Nucl. Phys. B 169 (1980) 527.
- M. Baake, B. Gemünden and R. Oedingen, J. Math. Phys. 23 (1982) 944.
- M. Göckeler, R. Horsley, E.-M. Ilgenfritz, H. Perlt, P. Rakow, G. Schierholz and A. Schiller,
  *Lattice operators for moments of the structure functions and their transformation under the
  hypercubic group*, Phys. Rev. D 53 (1996) 2317.
- W. Detmold, W. Melnitchouk and A. W. Thomas, Eur. Phys. J. direct 3 (2001) 13.
- J. C. Collins, *Foundations of Perturbative QCD*, Cambridge University Press 2011, Ch. 6, 7, 13, 14.
- X. Ji, *Parton physics on a Euclidean lattice*, Phys. Rev. Lett. 110 (2013) 262002.
- X. Ji, Sci. China Phys. Mech. Astron. 57 (2014) 1407.
- X. Xiong, X. Ji, J.-H. Zhang and Y. Zhao, Phys. Rev. D 90 (2014) 014051.
- X. Ji, A. Schäfer, X. Xiong and J.-H. Zhang, Phys. Rev. D 92 (2015) 014039.
- X. Ji, P. Sun, X. Xiong and F. Yuan, Phys. Rev. D 91 (2015) 074009.
- A. V. Radyushkin, *Quasi-parton distribution functions, momentum distributions, and
  pseudo-parton distribution functions*, Phys. Rev. D 96 (2017) 034025.
- A. V. Radyushkin, Phys. Lett. B 767 (2017) 314.
- K. Orginos, A. Radyushkin, J. Karpie and S. Zafeiropoulos, Phys. Rev. D 96 (2017) 094503.
- T. Ishikawa, Y.-Q. Ma, J.-W. Qiu and S. Yoshida, Phys. Rev. D 96 (2017) 094019.
- X. Ji, J.-H. Zhang and Y. Zhao, Phys. Rev. Lett. 120 (2018) 112001.
- Y.-Q. Ma and J.-W. Qiu, Phys. Rev. Lett. 120 (2018) 022003; Phys. Rev. D 98 (2018) 074021.
- T. Izubuchi, X. Ji, L. Jin, I. W. Stewart and Y. Zhao, Phys. Rev. D 98 (2018) 056004.
- J. Karpie, K. Orginos and S. Zafeiropoulos, JHEP 11 (2018) 178.
- J. Karpie, K. Orginos, A. Rothkopf and S. Zafeiropoulos, JHEP 04 (2019) 057.
- M. A. Ebert, I. W. Stewart and Y. Zhao, Phys. Rev. D 99 (2019) 034505; JHEP 09 (2019) 037.
- A. V. Radyushkin, Phys. Rev. D 100 (2019) 116011.
- X. Ji, Y. Liu and Y.-S. Liu, Nucl. Phys. B 955 (2020) 115054.
- K. Cichy and M. Constantinou, Adv. High Energy Phys. 2019 (2019) 3036904.
- L. Del Debbio, T. Giani, J. Karpie, K. Orginos, A. Radyushkin and S. Zafeiropoulos, JHEP 02
  (2021) 138.
- X. Ji, Y.-S. Liu, Y. Liu, J.-H. Zhang and Y. Zhao, *Large-momentum effective theory*,
  Rev. Mod. Phys. 93 (2021) 035005.
- V. M. Braun and D. Müller, Eur. Phys. J. C 55 (2008) 349.
- H. W. Engl, M. Hanke and A. Neubauer, *Regularization of Inverse Problems*, Kluwer 1996.
- P. C. Hansen, *Discrete Inverse Problems: Insight and Algorithms*, SIAM 2010.
- J. A. Shohat and J. D. Tamarkin, *The Problem of Moments*, American Mathematical Society 1943.
- R. Abdul Khalek et al., *Science requirements and detector concepts for the Electron-Ion
  Collider: EIC Yellow Report*, Nucl. Phys. A 1026 (2022) 122447, arXiv:2103.05419, Volume II,
  Section 7.6.1.

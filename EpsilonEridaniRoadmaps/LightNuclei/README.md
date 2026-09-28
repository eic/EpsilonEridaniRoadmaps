# Roadmap: light nuclei, short-range correlations, and the nuclear force

Nuclei light enough that individual nucleon configurations matter: the deuteron and the
three-nucleon systems, their structure functions and polarisation observables, the short-range
correlated pairs that dominate the high-momentum part of their wave functions, and the connection
to the nucleon-nucleon interaction. These are the nuclei in which a nuclear effect can be traced
to a specific configuration rather than parameterised in the mass number.

The roadmap develops the theory in two directions that meet. Downward from the observable: a
nuclear structure function is a fold of free nucleon structure functions against a nucleon
momentum distribution, so the nuclear observable determines the distribution only up to the
kernel of that fold, and the extraction of a neutron structure function from deuteron data is an
inverse problem with a quantifiable model dependence. Upward from the interaction: the deuteron
wave function is not an input but the ground state of a two-nucleon Hamiltonian whose potential
has a pion-exchange tail fixed by the pion-nucleon coupling, and the same tensor force that
produces the deuteron's d-wave admixture produces the observed dominance of proton-neutron pairs
at high relative momentum. A roadmap that only went downward would treat the momentum
distribution as a fit function; one that only went upward would never reach a structure function.

The final application is a machine-checked account of what a light-nucleus deep inelastic
measurement determines. Three statements are the targets. First, that spectator tagging converts
the neutron extraction from an inverse problem with a nontrivial kernel into a pointwise
determination, with the residual dependence named rather than assumed away. Second, that the
constancy of the nucleus-to-deuteron cross-section ratio on an interval of the nucleus-normalised
momentum fraction is what makes a pair-count coefficient a well-defined quantity at all, so that
the coefficient is a theorem-bearing object and not a fitted number. Third, that the
factorisation of the nuclear wave function at high relative momentum into a universal pair
function and a nucleus-dependent coefficient is a hypothesis with stated consequences, and that
its empirical support — including the observed correlation with the European Muon Collaboration
effect — is a correlation between measured quantities and not a demonstrated mechanism.

This roadmap also builds the spherical Bessel functions, the Legendre polynomials and the
partial-wave apparatus that the rest of the collection needs, because they are absent from both
Mathlib and TauCeti at the pinned revisions. That construction is Layer 0 and is used by areas
that never touch a nucleus.

## Scope

Included:

- The deuteron as a two-nucleon bound state: quantum numbers, the coupled s-wave and d-wave
  radial system, the tensor operator coupling them, and the d-state probability.
- Tensor polarisation of a spin-one target, the complete spin-one hadronic tensor decomposition,
  and the four tensor structure functions it admits.
- The convolution formula, the light-cone momentum distribution, the off-shell dependence as a
  named object, and the binding correction.
- The neutron structure function extracted from deuteron and proton data, posed as inversion of
  that fold, with the model dependence identified as the kernel of a Fredholm operator.
- Spectator tagging, the tagged structure function, and the sense in which fixing the spectator
  momentum removes the fold.
- Three-nucleon systems: the channel decomposition, the effective neutron polarisation with its
  dilution factors, the extraction of the neutron's polarised structure functions, and mirror
  symmetry with Coulomb and mass-difference breaking as explicit terms.
- Coherent and incoherent channels for a light nucleus, and the interference term that survives
  because the nucleon number is small.
- Short-range correlations: the high-relative-momentum component, the region where the
  nucleon-normalised Bjorken variable exceeds unity, the plateau and the pair-count coefficient it
  defines, proton-neutron dominance, and the contact factorisation.
- The nucleon-nucleon interaction with its central, spin-orbit and tensor components, the
  one-pion-exchange tail, the partial-wave phase shifts, and the bound-state problem whose
  solution is the deuteron wave function.
- Three-nucleon forces as the part of a three-body Hamiltonian not reducible to pairwise terms,
  and the discrepancy whose resolution motivates them.
- Light hypernuclei and nuclei far from stability, and the theorem separating the constructions
  that carry over with a changed baryon label from those that do not.
- Spherical Bessel functions, Legendre polynomials, and the partial-wave expansion, built here
  because they are absent upstream.

Not included. Smooth mass-number-dependent nuclear parton densities, their sum rules and their
evolution belong to `NuclearPartonDistributions`; this roadmap specialises that area's
modification-ratio language to nuclei where the ratio can be attributed to a configuration, and
does not restate it. Propagation of a produced parton or hadron through nuclear matter, energy
loss, and hadronisation-time observables belong to `NuclearMedium`. The free nucleon structure
functions that the fold takes as input belong to `InclusiveStructureFunctions`, and their
polarised counterparts to `SpinStructure`; this roadmap treats them as given data with stated
support and positivity properties. The evolution of any nuclear distribution in the hard scale
belongs to `CollinearEvolution` — this roadmap contains no evolution equation and therefore does
not use the upstream semigroup theory. Coherent diffractive production off a light nucleus, and
the nuclear form factors that control it, belong to `Diffraction`; this roadmap supplies the
Bessel functions that area's form factors need but not the diffractive amplitude. The
exchanged-meson description of the pion cloud belongs to `MesonStructure`. Nucleon electromagnetic
form factors and elastic scattering are not in the collection's scope at all, and this roadmap
treats the deuteron's static quadrupole moment as a functional of the wave function without
developing elastic form factor theory.

Material in this roadmap belongs under `EpsilonEridani/Particles/Nuclei/Light/`, with the
special-function construction of Layer 0 under `EpsilonEridani/Mathematics/SpecialFunctions/`
so that it can be used — and, later, moved upstream — without importing anything nuclear.

## Conventions and coordination with upstream

1. **Nucleon and nuclear masses are explicit parameters, and the heavy-nucleus limit is never
   taken.** A light-nucleus structure function carries the mass number, the nuclear mass, and the
   proton and neutron masses as fields, and no definition in this roadmap is stated only in a
   limit of large mass number. This avoids the trap of importing an asymptotic simplification
   that is legitimate in `NuclearPartonDistributions` and false for the deuteron, where the
   binding energy is a two-thousandth of the mass and the difference between the nuclear mass and
   twice the nucleon mass is the entire effect being computed.

2. **Two momentum fractions, distinguished at every occurrence.** `xN` is the Bjorken variable
   normalised to the nucleon mass and ranges over the unit interval for scattering off a free
   nucleon; `xA` is normalised to the nuclear mass and ranges up to the mass number. The
   conversion between them is a definition with the nuclear-to-nucleon mass ratio appearing
   explicitly, and every structure function signature says which it takes. This avoids the trap
   that makes the short-range correlation region meaningless: "the region where x exceeds one" is
   a statement about `xN` and is empty for `xA`, and a definition that does not say which
   variable it means cannot be read.

3. **The light-cone momentum fraction of a bound nucleon is a third variable**, written `alpha`,
   normalised so that it ranges over the open interval from zero to the mass number and equals
   one for a nucleon carrying its share. It is the integration variable of the fold, not a
   Bjorken variable, and the two are related by a Jacobian that the convolution definition carries
   explicitly. This avoids silently identifying the argument of the momentum distribution with
   the argument of the structure function.

4. **Target spin is data, not a global assumption.** A structure-function type is indexed by the
   target's spin, and the polarised and tensor-polarised observables state both the spin and the
   polarisation direction in their signatures. This avoids the trap of reusing a spin-one-half
   signature for the deuteron and thereby losing the tensor structure functions, which is the
   single most common error in the literature this roadmap formalises.

5. **The four tensor structure functions of a spin-one target follow the Hoodbhoy-Jaffe-Manohar
   normalisation**, with the leading one defined as a fixed linear combination of hadronic tensor
   components at definite target spin projection, and that combination written out in the
   docstring of the definition. Competing conventions in the literature differ by a factor of two
   and by which difference of spin projections is taken; naming the convention once, in the
   definition, is what makes a later sum rule checkable.

6. **Off-shell dependence is carried in a named object and never absorbed.** The convolution
   formula takes a nucleon structure function evaluated off the mass shell, and the departure
   from the on-shell value is a separate function of the invariant mass of the struck nucleon,
   appearing as an argument of the fold. A "binding correction" in this roadmap is by definition
   the difference between the fold and the free sum, with the off-shell function held fixed; it
   is never a fitted residual. This avoids the trap of a correction term that quietly contains an
   off-shell extrapolation and therefore cannot be bounded.

7. **Partial waves are labelled by a structure carrying the total spin, orbital angular momentum
   and total angular momentum as natural numbers, subject to the triangle condition as a field.**
   Spectroscopic strings are used only in docstrings. This avoids the trap in which the deuteron's
   two channels are distinguished by a string literal that a later refactor mistypes.

8. **Radial wave functions are the `r`-weighted ones.** For a channel with radial amplitude `R`,
   the object carried is `u r = r * R r`, and the normalisation condition is that the sum over
   channels of the integral of the square of `u` over the positive half-line is one. The
   weighting is fixed once, here, and no definition later reintroduces a factor of `r` squared.
   This avoids the most frequent factor error in two-body bound-state work.

9. **Spherical Bessel functions are indexed by a natural-number order with a real nonnegative
   argument, and the value at zero is pinned in the defining theorem.** The second-kind family is
   defined on the strictly positive half-line only, because it is singular at the origin, and its
   type reflects that. This avoids the trap of a single family silently extended to negative
   order or to zero argument, where the two kinds behave differently.

10. **A plateau is a statement about an interval, and the interval is data.** The constancy of the
    nucleus-to-deuteron ratio is stated as: there exist a coefficient and an interval of the
    nucleon-normalised momentum fraction, contained in the region above unity, on which the ratio
    equals the coefficient up to a stated bound. The interval endpoints and the bound are fields
    of the statement. This avoids an unquantified "approximately constant", which asserts nothing.

11. **A hypothesis is a `Prop` taken as an argument, never a structure field with a placeholder
    witness.** Where this roadmap states the contact factorisation, the tensor-force explanation
    of pair dominance, or the correlation with the European Muon Collaboration effect, the
    statement is a standalone `Prop`-valued definition, and the results that depend on it take it
    as an explicit hypothesis. A `Prop` field carrying a trivially-inhabited placeholder looks
    like an assumption and asserts nothing; this project's own audit found that pattern hiding
    obligations, and this roadmap does not reintroduce it.

12. **Isospin is `sl2` weight data from upstream, not an ad hoc doublet.** The nucleon is the
    two-dimensional representation, the mirror relation between the three-nucleon systems is a
    statement about weight vectors, and the coupling of two or three nucleon isospins goes through
    the upstream Clebsch-Gordan decomposition rather than through a table of coefficients written
    here. This avoids a second, incompatible angular-momentum vocabulary inside the library.

13. **Every quantity that depends on a nuclear model says so in its type.** The extracted neutron
    structure function of Layer 2 is a function of the assumed momentum distribution, and its
    signature takes that distribution as an argument. A definition that returned "the neutron
    structure function" with no such argument would assert that the extraction is unique, which
    is exactly the statement Layer 2 disproves.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, `.Bounds` and `.AccessMethods` — the
  inclusive kinematic variables, their physical region, and the reconstruction of the variables
  from measured quantities. The tagged kinematics of Layer 2 extends this with the spectator
  momentum rather than redefining it.
- `EpsilonEridani.QFT.Scattering.DIS.Basic` and `.CrossSection` — the deep inelastic cross-section
  and its relation to the structure functions. The nuclear cross-section ratio of Layer 4 is a
  ratio of these.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` and `.Tensors.Longitudinal` — the hadronic
  tensor and its decomposition for a spin-one-half target. The spin-one decomposition of Layer 1
  is built in the same shape, and the theorem that the spin-one-half decomposition is the
  restriction of the spin-one one is an acceptance example.
- `EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic` and `.Polarized.SumRules` — polarised
  structure functions and the sum rules they satisfy. Layer 3's extraction of the neutron's
  polarised structure functions from a polarised helion consumes these.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic`, `.Properties` and `.Mellin` — the
  convolution of a distribution with a kernel, its support and its Mellin transform. The
  light-cone fold of Layer 2 is an instance, and the Mellin representation is what turns the
  fold's inversion into a statement about a multiplier.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Basic` and `.Uniqueness` — the
  existing treatment of when a convolution can be inverted. Layer 2 reuses its uniqueness
  vocabulary for the neutron extraction instead of building a second one.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` and `.Inference.Unfolding` — what
  it means for a parameter to be determined by a set of observables. The statement that tagging
  restores identifiability is phrased with these.
- `EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic` — the existing corrections framework,
  which the binding correction of Layer 2 joins as a further named correction.
- `EpsilonEridani.Numerics.FourMom` — four-momenta, used for the spectator kinematics.
- `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions` and
  `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` — the metric and the
  totally antisymmetric tensor, needed for the spin-one tensor decomposition.
- `EpsilonEridani.Mathematics.KroneckerDelta.BasicExtensions` and
  `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` — index algebra, and positive
  semidefiniteness for the spin density matrix of a spin-one target.
- `EpsilonEridani.Mathematics.Distribution.BasicExtensions` — distributional vocabulary for the
  momentum distribution, which is a measure and not a function in general.
- `EpsilonEridani.QFT.QCD.SU2Generators` and `EpsilonEridani.Mathematics.LieAlgebra.SpecialUnitary`
  — the two-dimensional generators, used for the nucleon isospin doublet.

From TauCeti:

- `TauCeti.Analysis.Fredholm.Basic`, `.Criteria`, `.Adjoint`, `.SelfAdjoint`, `.FiniteRank`,
  `.CompactPerturbation` and `.Index` — the right home for the neutron-extraction inverse problem.
  Non-uniqueness of the extraction is a statement that the kernel of the fold operator is
  nontrivial; the instability of the extraction is a statement about compactness. Neither is
  reproved here.
- `TauCeti.Analysis.PDE.FredholmAlternative` — the alternative in the form Layer 5's inhomogeneous
  radial problem needs.
- `TauCeti.Analysis.PDE.Spectrum` and `TauCeti.Analysis.PDE.DirichletProblem` — the spectral and
  boundary-value formulation of the two-body radial equation on a bounded region, used for the
  bound-state existence statement of Layer 5 before the half-line limit is taken.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and `TauCeti.Analysis.Sobolev.Embedding` — the
  function space in which the radial equation is posed, and the embedding that makes a weak
  solution continuous.
- `TauCeti.Analysis.Matrix.Spectrum` — the spin algebra of a spin-one target and the eigenvalues
  of its density matrix.
- `TauCeti.Algebra.Lie.Sl2.ClebschGordan`, `.Casimir`, `.WeightMultiplicity` and
  `.CompleteReducibility` — the decomposition of a tensor product of spin representations.
  This is the upstream anchor for both the spin and the isospin coupling of two and three
  nucleons, and for the statement that a spin-one target admits a rank-two spin tensor while a
  spin-one-half target does not.
- `TauCeti.LinearAlgebra.SymmetricPower.Basic` and
  `TauCeti.LinearAlgebra.TensorProduct.Decomposition` — the symmetric traceless part of a tensor
  product, which is what the tensor polarisation of a spin-one target is.
- `TauCeti.Analysis.InnerProductSpace.HilbertBasis.Basic` — completeness of the partial-wave
  basis, so that a channel decomposition is a decomposition and not a truncation.
- `TauCeti.Analysis.SpecialFunctions.Hermite.Function.Ladder`, `.Orthonormal`, `.HilbertBasis`
  and `TauCeti.Analysis.SpecialFunctions.Hermite.Orthogonality` — not used for their content, but
  as the shape a special-function family takes upstream: an order-indexed family, a ladder
  relation, orthogonality with respect to a named measure, and completeness in the corresponding
  `L²`. Layer 0 builds the Bessel and Legendre families in exactly this shape.
- `TauCeti.Analysis.SpecialFunctions.Gamma` and `.Beta` — the normalisation constants of the
  Bessel and Legendre families, and the moments of the momentum distribution.
- `TauCeti.Analysis.Asymptotics.Lemmas` — the vocabulary for the large-argument asymptotics of
  Layer 0.
- `TauCeti.Probability.Moments.Basic`, `.Covariance` and `.Determinacy` — the momentum
  distribution's moments, and the question of when its moments determine it, which is the
  sharpest available statement about what an untagged measurement constrains.
- `TauCeti.MeasureTheory.Function.Lp.ApproximateIdentity` — the limit in which the momentum
  distribution concentrates, which is the free-nucleon limit of the fold.
- `TauCeti.MeasureTheory.Constructions.HaarToSphere` — the angular measure for the partial-wave
  integrals.
- `TauCeti.Analysis.PositiveDefinite.Basic` — positivity of the momentum distribution, which is a
  constraint on the fold that a fit must respect.

From Mathlib:

- `Mathlib.Analysis.InnerProductSpace.Spectrum` and `Mathlib.Analysis.InnerProductSpace.Rayleigh`
  — the bound-state problem as a variational characterisation of the lowest eigenvalue, which is
  how Layer 5's existence statement for the deuteron is proved.
- `Mathlib.Analysis.InnerProductSpace.PiL2` — the finite channel space of a coupled radial system.
- `Mathlib.Analysis.Matrix.Spectrum`, `Mathlib.LinearAlgebra.Matrix.Hermitian` and
  `Mathlib.Algebra.Star.Unitary` — the spin density matrix, its hermiticity and the rotations
  acting on it.
- `Mathlib.Analysis.Convolution` — the analytic properties of the fold.
- `Mathlib.Analysis.Distribution.SchwartzSpace` — test functions for the distributional momentum
  distribution.
- `Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic` and
  `Mathlib.Analysis.SpecificLimits.Basic` — the elementary functions and limits Layer 0 needs.

Genuine absences upstream, and what this roadmap does instead:

- ⚠ **Bessel functions are absent from both Mathlib and TauCeti** at the pinned revisions. The
  occurrences of the name in either library are incidental. The partial-wave expansion, the
  free-particle radial solutions, and the asymptotic form that defines a phase shift all need
  them. Layer 0 therefore defines the spherical Bessel functions of both kinds, in the shape the
  upstream Hermite family takes, so that the construction can move upstream unchanged. This
  roadmap does not wait for that to happen, and nothing in it is contingent on it.
- ⚠ **Legendre polynomials and spherical harmonics are likewise absent from both.** Every
  occurrence of the name in TauCeti is the Legendre symbol of number theory. Layer 0 builds the
  Legendre polynomials with their recurrence, orthogonality and completeness, and the spherical
  harmonics only to the extent the partial-wave expansion of a two-body wave function requires.
- ⚠ **Explicit angular-momentum coupling coefficients in a spin basis are absent.** Upstream
  supplies the abstract Clebsch-Gordan decomposition of a tensor product of `sl2`
  representations, which is the correct and more general statement, but not the coefficients in a
  chosen weight basis, and there are no Wigner rotation matrices or three-index symbols under any
  name. Layer 1 builds the coefficients it needs as the matrix of the upstream decomposition
  isomorphism in the weight basis, so that they are derived from the upstream theorem rather than
  tabulated beside it.
- ⚠ **There is no notion of ill-posedness, and no regularisation theory, in TauCeti.** The
  neutron-extraction problem of Layer 2 is therefore stated with the vocabulary that does exist:
  the fold is a bounded operator, its kernel measures non-uniqueness, and compactness of the
  operator is the statement that its inverse is unbounded. No regularisation scheme is defined in
  this roadmap, and no result depends on one.
- ⚠ **There is no theory of singular Sturm-Liouville problems on a half-line.** The two-body
  bound-state problem of Layer 5 is therefore posed first on a bounded interval, using the
  upstream Dirichlet and spectral machinery, and the half-line statement is obtained as a limit
  whose convergence is one of the layer's theorems rather than an assumption.
- ⚠ **EpsilonEridani contains no strangeness and no hyperon.** Layer 5's hypernuclear material
  introduces the hyperon as a new baryon label with its own mass and its own coupling to the
  nucleon, and states explicitly which of this roadmap's constructions are indifferent to the
  label and which are not.
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the light-cone
  invariants and `Physlib.Relativity.LorentzGroup.Boosts.Axis` for the light-cone frame of
  Convention 3.

## Layer 0: spherical Bessel functions, Legendre polynomials, and partial waves

References: Abramowitz and Stegun chapters 8 and 10; Newton, *Scattering Theory of Waves and
Particles*, chapters 11 and 12; the shape of the upstream Hermite function family.

This layer contains no nuclear physics. It exists because the partial-wave expansion is the
language of every later layer and its ingredients are absent upstream. It is written so that it
could be read, and moved, without the rest of this roadmap.

### 0.1 Legendre polynomials

The Legendre polynomials are defined by the three-term recurrence in the degree, with the first
two members given, as a family indexed by a natural number with values in the polynomial ring over
the reals. The theorems to prove are: the recurrence itself as the defining equation; the degree
of each member; the parity relation under negation of the argument; the value at one and at minus
one; the orthogonality relation on the closed interval from minus one to one with respect to
Lebesgue measure, with the explicit normalisation constant; the bound that the absolute value on
that interval never exceeds one; and completeness of the family in the square-integrable functions
on that interval, which is the statement that the associated Hilbert basis spans. The second-kind
associated functions are not built, because no later layer uses them.

The addition theorem is stated in the form needed later: the Legendre polynomial of the cosine of
the angle between two directions expands as a finite sum over the spherical harmonics of the two
directions. This is the only place where the spherical harmonics are needed, and they are defined
only to state it.

### 0.2 Spherical harmonics, to the extent required

The spherical harmonics are defined as the restriction to the unit sphere of a harmonic
homogeneous polynomial of the given degree, using the upstream harmonic-function vocabulary, with
the index ranging over a basis of the space of such polynomials of that degree. The theorems are:
the dimension of the space of degree-`l` spherical harmonics is `2 * l + 1`; orthonormality with
respect to the sphere measure obtained from the upstream Haar construction; and the addition
theorem of 0.1. No phase convention for individual members is fixed, because no later result
depends on one, and fixing a phase that is never used would be a convention with no trap to avoid.

### 0.3 Spherical Bessel functions of the first kind

The spherical Bessel function of order `l` is defined for a real nonnegative argument, as a family
indexed by a natural number. The definition is by the Rayleigh formula — the `l`-th derivative of
the sine-over-argument function with respect to the square of the argument, up to the standard
factor — rather than by the series, because the Rayleigh form makes the recurrence a consequence
of differentiation rather than of a resummation.

The theorems to prove, in order:

- The defining differential equation: each member satisfies the spherical Bessel equation of its
  order on the positive half-line.
- The value at the origin: the order-zero member is one and every higher member vanishes, with the
  leading behaviour proportional to the argument raised to the order, and the coefficient given by
  a double factorial.
- The three-term recurrence in the order, and the two derivative relations that raise and lower
  the order. These are the analogue of the upstream Hermite ladder, and they are stated in the
  same shape.
- The large-argument asymptotics: the member of order `l` is asymptotically the sine of the
  argument shifted by `l` times a right angle, divided by the argument. Stated with the upstream
  asymptotic vocabulary as a statement about the difference decaying faster than the reciprocal
  of the argument.
- Boundedness: each member is bounded on the nonnegative half-line by one, and the bound is
  attained only for order zero.
- The closure relation: the integral over the argument of the product of two members of the same
  order against the square of the argument is a multiple of the delta distribution in the scaled
  variables, stated distributionally against the upstream distributional vocabulary.

### 0.4 Spherical Bessel functions of the second kind, and the Riccati forms

The second-kind family is defined on the strictly positive half-line, with the same recurrence and
with the asymptotic form given by the cosine rather than the sine. The theorems are the recurrence,
the asymptotics, the behaviour at the origin — divergence like the argument raised to minus the
order plus one — and the Wronskian identity relating the two families, whose value is the
reciprocal of the square of the argument and is the statement that the two are independent
solutions.

The Riccati-Bessel functions are the argument times each family, and they are the objects in which
the radial equation of Layer 5 is written, because the equation for them has no first-derivative
term. The theorems are the translation dictionary between the two forms and the second-order
equation the Riccati forms satisfy.

### 0.5 The partial-wave expansion

For a square-integrable function on three-space, the partial-wave decomposition is the
orthogonal decomposition into the subspaces spanned by a radial function times a spherical
harmonic of fixed degree. The theorems are: that the decomposition is orthogonal; that it is
complete, by the upstream Hilbert-basis vocabulary together with 0.2; that the radial components
of a function invariant under rotations vanish except at degree zero; and that the decomposition
commutes with multiplication by a rotation-invariant function. This last is what makes a central
potential act channel by channel and is used at every appearance of a partial wave later.

For a two-body system the decomposition is refined by the spin: the state space is the tensor
product of the orbital space with two spin-one-half factors, and the channel labels are the
triples of total spin, orbital angular momentum and total angular momentum satisfying the
triangle condition. The theorem is that the channels so labelled are orthogonal and complete,
using the upstream Clebsch-Gordan decomposition for the spin factor.

### Examples

- The order-zero and order-one first-kind members written in closed form, with the closed forms
  proved equal to the Rayleigh definition.
- The Legendre polynomials of degrees zero through three in closed form, likewise.
- The partial-wave decomposition of a Gaussian centred at the origin: every component of nonzero
  degree vanishes.
- The two deuteron channels as the two triples with total spin one and total angular momentum one
  admitted by the triangle condition and by parity, namely orbital angular momentum zero and two.

### Dependencies

Mathlib's polynomial and differentiation theory, the inner-product-space material named above, and
the upstream harmonic-function and Haar-measure modules. Nothing in this roadmap, and nothing
nuclear.

---

## Layer 1: the deuteron and the spin-one hadronic tensor

References: Yellow Report §7.3.8 and §7.2.5; Hoodbhoy, Jaffe and Manohar, *Nuclear Physics* B312
(1989) 571; Jaffe and Manohar, *Physics Letters* B223 (1989) 218; Airapetian et al. (HERMES),
*Physical Review Letters* 95 (2005) 242001.

### 1.1 The deuteron as a two-nucleon bound state

The deuteron is introduced as a structure carrying: a mass, a binding energy defined as the
difference between the sum of the free nucleon masses and the mass, the quantum numbers — total
angular momentum one, isospin zero, positive parity — and a wave function given by the two radial
amplitudes of the channels identified in Layer 0's examples. The normalisation condition of
convention 8 is a field.

The theorems of this subsection are the consequences of the quantum numbers that do not require
the interaction. The generalised Pauli principle for two identical nucleons in an isospin-zero
state forces the sum of total spin and orbital angular momentum to be odd, which together with
total angular momentum one and positive parity admits exactly the two channels of Layer 0 and
excludes the total-spin-zero channel. That there is exactly one bound state, and none in the
isospin-one channel, is not a theorem here — it is an input from the interaction, proved in Layer
5, and this layer states it as a hypothesis it carries.

### 1.2 The tensor operator and the d-state probability

The tensor operator on the two-nucleon spin-orbital space is defined as the traceless symmetric
rank-two combination of the relative-position unit vector with the two spin operators, using the
upstream symmetric-power construction. The theorems are: that it is traceless and symmetric; that
it commutes with total angular momentum but not with orbital angular momentum, which is why it
couples the two deuteron channels and is the only operator among those considered that does; and
its matrix elements between the two channels, computed from the upstream Clebsch-Gordan
decomposition.

The d-state probability is defined as the integral of the square of the higher-channel radial
amplitude over the positive half-line, under the normalisation of convention 8, so that it lies
in the unit interval. The theorems are: that it is zero precisely when the tensor coupling
vanishes, which makes it a measure of the tensor force and not a free parameter; and that it is
not an observable, in the precise sense that two wave functions with different d-state
probabilities can reproduce the same asymptotic normalisation and the same quadrupole moment.
That non-observability is a theorem of this layer and is the reason the quantity is defined
relative to a stated potential rather than absolutely.

### 1.3 The spin density matrix of a spin-one target

The spin state of a spin-one target is a positive semidefinite hermitian three-by-three matrix of
unit trace, using the upstream positive-semidefinite and hermitian matrix material. Its
decomposition into a scalar, a vector and a symmetric traceless rank-two part is the statement
that the space of such matrices decomposes under rotations into representations of degree zero,
one and two, which is an instance of the upstream Clebsch-Gordan theorem. The vector part is the
vector polarisation and the rank-two part is the tensor polarisation, defined here once.

The theorems are: that the decomposition is complete and orthogonal; that the tensor part vanishes
identically for a spin-one-half target because the corresponding representation does not occur in
the decomposition of a two-by-two density matrix, which is the structural reason the tensor
structure functions have no spin-one-half analogue; and the bounds on the tensor polarisation
implied by positive semidefiniteness.

### 1.4 The hadronic tensor for spin one and the four tensor structure functions

The hadronic tensor of a spin-one target is decomposed into the complete set of independent
tensors allowed by Lorentz invariance, current conservation, parity and time-reversal, built from
the momentum transfer, the target momentum, the metric, the antisymmetric tensor and the spin
density matrix of 1.3. The coefficients are the structure functions. The theorems are:

- Completeness of the basis of tensors, as a statement that any tensor with the stated symmetry
  properties is a linear combination of them, and independence, as a statement that the
  combination is unique.
- That the terms independent of the spin density matrix reproduce the unpolarised decomposition of
  `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`, and the terms linear in the vector
  polarisation reproduce the polarised decomposition of `.Polarized.Basic`. This is the precise
  sense in which the spin-one decomposition extends the spin-one-half one.
- That the terms linear in the tensor polarisation are four in number, giving the four tensor
  structure functions, with the leading one identified by the combination of convention 5.
- The Callan-Gross-type relation among the tensor structure functions that holds at leading twist,
  stated with its hypotheses, and the sum rule for the leading tensor structure function, whose
  vanishing is equivalent to the absence of a tensor-polarised sea. That sum rule is stated as a
  theorem conditional on the convolution formula of Layer 2, and it is an acceptance example that
  the conditional is discharged there.

### 1.5 The relation between the tensor structure function and the d-state

In the non-relativistic convolution picture the leading tensor structure function is a fold of the
free nucleon structure function against the difference of the momentum distributions in the two
target spin projections, and that difference is proportional to the tensor part of the wave
function. The theorem to prove is that the leading tensor structure function vanishes identically
when the higher-channel radial amplitude vanishes. Its converse — that a measured nonzero value
determines the d-state probability — is false, and the statement of why is the content: the fold
sees only a specific moment of the difference of distributions, and 1.2's non-observability result
applies.

### Examples

- The two-channel deuteron wave function with the higher channel set to zero: the tensor operator
  matrix element vanishes, the d-state probability is zero, and the leading tensor structure
  function vanishes.
- A spin-one target in a pure state of zero spin projection along the axis: the tensor polarisation
  is maximal and the vector polarisation vanishes, so a measurement in this configuration isolates
  the tensor structure functions.
- The spin-one-half specialisation: the tensor structure functions are absent and the
  decomposition of 1.4 reduces to the two existing upstream ones.

### Dependencies

Layer 0 for the channel labels and the partial-wave vocabulary. The upstream hadronic tensor and
polarised structure function modules, the upstream Clebsch-Gordan and symmetric-power material,
and the positive-semidefinite matrix material. `InclusiveStructureFunctions` for the free nucleon
unpolarised structure functions and `SpinStructure` for the polarised ones, taken as given.

---

## Layer 2: the convolution formula, neutron extraction, and spectator tagging

References: Yellow Report §7.3.8 and §7.5.5; Frankfurt and Strikman, *Physics Reports* 76 (1981)
215 and 160 (1988) 235; Melnitchouk, Schreiber and Thomas, *Physics Letters* B335 (1994) 11;
Bissey, Thomas and Afnan, *Physical Review* C64 (2001) 024004; Baillie et al. (CLAS, BONuS),
*Physical Review Letters* 108 (2012) 142001; Cosyn and Weiss, *Physical Review* C102 (2020)
065204.

### 2.1 The light-cone momentum distribution

The light-cone momentum distribution of a nucleon in a light nucleus is defined as a measure on
the open interval from zero to the mass number, in the variable `alpha` of convention 3, obtained
from the wave function by integrating out the transverse momentum and the spectator degrees of
freedom. It is defined for each nucleon species separately. The theorems are: positivity, using
the upstream positive-definiteness material; the normalisation to the number of nucleons of that
species; and the momentum sum rule, that the first moment equals the fraction of the nuclear
light-cone momentum carried by that species, with the sum over species equal to one. These are the
light-nucleus specialisations of the sum rules stated in `NuclearPartonDistributions`, and the
theorem that they agree with that area's general statement is an acceptance example there rather
than a restatement here.

The free-nucleon limit is the statement that the distribution converges to a point mass at
`alpha` equal to one in the limit of vanishing binding, using the upstream approximate-identity
material. Its moments, via the upstream moment material, are the quantities an untagged
measurement constrains, and the determinacy question — whether the moments fix the distribution —
is the sharpest available form of the model-dependence question of 2.3.

### 2.2 The convolution formula and the binding correction

The nuclear structure function is defined as the sum over nucleon species of the fold of the
light-cone momentum distribution against the nucleon structure function, with the nucleon
structure function evaluated at the nucleon-normalised momentum fraction rescaled by `alpha`, and
with the off-shell invariant mass as an additional argument, per convention 6. The fold is an
instance of `EpsilonEridani.QFT.Factorization.Convolution.Basic`.

The theorems are: that the support of the result is contained in the interval from zero to the
mass number in the nucleus-normalised variable, and that it extends above one in the
nucleon-normalised variable, which is the kinematic room the short-range correlation region of
Layer 4 occupies; that the fold reduces to the free sum in the limit of 2.1, so that the
convolution formula is a deformation of the free result and not a separate model; that the
binding correction, defined as the difference between the fold and the free sum at fixed off-shell
function, vanishes in that limit at a rate controlled by the second moment of the distribution;
and the Mellin-space form of the fold, in which it is multiplication, using
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`.

The derivation of the sum rule of 1.4 from this formula is a theorem of this subsection, which
discharges the conditional stated there.

### 2.3 The neutron structure function as an inverse problem

Given the deuteron structure function, the proton structure function and an assumed momentum
distribution, the extracted neutron structure function is defined as the solution of the fold
equation. Its signature takes the assumed distribution as an argument, per convention 13.

The theorems are:

- The fold, as an operator on the square-integrable functions on the unit interval with the
  distribution fixed, is bounded, and its adjoint is the fold against the reflected distribution.
  This is stated with the upstream Fredholm vocabulary.
- The operator is compact, because the distribution is a finite measure; consequently its inverse,
  where it exists, is unbounded. This is the formal content of the statement that the extraction
  amplifies experimental uncertainty, and it is the strongest such statement available without a
  notion of ill-posedness upstream.
- Uniqueness holds precisely when the kernel of the operator is trivial, and the kernel is
  characterised in Mellin space as the set of functions whose Mellin transform is supported where
  the transform of the distribution vanishes. Where the distribution's transform has no zeros in
  the relevant strip the extraction is unique; the existence of a distribution consistent with
  known constraints whose transform does have such a zero is an open question, and this roadmap
  states it as one rather than asserting either uniqueness or its failure.
- The model dependence is defined as the diameter of the set of extracted neutron structure
  functions obtained as the assumed distribution ranges over a stated family. This is a defined
  quantity, not an error estimate, and it is what Layer 2's final subsection shows tagging
  removes.

### 2.4 Spectator tagging

The tagged process is the deep inelastic reaction in which the recoiling nucleon is detected. Its
kinematics is defined by adjoining the spectator four-momentum to the inclusive variables of
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, and the derived variables are the
spectator's light-cone fraction and its transverse momentum. The tagged structure function is a
function of the inclusive variables and those two.

The theorems are:

- The tagged structure function is, in the same approximation as 2.2, the product of the momentum
  distribution evaluated at the measured spectator fraction with the nucleon structure function
  evaluated at the correspondingly rescaled argument and at the off-shell mass determined by the
  measured spectator momentum. There is no integral: this is the precise sense in which tagging
  removes the fold.
- Consequently the ratio of the tagged structure function to its value at a reference spectator
  kinematics determines the nucleon structure function pointwise, with the momentum distribution
  cancelling. The model dependence of 2.3 is zero for this observable, and the residual dependence
  is exactly the off-shell function of convention 6 evaluated at the measured invariant mass —
  which is named, not eliminated.
- The on-shell point, at which the spectator carries no transverse momentum and the fraction takes
  its central value, is where the off-shell dependence vanishes, and the extrapolation to it is a
  limit in a measured variable rather than a model assumption. The statement that the limit exists
  and that the extrapolated value is the free neutron structure function is the theorem this
  subsection exists to prove.
- Final-state interaction between the spectator and the hadronising remnant is a correction to the
  first theorem above, defined as the difference between the tagged structure function and the
  product form. That it vanishes at large spectator transverse momentum is a hypothesis, stated
  as such, with the observable that tests it — the spectator transverse-momentum dependence of
  the extracted ratio — identified.

### 2.5 Coherent and incoherent channels

For a light nucleus the final state is either the nucleus intact or the nucleus broken up, and the
two are distinguishable. The coherent and incoherent contributions to a cross-section are defined
as the terms in which the nuclear final state is the ground state and in which it is not. The
theorems are: that the incoherent sum over final states is, by closure, the fold of 2.2 minus the
coherent term; that the interference between amplitudes for scattering off different nucleons is
suppressed by the inverse of the nucleon number, so that it is negligible for a heavy nucleus and
of leading size for the deuteron; and the explicit interference term for the deuteron, which is
where the coherent-incoherent distinction is a quantitative statement rather than a bookkeeping
one. The diffractive coherent amplitude itself, and the nuclear form factor that multiplies it,
belong to `Diffraction`.

### Examples

- A momentum distribution that is a point mass: the fold is the free sum, the binding correction
  vanishes, the fold operator is the identity, its kernel is trivial and the extraction of 2.3 is
  unique.
- A momentum distribution that is a two-point mixture: the fold operator has finite rank on
  polynomials of bounded degree, its kernel is computed explicitly, and the extraction is not
  unique. This is the minimal witness that the non-uniqueness of 2.3 is not vacuous.
- The tagged structure function at the on-shell point for the deuteron, reproducing the free
  neutron structure function of `InclusiveStructureFunctions`.
- The leading tensor structure function computed from 1.5 through the fold of 2.2, and the sum
  rule of 1.4 discharged.

### Dependencies

Layer 1 for the deuteron wave function and the spin-one structure functions. Layer 0 for nothing
directly; the momentum distribution is built from the wave function of Layer 1, which uses Layer
0. The upstream convolution, deconvolution, Fredholm, moment, approximate-identity and
identifiability modules. `InclusiveStructureFunctions` and `SpinStructure` for the nucleon
structure functions being folded. `NuclearPartonDistributions` for the sum-rule statements this
subsection specialises.

---

## Layer 3: three-nucleon systems and the effective neutron polarisation

References: Yellow Report §7.2.5 and §7.3.8; Friar et al., *Physical Review* C42 (1990) 2310;
Bissey, Thomas and Afnan, *Physical Review* C64 (2001) 024004; Ciofi degli Atti and Scopetta,
*Physics Letters* B404 (1997) 223.

### 3.1 The three-nucleon channel decomposition

The three-nucleon bound state is decomposed into the channels of definite total spin, total
orbital angular momentum and total isospin admitted by the total angular momentum one-half and by
antisymmetry. The theorems are the enumeration of those channels and their orthogonality and
completeness, by the same construction as Layer 0's two-body version applied to a three-fold
tensor product with the upstream Clebsch-Gordan decomposition used twice.

The three dominant channels are named: the fully symmetric spatial state with total orbital
angular momentum zero, the mixed-symmetry state with the same orbital angular momentum, and the
state with total orbital angular momentum two. Their probabilities are defined as the squared
norms of the corresponding components, in the unit interval, summing to one together with the
remaining channels. Antisymmetry of the full state under exchange of any two nucleons is a field
of the structure, and the theorem that it forces the mixed-symmetry spatial component to pair with
the mixed-symmetry spin-isospin component is what makes that channel's probability a meaningful
quantity.

### 3.2 The effective neutron polarisation

For a polarised helion the effective polarisation of a nucleon species is defined as the
expectation of that species' spin projection along the nuclear spin axis, divided by the number of
nucleons of that species. The theorem of this subsection expresses it in terms of the channel
probabilities of 3.1: the fully symmetric channel contributes the full polarisation to the neutron
and none to the protons, and the mixed-symmetry and higher-orbital channels dilute it with
explicitly signed coefficients. Each coefficient is derived from the upstream Clebsch-Gordan
decomposition and is a rational number, not a fit.

The consequence to prove is the inequality that makes helion a neutron target: the neutron's
effective polarisation exceeds the protons' in absolute value by a factor bounded below in terms
of the channel probabilities, and it tends to one as the non-symmetric probabilities tend to zero.
The proton's effective polarisation is small and of opposite sign, and that it is nonzero is the
reason the extraction of 3.3 requires the proton's polarised structure functions as input.

### 3.3 Extraction of the neutron's polarised structure functions

The polarised structure function of a polarised three-nucleon system is, in the same approximation
as Layer 2's fold, the sum over species of the effective polarisation times the fold of that
species' polarised momentum distribution against that species' polarised structure function. The
extracted neutron polarised structure function is defined by inverting this, and its signature
carries the assumed channel probabilities and the assumed distributions.

The theorems are: the extraction formula, with the dilution factors of 3.2 appearing explicitly
as coefficients; that the extraction is unique under the same kernel-triviality condition as 2.3,
so that the inverse-problem analysis is not repeated but instantiated; that the proton
contribution enters with the sign determined in 3.2, so that neglecting it biases the extraction
in a determined direction; and the propagation of the channel-probability uncertainty into the
extracted function, as the diameter of the extracted set over a stated family of probabilities,
in the sense of 2.3.

Spectator tagging applies to the three-nucleon systems as well, with a two-nucleon or two-body
spectator system, and the theorem of 2.4 carries over with the spectator light-cone fraction
replaced by the spectator system's. The statement of which parts of 2.4 are indifferent to the
spectator being a single nucleon is a theorem of this subsection.

### 3.4 Mirror symmetry

The mirror relation between the two three-nucleon systems is stated as: the structure function of
the helion with proton and neutron labels exchanged equals that of the triton, up to terms from
the Coulomb interaction and from the proton-neutron mass difference, each appearing as an explicit
additive term with its own name. The theorems are: that the relation is exact in the limit of
equal masses and vanishing Coulomb interaction, phrased as an isospin statement about the
upstream weight vectors per convention 12; that the breaking terms are of the size of the Coulomb
energy and the mass difference respectively, with the bound made explicit; and the consequence
that the ratio of the two systems' structure functions is a determination of the ratio of the
free nucleon structure functions with the nuclear corrections cancelling to the stated order. The
cancellation is the reason the pair of mirror nuclei is more informative than either alone, and
the precise order to which it holds is the content.

### Examples

- The three-nucleon state with only the fully symmetric channel: the neutron's effective
  polarisation is one, the protons' is zero, and the extraction of 3.3 is the identity on the
  neutron's structure function.
- The channel probabilities set to their commonly used values: the resulting effective
  polarisations, computed, and the inequality of 3.2 checked on that instance.
- The mirror relation with the Coulomb term set to zero and equal nucleon masses: exact equality.
- The tagged three-nucleon process with a deuteron spectator, reducing by 2.4 to a free-neutron
  determination.

### Dependencies

Layer 0 for the channel apparatus, Layer 1 for the two-body vocabulary it generalises, Layer 2 for
the fold, the inverse-problem analysis and the tagging theorem. `SpinStructure` for the nucleon
polarised structure functions. The upstream Clebsch-Gordan material, used twice.

---

## Layer 4: short-range correlations

References: Yellow Report §7.3.7 and §7.5.5; Frankfurt, Strikman, Day and Sargsian, *Physical
Review* C48 (1993) 2451; Egiyan et al. (CLAS), *Physical Review Letters* 96 (2006) 082501; Fomin
et al., *Physical Review Letters* 108 (2012) 092502; Subedi et al., *Science* 320 (2008) 1476;
Schmidt et al. (CLAS), *Nature* 578 (2020) 540; Weiss, Cruz-Torres, Barnea, Piasetzky and Hen,
*Physics Letters* B780 (2018) 211; Hen, Miller, Piasetzky and Weinstein, *Reviews of Modern
Physics* 89 (2017) 045002.

### 4.1 The high-relative-momentum component

For a nuclear wave function, the two-nucleon momentum distribution is defined as the expectation
of the product of two nucleon momentum densities, as a measure on the pair of relative and
total momenta. A short-range correlated pair is not defined as an object but by a region: the
correlated component is the restriction of that distribution to relative momenta above a stated
threshold and total momenta below a stated threshold. Both thresholds are fields of the
definition, per the discipline of convention 10, and no result is stated for an unspecified
"high" momentum.

The theorems are: that the correlated component's weight is a well-defined finite quantity for a
square-integrable wave function; that it is monotone decreasing in the relative-momentum
threshold; and that for the deuteron it is computable from the wave function of Layer 1, which is
what makes the deuteron the reference system for everything in this layer.

### 4.2 The kinematic region and the inclusive ratio

The short-range correlation region is defined in the measured variables: the nucleon-normalised
Bjorken variable of convention 2 exceeding one, with the hard scale above a stated threshold. That
this region is kinematically inaccessible for a free nucleon, and accessible for a nucleus because
of the support statement in 2.2, is a theorem and it is the reason the region isolates the
correlated component.

The inclusive ratio is defined as the cross-section per nucleon for the nucleus divided by that for
the deuteron, both in this region, using
`EpsilonEridani.QFT.Scattering.DIS.CrossSection`. It is a function of the nucleon-normalised
variable and the hard scale.

### 4.3 The plateau and the pair-count coefficient

The plateau statement is the `Prop`: there exist a positive real coefficient, an interval
contained in the region of 4.2, and a bound, such that the ratio of 4.2 differs from the
coefficient by at most the bound throughout the interval, uniformly in the hard scale above its
threshold. The interval and the bound are part of the statement, per convention 10.

The theorem this subsection exists to prove is the conditional one: **if** the plateau statement
holds for a nucleus, **then** the coefficient is uniquely determined by the ratio up to the bound,
and it is independent of the choice of subinterval. Without the plateau, a "pair-count
coefficient" extracted at a point is a value of a function and carries no more information than
the function; with it, the coefficient is a property of the nucleus. That the plateau statement
holds is not a theorem of this roadmap. It is an empirical statement, and the roadmap's treatment
of it is to prove the conditional, to prove that the correlated component of 4.1 implies the
plateau under the factorisation hypothesis of 4.5, and to say plainly that the unconditional
statement is not available.

The consequence, under the plateau, is that the coefficient equals the ratio of the correlated
component's weight in the nucleus to that in the deuteron. This is the bridge between the
observable of 4.2 and the wave-function quantity of 4.1, and it is the layer's central result.

### 4.4 Dominance of proton-neutron pairs

The pair-species decomposition of the correlated component of 4.1 splits it into proton-neutron,
proton-proton and neutron-neutron parts. The dominance statement is the `Prop` that the
proton-neutron part exceeds the like-species parts by a large factor in the region of 4.1, with
the factor and the region as data.

The tensor explanation is stated as a hypothesis: that the dominance follows from the tensor
component of the nucleon-nucleon interaction of Layer 5, because the tensor operator of 1.2 acts
nontrivially only in the total-spin-one channel, and the total-spin-one, isospin-zero channel is
available to a proton-neutron pair and forbidden by antisymmetry to a like-species pair in the
relevant orbital state. The implication from the tensor force to the dominance is what is
hypothesised; the channel-availability statement itself is a theorem, proved from the generalised
Pauli argument of 1.1.

The observable that tests the hypothesis is identified: the dominance factor should decrease
toward unity as the relative momentum increases past the region where the tensor force dominates
the interaction, because the central repulsive core is species-independent. That this behaviour
is predicted by the hypothesis and not by a species-independent mechanism is the theorem that
makes the test a test, and it is stated as such.

### 4.5 The contact factorisation hypothesis

The factorisation hypothesis is the `Prop` that in the region of 4.1 the two-nucleon momentum
distribution of a nucleus equals a nucleus-independent function of the relative momentum,
depending only on the pair species and the pair's spin-isospin channel, multiplied by a
nucleus-dependent and channel-dependent nonnegative coefficient. The coefficients are the
contacts. Both the universal function and the contacts are arguments of the statement.

The theorems, each taking the hypothesis as an explicit argument per convention 11:

- The contacts are determined by the nucleus and the channel, up to the normalisation of the
  universal function, which is fixed by declaring the deuteron's proton-neutron contact in the
  relevant channel to be one.
- Under the hypothesis, the universal function in the total-spin-one, isospin-zero channel equals
  the momentum-space deuteron wave function of Layer 1, squared, in the region of 4.1. This is the
  statement that makes the deuteron the reference system, and it is the sharpest consequence of the
  hypothesis because both sides are independently determined.
- Under the hypothesis, the plateau statement of 4.3 holds, with the coefficient equal to the ratio
  of contacts. This is the implication announced in 4.3.
- Under the hypothesis, the correlated component's contribution to the nuclear structure function
  through the fold of 2.2 is a fold against a universal high-momentum tail with a
  nucleus-dependent coefficient, so that the nuclear modification in the region of 4.2 is
  proportional to the contact. This is what connects this layer to
  `NuclearPartonDistributions`, whose modification ratio is the object being made proportional.

The hypothesis is not proved here and is not provable from the material in this roadmap. It is a
hypothesis about the solutions of a many-body Schrödinger problem, and its status is that it
follows from the short-distance dominance of the interaction under assumptions that are themselves
unproved. This roadmap states it, states its consequences, and says that it is a hypothesis.

### 4.6 The correlation with the European Muon Collaboration effect

The observed correlation is stated as a relation between two measured quantities: the pair-count
coefficient of 4.3 and the slope of the nuclear modification ratio of
`NuclearPartonDistributions` in the valence region, across a set of nuclei. The statement is that
the two are proportional across that set, with the proportionality constant and the nuclear set
as data.

What is a theorem here is only the following: that the correlation is consistent with the
factorisation hypothesis of 4.5, in the sense that the hypothesis implies both quantities are
proportional to the same contact and therefore to each other; and that the converse fails, because
any mechanism in which the modification is controlled by the same high-momentum component would
produce the same correlation. The roadmap therefore records the correlation as a correlation and
records explicitly that it is not a demonstration that short-range correlations cause the
modification. Constructing an observable that distinguishes the causal statement from the
correlational one is an open question, stated as one, and no milestone in this roadmap depends on
its resolution.

### Examples

- The deuteron's own correlated component computed from the Layer 1 wave function, and its
  contact set to one by the normalisation of 4.5.
- A wave function that is a product of single-nucleon factors: the two-nucleon distribution
  factorises, the correlated component's weight is the product of tails, the pair-species
  decomposition is flat, and the dominance statement of 4.4 is false. This is the witness that
  the dominance statement has content.
- A two-nucleon distribution constructed to satisfy the factorisation hypothesis exactly: the
  plateau statement of 4.3 holds and the coefficient is computed.
- The ratio of 4.2 evaluated below the region of 4.2, where the plateau statement is false, so that
  the restriction to the region is not decorative.

### Dependencies

Layer 1 for the deuteron wave function, which is the universal function's reference value. Layer 2
for the fold, the support statement that opens the region, and the cross-section vocabulary. Layer
5 for the tensor component of the interaction, which 4.4's hypothesis refers to — this is the only
backward reference in the roadmap, and it is a reference to a definition, not to a theorem, so the
layer order is not circular. `NuclearPartonDistributions` for the modification ratio of 4.6, taken
as given.

---

## Layer 5: the nucleon-nucleon interaction, three-nucleon forces, and strange systems

References: Yellow Report §7.3.7 and §7.5.6; Machleidt and Entem, *Physics Reports* 503 (2011) 1;
Epelbaum, Hammer and Meißner, *Reviews of Modern Physics* 81 (2009) 1773; Wiringa, Stoks and
Schiavilla, *Physical Review* C51 (1995) 38; Stoks et al., *Physical Review* C48 (1993) 792;
Hammer, Nogga and Schwenk, *Reviews of Modern Physics* 85 (2013) 197; Gal, Hungerford and
Millener, *Reviews of Modern Physics* 88 (2016) 035004.

### 5.1 The interaction as an operator decomposition

The nucleon-nucleon interaction is defined as a hermitian operator on the two-nucleon
spin-orbital-isospin space, decomposed into a finite sum of scalar radial functions multiplying
the operators admitted by invariance: the identity, the spin-spin product, the tensor operator of
1.2, the spin-orbit product, the quadratic spin-orbit operator, and each of these times the
isospin-isospin product. The theorems are: that this list is complete, in the sense that any
operator invariant under rotations, isospin rotations, parity and time reversal, and local in the
relative coordinate, is such a sum; and that the radial functions are then uniquely determined.
Completeness of the operator list is what makes "the" decomposition well posed and prevents a
later component being added silently.

Charge-independence breaking is a separate named term, not absorbed into the isospin-dependent
functions, so that the mirror-symmetry breaking of 3.4 can be traced to it.

### 5.2 The one-pion-exchange tail

The long-range part of the interaction is defined as the one-pion-exchange potential: an explicit
function of the relative distance with a central and a tensor component, whose overall strength is
the pion-nucleon coupling constant and whose range is the reciprocal pion mass. It is stated with
the coupling and the mass as explicit parameters.

The theorems are: that the tensor component's radial function has the stated exponential form
times a polynomial in the reciprocal distance, so that it dominates the central component at
intermediate distance; that the potential is attractive in the total-spin-one, isospin-zero
channel and its sign in the other channels; and the theorem that fixes the roadmap's use of it —
that any interaction reproducing nucleon-nucleon scattering at low energy agrees with this
potential outside a stated radius, up to a bound in terms of the pion mass and that radius. The
short-distance part is not derived here and is a parameterisation with parameters fixed by data,
which the roadmap says plainly.

The connection to `MesonStructure` is this potential's origin as the exchange of the meson whose
structure that area treats; this roadmap takes the coupling and the mass as given parameters and
does not develop the exchange amplitude.

### 5.3 Partial-wave scattering and phase shifts

For a given interaction of 5.1, the radial scattering problem in each channel of Layer 0 is posed
in the Riccati-Bessel form of 0.4, with the asymptotic condition that the solution approaches a
combination of the two free solutions. The phase shift is defined as the parameter of that
combination, and the mixing parameter as the additional datum in a coupled pair of channels.

The theorems are: existence and uniqueness of the scattering solution for a potential with
stated decay, using the upstream Fredholm alternative; that the phase shift is well defined
modulo a half-turn and its value is fixed by the convention that it vanishes at zero energy for a
potential with no bound state in that channel; the low-energy expansion whose first two
coefficients are the scattering length and the effective range, with both defined here; and the
relation between the phase shift and the observable cross-section, so that a phase-shift analysis
of data is a determination of the radial functions of 5.1. That the determination is unique is
false in general, and the statement of what a phase-shift analysis does and does not fix — a
statement about the kernel of the map from potentials to phase shifts — is an open question in
the form needed here and is stated as one.

### 5.4 The bound-state problem and the deuteron derived

The two-body Hamiltonian is the kinetic operator plus an interaction of 5.1, on the coupled
channel space of Layer 0. The bound states are the negative-eigenvalue eigenvectors.

The theorems, in order:

- The Hamiltonian, restricted to a bounded interval with Dirichlet conditions, is self-adjoint
  with discrete spectrum, using the upstream Dirichlet and spectral machinery.
- The lowest eigenvalue is characterised variationally, by Mathlib's Rayleigh quotient material,
  and the existence of a negative eigenvalue is equivalent to the existence of a trial function
  with negative energy. This makes "the deuteron is bound" a checkable statement about the
  potential.
- The bounded-interval eigenvalues and eigenvectors converge as the interval grows, with the limit
  the half-line problem's, for a potential with the decay of 5.2. This is the limit announced in
  the upstream-absence note about Sturm-Liouville theory, and it is a theorem rather than an
  assumption.
- In the total-angular-momentum-one, positive-parity, isospin-zero sector the lowest eigenvector
  has exactly the two channels of 1.1, and the tensor component of 5.1 is nonzero if and only if
  the higher channel's amplitude is nonzero. Layer 1's wave function is thereby derived from the
  interaction rather than posited, and the d-state probability of 1.2 becomes a functional of the
  potential.
- The binding energy and the static quadrupole moment are functionals of the eigenvector, defined
  here, and the quadrupole moment vanishes when the higher channel does. Two potentials with the
  same phase shifts of 5.3 and the same binding energy can give different d-state probabilities:
  this is the sharp form of 1.2's non-observability statement, and it is proved here where the
  potential is available.
- There is no bound state in the isospin-one, total-spin-zero channel for a potential whose
  scattering length in that channel has the measured sign, which discharges the hypothesis 1.1
  carried.

### 5.5 Three-nucleon forces

For three nucleons, the Hamiltonian is the kinetic operator plus the sum of the three pairwise
interactions of 5.1 plus a genuinely three-body term. The three-nucleon force is defined as that
term: the part of the three-body Hamiltonian that does not vanish when any one nucleon is removed
to infinity and is not a sum of two-body operators. The theorems are: that this decomposition is
unique, so that "the three-nucleon force" is well defined relative to a given two-body
interaction; that the three-body term is not determined by two-body data, which is the reason it
is an independent object; and the invariant operator decomposition of the three-body term,
analogous to 5.1 and with its own completeness statement.

The necessity of the term is stated as the discrepancy it resolves: with the three-body term set
to zero, and a two-body interaction fitted to the phase shifts of 5.3, the computed three-nucleon
binding energy differs from the measured one by a stated amount and in a stated direction. That
the discrepancy exists is an empirical statement about solutions of the three-body problem and is
recorded as a hypothesis this roadmap does not prove; what is proved is the conditional, that if
the two-body interaction is fixed by two-body data then the three-body binding energy is a
determined functional, so that a discrepancy is a contradiction and not a tuning.

The longest-range three-nucleon force is the two-pion-exchange term, written explicitly with the
coupling of 5.2 and one further parameter, and the theorem that its form is fixed by the same
pion-nucleon coupling is what ties it to 5.2 rather than leaving it free.

### 5.6 Hypernuclei and systems far from stability

A hypernucleus is introduced by extending the baryon label with a hyperon carrying its own mass
and strangeness, and a hyperon-nucleon interaction with its own decomposition in the manner of
5.1, which includes a channel-coupling term to the two-nucleon system with the same strangeness
because the hyperon and the nucleon-nucleon system can convert.

The theorems separate this roadmap's constructions into two groups, and this separation is the
subsection's purpose:

- Indifferent to the label: the partial-wave apparatus of Layer 0; the channel decomposition and
  the tensor-operator algebra of Layer 1, with the spin content unchanged for a spin-one-half
  hyperon; the fold of Layer 2, whose derivation uses only the light-cone kinematics and the
  existence of a momentum distribution; the definitions of the correlated component and of the
  contacts in Layer 4; the definition of a three-body force in 5.5. Each of these is restated in
  the general-baryon form, and the theorem is that the nucleonic case is the specialisation.
- Not indifferent: the structure functions themselves, because a hyperon contains a strange quark
  and its parton content has a different flavour decomposition, so the free structure functions
  entering the fold are new data and not those of `InclusiveStructureFunctions`; the isospin
  relations of 3.4, because the hyperon's isospin differs and the mirror argument does not carry
  over; and the generalised Pauli arguments of 1.1 and 4.4, because the hyperon is not identical
  to a nucleon and the antisymmetrisation is over a smaller set. The theorem in each case is the
  statement of what replaces the nucleonic result, and where nothing replaces it the roadmap says
  so.

Nuclei far from stability enter as light nuclei with a large neutron-to-proton ratio. The
construction needed is that the momentum distribution of 2.1 is defined per species with
independent normalisations, which it already is, so the theorem is that no new object is required
and the isospin dependence of the correlated component of 4.4 is the observable that the neutron
excess makes accessible.

### Examples

- The one-pion-exchange potential alone in the deuteron channel: a bound state exists for the
  measured coupling, computed by the variational criterion of 5.4.
- A purely central potential: the tensor component vanishes, the higher channel of 5.4's
  eigenvector vanishes, the d-state probability is zero, the quadrupole moment is zero, and the
  dominance hypothesis of 4.4 has no mechanism. This single instance ties four separate statements
  together and is the roadmap's most economical acceptance example.
- A square-well potential: the phase shift of 5.3 in closed form, the scattering length and
  effective range computed, and the bound-state condition explicit.
- A three-body Hamiltonian with the three-body term set to zero: the decomposition of 5.5 is
  trivial, which is the witness that the definition distinguishes the cases.
- A hypernuclear two-body system with the hyperon mass set to the nucleon mass and the
  hyperon-nucleon interaction set to the nucleon-nucleon one: every result of 5.6's first group
  reduces to its nucleonic form.

### Dependencies

Layer 0 for the Riccati-Bessel forms, the channel labels and the partial-wave decomposition.
Layer 1 for the tensor operator and the quantum numbers whose consequences 5.4 discharges. Layer 3
for the three-nucleon channel decomposition that 5.5's Hamiltonian acts on. Layer 4 for the
dominance statement that 5.2's tensor component is hypothesised to explain. The upstream Fredholm,
Dirichlet, spectral and Rayleigh material. `MesonStructure` for the pion whose exchange 5.2 is.

---

## Dependency graph

```
Layer 0  spherical Bessel, Legendre, partial waves
   |         (no nuclear content; used by the rest of the collection)
   v
Layer 1  deuteron bound state, spin-one hadronic tensor, tensor structure functions
   |         <- InclusiveStructureFunctions, SpinStructure (free nucleon input)
   v
Layer 2  convolution formula, neutron extraction, spectator tagging
   |         <- NuclearPartonDistributions (sum-rule language specialised here)
   |
   +------------------+
   |                  |
   v                  v
Layer 3            Layer 4  short-range correlations, plateau, contacts
three-nucleon         |         <- NuclearPartonDistributions (modification ratio, 4.6)
systems               |
   |                  |
   |   4.4 refers to  |  the tensor component defined in 5.1 (a definition, not a theorem)
   |                  |
   +--------+---------+
            |
            v
      Layer 5  NN interaction, phase shifts, bound state derived,
               three-nucleon forces, hypernuclei
                  |
                  +-- 5.4 discharges the hypothesis Layer 1 carries
                  +-- 5.2 <- MesonStructure (pion coupling and mass)
```

Layer 5 closes the loop: Layer 1 posits a wave function and carries the boundedness of the
deuteron as a hypothesis, and 5.4 derives both. Layer 4's reference forward to 5.1 is to the
definition of the tensor component only, so the layers can be built in the order shown.

## Acceptance examples

The roadmap is complete when the following are stated and proved.

1. For a spin-one target, the hadronic tensor decomposition of 1.4 is complete and the
   coefficients are unique, and the terms independent of and linear in the vector polarisation
   coincide with the existing unpolarised and polarised decompositions in
   `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` and `.Polarized.Basic`.
2. A spin-one-half target admits no tensor polarisation, proved from the upstream Clebsch-Gordan
   decomposition of a two-by-two density matrix, so the four tensor structure functions have no
   spin-one-half analogue.
3. The sum rule of 1.4 for the leading tensor structure function, derived from the convolution
   formula of 2.2, with the hypotheses of the derivation stated.
4. The fold operator of 2.3 is compact, and for the explicit two-point momentum distribution its
   kernel is nontrivial and is computed, so the non-uniqueness of the untagged neutron extraction
   is witnessed rather than asserted.
5. The tagged structure function of 2.4 equals a product with no integral, and the extrapolation
   to the on-shell point yields the free neutron structure function of
   `InclusiveStructureFunctions`, with the residual dependence exactly the named off-shell
   function.
6. The effective neutron polarisation in a polarised helion is expressed in the channel
   probabilities of 3.1 with rational coefficients derived from the upstream Clebsch-Gordan
   decomposition, and the inequality of 3.2 holds.
7. The mirror relation of 3.4 is exact for equal nucleon masses and vanishing Coulomb interaction,
   and the breaking terms are bounded by the Coulomb energy and the mass difference.
8. Conditional on the plateau statement of 4.3, the pair-count coefficient is unique and
   subinterval-independent; and for a wave function satisfying the factorisation hypothesis of 4.5
   exactly, the plateau statement holds with the coefficient equal to the ratio of contacts.
9. For a product wave function the pair-species decomposition of 4.4 is flat, so the dominance
   statement is not vacuous; and the channel-availability theorem underlying the tensor hypothesis
   is proved from the generalised Pauli argument of 1.1.
10. Under the factorisation hypothesis, the universal function in the total-spin-one, isospin-zero
    channel equals the squared momentum-space deuteron wave function of Layer 1 in the region of
    4.1.
11. The operator decomposition of 5.1 is complete and its radial functions are unique.
12. A potential consisting of the one-pion-exchange tail of 5.2 alone has a bound state in the
    deuteron channel, by the variational criterion of 5.4.
13. For a purely central potential, the higher channel of 5.4's eigenvector vanishes, the d-state
    probability is zero and the quadrupole moment is zero.
14. Two potentials with equal phase shifts and equal binding energy but different d-state
    probabilities exist, so the d-state probability is not an observable.
15. The decomposition of a three-body Hamiltonian into pairwise and genuinely three-body parts is
    unique, and the three-body part is not determined by two-body data.
16. Every result of 5.6's first group, restated for a general baryon label, specialises to its
    nucleonic form when the hyperon parameters are set to the nucleon's.
17. The spherical Bessel family of 0.3 satisfies its differential equation, its recurrence, its
    value at the origin and its large-argument asymptotics; the Legendre family of 0.1 satisfies
    its recurrence, orthogonality and completeness; and the partial-wave decomposition of 0.5 is
    orthogonal and complete.

## References

- R. Abdul Khalek et al., *Science Requirements and Detector Concepts for the Electron-Ion
  Collider: EIC Yellow Report*, Nuclear Physics A 1026 (2022) 122447, arXiv:2103.05419. Volume II
  Chapter 7, sections 7.2.5 (light polarised nuclei), 7.3.7 (short-range correlations and the
  origin of the nuclear force), 7.3.8 (structure of light nuclei), 7.5.5 (the EIC and nuclear
  structure physics) and 7.5.6 (exotic nuclei).
- P. Hoodbhoy, R. L. Jaffe and A. Manohar, *Novel effects in deep inelastic scattering from
  spin-one hadrons*, Nuclear Physics B312 (1989) 571. The four tensor structure functions and the
  normalisation of convention 5.
- R. L. Jaffe and A. Manohar, *Nuclear gluonometry*, Physics Letters B223 (1989) 218.
- A. Airapetian et al. (HERMES), *First measurement of the tensor structure function b1 of the
  deuteron*, Physical Review Letters 95 (2005) 242001.
- L. L. Frankfurt and M. I. Strikman, *High-energy phenomena, short-range nuclear structure and
  QCD*, Physics Reports 76 (1981) 215; and *Hard nuclear processes and microscopic nuclear
  structure*, Physics Reports 160 (1988) 235. The light-cone momentum distribution and the
  convolution formula.
- W. Melnitchouk, A. W. Schreiber and A. W. Thomas, *Relativistic deuteron structure function*,
  Physics Letters B335 (1994) 11. Off-shell dependence in the fold.
- F. Bissey, A. W. Thomas and I. R. Afnan, *Structure functions for the three-nucleon system*,
  Physical Review C64 (2001) 024004.
- J. L. Friar et al., *Neutron polarization in polarized 3He targets*, Physical Review C42 (1990)
  2310. The effective neutron polarisation and the dilution factors.
- C. Ciofi degli Atti and S. Scopetta, *On the extraction of the neutron structure function from
  3He data*, Physics Letters B404 (1997) 223.
- W. Cosyn and C. Weiss, *Polarized electron-deuteron deep-inelastic scattering with spectator
  nucleon tagging*, Physical Review C102 (2020) 065204. The tagged structure function of 2.4.
- N. Baillie et al. (CLAS, BONuS), *Measurement of the neutron F2 structure function via spectator
  tagging with CLAS*, Physical Review Letters 108 (2012) 142001.
- L. L. Frankfurt, M. I. Strikman, D. B. Day and M. Sargsian, *Evidence for short-range
  correlations from high Q² (e,e′) reactions*, Physical Review C48 (1993) 2451. The plateau.
- K. S. Egiyan et al. (CLAS), *Measurement of two- and three-nucleon short-range correlation
  probabilities in nuclei*, Physical Review Letters 96 (2006) 082501.
- N. Fomin et al., *New measurements of high-momentum nucleons and short-range structures in
  nuclei*, Physical Review Letters 108 (2012) 092502.
- R. Subedi et al., *Probing cold dense nuclear matter*, Science 320 (2008) 1476. Proton-neutron
  pair dominance.
- A. Schmidt et al. (CLAS), *Probing the core of the strong nuclear interaction*, Nature 578 (2020)
  540. The species dependence at higher relative momentum, which is the test named in 4.4.
- R. Weiss, R. Cruz-Torres, N. Barnea, E. Piasetzky and O. Hen, *The nuclear contacts and short
  range correlations in nuclei*, Physics Letters B780 (2018) 211. The factorisation hypothesis of
  4.5 and the contacts.
- O. Hen, G. A. Miller, E. Piasetzky and L. B. Weinstein, *Nucleon-nucleon correlations,
  short-lived excitations, and the quarks within*, Reviews of Modern Physics 89 (2017) 045002.
- L. B. Weinstein et al., *Short range correlations and the EMC effect*, Physical Review Letters
  106 (2011) 052301; and O. Hen, E. Piasetzky and L. B. Weinstein, *New data strengthen the
  connection between short range correlations and the EMC effect*, Physical Review C85 (2012)
  047301. The correlation of 4.6.
- R. Machleidt and D. R. Entem, *Chiral effective field theory and nuclear forces*, Physics
  Reports 503 (2011) 1.
- E. Epelbaum, H.-W. Hammer and U.-G. Meißner, *Modern theory of nuclear forces*, Reviews of
  Modern Physics 81 (2009) 1773.
- R. B. Wiringa, V. G. J. Stoks and R. Schiavilla, *Accurate nucleon-nucleon potential with
  charge-independence breaking*, Physical Review C51 (1995) 38. The operator decomposition of 5.1.
- V. G. J. Stoks, R. A. M. Klomp, M. C. M. Rentmeester and J. J. de Swart, *Partial-wave analysis
  of all nucleon-nucleon scattering data below 350 MeV*, Physical Review C48 (1993) 792.
- H.-W. Hammer, A. Nogga and A. Schwenk, *Three-body forces: from cold atoms to nuclei*, Reviews
  of Modern Physics 85 (2013) 197.
- A. Gal, E. V. Hungerford and D. J. Millener, *Strangeness in nuclear physics*, Reviews of Modern
  Physics 88 (2016) 035004. The hyperon-nucleon interaction of 5.6.
- R. G. Newton, *Scattering Theory of Waves and Particles*, second edition, Springer 1982.
  Chapters 11 and 12 for the partial-wave and phase-shift material of 5.3.
- M. Abramowitz and I. A. Stegun, *Handbook of Mathematical Functions*, chapters 8 and 10. The
  recurrences, asymptotics and orthogonality relations of Layer 0.


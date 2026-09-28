# Roadmap: multi-parton correlations and higher twist

Correlations between two or more partons in a hadron, and the power-suppressed contributions to
inclusive and semi-inclusive observables that they produce. Two distinct objects share this
roadmap because they share their operator content: the twist-three and twist-four correlators that
give `1/Q²`-suppressed terms in single-hadron observables, and the double parton distributions
that describe two partons probed at once. In both cases the matrix element involves more than one
parton field on the light cone at once, the object depends on more than one momentum fraction, and
the evolution equation is not a DGLAP equation.

The roadmap develops the operator side of this subject completely: twist as a grading on
light-cone operators, the complete twist-three quark-gluon-quark basis with the relations that
reduce it, the twist-three collinear functions and their moment structure, the renormalisation
group of multi-parton operators, the power corrections to `F₂` and `F_L`, the transverse
single-spin asymmetries that are intrinsically power corrections, and the double parton
distributions with their sum rules and inhomogeneous evolution. The final application is a
certified statement of what a power-suppressed measurement measures: given a structure function
measured at finite `Q`, which operator matrix elements enter at which order in `M/Q`, with which
hypotheses, and in which subtraction scheme.

Two things make this area harder to formalise than leading twist, and both are treated as
first-class content rather than as obstacles. First, the objects depend on two momentum fractions,
so the convolution algebra of `CollinearEvolution` does not apply unchanged: the evolution kernels
are integral operators on a two-dimensional domain and are not diagonal in the fractions, so
"solve the evolution equation" is a statement about a generator on a function space and not about
a multiplicative renormalisation. Second, a power correction is defined only relative to a
prescription for the leading-twist term it corrects, because the leading-twist coefficient
functions have infrared renormalons. The roadmap therefore carries the subtraction scheme as
explicit data on every power-correction statement, and proves the statements that are
scheme-independent as such.

Leading-twist densities are elsewhere: collinear ones in `InclusiveStructureFunctions` and
`SpinStructure`, transverse-momentum-dependent ones in `TransverseMomentumDistributions`. This
roadmap owns everything beyond leading twist.

## Scope

Included:

- Twist as a grading: the light-cone good/bad decomposition of the quark and gluon fields,
  operator twist as dimension minus Lorentz spin, and the theorem relating the twist of an
  operator to the power of `M/Q` its matrix element contributes to an inclusive structure
  function.
- The complete classification of forward quark-gluon-quark correlators at twist three, for an
  unpolarised, a longitudinally polarised and a transversely polarised nucleon, with the discrete
  symmetries that reduce the list to an independent set.
- The equations of motion as relations among the twist-three correlators, derived from the Dirac
  operator, and the Lorentz-invariance relations, with an explicit account of which of them
  survive a transverse-momentum cutoff.
- The twist-three collinear functions `g_T`, `h_L` and `e`, their Wandzura-Wilczek parts, the
  Burkhardt-Cottingham sum rule, and the moment structure of each.
- The Efremov-Teryaev-Qiu-Sterman correlator, its symmetry in the two momentum fractions, its
  soft-gluon-pole limit, and its relation to the first transverse moment of the Sivers function.
- Renormalisation and evolution of the twist-three correlators: the mixing of the three-parton
  operators, the two-variable evolution kernel, the well-posedness of the evolution as a semigroup
  problem, and the closed forms available in the large-`N_c` limit and in the conformal operator
  basis.
- Power corrections to inclusive structure functions: the `1/Q²` terms in `F₂` and `F_L` expressed
  through twist-four matrix elements, the twist-four matrix elements defined by those expressions
  together with a stated subtraction scheme, and the separation of target-mass corrections from
  dynamical higher twist by way of the Nachtmann variable and Nachtmann moments.
- Transverse single-spin asymmetries as power corrections: the theorem that a single-transverse-spin
  asymmetry vanishes in collinear factorisation with massless quarks at Born level, and the
  collinear twist-three factorisation formula with its derivative term.
- Double parton distributions: the operator definition with two light-cone separations and a
  transverse separation, the colour and spin channel decomposition, the support region, the
  positivity bounds, the number and momentum sum rules, the inhomogeneous evolution equation, the
  pocket formula, and the double-counting subtraction between double and single parton scattering.

Not included. Leading-twist collinear distributions, their DGLAP evolution and the leading-twist
structure functions themselves belong to `InclusiveStructureFunctions`, `SpinStructure` and
`CollinearEvolution`; this roadmap takes the leading-twist functions `f₁`, `g₁` and `h₁` and the
splitting kernels from there and never redefines them. Transverse-momentum-dependent functions,
their rapidity divergences and Collins-Soper evolution belong to
`TransverseMomentumDistributions`; this roadmap takes the TMD definitions and their transverse
moments from there, and supplies in return the twist-three collinear correlators that the
transverse-moment relations terminate on. Off-forward twist-three operators — twist-three
generalised parton distributions and the twist-three amplitudes of deeply virtual Compton
scattering — belong to `GeneralizedPartonDistributions`, which takes the twist grading and the
equation-of-motion machinery from Layers 0 and 1 here. Twist-three fragmentation functions and
their universality belong to `Hadronization`; the twist counting and the analogous
equation-of-motion structure are supplied here, the fragmentation matrix elements are defined
there. The resummation of multi-parton operators at small `x` into Wilson-line correlators, where
higher twist is not power-suppressed, belongs to `SmallXAndSaturation`. Power corrections to event
shapes and to the extraction of the strong coupling belong to `JetsAndEventShapes`. Nuclear
enhancement of higher-twist effects, transport coefficients and medium-induced power corrections
belong to `NuclearPartonDistributions` and `NuclearMedium`. Lattice determinations of
higher-twist and double-parton matrix elements belong to `LatticeBridge`. Electromagnetic
radiative corrections, which also modify a structure function at the percent level but are not
power corrections in `1/Q²`, belong to `RadiativeCorrections`. Twist-four matrix elements of the
energy-momentum tensor and their relation to the hadron mass decomposition belong to
`HadronMassAndEnergyMomentumTensor`.

Material developed by this roadmap belongs under `EpsilonEridani/Particles/Parton/HigherTwist/`
for the twist grading and the twist-three and twist-four correlators, under
`EpsilonEridani/Particles/Parton/DoubleParton/` for the double parton distributions, and under
`EpsilonEridani/QFT/Scattering/DIS/Corrections/` — which already exists as
`EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic` — for the observable-side power
corrections and the target-mass corrections.

## Conventions and coordination with upstream

1. **Twist means operator twist.** For a local or light-cone operator of mass dimension `d` and
   Lorentz spin `j`, twist is `t = d − j`, and every object defined here records its twist in its
   name and its docstring. The power counting in `M/Q` is a separate piece of data, carried by the
   power-correction statements of Layer 4, and the agreement of the two is a theorem (0.3), not a
   definition. *Trap:* the literature uses "twist three" both for the operator grading and for the
   `1/Q` power, and for some objects — notably the transverse-momentum-dependent functions of
   `TransverseMomentumDistributions` — the two differ. Keeping them as separate data is what makes
   the relations between this roadmap and that one statable.
2. **A fixed light-cone basis.** Two light-like vectors `n` and `n̄` with `n·n̄ = 1`, fixed once,
   with the transverse projector and the transverse Levi-Civita symbol defined from them. All
   light-cone components, all good/bad projections and all gauge-link paths refer to this basis.
   *Trap:* the normalisation `n·n̄ = 2` is equally common and changes every light-cone component by
   a power of `√2`; a mixed convention makes the equation-of-motion relations off by factors of two.
3. **Gauge links are explicit data in every definition.** A multi-parton correlator is defined with
   its link path recorded as data: the direction of each staple, whether it runs to `+∞` or `−∞`,
   and the colour representation it is taken in. No definition in this roadmap omits a link, and no
   milestone depends on one being omitted. *Trap:* the process dependence of the sign of the
   Efremov-Teryaev-Qiu-Sterman correlator relative to the Sivers function is exactly a statement
   about link direction; with the link suppressed the statement cannot even be posed.
4. **Two-fraction argument order is fixed once.** A quark-gluon-quark correlator is written
   `F(x₁, x₂)` with `x₁` the fraction carried by the quark field standing to the left in the
   operator and `x₂` the fraction of the quark field to the right, so that the gluon carries
   `x₁ − x₂`; a double parton distribution is written `F(x₁, x₂, y)` with `x₁` and `x₂` the
   fractions of the two independent partons. The support region is stated with every definition:
   the twist-three correlators live on a region of the square `[−1,1]²` cut out by the spectral
   condition, the double distributions on the ordered simplex `x₁ + x₂ ≤ 1`. *Trap:* the
   soft-gluon-pole value `F(x, x)`, which is the object that enters a single-spin asymmetry, is
   only meaningful once the argument order and the support are fixed; the two common orderings
   differ by the sign of the gluon momentum.
5. **`DoubleDistribution` never means a double parton distribution.**
   `EpsilonEridani.Particles.Parton.GPD.DoubleDistribution` is the Radyushkin double distribution
   of a generalised parton distribution — a spectral representation in one momentum fraction and
   one skewness variable. It is an unrelated object, owned by `GeneralizedPartonDistributions`. The
   objects of Layer 6 are named `DoublePartonDistribution` throughout, never abbreviated to
   `DoubleDistribution`. *Trap:* the two names collide in informal speech and the two objects have
   the same arity, so a lemma proved about one would typecheck against the other's variables.
6. **Transverse spin and the Levi-Civita sign.** The nucleon spin vector is normalised to `S² = −1`
   with `S·P = 0`, the transverse spin vector `S_T` is its transverse part in the basis of
   Convention 2, and the four-dimensional Levi-Civita symbol is fixed by `ε⁰¹²³ = +1`, with the
   transverse symbol `ε_T^{ij} = ε^{ij−+}` derived from it. *Trap:* the overall sign of every
   single-spin asymmetry, and of the relation between the Efremov-Teryaev-Qiu-Sterman correlator
   and the Sivers function, tracks this choice; a roadmap that leaves it implicit cannot state a
   sign at all.
7. **A power correction carries its subtraction scheme.** Every statement of the form "the `1/Q²`
   term in `F₂` is such-and-such a matrix element" is stated for an explicit prescription defining
   the leading-twist term it is a correction to: the renormalisation scheme, the factorisation
   scheme, and the treatment of the infrared renormalons of the leading-twist coefficient
   functions. The prescription is a field of the power-correction structure, not an ambient
   assumption. *Trap:* an unqualified "twist-four matrix element" is not a well-defined number; it
   is ambiguous by an amount of the same order as itself.
8. **Target-mass corrections are not part of the higher-twist bookkeeping.** Corrections of order
   `M²/Q²` arising from the trace terms of the twist-two operators are carried by the Nachtmann
   variable and by Nachtmann moments, and are separated from dynamical higher twist by the operator
   they come from. Every power-correction statement records whether its leading-twist part has been
   target-mass resummed. *Trap:* the two effects are the same order in `1/Q²` and the same sign in
   much of the kinematic range, so an unlabelled `1/Q²` coefficient double counts.
9. **Quark masses are explicit.** No definition or theorem in this roadmap takes a massless-quark
   limit silently. The mass terms in the equation-of-motion relations are written out, and the
   vanishing theorem of 5.1 has the massless hypothesis as a named hypothesis. *Trap:* the
   chirality-flip argument behind the vanishing of a leading-twist single-spin asymmetry is exactly
   a statement about massless quarks; with the mass term dropped from the definitions the theorem
   becomes unfalsifiable.
10. **Every evolution equation is a semigroup statement.** An evolution statement in this roadmap
    names a Banach space of functions on the relevant domain, an operator on it, and a solution of
    the abstract Cauchy problem for that operator, and it uses TauCeti's semigroup theory for
    existence and uniqueness. No evolution equation is posed as an elliptic boundary-value problem.
    *Trap:* TauCeti's PDE hierarchy — `TauCeti.Analysis.PDE.DirichletProblem`,
    `TauCeti.Analysis.PDE.Ellipticity.Basic`, `TauCeti.Analysis.PDE.Caccioppoli.Basic` — is
    elliptic theory and does not apply here; reproving existence
    and uniqueness by hand for each of the several evolution equations in this roadmap would be
    both wasted work and a divergence from upstream's vocabulary.
11. **Flavour is explicit data.** Quark flavour is a parameter of every correlator, and a sum rule
    that sums over flavour does so over the explicit flavour type, with the flavour Kronecker
    deltas of `EpsilonEridani.Mathematics.KroneckerDelta.BasicExtensions`. *Trap:* the double
    parton number sum rule has a `δ_{a₁ ā₂} − δ_{a₁ a₂}` structure that is invisible if flavour is
    implicit, and the sum rule is false without it.
12. **Unproved statements are named in prose, never encoded as fields.** No structure in this
    roadmap carries a `Prop`-valued field discharged by a placeholder witness. Where a statement is
    a hypothesis, a conjecture or an open problem, it is labelled as such in the layer text and
    appears as a `sorry`-ed target in `Suggested.lean` or not at all.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `EpsilonEridani.Particles.Parton.Basic` and `EpsilonEridani.Particles.Parton.PDF.Basic` for the
  parton type, flavour, and the leading-twist collinear density that the twist expansion corrects.
- `EpsilonEridani.Particles.Parton.PDF.Positivity` and
  `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` for the shape of a positivity statement
  about a parton density, which Layer 6 follows for the double distributions, and for the warning
  that positivity of a renormalised density is scheme-dependent.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` for the positive-semidefinite
  spin-density matrices that the double-parton positivity bounds of 6.2 are read off from.
- `EpsilonEridani.Particles.Parton.TMD.Basic`, `.Reduction` and `.PowerCorrections` for the
  transverse-momentum-dependent functions whose transverse moments the relations of 2.5 connect to
  the correlators defined here, and for the existing treatment of power corrections on the
  transverse-momentum side.
- `EpsilonEridani.Particles.Parton.TMD.CollinsSoper` for the rapidity-evolution vocabulary, which
  Layer 3 does not reuse — the twist-three collinear evolution is a different equation — but whose
  treatment of a scale as explicit data Layer 3 follows.
- `EpsilonEridani.Particles.Parton.Unified.Basic` and `.Consistency` for the existing statement of
  how distributions of different arity are required to agree in overlapping limits; the
  transverse-moment relations of 2.5 and the reduction statements of 6.1 are consistency
  statements of that kind.
- `EpsilonEridani.QFT.Factorization.Basic` and `EpsilonEridani.QFT.Factorization.Scales.Basic` for
  factorisation as a statement with explicit scales, and for the scale data that Convention 7
  extends with a subtraction prescription.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic`, `.Collinear`, `.Properties` and `.Mellin`
  for the one-variable convolution algebra and its Mellin transform. Layer 3 builds the
  two-variable integral operators it needs on top of this, and 3.5 uses the Mellin transform for
  the moments of the twist-three kernels.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.CollinearForm`, `.MomentSpace`, `.QCDCore`,
  `.Solutions` and `.Consistency` for DGLAP evolution and its solution, which is the homogeneous
  part of the double-parton evolution of 6.4 and the diagonal part of the twist-three evolution of
  Layer 3.
- `EpsilonEridani.QFT.Factorization.HigherOrder.Basic` for the perturbative order as explicit data
  on a coefficient function, which every power-correction statement of Layer 4 carries.
- `EpsilonEridani.QFT.Factorization.DIS.HardKernel`, `.DiagrammaticHardKernel` and `.LO` for the
  hard kernels that the twist-three factorisation formula of 5.2 convolutes the correlators with.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, `.AccessMethods` and `.Bounds` for the
  kinematic variables and the physical region, and `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`
  and `.Longitudinal` for the hadronic tensor decomposition whose power-suppressed terms Layer 4
  computes.
- `EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic` as the existing home for corrections to the
  inclusive cross section, which Layer 4 extends with the twist expansion and target-mass
  resummation.
- `EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic` and `.SumRules` for the polarised structure
  functions `g₁` and `g₂` and the existing sum-rule vocabulary; the Burkhardt-Cottingham sum rule
  of 2.3 is stated in that shape.
- `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`, `.Asymmetries.Basic` and `.Asymmetries.Harmonics`
  for the semi-inclusive asymmetries and their azimuthal harmonics, which is where the twist-three
  single-spin asymmetries of Layer 5 are observed.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Basic` and `.Identifiability` for the existing
  formulation of what a measurement determines, which 4.5 uses for the identifiability of
  twist-four matrix elements.
- `EpsilonEridani.Mathematics.OrderedSimplexIntegral` for integration over the ordered simplex,
  which is the support region of the double parton distributions and the domain of their sum-rule
  integrals.
- `EpsilonEridani.Mathematics.Distribution.BasicExtensions` for the distributional objects the
  correlators are — a correlator with a soft-gluon pole is not a function — and for the
  distributional products that appear in the equation-of-motion relations.
- `EpsilonEridani.Relativity.CliffordAlgebraExtensions`,
  `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` and
  `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.LeviCivita` for the Dirac structures, the
  traces and the epsilon-tensor contractions that the twist-three decompositions and the vanishing
  theorem of 5.1 are computations in.
- `EpsilonEridani.Relativity.Fermions.Weyl.LeftHandedExtensions` and `.RightHandedExtensions` for
  the chirality decomposition that makes the chiral-odd character of `h_L` and `e`, and the
  chirality-flip step of 5.1, statements rather than remarks.
- `EpsilonEridani.QFT.QCD.SUNGenerators`, `EpsilonEridani.QFT.QCD.RepresentationColor` and
  `EpsilonEridani.Mathematics.LieAlgebra.Casimir` for the colour algebra: the colour factor of the
  quark-gluon-quark correlators, and the colour-channel decomposition of the double parton
  distributions in 6.1.
- `EpsilonEridani.QFT.PerturbationTheory.WickAlgebra.NormalOrder.BasicExtensions` for normal
  ordering of the multi-field operator products the correlators are matrix elements of.
- `EpsilonEridani.QFT.QCD.Renormalization` and `EpsilonEridani.QFT.QCD.OneLoopCounterterms` for the
  renormalisation vocabulary that 3.1 extends from a single operator to a mixing family.

From TauCeti:

- `TauCeti.Analysis.Semigroups.Defs`, `.Generator.Basic`, `.Generator.Closed`,
  `.CauchyProblem.Basic` and `.CauchyProblem.Uniqueness` for every evolution equation in this
  roadmap: the twist-three two-variable evolution of 3.3 and the inhomogeneous double-parton
  evolution of 6.4 are abstract Cauchy problems, and neither reproves existence or uniqueness.
- `TauCeti.Analysis.Semigroups.BoundedGenerator.Perturbation` for the inhomogeneous term of the
  double-parton evolution treated as a perturbation of the homogeneous generator, and
  `TauCeti.Analysis.Semigroups.Dissipative.Basic` for the dissipativity estimates that make the
  generators of 3.3 generate.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, `.Local` and `.Limit` for the weak derivatives the
  equation-of-motion relations of 1.4 and the derivative term of 5.3 are stated with; the
  derivative of a correlator at the soft-gluon pole is not a classical derivative.
- `TauCeti.Analysis.Sobolev.Leibniz` for the product rule the equation-of-motion manipulations
  need in the weak sense.
- `TauCeti.Analysis.Fredholm.Basic`, `.Criteria`, `.FiniteRank` and `.CompactPerturbation` for the
  inverse problem of 4.5: whether twist-four matrix elements are determined by structure-function
  data is a statement about the kernel of a Fredholm operator, and the ill-conditioning is a
  statement about compactness.
- `TauCeti.Probability.Moments.Basic` and `.VanishingMoments` for the moment vocabulary of the
  double-parton sum rules of 6.3 and for the moment structure of 2.3.
- `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` and `.Uniqueness` for the spectral
  representations used in 4.4 when a power correction is written as a moment of a spectral density,
  and for the uniqueness of such a representation.
- `TauCeti.Analysis.PositiveDefinite.AddGroup` and `.Kernel.Kolmogorov` for the positive-definite
  kernels behind the double-parton positivity bounds of 6.2.
- `TauCeti.Analysis.SpecialFunctions.Beta` for the Euler beta integrals that the moments of the
  twist-three kernels in 3.5 reduce to.
- `TauCeti.Analysis.Matrix.Spectrum` for the spectrum of the finite anomalous-dimension matrices of
  3.1 and 3.4.
- `TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight` and `.Decomposition` for the
  collinear conformal representation labels of 3.4, where the multiplicatively renormalisable
  twist-three operators are organised by conformal spin.
- `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` and
  `TauCeti.Analysis.Distribution.DuBoisReymond` for the test-function machinery and for the
  statement that a distribution vanishing against all test functions vanishes, which is how the
  relations of 1.4 and 1.5 are proved rather than checked pointwise.

From Mathlib: `Mathlib.Analysis.Distribution.SchwartzSpace` for tempered distributions,
`Mathlib.MeasureTheory.Integral.Bochner.Set` and `Mathlib.MeasureTheory.Integral.Prod` for
the two-variable integrals, `Mathlib.Analysis.Calculus.Deriv.Basic` for classical derivatives where
they exist, `Mathlib.LinearAlgebra.CliffordAlgebra.Basic` for the Dirac algebra, and
`Mathlib.Analysis.Matrix.Spectrum` for matrix spectra — note the path, which is
`Analysis.Matrix.Spectrum` and not `LinearAlgebra.Matrix.Spectrum`.

Genuine absences, and what the roadmap does instead:

- ⚠ **There is no notion of twist anywhere upstream.** Neither EpsilonEridani nor TauCeti nor
  Mathlib has an operator grading of this kind. Layer 0 builds it here, as a grading on a type of
  light-cone operator data, in the shape a graded-algebra-aware upstream would want: a grading
  function into `ℕ` with the additivity statement under operator products proved, not assumed.
- ⚠ **Harmonic sums are absent from both Mathlib and TauCeti.** The moment-space twist-three
  anomalous dimensions of 3.5 are naturally expressed through harmonic sums. The roadmap defines
  the finite harmonic sums it needs here, as `Finset` sums with the shift and reflection identities
  proved, and states the moments in that language. The occurrences of "harmonic" upstream are
  harmonic functions in potential theory and are unrelated.
- ⚠ **Polylogarithms are absent from both.** The two-loop coefficient functions that appear when
  Layer 4 states the accuracy of the leading-twist subtraction are polylogarithmic. The roadmap
  does not need their closed forms: every statement in Layer 4 is stated for a coefficient function
  given as data at a stated perturbative order, with its analytic form not used. Where an explicit
  function is unavoidable it is defined here by its integral representation.
- ⚠ **Bessel functions are absent from both.** They are not needed by this roadmap; the
  transverse-position-space objects of Layer 6 are treated in position space throughout, and no
  Fourier-Bessel transform is taken. This is a deliberate boundary and not a deferral: 6.5 defines
  the effective cross section by a position-space integral of the transverse profile.
- ⚠ **TauCeti has no moment problem and no notion of ill-posedness, and Hille-Yosida is not
  present by name.** The determinacy results in `TauCeti.Probability.Moments.Determinacy` and
  `.CompactDeterminacy` cover what 6.3 needs about reconstruction from moments. For 4.5 the roadmap
  states ill-conditioning as a Fredholm statement — non-closed range, compact operator, trivial or
  non-trivial kernel — rather than inventing an ill-posedness predicate, and no Tikhonov
  regularisation is used or referred to.
- ⚠ **Mathlib has no partial-differential-equation subtree at all, and TauCeti's PDE hierarchy — of which
  `TauCeti.Analysis.PDE.DirichletProblem` and `TauCeti.Analysis.PDE.Ellipticity.Basic` are
  representative — is elliptic theory only.**
  Every evolution equation here goes through the semigroup theory, per Convention 10.
- ⚠ **There is no upstream object for a gauge link or Wilson line.** The definitions of Layers 1
  and 6 require one, per Convention 3. Layer 1 builds the link as explicit path data with the
  colour representation recorded, using `EpsilonEridani.QFT.QCD.RepresentationColor`, and proves
  the composition and reversal properties it needs. The construction is local to this roadmap and
  is written so that `TransverseMomentumDistributions` and `GeneralizedPartonDistributions` can
  share it; it is not contingent on either.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.QFT.PerturbationTheory.WickAlgebra.Basic` and
  `Physlib.QFT.PerturbationTheory.WickContraction.Basic` for the operator-product structure the
  higher-twist correlators are matrix elements of, and
  `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the invariant product,
  `Physlib.Relativity.Tensors.MetricTensor` and `Physlib.Relativity.Tensors.Contraction.Basic` for
  index contraction, and `Physlib.Relativity.LorentzGroup.Basic` for the covariance group.

## Layer 0: twist as a grading on light-cone operators

References: Jaffe, *Spin, twist and hadron structure* (hep-ph/9602236); Jaffe and Ji, Nucl. Phys.
B375 (1992) 527; Ellis, Furmanski and Petronzio, Nucl. Phys. B207 (1982) 1 and B212 (1983) 29;
Balitsky and Braun, Nucl. Phys. B311 (1989) 541.

### 0.1 Light-cone geometry and the good/bad decomposition

The light-cone basis of Convention 2 gives projectors `P_± = ½ γ^∓ γ^±` on the Dirac spinor space,
and the quark field splits as `ψ = ψ_+ + ψ_-` with `ψ_± = P_± ψ`. Definitions to state: the
projectors, their idempotence and orthogonality, and the statement that `ψ_+` has two independent
components. On the gluon side, the field strength splits into the transverse components `F^{+i}`,
the component `F^{+-}`, and the purely transverse `F^{ij}`.

The theorem to prove is that `ψ_-` is not an independent degree of freedom: the Dirac equation
determines it in terms of `ψ_+`, the transverse gauge field and the quark mass, by an equation with
an inverse light-cone derivative. The hypothesis is the light-cone gauge condition or, gauge
invariantly, the presence of the link of Convention 3. This is the origin of every
equation-of-motion relation in Layer 1 and is stated here once.

### 0.2 Operator twist as dimension minus spin

The grading. A light-cone operator is given as data: a list of field insertions, each a quark field
with a chirality and a good/bad label, or a gluon field-strength component, together with the
light-cone positions and the Dirac and colour structure. Its mass dimension and its Lorentz spin
along the light cone are computed from that data, and its twist is their difference.

The counting theorem to prove: twist is additive over the field content, with each good quark field
contributing one, each bad quark field two, each transverse field strength one, and `F^{+-}`
contributing two. The corollary is the classification statement used throughout Layer 1: an
operator has twist two exactly when it is bilinear in good quark fields or in transverse field
strengths, and twist three exactly when it is either bilinear with one bad quark field or trilinear
with two good quark fields and one transverse field strength.

### 0.3 The power counting theorem

The theorem that justifies the name. For an inclusive structure function in the Bjorken limit at
fixed `x`, the contribution of an operator of twist `t` to the light-cone expansion of the product
of two electromagnetic currents scales as `(M/Q)^{t−2}` relative to the leading term, where `M` is
the nucleon mass. The hypotheses are the ones that make this a theorem rather than a scaling
argument: the operator product expansion of the current product in a stated region of complex
`Q²`, the convergence of the twist sum in the sense stated in 4.1, and a mass scale for the matrix
element which is `M` and not an independent parameter.

This is the link between the grading of 0.2 and the power counting of Convention 1, and it is where
the roadmap makes the two pieces of data agree. Stating it as a theorem with hypotheses, rather
than as a definition of twist by power counting, is what allows 4.3 to separate target-mass
corrections — which are `(M/Q)²` effects of twist-two operators, and therefore a counterexample to
the naive reading of the same slogan.

### 0.4 The leading-twist statement in the Bjorken limit

The statement that the twist-two contribution is the entire Bjorken limit: for fixed `x` and
`Q² → ∞`, the structure functions converge to their twist-two expressions, with the rate given by
0.3. The hypotheses to name are exactly those of 0.3 plus the uniformity in `x` on compact subsets
of `(0,1)`, which fails at the endpoints and is the reason the small-`x` resummation of
`SmallXAndSaturation` is a different subject rather than a limit of this one.

### Examples

- The vector current bilinear `ψ̄_+ γ^+ ψ_+` has twist two, and its forward matrix element is `f₁`.
- The operator `ψ̄_+ γ^+ γ₅ ψ_+` has twist two and gives `g₁`; the operator
  `ψ̄_+ γ^i γ₅ ψ_-` has twist three and is the two-field part of `g_T`.
- The scalar bilinear `ψ̄ ψ` has twist three, and its forward matrix element is the first moment of
  `e`; this is the cleanest example of a twist-three object with no transverse-momentum
  interpretation at all.
- The trilinear `ψ̄_+ γ^+ g F^{+i} ψ_+` has twist three, and its forward matrix element with a
  transversely polarised nucleon is the Efremov-Teryaev-Qiu-Sterman correlator of 2.4.
- The four-quark operator `(ψ̄_+ Γ ψ_+)(ψ̄_+ Γ' ψ_+)` has twist four by 0.2, and is the operator
  content both of the twist-four matrix elements of 4.2 and, at non-zero transverse separation, of
  the double parton distributions of 6.1. The two uses of one operator family is the reason the two
  halves of this roadmap live together.

### Dependencies

`EpsilonEridani.Relativity.CliffordAlgebraExtensions` and
`Mathlib.LinearAlgebra.CliffordAlgebra.Basic` for the Dirac algebra and the projectors;
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` for the Bjorken limit as a statement about
kinematic variables; `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` for the hadronic tensor the
power counting is about. The operator product expansion itself is taken from
`EpsilonEridani.QFT.Factorization.Basic`; this layer adds the grading, not the expansion.

---

## Layer 1: the twist-three operator basis

References: Jaffe and Ji, Nucl. Phys. B375 (1992) 527; Mulders and Tangerman, Nucl. Phys. B461
(1996) 197; Boer, Mulders and Pijlman, Nucl. Phys. B667 (2003) 201; Kanazawa, Koike, Metz, Pitonyak
and Schlegel, Phys. Rev. D93 (2016) 054024; Accardi, Bacchetta, Melnitchouk and Schlegel, JHEP 0911
(2009) 093.

### 1.1 Quark-gluon-quark correlators: definitions

The objects. A twist-three three-parton correlator is the forward nucleon matrix element of
`ψ̄(z₁) Γ [link] g F^{+i}(z₂) [link] ψ(z₃)` with all three points on the light cone, Fourier
transformed in the two independent light-cone separations to give a function of two momentum
fractions in the ordering of Convention 4, with the link path of Convention 3 recorded as data.

Definitions to state: the correlator as a distribution on its support region, with the Dirac
structure `Γ` and the transverse index carried as data; the chiral-even and chiral-odd families,
distinguished by whether `Γ` connects equal or opposite chiralities in the sense of
`EpsilonEridani.Relativity.Fermions.Weyl.LeftHandedExtensions`; and the colour structure, which for
a colour-singlet nucleon matrix element reduces to a single invariant per Dirac structure by
`EpsilonEridani.QFT.QCD.RepresentationColor`.

A theorem to prove here rather than assume: the correlator is real, or purely imaginary, according
to the Dirac structure and the hermiticity of the operator, and the assignment is the one that
makes the naive-time-reversal-odd correlators of 5.1 the imaginary ones.

### 1.2 Complete classification at twist three

The classification theorem. For each nucleon polarisation state — unpolarised, longitudinally
polarised, transversely polarised — the number of independent three-parton correlators at twist
three is finite, and the roadmap states the complete list. The proof is a decomposition of the
matrix element into the available Lorentz structures built from `P`, `S`, `n`, `n̄` and the
transverse metric and Levi-Civita symbols, using
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`, with the coefficient of each
structure a scalar function of the two momentum fractions.

This is the layer's central deliverable and must be complete: an incomplete list would make every
equation-of-motion relation in 1.4 an inequality of unknown sign. The statement includes the
gluonic three-parton correlators — the three-gluon correlators at twist three, which are the
gluon-sector analogue and enter the gluonic contribution to the asymmetries of Layer 5.

### 1.3 Discrete symmetries and the reduction of the basis

The constraints. Hermiticity relates a correlator to itself with the two fractions exchanged and
possibly a sign; parity relates the transverse structures; naive time reversal, meaning time
reversal with the link direction reversed rather than the physical antiunitary operation, relates a
correlator with a future-pointing link to one with a past-pointing link.

Theorems to prove: the symmetry of the chiral-even transverse-spin correlator under exchange of its
two arguments, which is the statement specialised to the Efremov-Teryaev-Qiu-Sterman correlator in
2.4; the reduction of the list of 1.2 to an independent set by these constraints, with the count
stated; and the statement that naive time reversal does not constrain the correlators to vanish,
which is why the single-spin asymmetries of Layer 5 exist at all.

### 1.4 Equations of motion as relations among correlators

The relations, derived and not imposed. Using the elimination of `ψ_-` from 0.1, each twist-three
two-field correlator is expressed as a leading-twist term plus a quark-mass term plus an integral
of a three-parton correlator over its second momentum fraction. The relations to prove, in the
conventions fixed above, have the form

- `x g_T(x)` equals the first transverse moment of `g_{1T}` plus a quark-mass term proportional to
  `(m_q/M) h₁(x)` plus an integral of the chiral-even transverse-spin three-parton correlator;
- `x h_L(x)` equals the first transverse moment of `h_{1L}^⊥` plus a quark-mass term proportional
  to `(m_q/M) f₁(x)` plus an integral of a chiral-odd three-parton correlator;
- `x e(x)` equals a quark-mass term proportional to `(m_q/M) f₁(x)` plus an integral of the
  chiral-odd unpolarised three-parton correlator.

The numerical coefficient of each term is fixed by the derivation and is stated as part of the
theorem, not quoted from the literature. The hypotheses to name are the existence of the transverse
moments — an integrability condition on the transverse-momentum-dependent functions, which is where
`TransverseMomentumDistributions` is depended on — and the weak-derivative sense of the manipulation,
for which `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and `TauCeti.Analysis.Sobolev.Leibniz` are
used. The relations are relations between distributions and are proved by testing against
`TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` test functions, with
`TauCeti.Analysis.Distribution.DuBoisReymond` for the conclusion.

### 1.5 Lorentz-invariance relations

The relations, and their status. A Lorentz-invariance relation expresses a twist-three collinear
function through a leading-twist function and a derivative of a transverse moment — for example
`g_T(x) = g₁(x) + (d/dx) g_{1T}^{(1)}(x)` — and follows from the fact that both sides arise from
the same Lorentz-covariant amplitude decomposed in two different ways.

The theorem to prove is the relation with all three-parton terms retained. The statement that
matters for this roadmap, and that must be made explicitly, is the failure mode: the relation as
written above, with the three-parton terms dropped and the transverse moment defined by an
unregulated transverse-momentum integral, is false. Two distinct causes are to be separated, and
separating them is the content of this subsection. The first is the omission of the three-parton
correlator terms, which is an approximation and not a property of the regulator. The second is the
definition of the transverse moment itself: with the rapidity regulator that
`TransverseMomentumDistributions` requires for a well-defined transverse-momentum-dependent
function, the first transverse moment is not the naive integral, and the relation acquires terms
from the soft factor.

The corrected form of the relation under a rapidity-regulated definition of the transverse moment
is an **open question** in this roadmap. It is stated as such: the roadmap proves the relation in
the form in which the three-parton terms are retained and the transverse moment is defined by the
cutoff prescription recorded with the statement, and proves that the naive form fails. It does not
claim a milestone that produces the regulator-independent relation, because no such relation is
established. What a contributor is asked for here is the conditional statement and the
counterexample, not the resolution.

### Examples

- The chiral-even transverse-spin correlator at the soft-gluon point, whose independence from the
  ordering of 1.3 is the symmetry statement used in 2.4.
- The two-field twist-three operator `ψ̄ ψ` as a degenerate case of 1.4, where the three-parton
  integral is the only non-mass term and the leading-twist term is absent: this is the relation for
  `e(x)` with the leading-twist term genuinely zero, and it is the example that shows the general
  relation is not a Wandzura-Wilczek relation in disguise.
- A verified instance of the failure in 1.5: a Gaussian transverse-momentum model for `g_{1T}` in
  which the naive relation and the relation with three-parton terms retained give different `g_T`,
  exhibited as a computation and not a remark.
- The gluonic three-parton correlator at the soft-gluon point, with its two colour structures —
  the symmetric and antisymmetric combinations of the colour indices — distinguished.

### Dependencies

Layer 0 for the grading, the good/bad decomposition and the elimination of `ψ_-`. From
`TransverseMomentumDistributions`: the definitions of `g_{1T}`, `h_{1L}^⊥` and `f_{1T}^⊥`, their
regulator data, and the first-transverse-moment operation. From `SpinStructure`: the leading-twist
`g₁` and the transversity `h₁`. Upstream:
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`,
`EpsilonEridani.QFT.QCD.RepresentationColor`, `EpsilonEridani.Mathematics.Distribution.BasicExtensions`,
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, `TauCeti.Analysis.Sobolev.Leibniz`,
`TauCeti.Analysis.Distribution.DuBoisReymond`.

---

## Layer 2: the twist-three collinear functions

References: Wandzura and Wilczek, Phys. Lett. B72 (1977) 195; Burkhardt and Cottingham, Ann. Phys.
56 (1970) 453; Jaffe and Ji, Phys. Rev. Lett. 67 (1991) 552; Efremov and Teryaev, Sov. J. Nucl.
Phys. 36 (1982) 140; Qiu and Sterman, Nucl. Phys. B378 (1992) 52; Boer, Mulders and Pijlman, Nucl.
Phys. B667 (2003) 201; Ji, Qiu, Vogelsang and Yuan, Phys. Rev. Lett. 97 (2006) 082002.

### 2.1 `g_T`, `h_L` and `e` from the quark correlator decomposition

The definitions. The collinear quark correlator — the forward matrix element of
`ψ̄(0) Γ [link] ψ(z)` with `z` on the light cone, integrated over transverse separation — has a
decomposition in the available Dirac structures whose coefficients are functions of a single
momentum fraction. At twist two the coefficients are `f₁`, `g₁` and `h₁`, which are taken from
`InclusiveStructureFunctions` and `SpinStructure`. At twist three there are exactly three: `e` for
the unpolarised nucleon, `h_L` for the longitudinally polarised nucleon, and `g_T` for the
transversely polarised nucleon.

Definitions and theorems to state: each function with its Dirac structure and its normalisation;
the identity `g_T = g₁ + g₂` relating `g_T` to the structure-function-level `g₂` of
`EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic`; the chirality of each, so that `e` and `h_L`
are chiral-odd and `g_T` chiral-even; and the completeness statement, that these three exhaust
twist three for the two-field correlator, which is the specialisation of 1.2.

### 2.2 The Wandzura-Wilczek parts

The decomposition. Each twist-three function splits into a part determined by a leading-twist
function — the Wandzura-Wilczek part — and a remainder that is a genuine twist-three matrix
element. The relations to prove, with the integrals as written:

- `g_T^{WW}(x) = ∫_x^1 g₁(y) dy / y`, equivalently
  `g₂^{WW}(x) = −g₁(x) + ∫_x^1 g₁(y) dy / y`;
- `h_L^{WW}(x) = −2x ∫_x^1 h₁(y) dy / y²`;
- `e^{WW}(x) = (m_q/M) f₁(x)/x`, which is a mass term rather than a convolution, so that `e` has no
  Wandzura-Wilczek part in the sense the other two do.

Each is a corollary of the corresponding relation in 1.4 with the three-parton term set to zero,
and each therefore inherits that relation's hypotheses. The integrability hypothesis is to be
stated explicitly: the Wandzura-Wilczek integral converges for `x > 0` under a bound on the small-`y`
behaviour of the leading-twist function, and the roadmap states that bound rather than assuming
convergence. The remainder — `g_T − g_T^{WW}` and so on — is named and is the object that 3.2
evolves and that `LatticeBridge` computes.

The Wandzura-Wilczek relation is an approximation, not a theorem about QCD, and the roadmap says
so: the theorem is the exact relation of 1.4, and the Wandzura-Wilczek relation is that theorem
with a named term dropped. No milestone here asserts that the dropped term is small.

### 2.3 The Burkhardt-Cottingham sum rule and the moment structure

The sum rule `∫_0^1 g₂(x, Q²) dx = 0`, for each quark flavour and for the flavour sum. The proof to
give is the operator argument: the `n = 1` moment of `g₂` receives no contribution from any
twist-three operator, because the corresponding operator has no spin-one component.

The hypotheses must be named, because this sum rule is a case where the hypotheses are the whole
content. Two are needed: the absence of a `δ(x)`-supported contribution to `g₂`, and the
convergence of the integral at `x → 0`, which requires a bound on the small-`x` growth of `g₂` that
does not follow from the operator argument. The roadmap states the sum rule as a conditional
theorem with both hypotheses explicit, and states separately that neither hypothesis is proved
here; the small-`x` behaviour is what `SmallXAndSaturation` addresses and the roadmap depends on no
claim about it.

The general moment structure: the `n`-th moment of each twist-three function is a matrix element of
a local operator of spin `n`, and the roadmap states the correspondence for each `n`, using the
Mellin transform of `EpsilonEridani.QFT.Factorization.Convolution.Mellin` and the moment vocabulary
of `TauCeti.Probability.Moments.Basic`. The statement that the odd and even moments of `e(x)`
correspond to different operators, and that the first moment of `e` is the nucleon scalar matrix
element, is proved here.

Whether `e(x)` contains a term supported at `x = 0` is an **open question**. The roadmap defines
`e` as a distribution, per Convention 12 and `EpsilonEridani.Mathematics.Distribution.BasicExtensions`,
which makes the question statable; it proves the relation between the regular part and the scalar
matrix element, and it states that the singular part is not determined by anything in this roadmap.
No milestone here claims to resolve it.

### 2.4 The Efremov-Teryaev-Qiu-Sterman correlator and its symmetry

The definition. The Efremov-Teryaev-Qiu-Sterman correlator is the chiral-even transverse-spin
three-parton correlator of 1.2, with the Dirac structure `γ^+` and the transverse index contracted
with the transverse spin and the Levi-Civita symbol of Convention 6. It is a function of two
momentum fractions with the support and ordering of Convention 4.

Theorems to prove: its symmetry under exchange of the two arguments, as the specialisation of 1.3;
the existence of the soft-gluon-pole limit, meaning the restriction of the distribution to the
diagonal, together with the hypothesis on the correlator's regularity at the diagonal that makes
the restriction meaningful — this is not automatic for a distribution and is the reason the
diagonal restriction is a theorem here rather than a definition; and the reality properties from
1.1, which make the diagonal value real.

The gluonic analogues — the two three-gluon correlators at the soft-gluon point — are defined here
with the same care, and their symmetry properties stated, because they enter the gluonic
contribution to the asymmetries of 5.2 and no other roadmap defines them.

### 2.5 Transverse moments and the relation to the Sivers function

The relation. The diagonal value of the Efremov-Teryaev-Qiu-Sterman correlator equals a constant
times `M` times the first transverse moment of the Sivers function `f_{1T}^⊥`, with the constant
fixed by Conventions 2, 4 and 6 and by the link direction of Convention 3. The roadmap proves the
relation with its sign and its constant from the definitions, rather than quoting a sign.

The hypotheses to state: that the same link direction is used on both sides, which is what makes
the relation a statement rather than a sign ambiguity — the Sivers function of semi-inclusive deep
inelastic scattering and of the Drell-Yan process differ by a sign, and the relation to the
correlator is therefore process-dependent in exactly that way; and the existence of the first
transverse moment, which is the same integrability hypothesis as in 1.4 and which fails for the
unregulated definition, so that the relation is stated for the regulated definition with the
regulator recorded.

This subsection is the hinge between this roadmap and `TransverseMomentumDistributions`, and the
division of labour is: that roadmap owns the definition of `f_{1T}^⊥`, its regulator and its
evolution; this roadmap owns the correlator, the diagonal restriction, and the relation. Neither
restates the other.

### Examples

- The Wandzura-Wilczek prediction for `g₂` from a stated `g₁`, computed as an instance of 2.2, with
  the convergence hypothesis verified for that `g₁`.
- The Burkhardt-Cottingham integral of the Wandzura-Wilczek part alone, shown to vanish
  identically, so that the sum rule is satisfied by the Wandzura-Wilczek part independent of the
  remainder: this is the example that shows the sum rule does not test the Wandzura-Wilczek
  approximation.
- The first moment of `e(x)` identified with the nucleon scalar matrix element, for a single flavour,
  with the singular-part hypothesis of 2.3 stated as a hypothesis of the identification.
- The diagonal value of the Efremov-Teryaev-Qiu-Sterman correlator computed from a Gaussian Sivers
  model through 2.5, with the resulting sign exhibited under both link directions.
- `h_L` for a nucleon with a stated transversity distribution, showing that the Wandzura-Wilczek
  part of `h_L` involves `1/y²` and therefore needs a strictly stronger convergence hypothesis than
  `g_T` does.

### Dependencies

Layer 1 for the classification, the equation-of-motion relations and the symmetry constraints.
`SpinStructure` Milestone 3 for the Wandzura-Wilczek decomposition at the structure-function level
and for `g₁`, `g₂` and `h₁`; this roadmap supplies the twist-three remainder that decomposition
leaves. `InclusiveStructureFunctions` for `f₁`. `TransverseMomentumDistributions` for `f_{1T}^⊥`,
`g_{1T}`, `h_{1L}^⊥` and the transverse-moment operation. Upstream:
`EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic` and `.SumRules`,
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`,
`EpsilonEridani.Mathematics.Distribution.BasicExtensions`, `TauCeti.Probability.Moments.Basic`.

---

## Layer 3: renormalisation and evolution beyond DGLAP

References: Balitsky and Braun, Nucl. Phys. B311 (1989) 541; Braun, Korchemsky and Müller, Prog.
Part. Nucl. Phys. 51 (2003) 311; Kang and Qiu, Phys. Rev. D79 (2009) 016003; Braun, Manashov and
Pirnay, Phys. Rev. D80 (2009) 114002; Shuryak and Vainshtein, Nucl. Phys. B199 (1982) 451.

### 3.1 Renormalisation of the three-parton operators

The mixing problem. The twist-three three-parton light-cone operators do not renormalise
multiplicatively in the basis of 1.2: they mix among themselves, and the two-field twist-three
operators mix into the three-field ones. The statements to prove: the operator basis is closed under
renormalisation at one loop, meaning the counterterms of any operator in the basis are combinations
of operators in the basis, so that the anomalous dimension is a well-defined operator on the space
of correlators; the mixing is triangular with respect to the number of fields in the direction that
makes the two-field operators receive contributions from the three-field ones and not conversely;
and the flavour-singlet and non-singlet sectors decouple as they do at leading twist.

This is where `EpsilonEridani.QFT.QCD.Renormalization` and
`EpsilonEridani.QFT.QCD.OneLoopCounterterms` are used, and where the roadmap extends the existing
single-operator renormalisation vocabulary to a mixing family. The finite-dimensional
anomalous-dimension matrices that appear in the moment-space statements of 3.5 have their spectra
analysed with `TauCeti.Analysis.Matrix.Spectrum`.

### 3.2 The evolution kernel as a two-variable integral operator

The equation. The scale dependence of a twist-three correlator is governed by an integral operator
acting on functions of two momentum fractions:

`μ ∂/∂μ F(x₁, x₂; μ) = (α_s(μ)/2π) ∫ K(x₁, x₂; y₁, y₂) F(y₁, y₂; μ) dy₁ dy₂`

with the integration over the support region of Convention 4. The content of the statement is what
`K` is not: it is not a product of one-variable kernels, and it is not diagonal in either fraction,
so the evolution does not reduce to two independent DGLAP equations and the convolution algebra of
`EpsilonEridani.QFT.Factorization.Convolution.Collinear` does not apply unchanged.

Definitions and theorems to state: the kernel as data on the two-dimensional domain, with its
support properties and its singularity structure at the diagonals; the operator it defines on a
stated Banach space of functions on the domain, built over
`Mathlib.MeasureTheory.Integral.Prod`; the boundedness or relative boundedness estimate
that makes it an operator on that space; and the statement that the diagonal restriction `F(x, x)`
does not evolve autonomously — the derivative of the diagonal value depends on the correlator off
the diagonal. That last statement is the practical content of "not a DGLAP equation" and is the
theorem a contributor should aim at first.

### 3.3 Semigroup formulation and well-posedness

Per Convention 10, the evolution of 3.2 is an abstract Cauchy problem. The statements to prove: the
operator of 3.2, with `α_s` running as in `EpsilonEridani.QFT.Factorization.Evolution.QCDCore`,
generates a strongly continuous semigroup on the stated space, via
`TauCeti.Analysis.Semigroups.Defs` and `TauCeti.Analysis.Semigroups.Generator.Basic`; the solution
of the initial-value problem exists and is unique, by
`TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.CauchyProblem.Uniqueness`; and the
generator is dissipative in the norm chosen, by
`TauCeti.Analysis.Semigroups.Dissipative.Basic`, which is the statement that the evolution does not
amplify the correlator without bound.

The change of variable from `μ` to the running-coupling evolution time is stated as a
reparametrisation of the semigroup, so that the one-loop solution is an exponential of the
generator in that time. Nothing here reproves existence or uniqueness by hand.

### 3.4 Closed forms: large `N_c` and the conformal basis

Two circumstances in which the two-variable problem collapses to a one-variable one, both of them
theorems with hypotheses and neither an approximation smuggled in as a definition.

First, the large-`N_c` limit. In the limit of a large number of colours, with the hypothesis stated
as a statement about which colour structures of 3.1 survive, the evolution of the
Efremov-Teryaev-Qiu-Sterman correlator on the diagonal closes: the diagonal value evolves with a
one-variable kernel. The theorem to prove is the closure, and the roadmap states the resulting
one-variable kernel explicitly. The colour counting uses
`EpsilonEridani.Mathematics.LieAlgebra.Casimir` and `EpsilonEridani.QFT.QCD.RepresentationColor`.

Second, the conformal basis. At one loop the twist-three operators organise into multiplets of the
collinear conformal group, labelled by conformal spin, in which the anomalous-dimension matrix is
diagonal. The statements to prove: the decomposition of the operator space into conformal
multiplets, with the labels from
`TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight` and `.Decomposition`; the
diagonality of the one-loop anomalous dimension in that basis; and the explicit eigenvalues. The
hypothesis is one-loop accuracy: conformal symmetry of the one-loop kernel, which is broken at two
loops by the running of the coupling, and the roadmap says so rather than stating the diagonality
unconditionally.

### 3.5 Moment space

The moments of the two-variable correlators are double moments, indexed by a pair of integers, and
the anomalous-dimension matrix in moment space is finite-dimensional for each total degree. The
statements to prove: the double Mellin transform of the kernel of 3.2, using
`EpsilonEridani.QFT.Factorization.Convolution.Mellin` for the one-variable transform and the
product-measure machinery for the second variable; the triangularity of the moment-space matrix in
total degree, which is what makes each degree a finite problem; and the eigenvalues at low degree,
computed explicitly.

The moments of the one-loop kernels are Euler beta integrals and finite harmonic sums. The beta
integrals are taken from `TauCeti.Analysis.SpecialFunctions.Beta`. Harmonic sums are absent
upstream; this subsection defines the finite harmonic sums as `Finset` sums, proves the shift
identity and the reflection identity it needs, and states the eigenvalues in that language. The
definitions are written in the shape upstream would want — sums over `Finset.range` with the
identities as simp lemmas — so that they can move upstream without change, and this roadmap does
not wait for them to.

### Examples

- The one-loop evolution of the diagonal Efremov-Teryaev-Qiu-Sterman correlator in the large-`N_c`
  limit, solved explicitly for a stated initial condition, as an instance of 3.3 and 3.4.
- A demonstration that the diagonal does not evolve autonomously at finite `N_c`: two correlators
  with the same diagonal value but different off-diagonal behaviour, evolved a finite distance, with
  different diagonals.
- The lowest non-trivial double moment of the twist-three transverse-spin correlator, with its
  anomalous dimension computed from 3.5 and cross-checked against the conformal eigenvalue of 3.4.
- The evolution of the Wandzura-Wilczek part of `g_T`, shown to be the DGLAP evolution of `g₁`
  composed with the convolution of 2.2, so that the Wandzura-Wilczek part is stable under evolution
  while the remainder is not: the example that makes the non-DGLAP character concrete.

### Dependencies

Layers 1 and 2 for the operator basis and the correlators. `CollinearEvolution` for the splitting
kernels, the running coupling, the convolution algebra in one variable and the Mellin-space
technology; this roadmap extends that machinery to two variables and does not restate it. Upstream:
`EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.CollinearForm`, `.MomentSpace`, `.QCDCore` and
`.Solutions`; `EpsilonEridani.QFT.QCD.Renormalization`;
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`; `TauCeti.Analysis.Semigroups.Defs`,
`.Generator.Basic`, `.Generator.Closed`, `.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness`,
`.Dissipative.Basic`; `TauCeti.Analysis.Matrix.Spectrum`;
`TauCeti.Analysis.SpecialFunctions.Beta`; `TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight`.

---

## Layer 4: power corrections to inclusive structure functions

References: Jaffe and Soldate, Phys. Rev. D26 (1982) 49; Ellis, Furmanski and Petronzio, Nucl. Phys.
B212 (1983) 29; Shuryak and Vainshtein, Nucl. Phys. B199 (1982) 451; Georgi and Politzer, Phys. Rev.
D14 (1976) 1829; Nachtmann, Nucl. Phys. B63 (1973) 237; Beneke, Phys. Rept. 317 (1999) 1.

### 4.1 The twist expansion of `F₂` and `F_L`

The expansion. For a structure function at fixed `x` and large `Q²`, the operator product expansion
organises the hadronic tensor into a sum over twist, and the roadmap states the expansion to the
first subleading order:

`F₂(x, Q²) = F₂^{(2)}(x, Q²) + H₂(x, Q²)/Q² + O(1/Q⁴)`

with `F₂^{(2)}` the twist-two term including its perturbative corrections at the order recorded by
`EpsilonEridani.QFT.Factorization.HigherOrder.Basic`, and similarly for `F_L`. The statement to
prove is the existence of such a decomposition with `H₂` independent of `Q` up to logarithms, given
the hypotheses of 0.3.

What must be said plainly here is the status of the expansion: it is asymptotic and not convergent,
and the roadmap makes no claim about the convergence of the twist series. The statements proved are
statements about the first subleading term with a remainder bound of the stated order, and the
remainder bound is part of every statement. This is an honest limitation of the operator product
expansion and not a gap in the roadmap.

The longitudinal structure function is treated separately because its leading-twist term is itself
of order `α_s`, so that the twist-four contribution to `F_L` competes with a perturbative
correction rather than with a leading term; the roadmap states the relative counting explicitly,
using `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal`.

### 4.2 Twist-four matrix elements as definitions

The definition. `H₂(x, Q²)` is expressed as a convolution of twist-four coefficient functions with
twist-four matrix elements. The twist-four operators are the four-field operators of 0.2 together
with the operators containing `F^{+-}` and the two-field operators with two bad components, and the
roadmap states the complete list of the twist-four operators contributing to `F₂` and `F_L`.

The key methodological point, and the reason the draft insists on it: the twist-four matrix
elements are *defined* by this expression together with the scheme data of Convention 7. They are
not modelled, not parametrised by an ansatz, and not identified with any particular hadronic
picture. A statement of the form "the twist-four correction has such-and-such an `x` shape" is a
model and appears nowhere in this roadmap. What appears is the operator definition, the scheme
dependence, and the relations that hold among the matrix elements independent of scheme.

Theorems to prove: the completeness of the twist-four operator list for `F₂` and `F_L`; the
reduction of that list by the equations of motion, which at twist four is the same mechanism as 1.4
applied one order further and which reduces the number of independent matrix elements
substantially; and the renormalisation-group equation for the matrix elements, which mixes them and
which is a two- and three-variable instance of the structure of Layer 3.

### 4.3 Target-mass corrections and Nachtmann moments

The separation. Corrections of order `M²/Q²` arise from two entirely different sources: the trace
terms of the twist-two operators, which are kinematic and are fixed by the twist-two matrix
elements themselves, and the twist-four operators of 4.2, which are dynamical and independent.
Per Convention 8 the roadmap keeps them apart by the operator they come from, and this subsection
makes the separation precise.

The definitions and theorems: the Nachtmann variable `ξ = 2x / (1 + √(1 + 4M²x²/Q²))` with its
properties — that it is increasing in `x`, that `ξ ≤ x`, and that `ξ → x` as `M²/Q² → 0` — proved
from `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds`; the Nachtmann moments of
`F₂` and `F_L`, defined as integrals against a weight built from `ξ`; and the theorem that the
`n`-th Nachtmann moment of the structure function receives contributions only from operators of
twist two up to terms of order `1/Q²` from genuine twist four, with all powers of `M²/Q²` from
twist-two operators resummed exactly. That theorem is the precise form of the separation, and it
is what makes "target-mass corrections" a definition rather than a prescription.

The Georgi-Politzer form of the target-mass-corrected structure function, as the `x`-space
statement equivalent to the moment statement, is stated with the convergence hypothesis its
integrals need. The roadmap also states the known defect of the `x`-space form: it does not vanish
above `x = 1`, so the naive expression violates the support condition, and the roadmap states this
as a property of the truncation rather than hiding it.

### 4.4 The renormalon ambiguity and the subtraction scheme as data

The obstruction, stated as an obstruction. The perturbative series for a twist-two coefficient
function has factorially growing coefficients from infrared renormalons, and its Borel transform
has a singularity whose position corresponds to a `1/Q²` ambiguity. Therefore the split of a
structure function into "twist two" and "twist four" is not unique: shifting the prescription for
summing the twist-two series shifts the twist-four matrix element by an amount of order the
matrix element itself.

The statements to make: the ambiguity as a precise statement about the Borel transform of a series
given as data, using the spectral representations of
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` where a Borel representation is available,
with `.Uniqueness` for the uniqueness of the representation; the definition of a subtraction scheme
as the data of Convention 7; the theorem that the sum of the twist-two and twist-four terms is
independent of the scheme to the stated accuracy, which is the statement that is physically
meaningful; and the corollary that the twist-four matrix element alone is scheme-dependent, with
the transformation law under a change of scheme stated explicitly.

Whether there exists a scheme-independent definition of the twist-four matrix element beyond the
accuracy at which the sum is scheme-independent is an **open question**. The roadmap states it as
such and does not present any milestone as resolving it. What the roadmap delivers is the
transformation law and the scheme-independent combination, which is what a fit to data can
legitimately claim to determine.

### 4.5 Identifiability of the power-correction coefficients

The inverse problem. Given structure-function values on a region of the `(x, Q²)` plane, with the
twist-two term known at a stated order, is the twist-four matrix element determined? The roadmap
formulates this as a Fredholm question: the map from twist-four matrix elements to structure
function values is a linear integral operator, and the question is whether its kernel is trivial and
whether its range is closed.

Statements to prove: the map as a bounded operator between stated spaces; a criterion for the
triviality of its kernel on a region of the plane, via `TauCeti.Analysis.Fredholm.Criteria` and
`.FiniteRank`; the compactness of the operator when the data region is bounded, and hence the
non-closedness of its range, via `TauCeti.Analysis.Fredholm.CompactPerturbation`, which is the
precise form of the statement that the extraction is ill-conditioned; and the finite-dimensional
reduction, that with the twist-four matrix element restricted to a finite-dimensional space the
problem becomes a matrix problem whose conditioning is computable.

Per the absence noted above, TauCeti has no notion of ill-posedness and no regularisation theory.
The roadmap states everything in Fredholm language and introduces no regularisation predicate; it
uses the existing formulation of `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` for
what "determined by the data" means. Whether the kernel is in fact trivial for a realistic data
region, rather than under a stated hypothesis, is an **open question** and is labelled as one.

### Examples

- The Nachtmann moments of a stated twist-two structure function, computed to exhibit the exact
  resummation of `M²/Q²` and the difference from the Cornwall-Norton moments of the same function.
- A twist-four matrix element extracted from synthetic data in two subtraction schemes, exhibiting
  the transformation law of 4.4 as a computation.
- The `F_L` counting of 4.1 made explicit: for stated `α_s(Q²)` and a stated twist-four matrix
  element, the `Q²` at which the twist-four term and the order-`α_s` twist-two term are equal.
- A two-parameter twist-four ansatz for which the Fredholm operator of 4.5 has a non-trivial
  kernel on a stated data region, exhibiting the non-identifiability concretely rather than
  asserting it.
- The support violation of the Georgi-Politzer `x`-space form at large `x`, exhibited numerically
  for a stated twist-two input, as the concrete content of the caveat in 4.3.

### Dependencies

Layer 0 for the grading and the power counting theorem; Layer 3 for the renormalisation-group
equations of the twist-four matrix elements. `InclusiveStructureFunctions` Milestone 4 for the
twist expansion of the structure functions at the observable level and for the leading-twist
coefficient functions; this roadmap supplies the correlators and matrix elements that expansion is
in terms of. `CollinearEvolution` for the running coupling and the leading-twist evolution.
`RadiativeCorrections` for the electromagnetic corrections that must be removed from data before a
power correction can be read off; this roadmap states the requirement and does not perform the
removal. Upstream: `EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic`, `.Tensors.Longitudinal`,
`.Kinematics.Bounds`, `.Inference.Identifiability`,
`EpsilonEridani.QFT.Factorization.HigherOrder.Basic`, `TauCeti.Analysis.Fredholm.Criteria`,
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`.

---

## Layer 5: twist-three single-spin asymmetries

References: Kane, Pumplin and Repko, Phys. Rev. Lett. 41 (1978) 1689; Efremov and Teryaev, Phys.
Lett. B150 (1985) 383; Qiu and Sterman, Phys. Rev. D59 (1998) 014004; Ji, Qiu, Vogelsang and Yuan,
Phys. Rev. Lett. 97 (2006) 082002; Bacchetta, Boer, Diehl and Mulders, JHEP 0808 (2008) 023;
Kanazawa, Koike, Metz, Pitonyak and Schlegel, Phys. Rev. D93 (2016) 054024.

### 5.1 Naive time-reversal oddness and the leading-twist vanishing theorem

The theorem that makes this layer part of a higher-twist roadmap. A single-transverse-spin
asymmetry vanishes in collinear factorisation with massless quarks at Born level. The proof has two
independent ingredients, and the roadmap proves both:

First, the helicity argument. A single-transverse-spin asymmetry requires an interference between
amplitudes differing by one unit of hadron helicity, which at the parton level requires a
chirality-flip, and massless perturbative QCD conserves chirality. This is a statement about the
Dirac trace and is proved with
`EpsilonEridani.Relativity.Fermions.Weyl.LeftHandedExtensions` and
`EpsilonEridani.Relativity.CliffordAlgebraExtensions`; the massless hypothesis is named, per
Convention 9, and the theorem is stated so that the mass term is visible as the coefficient of the
non-vanishing piece.

Second, the phase argument. A naive-time-reversal-odd observable requires a relative phase between
the interfering amplitudes, which at Born level in a real coupling theory is absent; a phase
requires either an absorptive part from a loop, which is one power of `α_s`, or the link of
Convention 3, which supplies a phase at the same order in the coupling but without a loop. The
theorem to prove is the vanishing at Born level; the corollary is that the asymmetry is of order
`α_s m_q / Q` in the parton model, which is the quantitative form of "small", and the conclusion is
that the observed asymmetries are not parton-model effects.

### 5.2 The collinear twist-three factorisation formula

The formula. A transverse single-spin asymmetry in a process with a large transverse scale
factorises into a convolution of the twist-three correlators of Layer 2 with hard kernels and, where
a hadron is observed, with fragmentation functions:

`A ∼ Σ_q ∫dx ∫dz  [ T_q(x, x) − x (d/dx) T_q(x, x) ] ⊗ D_q(z) ⊗ Ĥ(x, z)`

together with the chiral-odd terms in which the transversity distribution of `SpinStructure` is
convoluted with a twist-three fragmentation function owned by `Hadronization`, and the gluonic
terms in which the three-gluon correlators of 2.4 appear.

Statements to prove: the formula as a factorisation statement with its scales explicit, in the shape
of `EpsilonEridani.QFT.Factorization.Basic` and `EpsilonEridani.QFT.Factorization.Scales.Basic`;
the completeness of the list of contributing terms at this order, so that a contributor knows the
enumeration is finished; and the hard kernels at lowest order, taken from
`EpsilonEridani.QFT.Factorization.DIS.HardKernel` and
`EpsilonEridani.QFT.Factorization.DIS.DiagrammaticHardKernel`. The observable side — the azimuthal
harmonic in which the asymmetry appears — is taken from
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics` and not restated.

### 5.3 The derivative term and the soft-gluon pole

The derivative term in 5.2 deserves its own treatment because it is where the distributional nature
of the correlators is unavoidable. The hard kernel has a pole at the soft-gluon point, and the
convolution of a distribution with a pole produces both the diagonal value of the correlator and
its derivative along the diagonal.

Statements to prove: the pole structure of the hard kernel, as an explicit statement about the
denominator; the extraction of the diagonal value and the diagonal derivative from the convolution,
as a distributional identity proved with
`EpsilonEridani.Mathematics.Distribution.BasicExtensions` and
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic` — the derivative is a weak derivative and the roadmap
does not assume the correlator is differentiable; and the statement that the combination appearing
in 5.2 is the one that is renormalisation-group consistent with the evolution of Layer 3, which is
a non-trivial consistency check between the two layers and should be proved, not assumed.

The soft-fermion pole contributions, in which the pole is at a vanishing quark momentum fraction
rather than a vanishing gluon fraction, are enumerated here with the same care, and their
contribution to the same observables stated.

### 5.4 Consistency with the transverse-momentum-dependent description

The matching. In the intermediate region where the observed transverse momentum is both much larger
than the hadronic scale and much smaller than the hard scale, the twist-three collinear description
of 5.2 and the transverse-momentum-dependent description of `TransverseMomentumDistributions` both
apply, and they must agree. The statement to prove is the agreement: the large-transverse-momentum
expansion of the transverse-momentum-dependent expression reproduces the small-transverse-momentum
limit of the twist-three collinear expression, with the relation of 2.5 as the ingredient that makes
the two sets of non-perturbative functions match.

The hypotheses are the two-scale hierarchy and the regulator agreement of 2.5. This is a
consistency statement in the sense of
`EpsilonEridani.Particles.Parton.Unified.Consistency`, and it is the strongest available check on
the conventions of this roadmap: a sign error anywhere in Conventions 2, 4 or 6 breaks it.

### Examples

- The Born-level single-spin asymmetry in massless collinear factorisation computed to be
  identically zero, as an executable instance of 5.1 rather than an appeal to it.
- The same quantity with the quark mass retained, exhibiting the `m_q/Q` suppression explicitly.
- The derivative term of 5.2 evaluated for a correlator with a stated diagonal behaviour, showing
  that the derivative term and the non-derivative term can have opposite signs, so that the
  asymmetry's sign is not that of the correlator.
- The matching of 5.4 carried out for one asymmetry with a Gaussian model for the
  transverse-momentum-dependent function, verified to agree in the overlap region.
- The three-gluon-correlator contribution to one asymmetry, with both colour structures kept
  distinct, as a check that 2.4's gluonic definitions are complete enough to be used.

### Dependencies

Layers 1, 2 and 3 for the correlators, the diagonal restriction and the evolution.
`TransverseMomentumDistributions` for the transverse-momentum-dependent functions and the matching
of 5.4. `SpinStructure` for the transversity distribution. `Hadronization` for the twist-three
fragmentation functions appearing in the chiral-odd terms; this roadmap names them and takes them,
and does not define them. Upstream: `EpsilonEridani.QFT.Factorization.DIS.HardKernel`,
`.DiagrammaticHardKernel`, `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Basic` and
`.Harmonics`, `EpsilonEridani.Particles.Parton.Unified.Consistency`,
`EpsilonEridani.Relativity.Fermions.Weyl.LeftHandedExtensions`,
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`.

---

## Layer 6: double parton distributions

References: Mekhfi, Phys. Rev. D32 (1985) 2371; Kirschner, Phys. Lett. B84 (1979) 266; Shelest,
Snigirev and Zinovjev, Phys. Lett. B113 (1982) 325; Gaunt and Stirling, JHEP 1003 (2010) 005;
Diehl, Ostermeier and Schäfer, JHEP 1203 (2012) 089; Manohar and Waalewijn, Phys. Lett. B713 (2012)
196 and Phys. Rev. D85 (2012) 114009; Blok, Dokshitzer, Frankfurt and Strikman, Eur. Phys. J. C72
(2012) 1963; Diehl, Gaunt and Schönwald, JHEP 1706 (2017) 083.

### 6.1 Definition, support, and the colour and spin basis

The definition. A double parton distribution is the forward nucleon matrix element of a product of
two parton bilinears, the two bilinears separated by a transverse distance `y` and each having its
own light-cone separation, Fourier transformed in the two light-cone separations to give a function
of two momentum fractions and the transverse separation, with the links of Convention 3 on each
bilinear and between them.

Definitions to state: the distribution `F_{a₁a₂}(x₁, x₂, y)` with flavour, polarisation and colour
labels on each parton; the colour decomposition, in which the product of two colour-singlet
bilinears is one channel and the product of two colour-octet bilinears coupled to a singlet is
another, enumerated for the quark-quark, quark-gluon and gluon-gluon cases with
`EpsilonEridani.QFT.QCD.RepresentationColor` and
`EpsilonEridani.Mathematics.LieAlgebra.Casimir`; and the spin decomposition, in which each parton
carries an unpolarised, longitudinally polarised or transversely polarised label, so that spin
correlations between the two partons are explicit data and not an afterthought.

Theorems to prove: the support statement, that `x₁ > 0`, `x₂ > 0` and `x₁ + x₂ ≤ 1`, from the
spectral condition on the intermediate states, with the hypothesis on the spectrum stated — this is
a theorem and not a definition, and it is the reason `EpsilonEridani.Mathematics.OrderedSimplexIntegral`
is the right integration domain; the hermiticity and reality properties, per 1.1; the behaviour under
`y → 0`, where the distribution has a perturbative `1/y²` singularity from the splitting of one
parton into two, which is a statement to be proved and is the origin of the inhomogeneous term in
6.4; and the reduction statement, that integrating one parton's momentum fraction and summing its
quantum numbers does not give a single-parton density — the correct relations are the sum rules of
6.3, and the naive reduction is false, which is worth stating because it is the error the sum rules
correct.

The colour-nonsinglet channels are Sudakov suppressed: their contribution to a cross section carries
an exponential of a negative double logarithm of the ratio of the hard scale to the inverse
transverse separation. The theorem to prove is the suppression, with the hypothesis being the
one-loop exponentiation; the roadmap states it as a theorem about the channel and not as a licence
to drop the channel from the definitions, which retain all channels.

### 6.2 Positivity

The bounds. The double parton distributions are constrained by positive semidefiniteness of the
two-parton spin density matrix, which gives inequalities bounding the polarised distributions by the
unpolarised one in each colour and flavour channel.

Statements to prove: the density matrix as a positive-semidefinite matrix in the combined spin space
of the two partons, using `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`; the
inequalities obtained from its two-by-two and larger minors, stated explicitly for the
quark-quark case; and the positive-definiteness of the associated kernel in the transverse
separation, via `TauCeti.Analysis.PositiveDefinite.AddGroup` and
`TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov`.

The scheme caveat is inherited from `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` and stated
here: positivity of a renormalised distribution is a scheme-dependent statement, the bounds are
proved for the bare or cut-off-defined object, and the roadmap states which. It does not assert
positivity of the renormalised distribution in an arbitrary scheme.

### 6.3 Sum rules

The sum rules, for the momentum-fraction distributions obtained by integrating over the transverse
separation with the measure stated in 6.1. Two families, both for quark flavours `a₁` and a second
parton `a₂`:

- the number sum rule
  `∫_0^{1−x₂} F_{a₁a₂}(x₁, x₂) dx₁ = (N_{a₁} + δ_{a₁ ā₂} − δ_{a₁ a₂}) f_{a₂}(x₂)`,
  where `N_{a₁}` is the number of valence quarks of flavour `a₁` in the nucleon and the Kronecker
  deltas are the flavour deltas of Convention 11;
- the momentum sum rule
  `Σ_{a₁} ∫_0^{1−x₂} x₁ F_{a₁a₂}(x₁, x₂) dx₁ = (1 − x₂) f_{a₂}(x₂)`,
  with the sum over all parton flavours including the gluon.

Theorems to prove: each sum rule, from the operator definition together with the completeness of
the intermediate states, with the convergence hypotheses on the integrals stated explicitly — the
integrand's behaviour as `x₁ → 0` is where convergence is at issue and the hypothesis is a bound
there; the statement that the number sum rule has no analogue when `a₁` is a gluon, with the reason;
and the consistency of the two families, in that the momentum sum rule summed against the number
sum rules reproduces the single-parton momentum sum rule of `InclusiveStructureFunctions`.

The moment vocabulary of `TauCeti.Probability.Moments.Basic` is used for the statements, and
`TauCeti.Probability.Moments.Determinacy` for the question of what the sum rules determine: they
constrain the distributions but do not determine them, and the roadmap states the precise
under-determination rather than leaving it implicit.

### 6.4 Inhomogeneous evolution

The equation. The scale dependence of a double parton distribution has a homogeneous part, which is
DGLAP evolution in each momentum fraction separately, and an inhomogeneous part, whose source is a
single parton splitting into the two observed partons:

`μ² ∂/∂μ² F_{a₁a₂}(x₁, x₂) = Σ_b P_{a₁b} ⊗₁ F_{ba₂} + Σ_b P_{a₂b} ⊗₂ F_{a₁b}
  + (α_s/2π) Σ_b (1/(x₁+x₂)) f_b(x₁+x₂) P_{b→a₁a₂}(x₁/(x₁+x₂))`

with the convolutions in the first and second argument respectively, taken from
`EpsilonEridani.QFT.Factorization.Convolution.Collinear`, and the splitting kernels from
`CollinearEvolution`. The `1 → 2` kernel in the inhomogeneous term is the real-emission part of the
corresponding splitting function, and the roadmap states which part precisely, because the virtual
part belongs to the homogeneous term and double counting it is the standard error.

Statements to prove: the equation as an abstract Cauchy problem on a stated space of functions on
the simplex, per Convention 10, with the inhomogeneous term handled as an inhomogeneity of the
Cauchy problem rather than folded into the generator, using
`TauCeti.Analysis.Semigroups.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness` and
`TauCeti.Analysis.Semigroups.BoundedGenerator.Perturbation`; existence and uniqueness of the
solution given an initial condition and the single-parton densities as a source; the preservation of
the support `x₁ + x₂ ≤ 1` under evolution, which is a property of the kernels and must be proved
because a violation would be silent; and the **conservation theorem**, that both sum rules of 6.3
are preserved by this evolution, together with the sharper statement that they are *not* preserved
by the homogeneous part alone. That pair of statements is the strongest available check on the
inhomogeneous term and is the deliverable of this subsection.

### 6.5 The pocket formula and the effective cross section

The formula, and exactly what it assumes. Under the hypothesis that the double parton distribution
factorises into a product of single-parton densities times a normalised transverse profile
independent of the momentum fractions, the flavours and the colour and spin channels,

`F_{a₁a₂}(x₁, x₂, y) = f_{a₁}(x₁) f_{a₂}(x₂) G(y)`,  `∫ G(y) d²y = 1`,

the double-parton-scattering cross section for two hard processes `A` and `B` takes the pocket form

`σ_DPS = (m/2) σ_A σ_B / σ_eff`,  `1/σ_eff = ∫ G(y)² d²y`,

with `m = 1` when the two processes are identical and `m = 2` otherwise.

Statements to prove: the pocket formula as a theorem under the factorisation hypothesis, with the
hypothesis stated as a hypothesis of the theorem and not as background; the definition of `σ_eff`
by the position-space integral above, with the Cauchy-Schwarz bound relating it to the transverse
size; and the combinatorial factor `m`, derived from the symmetry of the two-process final state
rather than asserted.

The factorisation hypothesis is a **hypothesis and not a theorem**, and the roadmap says so
plainly. It is violated by every structure the previous subsections establish: the perturbative
`1/y²` behaviour of 6.1 makes `G` depend on the momentum fractions, the colour channels of 6.1 and
the spin correlations of 6.2 are not products, and the inhomogeneous evolution of 6.4 does not
preserve a product form. The roadmap therefore proves the conditional statement, proves that the
hypothesis fails under evolution — that is, that a product form imposed at one scale is not a
product form at another, which is a theorem — and states that the universality of `σ_eff` across
processes is an open question. No milestone here asserts a value or a universality for `σ_eff`.

### 6.6 Double counting between double and single parton scattering

The problem. The contribution in which one parton from each hadron splits perturbatively into two is
counted both in double parton scattering with a perturbatively generated distribution and in the
single-parton-scattering loop correction. Naively adding the two double counts it.

Statements to make: the double counting as a precise statement about the region of loop momentum
that both terms cover; a subtraction defined with an explicit cutoff function in the transverse
separation, with the cutoff scale as data; the theorem that the sum of the subtracted double-parton
term and the single-parton term is independent of the cutoff scale to the accuracy stated, which is
what makes the subtraction legitimate; and the accuracy at which that independence holds, stated
rather than gestured at.

There is no unique prescription for this subtraction, and the roadmap does not claim one. It
formalises one scheme completely, proves the cutoff independence of the sum at the stated accuracy,
and states the equivalence class of schemes with the same accuracy. Whether a scheme exists in which
the separation is exact is an **open question**.

### Examples

- The perturbative double parton distribution generated by a single splitting from a stated
  single-parton density, exhibiting the `1/y²` behaviour of 6.1.
- A product-form initial condition evolved a finite distance by 6.4 and shown not to be of product
  form, as the concrete content of the failure statement in 6.5.
- The number sum rule verified for a stated valence-model distribution, including the
  `δ_{a₁ ā₂} − δ_{a₁ a₂}` flavour structure, which is the part a model most easily gets wrong.
- The momentum sum rule checked before and after a finite amount of evolution, verifying the
  conservation theorem of 6.4 and its failure for the homogeneous part alone.
- `σ_eff` computed for a Gaussian transverse profile of stated width, with the Cauchy-Schwarz bound
  saturated, as the calibration example for 6.5.
- The positivity bound of 6.2 evaluated for a longitudinally-correlated model, exhibited as a
  non-trivial constraint.

### Dependencies

Layer 0 for the twist counting that places the four-field operators at twist four, and Layer 3 for
the semigroup formulation of an evolution equation with a non-diagonal kernel. `CollinearEvolution`
for the splitting kernels, the real and virtual parts separately, and the running coupling;
`InclusiveStructureFunctions` for the single-parton densities and their momentum sum rule, which the
sum rules of 6.3 reduce to. `LatticeBridge` for the lattice determination of double parton matrix
elements; this roadmap supplies the operator definitions those determinations target and takes no
numerical input. `NuclearPartonDistributions` for the nuclear case, where double parton scattering
is enhanced by the nuclear geometry; the geometric enhancement belongs there and the pocket formula
of 6.5 is stated here in a form that roadmap can specialise. Upstream:
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`,
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`,
`EpsilonEridani.Mathematics.KroneckerDelta.BasicExtensions`,
`EpsilonEridani.QFT.QCD.RepresentationColor`, `EpsilonEridani.Mathematics.LieAlgebra.Casimir`,
`EpsilonEridani.Particles.Parton.PDF.Positivity` and `.MsbarPositivity`,
`EpsilonEridani.QFT.Factorization.Convolution.Collinear`,
`TauCeti.Analysis.Semigroups.CauchyProblem.Basic`,
`TauCeti.Analysis.Semigroups.BoundedGenerator.Perturbation`,
`TauCeti.Probability.Moments.Basic` and `.Determinacy`,
`TauCeti.Analysis.PositiveDefinite.AddGroup`.

---

## Dependency graph

```
                        Layer 0: twist as a grading
                                    |
                    +---------------+---------------+
                    |                               |
      Layer 1: twist-three basis            Layer 6: double parton
      (EOM and LIR relations)               distributions
                    |                       (needs 0 for twist-four
      Layer 2: g_T, h_L, e, ETQS             counting, 3 for the
                    |                        semigroup formulation)
      Layer 3: renormalisation and
               evolution beyond DGLAP
                    |
          +---------+---------+
          |                   |
  Layer 4: power        Layer 5: twist-three
  corrections to        single-spin
  F2 and FL             asymmetries
```

External edges, all of them into this roadmap except where noted:

- `InclusiveStructureFunctions` → Layers 2, 4, 6 (leading-twist densities, the structure-function
  twist expansion, the single-parton momentum sum rule).
- `SpinStructure` → Layers 2, 5 (`g₁`, `g₂`, `h₁`, and the Wandzura-Wilczek decomposition at the
  structure-function level).
- `CollinearEvolution` → Layers 3, 4, 6 (splitting kernels with real and virtual parts separate,
  the convolution algebra, the running coupling).
- `TransverseMomentumDistributions` ↔ Layers 1, 2, 5 (TMD definitions and regulators in; the
  twist-three correlators that the transverse-moment relations terminate on, out).
- Layer 0 → `GeneralizedPartonDistributions` and `Hadronization` (the twist grading and the
  equation-of-motion machinery, out).
- Layer 6 → `NuclearPartonDistributions` (the pocket formula in a specialisable form, out);
  `LatticeBridge` ← Layers 2, 4, 6 (operator definitions for lattice matrix elements, out).
- `RadiativeCorrections` → Layer 4 (the electromagnetic corrections that must be removed before a
  power correction is read off).

## Acceptance examples

The roadmap is complete when each of the following is a statement in the library with a proof, or,
where marked, a precisely stated conditional or open question:

1. Twist is additive over light-cone field content, with the counting of 0.2, and an operator has
   twist three exactly when it has the field content enumerated in 0.2.
2. A twist-`t` operator contributes to an inclusive structure function at relative order
   `(M/Q)^{t−2}`, under the hypotheses of 0.3, and target-mass corrections are a
   counterexample to the converse.
3. The list of forward twist-three quark-gluon-quark correlators in 1.2 is complete for each
   nucleon polarisation, and 1.3 reduces it to an independent set of the stated size.
4. The three equation-of-motion relations of 1.4 hold as distributional identities, with their
   coefficients, their mass terms, and their integrability hypotheses.
5. The Lorentz-invariance relation of 1.5 holds with the three-parton terms retained, and the naive
   form with them dropped is false — exhibited by the model counterexample of Layer 1's Examples.
   The regulator-independent corrected form is stated as an open question and is not claimed.
6. `g_T^{WW}`, `h_L^{WW}` and the mass form of `e^{WW}` are as in 2.2, each with its convergence
   hypothesis discharged for the class of leading-twist inputs stated.
7. `∫_0^1 g₂ dx = 0` holds under the two hypotheses of 2.3, both named; neither is claimed to be
   proved here.
8. The Efremov-Teryaev-Qiu-Sterman correlator is symmetric in its two arguments, its diagonal
   restriction exists under the regularity hypothesis of 2.4, and its diagonal value equals the
   constant of 2.5 times `M` times the first transverse moment of the Sivers function, with the sign
   derived and the link direction explicit.
9. The diagonal value of the Efremov-Teryaev-Qiu-Sterman correlator does not evolve autonomously at
   finite `N_c`, exhibited by the two-correlator example of Layer 3; in the large-`N_c` limit it
   does, with the one-variable kernel of 3.4.
10. The two-variable evolution operator of 3.2 generates a strongly continuous semigroup on the
    stated space, and the initial-value problem has a unique solution, both through TauCeti's
    semigroup theory and not reproved.
11. The `n`-th Nachtmann moment of `F₂` receives twist-two contributions with all powers of
    `M²/Q²` resummed, plus a twist-four term of order `1/Q²` and nothing else, per 4.3.
12. Twist-four matrix elements transform under a change of subtraction scheme by the law of 4.4, the
    sum of twist-two and twist-four terms is scheme-independent to the stated accuracy, and the
    existence of a scheme-independent twist-four matrix element beyond that accuracy is stated as an
    open question.
13. The twist-four extraction operator of 4.5 is compact on the stated spaces, so its range is not
    closed, and a data region and a two-parameter ansatz are exhibited for which its kernel is
    non-trivial.
14. A single-transverse-spin asymmetry vanishes at Born level in collinear factorisation with
    massless quarks, by both the chirality argument and the phase argument of 5.1, with the massless
    hypothesis named.
15. The twist-three factorisation formula of 5.2 holds with the enumeration of contributing terms
    complete, and the derivative term of 5.3 arises as a distributional identity with a weak
    derivative, consistent with the evolution of Layer 3.
16. The twist-three collinear and transverse-momentum-dependent descriptions agree in the overlap
    region of 5.4, for the one asymmetry worked out in Layer 5's Examples.
17. The double parton distributions have support on `x₁ + x₂ ≤ 1`, proved from the spectral
    condition, and this support is preserved by the evolution of 6.4.
18. Both sum rules of 6.3 hold with their convergence hypotheses, and both are preserved by the
    inhomogeneous evolution of 6.4 while neither is preserved by its homogeneous part alone.
19. The pocket formula of 6.5 holds under the factorisation hypothesis, the hypothesis is not
    preserved by evolution — proved, not asserted — and the universality of `σ_eff` is stated as an
    open question.
20. The double-counting subtraction of 6.6 gives a cutoff-independent sum at the stated accuracy,
    and the existence of an exact separation is stated as an open question.

## References

- A. Accardi, A. Bacchetta, W. Melnitchouk, M. Schlegel, *What can break the Wandzura-Wilczek
  relation?*, JHEP 0911 (2009) 093.
- R. Abdul Khalek et al., *Science requirements and detector concepts for the Electron-Ion
  Collider: EIC Yellow Report*, Nucl. Phys. A1026 (2022) 122447, arXiv:2103.05419; Volume II,
  Chapter 7, Section 7.1.5.
- A. Bacchetta, D. Boer, M. Diehl, P. J. Mulders, *Matches and mismatches in the descriptions of
  semi-inclusive processes at low and high transverse momentum*, JHEP 0808 (2008) 023.
- A. Bacchetta, M. Diehl, K. Goeke, A. Metz, P. J. Mulders, M. Schlegel, *Semi-inclusive deep
  inelastic scattering at small transverse momentum*, JHEP 0702 (2007) 093.
- I. I. Balitsky, V. M. Braun, *Evolution equations for QCD string operators*, Nucl. Phys. B311
  (1989) 541.
- G. S. Bali, M. Diehl, B. Gläßle, A. Schäfer, C. Zimmermann, *Double parton distributions in the
  nucleon from lattice QCD*, JHEP 2021, 09 (2021) 106.
- M. Beneke, *Renormalons*, Phys. Rept. 317 (1999) 1.
- B. Blok, Yu. Dokshitzer, L. Frankfurt, M. Strikman, *Perturbative QCD correlations in
  multi-parton collisions*, Eur. Phys. J. C72 (2012) 1963.
- D. Boer, P. J. Mulders, F. Pijlman, *Universality of T-odd effects in single spin and azimuthal
  asymmetries*, Nucl. Phys. B667 (2003) 201.
- V. M. Braun, G. P. Korchemsky, D. Müller, *The uses of conformal symmetry in QCD*, Prog. Part.
  Nucl. Phys. 51 (2003) 311.
- V. M. Braun, A. N. Manashov, B. Pirnay, *Scale dependence of twist-three contributions to single
  spin asymmetries*, Phys. Rev. D80 (2009) 114002.
- H. Burkhardt, W. N. Cottingham, *Sum rules for forward virtual Compton scattering*, Ann. Phys. 56
  (1970) 453.
- M. Diehl, J. R. Gaunt, K. Schönwald, *Double hard scattering without double counting*, JHEP 1706
  (2017) 083.
- M. Diehl, D. Ostermeier, A. Schäfer, *Elements of a theory for multiparton interactions in QCD*,
  JHEP 1203 (2012) 089.
- A. V. Efremov, O. V. Teryaev, *On spin effects in quantum chromodynamics*, Sov. J. Nucl. Phys. 36
  (1982) 140; *QCD asymmetry and polarized hadron structure functions*, Phys. Lett. B150 (1985)
  383.
- R. K. Ellis, W. Furmanski, R. Petronzio, *Unraveling higher twists*, Nucl. Phys. B212 (1983) 29;
  *Power corrections to the parton model in QCD*, Nucl. Phys. B207 (1982) 1.
- J. R. Gaunt, W. J. Stirling, *Double parton distributions incorporating perturbative QCD
  evolution and momentum and quark number sum rules*, JHEP 1003 (2010) 005.
- H. Georgi, H. D. Politzer, *Freedom at moderate energies: masses in color dynamics*, Phys. Rev.
  D14 (1976) 1829.
- R. L. Jaffe, *Spin, twist and hadron structure in deep inelastic processes*, hep-ph/9602236.
- R. L. Jaffe, X.-D. Ji, *Chiral-odd parton distributions and polarized Drell-Yan process*, Phys.
  Rev. Lett. 67 (1991) 552; *Chiral odd parton distributions and Drell-Yan processes*, Nucl. Phys.
  B375 (1992) 527.
- R. L. Jaffe, M. Soldate, *Twist-four in the QCD analysis of leptoproduction*, Phys. Rev. D26
  (1982) 49.
- X. Ji, J.-W. Qiu, W. Vogelsang, F. Yuan, *A unified picture for single transverse-spin asymmetries
  in hard processes*, Phys. Rev. Lett. 97 (2006) 082002.
- G. L. Kane, J. Pumplin, W. Repko, *Transverse quark polarization in large-p_T reactions, e⁺e⁻
  jets, and leptoproduction: a test of QCD*, Phys. Rev. Lett. 41 (1978) 1689.
- Z.-B. Kang, J.-W. Qiu, *Evolution of twist-3 multi-parton correlation functions relevant to single
  transverse-spin asymmetry*, Phys. Rev. D79 (2009) 016003.
- Y. Kanazawa, Y. Koike, A. Metz, D. Pitonyak, M. Schlegel, *Operator constraints for twist-3
  functions and Lorentz invariance properties of twist-3 observables*, Phys. Rev. D93 (2016)
  054024.
- R. Kirschner, *Generalized Lipatov-Altarelli-Parisi equations and jet calculus rules*, Phys. Lett.
  B84 (1979) 266.
- A. V. Manohar, W. J. Waalewijn, *What is double parton scattering?*, Phys. Lett. B713 (2012) 196;
  *A QCD analysis of double parton scattering: color correlations, interference effects and
  evolution*, Phys. Rev. D85 (2012) 114009.
- M. Mekhfi, *Multiparton processes: an application to double Drell-Yan*, Phys. Rev. D32 (1985)
  2371.
- P. J. Mulders, R. D. Tangerman, *The complete tree-level result up to order 1/Q for polarized
  deep-inelastic leptoproduction*, Nucl. Phys. B461 (1996) 197.
- O. Nachtmann, *Positivity constraints for anomalous dimensions*, Nucl. Phys. B63 (1973) 237.
- J.-W. Qiu, G. Sterman, *Power corrections in hadronic scattering. 1. Leading 1/Q² corrections*,
  Nucl. Phys. B378 (1992) 52; *Single transverse spin asymmetries in hadronic pion production*,
  Phys. Rev. D59 (1998) 014004.
- V. P. Shelest, A. M. Snigirev, G. M. Zinovjev, *The multiparton distribution equations in QCD*,
  Phys. Lett. B113 (1982) 325.
- E. V. Shuryak, A. I. Vainshtein, *Theory of power corrections to deep inelastic scattering in
  quantum chromodynamics*, Nucl. Phys. B199 (1982) 451.
- S. Wandzura, F. Wilczek, *Sum rules for spin-dependent electroproduction: test of relativistic
  constituent quarks*, Phys. Lett. B72 (1977) 195.

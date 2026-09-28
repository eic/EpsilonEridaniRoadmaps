# Roadmap: parton structure and form factors of the pion and kaon

The pion and the kaon are the lightest hadrons and the Goldstone bosons of the spontaneously
broken chiral symmetry of QCD. Both facts have mathematical consequences. Being spin zero, their
inclusive electromagnetic structure is carried by two structure functions and no more, and their
elastic electromagnetic structure by a single form factor; being Goldstone bosons, their masses,
their decay constants and the normalisations of their higher-twist distribution amplitudes are
tied to the quark masses and the chiral condensate by relations that no other hadron obeys. This
roadmap develops the parton densities, the light-cone distribution amplitudes, the electromagnetic
and two-photon transition form factors of a pseudoscalar meson, the chiral relations that
constrain them, and the Sullivan process through which a lepton beam reaches a meson target at
all.

The last item is what makes the area a distinct piece of mathematics rather than a special case of
nucleon structure. There is no meson target. Every prospective measurement of meson structure at an
electron-ion collider is a measurement on a nucleon in which a forward baryon is detected and the
struck object is a meson from the nucleon's own virtual meson field, off its mass shell by an
amount the experiment controls but does not remove. Turning such a measurement into a statement
about an on-shell pion requires a flux function that is not an observable, a factorisation
hypothesis that is not a theorem, and an extrapolation in the momentum transfer to the pion pole.
The roadmap's obligation is to make each of those three a named object with stated hypotheses, so
that a theorem about the pion structure function can be read off as depending on them or not.

The mathematical spine is two operators and one analytic structure. The evolution of a
distribution amplitude in the renormalisation scale is a one-parameter semigroup whose generator
is the Efremov-Radyushkin-Brodsky-Lepage kernel, diagonal in the Gegenbauer polynomials of index
3/2; the asymptotic form of the amplitude is the semigroup's unique zero mode. The extraction of a
meson structure function from a measurement with a detected baryon is a Fredholm problem, and the
model dependence of the extraction is the kernel of an operator. The elastic form factor is the
boundary value of a function holomorphic off a cut, so its spectral representation, the uniqueness
of the spectral measure, and the continuation to the pion pole are all statements in complex
analysis rather than in phenomenology.

The final application is a theory of the lightest mesons in which every claimed measurement of
their structure carries its hypotheses with it: a statement of the form "this observable
determines the pion valence distribution" is provable here only with the flux model, the
factorisation hypothesis and the extrapolation domain all named in it, and the roadmap regards
that as the honest form of the claim rather than a weaker one.

## Scope

- The hadronic tensor of a spin-zero target: the reduction to two structure functions, the absence
  of a parity-odd antisymmetric structure for electromagnetic exchange, and the longitudinal
  structure function.
- Parton densities of the pion and kaon: support, the valence and momentum sum rules, the
  non-singlet and singlet combinations of a two-valence-flavour hadron, and scale independence of
  the valence sum rule.
- The exact isospin and charge-conjugation relations among pion densities, the SU(3) flavour
  relations between pion and kaon densities, and the symmetry breaking carried as an explicit
  parameter whose vanishing is the hypothesis of each relation.
- The leading-twist light-cone distribution amplitude of a pseudoscalar meson: its definition as a
  matrix element of a non-local operator, its normalisation by the decay constant, and its
  symmetry under reflection of the light-cone fraction in the isospin limit.
- The Gegenbauer polynomials of index 3/2: recurrence, weighted orthogonality, the weighted
  isometry onto a sequence space, and completeness. These are absent upstream and are built here.
- The ERBL evolution equation as a one-parameter semigroup: the kernel as a dissipative operator on
  a weighted Lebesgue space, the Gegenbauer polynomials as its eigenfunctions, the positivity and
  monotonicity of the anomalous dimensions, and the asymptotic amplitude as the unique zero mode
  and the limit of the semigroup orbit.
- The identification of the ERBL kernel with the restriction of the generalised-distribution
  evolution kernel to the region where the momentum fraction is smaller in modulus than the
  skewness.
- Two-particle and three-particle higher-twist distribution amplitudes of a pseudoscalar meson,
  defined, with their normalisations fixed by the chiral relations of Layer 5.
- The electromagnetic form factor of a spin-zero hadron: uniqueness of the single form factor,
  charge normalisation, the charge radius as its slope at zero momentum transfer, the spectral
  representation off the cut and the uniqueness of the spectral measure.
- The large-momentum-transfer prediction for the form factor as a convolution of two distribution
  amplitudes with a hard kernel, conditional on an explicitly named factorisation hypothesis, and
  the endpoint-integrability condition on the amplitude that the convolution requires.
- The two-photon transition form factor: its definition, the axial-anomaly value at vanishing
  photon virtualities obtained from the one-loop triangle, and the large-virtuality limit fixed by
  the inverse moment of the distribution amplitude.
- The chiral relations: the Gell-Mann-Oakes-Renner relation in its exact form as a derivative with
  respect to the quark mass at the chiral point, and the soft-pion theorems fixing the
  normalisations of the leading-twist and twist-three amplitudes.
- The Sullivan process: kinematics and the two distinct momentum fractions, the meson flux as a
  single named object, the factorisation of the cross section as a named hypothesis, the pion-pole
  extrapolation as an analytic continuation with its domain stated, the Fredholm description of
  what the data do and do not determine, and the same construction for the kaon with the exchanged
  mass explicit.

Not included. The general theory of inclusive structure functions of an arbitrary target, the
completeness of the two-function decomposition and target-mass corrections are
`InclusiveStructureFunctions`; this roadmap uses the decomposition and supplies only the spin-zero
instance. The splitting kernels, the running coupling, the Mellin-moment machinery and the general
solution theory of the DGLAP equation are `CollinearEvolution`; this roadmap uses them and proves
only what is specific to a two-valence-flavour spin-zero hadron and to the ERBL region. The
generalised parton distributions of a spin-zero target, their polynomiality, their
impact-parameter interpretation and the amplitude for deeply virtual meson production are
`GeneralizedPartonDistributions`; the distribution amplitude that enters that amplitude is owned
here, the amplitude itself is not. The energy-momentum tensor form factors, the mass decomposition
and the trace anomaly are `HadronMassAndEnergyMomentumTensor`, including the scalar and
gravitational form factors of the pion. Transverse-momentum-dependent distributions of a meson,
and the Collins-Soper evolution they obey, are `TransverseMomentumDistributions`. Fragmentation
functions producing pions and kaons in the final state are `Hadronization`: a fragmentation
function and a parton density of a meson are different objects and no relation between them is
asserted here. Neutral-current and charged-current exchange on a meson target, for which the
parity-odd antisymmetric structure that Layer 0 excludes is present, is `ElectroweakAndBSM`.
Order-by-order radiative corrections to the coefficient functions, and the resummation of large
logarithms near the endpoints, are `RadiativeCorrections`. Diffractive exchange with vacuum
quantum numbers is `Diffraction`; the Sullivan process is charged-meson exchange with a detected
baryon and is owned here, and the two must not be conflated. Lattice determinations of the
moments of the densities and amplitudes, and of the decay constants, are `LatticeBridge`; this
roadmap states which moments are the objects a lattice computation constrains and proves nothing
about the lattice formulation. Timelike form factors and the phenomenology of the two-pion final
state are not in scope anywhere in the collection: the analytic continuation off the cut is stated
in Layer 3 because the spectral representation requires it, and nothing beyond that is developed.
Chiral perturbation theory as a systematic expansion is not in scope; only the two chiral relations
named in Layer 5 are.

The material belongs under `EpsilonEridani/Particles/Meson/`, in the four subdirectories `Pdf`,
`DistributionAmplitude`, `FormFactor` and `Sullivan`, beside the existing
`EpsilonEridani/Particles/Parton/`. The Gegenbauer polynomials of Layer 2 are mathematics with no
physics content and belong under `EpsilonEridani/Mathematics/SpecialFunctions/Gegenbauer/`,
alongside `EpsilonEridani.Mathematics.OrderedSimplexIntegral`, in the shape TauCeti gives its own
orthogonal-polynomial families so that they can be moved upstream unchanged.

## Conventions and coordination with upstream

1. **A meson is explicit data, not a typeclass.** A pseudoscalar meson is a structure carrying its
   mass, its decay constant, its electric charge in units of the positron charge, and the pair of
   flavour labels of its valence quark and antiquark, with positivity of the mass and the decay
   constant as fields. It is not a typeclass on a flavour type. The trap: the flavour relations of
   Layer 1 relate two different mesons built over the same flavour type, and a typeclass would
   make each of them the unique instance for that type, so the relations could not be stated.
2. **The momentum fractions are three different symbols and never reused.** `x` is the fraction of
   the meson's momentum carried by the struck parton, the first real argument of a density in the
   sense of `EpsilonEridani.Particles.Parton.PDF.Pdf`. `u` is the fraction of the meson's momentum
   carried by the quark in a distribution amplitude, so that the antiquark carries `1 - u`. `xi` is
   the fraction of the parent nucleon's light-cone momentum carried by the exchanged meson in the
   Sullivan process. The Bjorken variable of the measurement is `xBj`, and the relation
   `x = xBj / xi` is a theorem of Layer 6, not a definition. The trap: the literature writes `x`
   for all four, and a proof that silently identifies the parton fraction in the meson with the
   Bjorken variable of the nucleon measurement is off by exactly the factor this convention names.
3. **The decay constant convention is fixed once, and the numerical coefficient of every
   asymptotic formula is stated relative to it.** The decay constant is defined by the axial-current
   matrix element `<0| qbar gamma^mu gamma_5 q |M(P)> = i f_M P^mu`, which is the convention in
   which the charged-pion constant is near 130 MeV rather than near 92 MeV. Every coefficient in
   Layers 3 and 4 is derived from a hard kernel in this convention and never quoted from the
   literature without it. The trap: the two conventions differ by a factor of the square root of
   two, so an asymptotic form factor quoted in the wrong one is wrong by a factor of two.
4. **A distribution amplitude is normalised to unit integral and the decay constant is carried
   separately.** The amplitude of Layer 2 integrates to one over the unit interval at every scale,
   and every physical formula multiplies it by the decay constant explicitly. The trap: absorbing
   the decay constant into the amplitude makes the statement that the normalisation is
   scale-independent false, since the amplitude's zeroth Gegenbauer coefficient is the conserved
   quantity and the decay constant is separately scheme-dependent beyond leading order.
5. **Every density and every amplitude carries its scale as an explicit argument.** There is no
   implicit renormalisation scale anywhere in this roadmap, and no statement is made about an
   object at an unspecified scale. The trap: the sum rules of Layer 1 hold at each scale
   separately, and their scale independence is a theorem with hypotheses, so an object with an
   implicit scale cannot express either statement.
6. **Momentum transfer is `t`, spacelike means `t` negative, and `Q2` is its negative.** The form
   factor of Layer 3 is a function of `t`, holomorphic off the cut on the positive real axis
   starting at the two-pion threshold; the measured region is `t` negative. The charge radius is
   six times the derivative of the form factor with respect to `t` at zero. The trap: writing the
   form factor as a function of `Q2` and then continuing to the pole hides a sign, and the pole sits
   at `t` equal to the meson mass squared, which is positive.
7. **Symmetry relations are stated as conditionals on an explicit breaking parameter.** The isospin
   relations of Layer 1 and the SU(3) relations between pion and kaon are theorems whose hypothesis
   is the vanishing of a named parameter of the data, not approximate equalities. A relation that
   holds only in a symmetry limit is stated at that limit and nowhere else, and no bound on its
   violation away from the limit is claimed.
8. **The chiral limit is a specialisation and never the primary statement.** Every theorem is
   stated for arbitrary meson mass and decay constant, and the chiral limit is the limit of a
   family parameterised by the quark mass. The existence of that limit is a named hypothesis and
   not a theorem. The trap: a formalisation that works in the chiral limit from the start cannot
   state the Gell-Mann-Oakes-Renner relation at all, because that relation is about the derivative
   of the meson mass squared with respect to the quark mass at the chiral point.
9. **The Gegenbauer index is 3/2, the argument is `2u - 1`, and the coefficients are normalised so
   that the zeroth is one.** The leading-twist amplitude is written as six times `u` times `1 - u`
   multiplying a series in the Gegenbauer polynomials of index 3/2 evaluated at `2u - 1`. The trap:
   the index-1/2 and index-1 families are the Legendre and Chebyshev polynomials respectively and
   diagonalise nothing here; only the index-3/2 family diagonalises the ERBL kernel, and the weight
   in the orthogonality relation must match, or the anomalous dimensions come out wrong.
10. **Model dependence is isolated in exactly one object per construction, and named.** The pion
    flux of Layer 6 is a single structure, and no theorem may take a flux and produce a statement
    about meson structure without the flux appearing in its statement. Likewise the hard-scattering
    factorisation of Layer 3 and the Sullivan factorisation of Layer 6 are named hypotheses carried
    in the statements that use them.
11. **No `Prop`-valued field is introduced whose witness is a placeholder.** Where a result is
    unproved it is named as a gap in this document and appears as a `sorry`-ed target, never as a
    structure field discharged by a trivial witness. A hypothesis that a construction genuinely
    takes as input is a field; an obligation the roadmap owes is not.
12. **The convolution of a kernel with a density is the upstream convolution.** All convolutions
    use `EpsilonEridani.QFT.Factorization.Convolution.Basic` and its collinear specialisation, and
    the ERBL kernel is an instance of that kernel type. The trap: an independent convolution
    written here would not be the object the Mellin-moment lemmas of
    `EpsilonEridani.QFT.Factorization.Convolution.Mellin` apply to, and the moment-space
    diagonalisation of Layer 2 would have to be reproved from scratch.

## Existing upstream material used by the roadmap

- `EpsilonEridani.Particles.Parton.PDF.Basic` gives the density type `Pdf`, the support and
  non-negativity lemmas on the unit interval, the Mellin moment, the analytic and physical split of
  the density assumptions, and the momentum and valence sum rules. The meson densities of Layer 1
  are instances of this type and the sum rules are instantiated, not restated.
- `EpsilonEridani.Particles.Parton.PDF.Positivity` and
  `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` fix which positivity statements may be
  asserted. Layer 1 asserts pointwise non-negativity only where the former licenses it, and treats
  the scheme dependence the latter records as a constraint on the statement of the large-`x`
  hypothesis.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` gives the bilinear-form model of the hadronic
  tensor, the transverse metric, the transverse projection of the target momentum, the covariance
  and current-conservation assumptions, and the `F1`/`F2` decomposition predicate. Layer 0 supplies
  the spin-zero instance of these and proves the exclusion of the pseudotensor structure.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal` gives the longitudinal projection, from
  which the longitudinal structure function of a spin-zero target is defined.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` gives the kinematics structure, the hard
  scale, the Bjorken variable, the inelasticity and the hadronic invariant mass;
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` gives the kinematic bounds. Layer 0 and
  Layer 6 use both, and Layer 6 adds only the two variables specific to a detected forward baryon.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic`, `.Collinear` and `.Mellin` give the kernel
  type, the collinear kernel constructor, the convolution and the Mellin transform of a
  convolution. The ERBL kernel of Layer 2 is built with these.
- `EpsilonEridani.QFT.Factorization.Evolution.CollinearForm` and `.MomentSpace` give the DGLAP
  operator in collinear form and its moment-space diagonalisation; `.Solutions` gives the solution
  theory. Layer 1 takes the evolution of the meson densities from these through
  `CollinearEvolution` and proves only the two-valence-flavour decomposition.
- `EpsilonEridani.Particles.Parton.GPD.Basic` gives the generalised-distribution type, its
  assumptions, and the forward-limit bridge to a density at a scale. Layer 1 states the consistency
  of the meson densities with the forward limit of the spin-zero generalised distributions owned by
  `GeneralizedPartonDistributions`, and Layer 2 states the kernel identification against
  `EpsilonEridani.Particles.Parton.GPD.Moments`.
- `EpsilonEridani.QFT.Factorization.Basic` and `EpsilonEridani.QFT.Factorization.Scales.Basic` give
  the factorisation vocabulary and the scale bookkeeping in which the hypotheses of Layers 3 and 6
  are phrased.
- `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.TensorReduction` and
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation` are what Layer 4 uses
  for the one-loop triangle whose non-conservation is the axial anomaly;
  `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` and
  `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.LeviCivita` give the epsilon tensor and its
  contractions, which both Layer 0 and Layer 4 need.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.Dissipative.Hilbert`, `.CauchyProblem.Basic`
  and `.CauchyProblem.Uniqueness` are the home of the ERBL evolution. Layer 2 exhibits the kernel
  as a generator and never reproves existence or uniqueness for the evolution equation.
- `TauCeti.Analysis.InnerProductSpace.HilbertBasis.Basic` and
  `TauCeti.Analysis.InnerProductSpace.GramSchmidtOrtho` are used for the orthogonal expansion of
  Layer 2, and `TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Measure`, `.Moments`,
  `.WeightIsometry` and `.HilbertBasis` are the template its Gegenbauer construction follows file
  by file.
- `TauCeti.Analysis.SpecialFunctions.Beta` and `TauCeti.Analysis.SpecialFunctions.Gamma`, together
  with `Mathlib.Analysis.SpecialFunctions.Gamma.Basic` and
  `Mathlib.Analysis.SpecialFunctions.Gamma.Beta`, give the moments of the asymptotic amplitude in
  closed form.
- `TauCeti.Analysis.Complex.Herglotz`, `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Holomorphic`,
  `.Inversion` and `.Uniqueness`, and `TauCeti.Analysis.Contour.PerWindow.CPV` are the machinery of
  the spectral representation of Layer 3: the representation itself, the recovery of the spectral
  measure, its uniqueness, and the principal value in the dispersion integral.
- `TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank`, `.CompactPerturbation` and `.Index` are the
  home of the extraction problem of Layer 6: the non-uniqueness of an extracted meson structure
  function is a statement about a kernel, and the instability of the pole extrapolation is a
  statement about compactness.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and `TauCeti.Analysis.Distribution.DuBoisReymond` give
  the weak derivative and the vanishing criterion used for the non-local operator definitions of
  Layer 2, and `TauCeti.Analysis.Distribution.TestFunction.Translation` the translation of test
  functions that the light-cone separation requires.
- `TauCeti.Probability.Moments.Basic` gives the moment vocabulary in which the flux normalisation
  of Layer 6 is phrased.
- From Mathlib: `Mathlib.Analysis.InnerProductSpace.Basic` and `Mathlib.Analysis.InnerProductSpace.l2Space`
  for the weighted sequence space of Layer 2; `Mathlib.MeasureTheory.Function.L2Space` and
  `Mathlib.MeasureTheory.Measure.Lebesgue.Basic` for the function space the kernel acts on;
  `Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic` and
  `Mathlib.MeasureTheory.Integral.Bochner.Basic` for the integrals; `Mathlib.Analysis.Analytic.Basic`
  and `Mathlib.Analysis.SpecialFunctions.Complex.Log` for the continuation of Layer 3;
  `Mathlib.Analysis.Calculus.Deriv.Basic` and `Mathlib.Analysis.Calculus.Taylor` for the charge
  radius and the small-mass expansion of Layer 5; `Mathlib.Analysis.Normed.Operator.Compact` for
  the compactness statements of Layer 6; `Mathlib.RingTheory.Polynomial.Chebyshev` as the shape a
  polynomial family is given; `Mathlib.Order.Interval.Set.Basic` for the support conditions.
- **Absent from both Mathlib and TauCeti: the Gegenbauer polynomials, and the Jacobi and Legendre
  families they sit inside.** TauCeti has the Chebyshev family with its weight measure, its moments,
  its weighted isometry and its Hilbert-basis property, and the Hermite family with the same
  apparatus; neither specialises to index 3/2. Layer 2 therefore builds the index-3/2 Gegenbauer
  family here, from the three-term recurrence, in the file-by-file shape of the Chebyshev
  development, and does not wait for it upstream. The completeness statement needs a density
  argument on the weighted space, which is the one part of that development with no Chebyshev
  analogue to copy, and is named as a milestone accordingly.
- **Absent from both: the axial anomaly.** There is no anomaly module in EpsilonEridani and no
  Wess-Zumino-Witten construction anywhere upstream. Layer 4 obtains the anomaly as the
  non-conservation of the one-loop triangle using the dimensional-regularisation and one-loop
  evaluation modules that do exist, and states plainly that this route gives the anomalous
  divergence and the two-photon amplitude but not a regularisation-independence theorem, which is
  named as a gap.
- **Absent from both: Bessel functions, polylogarithms and harmonic sums.** None is needed by this
  roadmap. The impact-parameter transform that would need a Bessel function belongs to
  `GeneralizedPartonDistributions`, and the higher-order coefficient functions that would need
  harmonic sums belong to `RadiativeCorrections`.
- **Absent from TauCeti: any notion of ill-posedness, and any Tikhonov regularisation.** Layer 6
  needs the statement that the pole extrapolation is unstable. It is built here as a compactness
  statement about the continuation operator in the Fredholm vocabulary TauCeti does have, and no
  regularisation theory is developed.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the invariant
  product, `Physlib.Relativity.Tensors.MetricTensor` and
  `Physlib.Relativity.Tensors.Contraction.Basic` for index contraction, and
  `Physlib.Relativity.LorentzGroup.Basic` for the covariance group, with
  `Physlib.Relativity.Fermions.Dirac.GammaMatrices` for the Dirac structure of the form factor.

## Layer 0: the spin-zero target

References: Yellow Report section 7.1.3; Lepage and Brodsky, Phys. Rev. D 22 (1980) 2157, section
II for the spin-zero kinematics.

### 0.1 The hadronic tensor of a spin-zero target

The target is a `DisKinematics` in the sense of
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` whose incoming hadron momentum is the momentum
of a pseudoscalar meson, so that the only vectors available to build the hadronic tensor are the
target momentum and the momentum transfer, and there is no spin vector. Define the spin-zero
hadronic tensor as a bilinear form satisfying the upstream assumption bundle: covariance under the
isometries fixing both momenta, current conservation in both slots, and symmetry.

The theorem of this subsection is that the symmetry field of that bundle is not an extra
assumption for a spin-zero target under parity, but a consequence. Precisely: the space of
Lorentz-covariant rank-two tensors built from the metric, the two available momenta and the
Levi-Civita tensor contains exactly one antisymmetric element up to scale, the contraction of the
Levi-Civita tensor with both momenta, and that element is a pseudotensor. The hadronic tensor of a
parity-even current on a parity-even target is a tensor. Hence the antisymmetric part vanishes.
This needs the Levi-Civita contractions of
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` and the parity behaviour of
the epsilon tensor.

Two corollaries are stated. First, a spin-zero target has no analogue of the polarised structure
functions, and the polarised machinery of `SpinStructure` has no spin-zero instance: this is a
theorem about the absence of an object, not a silence. Second, the exclusion uses parity, so it
fails for neutral-current exchange; the parity-odd structure function of a meson target is
therefore a well-posed object and belongs to `ElectroweakAndBSM`, with the tensor basis this
subsection establishes as its starting point.

### 0.2 Two structure functions and no more

`InclusiveStructureFunctions` owns the theorem that a symmetric, conserved, covariant hadronic
tensor admits the `F1`/`F2` decomposition in the transverse basis, in the form of the upstream
predicate `IsF1F2Decomposition`. This subsection instantiates it for the spin-zero target of 0.1
and proves the two consequences specific to that case: the decomposition's coefficients are
uniquely determined, because the transverse metric and the rank-one form built from the transverse
projection of the target momentum are linearly independent whenever the hard scale and the
transverse projection are non-zero; and the off-diagonal coefficient that a general target would
allow vanishes, which is the upstream spectator lemma applied here.

The definitions of the two structure functions of a meson follow: `F1` and `F2` as the unique
coefficients, with the upstream normalisation of `F2` carrying the inverse of the scalar product of
target momentum and momentum transfer, stated explicitly so that no formula in later layers picks
up a spurious factor.

### 0.3 The longitudinal structure function and positivity

Define the longitudinal structure function of a spin-zero target from the longitudinal projection
of `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal`, and prove the identity expressing it
as the combination of `F1` and `F2` fixed by that projection, with the target mass appearing
through the meson mass.

The positivity statements are then: `F1` is non-negative, and the longitudinal structure function
is non-negative, each as a consequence of positive semidefiniteness of the hadronic tensor
restricted to the physical polarisation subspace, for which
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` supplies the linear algebra. These
are the bounds that make the Callan-Gross relation a statement about a ratio in the unit interval;
the relation itself, being a statement about the leading-order coefficient functions, is
`CollinearEvolution` and is used here rather than proved.

### 0.4 Kinematic domain

State the domain of a meson measurement: the Bjorken variable lies in the half-open unit interval,
the hadronic invariant mass squared is at least the squared meson mass, and the bound relating the
two, all as instances of `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` with the target mass
being the meson mass. The one statement specific to this roadmap is that these bounds are not the
bounds of the measurement in which a meson target is realised: Layer 6 proves that the physical
domain is strictly smaller, and the relation between the two domains is a theorem there.

### Examples

- The charged pion: the spin-zero tensor with the meson mass being the charged-pion mass, its two
  structure functions, and the explicit verification that the pseudotensor coefficient is zero.
- The charged kaon: the same, exhibiting that nothing in Layer 0 depends on the flavour content.
- A counterexample to the parity argument: a target tensor containing the pseudotensor structure
  with non-zero coefficient satisfies covariance, conservation and the kinematic bounds, and fails
  only the parity requirement. This certifies that parity is doing the work and the exclusion is
  not an artefact of the basis.

### Dependencies

`EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`, `.Tensors.Longitudinal`,
`.Kinematics.Basic`, `.Kinematics.Bounds`,
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`,
`EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.LeviCivita`,
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`. From other roadmaps:
`InclusiveStructureFunctions` for the decomposition theorem and for target-mass corrections;
`CollinearEvolution` for the Callan-Gross relation.

---

## Layer 1: parton densities of the pion and kaon

References: Yellow Report section 7.1.3; Conway et al., Phys. Rev. D 39 (1989) 980, for what a
pion density is fitted to; Aicher, Schafer and Vogelsang, Phys. Rev. Lett. 105 (2010) 252003, for
the large-`x` behaviour and why it is a hypothesis.

### 1.1 The pseudoscalar meson as data

Define the pseudoscalar meson structure over a flavour type: mass, decay constant, electric charge,
valence quark label, valence antiquark label, with positivity of mass and decay constant. Define
the three instances the roadmap uses, the charged pion, the neutral pion and the charged kaon, as
data over a three-flavour type, and prove the disjointness of valence content that the flavour
relations of 1.4 will need.

Define separately the flavour-breaking data: a structure carrying the light quark mass difference
and the strange-minus-light mass difference as real parameters — a difference, not a ratio, so
that the SU(3) limit is the proposition that it vanishes — with the isospin limit and the SU(3) limit
as the propositions that one or both vanish. Every relation in 1.3 and 1.4 takes this structure and
one of those propositions as a hypothesis.

### 1.2 Densities, support, sum rules

A meson density is a `Pdf` over the flavour type satisfying the upstream `Assumptions`. From
`EpsilonEridani.Particles.Parton.PDF.Basic` the support statement, the non-negativity on the unit
interval and the integrability of the Mellin moments come for free.

The sum rules are instantiated, not restated: the momentum sum rule over all flavours including the
gluon, and the valence sum rules. What is specific here is the valence charge assignment: for a
meson with valence quark and antiquark labels, the first moment of the difference between the
density of the valence quark flavour and that of its antiquark equals one, and likewise for the
valence antiquark flavour, and the first moment of the corresponding difference for every
non-valence flavour equals zero. Prove that these three statements are consistent with the upstream
`SumRuleAssumptions` bundle, and that together they determine the valence normalisation uniquely.

### 1.3 Isospin and charge conjugation among pion densities

In the isospin limit, prove: the up-quark density in the positive pion equals the down-antiquark
density in the positive pion at every momentum fraction and every scale; the density of any flavour
in the negative pion equals the density of the conjugate flavour in the positive pion, which is
charge conjugation and holds without the isospin hypothesis; and the density of a flavour in the
neutral pion is the arithmetic mean of that flavour's density and its conjugate's density in the
positive pion, which needs both.

Each is stated as an implication from the vanishing of the isospin-breaking parameter of 1.1. The
converse is also a milestone: if the first relation holds at a single scale for a density
satisfying the upstream assumptions, the isospin-breaking parameter need not vanish, so the
relation is necessary and not sufficient. This negative statement is what prevents a later proof
from reading a fitted equality as a symmetry.

### 1.4 Pion and kaon: flavour relations and their breaking

In the SU(3) limit, prove that the up-quark density in the positive kaon equals the up-quark
density in the positive pion, and the strange-antiquark density in the positive kaon equals the
down-antiquark density in the positive pion, at every fraction and scale.

Away from that limit the roadmap makes no claim about the ratio of the two, and says so: the ratio
of the up-quark density in the kaon to that in the pion is not determined by any symmetry, is a
function of the fraction and the scale, and its value is a model input. It is named here as an
input object with its scale dependence constrained by 1.5, and it is not a milestone. The
corresponding statement that the first moment of the ratio is bounded by the valence sum rules
of 1.2 is a milestone, and is the only symmetry-free constraint the roadmap proves on it.

### 1.5 Evolution of a two-valence-flavour hadron

The splitting kernels, the DGLAP operator and its solution theory are `CollinearEvolution`,
reached through `EpsilonEridani.QFT.Factorization.Evolution.CollinearForm`, `.MomentSpace` and
`.Solutions`. What is specific to a meson is the flavour decomposition. Define the singlet
combination, the non-singlet valence combination and the flavour-difference non-singlet
combinations for a two-valence-flavour spin-zero hadron, and prove that the DGLAP operator is
block-diagonal in this basis, with the singlet mixing only with the gluon.

The theorem of this subsection is the scale independence of the valence sum rule: the first Mellin
moment of the valence non-singlet combination is annihilated by the DGLAP operator, because the
first moment of the non-singlet kernel vanishes, and hence the valence normalisation of 1.2 holds
at every scale if it holds at one. This uses the moment-space diagonalisation upstream and the
Mellin lemmas of `EpsilonEridani.QFT.Factorization.Convolution.Mellin`. The analogous statement for
the momentum sum rule requires the second moment of the full singlet-gluon matrix and is proved
alongside, with the gluon density of the meson appearing as an object on the same footing as the
quark densities.

### 1.6 Large-`x` behaviour as a hypothesis

The exponent with which a valence density vanishes as the momentum fraction approaches one is not a
theorem of this roadmap and is not derivable from anything in it. Name it: a density has
large-fraction exponent `beta` at a scale if the density divided by the corresponding power of one
minus the fraction has a positive finite limit. State the counting-rule hypothesis as the
proposition that the pion valence density has exponent two at a fixed reference scale, and state
the two theorems that are provable about it: the exponent is not scale-invariant, and its evolution
under the non-singlet kernel is determined by the leading endpoint behaviour of that kernel; and
the exponent is not fixed by the sum rules, since densities with different exponents satisfy all of
1.2. The hypothesis is labelled a hypothesis in its own name, and no layer of this roadmap assumes
it.

### 1.7 Consistency with the forward limit of generalised distributions

`GeneralizedPartonDistributions` owns the generalised parton distributions of a spin-zero target.
Using `EpsilonEridani.Particles.Parton.GPD.Basic` and its forward-limit bridge, state the
consistency requirement: the meson densities of 1.2 are the forward limit at zero skewness and zero
momentum transfer of those distributions, for the quark and the antiquark bridges separately. This
is a compatibility theorem, not a definition, and its role is to make the two roadmaps' objects the
same object.

### Examples

- The positive pion at a reference scale: a density satisfying all of 1.2, with its valence and
  momentum sum rules verified and its non-singlet decomposition exhibited.
- The neutral pion built from the positive pion by 1.3, with the charge-conjugation symmetry of its
  own densities derived rather than assumed.
- The positive kaon in the SU(3) limit built from the pion densities by 1.4, and the same kaon with
  the breaking parameter non-zero, exhibiting that the sum rules survive and the flavour relations
  do not.
- Two densities with the same first and second moments and different large-fraction exponents,
  certifying the negative statement of 1.6.

### Dependencies

Layer 0 for the structure functions the densities are the coefficient-function convolutions of.
`EpsilonEridani.Particles.Parton.PDF.Basic`, `.PDF.Positivity`, `.PDF.MsbarPositivity`,
`.PDF.Model`, `EpsilonEridani.Particles.Parton.GPD.Basic`,
`EpsilonEridani.QFT.Factorization.Evolution.CollinearForm`, `.MomentSpace`, `.Solutions`,
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`. From other roadmaps: `CollinearEvolution`
for the kernels, the coupling and the solution theory; `GeneralizedPartonDistributions` for the
spin-zero generalised distributions; `LatticeBridge` for which moments are lattice-computable
objects.

---

## Layer 2: light-cone distribution amplitudes and ERBL evolution

References: Efremov and Radyushkin, Phys. Lett. B 94 (1980) 245; Lepage and Brodsky, Phys. Rev. D
22 (1980) 2157; Braun and Filyanov, Z. Phys. C 44 (1989) 157, for the higher-twist amplitudes;
Szego, *Orthogonal Polynomials*, AMS Colloquium Publications 23, chapter IV, for the Gegenbauer
family.

### 2.1 The leading-twist amplitude

Define the leading-twist light-cone distribution amplitude of a pseudoscalar meson as the function
of light-cone fraction and scale appearing in the matrix element of the non-local axial-current
operator at light-like separation between the vacuum and the meson state, with the decay constant
and the meson momentum factored out as in Convention 3, and the Fourier conjugation to the fraction
performed with the weak-derivative and test-function apparatus of
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and
`TauCeti.Analysis.Distribution.TestFunction.Translation`.

The properties that constitute the definition, each a field of the amplitude structure or a
theorem about it: support in the unit interval; unit integral at every scale; and, in the isospin
limit for the pion, invariance under reflection of the fraction about one half. Prove that
reflection invariance is equivalent to the vanishing of every odd Gegenbauer coefficient once 2.4
is available, and state the neutral-pion case where it follows from charge conjugation without the
isospin hypothesis.

The gauge link between the two quark fields is part of the definition. State the requirement that
the amplitude is independent of the path within the light-like class, and that this is what makes
the object well defined; the general theory of the link belongs to
`TransverseMomentumDistributions`, which owns the path dependence, and this roadmap takes the
light-like straight link from there and adds nothing.

### 2.2 The Gegenbauer polynomials of index 3/2

Absent upstream, built here, in the shape of TauCeti's Chebyshev development. The milestones, in
order:

1. The family by three-term recurrence, as a polynomial with real coefficients, with the index
   fixed at 3/2 and the degree as a natural number, together with the closed form of the leading
   coefficient and the parity of the polynomial under negation of its argument.
2. The weight measure on the closed interval from minus one to one, being one minus the square of
   the argument, as a finite measure, following
   `TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Measure`.
3. Orthogonality with respect to that measure, and the closed form of the squared norm, which is a
   ratio of Gamma functions and uses `TauCeti.Analysis.SpecialFunctions.Gamma` and
   `TauCeti.Analysis.SpecialFunctions.Beta`.
4. The moments of the family against the weight, following the Chebyshev `Moments` file, which is
   what the sum rules of later layers are read off from.
5. The weighted isometry from the weighted Lebesgue space onto the square-summable sequence space,
   following `.WeightIsometry` and using `Mathlib.Analysis.InnerProductSpace.l2Space`.
6. Completeness: the family is a Hilbert basis of the weighted space, following `.HilbertBasis`.
   This is the one step with no Chebyshev shortcut, because the Chebyshev proof there goes through
   the cosine substitution and the Fourier basis, which has no index-3/2 analogue. The route taken
   here is polynomial density in the weighted space via
   `TauCeti.Analysis.InnerProductSpace.GramSchmidtOrtho` and the finiteness of the weight measure;
   the milestone is stated with that route named, and it is the hardest single result in the layer.

The change of variable from the fraction in the unit interval to the argument in the symmetric
interval, and the transported weight being the product of the fraction and one minus the fraction,
is a separate definition with its own isometry lemma, so that no later proof carries a Jacobian by
hand.

### 2.3 The ERBL kernel as the generator of a semigroup

Define the ERBL kernel as an instance of the upstream kernel type of
`EpsilonEridani.QFT.Factorization.Convolution.Basic`, acting on functions of the light-cone
fraction, with its two-region structure and its plus-prescription endpoint subtraction made
explicit rather than implicit. The evolution equation is the statement that the derivative of the
amplitude with respect to the logarithm of the scale is the coupling times the convolution of the
kernel with the amplitude.

The milestones:

1. The kernel defines a densely defined operator on the weighted Lebesgue space of 2.2, and the
   plus prescription is exactly what makes the constant function a zero mode of the operator, hence
   what makes the unit-integral normalisation of 2.1 preserved.
2. The operator is dissipative on that space, in the sense of
   `TauCeti.Analysis.Semigroups.Dissipative.Hilbert`.
3. Hence it generates a one-parameter semigroup, and the evolution equation has a unique solution
   for each initial amplitude, by `TauCeti.Analysis.Semigroups.Generator` and
   `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`. Existence and uniqueness are not
   reproved: the content of this milestone is exhibiting the kernel as a generator in the sense
   those files require.
4. The semigroup preserves the unit integral, the support, and reflection invariance, each being a
   closed subspace invariant under the generator.

### 2.4 Diagonalisation and the asymptotic amplitude

The milestones:

1. Each Gegenbauer polynomial of index 3/2, multiplied by the weight, is an eigenfunction of the
   ERBL operator, with eigenvalue the negative of the corresponding anomalous dimension. This is
   the central computation of the layer.
2. The zeroth anomalous dimension vanishes and every later one is strictly positive and strictly
   increasing in the degree. The positivity is what the asymptotic statement needs and is proved
   here, not assumed.
3. The Gegenbauer coefficients of an amplitude, defined by the isometry of 2.2, evolve
   independently, each as a power of the coupling ratio with exponent fixed by its anomalous
   dimension, at leading logarithmic order. The precise statement carries the order it holds to;
   the next order mixes coefficients and belongs to `RadiativeCorrections`.
4. The asymptotic amplitude, six times the fraction times one minus the fraction, is the unique
   unit-integral zero mode of the ERBL operator, and the semigroup orbit of any initial amplitude
   in the weighted space converges to it in the norm of that space as the scale logarithm grows.
   Convergence is in the weighted norm; pointwise convergence is not claimed and is not needed by
   any later layer.
5. The moments of the asymptotic amplitude in closed form as ratios of Beta functions, including
   the inverse first moment, which is what Layers 3 and 4 evaluate their asymptotic formulae on.

### 2.5 The ERBL kernel and the generalised-distribution kernel

`GeneralizedPartonDistributions` owns the evolution kernel of a generalised parton distribution,
which acts on a function of momentum fraction, skewness and momentum transfer. State and prove the
identification: restricted to the region where the momentum fraction is smaller in modulus than the
skewness, and rewritten in the light-cone fraction of 2.1 by the affine change of variable that
maps that region onto the unit interval, that kernel is the ERBL kernel of 2.3. The statement is
owned here because it is a statement about this roadmap's kernel; the object on the other side is
imported, and `EpsilonEridani.Particles.Parton.GPD.Moments` supplies the moment structure the two
sides are compared in.

A corollary worth stating separately: the anomalous dimensions of 2.4 are therefore the
eigenvalues of the generalised-distribution kernel in that region, so the two roadmaps cannot
assign different spectra to the same operator.

### 2.6 Higher-twist amplitudes

Define the two twist-three two-particle amplitudes and the twist-three three-particle amplitude of a
pseudoscalar meson, each as a matrix element of the corresponding non-local operator, with support
conditions: the two-particle amplitudes on the unit interval, the three-particle amplitude on the
two-dimensional simplex, for which `EpsilonEridani.Mathematics.OrderedSimplexIntegral` supplies the
integration. Prove the equations of motion relating the two-particle and three-particle amplitudes,
which is what makes the set non-redundant, and state which of the amplitudes are independent.

Their normalisations are not fixed here. They are fixed by the chiral relations of Layer 5, and the
cross-reference is explicit in both directions: this subsection defines objects whose
normalisations Layer 5 supplies, and states that until 5.2 is available the twist-three amplitudes
are normalised only up to a single constant each.

### Examples

- The asymptotic amplitude: unit integral, reflection invariance, every Gegenbauer coefficient
  beyond the zeroth vanishing, and its inverse first moment equal to three.
- A two-term amplitude with a non-zero second Gegenbauer coefficient: its evolution computed
  explicitly at leading logarithmic order, converging to the asymptotic form.
- A flat amplitude on the unit interval: unit integral, in the weighted space, and with divergent
  inverse first moment. This is the example that certifies the endpoint hypothesis of Layer 3 is
  not vacuous.
- The neutral pion's amplitude: reflection invariance from charge conjugation alone, without the
  isospin hypothesis.

### Dependencies

Layer 1 for the meson data and the flavour-breaking parameters.
`EpsilonEridani.QFT.Factorization.Convolution.Basic`, `.Collinear`, `.Mellin`,
`EpsilonEridani.Particles.Parton.GPD.Moments`,
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`, `TauCeti.Analysis.Semigroups.Defs`,
`.Generator`, `.Dissipative.Hilbert`, `.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness`,
`TauCeti.Analysis.InnerProductSpace.HilbertBasis.Basic`, `.GramSchmidtOrtho`,
`TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Measure`, `.Moments`,
`.WeightIsometry`, `.HilbertBasis` as the template, `TauCeti.Analysis.SpecialFunctions.Beta`,
`TauCeti.Analysis.SpecialFunctions.Gamma`, `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`,
`TauCeti.Analysis.Distribution.TestFunction.Translation`,
`TauCeti.Analysis.Distribution.DuBoisReymond`,
`Mathlib.Analysis.InnerProductSpace.Basic`, `Mathlib.Analysis.InnerProductSpace.l2Space`,
`Mathlib.MeasureTheory.Function.L2Space`. From other roadmaps: `CollinearEvolution` for the
coupling and the leading-logarithmic bookkeeping; `GeneralizedPartonDistributions` for the kernel
of 2.5; `TransverseMomentumDistributions` for the gauge link; `RadiativeCorrections` for the order
beyond leading logarithmic.

---

## Layer 3: the electromagnetic form factor

References: Farrar and Jackson, Phys. Rev. Lett. 43 (1979) 246; Lepage and Brodsky, Phys. Rev. D 22
(1980) 2157, section V; Amendolia et al., Nucl. Phys. B 277 (1986) 168, for what a charge radius is
measured as; Holt and Roberts, Rev. Mod. Phys. 82 (2010) 2991.

### 3.1 One form factor, and its normalisation

Define the elastic electromagnetic current matrix element of a spin-zero hadron between states of
equal mass, and prove that Lorentz covariance and current conservation leave exactly one scalar
function of the invariant momentum transfer: the structure proportional to the sum of the momenta,
with the difference structure annihilated by conservation because the two states have equal mass.
State the equal-mass hypothesis explicitly, because it is what fails for the transition form factor
of Layer 4.

Prove the normalisation at zero momentum transfer: the form factor equals the meson's electric
charge, as a consequence of the current's charge operator acting on the state. The hypothesis is
the Ward identity for the electromagnetic current, which is imported from
`EpsilonEridani.QFT.QCD.Renormalization` vocabulary rather than reproved.

### 3.2 The charge radius

Define the charge radius squared of a spin-zero hadron as six times the derivative of the form
factor with respect to the invariant momentum transfer at zero, with the sign convention of
Convention 6, and prove that it is the second moment of the charge distribution under the
hypothesis that the spectral representation of 3.3 exists with an integrable second moment. The
differentiability hypothesis is separate and named: a form factor differentiable at zero is a
hypothesis on the data, satisfied by anything with the representation of 3.3 whose spectral measure
has finite first moment, and the implication is a milestone.

### 3.3 Analytic structure and the spectral representation

The milestones:

1. The form factor extends to a function holomorphic on the complement of the cut along the real
   axis from the two-pion threshold to infinity. This is a hypothesis on the data, named
   `HasElasticCut`, not a theorem of this roadmap: deriving it requires the analyticity of the
   amplitude, which no roadmap in this collection owns. It is stated as a hypothesis wherever used.
2. Under that hypothesis together with a boundedness condition, the once-subtracted spectral
   representation: the form factor equals its value at zero plus the momentum transfer times a
   principal-value integral of the discontinuity over the cut, using
   `TauCeti.Analysis.Contour.PerWindow.CPV`.
3. The spectral measure is unique, by `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Uniqueness`,
   and is recovered from the form factor by Stieltjes inversion, by `.Inversion`. Hence a statement
   about a resonance in the spectral function is a statement about the measure and is equivalent to
   a statement about the form factor; the two are not independent claims.
4. If the discontinuity is non-negative on the whole cut, the form factor restricted to the
   spacelike axis is monotone and its derivatives alternate in sign, which is the Herglotz
   structure of `TauCeti.Analysis.Complex.Herglotz` together with
   `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Holomorphic`. Non-negativity of the discontinuity
   is itself a hypothesis and is stated as one.

### 3.4 The large-momentum-transfer prediction

Name the hypothesis: hard-scattering factorisation for the elastic form factor holds if, at large
spacelike momentum transfer, the form factor equals the double convolution of two leading-twist
amplitudes of 2.1 with a hard kernel, up to a remainder suppressed by a further power of the
momentum transfer, with the amplitudes evaluated at a factorisation scale in the sense of
`EpsilonEridani.QFT.Factorization.Scales.Basic`. This is a hypothesis. It is not proved here, it is
not proved anywhere in this collection, and every statement in this subsection carries it.

The milestones under that hypothesis:

1. The leading-order hard kernel, computed from the one-gluon-exchange diagrams, as an explicit
   rational function of the two light-cone fractions and the charges of the valence flavours.
2. The convolution converges if and only if each amplitude vanishes at both endpoints fast enough
   for its inverse first moment to be finite; and the explicit statement that for an amplitude not
   vanishing at the endpoints, such as the flat example of Layer 2, the convolution diverges. This
   is why the endpoint condition is a hypothesis of the formula and not a side remark.
3. Evaluating the convolution: the momentum transfer times the form factor tends to a constant, and
   that constant is the coupling at the scale, times the squared decay constant, times the squared
   inverse first moment of the amplitude, times the rational coefficient the kernel of item 1
   produces, which for the charged pion is sixteen pi over nine in the convention of Convention 3.
   The coefficient is derived from the kernel; it is not quoted.
4. Specialising to the asymptotic amplitude of 2.4, whose inverse first moment is three, the
   constant is sixteen pi times the coupling times the squared decay constant. The kaon case is the
   same formula with the kaon's decay constant and valence charges, and the SU(3)-breaking parameter
   of 1.1 entering only through those.

### 3.5 What the spacelike data determine

The form factor measured on a bounded subinterval of the spacelike axis does not determine the
spectral measure of 3.3: two spectral measures agreeing to arbitrary accuracy on the subinterval
can differ. State this as the non-injectivity of the restriction of the representation operator,
using `TauCeti.Analysis.Fredholm.FiniteRank` and `Mathlib.Analysis.Normed.Operator.Compact`, and
state the positive companion: the spectral measure is determined by the form factor on any set with
a limit point in the domain of holomorphy, by the identity theorem of
`Mathlib.Analysis.Analytic.Basic`. Both are needed, and the pair of them is what Layer 6 reuses for
the pole extrapolation.

### Examples

- A single-pole form factor: normalisation at zero, charge radius, spectral measure a point mass,
  Herglotz structure verified, and the momentum transfer times the form factor tending to a
  constant, so that the asymptotic behaviour of 3.4 is exhibited by an object with no distribution
  amplitude in it at all.
- The asymptotic prediction for the charged pion with the asymptotic amplitude, with the numerical
  coefficient traced back to the hard kernel.
- The charged kaon in the SU(3) limit, where the ratio of kaon to pion asymptotics is the squared
  ratio of decay constants, and away from it, where it is not.
- A flat amplitude, exhibiting the divergence of item 2 of 3.4.

### Dependencies

Layer 1 for the meson data, Layer 2 for the amplitudes and their inverse moments.
`EpsilonEridani.QFT.Factorization.Basic`, `.Scales.Basic`, `.Convolution.Basic`,
`EpsilonEridani.QFT.QCD.Renormalization`, `TauCeti.Analysis.Contour.PerWindow.CPV`,
`TauCeti.Analysis.Complex.Herglotz`,
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Holomorphic`, `.Inversion`, `.Uniqueness`,
`TauCeti.Analysis.Fredholm.FiniteRank`, `Mathlib.Analysis.Analytic.Basic`,
`Mathlib.Analysis.Calculus.Deriv.Basic`, `Mathlib.Analysis.Normed.Operator.Compact`,
`Mathlib.Analysis.SpecialFunctions.Complex.Log`. From other roadmaps: `RadiativeCorrections` for
the order beyond the leading hard kernel; `HadronMassAndEnergyMomentumTensor` for the scalar and
gravitational form factors, which are not touched here; `LatticeBridge` for the form factor as a
lattice-computable object.

---

## Layer 4: the two-photon transition form factor

References: Adler, Phys. Rev. 177 (1969) 2426; Bell and Jackiw, Nuovo Cimento A 60 (1969) 47;
Brodsky and Lepage, Phys. Rev. D 24 (1981) 1808.

### 4.1 Definition

Define the transition form factor of a neutral pseudoscalar meson to two photons as the scalar
function of the two photon virtualities multiplying the Levi-Civita structure in the correlator of
two electromagnetic currents between the vacuum and the meson state. The Levi-Civita structure is
the one Layer 0 excluded for the elastic tensor: the exclusion there used equal parity of initial
and final state, and here the initial state is the vacuum and the meson is a pseudoscalar, so the
structure is required rather than forbidden. Prove that it is the unique available structure, which
needs the epsilon contractions of
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`.

### 4.2 The anomaly value at vanishing virtualities

The milestones:

1. The one-loop triangle with one axial and two vector vertices, evaluated in dimensional
   regularisation using
   `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.TensorReduction` and
   `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation`, and the resulting
   non-conservation of the axial current: the divergence of the axial-vector vertex is not zero in
   the massless-quark limit but equals the anomalous term proportional to the contraction of two
   field strengths.
2. The transition form factor at both virtualities zero, obtained from item 1 together with the
   axial-current matrix element defining the decay constant: it equals the reciprocal of four pi
   squared times the decay constant, in the convention of Convention 3, times the charge factor of
   the valence content.
3. The scheme statement, which is a gap and is named as one: item 1 gives the anomalous divergence
   in one regularisation, and the roadmap does not prove that the result is independent of the
   regularisation, because no scheme-independence apparatus exists upstream. The result of item 2 is
   therefore stated with its regularisation as a hypothesis. Constructing the effective
   Wess-Zumino-Witten description in which the anomaly is a topological statement is not in scope
   anywhere in this collection, and the gap is recorded here rather than concealed.

### 4.3 The large-virtuality limit

At one large spacelike virtuality and the other zero, the transition form factor times the
virtuality tends to two thirds of the decay constant times the inverse first moment of the
leading-twist amplitude of 2.1, under the same kind of factorisation hypothesis as 3.4 but with a
single amplitude rather than two, so that the hard kernel is the leading-order quark propagator and
the convolution is single rather than double. Specialising to the asymptotic amplitude gives twice
the decay constant.

This is the cleanest constraint on the amplitude anywhere in the roadmap, because the observable is
linear in the amplitude rather than quadratic: state and prove that linearity, and state the
consequence, that the large-virtuality limit determines the inverse first moment of the amplitude
and nothing else about it. The inverse problem of recovering the amplitude from the form factor at
all virtualities is a Fredholm problem with the kernel of 4.3 and belongs to the same treatment as
Layer 6; state it as the identification that the map from amplitude to transition form factor is
injective on the weighted space but does not have bounded inverse, which is the precise sense in
which the extraction is unstable, using `TauCeti.Analysis.Fredholm.Criteria` and
`.CompactPerturbation`.

### 4.4 Interpolation between the two limits is a model

The single formula interpolating the anomaly value of 4.2 and the asymptotic limit of 4.3 is a
model, not a theorem, and is named as a model. What the roadmap proves about it is only what
follows from the two endpoints: any continuous interpolant with the two stated limits agrees with
the model at both ends, so agreement with the model at an intermediate virtuality is not evidence
for the model. This negative statement is the content of the subsection.

### Examples

- The neutral pion: the anomaly value with its charge factor, and the asymptotic limit with the
  asymptotic amplitude, both explicit.
- An amplitude with non-zero second Gegenbauer coefficient: the large-virtuality limit shifts, and
  the shift is computed, exhibiting the linearity of 4.3.
- Two distinct amplitudes with the same inverse first moment and the same large-virtuality limit,
  certifying the second statement of 4.3.

### Dependencies

Layer 2 for the amplitude and its inverse moment, Layer 3 for the factorisation vocabulary and the
analytic machinery. `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`,
`.TensorReduction`, `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation`,
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`,
`TauCeti.Analysis.Fredholm.Criteria`, `.CompactPerturbation`. From other roadmaps:
`RadiativeCorrections` for higher orders in the hard kernel; `Photoproduction` for the real-photon
kinematics, which is used and not developed here.

---

## Layer 5: chiral constraints

References: Gell-Mann, Oakes and Renner, Phys. Rev. 175 (1968) 2195; Ball, Braun, Koike and Tanaka,
Nucl. Phys. B 529 (1998) 323, for the twist-three normalisations.

### 5.1 The Gell-Mann-Oakes-Renner relation, stated exactly

The relation is about a family, not a point. Define a chiral family: a map from a non-negative quark
mass parameter to meson data, with the meson mass squared and the decay constant as functions of
that parameter, together with the condensate as the value at zero of a further function. Name the
hypothesis `HasChiralLimit`: the family extends continuously to zero and the mass squared is
differentiable there. This is a hypothesis about the family and is not proved.

The Gell-Mann-Oakes-Renner relation is then the exact statement that the derivative of the meson
mass squared with respect to the quark mass parameter at zero equals minus twice the condensate
divided by the squared decay constant at zero. Prove the equivalence of this statement with the
usual quoted form for a family in which the mass squared is analytic at zero: the quoted form is
the first-order Taylor statement, and the error term is second order, by
`Mathlib.Analysis.Calculus.Taylor`.

The trap this avoids is stated as a theorem: the quoted form read as an equation between numbers at
the physical quark mass is not implied by the derivative statement, and two families with the same
derivative at zero can give different values at any fixed positive mass. No roadmap statement uses
the quoted form.

### 5.2 Soft-pion theorems and the twist-three normalisations

Name the hypothesis: the chiral Ward identity for the axial current, as a relation between the
divergence of the axial current inserted in a correlator and the commutator of the axial charge with
the remaining operators. It is imported as a hypothesis, since the operator formalism that would
prove it is not available upstream.

Under it, prove the soft-pion relations the roadmap needs:

1. The leading-twist amplitude's normalisation: the unit integral of 2.1 is equivalent to the
   axial-current matrix element defining the decay constant, so the normalisation convention of
   Convention 4 is not a choice but the content of the soft-pion limit.
2. The normalisation of the twist-three two-particle amplitudes of 2.6: the constant left free
   there equals the meson mass squared divided by the sum of the two valence quark masses, and by
   5.1 that quantity has a finite chiral limit equal to minus twice the condensate over the squared
   decay constant. This is the statement that closes 2.6, and it is the reason the twist-three
   normalisation does not vanish in the chiral limit even though the meson mass does.
3. The three-particle amplitude's normalisation, fixed by the equations of motion of 2.6 together
   with items 1 and 2, with the independent constant that remains after those relations identified
   explicitly, so the count of free normalisations in 2.6 is closed rather than left open.

### 5.3 The chiral limit as a specialisation

State the specialisation discipline as theorems rather than as style. For each of the principal
objects of Layers 1 to 4, state the chiral-limit statement as the limit along a chiral family under
`HasChiralLimit`, and prove that the general statement specialises to it: the sum rules of 1.2 are
mass-independent and specialise trivially; the ERBL spectrum of 2.4 is mass-independent, because the
kernel contains no mass; the form-factor normalisation of 3.1 is mass-independent, but the position
of the cut in 3.3 is not, and the two-pion threshold going to zero in the chiral limit is a
statement about the analytic structure that must be stated rather than passed over; the anomaly
value of 4.2 diverges as the decay constant's chiral limit is approached only if the decay constant
vanishes there, and the hypothesis that it does not is part of `HasChiralLimit`.

The threshold statement is the substantive one, and is where a chiral-limit-first formalisation
would have gone wrong: in the chiral limit the form factor of 3.3 is holomorphic only off a cut
reaching the origin, so the subtracted representation and the charge radius of 3.2 need the
positive-mass family and cannot be stated at the limit.

### Examples

- A chiral family with mass squared linear in the quark mass: the relation of 5.1 holds and the
  quoted form holds exactly.
- A chiral family with a quadratic correction: the relation of 5.1 holds, the quoted form fails at
  positive mass, and the failure is computed. This is the certificate for the trap theorem.
- The twist-three normalisation of the charged pion at positive mass and its finite chiral limit,
  exhibiting the cancellation of 5.2 item 2.

### Dependencies

Layers 1 and 2 for the meson data and the amplitudes, Layer 3 for the analytic structure that 5.3
specialises, Layer 4 for the anomaly value. `Mathlib.Analysis.Calculus.Taylor`,
`Mathlib.Analysis.Calculus.Deriv.Basic`, `Mathlib.Analysis.SpecialFunctions.Log.Basic`. From other
roadmaps: `HadronMassAndEnergyMomentumTensor` for the condensate as an object in the mass
decomposition, which is imported and not developed here; `LatticeBridge` for the condensate and the
decay constant as lattice-computable objects.

---

## Layer 6: the Sullivan process

References: Sullivan, Phys. Rev. D 5 (1972) 1732; Thomas, Phys. Lett. B 126 (1983) 97; Holtmann,
Szczurek and Speth, Nucl. Phys. A 596 (1996) 631; Aguilar et al., Eur. Phys. J. A 55 (2019) 190;
Arrington et al., J. Phys. G 48 (2021) 075106; Yellow Report sections 7.1.3 and 7.2.1.

### 6.1 Kinematics with a detected forward baryon

Extend the inclusive kinematics of Layer 0 with the detected baryon: the process is lepton on
nucleon producing a lepton, a baryon and an unobserved remainder, and the new data are the baryon
momentum and the invariant momentum transfer from nucleon to baryon. Define the meson light-cone
momentum fraction as one minus the ratio of the baryon's light-cone momentum to the nucleon's, and
prove that it lies in the unit interval on the physical domain.

The theorem that fixes Convention 2 is here: the momentum fraction of the struck parton within the
meson equals the Bjorken variable of the measurement divided by the meson momentum fraction, in the
limit in which the meson is treated as on shell, and the exact relation carries a correction in the
momentum transfer which is given explicitly. Prove also the domain statement promised in 0.4: the
accessible region in the parton fraction and the hard scale is strictly smaller than the inclusive
region, and the boundary is given by the minimum momentum transfer at fixed meson fraction, which is
an explicit function of the nucleon, baryon and meson masses.

### 6.2 The flux, as one object

Define the meson flux as a structure over the meson and baryon data: a function of the meson
momentum fraction and the invariant momentum transfer, with non-negativity, support in the physical
domain, and integrability against the measure on that domain as fields, and its integral over the
momentum transfer at fixed fraction as a derived function. `TauCeti.Probability.Moments.Basic`
supplies the moment vocabulary for its normalisation.

The discipline of Convention 10 is enforced by the shape of the layer: no theorem after this
subsection produces a statement about a meson structure function from a cross section without the
flux appearing in it. State the two classes of statement explicitly, and prove the separating
result: a ratio of cross sections at the same meson fraction and momentum transfer and different
hard scales is flux-independent, and a ratio at different meson fractions is not; hence the scale
dependence of the meson structure function is accessible without the flux model and its
normalisation is not.

### 6.3 The factorisation hypothesis

Name it: Sullivan factorisation holds for given data if the differential cross section equals the
flux of 6.2 times the on-shell meson structure function of Layer 0 evaluated at the parton fraction
of 6.1 and the hard scale, up to a remainder. It is a hypothesis. State what is known about it
inside this roadmap, which is only structural: the remainder cannot vanish identically because the
exchanged meson is off shell by an amount at least the minimum momentum transfer of 6.1, and the
structure function of Layer 0 is defined for an on-shell meson; so the hypothesis is an assertion
about the size of an off-shellness correction and is stated with that correction named.

Prove the consistency conditions that a factorising pair must satisfy, which are the roadmap's
substantive content here: the sum rules of 1.2 applied to the extracted structure function constrain
the flux normalisation, and the evolution of 1.5 applied to the extracted structure function must
reproduce the scale dependence of the measured cross section at fixed meson fraction. Both are
necessary conditions on the pair consisting of a flux and a structure function, and both are
checkable without resolving the hypothesis.

### 6.4 What the data determine: the extraction as a Fredholm problem

Define the extraction operator: the map sending a meson structure function to the cross section, at
fixed hard scale, being the integral against the flux over the momentum transfer and the meson
fraction subject to the relation of 6.1. The milestones:

1. The operator is bounded on the appropriate function space and compact, using
   `Mathlib.Analysis.Normed.Operator.Compact`.
2. Its kernel characterises the non-uniqueness of the extraction exactly:
   two structure functions give the same cross section on the measured domain if and only if their
   difference lies in that kernel, by `TauCeti.Analysis.Fredholm.Criteria`.
3. The kernel is non-trivial when the measured domain in the meson fraction is a proper
   subinterval, and the explicit construction of a non-zero element of it, which is the theorem
   that makes the non-uniqueness concrete rather than abstract.
4. Perturbing the flux within a family perturbs the operator compactly, so the Fredholm index is
   stable, by `TauCeti.Analysis.Fredholm.CompactPerturbation` and `.Index`; hence the dimension of
   the ambiguity is a property of the measured domain rather than of the flux model.

The notion of ill-posedness this needs is absent from TauCeti, as recorded above. It is built here
as the statement that the extraction operator is compact with dense range and therefore has
unbounded inverse on its range, which is the Fredholm-vocabulary form of the statement and is the
shape TauCeti would want.

### 6.5 The pion-pole extrapolation

The amplitude, as a function of the invariant momentum transfer at fixed remaining kinematics, has
a pole at the momentum transfer equal to the squared meson mass, with residue proportional to the
squared decay constant times the on-shell meson structure function. State that as a hypothesis,
`HasMesonPole`, since it is an analyticity statement of the same kind as `HasElasticCut` in 3.3 and
is no more provable here.

Under it, the milestones:

1. The extrapolation is the analytic continuation from the measured region, where the momentum
   transfer is negative, to the pole, where it is positive, and the residue is the object extracted.
2. Uniqueness: the continuation is unique, by the identity theorem, provided the measured set has a
   limit point in a domain of holomorphy containing both the measured region and a punctured
   neighbourhood of the pole. This is the positive statement, and it is exactly the positive
   statement of 3.5 reused.
3. Instability: the continuation operator from the measured interval to the residue is unbounded
   with respect to the supremum norm on the measured interval, so data of finite precision do not
   determine the residue. Prove this as the companion to item 2, using the compactness statement of
   6.4, and state the pair together: the extrapolation is determined in principle and not determined
   in practice, and both halves are theorems.
4. The quantitative dependence on the lever arm: for a family of amplitudes holomorphic and bounded
   on a fixed domain containing the measured interval and the pole, the bound on the extrapolation
   error grows with the distance from the measured interval to the pole, by a two-constants estimate
   on the domain. The statement is proved for the stated bounded family; no bound is claimed without
   such a family, and the absence of an unconditional bound is stated.

### 6.6 The kaon case

Repeat 6.1 to 6.5 for kaon exchange with a detected strange baryon. Everything is the same
construction with the meson and baryon data changed, so the milestones are the instantiations, and
the one theorem specific to the kaon is the comparison: the minimum momentum transfer at fixed meson
fraction is larger and the distance from the measured region to the pole is greater, so the
error bound of 6.5 item 4 is weaker for the kaon than for the pion at equal measured domain and
equal holomorphy domain. Prove that comparison, with the mass dependence explicit, and state that
this is the precise sense in which kaon structure is harder to extract than pion structure.

### 6.7 Where the exclusive route belongs

Deeply virtual meson production gives a second route to the distribution amplitude of Layer 2, and
its amplitude is owned by `GeneralizedPartonDistributions` through
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Basic` and `.Channels`. State the interface as a
theorem shape rather than restating that roadmap: the distribution amplitude appearing in the
production amplitude is the object of 2.1, with the same normalisation and the same evolution, and
the deconvolution ambiguity of
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness` is a statement about the
generalised distribution and not about the amplitude. That distinction is the whole of the
interface, and it is stated here because a reader of this roadmap will otherwise expect the
exclusive route to be developed here.

### Examples

- The positive pion with a detected neutron: kinematics, the two momentum fractions, the physical
  domain, and the minimum momentum transfer as an explicit function of the masses.
- A flux with support on a subinterval of the meson fraction, together with an explicit non-zero
  element of the extraction kernel of 6.4, exhibiting the non-uniqueness.
- Two fluxes differing by a compact perturbation, with the same ambiguity dimension, certifying
  6.4 item 4.
- The positive kaon with a detected Lambda, with the lever-arm comparison of 6.6 computed for the
  same measured domain as the pion example.

### Dependencies

Layers 0 and 1 for the on-shell meson structure functions and their sum rules and evolution, Layer
3 for the analytic machinery reused in 6.5, Layer 5 for the decay constants appearing in the
residue. `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, `.Kinematics.Bounds`,
`.Kinematics.AccessMethods`, `EpsilonEridani.QFT.Scattering.DIS.CrossSection`,
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic`, `.Exclusive.DVMP.Basic`,
`.Exclusive.DVMP.Channels`, `.Exclusive.Deconvolution.Uniqueness`,
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`,
`TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank`, `.CompactPerturbation`, `.Index`,
`TauCeti.Probability.Moments.Basic`, `Mathlib.Analysis.Normed.Operator.Compact`,
`Mathlib.Analysis.Analytic.Basic`. From other roadmaps: `Diffraction` for vacuum-quantum-number
exchange, which this layer must not be confused with and does not use;
`GeneralizedPartonDistributions` for the exclusive amplitude of 6.7; `LightNuclei` for the
short-range structure of the nucleon's meson field, which is not used here and does not constrain
the flux of 6.2.

---

## Dependency graph

```
Layer 0  spin-zero target
   |          \
   |           \
Layer 1  densities     Layer 2  distribution amplitudes and ERBL
   |                      |    \
   |                      |     \
   |                   Layer 3   Layer 4
   |               form factor   transition form factor
   |                      |     /
   |                   Layer 5  chiral constraints
   |                      |
   +----------------------+
              |
           Layer 6  Sullivan process
```

Layer 0 is the only layer with no dependency inside this roadmap. Layers 1 and 2 are independent of
each other and both rest on Layer 0, Layer 1 for the structure functions its densities are the
convolutions of and Layer 2 for the meson data and the spin-zero kinematics. Layer 3 rests on
Layer 2 for the amplitudes and on Layer 1 for the meson data; Layer 4 rests on Layer 2 and on Layer
3's factorisation and analytic vocabulary. Layer 5 rests on Layers 2, 3 and 4, because it supplies
the normalisations Layer 2 leaves open and specialises Layers 3 and 4 to the chiral limit, and this
is a genuine cycle in the informal reading which is broken in the formal one: Layer 2 defines the
twist-three amplitudes with a free constant each, and Layer 5 fixes the constants, so nothing in
Layer 2 depends on Layer 5. Layer 6 rests on all of them.

Outside this roadmap the order is: `InclusiveStructureFunctions` and `CollinearEvolution` before
Layer 0 and Layer 1; `GeneralizedPartonDistributions` before 1.7, 2.5 and 6.7;
`TransverseMomentumDistributions` before 2.1 for the gauge link; `RadiativeCorrections` after the
whole roadmap, since every statement here is at the order this roadmap fixes and none of them is
contingent on a higher order existing.

## Acceptance examples

The roadmap is certified by these statements, each checkable against the library as it stands at
completion.

1. For a spin-zero target with the upstream covariance and conservation assumptions and parity, the
   coefficient of the Levi-Civita structure in the hadronic tensor is zero, and the `F1`/`F2`
   coefficients are unique.
2. For the charged pion's densities, the valence sum rules hold at a reference scale, and the first
   Mellin moment of the valence non-singlet combination is independent of scale under the evolution
   of 1.5.
3. In the isospin limit, the up density in the positive pion equals the down-antiquark density in
   the positive pion; and there exists a density satisfying the upstream assumptions for which that
   equality holds at one scale while the isospin-breaking parameter is non-zero.
4. The Gegenbauer polynomials of index 3/2 are pairwise orthogonal for the weight one minus the
   squared argument, their squared norms have the stated closed form, and they form a Hilbert basis
   of the weighted space.
5. Each weighted Gegenbauer polynomial is an eigenfunction of the ERBL operator; the zeroth
   eigenvalue is zero; the eigenvalues are strictly positive and strictly increasing beyond the
   zeroth.
6. The asymptotic amplitude is the unique unit-integral zero mode of the ERBL operator, and the
   semigroup orbit of the two-term example of Layer 2 converges to it in the weighted norm.
7. The restriction of the generalised-distribution evolution kernel to the region where the
   momentum fraction is smaller in modulus than the skewness, transported by the affine change of
   variable, equals the ERBL kernel.
8. For a spin-zero hadron there is exactly one elastic electromagnetic form factor; it equals the
   charge at zero momentum transfer; and the charge radius of the single-pole example is six times
   the reciprocal of the pole mass squared.
9. Under hard-scattering factorisation the momentum transfer times the pion form factor tends to
   sixteen pi over nine times the coupling, the squared decay constant and the squared inverse first
   moment of the amplitude; and for the flat amplitude the defining convolution diverges.
10. The transition form factor of the neutral pion at zero virtualities equals the reciprocal of
    four pi squared times the decay constant times the charge factor, under the regularisation
    hypothesis of 4.2; and its large-virtuality limit with the asymptotic amplitude is twice the
    decay constant.
11. For a chiral family satisfying `HasChiralLimit`, the derivative of the meson mass squared with
    respect to the quark mass at zero equals minus twice the condensate over the squared decay
    constant; and there is a family satisfying that for which the quoted first-order form fails at
    positive mass.
12. The twist-three normalisation of 5.2 item 2 has a finite non-zero chiral limit, while the meson
    mass squared vanishes there.
13. In the Sullivan kinematics the parton fraction in the meson equals the Bjorken variable divided
    by the meson momentum fraction up to the explicit momentum-transfer correction, and the
    accessible domain is strictly contained in the inclusive domain.
14. The extraction operator of 6.4 is compact; its kernel is non-trivial for a flux supported on a
    proper subinterval, with an explicit non-zero element exhibited; and the ratio of cross sections
    at equal meson fraction and different hard scales is flux-independent.
15. For the kaon, the distance from the measured region to the pole exceeds the pion's at equal
    measured domain, and the extrapolation error bound of 6.5 item 4 is correspondingly weaker.

## References

- Adler, S. L., *Axial-vector vertex in spinor electrodynamics*, Phys. Rev. 177 (1969) 2426.
- Aguilar, A. C. et al., *Pion and kaon structure at the Electron-Ion Collider*, Eur. Phys. J. A 55
  (2019) 190.
- Aicher, M., Schafer, A. and Vogelsang, W., *Soft-gluon resummation and the valence parton
  distribution function of the pion*, Phys. Rev. Lett. 105 (2010) 252003.
- Amendolia, S. R. et al. (NA7), *A measurement of the space-like pion electromagnetic form
  factor*, Nucl. Phys. B 277 (1986) 168.
- Arrington, J. et al., *Revealing the structure of light pseudoscalar mesons at the Electron-Ion
  Collider*, J. Phys. G 48 (2021) 075106.
- Ball, P., Braun, V. M., Koike, Y. and Tanaka, K., *Higher twist distribution amplitudes of vector
  mesons in QCD: formalism and twist three distributions*, Nucl. Phys. B 529 (1998) 323.
- Bell, J. S. and Jackiw, R., *A PCAC puzzle: pi0 to gamma gamma in the sigma model*, Nuovo Cimento
  A 60 (1969) 47.
- Braun, V. M. and Filyanov, I. E., *Conformal invariance and pion wave functions of nonleading
  twist*, Z. Phys. C 44 (1989) 157.
- Brodsky, S. J. and Lepage, G. P., *Large-angle two-photon exclusive channels in quantum
  chromodynamics*, Phys. Rev. D 24 (1981) 1808.
- Conway, J. S. et al. (E615), *Experimental study of muon pairs produced by 252-GeV pions on
  tungsten*, Phys. Rev. D 39 (1989) 980.
- Efremov, A. V. and Radyushkin, A. V., *Factorization and asymptotical behavior of pion form factor
  in QCD*, Phys. Lett. B 94 (1980) 245.
- Farrar, G. R. and Jackson, D. R., *Pion and nucleon structure functions near x = 1*, Phys. Rev.
  Lett. 43 (1979) 246.
- Gell-Mann, M., Oakes, R. J. and Renner, B., *Behavior of current divergences under SU(3) x SU(3)*,
  Phys. Rev. 175 (1968) 2195.
- Holt, R. J. and Roberts, C. D., *Distribution functions of the nucleon and pion in the valence
  region*, Rev. Mod. Phys. 82 (2010) 2991.
- Holtmann, H., Szczurek, A. and Speth, J., *Flavor and spin of the proton and the meson cloud*,
  Nucl. Phys. A 596 (1996) 631.
- Lepage, G. P. and Brodsky, S. J., *Exclusive processes in perturbative quantum chromodynamics*,
  Phys. Rev. D 22 (1980) 2157.
- Muller, D., Robaschik, D., Geyer, B., Dittes, F.-M. and Horejsi, J., *Wave functions, evolution
  equations and evolution kernels from light-ray operators of QCD*, Fortschr. Phys. 42 (1994) 101.
- Radyushkin, A. V., *Nonforward parton distributions*, Phys. Rev. D 56 (1997) 5524.
- Sullivan, J. D., *One-pion exchange and deep-inelastic electron-nucleon scattering*, Phys. Rev. D
  5 (1972) 1732.
- Szego, G., *Orthogonal Polynomials*, American Mathematical Society Colloquium Publications 23,
  4th edition, 1975, chapter IV.
- Thomas, A. W., *A limit on the pionic component of the nucleon through SU(3) flavor breaking in
  the sea*, Phys. Lett. B 126 (1983) 97.
- *Science Requirements and Detector Concepts for the Electron-Ion Collider: EIC Yellow Report*,
  arXiv:2103.05419, Volume II, sections 7.1.3 and 7.2.1.

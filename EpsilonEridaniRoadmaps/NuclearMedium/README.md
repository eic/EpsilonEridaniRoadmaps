# Roadmap: parton propagation in nuclear matter and collective effects

What happens to a parton, and to the hadron it becomes, while it traverses a nucleus: transverse
momentum broadening, energy loss, the transport coefficients that quantify both, the modification
of hadronization in the medium, and the collective correlations observed in small systems. The
nucleus here is a probe of dynamics rather than a target whose structure is being measured.

The roadmap develops four things that are usually treated as separate literatures and are in fact
one structure. First, a *medium* as explicit data: a density profile, a path-length functional and
the probability distribution of path length induced by the production geometry. Second, *transport
coefficients* as moments of a single-scattering cross section, which is what connects the transverse
dynamics to the dipole cross section of `SmallXAndSaturation`. Third, *transverse-momentum
broadening as a convolution semigroup in path length*, whose generator is multiplication by the
dipole cross section in the conjugate variable; this is the step that makes the whole subject an
instance of a theory that already exists upstream, and it is also the step where the admissibility
of the usual quadratic approximation becomes a sharp question rather than a habit. Fourth,
*medium-induced radiation*, where the Landau–Pomeranchuk–Migdal interference between emissions off
different scattering centres turns a linear path-length dependence into a quadratic one, and where
two resummations — the opacity expansion and multiple soft scattering — are each valid in a regime
that must be stated to be used.

The final application is a formal statement of the nuclear modification ratio for semi-inclusive
deep inelastic scattering off a nucleus, decomposed into an initial-state factor that this roadmap
takes from `NuclearPartonDistributions` and a final-state factor that it builds, together with the
theorem that the decomposition is unique under a named factorisation hypothesis and the identification
of the observable that separates the two. Conflating initial-state and final-state nuclear effects is
the principal error in this area, and the roadmap is organised so that a statement which conflates
them cannot be written down.

The second application is the collective sector. Azimuthal anisotropy coefficients are defined so
that they are well posed at finite multiplicity, the event-plane and cumulant definitions are given
distinct names and related by a proved moment identity rather than identified, and the two candidate
origins of an observed anisotropy — final-state response to an initial geometry, and initial-state
momentum correlations in the gluon fields of `SmallXAndSaturation` — are carried as two distinct
hypotheses throughout. The roadmap proves that a nonzero anisotropy does not imply the applicability
of a hydrodynamic description, by exhibiting the initial-state hypothesis as a counterexample. That
negative result is the honest content of the sector, and it is stated as a theorem rather than as a
caveat in prose.

## Scope

Included:

- The medium as explicit data: a density profile on space, the path-length functional along a ray
  from a production point, and the push-forward path-length distribution with its moments.
- The transverse-momentum diffusion coefficient and the longitudinal drag coefficient, defined as
  moments of the single-scattering cross section per unit path length, with the integrability
  conditions under which each moment exists.
- The relation between the diffusion coefficient and the gluon density of the medium, with its
  hypotheses, so that a measurement of one constrains the other.
- The colour-representation dependence of the transport coefficients, proved from the Casimirs
  rather than quoted.
- The transverse-momentum broadening kernel as a one-parameter convolution semigroup in path
  length; its generator; the Lévy–Khintchine characterisation of which dipole cross sections give
  an admissible kernel; and the multiple-soft-scattering (Gaussian) approximation with a precise
  statement of which moments it reproduces and which it does not.
- Coherence: the formation length, the coherence condition, and the theorem that accumulated
  broadening is linear in path length while coherent radiative energy loss is quadratic, with the
  crossover identified as the path length at which the two expressions agree.
- Medium-induced gluon radiation: the spectrum through its integral representation, the LPM
  suppression below the characteristic energy, the asymptotic behaviour on either side of it, and
  the resulting mean energy loss.
- The opacity expansion as a formal series indexed by the number of scatterings with the
  single-scattering term computed and the expansion parameter identified; multiple soft scattering
  as the alternative resummation; and the regime of validity of each.
- The mass dependence of radiative loss and the dead-cone suppression for a heavy quark in the
  medium, together with the resulting ordering of losses by quark mass.
- Formation time of the produced hadron and the criterion separating hadronization inside the
  nucleus from hadronization outside it.
- Medium-modified fragmentation functions, the energy-loss-rescaling and absorption hypotheses,
  the observable that discriminates them, and their distinct mass-number exponents.
- The nuclear modification ratio for semi-inclusive hadron production with the initial-state and
  final-state factors separated, and the uniqueness of that separation.
- Azimuthal anisotropy coefficients at finite multiplicity, the event-plane and cumulant
  definitions and the moment identity relating them, two- and four-particle cumulants, and the
  combinatorial identity by which the four-particle cumulant suppresses non-flow.
- The final-state-response and initial-state-correlation hypotheses, the observables that
  discriminate them, and the counterexample theorem separating a measured anisotropy from the
  applicability of a fluid description.

Not included. The static parton structure of a nucleus — nuclear parton distributions, shadowing,
antishadowing, the EMC effect and their evolution — is `NuclearPartonDistributions`; this roadmap
consumes the nuclear gluon distribution from there and never fits one. Fragmentation in vacuum,
including the vacuum fragmentation functions, their evolution and the hadron formation picture, is
`Hadronization`; the medium-modified objects here are defined as modifications of those and the
vacuum statements are not restated. Jet reconstruction, jet algorithms and vacuum jet substructure
are `JetsAndEventShapes`, from which this roadmap takes the jet definitions used as medium probes
and the vacuum dead-cone statement. The dipole amplitude, its rapidity evolution and the saturation
scale are `SmallXAndSaturation`, which supplies the dipole cross section that appears here as an
input and the initial-state gluon-field correlators that feed the initial-state anisotropy
hypothesis. Nuclear densities, Woods–Saxon and hard-sphere profiles, and few-body nuclear wave
functions are `LightNuclei`. Quarkonium formation and dissociation in a nuclear environment is
`QuarkoniaAndExotics`, even though it is medium physics: the bound-state dynamics is a different
subject from parton transport and is not duplicated here. Coherent and incoherent diffractive
production off nuclei is `Diffraction`. Real-photon-induced production is `Photoproduction`.
Higher-twist multi-parton correlators in the nucleus, including the double parton distributions
that enter the initial-state correlation hypothesis, are `MultiPartonCorrelations`. Thermodynamic
quantities of deconfined matter computed on a lattice are `LatticeBridge`. Relativistic fluid
dynamics is built nowhere in this collection and is not built here; Layer 5 treats the response
coefficient of a fluid description as a defined parameter and states exactly what a measurement
of it does and does not establish.

The material belongs under `EpsilonEridani/Nuclear/Medium/`: the geometry and path-length
material in `Nuclear/Medium/Geometry/`, transport coefficients in `Nuclear/Medium/Transport/`,
the broadening semigroup in `Nuclear/Medium/Broadening/`, radiation in
`Nuclear/Medium/Radiation/`, and the collective observables in `Nuclear/Medium/Collective/`. The
medium-modified fragmentation material belongs in
`EpsilonEridani/Particles/Fragmentation/Medium/`, beside the existing
`EpsilonEridani.Particles.Fragmentation.Basic`, so that the vacuum object and its medium analogue
sit in one namespace and the reduction theorem of 4.2 is a statement about two neighbours.

## Conventions and coordination with upstream

1. **Path length is an explicit real variable.** Every transport quantity, every broadening kernel
   and every energy loss carries a path length `ℓ : ℝ` with `0 ≤ ℓ` as an argument. Geometry
   averaging is a separate, named operation that composes a path-length-dependent quantity with
   the distribution of 0.3. *Trap:* a geometry-averaged transport coefficient looks like a local
   one, and the two differ by the shape of the path-length distribution; identifying them turns a
   quadratic path-length law into a linear one and silently changes the extracted coefficient.

2. **Initial-state and final-state effects are labelled separately in every statement.** A nuclear
   modification is a pair, not a number: the `NuclearEffect` record of 0.4 has an initial-state
   field taken from `NuclearPartonDistributions` and a final-state field built here, and every
   theorem about an observable ratio states which field it constrains. *Trap:* attributing gluon
   shadowing to energy loss, or energy loss to shadowing, which is possible only if the two are
   stored in one slot.

3. **Transport coefficients are per unit path length, with dimensions fixed once.** `qhat` has
   dimensions of squared momentum per length, `ehat` of momentum per length. The roadmap works in
   units where the length is carried explicitly rather than absorbed, so `qhat` is not written as
   a cubed momentum. *Trap:* the literature quotes the same symbol in GeV² fm⁻¹ and in GeV³; a
   statement that does not fix the convention is off by the conversion factor and the error is
   invisible in the algebra.

4. **Naming: ASCII identifiers, and `medium`-prefixed analogues.** `qhat`, `ehat`, `omegaC`,
   `formationTime`. A medium-modified analogue of a vacuum object gets the vacuum name with a
   `medium` prefix — `mediumFragmentation` against `Hadronization`'s vacuum fragmentation — so
   that the two are never unified by name resolution. *Trap:* reusing the vacuum name for the
   medium object makes the reduction theorem of 4.2 unstatable, because it becomes a tautology.

5. **The medium is explicit data, never a typeclass.** `MediumProfile` is a structure carrying a
   density; it is passed as an argument. *Trap:* a typeclass instance makes "the medium" ambient,
   and then two media cannot appear in one statement — which forbids exactly the comparisons
   (nucleus against nucleus, medium against vacuum) that the observables are built from.

6. **Structure fields carry data and elementary side conditions only.** Substantive properties —
   the semigroup property, the factorisation of a nuclear ratio, the applicability of a regime —
   are standalone `Prop`-valued definitions supplied as explicit hypotheses to the theorems that
   need them. *Trap:* a `Prop`-valued field with a placeholder witness asserts nothing while
   looking like a hypothesis, and every downstream theorem then quietly depends on an unproved
   claim. Where something is unproved in this roadmap it is named as a gap in prose.

7. **Transverse momentum and dipole size are two-dimensional Euclidean, and the Fourier
   convention is fixed once.** Both live in `EuclideanSpace ℝ (Fin 2)`; the conjugate pair is
   transverse momentum and transverse size, with the convention taken from
   `TauCeti.Analysis.Bochner.Fourier.Convention` and never restated locally. *Trap:* a factor of
   2π in the wrong place rescales `qhat`, and since `qhat` is the quantity being extracted from
   data the error propagates into a physics conclusion rather than showing up as a type error.

8. **Frames are stated: the target rest frame with the virtual-photon direction as the polar
   axis.** Transverse momentum broadening is defined with respect to the original parton direction
   in that frame. Breit-frame statements are used only where they are cited from
   `InclusiveStructureFunctions`, and the boost relating them is explicit. *Trap:* transverse
   momentum with respect to *which* axis in *which* frame differs by terms of the same order as
   the broadening being measured.

9. **The opacity expansion is a formal series with an explicit order index and a stated
   remainder.** The order is a natural number; the truncation at order `N` is accompanied by a
   statement of what is dropped. *Trap:* writing the single-scattering term as "the" induced
   spectrum, which is an equality only in a limit that is then never checked.

10. **Azimuthal harmonics: index `n ≥ 1`, and the two definitions keep distinct names.**
    `vnEventPlane` and `vnCumulant` are separate definitions related by the moment identity of
    5.2; they are never identified definitionally. Harmonic coefficients are taken on the circle
    using `TauCeti.Analysis.Fourier.AddCircle`, with the normalisation fixed by that module.
    *Trap:* identifying the two definitions assumes that the event-by-event fluctuations of the
    anisotropy vanish, which is precisely the quantity that the difference between them measures.

11. **A hypothesis is named as one and passed as one.** Definitions whose name ends in
    `Hypothesis` are `Prop`-valued predicates on the objects they constrain, and a theorem that
    needs one takes it as an argument. Nothing in this roadmap assumes the rescaling hypothesis,
    the absorption hypothesis, the final-state-response hypothesis or the initial-state-correlation
    hypothesis. *Trap:* discharging a hypothesis by building it into a definition produces a
    theory in which the discriminating measurement of 4.3 and 5.4 has no content.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- Colour: `EpsilonEridani.QFT.QCD.Basic`, `.RepresentationColor`, `.CasimirDerivation`,
  `EpsilonEridani.Mathematics.LieAlgebra.Casimir`, and `EpsilonEridani.QFT.QCD.SU3Generators` for
  the quadratic Casimirs. The colour ratios of 1.4 and 3.6 are derived from these, not quoted.
- `EpsilonEridani.Mathematics.OrderedSimplexIntegral` for the ordered multiple-scattering
  integral. The opacity expansion at order `N` is an integral over an ordered simplex of scattering
  positions along the path, which is exactly this module's object; the roadmap does not build its
  own ordered-integral machinery.
- `EpsilonEridani.Particles.Fragmentation.Basic` for the vacuum fragmentation object that the
  medium-modified object of Layer 4 is defined against, and
  `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic` for the semi-inclusive cross section whose
  nuclear ratio is the target of that layer.
- `EpsilonEridani.QFT.Factorization.Basic`, `.Scales.Basic`, `.Convolution.Basic`,
  `.Convolution.Collinear` and `.Convolution.Properties` for the factorisation statement, the scale
  bookkeeping and the convolution in momentum fraction that the nuclear ratio of 4.4 inherits;
  `.Convolution.Mellin` for the moment-space form from which 4.5 reads off the mass-number exponent.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, `.Kinematics.Bounds` and
  `EpsilonEridani.Numerics.FourMom` for the kinematic variables and the four-momentum algebra in
  which the formation-time criterion of 4.1 is expressed, and
  `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics` for the azimuthal-harmonic
  conventions that Layer 5 follows.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` and `.Inference.Unfolding` for the
  language in which "this observable discriminates these two hypotheses" is a statement about a map
  being injective on a specified set, rather than an informal remark. Both 4.3 and 5.4 use it.
- `EpsilonEridani.QFT.Shower.Sudakov` for the no-emission probability that the quenching weight of
  3.4 reduces to in vacuum, and `EpsilonEridani.Generator.Splitting` and
  `EpsilonEridani.Generator.Shower` for the vacuum splitting kernels whose medium modification is
  the content of Layer 3.
- `EpsilonEridani.Mathematics.Distribution.BasicExtensions` for the distributional component of a
  broadening kernel at zero transverse momentum, and
  `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` for the positive-semidefiniteness
  of the transverse covariance matrix of 2.5.

From TauCeti:

- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.Generator.Basic`, `.Identity` and
  `.GrowthBound` for the one-parameter semigroup, its generator, the vacuum case and the
  contraction bound that expresses conservation of probability under broadening. The broadening
  kernel of Layer 2 is a semigroup in path length and is stated as one.
- `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.CauchyProblem.Uniqueness` for existence
  and uniqueness of the solution of the transverse diffusion equation. This roadmap does not
  reprove either; 2.3 proves that the equation's data satisfy that theory's hypotheses.
- `TauCeti.Analysis.Semigroups.Multiplication` for the fact that the generator becomes a
  multiplication operator in the conjugate variable, which is the whole reason the dipole
  representation is useful; and `TauCeti.Analysis.Semigroups.Dissipative.Basic`,
  `.Dissipative.Hilbert` and `.Generation.LumerPhillips` for the dissipativity route by which the
  candidate generator is shown to generate a contraction semigroup.
- `TauCeti.Analysis.CompletelyMonotone.Bernstein.LevyKhintchine.Basic`, `.Representation` and
  `.Uniqueness` for the Lévy–Khintchine representation. This is the sharp characterisation of which
  dipole cross sections give a broadening kernel that is a probability measure at every path
  length, and it is the upstream result that Layer 2 is built to use.
- `TauCeti.Analysis.Bochner.BochnerTheorem`, `.CharFun.PositiveDefinite`, `.Fourier.Convention` and
  `.Fourier.Nonneg` for the equivalence between a positive-definite characteristic function and a
  positive measure, which is how admissibility is checked in 2.2 and which fixes the Fourier
  convention of convention 7; `.Gaussian.Basic` and `.Gaussian.Measure` for the Gaussian kernel of
  2.4.
- `TauCeti.Analysis.PositiveDefinite.AddGroup`, `.Basic` and `.Kernel.Kolmogorov` for
  positive-definiteness on the transverse plane as an additive group.
- `TauCeti.Analysis.Fourier.AddCircle` for azimuthal harmonic coefficients, and
  `TauCeti.Analysis.Fourier.RiemannLebesgue`, `.Decay` and `.Integrable` for the decay statements
  that control which moments of a broadening kernel exist.
- `TauCeti.Probability.Moments.Basic`, `.Covariance` and `.VanishingMoments` for the moments of the
  broadening kernel and the vanishing of its first transverse moment under azimuthal symmetry;
  `TauCeti.Probability.Density` for the kernels that have a density;
  `TauCeti.Probability.Independence.Conditional` for the independence hypothesis under which
  successive scatterings compose by convolution; and
  `TauCeti.Probability.Process.MarkovChain` with `TauCeti.Probability.Kernel.Invariant` for the
  discrete-scattering description that the continuum semigroup is the limit of.
- `TauCeti.Analysis.Fredholm.Criteria`, `.CompactPerturbation`, `.Index` and `.Zero` for the
  extraction of a transport coefficient from a measured spectrum, which is a Fredholm inverse
  problem: the non-uniqueness is the kernel of an operator and is stated as such in 1.6.
- `TauCeti.Analysis.Asymptotics.Lemmas` for the asymptotic statements of 3.3 and 4.6, which are
  order relations with explicit remainders rather than informal limits;
  `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and `.Mollification` for the weak form of the
  diffusion equation and the approximation argument of 2.6.
- `TauCeti.Analysis.SpecialFunctions.Gamma`, `.IncompleteGamma` and `.Erf` for the closed forms of
  the Gaussian-kernel moments and partial moments of 2.4;
  `TauCeti.Analysis.SpecialFunctions.ImproperIntegrals` and `.Log.NegLogOneSub` for the
  logarithmically divergent integrals that the Coulomb-logarithm regularisation of 1.2 controls;
  `TauCeti.Analysis.Matrix.PosSemidef` and `.Spectrum` for the transverse covariance matrix and its
  eigenvalues when the medium is anisotropic.

From Mathlib: `Mathlib.Analysis.Fourier.FourierTransform` for the transform itself;
`Mathlib.Analysis.InnerProductSpace.PiL2` for `EuclideanSpace`;
`Mathlib.MeasureTheory.Measure.Lebesgue.Basic` and the measure-theoretic integral for the
push-forward of 0.3; `Mathlib.Probability.Density` and `Mathlib.Probability.Martingale.Basic` for
the probabilistic statements of Layer 0 and 5.

Genuine absences, and what the roadmap does instead:

- ⚠ **Bessel functions are absent from both Mathlib and TauCeti.** The closed form of the
  medium-induced spectrum in the multiple-soft-scattering approximation, and the transverse
  Fourier transform of a screened Coulomb cross section, are conventionally written with them.
  The roadmap therefore states the spectrum through its integral representation and proves the
  asymptotic behaviour of 3.3 directly from that integral, using
  `TauCeti.Analysis.Asymptotics.Lemmas` and the contour material. It does not build a Bessel
  theory, and it does not wait for one; nothing in any layer is contingent on one appearing.
- ⚠ **Polylogarithms and harmonic sums are absent from both.** The higher-order coefficients of
  the opacity expansion are conventionally expressed in them. The roadmap states the order-`N`
  term as an ordered-simplex integral using
  `EpsilonEridani.Mathematics.OrderedSimplexIntegral` and proves the properties it needs —
  positivity, the `N = 1` closed form, the expansion parameter — from that representation.
- ⚠ **There is no regularisation theory for ill-posed inverse problems upstream.** The extraction
  of a transport coefficient from a measured broadening spectrum is ill-posed in the ordinary
  sense, and no notion of regularisation exists to appeal to. The roadmap therefore states what
  *is* available as mathematics: the forward map is a Fredholm integral operator, the
  non-uniqueness is its kernel, and the characterisation of that kernel is the deliverable of 1.6.
  A numerical inversion scheme is not part of this roadmap and is not claimed.
- ⚠ **There is no relativistic fluid dynamics anywhere in the upstream libraries, and none is
  built here.** Layer 5 does not derive an anisotropy from a fluid. The response coefficient
  `kappa n` of 5.4 is a defined parameter of the final-state-response hypothesis, the hypothesis
  is carried as a hypothesis, and the theorem of 5.5 is a statement about what a measurement does
  not establish. This is a deliberate narrowing of the claim, not a gap to be filled later.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the transformation of the medium
  profile between the nuclear rest frame and the Breit frame, and `Physlib.Units.WithDim.Energy`
  and `Physlib.Units.WithDim.Momentum` for the transport coefficients, whose dimensions are the
  commonest source of error in this area.

## Layer 0: the medium as data, path length, and the initial/final-state split

References: EIC Yellow Report Vol. II §7.3.4; Accardi et al., *Riv. Nuovo Cim.* 32 (2009) 439,
§2; Glauber geometry as used in the nuclear-attenuation literature.

### 0.1 The medium profile

A `MediumProfile` carries a density `density : EuclideanSpace ℝ (Fin 3) → ℝ` that is measurable,
nonnegative and integrable, together with the mass number `A : ℕ` and the normalisation
`∫ density = A`. Nothing else: no temperature, no flow velocity, no equation of state, because
none of those is used by any statement in this roadmap.

Instances come from `LightNuclei`: the hard sphere of radius `R`, the Woods–Saxon profile with
its radius and diffuseness parameters, and the harmonic-oscillator profile for light nuclei. The
roadmap consumes these and does not fit or derive a nuclear density.

Theorem: the normalisation condition determines the overall scale of the density given its shape,
so that `A` and the shape parameters are not independent. State it, because the path-length moments
of 0.3 depend on the shape only through the ratio of scales.

### 0.2 The path-length functional

For a production point `x` and a unit direction `v`, the *geometric path length* is the distance
from `x` to the boundary of the support of the density along the ray `x + s • v`, and the
*density-weighted path length* is `∫ (s : 0..∞), density (x + s • v)` normalised by the central
density. Both are defined; neither is privileged.

- Theorem: for a medium of compact support, both functionals are finite, nonnegative and
  measurable in `(x, v)`.
- Theorem: for a uniform density on a convex body the two functionals are proportional, with the
  constant being the ratio of the local to the central density. For a non-uniform profile they are
  not proportional, and the roadmap states which of the two each subsequent definition uses. The
  transport coefficients of Layer 1 are local and therefore pair with the density-weighted length;
  the absorption factor of 4.3 pairs with the geometric length.
- Theorem: the geometric path length is upper semicontinuous in `v` for a convex support, and the
  set where it fails to be continuous has measure zero for a `C¹` boundary.

### 0.3 The path-length distribution

Given a production-point measure — for semi-inclusive deep inelastic scattering, the density
weighted by the flux of the probe, which is uniform to leading order — and the uniform measure on
directions, the *path-length distribution* is the push-forward of their product under the
path-length functional of 0.2.

- Theorem: it is a probability measure on `[0, ∞)` with compact support for a compactly supported
  density, hence all of its moments exist. Use the push-forward machinery in Mathlib's measure
  theory and `TauCeti.Probability.Moments.Basic`.
- Definition: the moments `⟨ℓ⟩` and `⟨ℓ²⟩`, and the ratio `⟨ℓ²⟩ / ⟨ℓ⟩²` as a dimensionless shape
  parameter of the geometry.
- Theorem: for a uniform density on a ball of radius `R` with production points uniform in the
  ball and isotropic directions, `⟨ℓ⟩ = 3R/4` and `⟨ℓ²⟩ = 4R²/5`.
- Corollary, with `R ∝ A^(1/3)`: `⟨ℓ⟩ ∝ A^(1/3)` and `⟨ℓ²⟩ ∝ A^(2/3)`. This corollary is what
  makes the mass-number exponents of 4.5 a discriminator between the two hadronization hypotheses,
  and it is the single most load-bearing statement in this layer.
- Definition: *geometry averaging* of a path-length-dependent quantity is its integral against
  this distribution. Theorem: geometry averaging does not commute with a nonlinear function of the
  path length, and the discrepancy for a quadratic is exactly `⟨ℓ²⟩ − ⟨ℓ⟩²`. This is the trap of
  convention 1, stated as a theorem so that it can be cited.

### 0.4 The initial-state / final-state decomposition

A `NuclearEffect` for an observable is a pair of functions: an *initial-state factor* depending on
the momentum fraction and the scale, and a *final-state factor* depending in addition on the energy
transfer, the hadron momentum fraction and the medium. The initial-state factor is taken from
`NuclearPartonDistributions` and is not built here.

- Definition: `FactorisationHypothesis` — the observable equals the product of the two factors,
  with no cross term, at the stated accuracy.
- Theorem: under the factorisation hypothesis, and given that the initial-state factor is
  independent of the energy transfer at fixed momentum fraction and scale while the final-state
  factor is not constant in it, the decomposition is unique. The proof is the observation that the
  energy-transfer dependence at fixed momentum fraction determines the final-state factor up to a
  constant, which the empty-medium normalisation then fixes.
- Theorem: the final-state factor equals `1` identically when the density is zero.
- Theorem, stated as the negative counterpart: without the independence assumption, the
  decomposition is not unique, and the family of decompositions consistent with a given observable
  is parametrised explicitly. This is why the separation is a theorem with hypotheses rather than a
  definition.

### Examples

- The hard sphere of radius `R`: both path-length functionals in closed form, the distribution of
  the geometric length, and the moments `3R/4` and `4R²/5`.
- A uniform slab of thickness `L` with normal incidence: the path-length distribution is uniform on
  `[0, L]`, so `⟨ℓ⟩ = L/2` and `⟨ℓ²⟩ = L²/3`.
- The empty medium: the path-length distribution is `δ₀`, geometry averaging is evaluation at
  zero, and every final-state factor in this roadmap reduces to `1`.
- Woods–Saxon for a heavy nucleus, cited to `LightNuclei` for the profile, with `⟨ℓ⟩` computed
  numerically and the `A^(1/3)` scaling verified against the sphere.

### Dependencies

`LightNuclei` for density profiles. `NuclearPartonDistributions` for the initial-state factor.
Mathlib measure theory and `TauCeti.Probability.Moments.Basic` for the push-forward and its
moments.

---

## Layer 1: transport coefficients from the dipole cross section

References: Baier, Dokshitzer, Mueller, Peigné, Schiff, *Nucl. Phys. B* 483 (1997) 291;
Zakharov, *JETP Lett.* 63 (1996) 952; Wang and Guo, *Nucl. Phys. A* 696 (2001) 788; Burke et al.
(JET Collaboration), *Phys. Rev. C* 90 (2014) 014909.

### 1.1 The dipole cross section as input

Taken from `SmallXAndSaturation`: a function `sigmaDip : EuclideanSpace ℝ (Fin 2) → ℝ` of
transverse size, with `sigmaDip 0 = 0`, monotone in `‖r‖`, saturating at large size, and with the
small-size behaviour quadratic up to a logarithm. What this roadmap imports is exactly that list of
properties, as explicit hypotheses; the rapidity evolution that produces them is not restated.

Definition: the single-scattering differential cross section in transverse momentum transfer is
the Fourier transform of the dipole cross section with respect to transverse size. Theorem: it is a
nonnegative measure precisely when the dipole cross section is negative-definite in the sense of
2.2, which is the forward reference that ties this layer to the next.

### 1.2 The transverse-momentum diffusion coefficient as a moment

Definition: `qhat` is the density times the second transverse moment of the single-scattering
differential cross section, that is, the mean squared transverse momentum transferred per unit
path length. Equivalently, and this is the form used downstream, it is four times the curvature of
the dipole cross section at zero size, with the curvature taken at a stated logarithmic scale.

- Theorem: the second moment is finite if and only if the differential cross section decays faster
  than the inverse fourth power of the momentum transfer. State it as an integrability lemma using
  `TauCeti.Analysis.Fourier.Decay` and `TauCeti.Probability.Moments.Basic`.
- Theorem: for an unscreened Coulomb-like cross section the second moment is logarithmically
  divergent, and the divergence is exactly of the form controlled by
  `TauCeti.Analysis.SpecialFunctions.ImproperIntegrals`. Consequently `qhat` is defined with an
  explicit upper cutoff on the momentum transfer, and the *Coulomb logarithm* is a named argument
  of the definition rather than an implicit constant.
- Theorem: the equivalence of the moment definition and the curvature definition, valid to leading
  logarithmic accuracy, with the difference bounded. This equivalence is what allows the same
  symbol to be used in Layer 1 and Layer 2 and it is proved, not assumed.
- Theorem: the first transverse moment vanishes by azimuthal symmetry of the medium, via
  `TauCeti.Probability.Moments.VanishingMoments`. Hence the leading effect is diffusive and there
  is no transverse drag.

### 1.3 The longitudinal drag coefficient

Definition: `ehat` is the density times the first longitudinal moment of the single-scattering
cross section: the mean energy lost per unit path length to elastic collisions. Definition:
`ehat2`, the second longitudinal moment, which controls the fluctuation of the collisional loss.

- Theorem: `ehat` is nonnegative for a cross section supported on energy transfers to the medium.
- Theorem: the collisional loss accumulated over a path length is linear in the path length, with
  the variance also linear. Contrast this with the quadratic radiative loss of 3.4; the two
  path-length laws are the practical discriminator between collisional and radiative mechanisms,
  and the statement that they differ is a theorem of this roadmap.
- Theorem: a fluctuation-dissipation relation between `ehat`, `ehat2` and `qhat` holds under a
  named detailed-balance hypothesis on the scattering kernel, and fails without it. State both
  directions; the hypothesis is not assumed elsewhere.

### 1.4 The diffusion coefficient and the gluon density

Theorem: under an eikonal-propagation hypothesis, dominance of single gluon exchange, and a stated
range of momentum fraction, `qhat` is proportional to the density times the gluon distribution of
the medium evaluated at that momentum fraction, with the proportionality constant fixed by the
coupling and the colour factors. The gluon distribution is taken from
`NuclearPartonDistributions`.

- Theorem: the colour-representation dependence. For a parton in representation `R`, `qhat` is
  proportional to the quadratic Casimir of `R`. Hence the ratio of the adjoint to the fundamental
  value equals the ratio of the Casimirs, which for three colours is `9/4` exactly. Proved from
  `EpsilonEridani.QFT.QCD.RepresentationColor` and
  `EpsilonEridani.QFT.QCD.CasimirDerivation`, not quoted.
- Theorem: the scale at which the gluon distribution is evaluated is itself set by `qhat` through
  the typical momentum transfer, so the relation is implicit. State the fixed-point form and the
  conditions under which it has a unique solution, using monotonicity of the gluon distribution in
  the scale.
- Corollary: a measurement of `qhat` constrains the nuclear gluon distribution, and conversely.
  State the direction of the implication explicitly in each case, since the relation is an
  equivalence only under the full hypothesis list.

### 1.5 Coherence and path-length scaling

Definition: the mean free path is the inverse of the density times the total cross section. The
*coherence number* is the ratio of the formation length of an emission to the mean free path;
`CoherentRegime` is the predicate that it exceeds one while the formation length remains below the
total path length.

- Theorem: accumulated transverse broadening is linear in path length, `⟨p⊥²⟩ = qhat * ℓ`, in both
  regimes. Broadening does not distinguish them.
- Theorem: radiative energy loss is linear in path length in the incoherent regime and quadratic
  in the coherent regime. The proof of the quadratic law is given in 3.4, which is where the
  spectrum exists; what is proved here is the equivalence of the regime predicate with the
  inequality on path length that follows from it.
- Theorem: the crossover path length is the value at which the linear and quadratic expressions
  agree, and it equals the formation length at the characteristic energy. This identification is
  the precise content of the informal statement that coherence sets in when the formation length
  exceeds the mean free path.
- Theorem: the two regimes are exhaustive and mutually exclusive on the stated domain, so that
  every kinematic point has one applicable law. Without this, a statement of the form "energy loss
  scales as path length squared" has no domain.

### 1.6 Extraction as a Fredholm inverse problem

The observable is the geometry average of a path-length-dependent broadening against the
distribution of 0.3, integrated against the production spectrum. The map from a `qhat` profile
along the path to the observed transverse-momentum spectrum is linear.

- Theorem: that map is a Fredholm integral operator with a continuous kernel on the relevant
  function spaces, using `TauCeti.Analysis.Fredholm.Criteria`.
- Theorem: the set of `qhat` profiles consistent with a given observed spectrum is an affine
  subspace, namely a coset of the kernel of that operator; characterise the kernel. A
  non-uniqueness statement about the extraction is exactly a statement that this kernel is
  nontrivial, and it is proved in that form rather than asserted.
- Theorem: the operator is compact, hence its inverse is unbounded on the range, via
  `TauCeti.Analysis.Fredholm.CompactPerturbation`. ⚠ No regularisation theory exists upstream to
  continue from here, and none is built: the deliverable of this subsection is the kernel
  characterisation and the compactness, and no inversion scheme is claimed.
- Theorem: the geometry-averaged observable determines the *first* moment of the `qhat` profile
  along the path, and nothing beyond it, when the production spectrum is a single power. This is
  the sharpest positive statement available and it explains what a single measurement can fix.

### Examples

- The Gaussian single-scattering cross section: the second moment in closed form, the curvature of
  the corresponding dipole cross section, and the exact agreement of the two definitions of 1.2
  with no logarithm.
- The Yukawa-screened Coulomb cross section: the second moment, the Coulomb logarithm as the
  explicit ratio of the cutoff to the screening mass, and the divergence as the screening mass goes
  to zero.
- The adjoint-to-fundamental ratio `9/4` for three colours, computed from the Casimirs.
- A constant `qhat` on a uniform slab: the geometry average, and the failure of the
  geometry-averaged quadratic law to equal the quadratic law at the mean path length, with the
  discrepancy equal to `⟨ℓ²⟩ − ⟨ℓ⟩² = L²/12`.

### Dependencies

Layer 0 for the geometry. `SmallXAndSaturation` for the dipole cross section.
`NuclearPartonDistributions` for the nuclear gluon distribution. `EpsilonEridani.QFT.QCD.*` for
the Casimirs. TauCeti's Fredholm theory and moment theory.

---

## Layer 2: transverse-momentum broadening as a convolution semigroup

References: Zakharov, *JETP Lett.* 63 (1996) 952, for the dipole formulation; Sato, *Lévy
Processes and Infinitely Divisible Distributions*, CUP 1999, chapters 1–2; Schoenberg, *Trans.
AMS* 44 (1938) 522; Engel and Nagel, *One-Parameter Semigroups for Linear Evolution Equations*,
Springer 2000; Blaizot, Dominguez, Iancu, Mehtar-Tani, *JHEP* 1301 (2013) 143.

### 2.1 The broadening kernel and the semigroup property

Definition: a `BroadeningKernel` is a family `law : ℝ → Measure (EuclideanSpace ℝ (Fin 2))` of
probability measures on transverse momentum indexed by path length, with `law 0 = δ₀`.

Definition: `IsPathLengthSemigroup` is the predicate that `law (s + t)` is the convolution of
`law s` and `law t` for nonnegative `s` and `t`.

- Theorem: if successive scatterings along the path are conditionally independent given the medium
  — the hypothesis, taken as an explicit argument and stated with
  `TauCeti.Probability.Independence.Conditional` — then the kernel built from them satisfies
  `IsPathLengthSemigroup`. The semigroup property is a *consequence* of an independence hypothesis,
  never a definition, because for a medium with correlations longer than the mean free path it
  fails, and the roadmap must be able to say so.
- Theorem: the discrete-scattering description is a Markov chain on transverse momentum with an
  invariant reference measure; use `TauCeti.Probability.Process.MarkovChain` and
  `TauCeti.Probability.Kernel.Invariant`. Theorem: the continuum semigroup is its limit as the mean
  free path goes to zero at fixed `qhat`, with the convergence statement made precise on the
  characteristic functions.
- Theorem: azimuthal symmetry of the medium implies each `law t` is invariant under rotations of
  the transverse plane, hence determined by its radial marginal.

### 2.2 The dipole representation and the admissibility question

Definition: the *dipole amplitude* is the characteristic function of the broadening kernel,
evaluated at a transverse size; physically, the forward amplitude for a dipole of that size to
traverse the path length without breaking colour coherence.

- Theorem: a family of probability measures on the transverse plane satisfies
  `IsPathLengthSemigroup` if and only if its characteristic function has the form
  `exp (- t * psi r)` for a continuous `psi` with `psi 0 = 0`, and `psi` is negative-definite in
  Schoenberg's sense. Use `TauCeti.Analysis.Bochner.BochnerTheorem` and
  `TauCeti.Analysis.PositiveDefinite.AddGroup` for the positive-definiteness side.
- Theorem, the Lévy–Khintchine characterisation: such a `psi` is exactly the sum of a quadratic
  form and an integral of `1 - cos ⟪q, r⟫` against a Lévy measure with the stated integrability at
  the origin. Cited to
  `TauCeti.Analysis.CompletelyMonotone.Bernstein.LevyKhintchine.Representation`, with uniqueness of
  the representation from `.Uniqueness`. This roadmap does not reprove either.
- Corollary, and this is the point of the layer: the dipole cross section of 1.1 is an admissible
  exponent — that is, `exp (- t * sigmaDip)` is the characteristic function of a probability
  measure at every nonnegative path length — if and only if it is negative-definite. The
  properties imported in 1.1 (vanishing at zero, monotone, saturating) do *not* imply
  negative-definiteness. Theorem: exhibit a function with all three properties that is not
  negative-definite, hence for which the broadening kernel fails to be a positive measure at some
  path length. The admissibility of a modelled dipole cross section is therefore a condition to be
  checked, and the roadmap states it as such.
- Definition and theorem: the Lévy measure of an admissible dipole cross section is the
  single-scattering differential cross section of 1.1, times the density. This identifies the
  probabilistic and the physical decompositions of the exponent and is the reason `qhat` can be
  read off either as a moment or as a curvature.

### 2.3 The generator and the Cauchy problem

Theorem: in the dipole variable the generator of the semigroup is multiplication by the negative
of the dipole cross section; cite `TauCeti.Analysis.Semigroups.Multiplication` for the semigroup
generated by a multiplication operator, and `TauCeti.Analysis.Semigroups.Generator.Basic` for the
identification of the generator.

- Theorem: the generator is dissipative on the appropriate space, via
  `TauCeti.Analysis.Semigroups.Dissipative.Hilbert`, and therefore generates a contraction
  semigroup by `TauCeti.Analysis.Semigroups.Generation.LumerPhillips`. Contractivity is
  conservation of probability under broadening, and the growth bound is trivial, via
  `TauCeti.Analysis.Semigroups.GrowthBound`.
- Theorem: mass conservation is equivalent to `sigmaDip 0 = 0`, since the total probability is the
  dipole amplitude at zero size. State the equivalence; a model dipole cross section that is
  nonzero at zero size describes absorption, not broadening.
- Existence and uniqueness of the solution of the transverse diffusion equation with the vacuum
  distribution as initial condition is cited to
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.Uniqueness` and is not reproved. What is
  proved here is that the equation's data satisfy that theory's hypotheses.
- Theorem: the weak form of the diffusion equation, against test functions, using
  `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, and its equivalence to the semigroup form on the
  generator's domain.
- Theorem: the vacuum case `sigmaDip = 0` gives the identity semigroup,
  `TauCeti.Analysis.Semigroups.Identity`, hence no broadening. The definitional sanity check for
  the whole layer.

### 2.4 Multiple soft scattering: the harmonic-oscillator approximation

Definition: the harmonic-oscillator kernel replaces the dipole cross section by one quarter of
`qhat` times the squared transverse size.

- Theorem: the quadratic form is negative-definite, so this kernel is admissible, and by 2.2 it is
  the Gaussian case of the Lévy–Khintchine representation with zero Lévy measure. Its `law t` is
  the centred Gaussian on the transverse plane with variance `qhat * t`, via
  `TauCeti.Analysis.Bochner.Gaussian.Measure`.
- Theorem: the second moment of the harmonic-oscillator kernel is exactly `qhat * t`, so the
  approximation reproduces `qhat` by construction. This is not evidence that the approximation is
  good; it is the definition of the one parameter it has.
- Theorem: the fourth moment of the harmonic-oscillator kernel is twice the square of the second,
  as for any two-dimensional Gaussian. Theorem: the fourth moment of the exact kernel exceeds this
  whenever the Lévy measure is nonzero, and diverges when the single-scattering cross section
  decays no faster than the inverse fourth power. Hence the approximation is wrong about the tail
  in a way that is a theorem, not a caveat.
- Theorem: the exact kernel has a power tail whose exponent is that of the single-scattering cross
  section, obtained from the Lévy measure; the Gaussian has none. Corollary: the ratio of the
  exact to the approximate kernel is unbounded at large transverse momentum, and the approximation
  is valid only on a stated bounded region whose size grows with the path length as the square
  root.

### 2.5 Moments of the broadening kernel

- Theorem: the transverse covariance matrix of `law t` is positive semidefinite, via
  `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`, and is a multiple of the identity
  under the azimuthal symmetry of 2.1.
- Theorem: the second moment equals minus the transverse Laplacian of the logarithm of the dipole
  amplitude at zero size, times the path length; equivalently `qhat * t`. This is the statement
  that makes 1.2's curvature definition and this layer's moment definition the same number, and its
  hypothesis is the twice-differentiability of the dipole cross section at zero size — which fails
  for the logarithmically corrected form, so the theorem is stated with the cutoff of 1.2 in place.
- Theorem: the `k`-th moment of `law t` exists if and only if the `k`-th moment of the Lévy
  measure exists, for `k ≥ 2`; use `TauCeti.Probability.Moments.Basic` and
  `TauCeti.Analysis.Fourier.Decay`. Moment existence is a property of the medium, not of the path
  length.
- Theorem: the radial marginal of `law t` and its relation to the cumulative distribution, with
  the Gaussian case in closed form through `TauCeti.Analysis.SpecialFunctions.Erf` and the partial
  moments through `TauCeti.Analysis.SpecialFunctions.IncompleteGamma`.

### 2.6 Path-length averaging destroys the semigroup property

The observable broadening is the geometry average of `law ℓ` against the path-length distribution
of 0.3.

- Theorem: the geometry-averaged kernel is a probability measure with second moment
  `qhat * ⟨ℓ⟩`.
- Theorem: the geometry-averaged kernel does *not* satisfy `IsPathLengthSemigroup`, unless the
  path-length distribution is a point mass. The proof compares fourth moments and uses
  `⟨ℓ²⟩ > ⟨ℓ⟩²` for a non-degenerate distribution. This is stated as a theorem because the step
  it forbids — treating the measured broadening as an element of the semigroup and composing it —
  is a natural-looking move that is wrong, and the discrepancy is exactly the geometry variance of
  0.3.
- Theorem: the geometry-averaged kernel is a mixture of Gaussians in the harmonic-oscillator case
  and therefore has a non-Gaussian tail even though every member of the mixture is Gaussian. Give
  the tail exponent in terms of the behaviour of the path-length distribution near zero, using
  `TauCeti.Analysis.Sobolev.Mollification` for the approximation and
  `TauCeti.Analysis.Asymptotics.Lemmas` for the asymptotics.

### Examples

- The vacuum: identity semigroup, no broadening.
- The harmonic-oscillator kernel: Gaussian with variance `qhat * t`, fourth moment twice the
  square of the second.
- The single-hard-scattering kernel: the compound Poisson case of Lévy–Khintchine, with the
  probability of no scattering equal to the exponential of minus the path length over the mean
  free path, and the power tail of the single-scattering cross section surviving at every path
  length.
- A dipole cross section that saturates to a constant: admissible, with the broadening kernel
  tending to a fixed measure as the path length grows, which is the statement that saturation
  bounds the achievable broadening.
- A counterexample: a monotone function vanishing at zero and saturating which is not
  negative-definite, exhibiting the failure of admissibility that 2.2 warns about.

### Dependencies

Layers 0 and 1. `SmallXAndSaturation` for the dipole cross section. TauCeti's semigroup theory,
Lévy–Khintchine representation, Bochner theory and moment theory.

---

## Layer 3: medium-induced radiation, LPM interference and the opacity expansion

References: Baier, Dokshitzer, Mueller, Peigné, Schiff, *Nucl. Phys. B* 483 (1997) 291; Baier,
Dokshitzer, Mueller, Schiff, *Nucl. Phys. B* 531 (1998) 403; Zakharov, *JETP Lett.* 63 (1996)
952; Gyulassy, Lévai, Vitev, *Nucl. Phys. B* 594 (2001) 371; Wiedemann, *Nucl. Phys. B* 588
(2000) 303; Arnold, Moore, Yaffe, *JHEP* 0206 (2002) 030; Dokshitzer and Kharzeev, *Phys. Lett.
B* 519 (2001) 199.

### 3.1 Formation time and the three regimes

Definition: the formation time of an emission of energy `ω` and transverse momentum `k⊥` is
`2 * ω / k⊥ ^ 2`; the formation length is the same quantity in the eikonal limit.

Definition: three predicates on the kinematics and the geometry, according as the formation length
is below the mean free path (incoherent, Bethe–Heitler), between the mean free path and the total
path length (coherent, LPM), or above the total path length (fully coherent, the factorisation
limit).

- Theorem: the three predicates are mutually exclusive and exhaustive on the stated domain.
- Theorem: the formation time is monotone increasing in the emission energy at fixed transverse
  momentum, so the regimes order the emission spectrum in energy, and the boundaries are the
  energies at which the formation length equals the mean free path and the total path length.
- Definition: the characteristic energy `omegaC = qhat * L ^ 2 / 2`, and the theorem that it is
  exactly the energy at which the formation length, evaluated with the transverse momentum
  accumulated by broadening over that formation length, equals the total path length. The
  characteristic energy is thus derived from the coherence condition, not introduced.

### 3.2 The medium-induced spectrum as a definite object

Definition: the medium-induced radiation spectrum is the difference between the emission spectrum
in the medium and in vacuum, expressed through the two-point function of the emission current with
the broadening kernel of Layer 2 inserted between the emission and the absorption vertex. Written
as an ordered integral over emission positions along the path, using
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`.

- Theorem: the spectrum is nonnegative after the vacuum subtraction in the coherent regime; state
  the hypotheses, because the subtracted quantity is not positive pointwise in general and the
  positivity is a statement about its integral over a stated range.
- Theorem: the spectrum vanishes identically when the density is zero, so the vacuum subtraction
  is exact in the empty medium. The sanity check for this layer.
- Theorem: the spectrum's dependence on the parton's colour representation is through an overall
  Casimir factor, at this order, obtained from
  `EpsilonEridani.QFT.QCD.RepresentationColor`. The medium dependence enters only through the
  broadening kernel, hence only through the dipole cross section.
- Definition: the vacuum splitting kernel is taken from `EpsilonEridani.Generator.Splitting`, and
  the medium-induced spectrum is defined as a modification of it, not as an independent object, so
  that the collinear limit reproduces the vacuum kernel. Theorem: it does.

### 3.3 The LPM interference

- Theorem: the incoherent sum over scattering centres, obtained by dropping the interference
  between emissions off different centres, gives a spectrum proportional to the inverse emission
  energy — the Bethe–Heitler form — and is linear in the path length.
- Theorem: the interference terms are negative in the coherent regime, so the full spectrum is
  below the incoherent sum there. This is the LPM suppression and it is a statement about a sign,
  provable from the ordered-integral representation.
- Theorem: below the characteristic energy the spectrum behaves as the inverse square root of the
  emission energy, with an explicit remainder; above it, as the inverse energy. Both are asymptotic
  statements with remainders, via `TauCeti.Analysis.Asymptotics.Lemmas`, proved from the integral
  representation of 3.2.
- ⚠ The conventional closed form of this spectrum is written with Bessel functions, which are
  absent from both Mathlib and TauCeti. The roadmap does not build them. The asymptotics above are
  proved from the integral representation directly; the closed form is not among the roadmap's
  deliverables and no statement depends on it.
- Theorem: the two asymptotic forms match at the characteristic energy to leading order, so the
  spectrum is continuous across the regime boundary, and the matching fixes the relative
  normalisation. Without this, the piecewise description is not a description of one function.

### 3.4 Mean radiative energy loss

Definition: the mean radiative loss is the first moment of the spectrum in the emission energy over
the kinematically allowed range.

- Theorem, in the coherent regime: the loss is proportional to the coupling, the Casimir of the
  parton's representation, `qhat` and the square of the path length. The quadratic path-length
  dependence follows from the inverse-square-root spectrum extending up to the characteristic
  energy, which is itself quadratic in the path length; the proof is that composition and it is
  the mathematical content of the LPM effect.
- Theorem, in the incoherent regime: the loss is linear in the path length, and the crossover
  between the two laws is at the path length identified in 1.5.
- Theorem: the loss is bounded above by the parton energy, and the bound is saturated at a path
  length that is computed. Beyond it the eikonal hypothesis under which the spectrum was derived
  fails; state the boundary of validity explicitly rather than extrapolating through it.
- Theorem: the fluctuation of the loss — the quenching weight, the probability distribution of the
  total energy radiated — is the compound Poisson distribution built from the spectrum as its Lévy
  measure, hence a convolution semigroup in path length by the same Layer 2 machinery. The
  quenching weight has a discrete component at zero loss, whose weight is the no-emission
  probability; relate it to the Sudakov form factor of `EpsilonEridani.QFT.Shower.Sudakov`, which
  is the same object in the vacuum case.

### 3.5 Opacity expansion against multiple soft scattering

Definition: the opacity is the ratio of the path length to the mean free path. Definition: the
opacity expansion is the formal series in the number of scatterings, indexed by a natural number,
with the order-`N` term the ordered-simplex integral over `N` scattering positions.

- Theorem: the order-one term is computable in closed form and reproduces the Bethe–Heitler
  spectrum in the incoherent regime, with a logarithmic enhancement in the path length that the
  multiple-soft-scattering kernel does not produce.
- Theorem: the expansion parameter is the opacity, and the order-`N` term is bounded by the `N`-th
  power of the opacity over `N` factorial, from the simplex volume. Hence the series converges for
  a medium of finite opacity; state the bound, which is the honest form of "the expansion is good
  at low opacity".
- Theorem: the multiple-soft-scattering resummation of 2.4 is the limit of the expansion in which
  the Lévy measure is replaced by its second moment, and it therefore resums all orders while
  discarding the tail. The two approximations are not nested: neither is a special case of the
  other, and the roadmap states this as a theorem about their Lévy measures rather than as a
  remark.
- Theorem: the two agree on the second moment of the transverse-momentum distribution and on the
  leading quadratic path-length dependence of the loss, and disagree on the spectrum at emission
  energies above the characteristic energy and on all moments beyond the second.
- **Open question.** Which resummation is correct at the opacity realised in a nucleus of mass
  number of order two hundred is not settled, and this roadmap does not settle it. What the
  roadmap delivers is the precise statement of the disagreement — the moments and the spectral
  region in which the two differ, from the theorem above — so that a measurement can be posed as
  a discrimination between them. This is named as an open question and is not a milestone.

### 3.6 Colour factors

- Theorem: at fixed medium, the ratio of the mean radiative loss of a gluon to that of a quark
  equals the ratio of the adjoint to the fundamental Casimir, which is `9/4` for three colours.
  Proved from `EpsilonEridani.QFT.QCD.CasimirDerivation` and
  `EpsilonEridani.QFT.QCD.RepresentationColor` together with the Casimir factorisation of 3.2.
- Theorem, the boundary of that statement: the ratio of *observed* suppressions for
  gluon-initiated and quark-initiated hadron production is not `9/4`, because it depends on the
  production spectra and the fragmentation functions as well as on the loss. The roadmap therefore
  keeps the loss ratio and the observable ratio as two distinct quantities, and this theorem is the
  statement that they differ; the observable ratio is expressed through the loss ratio, the
  spectral index of the production spectrum, and the fragmentation functions of `Hadronization`.

### 3.7 Mass dependence and the dead cone

- Definition: the dead-cone suppression factor for a parton of mass `m` and energy `E` radiating
  at angle `θ`, as the ratio of the massive to the massless emission probability.
- Theorem: it equals one at zero mass, is monotone decreasing in the mass at fixed energy and
  angle, and tends to zero as the angle goes to zero at fixed nonzero mass. The vacuum statement is
  cited to `JetsAndEventShapes` and not reproved; what is proved here is the medium extension.
- Theorem: the medium-induced spectrum for a massive parton is the massless spectrum times a
  suppression factor that depends on the mass only through the ratio of the mass to the energy, at
  the stated accuracy, and which reduces to one in the massless limit.
- Corollary: at equal energy and equal path length, the mean radiative loss is ordered by mass,
  so a charm quark loses more than a bottom quark and a light quark more than either. State the
  hypotheses; the ordering is a theorem about the radiative loss, and the corresponding ordering of
  observed suppressions requires the production spectra as in 3.6.
- Theorem: the mass dependence and the colour dependence are independent at this order, so the
  suppression factorises into a Casimir factor and a mass factor. This is what makes a joint
  measurement of the two possible in principle, and it is stated as a proposition with its
  accuracy.

### Examples

- The order-one opacity term for a single static scattering centre, in closed form.
- The massless limit of the dead-cone factor, equal to one.
- The gluon-to-quark loss ratio `9/4`.
- The quenching weight for a medium of vanishing opacity: a point mass at zero loss.
- A medium of length equal to the mean free path: the opacity is one, the series bound of 3.5 is
  the exponential bound, and the LPM suppression of 3.3 is absent by 3.1.

### Dependencies

Layers 1 and 2. `JetsAndEventShapes` for the vacuum dead cone and the jet definitions.
`Hadronization` for the fragmentation functions appearing in 3.6.
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`, `EpsilonEridani.QFT.QCD.*`,
`EpsilonEridani.Generator.Splitting`, `EpsilonEridani.QFT.Shower.Sudakov`.

---

## Layer 4: formation time and hadronization in the nuclear environment

References: EIC Yellow Report Vol. II §7.4.2; Accardi, Arleo, Brooks, d'Enterria, Muccifora,
*Riv. Nuovo Cim.* 32 (2009) 439; Bialas and Gyulassy, *Nucl. Phys. B* 291 (1987) 793;
Kopeliovich, Nemchik, Predazzi, Hayashigaki, *Nucl. Phys. A* 740 (2004) 211; Airapetian et al.
(HERMES), *Nucl. Phys. B* 780 (2007) 1.

### 4.1 Formation time of the hadron, and the criterion

Definition: the formation time of a hadron carrying momentum fraction `z` of a parton of energy
`ν` is a function of `z` and `ν` with the two standard limiting forms — proportional to `ν` times
a function of `z` vanishing at `z = 1` in the Lund picture, and proportional to `z` times `ν` over
a squared momentum in the colour-dipole picture. Both are defined; they are distinct hypotheses
about the same quantity and the roadmap carries both.

- Definition: `FormedInside` is the predicate that the formation time is below the path length of
  Layer 0, `FormedOutside` its negation.
- Theorem: for each of the two formation-time forms, the predicate is monotone in `ν` at fixed
  `z` — increasing `ν` moves formation outside — and the threshold value of `ν` is computed. This
  monotonicity is what makes `ν` the discriminating variable throughout this layer.
- Theorem: the two formation-time forms give threshold curves in the `(z, ν)` plane that cross,
  and the region where they disagree is characterised. A measurement in that region distinguishes
  them; state this using the identifiability language of
  `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`.
- Theorem: the fraction of events with `FormedInside` is the path-length distribution of 0.3
  evaluated above the formation time, hence computable from the geometry, and it decreases
  monotonically in `ν`.

### 4.2 The medium-modified fragmentation function

Definition: `mediumFragmentation` is a function of the momentum fraction, the scale, the energy
transfer and the medium data, defined as the analogue of the vacuum object of
`EpsilonEridani.Particles.Fragmentation.Basic`.

- Theorem: it reduces to the vacuum fragmentation function when the density is zero. This is the
  reduction theorem that convention 4 exists to make statable, and it is the definitional check on
  every construction in this layer.
- Theorem: its support is contained in the unit interval in the momentum fraction, and it is
  nonnegative, inherited from the vacuum object.
- Theorem on the momentum sum rule: the vacuum sum rule is *not* inherited. Under the rescaling
  hypothesis of 4.3 the total momentum carried by hadrons is reduced by exactly the radiated
  energy, so a modified sum rule holds with the energy loss appearing explicitly; under the
  absorption hypothesis momentum is not conserved within the observed channel at all, because the
  absorbed hadron's momentum is transferred to the medium. State both, and state which
  normalisation each definition is given, since an incorrectly normalised medium-modified
  fragmentation function produces a nuclear ratio that is wrong by a constant.
- Theorem: the convolution of the medium-modified fragmentation function with the hard cross
  section, using `EpsilonEridani.QFT.Factorization.Convolution.Collinear`, is well defined and the
  convolution's properties from `EpsilonEridani.QFT.Factorization.Convolution.Properties` carry
  over, since the support and integrability hypotheses are met.

### 4.3 The two hypotheses, and what discriminates them

`RescalingHypothesis`: the medium-modified fragmentation function is the vacuum one evaluated at a
rescaled momentum fraction, with the rescaling given by the fractional energy loss, and averaged
over the quenching weight of 3.4. Energy is lost by the parton before hadronization.

`AbsorptionHypothesis`: the medium-modified fragmentation function is the vacuum one times a
survival factor, computed from a hadron-medium absorption cross section and the path length
remaining after formation. The hadron is formed and then attenuated.

Neither is assumed anywhere in this roadmap.

- Theorem: both hypotheses produce a suppression that is monotone increasing in the momentum
  fraction at fixed energy transfer, so the momentum-fraction dependence alone does not
  discriminate them.
- Theorem: they differ in the energy-transfer dependence at fixed momentum fraction. Under the
  rescaling hypothesis the suppression depends on the energy transfer only through the ratio of
  the loss to the energy, which decreases with the energy transfer; under the absorption
  hypothesis the suppression depends on the energy transfer through the formation time, which
  moves formation outside the nucleus and so also decreases the suppression — but with a different
  functional form, computed. State the difference as an explicit inequality on a stated domain, so
  that it is a discriminating observable in the sense of
  `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`.
- Theorem: the double ratio of the suppression for two hadron species with different formation
  times and different absorption cross sections separates the two hypotheses more sharply than
  either single ratio, because the rescaling hypothesis predicts a double ratio that depends only
  on the vacuum fragmentation functions while the absorption hypothesis predicts one that depends
  on the ratio of absorption cross sections. Give both expressions.
- Theorem: the two hypotheses are not exclusive, and the convex combination is also consistent
  with the constraints of 4.2. The roadmap states the two-parameter family and the observable that
  fixes the mixing parameter, rather than forcing a choice.

### 4.4 The nuclear modification ratio for semi-inclusive production

Definition: the nuclear modification ratio is the ratio of the hadron multiplicity per deep
inelastic scattering event on the nucleus to that on the nucleon, at fixed kinematics, built on
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`.

- Theorem: under the factorisation hypothesis of 0.4, it is the product of an initial-state factor
  — the ratio of nuclear to nucleon parton distributions from `NuclearPartonDistributions`,
  convolved with the hard cross section — and a final-state factor built from
  `mediumFragmentation`.
- Theorem: the initial-state factor is independent of the energy transfer at fixed momentum
  fraction and scale, while the final-state factor is not, by 4.3. Together with 0.4 this gives:
  the decomposition is unique, and the energy-transfer dependence at fixed momentum fraction and
  scale measures the final-state factor alone. This is the theorem that makes the separation of
  initial-state and final-state effects an operation on data rather than a modelling choice, and
  it is the central result of the layer.
- Theorem: the final-state factor equals one when the density is zero, so the ratio reduces to the
  initial-state factor for the free nucleon.
- Theorem: the ratio is not bounded above by one in general. Under either hypothesis the
  final-state factor is at most one at large momentum fraction, but the redistribution of energy to
  smaller momentum fractions can produce an enhancement there; the momentum fraction at which the
  final-state factor crosses one is computed under each hypothesis. Stating this prevents the
  common error of reading any enhancement as an initial-state effect.

### 4.5 Mass-number dependence

Definition: the mass-number exponent of the suppression is the logarithmic derivative of one minus
the final-state factor with respect to the mass number, at fixed kinematics. Read off a Mellin
moment using `EpsilonEridani.QFT.Factorization.Convolution.Mellin`.

- Theorem: under the absorption hypothesis with a constant absorption cross section, the exponent
  is `1/3`, because the suppression is linear in the path length and the mean path length scales as
  the cube root of the mass number by the corollary of 0.3.
- Theorem: under the rescaling hypothesis with a radiative loss quadratic in the path length, by
  3.4, the exponent is `2/3`, because the suppression is then linear in the *second* moment of the
  path length, which scales as the two-thirds power by the same corollary.
- Corollary: the mass-number exponent discriminates the two hypotheses, and the discrimination is
  a consequence of the geometry of Layer 0 together with the path-length law of Layer 3 — not an
  independent modelling input. This is the sharpest single discriminator in the layer and it is
  why Layer 0 computes path-length moments rather than just a mean.
- Theorem: the exponent is not constant in the kinematics. It interpolates between the two values
  where the hypotheses mix, by 4.3, and it tends to zero at large energy transfer where formation
  moves outside the nucleus, by 4.6. State the limits; a measured exponent must be compared with a
  prediction at the same kinematics.

### 4.6 The large-energy-transfer limit

- Theorem: above the threshold energy transfer of 4.1, formation occurs outside the nucleus for
  every path length in the support of the distribution of 0.3, and the absorption contribution to
  the final-state factor vanishes identically.
- Theorem: the rescaling contribution does not vanish in that limit; it tends to one as the ratio
  of the loss to the energy goes to zero, at a rate computed from 3.4 and stated with a remainder
  via `TauCeti.Analysis.Asymptotics.Lemmas`. The two hypotheses therefore have different
  approaches to unity, and the *rate* is the discriminating observable in this limit.
- Theorem: the limit is approached non-uniformly in the momentum fraction — the threshold energy
  transfer of 4.1 depends on the momentum fraction and diverges as the momentum fraction tends to
  one — so the large-energy-transfer limit and the large-momentum-fraction limit do not commute.
  State the iterated limits and their difference; a statement about "the high-energy limit" of the
  nuclear ratio is ambiguous without it.

### Examples

- The exponents `1/3` and `2/3` for the two hypotheses on a uniform sphere.
- The empty medium: final-state factor identically one, ratio equal to the initial-state factor.
- A pion-to-proton double ratio under each hypothesis, exhibiting the different dependence on the
  absorption cross sections.
- The uniform-slab geometry with a constant absorption cross section, where the final-state factor
  is available in closed form as one minus the mean of an exponential over a uniform path-length
  distribution.

### Dependencies

Layers 0 through 3. `Hadronization` for the vacuum fragmentation functions, their evolution and
the hadron formation picture. `NuclearPartonDistributions` for the initial-state factor.
`EpsilonEridani.Particles.Fragmentation.Basic`,
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`,
`EpsilonEridani.QFT.Factorization.Convolution.Collinear` and `.Mellin`,
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`.

---

## Layer 5: azimuthal anisotropy and collective correlations

References: EIC Yellow Report Vol. II §7.3.5; Voloshin and Zhang, *Z. Phys. C* 70 (1996) 665;
Borghini, Dinh, Ollitrault, *Phys. Rev. C* 64 (2001) 054901; Bilandzic, Snellings, Voloshin,
*Phys. Rev. C* 83 (2011) 044913; Dusling, Mace, Venugopalan, *Phys. Rev. Lett.* 120 (2018)
042002; Weller and Romatschke, *Phys. Lett. B* 774 (2017) 351.

### 5.1 Azimuthal harmonics at finite multiplicity

Definition: an event is a finite family of azimuthal angles, of length the multiplicity `M`. The
`Q`-vector of harmonic `n` is the sum over particles of the complex exponential of `n` times the
angle, following the conventions of `TauCeti.Analysis.Fourier.AddCircle` and of
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics`.

Definition: the *true* anisotropy coefficient `vn` of an event is the `n`-th Fourier coefficient of
the underlying single-particle density on the circle, which is a parameter, not an observable.

- Theorem: the squared modulus of the `Q`-vector has expectation `M + M (M - 1) vn²` under the
  hypothesis that the particles are independent draws from the single-particle density. The term
  linear in `M` is the self-correlation and it does not vanish at any multiplicity; hence the
  naive estimator built from the `Q`-vector alone is biased at order one over `M`.
- Definition and theorem: the unbiased two-particle estimator subtracts the self-correlation, and
  its expectation is exactly `vn²`. This is the precise sense in which the coefficients are well
  posed at finite multiplicity, which the roadmap requires before any statement about them.
- Theorem: the variance of the two-particle estimator is of order one over `M²` at fixed `vn`, so
  the estimator is consistent as the multiplicity grows. State the rate; it is what makes the
  multiplicity dependence of 5.6 a measurement rather than an artefact.
- Theorem: `vn` is only defined relative to a choice of polar axis and reference angle. The
  modulus is invariant under rotation and the phase is not; state the invariance, since it is what
  makes the event-plane construction of 5.2 necessary.

### 5.2 Event plane and cumulants: two definitions, one identity

Definition: `vnEventPlane` estimates the coefficient by first estimating the event-plane angle from
the `Q`-vector and then projecting, with the resolution correction as an explicit factor.

Definition: `vnCumulant` at order two, written `vn{2}`, is the square root of the unbiased
two-particle estimator of 5.1. At order four, `vn{4}`, it is the fourth root of the negative of the
four-particle cumulant.

- Theorem, the moment identity: `vn{2}² = ⟨vn²⟩` and `vn{4}⁴ = 2 ⟨vn²⟩² - ⟨vn⁴⟩`, the averages
  being over events at fixed multiplicity. Proved as an identity of moments of the event-by-event
  distribution of `vn`, with no dynamical input.
- Corollary: `vn{2} ≥ vn{4}`, with equality if and only if `vn` does not fluctuate event to event.
  The difference measures the fluctuation width, and this corollary is the reason convention 10
  forbids identifying the two definitions.
- Theorem: `vnEventPlane` lies between `vn{4}` and `vn{2}`, with the position determined by the
  event-plane resolution; in the limit of perfect resolution it equals `vn{2}` and in the limit of
  poor resolution it equals `vn{4}`. Hence the three definitions are ordered and the ordering is
  proved, not asserted.
- Theorem: for a Gaussian event-by-event distribution of `vn` with mean `v̄` and width `σ`, both
  cumulants are computed in closed form and the difference of their squares is `2σ²` to leading
  order. The worked example that makes the identity usable.

### 5.3 Non-flow and the four-particle cumulant

Definition: a *non-flow* contribution is a correlation among a bounded number of particles that is
not mediated by the event plane — for instance the two decay products of a resonance, or the
fragments of a single jet.

- Theorem, the combinatorial identity: the four-particle cumulant of a distribution consisting of
  a harmonic modulation plus a `k`-particle non-flow cluster receives no contribution from the
  non-flow cluster at leading order in the multiplicity, whereas the two-particle cumulant receives
  a contribution of order one over `M`. The proof is a counting argument on which particle tuples
  the cumulant's alternating sum retains, and it is the mathematical content of the cumulant
  method.
- Theorem: the residual non-flow in the four-particle cumulant is of order one over `M³` for a
  two-particle cluster, and the exponent for a `k`-particle cluster is computed. State the general
  exponent; "cumulants suppress non-flow" is a claim about an exponent and the exponent depends on
  the cluster size.
- Theorem: the suppression fails for a cluster whose size grows with the multiplicity. Exhibit such
  a case; it is the boundary of the method and it is stated as a theorem rather than left implicit.
- Theorem: the four-particle cumulant of a purely non-flow event, with no harmonic modulation at
  all, is nonnegative, so `vn{4}` is undefined — its fourth power would be negative. This is the
  diagnostic that a measured `vn{4}` is evidence of a genuine collective modulation, and it is a
  provable statement about the sign of a cumulant.

### 5.4 The two candidate origins, as hypotheses

Definition: the eccentricity `εn` of harmonic `n` is the `n`-th harmonic moment of the transverse
density of the overlap region, computed from the geometry of Layer 0.

`FinalStateResponseHypothesis`: `vn = kappa n * εn` up to corrections of second order in the
eccentricity, for a *response coefficient* `kappa n` that depends on the system and on the
transverse density but not on the harmonic's phase.

`InitialStateCorrelationHypothesis`: `vn` arises from momentum-space correlations among the gluon
fields of the projectile and target, taken from `SmallXAndSaturation` together with the
multi-parton correlators of `MultiPartonCorrelations`, with no final-state response and with no
dependence on the eccentricity of the overlap region.

Neither is assumed. The following are theorems about the pair.

- Theorem: the two hypotheses are distinguished by the correlation between `vn` and `εn` at fixed
  multiplicity. The final-state-response hypothesis predicts a positive correlation with a slope
  `kappa n`; the initial-state hypothesis predicts none once the multiplicity is fixed. State this
  as an injectivity statement on the map from hypothesis to predicted joint distribution, using
  `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`.
- Theorem: the two are also distinguished by the system-size dependence at fixed geometry. The
  final-state-response hypothesis makes `kappa n` grow with the transverse density at fixed
  eccentricity, since a response accumulates along the path of Layer 0; the initial-state
  hypothesis does not. Give both predicted dependences.
- Theorem: they differ in the ordering of `vn` by hadron mass at low transverse momentum, and the
  ordering predicted by the final-state-response hypothesis is derived from the common-velocity
  consequence of a response, stated as a hypothesis on the response and not as a fluid
  calculation. ⚠ No relativistic fluid dynamics exists upstream and none is built here; `kappa n`
  is a defined parameter, and every statement about it in this roadmap is a statement about the
  parameter.
- Theorem: the two hypotheses are not exclusive; their convex combination reproduces either limit,
  and the family is parametrised by one mixing parameter per harmonic. State which of the three
  observables above fixes it.

### 5.5 What a measured anisotropy does and does not imply

- Theorem: the proposition "a nonzero `vn` implies the final-state-response hypothesis" is false.
  The proof exhibits a model satisfying the initial-state-correlation hypothesis with `vn` nonzero
  and `kappa n` zero, constructed from the correlators of `SmallXAndSaturation`. The counterexample
  is the content; the theorem is a statement about what cannot be concluded.
- Theorem: the proposition "a nonzero `vn{4}` implies the final-state-response hypothesis" is also
  false, by the same counterexample, since the initial-state correlations are genuinely
  multi-particle and survive the cumulant of 5.3. This is the sharper statement and it is the one
  that matters, because the four-particle cumulant is often taken as the decisive evidence.
- Theorem: the conjunction of a nonzero `vn`, a positive `vn`-to-`εn` slope, and the system-size
  dependence of 5.4 *is* inconsistent with the pure initial-state hypothesis. State the implication
  in this direction with its hypotheses; it is the positive statement the roadmap can make, and it
  is weaker than the one usually claimed.
- The question of which hypothesis holds in the small systems accessible at an electron-ion
  collider is an **open question** and this roadmap does not answer it. The roadmap delivers the
  two hypotheses, the three discriminating observables, and the two impossibility theorems above.
  No milestone in this roadmap is discharged by answering it.

### 5.6 Multiplicity dependence

- Theorem: at fixed geometry, `vn{2}` and `vn{4}` have the multiplicity dependence induced by the
  estimator variances of 5.1 plus the genuine dependence of `vn` on the multiplicity; the two are
  separated by the theorem that the estimator bias is a known function of `M` alone.
- Theorem: the difference `vn{2} - vn{4}` is, by 5.2, a function of the fluctuation width of the
  event-by-event `vn` distribution, hence a statement about the geometry fluctuations of Layer 0 —
  and therefore independent of which of the two hypotheses of 5.4 holds. State this independence;
  it is what makes the difference a geometry measurement rather than a dynamics measurement.
- Theorem: at multiplicities where the eccentricity fluctuations are dominated by the finite number
  of participating nucleons, the fluctuation width is computed from the geometry of Layer 0 with an
  explicit dependence on the participant number, so the difference of cumulants has a parameter-free
  prediction. This is the strongest quantitative statement the layer makes and it is a statement
  about geometry alone.

### Examples

- The infinite-multiplicity limit: all three definitions of 5.2 coincide when the fluctuations
  vanish.
- A pure non-flow event built from two-particle clusters: `vn{2}` nonzero of order one over the
  square root of `M`, and the four-particle cumulant of the wrong sign so that `vn{4}` is
  undefined, by 5.3.
- A Gaussian fluctuation model: both cumulants in closed form, and the difference of squares equal
  to twice the variance.
- A single event class with the geometry of a sphere from Layer 0: `ε2` computed, and the predicted
  `v2` under the final-state-response hypothesis for a given `kappa 2`.

### Dependencies

Layer 0 for the geometry and the eccentricity. `SmallXAndSaturation` for the gluon-field
correlators of the initial-state hypothesis. `MultiPartonCorrelations` for the multi-parton
correlators those correlations are built from. `JetsAndEventShapes` for the particle-level and jet
definitions used to characterise non-flow. `TauCeti.Analysis.Fourier.AddCircle`,
`Mathlib.Probability.Martingale.Basic` and `TauCeti.Probability.Moments.Basic` for the estimator
statements.

---

## Dependency graph

```
                       LightNuclei        NuclearPartonDistributions
                            |                        |
                            v                        v
                   Layer 0: medium, path length, initial/final split
                            |                        |
      SmallXAndSaturation   |                        |
               |            v                        |
               +---> Layer 1: transport coefficients |
                            |                        |
                            v                        |
                   Layer 2: broadening semigroup      |
                            |                        |
          EpsilonEridani.QFT.QCD (Casimirs)          |
                            |                        |
                            v                        |
                   Layer 3: induced radiation, LPM, opacity
                            |                        |
      Hadronization  -------+                        |
      JetsAndEventShapes ---+                        |
                            v                        v
                   Layer 4: formation time and medium hadronization
                                     (consumes the initial-state factor)

                   Layer 0  ------>  Layer 5: azimuthal anisotropy
      SmallXAndSaturation ------>         (geometry from Layer 0;
      MultiPartonCorrelations --->          correlators from small-x)
```

Layer 5 depends on Layer 0 only. It is independent of Layers 1 through 4, and deliberately so: the
collective sector shares the geometry with the transport sector and nothing else, and a dependence
of Layer 5 on the transport coefficients would smuggle the final-state-response hypothesis into the
definitions.

## Acceptance examples

The roadmap is certified by the following statements, each checkable against the material it
claims to rest on.

1. For a uniform sphere of radius `R`, with production points uniform in the volume and isotropic
   directions, `⟨ℓ⟩ = 3R/4` and `⟨ℓ²⟩ = 4R²/5`; hence `⟨ℓ²⟩/⟨ℓ⟩² = 64/45`.
2. For a uniform slab of thickness `L` at normal incidence, `⟨ℓ⟩ = L/2`, `⟨ℓ²⟩ = L²/3`, and the
   geometry variance is `L²/12`, which is the discrepancy quantified in 0.3 and instantiated in
   1.6.
3. A monotone function on the transverse plane vanishing at the origin and saturating at large
   argument which is *not* negative-definite, exhibiting a modelled dipole cross section whose
   broadening kernel fails to be a positive measure at some path length — the counterexample of
   2.2.
4. The harmonic-oscillator kernel is a Gaussian with second moment `qhat * ℓ` and fourth moment
   twice the square of the second, while the compound-Poisson kernel with the same second moment
   has a strictly larger fourth moment — the quantitative failure of 2.4.
5. The geometry-averaged harmonic-oscillator kernel is not an element of any convolution semigroup
   in path length, with the obstruction equal to the geometry variance of item 2 — the theorem of
   2.6.
6. The ratio of the adjoint to the fundamental quadratic Casimir for three colours is `9/4`,
   computed from `EpsilonEridani.QFT.QCD.CasimirDerivation`, and it equals both the ratio of
   transport coefficients of 1.4 and the ratio of mean radiative losses of 3.6, while *not*
   equalling the ratio of observed suppressions.
7. The medium-induced spectrum behaves as the inverse square root of the emission energy below the
   characteristic energy `qhat * L² / 2` and as the inverse energy above it, with the two forms
   matching at that energy — the asymptotics of 3.3, proved from the integral representation with
   no Bessel functions.
8. The mean radiative energy loss is quadratic in the path length in the coherent regime and linear
   in the incoherent regime, and the crossover path length equals the formation length at the
   characteristic energy — items 1.5 and 3.4 agreeing.
9. The dead-cone suppression factor equals one at zero quark mass and is monotone decreasing in the
   mass, giving the loss ordering of 3.7 at equal energy and path length.
10. The medium-modified fragmentation function equals the vacuum fragmentation function of
    `Hadronization` when the density is zero, and the final-state factor of the nuclear
    modification ratio is then identically one.
11. The mass-number exponent of the suppression is `1/3` under the absorption hypothesis with a
    constant absorption cross section and `2/3` under the rescaling hypothesis with a quadratic
    path-length loss law — both following from item 1 together with 3.4.
12. At fixed momentum fraction and scale the initial-state factor is independent of the energy
    transfer while the final-state factor is not, so the decomposition of 0.4 is unique and the
    energy-transfer dependence measures the final-state factor alone.
13. `vn{2}² = ⟨vn²⟩` and `vn{4}⁴ = 2⟨vn²⟩² - ⟨vn⁴⟩`, hence `vn{2} ≥ vn{4}` with equality exactly
    when `vn` does not fluctuate.
14. For an event consisting of a harmonic modulation plus two-particle non-flow clusters, the
    two-particle cumulant has a non-flow contribution of order one over `M` and the four-particle
    cumulant one of order one over `M³`.
15. There is a model satisfying the initial-state-correlation hypothesis with `vn{4}` nonzero and
    the response coefficient `kappa n` identically zero; hence a nonzero four-particle cumulant does
    not imply a final-state response — the counterexample theorem of 5.5.

## References

- R. Abdul Khalek et al., "Science Requirements and Detector Concepts for the Electron-Ion
  Collider: EIC Yellow Report", *Nucl. Phys. A* 1026 (2022) 122447, arXiv:2103.05419. Volume II,
  Chapter 7, Sections 7.3.4 (particle propagation through matter and transport properties of
  nuclei), 7.3.5 (collective effects) and 7.4.2 (hadronization in the nuclear environment).
- R. Baier, Y. L. Dokshitzer, A. H. Mueller, S. Peigné, D. Schiff, "Radiative energy loss of high
  energy quarks and gluons in a finite volume quark-gluon plasma", *Nucl. Phys. B* 483 (1997) 291,
  hep-ph/9607355. The multiple-soft-scattering spectrum, the characteristic energy and the
  quadratic path-length law.
- R. Baier, Y. L. Dokshitzer, A. H. Mueller, D. Schiff, "Medium-induced radiative energy loss:
  equivalence between the BDMPS and Zakharov formalisms", *Nucl. Phys. B* 531 (1998) 403,
  hep-ph/9804212.
- B. G. Zakharov, "Fully quantum treatment of the Landau-Pomeranchuk-Migdal effect in QED and
  QCD", *JETP Lett.* 63 (1996) 952, hep-ph/9607440. The dipole formulation used in Layer 2.
- U. A. Wiedemann, "Gluon radiation off hard partons in a nuclear environment: opacity expansion",
  *Nucl. Phys. B* 588 (2000) 303, hep-ph/0005129.
- M. Gyulassy, P. Lévai, I. Vitev, "Reaction operator approach to non-Abelian energy loss",
  *Nucl. Phys. B* 594 (2001) 371, nucl-th/0006010. The opacity expansion and its first order.
- X.-N. Wang, X.-F. Guo, "Multiple parton scattering in nuclei: parton energy loss",
  *Nucl. Phys. A* 696 (2001) 788, hep-ph/0102230. The higher-twist route to the same transport
  coefficient.
- P. Arnold, G. D. Moore, L. G. Yaffe, "Photon and gluon emission in relativistic plasmas",
  *JHEP* 0206 (2002) 030, hep-ph/0204343. The resummation that interpolates between the two
  approximations compared in 3.5.
- J.-P. Blaizot, F. Dominguez, E. Iancu, Y. Mehtar-Tani, "Medium-induced gluon branching",
  *JHEP* 1301 (2013) 143, arXiv:1209.4585.
- Y. L. Dokshitzer, D. E. Kharzeev, "Heavy quark colorimetry of QCD matter", *Phys. Lett. B* 519
  (2001) 199, hep-ph/0106202. The dead cone and the mass dependence of 3.7.
- ALICE Collaboration, "Direct observation of the dead-cone effect in quantum chromodynamics",
  *Nature* 605 (2022) 440, arXiv:2106.05713. The vacuum measurement that the medium statement of
  3.7 is defined against.
- K. M. Burke et al. (JET Collaboration), "Extracting the jet transport coefficient from jet
  quenching in high-energy heavy-ion collisions", *Phys. Rev. C* 90 (2014) 014909,
  arXiv:1312.5003. The extraction whose non-uniqueness is formalised in 1.6.
- A. Accardi, F. Arleo, W. K. Brooks, D. d'Enterria, V. Muccifora, "Parton propagation and
  fragmentation in QCD matter", *Riv. Nuovo Cim.* 32 (2009) 439, arXiv:0907.3534. The review
  Layer 4 follows for the two hadronization hypotheses.
- A. Bialas, M. Gyulassy, "Lund model and an 'outside-inside' aspect of the inside-outside
  cascade", *Nucl. Phys. B* 291 (1987) 793. Formation time in the string picture.
- B. Z. Kopeliovich, J. Nemchik, E. Predazzi, A. Hayashigaki, "Nuclear hadronization: within or
  without?", *Nucl. Phys. A* 740 (2004) 211, hep-ph/0311220. The colour-dipole formation time and
  the competing criterion of 4.1.
- A. Airapetian et al. (HERMES Collaboration), "Hadronization in semi-inclusive deep-inelastic
  scattering on nuclei", *Nucl. Phys. B* 780 (2007) 1, arXiv:0704.3270. The measured
  energy-transfer and mass-number dependences that 4.3 and 4.5 are built to discriminate with.
- S. A. Voloshin, Y. Zhang, "Flow study in relativistic nuclear collisions by Fourier expansion of
  azimuthal particle distributions", *Z. Phys. C* 70 (1996) 665, hep-ph/9407282. The event-plane
  definition.
- N. Borghini, P. M. Dinh, J.-Y. Ollitrault, "Flow analysis from multiparticle azimuthal
  correlations", *Phys. Rev. C* 64 (2001) 054901, nucl-th/0105040. The cumulant construction and
  the non-flow suppression of 5.3.
- A. Bilandzic, R. Snellings, S. Voloshin, "Flow analysis with cumulants: direct calculations",
  *Phys. Rev. C* 83 (2011) 044913, arXiv:1010.0233. The finite-multiplicity estimators of 5.1.
- K. Dusling, M. Mace, R. Venugopalan, "Multiparticle collectivity from initial state correlations
  in high energy proton-nucleus collisions", *Phys. Rev. Lett.* 120 (2018) 042002,
  arXiv:1705.00745. The initial-state hypothesis and the counterexample of 5.5.
- R. D. Weller, P. Romatschke, "One fluid to rule them all: viscous hydrodynamic description of
  event-by-event central p+p, p+Pb and Pb+Pb collisions", *Phys. Lett. B* 774 (2017) 351,
  arXiv:1701.07145. The final-state-response hypothesis at small system size.
- I. J. Schoenberg, "Metric spaces and positive definite functions", *Trans. Amer. Math. Soc.* 44
  (1938) 522. Negative-definite functions, and the characterisation used in 2.2.
- K. Sato, *Lévy Processes and Infinitely Divisible Distributions*, Cambridge University Press
  1999, Chapters 1–2. The Lévy–Khintchine representation in the form used in 2.2.
- W. Feller, *An Introduction to Probability Theory and Its Applications*, Volume II, 2nd edition,
  Wiley 1971, Chapter XVII. Infinite divisibility and convolution semigroups.
- K.-J. Engel, R. Nagel, *One-Parameter Semigroups for Linear Evolution Equations*, Springer 2000,
  Chapters I–II. The generator, the Cauchy problem and the generation theorems used in 2.3.

# Roadmap: Wigner distributions, generalized TMDs, and orbital angular momentum

The most general single-parton distributions: functions of longitudinal momentum fraction,
transverse momentum, and transverse position simultaneously. These are the parents from which the
generalized and transverse-momentum-dependent distributions follow by integration, and they are
the objects in which parton orbital angular momentum has a direct expression.

This roadmap owns the parent distributions and the orbital-angular-momentum decomposition. The
daughters are `GeneralizedPartonDistributions` and `TransverseMomentumDistributions`, and the
reductions are proved here.

The development has a shape that is unusual among the parton-distribution roadmaps, and the shape
is the point. Almost every statement about a collinear or a transverse-momentum-dependent density
is a statement about a probability density: positive, with moments, admitting a number-density
reading. A Wigner distribution is not one. It is real, its two marginals are densities, and it is
not pointwise non-negative; the failure is not an approximation artefact but a consequence of the
transverse position and transverse momentum of a parton being conjugate. The roadmap therefore
asks for the positivity obstruction to be stated as a theorem with a named criterion behind it,
rather than carried as a remark: by Bochner's theorem, pointwise non-negativity in transverse
position at fixed transverse momentum is *equivalent* to positive definiteness of the parent
generalized distribution in the transverse momentum transfer, and TauCeti already has that
equivalence in exactly the form needed.

The second reason the area earns its own roadmap is orbital angular momentum. The two standard
decompositions of the nucleon spin — Jaffe–Manohar and Ji — differ in their orbital terms, and the
difference is not a matter of scheme convention. Both orbital terms are phase-space integrals of
*the same* generalized distribution against *the same* weight; what distinguishes them is the
gauge-link path in the operator defining that distribution. Making the gauge link explicit data
turns a folklore statement into an identity between three defined objects, with the third — the
potential angular momentum — given as a specific light-cone operator matrix element. The spin
decompositions themselves belong to `SpinStructure`; this roadmap supplies the distribution-level
expressions for their orbital terms and proves the identity relating them.

The final application is tomography at the Electron-Ion Collider: the objects of Yellow Report
Volume II, Section 7.2.4. The roadmap is deliberately honest about what that access amounts to.
No known observable determines a Wigner distribution pointwise, and the roadmap states that as an
identifiability question with the known partial constraints listed, not as a milestone to be
discharged by assuming access.

## Scope

Included:

- The off-forward, transverse-momentum-unintegrated quark and gluon correlators on the light
  front, with an explicit gauge-link path, and their complete leading-twist decompositions into
  generalized transverse-momentum-dependent distributions (GTMDs).
- The two gluon GTMD families distinguished by gauge-link topology — Weizsäcker–Williams and
  dipole — and the theorem that they are two distinct functions of the same kinematics, differing
  only in the link path.
- The hermiticity, parity and time-reversal constraints on the decomposition, the resulting
  classification of amplitudes as T-even or T-odd, and the derivation of the leading-twist count.
- Polynomiality of the transverse-momentum-integrated moments, and the positivity bounds that
  hold for GTMDs, with a statement of which of the daughters' constraints are inherited and which
  are genuinely new.
- Both reduction maps — integration over transverse momentum, and the forward limit in momentum
  transfer — proved as identities on the correlator, with their convergence hypotheses stated.
- The commuting square: both reductions in either order give the collinear density, and the square
  commutes.
- The characterisation of GTMDs annihilated by both reductions, so that the information invisible
  to both daughters is identified rather than alluded to.
- The Wigner distribution at zero skewness as the transverse Fourier transform of a GTMD; its
  reality; both marginals; and the obstruction to pointwise positivity, stated through Bochner's
  theorem and exhibited on a concrete model.
- The light-front frame as a precondition of the construction, with the transverse-boost argument
  that makes transverse position a good variable.
- Canonical and kinetic orbital angular momentum as phase-space integrals, their identification
  with the Jaffe–Manohar and Ji orbital terms, and the potential-angular-momentum term as the
  difference, given as a specific operator matrix element.
- The quark and gluon spin-orbit correlation as a distribution-level observable defined from a
  named GTMD.
- Compatibility of the reductions with scale and rapidity evolution, and the identifiability
  question for the parent distributions.

Not included. The daughter distributions themselves are not developed here: the GPD object model,
polynomiality in the skewness variable, the D-term and the double-distribution representation
belong to `GeneralizedPartonDistributions`, and the TMD object model, the Collins–Soper kernel,
the transverse-momentum-dependent factorisation theorems and the power corrections belong to
`TransverseMomentumDistributions`. The two spin sum rules are `SpinStructure`'s; the gravitational
form factors against which the Ji orbital term is measured are
`HadronMassAndEnergyMomentumTensor`'s; the evolution kernels, the running coupling and the
collinear splitting functions are `CollinearEvolution`'s. The small-x limits of the
Weizsäcker–Williams and dipole distributions, the dipole amplitude and rapidity evolution belong
to `SmallXAndSaturation`, which takes the definitions from here. The hard-scattering cross
sections of the processes that constrain these objects belong elsewhere: exclusive double
Drell–Yan and diffractive dijet production to `Diffraction`, dijet observables and their jet
definitions to `JetsAndEventShapes`, and the staple-link lattice computations of orbital angular
momentum to `LatticeBridge`. Sub-leading-twist GTMDs are not classified here; the power-suppressed
structure of the daughters is the daughters' business. Double-parton Wigner distributions and
multi-parton phase-space correlators belong to `MultiPartonCorrelations`. Non-zero-skewness
transverse Fourier transforms are excluded by convention, not by omission: see convention 4.

Material developed under this roadmap belongs in `EpsilonEridani/Particles/Parton/GTMD/`,
alongside the existing `PDF/`, `TMD/`, `GPD/` and `Unified/` directories, and is exported through
`EpsilonEridani.Particles.Parton.Basic` in the same way they are.

## Conventions and coordination with upstream

1. **Phase-space argument order is fixed.** Every signature orders the variables as longitudinal
   momentum fraction, then transverse momentum, then transverse position: `(x, kT, bT)`. A GTMD
   carries `(x, ξ, kT, ΔT)` in that order, skewness immediately after the momentum fraction.
   *Trap:* the two reductions integrate different transverse arguments, and with an inconsistent
   order a transposition of `kT` and `ΔT` type-checks and silently exchanges the two reductions.

2. **Transverse arguments are genuine two-vectors.** They are elements of
   `EuclideanSpace ℝ (Fin 2)`, never non-negative reals standing for a magnitude.
   *Trap:* the whole content of this roadmap is azimuthal. The spin-orbit amplitude and the
   canonical orbital angular momentum are carried by the scalar `(bT × kT)_z`, which vanishes
   identically after azimuthal averaging. The existing
   `EpsilonEridani.Particles.Parton.TMD.Basic` takes `kT : ℝ` as a magnitude, with the radial
   Jacobian `2 π k_T` supplied by hand in
   `EpsilonEridani.Particles.Parton.TMD.integrateTransverse`; it therefore cannot express an
   azimuthally dependent TMD at all. The reduction map to it consequently factors through an
   explicit azimuthal average, and that factorisation is stated as a definition here
   (Layer 2, 2.4) rather than left as a coincidence of conventions.

3. **One Fourier convention, and it is upstream's.** All transverse Fourier transforms are taken
   in Mathlib's `2π` convention through `TauCeti.fourierAtom`, as fixed in
   `TauCeti.Analysis.Bochner.Fourier.Convention`, with the inverse transform carrying the
   `1/(2π)²` and the forward transform none.
   *Trap:* `TauCeti.bochner` is stated in precisely this convention. A private convention with a
   different sign in the exponent or a symmetric `1/(2π)` split forces the positivity theorem of
   Layer 3 to be re-proved rather than applied, and the sign choice is exactly what decides
   whether the representing measure lives in `bT` or in `-bT`.

4. **Skewness is carried by the GTMD and is zero for the Wigner distribution.** The GTMD has a
   skewness argument `ξ` throughout. The Wigner distribution is defined only at `ξ = 0`; the
   object obtained by transforming at `ξ ≠ 0` is a GTMD in a different variable and keeps the name
   GTMD.
   *Trap:* at non-zero skewness the initial and final states differ in longitudinal momentum, the
   conjugate variable to `ΔT` is not a transverse position in any frame, and calling it one makes
   the marginal theorems of Layer 3 false. Naming the `ξ = 0` restriction in the type of the
   Wigner distribution, rather than as a side hypothesis on its lemmas, is what keeps the
   restriction from being forgotten.

5. **The gauge link is explicit data.** A correlator takes a link path as an argument — a value of
   an inductive type distinguishing the future-pointing staple, the past-pointing staple and the
   straight (Wilson) line, together with the transverse rung at light-cone infinity. It is never a
   typeclass instance and never a fixed default.
   *Trap:* the central theorem of Layer 4 is that the canonical and the kinetic orbital angular
   momentum are the *same* phase-space integral of the *same* amplitude with two *different* link
   paths. If the link is an instance, or defaulted, that theorem cannot be stated; if it is a
   `Prop` field asserting "the link is light-like", it asserts nothing. Process dependence of the
   T-odd amplitudes lives in the same datum, and is inherited unchanged from
   `TransverseMomentumDistributions`.

6. **Gluon GTMDs are always tagged.** Every gluon correlator carries its link topology, and every
   gluon GTMD is named Weizsäcker–Williams or dipole. An unqualified gluon GTMD is not a defined
   object in this roadmap.
   *Trap:* the two families agree in their kinematic arguments and differ only in the operator, so
   a shared name makes two inequivalent functions look like one, and makes the theorem that they
   differ (Layer 1, 1.5) unstatable.

7. **GTMDs are complex-valued, and reality is a theorem.** The amplitudes in the decomposition are
   `ℂ`-valued. Their reality at `ξ = 0`, where it holds, is derived from hermiticity of the
   correlator, and the T-even/T-odd classification is derived from the behaviour of the link path
   under time reversal.
   *Trap:* declaring the amplitudes real by fiat makes hermiticity vacuous and deletes the
   classification, which is the only thing that says which amplitudes can be non-zero for which
   link topology. It also makes the Layer 3 reality theorem — which is the statement that the
   Wigner distribution is real — a definitional triviality rather than a consequence of the
   operator structure.

8. **Scale and rapidity arguments are carried, and their kernels are cited.** Every distribution
   in this roadmap takes a renormalisation scale and a rapidity parameter. The evolution kernels
   themselves are not defined here: the collinear kernels come from `CollinearEvolution`, the
   Collins–Soper kernel from `TransverseMomentumDistributions`, the small-x rapidity kernel from
   `SmallXAndSaturation`. What this roadmap proves is the compatibility statement of Layer 5: each
   reduction map intertwines the parent evolution with the daughter evolution.
   *Trap:* an evolution equation stated afresh here would duplicate, and eventually contradict,
   three other roadmaps. Where the semigroup structure of an evolution is needed, it is taken from
   `TauCeti.Analysis.Semigroups.Defs` and `TauCeti.Analysis.Semigroups.Generator`, and existence
   and uniqueness for the abstract Cauchy problem from
   `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.CauchyProblem.Uniqueness`. Note that
   `TauCeti.Analysis.PDE` is elliptic theory and does not apply to an evolution equation.

9. **The physical and the analytic halves of an assumption bundle are separated.** Following
   `EpsilonEridani.Particles.Parton.TMD.IsTmdDensity` and
   `EpsilonEridani.Particles.Parton.TMD.Regularity`, each object introduced here carries a
   structure saying what it *means* to be that object (support, reality where it holds,
   hermiticity) separated from a structure carrying the measurability and integrability needed by
   the analysis, together with a lemma recording that the split is exact.
   *Trap:* a single bundle mixes a definition with an obligation, and a reduction theorem then
   silently consumes an integrability hypothesis under the guise of a physical one.

10. **No `Prop`-valued field with a placeholder witness.** A hypothesis that cannot yet be stated
    is omitted and named as a gap in prose. A `Prop`-typed structure field is satisfiable by
    `True` and a `def _ : Prop := sorry` is `sorryAx Prop`; both assert nothing while reading as a
    hypothesis. Where a condition is genuinely open — the positivity conjecture of Layer 3, the
    identifiability question of Layer 5 — it is written as a named statement labelled as such,
    never as a field of a structure that other results take as input.

11. **Orbital angular momentum signs are pinned once.** The orbital weight is the scalar
    `(bT × kT)_z = bT.1 * kT.2 - bT.2 * kT.1`, and the orbital angular momentum is defined with a
    leading minus sign, so that the relation to the spin-orbit amplitude reads
    `L_z = -∫ (kT‖²/M²) F₁₄` with no further sign. The nucleon mass normalising the amplitudes is
    an explicit argument, not a global constant.
    *Trap:* the minus sign in the `F₁₄` relation and the orientation of the cross product are
    independent choices, and getting either wrong flips the sign of the potential angular momentum
    — which is the one quantity in Layer 4 whose sign is a physics claim rather than a convention.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `EpsilonEridani.Particles.Parton.GPD.Basic` — the `GPD.Gpd` function type and the `GPD.Model`
  structure carrying `H` and `E`, the support and skewness-bound assumptions, and
  `GPD.ForwardLimitToPdfAtScale`. This is the target of the transverse-momentum reduction in
  Layer 2.
- `EpsilonEridani.Particles.Parton.GPD.Moments` and `.Polynomiality` — the moment interface and
  polynomiality in the skewness variable, which Layer 1's polynomiality statement must reduce to.
- `EpsilonEridani.Particles.Parton.GPD.Ambiguity` and `.DoubleDistribution` — the representation
  ambiguities of the daughter, cited so that Layer 2's characterisation of the reduction kernels
  does not re-derive them.
- `EpsilonEridani.Particles.Parton.TMD.Basic` — `TMD.Tmd`, `TMD.IsTmdDensity`, `TMD.Regularity`,
  `TMD.assumptions_iff` and `TMD.integrateTransverse`. The assumption-splitting pattern is copied;
  the function type is the target of the forward-limit reduction after azimuthal averaging.
  ⚠ Its transverse argument is a non-negative real magnitude, not a two-vector. See convention 2:
  the roadmap defines the vector-valued correlator here and states the azimuthal average as an
  explicit map into `TMD.Tmd`, rather than changing the upstream type.
- `EpsilonEridani.Particles.Parton.TMD.Reduction` — `TMD.collinearFromTmd`,
  `TMD.IntegratesToPdf` and `TMD.collinearFromTmd_nonneg`. The bottom edge of the commuting square
  of Layer 2 is this map.
- `EpsilonEridani.Particles.Parton.TMD.CollinsSoper` — the rapidity-parameter interface the
  GTMD inherits. ⚠ It is a TMD-level interface; the GTMD-level statement that a single
  Collins–Soper parameter suffices for the parent is a Layer 5 target here.
- `EpsilonEridani.Particles.Parton.PDF.Basic` — `PDF.Pdf` and `PDF.mellinMoment`, the corner of
  the commuting square.
- `EpsilonEridani.Particles.Parton.PDF.Positivity` and `.MsbarPositivity` — the collinear
  positivity statements, and in particular the fact that positivity of a parton density is
  scheme-dependent. Layer 1's positivity bounds must be consistent with this: the roadmap does not
  claim a positivity bound stronger than the one the collinear limit already qualifies.
- `EpsilonEridani.Particles.Parton.Unified.Basic` and `.Consistency` — `Unified.Model`,
  `Unified.Assumptions` and the bridge fields `tmdToPdf` and `gpdForward`. Layer 2 extends this
  container upward: the GTMD is the object of which `Unified.Model`'s three components are
  reductions, and the commuting square is the coherence condition the extended container carries.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds` — the deep-inelastic
  kinematic variables and their physical bounds, used to state the kinematic domain of Layer 0.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` — the theorem that finitely many
  bounded linear measurements of an infinite-dimensional density space leave a blind subspace that
  is not finite-dimensional, together with the positive counterpart that a strictly convex penalty
  restores uniqueness. Layer 5's identifiability question is posed against this machinery, and the
  point of posing it there is that the generic obstruction is already a theorem, so what remains
  open is the specific one.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness` — the reconciliation of
  shadow GPDs with uniqueness-from-partial-knowledge. Layer 5 cites it as the model for how the
  analogous GTMD statement should be shaped, and does not restate it.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Conjectures` — the house location for statements
  believed but unproved, which is where Layer 3's positivity conjecture and Layer 5's
  identifiability conjecture are recorded if they are recorded as Lean statements at all.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` — positive-semidefiniteness for
  the matrix form of the positivity bounds.
- `EpsilonEridani.QFT.Factorization.Basic` — the factorisation scaffolding, cited for the scale
  arguments of convention 8.

From TauCeti:

- `TauCeti.Analysis.Bochner.BochnerTheorem` — `TauCeti.bochner`, the equivalence between
  continuity together with `TauCeti.IsPositiveDefiniteSub`, and representability as the
  `fourierAtom` transform of a unique finite Borel measure; `TauCeti.bochner_posSemidef`, the same
  through the positive-definite-kernel form; `TauCeti.bochnerMeasure` and
  `TauCeti.integral_fourierAtom_bochnerMeasure`, the representing measure named explicitly; and
  `TauCeti.eq_bochnerMeasure` for its uniqueness. **This is the theorem the whole of Layer 3 rests
  on**, and the reason the positivity obstruction is a theorem here rather than a caveat.
- `TauCeti.Analysis.PositiveDefinite.AddGroup` — `TauCeti.IsPositiveDefiniteSub`, the
  subtraction-form positive-definiteness predicate appropriate to a real inner-product space,
  together with `TauCeti.isPositiveDefiniteSub_iff_posSemidef`,
  `TauCeti.IsPositiveDefiniteSub.conj_symm`, `.map_neg`, `.map_zero_re_nonneg` and
  `.norm_apply_le_map_zero_re`. The last of these is the bound that gives the GTMD positivity
  constraints of Layer 1 their sharp form.
- `TauCeti.Analysis.PositiveDefinite.Basic`, `.Continuity`, `.Normalize`, `.Function.Kernel` and
  `.Kernel.Bounds` — the general theory: continuity at the origin forcing uniform continuity, the
  value bounds, normalisation, and the function-kernel correspondence with its Cauchy–Schwarz
  bounds.
- `TauCeti.Analysis.Bochner.Fourier.Nonneg` — `TauCeti.fourier_re_nonneg_of_posSemidef`,
  `TauCeti.fourierInv_re_nonneg_of_posSemidef`, `TauCeti.fourier_eq_re_of_posSemidef` and
  `TauCeti.integrable_fourierInv_of_posSemidef`. These are the one-directional statements Layer 3
  uses when only positive definiteness, and not the full representation, is available.
- `TauCeti.Analysis.Bochner.Fourier.Convention` — the `fourierAtom` convention and the uniqueness
  of a finite measure determined by its transform.
- `TauCeti.Analysis.Bochner.CharFun.PositiveDefinite` — positive definiteness of a characteristic
  function, the probabilistic instance of the same fact, used for the model example of Layer 3.
- `TauCeti.Analysis.PositiveDefinite.PontryaginMeasure` and
  `TauCeti.Analysis.Fourier.Pontryagin.Measure` — the abstract-group form, used to state Layer 3's
  criterion once rather than separately in each transverse dimension.
- `TauCeti.Analysis.PositiveDefinite.SemigroupGroup.FourierLaplace.PositiveDefinite` — positive
  definiteness under a joint Fourier–Laplace transform, the form in which Layer 5's
  evolution-compatibility statement meets the positivity criterion.
- `TauCeti.Analysis.Fourier.Integrable`, `.Continuous`, `.Decay` and `.RiemannLebesgue` — the
  integrability and decay lemmas the convergence hypotheses of Layers 2 and 3 are expressed in.
- `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` and
  `TauCeti.Analysis.Distribution.TestFunction.Translation` — cutoffs and translation of test
  functions, for the regularised correlators of Layer 0.
- `TauCeti.Analysis.SpecialFunctions.Hermite.Function.Basic`, `.Fourier.Basic` and `.Oscillator` —
  `TauCeti.hermiteFunction`, its Fourier behaviour, and the harmonic-oscillator structure. These
  supply the concrete model in which Layer 3's negativity is exhibited by computation rather than
  asserted.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.CauchyProblem.Basic` and
  `.CauchyProblem.Uniqueness` — one-parameter semigroups with a generator and the abstract Cauchy
  problem with uniqueness, used for Layer 5's evolution compatibility.
- `TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank` and `.CompactPerturbation` — the Fredholm
  theory in which Layer 5's identifiability question is a statement about a kernel and a
  compactness property, rather than an informal complaint about data.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` — weak derivatives, for the differentiated
  correlators of Layer 4.
- `TauCeti.Probability.Moments.Basic` — moments, for the marginal statements of Layer 3.
- `TauCeti.Analysis.Matrix.Spectrum` and `TauCeti.Analysis.InnerProductSpace.L2.Product` — the
  spectral and product-space facts the matrix positivity bounds of Layer 1 are stated in.

From Mathlib:

- `Mathlib.Analysis.Fourier.FourierTransform`, `Mathlib.Analysis.Fourier.Inversion`,
  `Mathlib.Analysis.Fourier.FourierTransformDeriv` and
  `Mathlib.Analysis.Fourier.RiemannLebesgueLemma` — the transform, its inversion, its interaction
  with differentiation, and decay.
- `Mathlib.Analysis.Distribution.SchwartzSpace.Basic` and
  `Mathlib.Analysis.Distribution.SchwartzSpace.Fourier` — the Schwartz space and the transform on
  it, the class in which the interchange of limits in Layer 2 is unproblematic.
- `Mathlib.MeasureTheory.Measure.Prod` and `Mathlib.MeasureTheory.Integral.Prod` — the phase-space
  product measure and `MeasureTheory.integral_integral_swap`, the Fubini statement every reduction
  identity in Layer 2 factors through.
- `Mathlib.MeasureTheory.Integral.Bochner.Basic` and
  `Mathlib.MeasureTheory.Integral.DominatedConvergence` — Bochner integration and the dominated
  convergence used for the limits.
- `Mathlib.Analysis.InnerProductSpace.Basic` — the transverse plane as
  `EuclideanSpace ℝ (Fin 2)`.
- `Mathlib.LinearAlgebra.Matrix.PosDef` — positive semidefiniteness, for Layer 1's bounds.
- `Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform` — the Gaussian transform, for the
  model computations of Layers 3 and 4.

Genuine absences, and what the roadmap does about them:

- ⚠ **There is no Wigner transform anywhere upstream.** Neither Mathlib nor TauCeti has a Wigner
  function, a Weyl transform, a phase-space quasi-probability, or a Moyal product. The roadmap
  builds the transverse Wigner transform here, as a Fourier transform in one argument of a
  two-argument function, so that it is literally Mathlib's `fourierIntegral` composed with a
  partial application and inherits all of Mathlib's theory. It does not define a new transform
  with its own lemma set.
- ⚠ **There is no uncertainty principle and no Hudson-type theorem upstream.** Searching both
  libraries for an uncertainty relation returns nothing. The roadmap therefore does not appeal to
  one. The positivity obstruction is routed entirely through Bochner's theorem, which does exist,
  and the characterisation of the states whose Wigner function is non-negative — Hudson's theorem
  in the quantum-mechanical setting — is built here in the one-dimensional transverse case as
  Layer 3, 3.6, in the shape TauCeti's positive-definite theory would want.
- ⚠ **There is no Bessel function and no polylogarithm in either library.** Azimuthal Fourier
  transforms in two dimensions are conventionally written with Bessel functions. The roadmap
  therefore states every transverse transform as a two-dimensional integral against
  `TauCeti.fourierAtom` and never as a Bessel–Fourier series, and the azimuthal decomposition of
  Layer 2, 2.4 is stated as a circle average, not as a Fourier–Bessel expansion. No milestone
  waits on a Bessel function.
- ⚠ The docstring of `EpsilonEridani.Particles.Parton.GPD.Basic` states the support condition as
  `x < -1 ∨ 1 < x → H = 0`, while the `supportH` field of `GPD.Assumptions` states the narrower
  `x < 0 ∨ 1 < x → H = 0`. The reduction theorems of Layer 2 target the field, not the docstring,
  and the antiquark half of the support is carried explicitly by the hypotheses of those theorems
  rather than being assumed available from the daughter.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the invariant
  product, `Physlib.Relativity.Tensors.MetricTensor` and
  `Physlib.Relativity.Tensors.Contraction.Basic` for index contraction, and
  `Physlib.Relativity.LorentzGroup.Basic` for the covariance group, with
  `Physlib.Relativity.Tensors.LeviCivita.Basic` for the orbital angular momentum operator.

## Layer 0: the light-front phase space and the unintegrated off-forward correlator

References: Belitsky, Ji and Yuan, arXiv:hep-ph/0307383; Meissner, Metz and Schlegel,
arXiv:0906.5323; Burkardt, arXiv:hep-ph/0005108; Diehl, arXiv:hep-ph/0307382 §3; Yellow Report
Vol. II §7.2.4.

This layer builds the kinematics and the operator, and nothing else. Every later layer is a
statement about the object defined here, so the definitions are made once and made carefully.

### 0.1 The transverse plane and the light-front frame

The transverse plane is `EuclideanSpace ℝ (Fin 2)`, with the oriented area form
`ω (u, v) = u.1 * v.2 - u.2 * v.1` defined once and used for every cross product in the roadmap.
Define the light-front components of a four-momentum from
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, and prove:

- the light-front transverse-boost subgroup acts on transverse momenta by translation and on
  longitudinal momentum fractions trivially, so `x` and `kT` transform independently;
- the area form `ω` is invariant under the transverse rotations and under the transverse boosts.

The second statement is what makes the scalar `ω (bT, kT)` a legitimate orbital weight, and the
first is the precondition named in the introduction: transverse position is a good variable in the
light-front frame because the transverse boosts are Galilean there, not because of an
approximation. Both are theorems, and they are the reason the frame is fixed in the *type* of the
correlator rather than mentioned in a docstring.

### 0.2 Kinematics

A `Kinematics` structure carrying the momentum fraction `x`, the skewness `ξ`, the average
transverse parton momentum `kT`, the transverse momentum transfer `ΔT`, and the invariant momentum
transfer `t`, with the relation between `t`, `ξ`, `ΔT` and the target mass proved rather than
assumed, and the physical domain — `|x| ≤ 1`, `|ξ| ≤ 1`, `t ≤ t_min(ξ)` — carried by a separate
predicate in the manner of convention 9. The two distinguished subsets, `ξ = 0` and `ΔT = 0`, are
each given a name, because every reduction statement in the roadmap is restriction to one of them.

### 0.3 The gauge-link path as data

An inductive type `LinkPath` with constructors for the future-pointing staple, the past-pointing
staple, and the straight light-like line, each carrying the transverse position of its rung, plus
the operation of reversing a path and the statement that reversal exchanges the two staples and
fixes the straight line. Prove:

- the staple paths are the two that arise from the two orderings of the gauge-field resummation,
  and the straight line is not the limit of either;
- reversal is an involution, and it is the operation induced by time reversal on the correlator.

The classification of amplitudes as T-even or T-odd in Layer 1 is stated against this involution,
and the canonical-versus-kinetic theorem of Layer 4 is stated against these three constructors.
Convention 5 is what makes both possible.

### 0.4 The quark correlator

The unintegrated off-forward quark correlator: for a Dirac structure `Γ`, a link path `L`, a
flavour `i` and kinematics `K`, the light-cone Fourier transform of the bilocal quark bilinear
between hadron states of momenta `p` and `p'`, restricted to the light-front hyperplane. It is
`ℂ`-valued (convention 7) and depends on the hadron helicities, so it is a matrix in the helicity
indices; give it as a function into `Matrix (Fin 2) (Fin 2) ℂ`.

Prove the three structural properties:

- **hermiticity:** the correlator matrix at `(K, L)` is the conjugate transpose of the correlator
  at the kinematics with `ΔT ↦ -ΔT` and `ξ ↦ -ξ`;
- **parity:** the behaviour under simultaneous reflection of `kT` and `ΔT`;
- **time reversal:** the correlator at link path `L` equals the correlator at the reversed path,
  with a sign depending on `Γ`.

These three are the entire input to the classification of Layer 1. Each is a statement about the
operator, so each is proved once here and never re-derived.

### 0.5 The gluon correlators

The same construction for the gluon field strength, with the two contractions of the transverse
indices of `F^{+i}` and `F^{+j}` and — separately — the two link topologies. State the
Weizsäcker–Williams correlator (both links on the same side) and the dipole correlator (links on
opposite sides) as two definitions, each taking the same `Kinematics`. Prove hermiticity, parity
and time reversal for both.

### 0.6 Regularity

The analytic half, in the manner of convention 9: a `Regularity` structure carrying almost-
everywhere strong measurability in each transverse argument at fixed values of the others, local
integrability on the physical domain, and continuity in `ΔT` at `ΔT = 0`. The last is not
decoration: `TauCeti.bochner` requires continuity, and Layer 3's criterion is unavailable without
it. Record the `assumptions_iff`-style lemma that the physical and analytic halves are exactly the
content of the full bundle.

### Examples

- The correlator of a free quark of definite helicity, computed in closed form, with all three
  structural properties verified by calculation.
- A Gaussian light-front wave-function model: a two-parameter Gaussian in `kT` and `ΔT`, for which
  every object in Layers 1–4 is explicitly computable. This is the model in which the acceptance
  examples are discharged, and it is built here so that later layers can use it without
  re-deriving it.
- The scalar-target correlator, where the helicity matrix is one-dimensional and the classification
  of Layer 1 collapses to a much shorter list. Proving the count in this case first is the sensible
  order of work.

### Dependencies

Mathlib's inner-product spaces and Bochner integration; TauCeti's Schwartz cutoffs and test-
function translation; `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds`.
`GeneralizedPartonDistributions` for the invariant-momentum-transfer conventions, which are
adopted unchanged.

---

## Layer 1: generalized TMDs at leading twist

References: Meissner, Metz and Schlegel, arXiv:0906.5323 (quarks, spin-1/2 target); Meissner,
Metz, Schlegel and Goeke, arXiv:0805.3165 (spin-0 target); Lorcé and Pasquini, arXiv:1307.4497
(gluons); Dominguez, Marquet, Xiao and Yuan, arXiv:1101.0715 (the two gluon distributions);
Lorcé, Pasquini and Vanderhaeghen, arXiv:1102.4704.

### 1.1 The leading-twist Dirac structures

Fix the three leading-twist projections `Γ ∈ {γ⁺, γ⁺γ₅, iσ^{j+}γ₅}` and prove that they exhaust
the twist-two content: any other Dirac structure contributes at suppressed power in the
hard scale. The counting argument is a statement about the light-front projection of the quark
field, and it is proved, not asserted.

### 1.2 The decomposition

For each `Γ`, a basis of helicity-matrix structures built from the available vectors — the
light-cone direction, `kT`, `ΔT` — and the area form of Layer 0, and the theorem that the
correlator is a unique `ℂ`-linear combination of them with coefficients depending only on the
scalar invariants `(x, ξ, kT‖², ΔT‖², kT·ΔT)`. Those coefficients are the GTMDs.

Name them in the classification of Meissner, Metz and Schlegel: `F₁₁, F₁₂, F₁₃, F₁₄` in the vector
sector, `G₁₁, G₁₂, G₁₃, G₁₄` in the axial sector, and `H₁₁, …, H₁₈` in the tensor sector. Uniqueness
of the coefficients is the substance of the theorem; the names are bookkeeping, and they are fixed
here so that no contributor invents a second naming.

The count — sixteen independent complex amplitudes at leading twist for a spin-1/2 target — is a
**target to derive**, not an input. Deriving it means exhausting the constraints from the three
structural properties of Layer 0, 0.4 against the basis of 1.2. Reproducing the number sixteen is
the acceptance criterion for this subsection; a development that assumes it has not done the work.

### 1.3 The amplitude `F₁₄`

Single out the amplitude multiplying the structure proportional to the area form `ω (kT, ΔT)` in
the vector sector. It is the amplitude in which orbital angular momentum lives (Layer 4), and it
is the amplitude annihilated by both reductions (Layer 2, 2.5). Both facts are proved later; what
is fixed here is its normalisation, including the factor of the target mass squared, because the
sign convention of Layer 4 refers to it.

### 1.4 Hermiticity, parity, time reversal, and the T-classification

Push the three structural properties of Layer 0, 0.4 through the decomposition of 1.2 to obtain,
for each named amplitude:

- its complex-conjugation property under `(ξ, ΔT) ↦ (-ξ, -ΔT)`, hence its reality at `ξ = 0` where
  that holds;
- its parity behaviour;
- its classification as T-even or T-odd, stated as a relation between its value at the
  future-pointing staple and at the past-pointing staple.

The classification is inherited from `TransverseMomentumDistributions`, and it **refines** here:
with two transverse vectors available, structures exist that are even under reflection of `kT`
alone but odd under reflection of both, so amplitudes appear that have no T-classified TMD
counterpart. Prove that refinement as a statement about the basis of 1.2 — it is the structural
reason the parent carries information the daughters do not, and it should not be left as an
observation.

### 1.5 The two gluon families

The analogue of 1.2 for each of the two gluon correlators of Layer 0, 0.5, with the two
decompositions named separately, and the theorem this roadmap exists to state precisely:

> The Weizsäcker–Williams and the dipole gluon GTMD families are distinct functions of identical
> kinematic arguments. They differ in the link topology of the defining operator and in nothing
> else. In particular the difference is not a kinematic limit, not a change of variables, and not
> a scheme choice, and no linear relation with kinematics-independent coefficients holds between
> them.

Prove the distinctness by exhibiting a state in the Gaussian model of Layer 0 on which the two
families differ. The absence of a linear relation is the stronger statement, and it is proved by a
dimension count on the space of link-topology-independent structures. Where a *small-x*
relation between the two families does hold, it holds under the dynamical assumptions of
`SmallXAndSaturation`, and it is that roadmap's to state.

### 1.6 Polynomiality

The `n`-th Mellin moment in `x` of a transverse-momentum-integrated GTMD is a polynomial of degree
`n + 1` in the skewness variable, with the parity of the degree fixed. State it as a theorem about
the moments of the parent, and prove that it reduces, under the transverse-momentum reduction of
Layer 2, to the polynomiality already in
`EpsilonEridani.Particles.Parton.GPD.Polynomiality`. The parent statement does not replace the
daughter's; the content is the *compatibility*, and that is what is proved.

Also prove: polynomiality is a property of the `kT`-integrated moments only. Exhibit an amplitude
whose un-integrated `x`-moments are not polynomial in `ξ`, so that no contributor is tempted to
strengthen the statement.

### 1.7 Positivity bounds

Three separate statements, in increasing strength, all following from
`TauCeti.IsPositiveDefiniteSub` and its bounds applied to the helicity matrix of Layer 0, 0.4:

- the diagonal bound, that the helicity-diagonal correlator at `ΔT = 0` is non-negative, which is
  the TMD positivity of `TransverseMomentumDistributions`;
- the matrix bound, that the full helicity matrix at `ΔT = 0` is positive semidefinite, stated
  with `Matrix.PosSemidef` and `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`,
  giving the standard inequalities among the leading-twist amplitudes;
- the off-forward bound, `TauCeti.IsPositiveDefiniteSub.norm_apply_le_map_zero_re` applied in
  `ΔT`, bounding the modulus of a GTMD at `ΔT ≠ 0` by its forward value — **provided** the
  amplitude is positive definite in `ΔT`, which is exactly the hypothesis Layer 3 shows is not
  automatic.

State plainly which of these are inherited and which are new: the first is inherited, the second
is inherited in the forward limit and new off-forward, the third has no daughter analogue at all
because the daughters have no `ΔT`. State equally plainly the limitation that
`EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` already carries at the collinear level:
positivity of a parton density beyond leading order is scheme-dependent, so none of these bounds
is claimed as a scheme-independent property of a renormalised amplitude.

### Examples

- The spin-0 target, where the leading-twist count is short and every step of 1.2 and 1.4 can be
  carried out explicitly. Following Meissner, Metz, Schlegel and Goeke, arXiv:0805.3165.
- The Gaussian model of Layer 0, with all sixteen amplitudes given in closed form, `F₁₄` non-zero,
  and the positivity bounds of 1.7 verified.
- A free-quark target, where `F₁₄` vanishes identically. This is the example that shows `F₁₄`
  measures interaction, and it is worth having before Layer 4.
- The two gluon families evaluated on the Gaussian model, differing, discharging 1.5.

### Dependencies

Layer 0 entire. `TransverseMomentumDistributions` for the T-classification and the gauge-link
process dependence, taken unchanged. `GeneralizedPartonDistributions` for
`GPD.Polynomiality`, which 1.6 must reduce to. TauCeti's positive-definite bounds and Mathlib's
`Matrix.PosDef`.

---

## Layer 2: the reductions and the commuting square

References: Meissner, Metz and Schlegel, arXiv:0906.5323 §5; Lorcé, Pasquini and Vanderhaeghen,
arXiv:1102.4704; Diehl, arXiv:hep-ph/0307382 §3.

### 2.1 The transverse-momentum reduction

Integration of the correlator over `kT` at fixed `(x, ξ, ΔT)` gives the off-forward correlator
whose decomposition is the GPD family. Prove it as an identity on the correlator — not on the
amplitudes — so that the induced relations among amplitudes are corollaries rather than separate
theorems. The identity requires integrability of the correlator in `kT` on the physical domain;
state that hypothesis explicitly, and prove that it holds for the Gaussian model and fails for a
power-law tail with the exponent at the boundary, so that the hypothesis is not mistaken for a
formality.

Prove the induced relations: `∫ d²kT F₁₁` is the vector GPD combination that decomposes into `H`
and `E` in the sense of `EpsilonEridani.Particles.Parton.GPD.Basic`, and likewise for the axial
and tensor sectors.

### 2.2 The forward reduction

Restriction to `ΔT = 0` and `ξ = 0` gives the transverse-momentum-dependent correlator. Prove it
as an identity on the correlator. This reduction is a restriction rather than an integral, so it
needs continuity in `ΔT` at the origin rather than integrability — the field carried by Layer 0,
0.6 — and it is worth noting in the development itself that the two reductions therefore have
genuinely different hypotheses.

Prove the induced relations: `F₁₁(x, 0, kT, 0)` is the unpolarised TMD, `G₁₁` the helicity TMD, and
so on through the leading-twist TMD list.

### 2.3 The collinear corner

Both reductions composed, in either order, land on `PDF.Pdf`. Give the two composites as
definitions.

### 2.4 The azimuthal average, made explicit

The forward reduction of 2.2 produces a function of the transverse-momentum *vector*, while
`EpsilonEridani.Particles.Parton.TMD.Tmd` takes a non-negative real magnitude. Define the
azimuthal average — the mean of a function on the transverse plane over the circle of a given
radius — and prove:

- the average of a vector-argument TMD is a `TMD.Tmd`, and satisfies `TMD.IsTmdDensity` whenever
  the vector-argument object satisfies the corresponding vector-valued conditions;
- composing the average with `TMD.integrateTransverse` equals integrating the vector-argument
  function over the transverse plane with Lebesgue measure, so the hand-supplied Jacobian
  `2 π k_T` in the upstream definition is exactly the circle measure and nothing is lost at the
  collinear corner;
- the average annihilates every amplitude whose structure in 1.2 carries an odd power of the area
  form, `F₁₄` in particular.

The third item is the reason convention 2 exists, and it must be a theorem in the development, not
a remark: it is the precise sense in which the upstream TMD type is blind to the content of this
roadmap.

### 2.5 The commuting square

State the square with the GTMD family at the top, the GPD family and the vector-argument TMD
family at the sides, and `PDF.Pdf` at the bottom, and prove that it commutes. Concretely: the
forward reduction of the `kT`-integrated parent equals the `kT`-integral of the forward-reduced
parent, and both equal the collinear density, under the conjunction of the hypotheses of 2.1 and
2.2. This is the theorem, and it is the precise sense in which GTMDs are the parents; the word
"parent" is not used elsewhere in the roadmap without it.

Then extend `EpsilonEridani.Particles.Parton.Unified.Model` upward: a structure carrying a GTMD
family together with a `Unified.Model`, whose assumption bundle carries the commuting-square
identity, and a theorem that this identity implies the existing `tmdToPdf` and `gpdForward`
bridge fields. The point of proving the implication is that the new container must not be a
parallel universe: the existing consistency results of
`EpsilonEridani.Particles.Parton.Unified.Consistency` have to remain available from it.

### 2.6 What no daughter sees

Characterise the kernel of each reduction map on the space of leading-twist amplitude families,
and their intersection. Prove:

- `F₁₄` lies in the intersection: it is annihilated by the transverse-momentum integration because
  its structure is odd in `kT` at fixed `ΔT`, and by the forward limit because its structure
  carries `ΔT`;
- consequently the canonical orbital angular momentum of Layer 4 is not a functional of any GPD or
  any TMD.

The full characterisation of the intersection — the exact list of amplitudes invisible to both
reductions — is a target of this subsection, and the honest statement of its status is that the
`F₁₄` case is the one that is known to be needed and the one to prove first. The general
characterisation follows from the parity properties of 1.4 by a finite computation over the basis
of 1.2; it is finite work, not an open problem, and it is asked for here.

### Examples

- The Gaussian model: both reductions computed, the square verified, `F₁₄` seen to die twice.
- A model with a `1/kT‖²` tail at large transverse momentum, where 2.1's integrability hypothesis
  fails and the square does not commute. Having a counterexample to the theorem-without-hypotheses
  is what stops the hypothesis being dropped.
- The scalar target, where the square is small enough to check by hand in full.

### Dependencies

Layers 0 and 1. `GeneralizedPartonDistributions` for the GPD object model and its forward-limit
interface; `TransverseMomentumDistributions` for the TMD object model. Mathlib's product measures
and `MeasureTheory.integral_integral_swap`; Mathlib's dominated convergence for the limit in 2.2.

---

## Layer 3: Wigner distributions and the obstruction to pointwise positivity

References: Belitsky, Ji and Yuan, arXiv:hep-ph/0307383; Lorcé and Pasquini, arXiv:1106.0139;
Burkardt, arXiv:hep-ph/0005108; Hudson, *When is the Wigner quasi-probability density
non-negative?*, Rep. Math. Phys. **6** (1974) 249; Rudin, *Fourier Analysis on Groups*,
Theorem 1.4.3; Yellow Report Vol. II §7.2.4.

### 3.1 The transverse Wigner transform

At `ξ = 0`, define the Wigner distribution as the inverse transverse Fourier transform of a GTMD
in the momentum transfer:

`ρ (x, kT, bT) = ∫ d²ΔT / (2π)² · fourierAtom (bT) (ΔT)⁻¹ · W (x, 0, kT, ΔT)`

written as Mathlib's Fourier integral in the convention of convention 3, applied to the partial
application `ΔT ↦ W (x, 0, kT, ΔT)`. It is a definition by composition, so it inherits Mathlib's
inversion and decay theory without new lemmas.

Give the domain conditions under which it is defined: integrability of the partial application,
supplied by Layer 0, 0.6 together with the decay lemmas of `TauCeti.Analysis.Fourier.Decay`. State,
as a separate lemma, that the restriction `ξ = 0` is part of the definition and not a hypothesis
that can be relaxed (convention 4).

### 3.2 Reality

`ρ` is real-valued. Prove it from the hermiticity property of Layer 0, 0.4 in the form
`TauCeti.IsPositiveDefiniteSub.conj_symm`'s hypothesis-free half — the statement that a function
satisfying `conj (F (-v)) = F v` has a real transform — available as
`TauCeti.fourier_eq_re_of_map_neg_eq_conj` and `TauCeti.fourierInv_eq_re_of_map_neg_eq_conj`.
Reality is therefore a consequence of the operator structure, exactly as convention 7 requires,
and the proof is an application rather than a computation.

### 3.3 The marginals

Two theorems, each with its own hypotheses:

- integrating `ρ` over `bT` gives the vector-argument TMD of Layer 2, 2.2, by Fourier inversion at
  the origin;
- integrating `ρ` over `kT` gives the impact-parameter distribution — the two-dimensional Fourier
  transform of the `kT`-integrated GTMD at `ξ = 0`, which is the impact-parameter-dependent parton
  distribution of Burkardt.

Prove that the second marginal *is* non-negative, and that its non-negativity is precisely the
positive definiteness in `ΔT` of the `kT`-integrated amplitude, which holds because that amplitude
is a diagonal matrix element and therefore a positive-definite function by
`TauCeti.Analysis.PositiveDefinite.Function.Kernel`. This is the layer's most useful positive
result and it should be proved before the negative one: it shows the obstruction is not a defect of
the construction, since one marginal is a genuine density.

### 3.4 The positivity criterion

The central theorem of the layer. For fixed `(x, kT)`, write `F = fun ΔT => W (x, 0, kT, ΔT)`.
Then:

> `ρ (x, kT, ·)` is (the density of) a finite non-negative measure on the transverse plane if and
> only if `F` is continuous and `TauCeti.IsPositiveDefiniteSub`.

This is `TauCeti.bochner` applied to `F`, with `TauCeti.bochnerMeasure F` naming the representing
measure and `TauCeti.eq_bochnerMeasure` giving its uniqueness. State the kernel form as well, via
`TauCeti.bochner_posSemidef`, because the kernel form is the one that connects to the helicity
matrix bounds of Layer 1, 1.7. State also the one-directional corollary
`TauCeti.fourierInv_re_nonneg_of_posSemidef`, which is what is actually used when only positive
semidefiniteness of the subtraction kernel is known.

The theorem converts the question "is the Wigner distribution a probability density?" into the
question "is the GTMD a positive-definite function of the momentum transfer?", which is a question
about the operator, and is the form in which it can be answered.

### 3.5 Negativity, exhibited

Prove that the criterion of 3.4 genuinely fails: exhibit a concrete GTMD, satisfying every
structural property of Layers 0 and 1, whose Wigner distribution takes a negative value.

The construction: take the transverse light-front wave function to be a first excited Hermite
function rather than a Gaussian, using `TauCeti.hermiteFunction` and its Fourier behaviour from
`TauCeti.Analysis.SpecialFunctions.Hermite.Function.Fourier.Basic`. Compute `ρ` at the phase-space
origin and prove it is strictly negative. This is a computation with closed-form ingredients, and
it discharges the negativity claim by exhibition rather than by appeal.

Note what this does and does not establish. It establishes that non-negativity is not a theorem
about GTMDs in general — that a roadmap item asserting `0 ≤ ρ` would be false. It does not
establish that the physical nucleon's Wigner distribution is somewhere negative. That is 3.7.

### 3.6 Which distributions are non-negative: the transverse Hudson theorem

Characterise the light-front wave functions whose transverse Wigner distribution is everywhere
non-negative. In the quantum-mechanical setting the answer is Hudson's theorem: among pure states,
exactly the Gaussians. Build the transverse analogue here, in the shape TauCeti's positive-definite
theory wants:

- prove that a Gaussian transverse wave function gives a non-negative `ρ`, by direct computation
  with `Mathlib.Analysis.SpecialFunctions.Gaussian.FourierTransform`;
- prove the converse in one transverse dimension: a pure state whose Wigner distribution is
  non-negative has a Gaussian wave function.

⚠ Neither Mathlib nor TauCeti has Hudson's theorem, an uncertainty relation, or any
quasi-probability theory, so the converse is built here. It is asked for in the
one-dimensional case because that is where the classical proof is elementary — via the Hermite
expansion and the positive-definiteness bounds of
`TauCeti.Analysis.PositiveDefinite.Kernel.Bounds` — and because the one-dimensional case already
settles the structural question. The two-dimensional converse is **not** a target of this roadmap;
Scope says what is included, and it is not.

### 3.7 The positivity of the physical distribution: an open question

State, as a named open question and not as a milestone:

> **Open.** For the physical nucleon, is there a point `(x, kT, bT)` in the physical domain at
> which the quark Wigner distribution is negative?

What is known, and is proved in this roadmap, is that non-negativity would force the GTMD to be a
positive-definite function of `ΔT` at every `(x, kT)` (3.4), and that Gaussian models are the only
pure states with that property in one transverse dimension (3.6). What is not known is whether the
nucleon's light-front wave function fails the condition — this would follow from non-Gaussianity
of the transverse wave function, but the implication runs the wrong way through 3.6, whose converse
direction is a statement about pure states while the nucleon's transverse reduced state is mixed.

This is recorded as a question, with the two proved ingredients cited. It is not encoded as a
`Prop`-valued structure field, and no theorem in this roadmap takes it as a hypothesis
(convention 10). A contributor who proves it has proved a new result, and should say so.

### Examples

- The Gaussian model: `ρ` computed in closed form, non-negative, both marginals verified against
  3.3.
- The first-excited Hermite model: `ρ` computed, negative at the origin, discharging 3.5.
- A model whose GTMD is compactly supported in `ΔT`: `ρ` is smooth but oscillates in sign, showing
  that the failure of 3.4 is generic rather than delicate, since a compactly supported
  non-negative-definite function that is not identically zero does not exist on the plane.
- The impact-parameter distribution of the Gaussian model, verified non-negative, discharging the
  positive half of 3.3.

### Dependencies

Layers 0, 1 and 2. TauCeti's Bochner theorem and positive-definite theory, essentially in full;
TauCeti's Hermite functions; Mathlib's Fourier transform, inversion and Gaussian transform.
`GeneralizedPartonDistributions` for the impact-parameter distribution's conventions — this
roadmap proves that its Wigner marginal agrees with that roadmap's object, and does not redefine
it.

---

## Layer 4: canonical and kinetic orbital angular momentum

References: Jaffe and Manohar, Nucl. Phys. B **337** (1990) 509; Ji, arXiv:hep-ph/9603249; Lorcé
and Pasquini, arXiv:1106.0139; Lorcé, Pasquini, Xiong and Yuan, arXiv:1111.4827; Hatta,
arXiv:1111.3547; Ji, Xiong and Yuan, arXiv:1202.2843; Burkardt, arXiv:1205.2916; Engelhardt,
arXiv:1701.01536; Yellow Report Vol. II §7.2.4.

### 4.1 The orbital phase-space integral

Define, for a link path `L`, the phase-space integral of the Wigner distribution against the
orbital weight of Layer 0, 0.1:

`L_z (L) = -∫ dx d²kT d²bT · ω (bT, kT) · ρ_L (x, kT, bT)`

with the sign of convention 11, and the integrability hypotheses stated explicitly and separately
from the definition. Prove that it equals `-∫ dx d²kT (kT‖²/M²) F₁₄(x, 0, kT, 0)` — that is, prove
that the phase-space integral collapses onto the single amplitude of Layer 1, 1.3. This is where
the roadmap's investment in a vector-valued transverse argument pays: the collapse is an
integration by parts in `ΔT` followed by the observation that only the area-form structure
survives.

### 4.2 The canonical orbital angular momentum

Specialise 4.1 to the future-pointing staple. Prove that the result is the Jaffe–Manohar orbital
term: the matrix element of the canonical orbital operator `ψ̄ γ⁺ (b × i∂)_z ψ` in light-cone
gauge, with the gauge-link choice written out. State the light-cone gauge condition as an explicit
property of the link path — that its rung at light-cone infinity contributes trivially — rather
than as an unstated background assumption, and prove that under that property the staple-link
phase-space integral and the canonical operator matrix element agree.

`SpinStructure` owns the Jaffe–Manohar sum rule. What is taken from it is the definition of its
orbital term as an operator matrix element; what is given back is the theorem that this term is
the phase-space integral 4.1 at the staple link.

### 4.3 The kinetic orbital angular momentum

Specialise 4.1 to the straight light-like link. Prove that the result is the Ji orbital term: the
matrix element of `ψ̄ γ⁺ (b × iD)_z ψ` with the covariant derivative. Prove that the kinetic term
equals the difference between the Ji total quark angular momentum and half the quark helicity,
where the total is the gravitational form factor combination owned by
`HadronMassAndEnergyMomentumTensor` and the helicity is the axial charge owned by `SpinStructure`.
This is the statement that the kinetic orbital term is measurable in the sense those two roadmaps
make precise, and it is proved here because it is a statement about the phase-space integral.

### 4.4 The same amplitude, two link paths

State the theorem that 4.2 and 4.3 make available:

> The canonical and the kinetic orbital angular momenta are the same functional — the phase-space
> integral 4.1, equivalently the `F₁₄` moment — evaluated on the correlators of two different link
> paths. They differ because the operator differs, not because the weight, the measure, the
> kinematic limit or the amplitude differs.

This theorem is the reason convention 5 makes the link explicit data. It is also the statement that
makes the lattice computations of Engelhardt, arXiv:1701.01536 comparable to the continuum
objects, and `LatticeBridge` cites it for that purpose.

### 4.5 The potential angular momentum

Define the potential angular momentum as the difference
`L_z^pot = L_z(staple) - L_z(straight)`, and prove that it equals a specific matrix element: the
light-cone operator obtained by integrating the transverse gauge field along the light-like ray
against the area form, in the form given by Burkardt, arXiv:1205.2916. Concretely, prove that the
difference of the two link paths of 4.4 is the insertion of that operator, so that

`L_z^{Jaffe-Manohar} = L_z^{Ji} + L_z^pot`

is an identity in which **every** term is a defined object with its own definition in this
roadmap or in a cited one. That is the deliverable: the relation between the two spin
decompositions of `SpinStructure` becomes an identity rather than a correspondence.

Prove in addition that `L_z^pot` vanishes for a free target, using the free-quark example of
Layer 1, so that the potential term is seen to measure interaction. Its **sign** for the physical
nucleon is not claimed: state that as a question about a matrix element, with the lattice and
model results cited, and not as a theorem.

### 4.6 The gluon orbital angular momentum

The same three definitions for the two gluon families of Layer 1, 1.5, with the canonical gluon
orbital term from the Weizsäcker–Williams family. Prove the analogue of 4.4 and of 4.5 in the
gluon sector. State which gluon family enters which decomposition, and prove that the dipole
family does not give the canonical gluon orbital term, so that the choice is forced rather than
conventional.

### 4.7 The spin-orbit correlation

Define the quark spin-orbit correlation as the phase-space integral of the helicity-weighted
Wigner distribution against the orbital weight, and prove that it collapses onto the amplitude
`G₁₁` in the manner of 4.1. Prove the elementary properties: it vanishes for a target with no
quark helicity dependence, and it is bounded by the positivity bounds of Layer 1, 1.7. Give the
gluon analogue.

The correlation is a distribution-level observable in the sense that it is a specific moment of a
specific amplitude; whether any measurement determines it is Layer 5's question, not this
subsection's claim.

### Examples

- The Gaussian model: `L_z` for all three link paths, `L_z^pot` computed and non-zero, the identity
  of 4.5 verified.
- The free-quark target: `F₁₄ = 0`, `L_z = 0` for every link path, `L_z^pot = 0`.
- A model with a single non-trivial final-state interaction phase, where `L_z^pot` is non-zero and
  computable, showing the mechanism of 4.5 in the smallest setting that exhibits it.
- The scalar target: the orbital terms exist, the spin-orbit correlation vanishes identically, and
  the reason is the absence of a helicity index. Worth proving, because it shows 4.7 is not
  vacuous for the spin-1/2 case.

### Dependencies

Layers 0 through 3. `SpinStructure` Milestone 4 for the two spin decompositions, whose orbital
terms are given their distribution-level expressions here.
`HadronMassAndEnergyMomentumTensor` for the angular-momentum form factor that the Ji orbital term
is measured against. TauCeti's weak derivatives for the differentiated correlators; Mathlib's
Fourier–derivative interaction for the integration by parts of 4.1.

---

## Layer 5: evolution compatibility, and the identifiability of the parents

References: Bhattacharya, Metz and Zhou, arXiv:1702.04387; Hatta, Xiao and Yuan, arXiv:1601.01585;
Boussarie, Hatta, Szymanowski and Wallon, arXiv:1807.08697; Ji, Yuan and Zhao, arXiv:1612.02438;
Yellow Report Vol. II §7.2.4.

### 5.1 The argument slots, and what they mean

Every distribution in Layers 1 through 4 carries a renormalisation scale and a rapidity parameter,
per convention 8. Fix here what they are: a positive real scale and a real rapidity parameter
matching the interface of `EpsilonEridani.Particles.Parton.TMD.CollinsSoper`, and prove the
consistency statement that the scale arguments of the reduced objects are the scale arguments of
the parents under both reductions, so that no reduction map silently changes scheme.

### 5.2 Evolution as a semigroup, taken from upstream

The scale and rapidity dependence of a GTMD family is a two-parameter semigroup on a Banach space
of amplitude families. Give that space — a weighted `L¹` space on the physical domain, with the
weight chosen so that the reductions of Layer 2 are bounded operators — and state the evolution as
a `TauCeti.Analysis.Semigroups.Defs` semigroup with a generator, whose abstract Cauchy problem is
well posed by `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and uniquely solved by
`.CauchyProblem.Uniqueness`.

The generators are **not** defined here. The collinear generator comes from `CollinearEvolution`,
the Collins–Soper generator from `TransverseMomentumDistributions`, the small-x rapidity generator
from `SmallXAndSaturation`. This subsection's targets are the function space, the boundedness of
the reduction maps on it, and the well-posedness statement obtained by citation.

### 5.3 Evolution intertwines the reductions

The theorem this layer exists for: each reduction map of Layer 2 intertwines the parent semigroup
with the daughter semigroup. Equivalently, the commuting square of Layer 2, 2.5 commutes with
evolution, giving a commuting cube. Prove it from boundedness of the reduction maps (5.2) and the
uniqueness of the solution to the Cauchy problem, so that the proof is a uniqueness argument
rather than a kernel computation — the kernels belong to other roadmaps and this proof must not
need them.

Prove the corollary that matters: the orbital angular momenta of Layer 4 evolve with the scale, and
their evolution is determined by the parent generator restricted to the `F₁₄` sector. The explicit
form of that restriction is `CollinearEvolution`'s to supply; the statement that it exists and is
determined is this roadmap's.

### 5.4 What constrains a GTMD

State the known partial constraints, each as a theorem relating a GTMD moment to something an
experiment bounds:

- the `kT`-integrated moments are GPD moments (Layer 2, 2.1), hence constrained by whatever
  constrains GPDs, which is `GeneralizedPartonDistributions`' subject;
- the forward limits are TMDs (Layer 2, 2.2), hence constrained by
  `TransverseMomentumDistributions`' subject;
- the `F₁₄` moment is the canonical orbital angular momentum (Layer 4), hence constrained by the
  Jaffe–Manohar sum rule of `SpinStructure` together with the helicity measurements;
- the positivity bounds of Layer 1, 1.7 constrain the amplitudes pointwise wherever the forward
  amplitudes are known.

Prove each as a statement about the objects of this roadmap. Together they are the complete list
of what this roadmap establishes about access, and the list is short on purpose.

### 5.5 The identifiability question

Pose the question properly. A GTMD family is an element of the function space of 5.2. A process is
a bounded linear functional on that space, or a finite family of them. Then:

> **Open.** Is there a finite family of processes whose associated functionals separate points of
> the GTMD space — equivalently, is there any experiment, or finite set of experiments, that
> determines a Wigner distribution pointwise?

The generic answer is negative and is already a theorem upstream:
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` shows that finitely many bounded
measurements of an infinite-dimensional density space leave a blind subspace that is not
finite-dimensional. What is open is the *specific* statement — a characterisation of the blind
subspace for the known processes, which is what would say precisely which features of a Wigner
distribution the Electron-Ion Collider can and cannot resolve.

The roadmap therefore asks for two things, and is explicit that they are different:

1. **A target.** For each of the processes proposed in the literature — exclusive double
   Drell–Yan (Bhattacharya, Metz and Zhou, arXiv:1702.04387), diffractive dijet production (Hatta,
   Xiao and Yuan, arXiv:1601.01585; Boussarie, Hatta, Szymanowski and Wallon, arXiv:1807.08697),
   and the proposals for gluon orbital angular momentum (Ji, Yuan and Zhao, arXiv:1612.02438) —
   construct the bounded linear functional on the space of 5.2 that the process measures at
   leading order, and compute the finite-dimensional information it provides. Constructing the
   functional is finite work and it is asked for. The hard-scattering coefficients that define it
   are `Diffraction`'s and `JetsAndEventShapes`' to supply; what is built here is the functional
   and its action on the amplitude basis of Layer 1, 1.2.
2. **A question.** Characterise the intersection of the kernels of those functionals. This is
   posed as an open identifiability question, in the Fredholm language of
   `TauCeti.Analysis.Fredholm.Criteria` and `.CompactPerturbation`: non-uniqueness is a statement
   about a kernel, and ill-posedness a statement about compactness. It is a target for a precise
   negative result. It is **not** an invitation to assume access, and no result in this roadmap
   may take pointwise determination of a Wigner distribution as a hypothesis.

The model for how the eventual statement should be shaped is
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness`, which reconciles an
infinite family of shadow GPDs invisible to one set of data with a uniqueness theorem that uses
different data. The expected shape of the GTMD answer is the same: not "GTMDs are inaccessible"
but a theorem saying exactly which functionals see what, with the ambiguity named.

### Examples

- The Gaussian model: the double-Drell–Yan functional of 5.5 computed explicitly, and the
  two-dimensional space of model parameters shown to be determined by it. A model with finitely
  many parameters is identifiable; exhibiting that is what stops 5.5 being read as a claim that
  nothing is measurable.
- A pair of GTMD families differing by an element of the kernel of the diffractive-dijet
  functional at leading order, constructed in the Gaussian family, exhibiting a shadow GTMD.
- The `F₁₄` sector: its evolution with the scale, computed in the model, verifying 5.3.

### Dependencies

Layers 0 through 4. `CollinearEvolution` for the coupling and the collinear kernels;
`TransverseMomentumDistributions` for the Collins–Soper kernel; `SmallXAndSaturation` for the
small-x rapidity kernel and for the small-x limits of the two gluon families;
`Diffraction` and `JetsAndEventShapes` for the hard-scattering coefficients of the processes in
5.5; `LatticeBridge` for the staple-link computations cited in Layer 4, 4.4.
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` for the generic obstruction, and
TauCeti's Fredholm theory and semigroup theory.

---

## Dependency graph

```
Layer 0  light-front phase space, correlators, gauge-link data
   |
   v
Layer 1  leading-twist GTMD decomposition (quark; WW and dipole gluon)
   |                                    \
   v                                     \
Layer 2  the two reductions, azimuthal    \
         average, commuting square         \
   |            \                           \
   v             \                           v
Layer 3  Wigner   \                    Layer 5  evolution compatibility,
         transform,\                            identifiability
         Bochner    \                          (needs 2 and 4)
         criterion    \                          ^
   |                   \                         |
   v                    v                        |
Layer 4  canonical and kinetic orbital angular momentum,
         potential term, spin-orbit correlation  ------+
```

Layers 0, 1, 2 are strictly sequential. Layer 3 needs 2 only for the forward reduction and the
azimuthal average; Layer 4 needs 3 entire, since the orbital integral is an integral of the Wigner
distribution. Layer 5 needs 2 for the reductions it intertwines and 4 for the orbital corollary of
5.3, and nothing from 3.

Upstream dependencies enter at Layer 0 (kinematics, Schwartz cutoffs), Layer 1 (positive-definite
bounds, matrix positivity), Layer 2 (product measures, Fubini), Layer 3 (Bochner's theorem,
Hermite functions), Layer 4 (weak derivatives, Fourier-derivative interaction) and Layer 5
(semigroups, Fredholm theory).

## Acceptance examples

A development that satisfies this roadmap can state and prove each of the following.

1. The leading-twist quark correlator for a spin-1/2 target decomposes uniquely into sixteen
   complex amplitudes, and the number sixteen is derived from hermiticity, parity and time
   reversal rather than assumed.
2. The Weizsäcker–Williams and dipole gluon GTMD families are distinct: there is a state on which
   they differ, and no linear relation with kinematics-independent coefficients holds between
   them.
3. `∫ d²kT` of the leading-twist vector GTMD correlator is the GPD correlator of
   `EpsilonEridani.Particles.Parton.GPD.Basic`, under an explicitly stated integrability
   hypothesis, and there is a model satisfying every structural condition for which the hypothesis
   fails and the identity is false.
4. The square with GTMDs at the top, GPDs and vector-argument TMDs at the sides and `PDF.Pdf` at
   the bottom commutes, and the resulting extended container implies the `tmdToPdf` and
   `gpdForward` bridge fields of `EpsilonEridani.Particles.Parton.Unified.Assumptions`.
5. The azimuthal average of a vector-argument TMD is a `TMD.Tmd` satisfying `TMD.IsTmdDensity`,
   composing with `TMD.integrateTransverse` gives the plane integral, and the average annihilates
   `F₁₄`.
6. `F₁₄` is annihilated by both reduction maps; consequently the canonical orbital angular
   momentum is not a functional of any GPD or any TMD.
7. The Wigner distribution at `ξ = 0` is real, and its reality is derived from hermiticity of the
   correlator rather than from the definition.
8. Integrating the Wigner distribution over `bT` gives the vector-argument TMD; integrating over
   `kT` gives the impact-parameter distribution, which is non-negative.
9. For fixed `(x, kT)`, the Wigner distribution is the density of a finite non-negative measure in
   `bT` if and only if the GTMD is a continuous `TauCeti.IsPositiveDefiniteSub` function of `ΔT` —
   and the representing measure is `TauCeti.bochnerMeasure` of that function.
10. There is a GTMD satisfying every structural property of Layers 0 and 1 whose Wigner
    distribution is strictly negative at the phase-space origin, built from
    `TauCeti.hermiteFunction` at `n = 1`.
11. A Gaussian transverse wave function has a non-negative Wigner distribution, and in one
    transverse dimension it is the only pure state that does.
12. The phase-space orbital integral collapses onto the `F₁₄` moment, with the sign of
    convention 11.
13. The staple-link orbital integral is the Jaffe–Manohar orbital term and the straight-link
    orbital integral is the Ji orbital term; they are the same functional of two different
    correlators.
14. `L_z^{Jaffe-Manohar} = L_z^{Ji} + L_z^pot`, with `L_z^pot` given as the Burkardt light-cone
    operator matrix element, and `L_z^pot = 0` for a free target.
15. The quark spin-orbit correlation collapses onto the `G₁₁` moment and is bounded by the Layer 1
    positivity bounds.
16. Both reduction maps are bounded on the weighted `L¹` space of 5.2 and intertwine the parent
    evolution semigroup with the daughter semigroups.
17. The exclusive double Drell–Yan functional is a bounded linear functional on that space, and on
    the two-parameter Gaussian family it determines the parameters.
18. There are two GTMD families in the Gaussian class that differ but are not separated by the
    leading-order diffractive-dijet functional.

Statements 9, 10, 11, 13 and 14 are the ones that distinguish this roadmap from a restatement of
its daughters. Statement 11's two-dimensional converse, the physical positivity question of
Layer 3, 3.7 and the kernel characterisation of Layer 5, 5.5 are **not** acceptance criteria:
they are, respectively, out of scope and open.

## References

**The Yellow Report subsection this roadmap covers.**

- R. Abdul Khalek et al., *Science Requirements and Detector Concepts for the Electron-Ion
  Collider: EIC Yellow Report*, arXiv:2103.05419. Volume II, Section 7.2.4 ("Wigner functions").

**Generalized TMDs and the classification.**

- S. Meissner, A. Metz, M. Schlegel, *Generalized parton correlation functions for a spin-1/2
  hadron*, arXiv:0906.5323. The leading-twist classification and the amplitude names used here.
- S. Meissner, A. Metz, M. Schlegel, K. Goeke, *Generalized parton correlation functions for a
  spin-0 hadron*, arXiv:0805.3165. The scalar-target case used for the Layer 1 examples.
- C. Lorcé, B. Pasquini, *Structure analysis of the generalized correlator of quark and gluon for
  a spin-1/2 target*, arXiv:1307.4497. The gluon classification.
- C. Lorcé, B. Pasquini, M. Vanderhaeghen, *Unified framework for generalized and
  transverse-momentum dependent parton distributions within a 3Q light-cone picture*,
  arXiv:1102.4704. The reductions in a model where every step is explicit.

**The two gluon distributions.**

- F. Dominguez, C. Marquet, B.-W. Xiao, F. Yuan, *Universality of unintegrated gluon distributions
  at small x*, arXiv:1101.0715. The Weizsäcker–Williams and dipole distributions as distinct
  objects distinguished by link topology.

**Wigner distributions.**

- A. V. Belitsky, X. Ji, F. Yuan, *Quark imaging in the proton via quantum phase-space
  distributions*, arXiv:hep-ph/0307383. The original construction.
- M. Burkardt, *Impact parameter dependent parton distributions and off-forward parton
  distributions for zeta -> 0*, arXiv:hep-ph/0005108. The impact-parameter marginal and the
  reason the construction needs zero skewness.
- C. Lorcé, B. Pasquini, *Quark Wigner distributions and orbital angular momentum*,
  arXiv:1106.0139. The `F₁₄` relation and the spin-orbit correlation.

**Positivity of a phase-space distribution.**

- S. Bochner (1932); W. Rudin, *Fourier Analysis on Groups*, Theorem 1.4.3. The criterion, in the
  form TauCeti states it as `TauCeti.bochner`.
- R. L. Hudson, *When is the Wigner quasi-probability density non-negative?*, Rep. Math. Phys.
  **6** (1974) 249. The characterisation of the non-negative case for pure states, of which
  Layer 3, 3.6 asks for the one-dimensional transverse analogue.

**Orbital angular momentum and the two spin decompositions.**

- R. L. Jaffe, A. Manohar, *The g1 problem: Deep inelastic electron scattering and the spin of the
  proton*, Nucl. Phys. B **337** (1990) 509. The canonical decomposition.
- X. Ji, *Gauge-invariant decomposition of nucleon spin*, arXiv:hep-ph/9603249. The kinetic
  decomposition and the angular-momentum form factors.
- C. Lorcé, B. Pasquini, X. Xiong, F. Yuan, *The quark orbital angular momentum from Wigner
  distributions and light-cone wave functions*, arXiv:1111.4827.
- Y. Hatta, *Notes on the orbital angular momentum of quarks in the nucleon*, arXiv:1111.3547. The
  gauge-link dependence of the orbital term.
- X. Ji, X. Xiong, F. Yuan, *Proton spin structure from measurable parton distributions*,
  arXiv:1202.2843.
- M. Burkardt, *Parton orbital angular momentum and final state interactions*, arXiv:1205.2916.
  The potential-angular-momentum term as an operator matrix element.
- M. Engelhardt, *Quark orbital dynamics in the proton from Lattice QCD — from Ji to Jaffe-Manohar
  orbital angular momentum*, arXiv:1701.01536. The staple-link interpolation, cited by Layer 4,
  4.4 and used by `LatticeBridge`.

**What might constrain these objects.**

- S. Bhattacharya, A. Metz, J. Zhou, *Generalized TMDs and the exclusive double Drell-Yan
  process*, arXiv:1702.04387.
- Y. Hatta, B.-W. Xiao, F. Yuan, *Probing the small-x gluon tomography in correlated hard
  diffractive dijet production in deep inelastic scattering*, arXiv:1601.01585.
- R. Boussarie, Y. Hatta, L. Szymanowski, S. Wallon, *Probing the gluon Wigner distribution in
  diffractive dijet production*, arXiv:1807.08697.
- X. Ji, F. Yuan, Y. Zhao, *Hunting the gluon orbital angular momentum at the Electron-Ion
  Collider*, arXiv:1612.02438.

**Background on the daughters, for the conventions adopted from them.**

- M. Diehl, *Generalized parton distributions*, arXiv:hep-ph/0307382. The GPD conventions, adopted
  unchanged from `GeneralizedPartonDistributions`, which follows this review.

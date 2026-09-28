# Roadmap: spin structure of the proton and neutron

This roadmap develops the spin-dependent theory of inclusive polarised deep-inelastic scattering:
the antisymmetric part of the hadronic tensor and the two structure functions `g₁` and `g₂` that
parametrise it, the measured asymmetries `A₁` and `A₂` and the positivity bounds they obey, the
collinear spin-dependent parton densities — quark and gluon helicity, and transversity — that
`g₁` and `h₁` measure, the moment identities called sum rules, and the decomposition of the
nucleon spin into quark and gluon pieces.

The final application is the pair of statements the Electron-Ion Collider spin programme is built
to test. First, the Bjorken sum rule as a theorem about the non-singlet first moment of `g₁`,
resting on a flavour decomposition of the axial charges that is proved rather than assumed, and
with the perturbative correction carried as the scheme-dependent series it is. Second, a precise
formulation of the Jaffe–Manohar and Ji spin decompositions in which the two differ by exactly one
identifiable object — the gauge link — so that the statement "the two orbital angular momenta are
not the same quantity" becomes a theorem rather than a remark.

The five layers below are cumulative. Layers 0 and 1 are the kinematic and parton-model
foundation: the tensor decomposition, the asymmetries, and the leading-twist spin-density matrix
with its positivity content. Layer 2 is the moment theory and the three classical sum rules.
Layer 3 is the twist-three content of `g₂`, where the Wandzura–Wilczek relation separates a
calculable part from a genuinely new matrix element. Layer 4 is the spin decomposition, which is
the only layer that leaves the structure functions behind and works with operators.

Two of the objects this roadmap needs are not present anywhere upstream: a nucleon state with a
local-operator matrix element, and a gauge link. Both are built here, as explicit data with the
identities they must satisfy proved, and the sections below say so at the point of use.

## Scope

The roadmap includes the following material.

- The antisymmetric, `q`-transverse, spin-linear part of the hadronic tensor for a spin-half
  target; the proof that the space of such tensors is two-dimensional; and the definition of `g₁`
  and `g₂` as the coefficients in that basis.
- Polarised kinematics: the covariant spin four-vector as explicit data, the target mass recovered
  from the hadron momentum, and the kinematic factor `γ` that mixes `g₁` and `g₂` into the
  asymmetries.
- The longitudinal and transverse polarised cross-section differences, the virtual-photon
  absorption cross sections `σ_T`, `σ_L`, `σ_TT'`, `σ_LT'`, the asymmetries `A₁ = σ_TT'/σ_T` and
  `A₂ = σ_LT'/σ_T`, the linear relations between `(A₁, A₂)` and `(g₁, g₂)`, and their inversion.
- The positivity bounds `|A₁| ≤ 1` and `|A₂| ≤ √R`, and the refinement of the second that follows
  from positive semidefiniteness of the photon-helicity density matrix.
- The complex forward helicity-amplitude matrix at fixed `(x, Q², flavour)`, the leading-twist
  triple `f₁`, `g₁`, `h₁` read off from it, the quark and gluon helicity densities `Δq`, `Δq̄`,
  `Δg`, and transversity `h₁`.
- The parton-model expression for the structure function `g₁` as the charge-weighted sum of quark
  helicity densities, and the positivity constraints `|Δq| ≤ q` and the Soffer bound
  `2|h₁| ≤ q + Δq`, including the flavour-mixing block case that does not follow from the
  per-flavour statements.
- The chiral-odd character of transversity, the absence of a gluon transversity for a spin-half
  target as a consequence of angular-momentum counting, and the statement that transversity does
  not mix with a gluon density under evolution.
- Moment conventions; the axial charges `a₀`, `a₃`, `a₈` as explicit data with the flavour
  decomposition of the first moment of `g₁` proved as a change of basis.
- The Bjorken sum rule, the Ellis–Jaffe sum rule with its flavour-symmetry hypothesis carried as a
  field that does real work, and the Burkhardt–Cottingham sum rule with its convergence
  hypotheses explicit.
- The Wandzura–Wilczek relation, the twist-three remainder `ḡ₂` defined as the difference, the
  general moment relation for the twist-two part of `g₂` at every natural weight, the reduced
  matrix element `d₂` and its two equivalent moment expressions, and the
  Efremov–Leader–Teryaev sum rule for transversity.
- The angular-momentum operator, its Jaffe–Manohar decomposition into four terms, the Ji
  decomposition into quark and gluon total angular momentum, the Ji sum rule, a theorem separating
  the two decompositions by the gauge link, and the asymptotic partition of the spin between quark
  and gluon total angular momentum under leading-order evolution.

The roadmap does not include transverse-momentum-dependent spin effects — Sivers, Collins and
Boer–Mulders functions, and the subleading `g₁T` and `h₁L^⊥` — which are
`TransverseMomentumDistributions`. It does not include the phase-space spin densities or the
canonical and kinetic orbital-angular-momentum distributions, which are `WignerDistributions`. It
does not include generalised parton distributions themselves, which are
`GeneralizedPartonDistributions`; Layer 4 cites their second moments and does not construct them.
It does not include the polarised splitting kernels or the evolution equations they generate,
which are `CollinearEvolution`; Layers 1, 3 and 4 state evolution facts as consequences of that
roadmap's kernels and prove nothing about the kernels themselves. It does not include the
energy-momentum tensor form factors or the hadron mass decomposition, which are
`HadronMassAndEnergyMomentumTensor`. It does not include the twist-three quark-gluon correlators
as objects in their own right, which are `MultiPartonCorrelations`; Layer 3 defines `d₂` as a
moment of a structure function and cites that roadmap for the correlator whose reduced matrix
element it is. It does not include the weak-current spin structure functions `g₃`, `g₄`, `g₅` or
parity-violating polarised asymmetries, which are `ElectroweakAndBSM`. It does not include the QED
radiative corrections relating a measured asymmetry to a Born-level one, which are
`RadiativeCorrections`. It does not include small-`x` helicity evolution or the resummation of the
small-`x` contribution to `ΔΣ`, which are `SmallXAndSaturation`. It does not include the nuclear
corrections needed to extract a neutron `g₁` from a polarised deuteron or ³He target, which are
`LightNuclei` and `NuclearPartonDistributions`. It does not include fragmentation functions, so
the semi-inclusive flavour separation of the helicity densities is `Hadronization`. It does not
include lattice determinations of `g_A`, `ΔΣ` or `J_q`, which are `LatticeBridge`. It does not
include the symmetric part of the hadronic tensor, `F₁`, `F₂`, `F_L` or the ratio
`R = σ_L/σ_T`, which are `InclusiveStructureFunctions`; this roadmap consumes `R` and the
unpolarised structure functions as given and parallels their decomposition rather than repeating
it. Jet-level spin observables are `JetsAndEventShapes`.

The exclusion of the phase-space orbital angular momentum is the one that needs saying twice.
Layer 4 proves that the Jaffe–Manohar and Ji orbital terms are different operators and computes
the evolution of each; it does not construct either as an `x`-dependent density, because that
construction is a Wigner-distribution statement and belongs with the rest of that theory.

Structure-function, tensor and sum-rule material belongs under
`EpsilonEridani/QFT/Scattering/DIS/Polarized/`. The spin-dependent densities and their positivity
constraints belong under `EpsilonEridani/Particles/Parton/PDF/`, beside the unpolarised ones. The
operator material of Layer 4 belongs in a new subdirectory
`EpsilonEridani/QFT/Scattering/DIS/Polarized/Spin/`, because it is about matrix elements of local
and non-local operators rather than about structure functions.

## Conventions and coordination with upstream

The following conventions are binding throughout.

1. **Two things are called `g1`, and the roadmap keeps them apart by namespace and by symbol.**
   `EpsilonEridani.Particles.Parton.PDF.g1` is a *density* at fixed `(x, Q²)`, extracted from a
   spin-density matrix; `EpsilonEridani.QFT.Scattering.DIS.Polarized.StructureFunctions.g1` is a
   *structure function*. In prose the roadmap writes `Δq` for the density and reserves `g₁` for
   the structure function. Every new density declaration lives in the `PDF` namespace and is named
   `deltaQ`, `deltaG` or `transversity`. The trap this avoids: the central parton-model result of
   Layer 1 relates the structure function to a charge-weighted sum of densities, and if both sides
   are spelled `g1` that theorem reads as a tautology and a reviewer cannot tell whether it says
   anything.

2. **Moments carry weight `x⁰` over `Set.Icc 0 1` and no other weight.** This matches
   `EpsilonEridani.QFT.Scattering.DIS.Polarized.firstMomentG1` and `firstMomentG2`. It is offset by
   one from `EpsilonEridani.Particles.Parton.PDF.mellinMoment f n = ∫₀¹ dx xⁿ f`, and offset by one
   again from the literature's `n`-th moment `∫₀¹ dx xⁿ⁻¹ g`. Every weighted moment introduced by
   this roadmap is written as `∫₀¹ dx xⁿ g` with `n` a natural number and the weight displayed. The
   trap: the `1/6` in the Bjorken sum rule and the `3` in `d₂ = 3∫₀¹ dx x² ḡ₂` are both fixed by
   the weight convention, and a silent index shift moves them.

3. **Structure functions are `ℝ → ℝ → ℝ` with `x` first and `Q²` second, and are dimensionless.**
   This is the existing `StructureFunctions` shape. The trap: `g₁` and `g₂` are the only two
   functions in the polarised problem for which both arguments are scalars of the same type, so a
   transposed application type-checks silently.

4. **The antisymmetric tensor is the real tensor with the factor `i` divided out, and the
   normalisation is fixed by dimensionlessness.** The physical hadronic tensor is complex and
   hermitian; its antisymmetric part is `i` times a real tensor. The object this roadmap decomposes
   is that real tensor, so it can live in the existing real `Bilin V` world. The two covariant
   structures carry the prefactors `M/(p·q)` and `1/(M (p·q))` respectively, which is what makes
   `g₁` and `g₂` dimensionless; `M` is the target mass and is *not* a field of `DisKinematics`
   (Convention 5). The orientation is fixed once by declaring the sign of the alternating form on
   the chosen ordered basis, and the spin vector is normalised by `S·S = −1`, `S·p = 0`. The trap:
   the relative sign of the `g₁` and `g₂` structures and the overall sign of the asymmetries both
   flip with the orientation, and a roadmap that does not fix the orientation cannot state either.

5. **Polarisation and target mass are explicit data, never typeclasses.** A `PolarizedKinematics`
   extends `EpsilonEridani.QFT.Scattering.DIS.Kinematics.DisKinematics` with a spin four-vector and
   carries its two normalisation conditions as fields. The squared target mass is *defined* as
   `g K.p K.p`, because `DisKinematics` has no mass field. The trap: a typeclass supplying the
   polarisation would make the target's spin state global, and Layer 0 must compare a longitudinal
   with a transverse target in a single statement.

6. **Transversity is `h₁` in the Jaffe–Ji normalisation, and every other normalisation is a proved
   relation with its factor as explicit data.** The literature uses `h₁`, `Δ_T q` and `δq` for
   objects differing by factors of two and by whether antiquarks are included. The roadmap defines
   `h₁` once from the double-helicity-flip entry of the spin-density matrix, records the conversions
   as lemmas, and never folds a conversion factor into a definition. The trap: the Soffer bound and
   the Efremov–Leader–Teryaev sum rule both carry a factor of two that is convention-dependent, so
   a transcribed coefficient is meaningless without the normalisation attached.

7. **The axial charges are parameters, and their relations are proved.** `a₀`, `a₃` and `a₈` are
   real-valued functions of `Q²` supplied as data, related to `Δu`, `Δd`, `Δs` by proved identities
   and never replaced by measured numbers. `a₃` is the isovector charge usually written `g_A`, and
   the existing `BjorkenSumRule` field `gAOverGV` is its ratio to the vector charge. The trap:
   substituting a number for `a₀` hides that `a₀` is scheme- and scale-dependent while `a₃` is not,
   and that distinction is the whole content of the proton spin problem.

8. **Perturbative corrections are abstract functions, never hard-coded series.** Every sum rule
   carries its radiative correction as a function of `Q²` (or of the coupling), exactly as the
   existing `BjorkenSumRule` and `EllisJaffeSumRule` already do. Where a roadmap milestone needs a
   specific order, the coefficients enter as named data with the scheme recorded. The trap: the
   correction series for the Bjorken sum rule is known to four loops in one scheme and its
   coefficients involve harmonic sums, which are absent from both Mathlib and TauCeti; a hard-coded
   expansion would be both scheme-blind and unprovable here.

9. **A conditional sum rule carries its hypothesis as a field that does work, and no `Prop`-valued
   field ever gets a placeholder witness.** The pattern is the existing `EllisJaffeSumRule`, which
   carries both the flavour decomposition and the vanishing-strange hypothesis, so that the second
   acts on the first. Where this roadmap cannot prove something, it says so in prose as a gap and
   does not encode it as a structure field. The trap is the one this project's own audit found: a
   `Prop`-valued field with a trivial witness asserts nothing while looking like a hypothesis, and
   a milestone built on it is discharged without content.

10. **Gauge links are explicit data in Layer 4, parametrised by their path.** The quark field
    bilinear defining a canonical orbital angular momentum is not gauge invariant without a link,
    and the Jaffe–Manohar and Ji decompositions differ by which link (if any) appears. The link
    interface therefore takes the path as a parameter rather than fixing it. The trap: with the
    link suppressed, the two decompositions look like algebraic rearrangements of each other and
    the central theorem of Layer 4 becomes unstatable.

Numbered references in the layers below are to the sources listed under **References**. The Yellow
Report subsection this roadmap covers is 7.1.2.

## Existing upstream material used by the roadmap

The roadmap uses the following material, all of which exists at the pinned revisions.

- `EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic`: the `StructureFunctions` container for
  `g₁` and `g₂`; the `Assumptions` bundle and its exact split into `HasPhysicalSupport` and
  `Regularity` with `assumptions_iff`; `firstMomentG1` and `firstMomentG2` with the weight
  convention of Convention 2; `TensorAssumptions` and the identification of antisymmetry with
  `IsAlt`; and `EndpointAssumptions` with its two projections. Layer 0 and Layer 2 build directly
  on these and do not restate them.
- `EpsilonEridani.QFT.Scattering.DIS.Polarized.SumRules`: `BjorkenSumRule` and its inversion
  `abs_gAOverGV_eq_of_bjorken`; `EllisJaffeSumRule` with the flavour decomposition and the
  vanishing-strange field, and `ellisJaffe_prediction`; `BurkhardtCottingham`; `g2WW` and
  `wandzuraWilczek`; `WandzuraWilczekAssumptions`, including the product-measure field
  `prod_integrable` that Fubini needs and that does not follow from the one-dimensional fields;
  `integral_tail_swap`; `firstMoment_g2WW_eq_zero`; `burkhardtCottingham_wandzuraWilczek`; and the
  explicit pair `modelStructureFunctions` with its discharged assumption bundle. Layer 3
  generalises `integral_tail_swap` and `firstMoment_g2WW_eq_zero` rather than reproving them.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`: `Bilin`, `rankOne`, `transverseMetric`,
  `pTransverse` and their conservation and covariance lemmas; `IsLorentzCovariant`,
  `IsKinematicStabilizer`, `reflect` and `covariant_spectator_offDiagonal_zero`; and the
  unpolarised `Assumptions`, `IsF1F2Decomposition` and `fromF1F2`. Layer 0 reuses the covariance
  machinery verbatim and supplies the antisymmetric analogue of `IsF1F2Decomposition`.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal`, for the longitudinal projection and
  the objects `R` is built from.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`: `DisKinematics` with `p`, `k`, `q` and the
  relation `hq`, and the derived `Q2`, `xBj`, `y`, `W2`;
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` and `.AccessMethods` for the physical
  region and the reconstruction methods.
- `EpsilonEridani.QFT.Scattering.DIS.CrossSection` and `EpsilonEridani.QFT.Scattering.DIS.Basic`,
  for the unpolarised cross section that the polarised differences are taken against.
- `EpsilonEridani.Particles.Parton.PDF.Basic`: the `Pdf` abbreviation, `mellinMoment`, the
  `Assumptions` bundle with its split into `IsPartonDensity` and `Regularity`, and
  `SumRuleAssumptions` with `momentum_sumRule` and `valence_sumRule`.
- `EpsilonEridani.Particles.Parton.PDF.Positivity`: the real `SpinDensity` matrix in the
  four-element helicity basis `idxPP`, `idxPM`, `idxMP`, `idxMM` with positive semidefiniteness as
  its only non-data field; `f1`, `g1`, `h1`; the proved bounds `f1_nonneg`, `abs_g1_le_f1`,
  `two_mul_abs_h1_le_diag`, `soffer_bound` and `abs_h1_le_f1`; `IsParityInvariant` with the
  collapse lemmas; and `pdfOfSpinDensity`, `helicityPdfOfSpinDensity`,
  `transversityPdfOfSpinDensity` with `assumptions_pdfOfSpinDensity`. Layer 1 extends this to the
  complex case and connects it to light-cone matrix elements; it does not reprove the real bounds.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`, which supplies the entrywise
  inequality that the Soffer bound rests on.
- `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity`, for the scheme-dependence of positivity:
  `msbar_nonneg_iff_correction_dominated` and `uniform_bound_insufficient` are the reason Layer 1
  states every positivity bound at fixed `(x, Q²)` in a physical scheme and does not assert it
  after evolution.
- `EpsilonEridani.Particles.Parton.PDF.Model`, for an explicit density to instantiate the Layer 1
  examples against.
- `EpsilonEridani.Particles.Parton.Unified.Basic` and `.Consistency`, for the `Model` container and
  the collinear-reduction consistency conditions that a spin-dependent extension must respect.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Helicity`: `g1FirstMoment`,
  `g1FirstMomentTruncated`, `FiniteCoverageAssumptions`, `DeltaSigmaSchemeAssumptions` and
  `firstMoment_minus_truncated_bound` — the statement that a measured moment over a finite `x`
  range differs from the full moment by a controlled amount. Layer 2 cites these as the bridge from
  a sum rule to a measurement and does not restate them.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.JointHelicity` and `.Identifiability`, for the
  identifiability conditions on a joint extraction.
- `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Basic` and `.Harmonics`, for the asymmetry
  vocabulary that the inclusive `A₁` and `A₂` must agree with in the overlapping kinematics.
- `EpsilonEridani.Particles.Parton.GPD.Moments` and `.Polynomiality`, for the second moments that
  the Ji sum rule consumes. The distributions themselves are `GeneralizedPartonDistributions`.
- `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace`, `.QCDCore` and `.Consistency`, and
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin`, for moment-space evolution. The polarised
  kernels are `CollinearEvolution`.
- `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.LeviCivita` and
  `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`, for the alternating
  four-tensor and its contraction identities, which are the whole content of Layer 0.1;
  `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions` for the metric lemmas.
- `EpsilonEridani.Relativity.CliffordAlgebraExtensions` and the
  `EpsilonEridani.Relativity.Fermions.Weyl.*` extension modules, for the chirality structure that
  makes transversity chiral-odd.
- `EpsilonEridani.QFT.QCD.SU3Generators`, `.SUNGenerators` and `.RepresentationColor`, for the
  colour structures appearing in the Layer 4 gluon operators.
- `TauCeti.Analysis.Contour.PerWindow.CPV`, for the Cauchy principal values in the dispersion
  relation that produces the Burkhardt–Cottingham sum rule (Layer 2.4) and in the twist
  decomposition of Layer 3.2.
- `TauCeti.Probability.Moments.Basic` and `TauCeti.Probability.Moments.VanishingMoments`, for the
  moment vocabulary and for the statement that a family of vanishing moments constrains a
  distribution.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.CauchyProblem.Basic` and
  `.CauchyProblem.Uniqueness`, which are where the evolution statements of Layers 1.5, 3.3 and 4.4
  are phrased: the evolution of a moment is a one-parameter semigroup with a generator, and
  existence and uniqueness are not reproved here. ⚠ `TauCeti.Analysis.PDE` is elliptic theory only
  — Dirichlet problem, Harnack, maximum principle — and does **not** apply to an evolution
  equation; the semigroup theory is the right home.
- `TauCeti.Analysis.PositiveDefinite.AddGroup` and `TauCeti.Analysis.Matrix.Spectrum`, for the
  positivity arguments of Layers 0.4 and 1.4, where a bound on an off-diagonal entry is deduced
  from positive semidefiniteness of a hermitian matrix.
- `TauCeti.LinearAlgebra.ExteriorAlgebra.Contraction` and `.Dimension`, for the dimension count
  that makes the Layer 0.2 uniqueness theorem a statement about an exterior power rather than an
  index-chasing exercise.
- `TauCeti.Analysis.Fredholm.Criteria` and `.FiniteRank`, for the Layer 2.5 statement that
  determining the axial charges from a finite set of moments is a finite-rank inverse problem, so
  that a non-uniqueness claim is a statement about a kernel.
- Mathlib: `MeasureTheory.IntegrableOn`, `MeasureTheory.AEStronglyMeasurable` and the
  product-measure Fubini theorems; `Matrix.PosSemidef` and `Matrix.IsHermitian` with the spectral
  theorem; `AlternatingMap` and the exterior algebra; `LinearMap.BilinForm` and `IsAlt`;
  `intervalIntegral` and `Mathlib.Analysis.SpecialFunctions.Integrals`; `Finset.sum` and the
  `Fintype` machinery for flavour sums; `Algebra.Star.Unitary` for the unitary transformations of
  the helicity basis.

Three absences are real and the roadmap works around them rather than waiting.

- ⚠ **There is no nucleon state and no local-operator matrix element anywhere in
  EpsilonEridani.** The existing `BjorkenSumRule` says so itself: `gAOverGV` is an input because
  the axial-current matrix element is not formalised. This roadmap therefore introduces the axial
  charges as data (Convention 7) and proves the identities that relate them to each other and to
  the flavour decomposition of the first moment. Deriving `a₃` from an axial-current matrix element
  is named as a gap in Layer 2.2 and is not a milestone of this roadmap; the matrix-element
  interface should be built in the shape `HadronMassAndEnergyMomentumTensor` needs for the
  energy-momentum tensor form factors, so that one interface serves both.
- ⚠ **There is no gauge link, Wilson line or path-ordered exponential in EpsilonEridani.** Layer 4
  builds a link interface, parametrised by path, as explicit data with the two properties the
  decomposition theorem needs — covariant transformation, and the identity on the trivial path.
  It is built here, in the shape a future upstream Wilson-line theory would want, and the
  roadmap does not depend on such a theory appearing.
- ⚠ **Neither Mathlib nor TauCeti has a Mellin transform, harmonic sums, polylogarithms or Bessel
  functions.** EpsilonEridani has `mellinMoment` for natural indices and
  `QFT.Factorization.Convolution.Mellin` for the convolution theorem at natural indices, and that
  is all this roadmap uses: every moment relation is stated for a natural weight `n`, and no
  statement is obtained by analytic continuation in `n`. The radiative-correction series are
  abstract functions (Convention 8) precisely because their coefficients need harmonic sums.

One further limitation is a property of the existing code rather than an absence.
`EpsilonEridani.Particles.Parton.PDF.SpinDensity` is a real matrix, and its own module
documentation records why: hermiticity together with time-reversal invariance makes the
leading-twist double-flip entry real. The T-odd entries and the twist-three structure that Layer 3
needs require a complex matrix, and the entrywise inequality behind the Soffer bound must then be
restated with a norm in place of an absolute value. Layer 1.1 builds that complex version, in this
repository, and proves that the real `SpinDensity` is its time-reversal-invariant specialisation.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.LeviCivita.Basic` and `.Contractions` for the
  antisymmetric tensor the polarized hadronic tensor is built from — this is the single most
  direct dependency in the area — with `Physlib.Relativity.Fermions.Dirac.GammaMatrices` for the
  Dirac structures and `Physlib.Relativity.Fermions.Weyl.LeftHanded` and `.RightHanded` for the
  helicity projections.

## Layer 0: the antisymmetric hadronic tensor and the polarised asymmetries

References: [AEL] §§2–3; [Man] §§2–3; [LR] §2; [YR] §7.1.2.

### 0.1 Polarised kinematics

Define `PolarizedKinematics V`, extending `DisKinematics V` with a spin four-vector `S : V` and
two fields: `S·p = 0` and `S·S = −1`, both written against the metric `g : Bilin V`. Define the
squared target mass `M2 g K := g K.p K.p` and prove that it is the invariant appearing in `W2`
(Convention 5 — `DisKinematics` has no mass field, and this is the only correct way to recover
one).

Define the kinematic factor

```text
γ² = 4 M² x² / Q²
```

with `x = K.xBj` and `Q² = K.Q2`, and prove `γ² = Q²/(p·q)²·M²·…` in whichever equivalent form the
proof of 0.3 consumes; the two expressions agree on the physical region, and the equivalence is a
theorem with `Q² ≠ 0` as its hypothesis. Prove that `γ → 0` in the Bjorken limit at fixed `x`, and
that `γ² > 0` on the physical region of `Kinematics.Bounds`, so that the inversion of 0.3 is
licensed there.

Define the longitudinal and transverse polarisation configurations as two explicit spin vectors
built from the kinematics, and prove each satisfies the two normalisation fields. This is the
concrete content of "polarisation is data": longitudinal and transverse are two elements of the
same type, not two typeclass instances.

### 0.2 The antisymmetric tensor and the uniqueness of the `g₁`, `g₂` basis

Let `V` be four-dimensional with a symmetric nondegenerate `g` and a chosen alternating four-form
`ε` (orientation fixed once, Convention 4). Define the two covariant structures

```text
E₁(v,w) = ε(v, w, q, S),
E₂(v,w) = ε(v, w, q, (p·q) S − (S·q) p).
```

Prove the following.

- Both are alternating, so each satisfies the existing `TensorAssumptions` by
  `tensorAssumptions_iff_isAlt`.
- Both are conserved in each slot: `E_i(q, ·) = 0` and `E_i(·, q) = 0`, immediately from the
  alternating property.
- Both are Lorentz covariant in the existing sense `IsLorentzCovariant g K`, for the subgroup
  fixing `p` and `q` — with the caveat that a kinematic stabiliser need not fix `S`, so covariance
  here is covariance of the *pair* `(tensor, spin vector)` and the statement must carry `S` in the
  transformation. State this explicitly; it is the one place where the unpolarised covariance
  machinery of `Tensors.Basic` does not transfer unchanged.
- **Uniqueness.** If `p`, `q`, `S` are linearly independent and `Q² ≠ 0`, the space of alternating
  bilinear forms on `V` that are conserved in both slots and linear in `S` is exactly two
  dimensional, spanned by `E₁` and `E₂`. The proof identifies alternating forms with elements of
  the second exterior power, uses the four-dimensionality to write every such form as `ε` contracted
  with a bivector, and reduces conservation to a linear condition; the candidate
  `ε(v, w, p, S)`, which is alternating and `S`-linear, is excluded precisely because it fails
  conservation. Record the excluded candidate explicitly: it is what current conservation buys, and
  a statement that omits it makes the count look like an accident.

Define `IsG1G2Decomposition g K G W` to say that `W` equals

```text
(M/(p·q)) · G.g1 x Q² · E₁  +  (1/(M (p·q))) · G.g2 x Q² · E₂
```

at every `(x, Q²)` determined by the kinematics, and define `fromG1G2` producing such a `W` from
two reals, with `fromG1G2_isDecomposition` as its characterising lemma. This is the antisymmetric
counterpart of the existing `IsF1F2Decomposition` and `fromF1F2` and should be named and shaped to
match them.

Prove the coefficient-extraction theorem: under the hypotheses of the uniqueness statement, if
`IsG1G2Decomposition g K G W` and `IsG1G2Decomposition g K G' W` both hold then `G.g1 = G'.g1` and
`G.g2 = G'.g2` on the physical region. Without this, "the coefficients `g₁` and `g₂`" is a figure
of speech.

Finally, characterise the existing `IsPolarizedDecomposition`, which asserts
`∀ x Q2, A = (g₁ x Q² + g₂ x Q²) • A`: prove it holds if and only if `A = 0` or
`g₁ x Q² + g₂ x Q² = 1` for every `(x, Q²)`. It is a scaling condition, it does not identify the
covariant structures, and the roadmap's `IsG1G2Decomposition` is what the name suggests. State the
characterisation as a lemma so that no later result quietly depends on the weaker predicate.

### 0.3 Cross-section differences and the asymmetries

Define the four virtual-photon absorption cross sections `σ_T`, `σ_L`, `σ_TT'`, `σ_LT'` as
explicit contractions of the hadronic tensor with photon polarisation vectors, using the
transverse and longitudinal projectors of `Tensors.Basic` and `Tensors.Longitudinal` for the first
two and the antisymmetric structures of 0.2 for the last two. Prove that `σ_T` and `σ_L` depend
only on the symmetric part and `σ_TT'`, `σ_LT'` only on the antisymmetric part.

Define

```text
A₁ = σ_TT'/σ_T,     A₂ = σ_LT'/σ_T,     R = σ_L/σ_T
```

with `σ_T ≠ 0` as an explicit hypothesis wherever a ratio appears. `R` and `σ_T` are consumed
from `InclusiveStructureFunctions`.

Prove the linear relations

```text
A₁ = (g₁ − γ² g₂)/F₁,        A₂ = γ (g₁ + g₂)/F₁
```

and their inversion

```text
g₁ = F₁ (A₁ + γ A₂)/(1 + γ²),      g₂ = F₁ (A₂/γ − A₁)/(1 + γ²).
```

The inversion carries `γ ≠ 0` — equivalently `x ≠ 0` — as a hypothesis, and the second expression
is singular as `γ → 0`. State this as a lemma of its own: the transverse asymmetry loses its grip
on `g₂` at small `x`, and that is a statement about the change of basis, not about the data.

Define the longitudinal and transverse polarised cross-section differences for the two spin
configurations of 0.1, and prove that each is the corresponding combination of `A₁` and `A₂`
weighted by the depolarisation factors. Prove that the longitudinal difference is `A₁` plus a term
suppressed by `γ`, which is the precise sense in which a longitudinal measurement measures `g₁`.

### 0.4 Positivity bounds

Assemble the photon-helicity density matrix: a `2 × 2` (transverse helicities) and then a
`3 × 3` (including longitudinal) hermitian matrix whose entries are the cross sections of 0.3.
Prove it is positive semidefinite as a consequence of the probability interpretation of the
forward Compton amplitudes, carried as a single field in the style of `PDF.SpinDensity`.

From positive semidefiniteness prove the following, using
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` and Mathlib's `Matrix.PosSemidef`.

- `|A₁| ≤ 1`, from `|σ_TT'| ≤ σ_T`.
- `|A₂| ≤ √R`, from the Cauchy–Schwarz inequality on the off-diagonal entry `σ_LT'`.
- The refinement obtained from the full `3 × 3` matrix rather than a single off-diagonal entry,
  which is the Soffer–Teryaev bound. Its stated form is
  `|A₂| ≤ √(R (1 + A₁)/2)`; the roadmap requires the bound to be *produced* by the
  positive-semidefiniteness argument and then checked against [ST], not transcribed, because the
  form depends on the normalisation of `σ_LT'` fixed in 0.3.
- The corresponding bound on `g₂` obtained by substituting the inversion of 0.3, with its `γ ≠ 0`
  hypothesis carried through.

### Examples

Prove the following alongside the general theory.

- The two spin configurations of 0.1 satisfy `S·p = 0` and `S·S = −1`, and the transverse one is
  orthogonal to the longitudinal one.
- For the tensor `fromG1G2 g K c₁ c₂` with constant coefficients, `A₁` and `A₂` evaluate to the
  expected combinations of `c₁`, `c₂` and `γ`, and the inversion returns `c₁`, `c₂`.
- `ε(v, w, p, S)` is alternating and `S`-linear but not conserved, witnessed by an explicit `v`.
- A tensor with `g₁ = g₂ = 0` has vanishing `A₁` and `A₂`, and the positivity bounds are saturated
  by an explicit rank-one positive semidefinite helicity matrix.
- `IsPolarizedDecomposition` holds for the pair with `g₁ + g₂ ≡ 1` and fails for
  `modelStructureFunctions`.

### Dependencies

`Tensors.Basic`, `Tensors.Longitudinal`, `Kinematics.Basic`, `Kinematics.Bounds`,
`Polarized.Basic`, the Levi-Civita modules, `Mathematics.DataStructures.Matrix.PosSemidef`,
`TauCeti.Analysis.Matrix.Spectrum`, `TauCeti.LinearAlgebra.ExteriorAlgebra.Contraction`. `F₁`,
`σ_T`, `σ_L` and `R` from `InclusiveStructureFunctions`.

---

## Layer 1: helicity densities, transversity, and the spin-density matrix

References: [JJ1]; [JJ2]; [RS]; [AM]; [Sof]; [HJM]; [AEL] §§4–6; [YR] §7.1.2.

### 1.1 The complex forward helicity-amplitude matrix

Define `SpinDensityC`, the complex analogue of the existing real `SpinDensity`: a
`Matrix (Fin 4) (Fin 4) ℂ` in the same helicity basis `idxPP`, `idxPM`, `idxMP`, `idxMM`, with
positive semidefiniteness as its only non-data field. Define `f₁`, `Δq` and `h₁` from it by the
same entry combinations the real version uses, and prove they are real-valued — for `f₁` and `Δq`
because they are diagonal combinations of a positive semidefinite hermitian matrix, and for `h₁`
under the time-reversal hypothesis, stated as an explicit predicate `IsTimeReversalInvariant`.

Prove that the existing real `SpinDensity` is the specialisation: there is a map from a
`SpinDensityC` satisfying `IsTimeReversalInvariant` to a `SpinDensity` that commutes with `f1`,
`g1` and `h1`. Restate the entrywise inequality behind the Soffer bound with `‖·‖` in place of
`|·|`, and prove that it reduces to the existing `two_mul_abs_h1_le_diag` in the real case. This is
the one place in the roadmap where an existing statement is generalised rather than used; the
existing real proofs are not redone.

Define the parity predicate on `SpinDensityC` and prove the analogues of
`f1_eq_of_parityInvariant` and `g1_eq_of_parityInvariant`. Record, as the existing module does,
that every statement in this subsection is at fixed `(x, Q²)` and per flavour.

### 1.2 Helicity densities and the parton-model `g₁`

Define, for each flavour, the helicity densities

```text
Δq(x, Q²) = q₊(x, Q²) − q₋(x, Q²),
Δq̄, Δg
```

as differences of number densities with parton helicity aligned and anti-aligned with the nucleon
helicity, obtained from the diagonal entries of the spin-density matrix of 1.1. Prove that
`Δq` so defined agrees with `helicityPdfOfSpinDensity` in the real time-reversal-invariant case.

Define the flavour-singlet and non-singlet combinations

```text
ΔΣ = Σ_q (Δq + Δq̄),      Δq_NS = Δq + Δq̄ − (1/n_f) ΔΣ
```

over a `Fintype` of flavours, and prove the elementary identities relating them.

State and prove the parton-model expression for the structure function: at leading twist and
leading order,

```text
g₁(x, Q²) = (1/2) Σ_q e_q² (Δq(x, Q²) + Δq̄(x, Q²)),
```

as a theorem relating a `StructureFunctions` field to a charge-weighted flavour sum of densities
(Convention 1: the two sides are different objects, and this theorem is where they meet). The
charge weights `e_q²` enter as data on the flavour type; do not hard-code three flavours.

Prove that a `g₁` built this way from densities satisfying `PDF.Assumptions` satisfies the
polarised `Polarized.Assumptions` bundle, with support and regularity discharged rather than
assumed. This is the polarised analogue of `assumptions_pdfOfSpinDensity` and is what makes every
moment statement in Layer 2 meaningful.

### 1.3 Positivity of the densities

Prove `|Δq(x, Q²)| ≤ q(x, Q²)` at fixed `(x, Q²)` from positive semidefiniteness, by transport of
`abs_g1_le_f1` through 1.2. State it as a theorem about the light-cone matrix elements — that is,
about the spin-density matrix — and not as an assumed constraint on a fitted function; the
distinction matters because a fit can violate it and the theorem says which hypothesis then fails.

Prove the **flavour-mixing** case that does not follow from the per-flavour bounds: for a
combination `Σ_q c_q Δq` the corresponding bound is a statement about the block matrix
`⊕_q c_q ρ_q`, and the roadmap requires the block positive-semidefiniteness hypothesis to be stated
and the bound derived from it. In particular prove `|ΔΣ| ≤ Σ_q (q + q̄)` under that hypothesis, and
exhibit why the naive sum of per-flavour bounds gives a weaker constant.

Record, citing `PDF.MsbarPositivity`, that none of these bounds is asserted after evolution to
another scale: `msbar_nonneg_iff_correction_dominated` shows the hypothesis under which a
scheme-transformed density stays non-negative is equivalent to its conclusion, and
`uniform_bound_insufficient` shows no absolute bound on the scheme correction suffices. The
positivity content of this layer is therefore a fixed-scale statement in a physical scheme, and
Layer 1.5 says what does survive evolution.

### 1.4 Transversity and the Soffer bound

Define transversity `h₁` from the double-helicity-flip entry of the spin-density matrix
(Convention 6), together with the conversions to `Δ_T q` and `δq` as proved relations with their
factors as explicit data.

Prove the Soffer bound `2|h₁| ≤ q + Δq` at fixed `(x, Q²)` by transport of the existing
`soffer_bound`, and state precisely which hypotheses produce it: positive semidefiniteness of the
helicity matrix, and nothing else. In particular prove that it does **not** use parity, matching
the existing module's note, and that it does not use time-reversal invariance once the complex
version of 1.1 is in place. Prove also the weaker consequence `|h₁| ≤ q` and the pair of one-sided
forms `2h₁ ≤ q + Δq` and `−2h₁ ≤ q + Δq`, since the one-sided forms are what a fit constraint
uses.

Prove that transversity is chiral-odd: the operator whose matrix element it is connects quark
fields of opposite chirality, so `h₁` cannot appear in a chirality-conserving inclusive cross
section at leading twist. Phrase this against the Weyl-spinor chirality structure of
`EpsilonEridani.Relativity.Fermions.Weyl.*` and
`EpsilonEridani.Relativity.CliffordAlgebraExtensions`. State the consequence as a theorem: `h₁`
does not appear in the decomposition of the inclusive antisymmetric tensor of Layer 0, so the
inclusive polarised cross section is insensitive to it. This is the reason transversity is in this
roadmap as a density but not as a structure function.

### 1.5 Gluon transversity and evolution

Prove that a spin-half target admits no gluon transversity. The argument is angular-momentum
counting, not an assumption: a gluon transversity density would be the matrix element of an
operator changing the helicity of the target by two units, which a spin-half state cannot
accommodate, whereas a spin-one target can. Formalise the counting as a statement about the
allowed helicity changes in the forward matrix element, and prove the contrast with the spin-one
case explicitly, citing [HJM] for the spin-one object.

State the consequence for evolution: because there is no gluon transversity to mix with,
transversity evolves as a non-singlet, its evolution operator is a one-parameter semigroup on the
space of transversity densities, and the mixing term present for `ΔΣ` and `Δg` is absent. The
polarised and transversity splitting kernels are `CollinearEvolution`; this layer states the
structural consequence — the absence of a mixing channel — and cites that roadmap for the kernels.
Phrase the evolution statement against `TauCeti.Analysis.Semigroups.Defs` and `.Generator`, and do
not reprove existence or uniqueness (⚠ and do not reach for `TauCeti.Analysis.PDE`, which is
elliptic theory).

State, as the surviving positivity fact, that the Soffer bound is preserved by leading-order
evolution and is not an evolution invariant beyond leading order, with the leading-order statement
proved from the kernels of `CollinearEvolution` and the failure beyond leading order recorded as
what `PDF.MsbarPositivity` already shows about scheme dependence rather than as a separate claim.

### Examples

- `PDF.Model`, extended to carry a helicity density, satisfies the bound `|Δq| ≤ q` and the Soffer
  bound, with both discharged and not assumed.
- An explicit positive semidefinite `SpinDensityC` that is *not* time-reversal invariant, showing
  that the real `SpinDensity` is a proper specialisation.
- An explicit rank-one spin-density matrix saturating the Soffer bound, and a diagonal one
  saturating `|Δq| ≤ q`.
- A two-flavour combination for which the block bound of 1.3 is strictly stronger than the sum of
  the per-flavour bounds.
- The parton-model `g₁` built from `PDF.Model` satisfies `Polarized.Assumptions`, and its first
  moment is the charge-weighted sum of the helicity charges.

### Dependencies

Layer 0 for the statement that `h₁` is absent from the inclusive tensor. `PDF.Basic`,
`PDF.Positivity`, `PDF.MsbarPositivity`, `PDF.Model`, `Parton.Unified.Basic`,
`Mathematics.DataStructures.Matrix.PosSemidef`, the Weyl and Clifford extension modules,
`TauCeti.Analysis.Semigroups.Defs` and `.Generator`, `TauCeti.Analysis.Matrix.Spectrum`. Splitting
kernels from `CollinearEvolution`.

---

## Layer 2: moments and the classical sum rules

References: [Bj]; [EJ]; [BC]; [LV]; [BCK]; [AEL] §7; [ABHM]; [YR] §7.1.2.

### 2.1 Moment conventions and the axial charges

Fix the moment vocabulary of Convention 2 and prove the compatibility lemmas that keep it honest:
`firstMomentG1 G Q²` equals `mellinMoment` of `g₁(·, Q²)` at `n = 0` when the latter is applied to
the structure function read as a density-shaped function, and both are the integral over
`Set.Icc 0 1`. Prove that under `Polarized.Assumptions` these integrals are the integrals of
integrable functions and not junk values, by `Assumptions.regularity`.

Define the weighted moments `Γ_n[g] Q² = ∫₀¹ dx xⁿ g(x, Q²)` for natural `n`, prove they are
finite under `Regularity` strengthened to weighted integrability, and prove `Γ₀ = firstMoment`.
State the strengthened regularity as its own structure, in the shape of
`PDF.SpinDensityAssumptions.momentIntegrable`, rather than adding fields to the existing
`Regularity`.

Introduce the axial charges `a₀`, `a₃`, `a₈ : ℝ → ℝ` as data (Convention 7) together with the
quark helicity charges `Δu`, `Δd`, `Δs : ℝ → ℝ` — the scale-dependent charges
`Δq(Q²) = ∫₀¹ dx (Δq + Δq̄)` that the existing `EllisJaffeSumRule` already uses — and the defining
identities

```text
a₃ = Δu − Δd,      a₈ = Δu + Δd − 2Δs,      a₀ = Δu + Δd + Δs.
```

Prove the change-of-basis theorem: the leading-twist first moment of the proton `g₁` is

```text
Γ₁ᵖ = (1/12) a₃ + (1/36) a₈ + (1/9) a₀,
```

and that this is *identical* to the charge-weighted form
`(1/2)((4/9)Δu + (1/9)Δd + (1/9)Δs)` appearing in the existing
`EllisJaffeSumRule.moment_decomposition`. Prove the neutron expression by the isospin exchange
`Δu ↔ Δd` and the isovector combination `Γ₁ᵖ − Γ₁ⁿ = (1/6) a₃`. These are linear-algebra
identities, and proving them is what makes the two parametrisations interchangeable without a
numerical substitution.

Prove the equivalence `Δs = 0 ↔ a₀ = a₈`, which is the exact content of the Ellis–Jaffe hypothesis
in the charge basis.

### 2.2 The Bjorken sum rule

Take the existing `BjorkenSumRule` structure and its inversion `abs_gAOverGV_eq_of_bjorken` as
given. Add the following.

- The identification of its right-hand side with `(1/6) a₃ (1 + Δ(Q²))` via the change of basis of
  2.1, so that the sum rule and the flavour decomposition are the same statement in two bases.
- The proof that the non-singlet combination is the one with no gluon contribution: the isovector
  combination has zero singlet component by the identities of 2.1, and therefore no `Δg` term can
  appear in it. State this as a theorem about the combination, not as a remark about diagrams.
- The correction function as an abstract series with named coefficients (Convention 8): a structure
  carrying `c₁, c₂, … : ℝ` and the scheme as a tag, with `Δ(Q²) = Σ cᵢ αₛ(Q²)ⁱ` as a *definition*
  from the data. Cite [LV] and [BCK] for the known coefficients and record that this roadmap does
  not compute them, because their evaluation needs harmonic sums, which are absent from both
  Mathlib and TauCeti.
- The measurement bridge: combine the sum rule with
  `Inference.Helicity.firstMoment_minus_truncated_bound` to obtain a bound on the discrepancy
  between the sum rule's prediction and a moment measured over a finite `x` range. This is the
  theorem that makes the sum rule testable rather than aspirational.

⚠ **Gap, named and not scheduled here.** `a₃` is a nucleon axial-current matrix element. Because
EpsilonEridani has no nucleon state and no local-operator matrix element, `a₃` cannot be derived in
this roadmap, and the Bjorken sum rule remains an identity with `a₃` as an input, exactly as the
existing module documents. This roadmap does not claim the derivation as a milestone. The neutron
`g₁` needed to form the isovector combination comes from a polarised deuteron or ³He target, whose
nuclear corrections are `LightNuclei`; lattice determinations of `a₃` are `LatticeBridge`.

### 2.3 The Ellis–Jaffe sum rule

Take the existing `EllisJaffeSumRule` and `ellisJaffe_prediction` as given. Add the following.

- The restatement of the hypothesis in the charge basis, using the equivalence
  `Δs = 0 ↔ a₀ = a₈` of 2.1, so that the hypothesis is visibly an `SU(3)`-flavour statement about
  the octet and singlet charges rather than a statement about a single flavour.
- A theorem attributing the experimental violation to the hypothesis: given a measured
  `Γ₁ᵖ` and the proved decomposition, `Δs ≠ 0` follows, with the inequality carried as a
  hypothesis on the measured value rather than as a number. The point of stating it this way is
  that the derivation is sound and the input is what fails; a formalisation that stated the sum
  rule unconditionally would assert a falsehood about the physical proton.
- The consequences for `a₀`: prove that `a₀` is determined by `Γ₁ᵖ`, `a₃` and `a₈` through the
  change of basis, and that this determination is what makes `a₀` — the quantity called `ΔΣ` —
  a measured rather than a predicted number.

### 2.4 The Burkhardt–Cottingham sum rule

Take the existing `BurkhardtCottingham` predicate as given, and supply what it currently lacks: a
derivation, with its hypotheses explicit.

Define the spin-flip forward virtual-Compton amplitude `S₂` as a function of `ν` at fixed `Q²`,
with its analytic structure carried as data: a `HasDispersionRelation` structure with fields for
the analyticity domain, the crossing behaviour under `ν → −ν`, and the large-`ν` falloff. Prove the
unsubtracted dispersion relation from those fields, using
`TauCeti.Analysis.Contour.PerWindow.CPV` for the principal-value integral.

Prove that the Burkhardt–Cottingham sum rule `Γ₂(Q²) = 0` follows from three hypotheses, each a
separate field and each named: the unsubtracted dispersion relation of the previous paragraph
(equivalently, the superconvergence of `S₂`); the convergence of `∫₀¹ dx g₂` at the endpoint
`x = 0`, which is not implied by `IntegrableOn` on `Set.Icc 0 1` for the function as it stands and
must be stated; and the absence of a delta-function contribution at `x = 0`. The trap this guards
is well known in the literature and has to be visible in the formalisation: the sum rule can fail
if `g₂` has a non-integrable small-`x` behaviour or a `δ(x)` term, and a version that hides those
hypotheses is not the Burkhardt–Cottingham sum rule.

Prove, by contrast, that `burkhardtCottingham_wandzuraWilczek` already establishes the sum rule for
the twist-two family without any dispersion input, and state the relation between the two routes:
the Wandzura–Wilczek route proves it for a family of structure functions, and the dispersion route
proves it for the physical one under analyticity hypotheses. Do not present either as subsuming
the other.

### 2.5 The inverse problem for the charges

Prove that determining `(a₀, a₃, a₈)` from a finite set of measured moments is a finite-rank
linear inverse problem: the map from charges to moments is linear with an explicitly given matrix,
and non-uniqueness is exactly the kernel of that matrix. Use
`TauCeti.Analysis.Fredholm.Criteria` and `.FiniteRank` so that the statement is a statement about
a Fredholm operator's kernel rather than an informal remark about underdetermination. Prove that
proton and neutron first moments alone determine `a₃` and one combination of `a₀` and `a₈`, and
that the kernel is one-dimensional; separating `a₀` from `a₈` therefore requires an independent
input, and the roadmap states which one (the octet hyperon-decay constraint, entering as data).

This subsection is what makes the phrase "the proton spin problem" precise: it is a statement
about the kernel of a `2 × 3` matrix, and `Inference.Identifiability` is where the identifiability
vocabulary comes from.

### Examples

- `modelStructureFunctions` satisfies `BurkhardtCottingham` (already proved upstream), and its
  weighted moments `Γ_n` evaluate in closed form for every natural `n`.
- The change of basis of 2.1 applied to explicit charges reproduces
  `EllisJaffeSumRule.moment_decomposition` numerically as an identity of expressions, not of
  numbers.
- An explicit `g₂` with a `1/x` small-`x` behaviour for which the Burkhardt–Cottingham convergence
  field fails, witnessing that the hypothesis is not vacuous.
- An explicit pair of proton and neutron moments for which the `2 × 3` matrix of 2.5 has the stated
  one-dimensional kernel, with the kernel vector exhibited.
- The Bjorken isovector identity `Γ₁ᵖ − Γ₁ⁿ = (1/6) a₃` for the model pair.

### Dependencies

Layers 0 and 1. `Polarized.Basic`, `Polarized.SumRules`, `PDF.Basic`, `Inference.Helicity`,
`Inference.Identifiability`, `TauCeti.Analysis.Contour.PerWindow.CPV`,
`TauCeti.Probability.Moments.Basic` and `.VanishingMoments`, `TauCeti.Analysis.Fredholm.Criteria`
and `.FiniteRank`. Neutron extraction from `LightNuclei`.

---

## Layer 3: twist three — Wandzura–Wilczek, `ḡ₂`, `d₂`, and the ELT sum rule

References: [WW]; [SV]; [CPR]; [Jaf]; [ELT]; [AEL] §8; [YR] §7.1.2.

### 3.1 The Wandzura–Wilczek relation and the twist-three remainder

Take `g2WW`, `wandzuraWilczek`, `WandzuraWilczekAssumptions`, `integral_tail_swap`,
`firstMoment_g2WW_eq_zero` and `burkhardtCottingham_wandzuraWilczek` as given.

Define the twist-three remainder as the difference

```text
ḡ₂(x, Q²) = g₂(x, Q²) − g2WW G x Q²
```

and prove that `ḡ₂` is the `g₂` of a `StructureFunctions` pair with the same `g₁`, that it inherits
`HasPhysicalSupport` from `G`, and that it inherits `Regularity` under
`WandzuraWilczekAssumptions`. Prove `firstMomentG2` of the remainder equals `firstMomentG2 G`, so
the Burkhardt–Cottingham sum rule constrains the remainder and the twist-two part separately and
consistently.

Prove the **general moment relation**, which generalises the existing
`firstMoment_g2WW_eq_zero`: for every natural `n`,

```text
∫₀¹ dx xⁿ g2WW G x Q² = −(n/(n+1)) ∫₀¹ dx xⁿ G.g1 x Q².
```

The proof is the same Fubini swap on the triangle `0 ≤ x < y ≤ 1` that `integral_tail_swap`
already performs, with `x²` replaced by `xⁿ`; generalise that lemma to a weight rather than
duplicating it, and carry the weighted analogue of `prod_integrable` as an explicit hypothesis,
because it is no more derivable from one-dimensional integrability than the unweighted one is. At
`n = 0` the relation gives `firstMoment_g2WW_eq_zero`, which should be re-derived as a corollary so
that the generalisation is visibly consistent with what is already proved. In the literature's
weight convention this family is the Cortes–Pire–Ralston relation; cite [CPR].

### 3.2 What the twist decomposition assumes

The separation of `g₂` into a twist-two and a twist-three part is not a definition inside the
structure-function container: it is the consequence of an operator-product expansion in which the
local operators are organised by twist, and the Wandzura–Wilczek form of the twist-two part follows
from the fact that the twist-two operators contributing to `g₂` are the same ones contributing to
`g₁`.

State that input as an explicit hypothesis structure rather than proving it: a
`TwistTwoDominance` structure whose fields are the operator identity relating the `n`-th moments of
the twist-two parts of `g₁` and `g₂`, and the scale at which it is asserted. Prove that
`TwistTwoDominance` implies the moment relation of 3.1 — so the roadmap has both routes, the
Fubini one from the closed-form kernel and the operator one from the moment identity — and prove
they agree.

⚠ This is the honest position: the operator-product expansion is not formalised in EpsilonEridani,
and this roadmap does not undertake it. `TwistTwoDominance` is a named hypothesis with content
(a family of moment identities), not a `Prop` field with a placeholder witness, and every result
downstream of it says so in its statement. The twist-three operators themselves — the quark-gluon
correlators — are `MultiPartonCorrelations`.

### 3.3 The reduced matrix element `d₂`

Define

```text
d₂(Q²) = 3 ∫₀¹ dx x² ḡ₂(x, Q²)
```

and prove the equivalent form

```text
d₂(Q²) = ∫₀¹ dx x² (2 g₁(x, Q²) + 3 g₂(x, Q²)),
```

as a corollary of the `n = 2` case of the moment relation of 3.1. The proof is a two-line
computation once the general relation is available, and it is the identity that makes `d₂`
measurable: the right-hand side involves only the physical structure functions, with no twist
separation.

Prove that `d₂` vanishes for the Wandzura–Wilczek family, so that a nonzero `d₂` is a
model-independent signal of twist three. Prove `d₂ = 0` for `modelStructureFunctions` composed with
`wandzuraWilczek`.

State the evolution of `d₂` as a statement about the anomalous dimension of the corresponding
twist-three operator, phrased as a one-parameter semigroup on the space of reduced matrix elements
using `TauCeti.Analysis.Semigroups.Defs` and `.Generator`, with the anomalous dimension supplied by
`MultiPartonCorrelations` as the data of that roadmap. This layer states the structure of the
evolution and cites the kernel; it does not compute an anomalous dimension.

⚠ `d₂` is, in the operator language, the reduced matrix element of a quark-gluon operator between
nucleon states. This roadmap defines it as a moment of structure functions, which is what makes it
a target here at all; the identification with an operator matrix element needs the
matrix-element interface that does not exist (see the gap named in the introduction to this
document and in 2.2), and is not claimed.

### 3.4 Transverse-spin twist-three functions and the ELT sum rule

Define the transverse-spin structure functions `h_L` and `h_T` as the twist-three partners of
`h₁`, in the same `ℝ → ℝ → ℝ` shape and with the same support and regularity bundles as
`StructureFunctions`.

Derive their Wandzura–Wilczek-type twist-two parts from the operator moment identity of 3.2, in
the closed form obtained by the same Fubini argument as 3.1. The expected form of the first is

```text
h_L^{WW}(x, Q²) = 2x ∫_x¹ dy h₁(y, Q²)/y²,
```

and the roadmap requires the kernel to be *produced* by the derivation and then checked against
[JJ2], not transcribed: the weight in the kernel is fixed by the transversity normalisation of
Convention 6, and a transcribed kernel from a source with a different normalisation is wrong by a
factor of two. Prove the corresponding relation for `h_T` and define the twist-three remainders
as the differences, in exact parallel with 3.1.

Prove the Efremov–Leader–Teryaev sum rule: the `x`-weighted moment of the valence transversity
combination satisfies an identity in which the twist-two parts of `h_L` and `h_T` cancel, leaving a
relation between the second moment of `h₁` and the twist-three remainders. As with the kernels, the
roadmap requires the coefficient to come out of the derivation and be checked against [ELT]; the
right-hand side is carried as the reduced matrix element it is and never as a number. Prove that
the sum rule is satisfied identically by the Wandzura–Wilczek family, which is the analogue of
`burkhardtCottingham_wandzuraWilczek` for transversity and is the correctness check on the
derivation.

Prove that `h₁`, `h_L` and `h_T` are all chiral-odd, so none appears in the inclusive
antisymmetric tensor of Layer 0 (this is 1.4 extended to the twist-three partners), and that the
sum rule is therefore a relation among densities and reduced matrix elements rather than among
inclusive observables. Measuring transversity requires a chirality-flipping partner, which is
`TransverseMomentumDistributions` and `Hadronization`.

### Examples

- The general moment relation of 3.1 at `n = 0, 1, 2` for `modelStructureFunctions`, with all
  three integrals evaluated in closed form, and the `n = 0` case agreeing with the existing
  `firstMoment_g2WW_eq_zero`.
- `ḡ₂ = 0` for the Wandzura–Wilczek pair, and `d₂ = 0` as a consequence, by both of its two
  expressions.
- An explicit `g₂` with nonzero `d₂`, together with the value of `d₂` computed both ways, agreeing.
- A transversity density for which `h_L^{WW}` evaluates in closed form and the ELT sum rule is
  checked term by term.
- An explicit pair violating the weighted product-integrability hypothesis of 3.1 for `n = 2`, so
  the hypothesis is visibly not vacuous.

### Dependencies

Layers 1 and 2. `Polarized.SumRules` (the whole Wandzura–Wilczek block),
`TauCeti.Analysis.Contour.PerWindow.CPV`, `TauCeti.Analysis.Semigroups.Defs` and `.Generator`,
Mathlib's product-measure Fubini theorems. Anomalous dimensions from `MultiPartonCorrelations`;
splitting kernels from `CollinearEvolution`.

---

## Layer 4: the nucleon spin decompositions

References: [JM]; [Ji1]; [Ji2]; [BJ]; [CLSWG]; [LL]; [Wak]; [ABHM]; [YR] §7.1.2.

### 4.1 The angular-momentum operator and the Jaffe–Manohar decomposition

Introduce the minimum operator vocabulary this layer needs, as explicit data with its algebraic
properties as fields: a type of local operators with the bilinear and colour structures of
`EpsilonEridani.QFT.QCD.SU3Generators` and `.RepresentationColor`, a forward matrix element
functional between nucleon states of definite helicity, and the normalisation fixing the total to
`1/2`. The nucleon state and its matrix element do not exist upstream (⚠ see the gap named in the
introduction); they are built here, and the interface is shaped so that
`HadronMassAndEnergyMomentumTensor` can use the same one for the energy-momentum tensor form
factors.

Define the four Jaffe–Manohar terms — quark helicity `(1/2)ΔΣ`, quark canonical orbital `L_q`,
gluon helicity `ΔG`, gluon canonical orbital `L_g` — as matrix elements of four operators, and
state the decomposition

```text
1/2 = (1/2) ΔΣ + L_q + ΔG + L_g
```

as an **operator identity** whose matrix element between nucleon states gives the sum rule. Prove
that the four operators sum to the angular-momentum operator, which is the content of the identity;
the sum rule is then the matrix element of a proved operator equation, and this ordering matters
because only the operator statement is scheme-independent.

Prove that `ΔΣ` as defined here agrees with `a₀` of Layer 2.1 and with the flavour-singlet
combination of Layer 1.2. Without this the two halves of the roadmap are about unrelated
quantities.

Prove that `L_q` and `L_g` as defined are **not** gauge invariant on their own, and that the
Jaffe–Manohar decomposition is a decomposition in a fixed gauge — light-cone gauge — with the gauge
choice carried as an explicit hypothesis. Cite [BJ] for the gauge-invariant reformulation in which
the link is made explicit, and state that reformulation as the alternative presentation of the same
decomposition, related by the link data of Convention 10.

### 4.2 The Ji decomposition and the Ji sum rule

Define the quark and gluon total angular momenta `J_q` and `J_g` as matrix elements of the
gauge-invariant kinetic operators, and state the Ji decomposition

```text
1/2 = J_q + J_g
```

again as the matrix element of a proved operator identity. Define the kinetic quark orbital
angular momentum `L_q^{kin} = J_q − (1/2)ΔΣ` and prove it is gauge invariant, in contrast with
`L_q` of 4.1.

State the Ji sum rule: `J_q` is half the second moment of the sum of the two unpolarised
helicity-non-flip and helicity-flip generalised parton distributions at zero skewness,

```text
J_q = (1/2) ∫₋₁¹ dx x (H_q(x, 0, 0) + E_q(x, 0, 0)).
```

The distributions `H_q` and `E_q` and their moment properties are
`GeneralizedPartonDistributions`; this roadmap consumes their second moments through
`EpsilonEridani.Particles.Parton.GPD.Moments` and `.Polynomiality` and proves the sum rule as the
identification of that moment with the matrix element of 4.2. Prove the corresponding statement for
`J_g`. Prove that the polynomiality property of the GPD moments is what makes the `x`-weighted
moment at zero skewness a form factor of the energy-momentum tensor, and cite
`HadronMassAndEnergyMomentumTensor` for those form factors; do not redefine them.

### 4.3 How the two decompositions differ

This is the central theorem of the layer and the reason both decompositions are in the roadmap.

Prove that `(1/2)ΔΣ` is the same object in both decompositions, and that `ΔG` and `J_g` are not,
and that `L_q` and `L_q^{kin}` are not. Then prove the separation theorem: with the link data of
Convention 10 as a parameter, the two orbital operators differ by a term built from the gauge
field, which vanishes identically if and only if the link is trivial. The consequence, stated as a
theorem and not a remark, is that no rearrangement of one decomposition produces the other, and
that the difference is a specific operator whose matrix element is in principle measurable.

Classify each of the six quantities appearing in 4.1 and 4.2 by two properties: whether it is the
matrix element of a gauge-invariant local operator, and whether its definition requires a link.
`(1/2)ΔΣ`, `J_q`, `J_g` and `L_q^{kin}` are matrix elements of gauge-invariant local operators;
`ΔG`, `L_q` and `L_g` are not local in the same sense and need either a gauge fixing or an explicit
link. Prove each classification rather than asserting it: for each quantity, either exhibit the
gauge-invariant local operator or exhibit the gauge transformation under which the candidate
operator fails to be invariant.

Record, citing [LL] and [Wak], that the question of which decomposition is the physically preferred
one is not a mathematical question and has no answer in this roadmap. What the roadmap delivers is
the theorem that they are different and the identification of the object by which they differ. This
is an open question in the field, and it is not dressed as a milestone.

### 4.4 Evolution and the asymptotic partition

State the evolution of the individual terms as a one-parameter semigroup on the space of
`(J_q, J_g)` pairs, and separately on `(ΔΣ, ΔG)`, with the generator supplied by the polarised
moment-space kernels of `CollinearEvolution` and the semigroup theory taken from
`TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.CauchyProblem.Basic` and
`.CauchyProblem.Uniqueness`. Existence and uniqueness are not reproved. ⚠ Do not reach for
`TauCeti.Analysis.PDE`: it is elliptic theory and does not apply.

Prove the following.

- `ΔΣ` has vanishing anomalous dimension at leading order, so it is scale-independent at that
  order, and the scale dependence that makes `a₀` scheme-dependent is a higher-order effect. State
  the leading-order result as a theorem with the kernel as its hypothesis, and state the
  higher-order scale dependence as a property of the generator supplied by `CollinearEvolution`,
  not as a separate calculation here.
- The leading-order evolution of `(J_q, J_g)` has a unique fixed direction, and the asymptotic
  partition of the nucleon spin is `J_q : J_g = 3 n_f : 16`, so that

  ```text
  J_q → (3 n_f/(16 + 3 n_f)) · 1/2,      J_g → (16/(16 + 3 n_f)) · 1/2
  ```

  as the scale grows. Prove this as the statement that the fixed direction is the eigenvector of
  the leading-order anomalous-dimension matrix with zero eigenvalue, using
  `TauCeti.Analysis.Matrix.Spectrum` for the eigenvector, and carry `n_f` as data on the flavour
  `Fintype`. The limit statement is a statement about the semigroup's asymptotics and needs the
  leading-order generator as an explicit hypothesis.
- The consequence for `ΔG`: at leading order `αₛ(Q²) ΔG(Q²)` tends to a constant, so `ΔG` grows
  logarithmically and the gluon helicity contribution does not settle to a finite fraction the way
  `J_g` does. State this precisely, because the contrast between the asymptotic behaviour of `ΔG`
  and of `J_g` is the sharpest available statement that the two decompositions are inequivalent,
  and it is a theorem rather than an interpretation.

### Examples

- An explicit operator assignment for a free-field model in which all four Jaffe–Manohar terms are
  computable, the identity of 4.1 holds, and `L_g = 0`.
- A gauge transformation witnessing the non-invariance of `L_q`, with `L_q^{kin}` invariant under
  the same transformation.
- A trivial link for which the difference operator of 4.3 vanishes, and a non-trivial one for which
  it does not, both exhibited explicitly.
- The asymptotic ratio of 4.4 evaluated for `n_f = 3`, `4`, `6`, as identities of expressions.
- `ΔΣ` computed from an explicit set of helicity densities agrees with `a₀` computed from the
  charges of 2.1.

### Dependencies

Layers 1, 2 and 3. `QFT.QCD.SU3Generators`, `.SUNGenerators`, `.RepresentationColor`,
`GPD.Moments`, `GPD.Polynomiality`, `Factorization.Evolution.MomentSpace`,
`TauCeti.Analysis.Semigroups.*`, `TauCeti.Analysis.Matrix.Spectrum`. Energy-momentum tensor form
factors from `HadronMassAndEnergyMomentumTensor`; the generalised parton distributions themselves
from `GeneralizedPartonDistributions`; polarised kernels and anomalous dimensions from
`CollinearEvolution`; phase-space orbital angular momentum from `WignerDistributions`.

---

## Dependency graph

```text
Layer 0  antisymmetric tensor, asymmetries, positivity bounds
   |         uses: Tensors.Basic, Kinematics.*, Levi-Civita, Polarized.Basic
   |         consumes F1, sigma_T, sigma_L, R from InclusiveStructureFunctions
   v
Layer 1  helicity densities, transversity, spin-density matrix
   |         uses: PDF.Positivity, PDF.MsbarPositivity, Weyl/Clifford, Semigroups
   |         consumes splitting kernels from CollinearEvolution
   v
Layer 2  moments, axial charges, Bjorken / Ellis-Jaffe / Burkhardt-Cottingham
   |         uses: Polarized.SumRules, Inference.Helicity, CPV, Fredholm
   |         consumes neutron extraction from LightNuclei
   v
Layer 3  Wandzura-Wilczek, g2bar, d2, ELT sum rule
   |         uses: Polarized.SumRules (WW block), Fubini, Semigroups
   |         consumes anomalous dimensions from MultiPartonCorrelations
   v
Layer 4  Jaffe-Manohar and Ji decompositions, separation theorem, asymptotics
             uses: QCD generators, GPD.Moments, Semigroups, Matrix.Spectrum
             consumes GPDs from GeneralizedPartonDistributions and EMT form
             factors from HadronMassAndEnergyMomentumTensor
```

Layer 0 and Layer 1 are independent of each other except for one link: 1.4 uses the Layer 0
uniqueness theorem to conclude that transversity is absent from the inclusive tensor. Layer 3
depends on Layer 2 only through the moment conventions and the Burkhardt–Cottingham statement.
Layer 4 depends on Layer 1 for `ΔΣ` and on Layer 2 for the identification of `ΔΣ` with `a₀`.

## Acceptance examples

The following specific statements certify the roadmap. Each is checkable against the layer that
produces it.

- The space of alternating, doubly-conserved, `S`-linear bilinear forms on a four-dimensional
  Lorentzian space is two-dimensional under the stated non-degeneracy hypotheses, and
  `ε(v, w, p, S)` is excluded by conservation with an explicit witness.
- `IsPolarizedDecomposition g K G A` holds if and only if `A = 0` or `g₁ + g₂ ≡ 1`.
- `A₁` and `A₂` recovered from `fromG1G2 g K c₁ c₂` return `c₁` and `c₂` through the inversion,
  with the `γ ≠ 0` hypothesis discharged on the physical region.
- `|A₁| ≤ 1` and `|A₂| ≤ √R` from positive semidefiniteness of the photon-helicity matrix, with the
  Soffer–Teryaev refinement derived rather than transcribed.
- A positive semidefinite complex spin-density matrix that is not time-reversal invariant, showing
  the existing real `SpinDensity` is a proper specialisation, and the complex Soffer bound reducing
  to the existing real one.
- `|ΔΣ| ≤ Σ_q (q + q̄)` from block positive semidefiniteness, strictly stronger than the sum of
  per-flavour bounds on an explicit two-flavour example.
- A spin-half target admits no gluon transversity, with the spin-one contrast proved.
- `Γ₁ᵖ = (1/12) a₃ + (1/36) a₈ + (1/9) a₀` is the same statement as
  `EllisJaffeSumRule.moment_decomposition`, and `Δs = 0 ↔ a₀ = a₈`.
- `Γ₁ᵖ − Γ₁ⁿ = (1/6) a₃`, with no `Δg` term, proved from the flavour identities.
- The Burkhardt–Cottingham sum rule derived from three named hypotheses, with an explicit `g₂`
  violating the endpoint-convergence one.
- `∫₀¹ dx xⁿ g2WW G x Q² = −(n/(n+1)) ∫₀¹ dx xⁿ g₁(x, Q²)` for every natural `n`, with
  `firstMoment_g2WW_eq_zero` recovered at `n = 0`.
- `d₂ = 3∫₀¹ dx x² ḡ₂ = ∫₀¹ dx x² (2g₁ + 3g₂)`, and `d₂ = 0` for the Wandzura–Wilczek family.
- The ELT sum rule holds identically for the Wandzura–Wilczek transversity family.
- `1/2 = (1/2)ΔΣ + L_q + ΔG + L_g` and `1/2 = J_q + J_g` are matrix elements of proved operator
  identities, and the `ΔΣ` in the first agrees with `a₀` of Layer 2.
- `L_q^{kin}` is gauge invariant and `L_q` is not, each with an explicit witness, and the two differ
  by an operator that vanishes exactly when the link is trivial.
- `J_q : J_g → 3 n_f : 16` as the zero-eigenvalue eigenvector of the leading-order
  anomalous-dimension matrix, evaluated for `n_f = 3, 4, 6`.

## References

- [AEL] M. Anselmino, A. Efremov and E. Leader, *The theory and phenomenology of polarized deep
  inelastic scattering*, Phys. Rept. **261** (1995) 1; arXiv:hep-ph/9501369.
- [ABHM] C. A. Aidala, S. D. Bass, D. Hasch and G. K. Mallot, *The spin structure of the nucleon*,
  Rev. Mod. Phys. **85** (2013) 655; arXiv:1209.2803.
- [AM] X. Artru and M. Mekhfi, *Transversely polarized parton densities, their evolution and their
  measurement*, Z. Phys. C **45** (1990) 669.
- [BC] H. Burkhardt and W. N. Cottingham, *Sum rules for forward virtual Compton scattering*,
  Ann. Phys. **56** (1970) 453.
- [BCK] P. A. Baikov, K. G. Chetyrkin and J. H. Kühn, *Adler function, Bjorken sum rule, and the
  Crewther relation to order αₛ⁴*, Phys. Rev. Lett. **104** (2010) 132004; arXiv:1001.3606.
- [Bj] J. D. Bjorken, *Applications of the chiral U(6) ⊗ U(6) algebra of current densities*,
  Phys. Rev. **148** (1966) 1467.
- [BJ] S. Bashinsky and R. L. Jaffe, *Quark and gluon orbital angular momentum and spin in hard
  processes*, Nucl. Phys. B **536** (1999) 303; arXiv:hep-ph/9804397.
- [CLSWG] X.-S. Chen, X.-F. Lü, W.-M. Sun, F. Wang and T. Goldman, *Spin and orbital angular
  momentum in gauge theories: nucleon spin structure and multipole radiation revisited*,
  Phys. Rev. Lett. **100** (2008) 232002; arXiv:0806.3166.
- [CPR] J. L. Cortes, B. Pire and J. P. Ralston, *Measuring the transverse polarization of quarks
  in the proton*, Z. Phys. C **55** (1992) 409.
- [EJ] J. Ellis and R. L. Jaffe, *Sum rule for deep-inelastic electroproduction from polarized
  protons*, Phys. Rev. D **9** (1974) 1444; erratum Phys. Rev. D **10** (1974) 1669.
- [ELT] A. V. Efremov, E. Leader and O. V. Teryaev, *Nonsinglet contribution to the structure
  function g₂ and a new sum rule*, Phys. Rev. D **55** (1997) 4307; arXiv:hep-ph/9607217.
- [HJM] P. Hoodbhoy, R. L. Jaffe and A. Manohar, *Novel effects in deep inelastic scattering from
  spin-one hadrons*, Nucl. Phys. B **312** (1989) 571.
- [Jaf] R. L. Jaffe, *g₂ — the nucleon's other spin-dependent structure function*, Comments Nucl.
  Part. Phys. **19** (1990) 239.
- [Ji1] X. Ji, *Gauge-invariant decomposition of nucleon spin*, Phys. Rev. Lett. **78** (1997) 610;
  arXiv:hep-ph/9603249.
- [Ji2] X. Ji, *Off-forward parton distributions*, Phys. Rev. D **55** (1997) 7114;
  arXiv:hep-ph/9609381.
- [JJ1] R. L. Jaffe and X. Ji, *Chiral-odd parton distributions and polarized Drell-Yan process*,
  Phys. Rev. Lett. **67** (1991) 552.
- [JJ2] R. L. Jaffe and X. Ji, *Chiral-odd parton distributions and Drell-Yan processes*,
  Nucl. Phys. B **375** (1992) 527. This is the source for the transversity normalisation of
  Convention 6 and for the `h_L`, `h_T` Wandzura–Wilczek-type relations of Layer 3.4.
- [JM] R. L. Jaffe and A. Manohar, *The g₁ problem: deep inelastic electron scattering and the spin
  of the proton*, Nucl. Phys. B **337** (1990) 509.
- [LL] E. Leader and C. Lorcé, *The angular momentum controversy: what's it all about and does it
  matter?*, Phys. Rept. **541** (2014) 163; arXiv:1309.4235.
- [LR] B. Lampe and E. Reya, *Spin physics and polarized structure functions*, Phys. Rept. **332**
  (2000) 1; arXiv:hep-ph/9810270.
- [LV] S. A. Larin and J. A. M. Vermaseren, *The αₛ³ corrections to the Bjorken sum rule for
  polarized electroproduction and to the Gross-Llewellyn Smith sum rule*, Phys. Lett. B **259**
  (1991) 345.
- [Man] A. V. Manohar, *An introduction to spin dependent deep inelastic scattering*,
  arXiv:hep-ph/9204208 (Lake Louise Winter Institute lectures, 1992).
- [RS] J. P. Ralston and D. E. Soper, *Production of dimuons from high-energy polarized proton-proton
  collisions*, Nucl. Phys. B **152** (1979) 109.
- [Sof] J. Soffer, *Positivity constraints for spin-dependent parton distributions*, Phys. Rev.
  Lett. **74** (1995) 1292; arXiv:hep-ph/9409254.
- [ST] J. Soffer and O. V. Teryaev, *The role of g₂ in relating the Schwinger and Gerasimov-Drell-Hearn
  sum rules*, Phys. Rev. D **51** (1995) 25; arXiv:hep-ph/9405228. Cited in Layer 0.4 for the
  refined bound on `A₂`; the roadmap derives the bound and checks it against this source.
- [SV] E. V. Shuryak and A. I. Vainshtein, *Theory of power corrections to deep inelastic
  scattering in quantum chromodynamics. II. Q⁴ effects: polarized target*, Nucl. Phys. B **201**
  (1982) 141.
- [Wak] M. Wakamatsu, *Is gauge-invariant complete decomposition of the nucleon spin possible?*,
  Int. J. Mod. Phys. A **29** (2014) 1430012; arXiv:1402.4193.
- [WW] S. Wandzura and F. Wilczek, *Sum rules for spin-dependent electroproduction — test of
  relativistic constituent quarks*, Phys. Lett. B **72** (1977) 195.
- [YR] R. Abdul Khalek et al., *Science requirements and detector concepts for the Electron-Ion
  Collider: EIC Yellow Report*, Nucl. Phys. A **1026** (2022) 122447; arXiv:2103.05419. This
  roadmap covers Volume II, Chapter 7, subsection 7.1.2.

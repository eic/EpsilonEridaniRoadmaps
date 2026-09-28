# Roadmap: inclusive structure functions of the proton and neutron

This roadmap develops the inclusive neutral- and charged-current cross sections for
lepton–nucleon scattering, the structure functions that parameterise them, and the parton-model
and operator-product content of those structure functions. It is the base layer of the
deep-inelastic programme: almost every other roadmap in this collection either measures one of
these objects differentially, generalises it off the forward diagonal, or replaces the proton
target by something else.

The chain the roadmap builds is short to describe and long to formalise. A Lorentz-covariant,
current-conserving, hermitian hadronic tensor for an unpolarised spin-half target has exactly
three independent invariant coefficients. Contracting it with the leptonic tensor of a
vector/axial-vector exchange produces the inclusive cross section differential in two variables,
with an explicit and universal dependence on the inelasticity. The three coefficients, made
dimensionless, are `F₁`, `F₂` and `F₃`; the combination `F_L` measures the failure of the
Callan–Gross relation and therefore the failure of the naive parton model. Moments of the
structure functions in the Bjorken variable are, by the operator product expansion, matrix
elements of local operators of definite twist, ordered in powers of `1/Q²`; at the accuracy where
the nucleon mass matters, the correct moment variable is Nachtmann's `ξ` rather than `x`.

The final application is the statement that a small set of sum rules — Adler, Gross–Llewellyn
Smith, Gottfried, the momentum and quark-number sum rules — are identities between measured
moments of structure functions and quantum numbers of the target, each with its convergence
hypothesis and each with its correction explicitly identified. Those are the statements that turn
a cross-section table into a statement about the nucleon, and they are the statements a
formalisation can make precise in a way that prose cannot: every one of them is an interchange of
a limit and an integral away from being false.

The roadmap is deliberately layered so that the unproved physics input is isolated. Layers 0
through 3 rest on nothing but the tensor decomposition and the definition of a collinear density.
Layer 4 rests on the operator product expansion, which this roadmap states as an explicit
hypothesis bundle rather than deriving from the field algebra, because the machinery to derive it
does not exist upstream. Layer 5 rests on Layer 4 and on nothing else.

## Scope

Included:

- The Lorentz decomposition of the inclusive hadronic tensor for an unpolarised spin-half
  target: the parity-even pair already present upstream, the parity-odd third coefficient, and
  the proof that three coefficients are exactly enough.
- The dimensionless structure functions `F₁`, `F₂`, `F₃` and the longitudinal function `F_L`,
  both in the massless combination and in the target-mass-exact combination, with the identity
  between them.
- Positivity constraints on the structure functions as consequences of the positive
  semidefiniteness of the forward helicity amplitude matrix.
- The contraction of leptonic and hadronic tensors, giving the doubly differential inclusive
  cross section in `(x, Q²)` with its `Y₊`, `Y₋`, `y²` structure, for neutral-current and
  charged-current exchange, and the reduced cross section.
- The quark-parton model expressions for `F₁`, `F₂`, `F₃` as charge- and coupling-weighted sums
  over collinear quark and antiquark densities, for a target of specified quark content.
- The Callan–Gross relation as a theorem about the elastic spin-half partonic channel, and
  `F_L` as the measure of its failure.
- Isospin relations between proton and neutron structure functions, and the charged-current
  flavour combinations, including the quark/antiquark separation that `F₃` provides.
- The Adler, Gross–Llewellyn Smith, Gottfried, momentum and quark-number sum rules, each as an
  identity between a moment of a structure function and a quantum number of the target, with
  the hypotheses that make the moment converge stated as hypotheses.
- The operator-product-expansion statement in moment space: moments of `F₂` and `F₃` as
  products of Wilson coefficients with reduced matrix elements of twist-two operators, and the
  twist expansion organised in powers of `1/Q²`.
- Target-mass corrections: the Nachtmann variable, its properties, the Georgi–Politzer x-space
  target-mass-corrected structure functions, the Nachtmann moments, and the theorem that the
  Nachtmann moments are the combinations whose scale dependence is that of the twist-two Wilson
  coefficient alone.
- Higher-twist contributions to `F₂` and `F_L` as defined objects with their `1/Q²` scaling
  stated.

Not included. The scale dependence of the collinear densities and of the structure-function
moments — splitting kernels, the running coupling, the solution of the evolution equations, and
coefficient functions beyond the single one-loop coefficient that appears in the Gross–Llewellyn
Smith sum rule — is `CollinearEvolution`. The composition of the generalised neutral-current
structure functions out of electroweak couplings, the `γ`/`Z` interference bookkeeping and the
propagator factors are `ElectroweakAndBSM`; this roadmap uses the coefficient combinations that
roadmap defines and proves only that the cross section depends on them through the three
invariant functions. Target polarisation, `g₁`, `g₂` and the Bjorken sum rule are
`SpinStructure`. A detected final-state hadron makes the process semi-inclusive and belongs to
`Hadronization`; a detected intact proton makes it diffractive and belongs to `Diffraction`; a
measured transverse momentum belongs to `TransverseMomentumDistributions`. Off-forward
generalisations are `GeneralizedPartonDistributions`. The correlator content of the higher-twist
terms is `MultiPartonCorrelations`. The small-`x` behaviour of `F₂` and `F_L`, and any statement
about saturation, is `SmallXAndSaturation`. The `Q² → 0` limit and the photoproduction cross
section are `Photoproduction`. Nuclear targets, `F₂^A` and nuclear modification are
`NuclearPartonDistributions`. QED radiative corrections to the measured cross section, and the
distinction between Born-level and radiatively corrected structure functions, are
`RadiativeCorrections`. Lattice determinations of the twist-two matrix elements of Layer 4 are
`LatticeBridge`. The energy–momentum tensor matrix element that normalises the momentum sum rule
is `HadronMassAndEnergyMomentumTensor`.

Material developed here belongs under `EpsilonEridani/QFT/Scattering/DIS/`: the parity-odd
extension of the tensor decomposition in `Tensors/`, the structure functions, cross sections and
sum rules in a new `Inclusive/` subdirectory, and the target-mass and higher-twist content in
`Corrections/`, whose existing type abbreviations it fills in. The moment integrals of the sum
rules belong with the densities in `EpsilonEridani/Particles/Parton/PDF/`.

## Conventions and coordination with upstream

1. **Metric signature is `(+,−,−,−)`, and the metric is explicit data, never an instance.**
   Scalar products are evaluated through a `Bilin V := LinearMap.BilinForm ℝ V` passed as an
   argument, following `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`. Symmetry of the
   form is a hypothesis `hSymm : g.IsSymm` where it is needed, not a blanket assumption. The
   trap avoided: a signature baked into a typeclass makes every sign error invisible, and a form
   assumed symmetric where the proof does not need it hides which results are really about
   symmetric forms.

2. **Kinematics is never restated.** Every statement takes a
   `Kinematics.DisKinematics V` and uses `Q2`, `xBj`, `yInel`, `W2` from it. The bounds
   `0 < x ≤ 1` and `0 < y ≤ 1` are obtained from `Kinematics.Bounds.BasicAssumptions`, not
   re-derived. The trap avoided: two incompatible definitions of `x` in the same library.

3. **Structure functions are dimensionless functions of `(x, Q²)`, bundled.** The roadmap's
   central datum is a record with three fields `F1 F2 F3 : ℝ → ℝ → ℝ`, in the same shape as the
   existing `EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic.StructureFunctions` record for
   `g₁`, `g₂`. The dimensionful invariant coefficients `W₁`, `W₂`, `W₃` appear only inside Layer
   0 and are related to the dimensionless functions by proved identities. The trap avoided:
   mixing the two normalisations, which differ by factors of `M` and `p·q` and are the single
   commonest source of error in the literature.

4. **`F_L` exists in two forms and they are never conflated.** The massless combination is
   upstream's `Tensors.Longitudinal.FL x F1 F2 = F2 - 2 * x * F1`. The target-mass-exact
   combination is `F_L = (1 + γ²) F₂ − 2 x F₁` with `γ² = 4 M² x² / Q²`. The roadmap proves
   they agree at `M = 0` and that the second is the one that equals the longitudinal absorption.
   The trap avoided: quoting a bound on one as a bound on the other at the few-per-cent level
   where target-mass effects live.

5. **The nucleon mass is carried explicitly everywhere, and the massless statement is the
   corollary.** No definition may be stated only in the `M = 0` limit. The trap avoided: a
   library in which target-mass corrections cannot be stated because the objects they correct
   were defined without a mass.

6. **The parity-odd structure of the tensor enters through one bilinear form, supplied as
   data.** The Levi-Civita contraction `ε(·, ·, p, q)` is itself a bilinear form on `V`; the
   parity-odd decomposition therefore takes an extra `Bilin V` argument together with the
   properties it must have (antisymmetry, annihilation of `p` and `q`, and Lorentz covariance in
   the sense of `Tensors.Hadronic.IsLorentzCovariant`). Identifying that form with a genuine
   volume form on a four-dimensional `V`, using
   `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.LeviCivita`, is a separate obligation
   and is stated as such. The trap avoided: forcing every statement about `F₃` to carry a
   four-dimensionality hypothesis that only one theorem actually needs.

7. **Charges and couplings are parameters, never numerals.** The electromagnetic coupling, the
   quark electric charges in units of the positron charge, and the vector and axial couplings
   all enter as arguments. The generalised neutral-current coefficient combinations are taken
   from `ElectroweakAndBSM` as opaque functions of those parameters. The trap avoided: a
   theorem that is true only for a particular numerical value of `sin²θ_W`, stated as though it
   were general.

8. **Flavour is an arbitrary `Fintype`, and the target's quark content is data.** Following
   `EpsilonEridani.Particles.Parton.PDF.Basic`, a density is
   `Pdf Flavor := Flavor → ℝ → ℝ → ℝ` and a target is specified by a map from flavours to
   valence numbers. The proton and the neutron are two instances of that data, related by the
   isospin involution on the flavour type, not two separate developments. The trap avoided: a
   proton-only library in which the neutron structure function has to be redefined.

9. **Positivity is always a consequence of positive semidefiniteness of a helicity matrix, never
   an axiom.** Following the idiom of `EpsilonEridani.Particles.Parton.PDF.Positivity`, the
   structure-function bounds are derived from `Matrix.PosSemidef` applied to the matrix of
   forward helicity amplitudes, with the help of
   `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`. The trap avoided: asserting
   `F₁ ≥ 0` as a hypothesis, which makes it unavailable as information about any particular
   model.

10. **Moments are `∫ x in (0:ℝ)..1` interval integrals with explicit integrability
    hypotheses.** The `n`-th moment is written through
    `EpsilonEridani.Particles.Parton.PDF.Basic.mellinMoment` where the object is a density, and
    through an interval integral of the structure function otherwise. Every sum rule carries its
    own `IntervalIntegrable` hypothesis, stated for the specific integrand of that sum rule. The
    trap avoided: a sum rule that is vacuously true because its integral was never shown to
    exist, and the opposite trap of a blanket regularity assumption that silently excludes the
    small-`x` behaviour the sum rule is sensitive to.

11. **A sum rule whose right-hand side is a quantum number states that quantum number as a
    hypothesis on the target data.** The valence content of the proton is input; the sum rule is
    the theorem that a moment equals it. The trap avoided: circularity, in which the sum rule is
    used to define the quantum number it is supposed to predict.

12. **The operator product expansion is a named hypothesis bundle, not a theorem.** Layer 4
    introduces a record carrying Wilson coefficients and reduced matrix elements and the
    factorised moment identity as its content. Every consequence is proved from that record.
    Nothing in the roadmap claims the expansion is derived. The trap avoided: presenting the
    expansion as established because its consequences have been formalised.

13. **Where something is unproved it is named in prose as a gap, never encoded as a
    `Prop`-valued field with a placeholder witness.** A field that is inhabited by
    construction asserts nothing while reading like a hypothesis. Assumption bundles in this
    roadmap either carry genuine mathematical content that a model must supply, or they are
    `Type`-valued records of data.

14. **`x` is always the Bjorken variable and `ξ` is always the Nachtmann variable.** No
    statement uses `x` to mean a generic momentum fraction. Convolution integrals over a
    momentum fraction use `z`, following
    `EpsilonEridani.QFT.Factorization.Convolution.Collinear`. The trap avoided: the one-symbol
    collision that makes target-mass formulae unreadable.

## Existing upstream material used by the roadmap

From `EpsilonEridani`, all under the `EpsilonEridani.` prefix:

- `QFT.Scattering.DIS.Kinematics.Basic` — `DisKinematics`, `Q2`, `xBj`, `yInel`, `W2`,
  `W2_eq_with_Q2`; and `.Bounds` — `BasicAssumptions` and the unit-interval theorems for `x`
  and `y`, used as the hypothesis bundle wherever the physical region is needed. Also
  `.AccessMethods` — the electron, `Σ` and `eΣ` reconstruction methods with their positivity
  and range theorems, used in the acceptance examples to check that the cross-section formulae
  are stated in variables the reconstruction actually produces.
- `QFT.Scattering.DIS.Tensors.Basic` — the whole parity-even decomposition: `Bilin`,
  `transverseMetric` with its conservation lemmas, `pTransverse`, `IsLorentzCovariant`,
  `IsF1F2Decomposition`, `fromF1F2` with its symmetry, conservation and covariance lemmas,
  `decomposition_unique` under `UniquenessAssumptions`, and `exists_isF1F2Decomposition` under
  `SpectatorAssumptions`. Layer 0 extends this rather than rebuilding it. Its `Witness`
  namespace supplies a concrete form, kinematics and tensor for the Layer 0 examples.
- `QFT.Scattering.DIS.Tensors.Longitudinal` — `FL`, `IsCallanGross`, `isCallanGross_iff`,
  `structureF2`, the exact longitudinal projection `two_xBj_mul_Q2_mul_apply_pTransverse`, the
  characterisation `isCallanGross_iff_apply_pTransverse_eq_zero`, the identity
  `Q2_mul_pTransverse_self`, and the `ElasticChannel` record with `hardF1`, `hardF2`,
  `longitudinalKernel`, `IsOnShell` and `loStructureFunction_longitudinalKernel`. This is the
  backbone of Layers 1 and 2.
- `QFT.Scattering.DIS.CrossSection` — `yFactor` with `yFactor_eq_sq`, `yFactor_pos`,
  `yFactor_ge_half`, `two_mul_yFactor`; `loNCdSigma` with `loNCdSigma_eq_conventional` and its
  non-negativity and positivity lemmas; `f2LO`, `f2LO_nonneg`, `loNCdSigma_f2LO_nonneg`. Layer
  1 generalises `loNCdSigma` and must reduce to it. `QFT.Scattering.DIS.Basic` is the shared
  entry point for the namespace.
- `QFT.Factorization.DIS.HardKernel` — `HardKernel`, `HardKernelAssumptions`,
  `constantHardKernel`; `.LO` — `loChannel`, `loStructureFunction`, `IsLOFactorized`, of which
  the parton-model structure functions are instances; `.DiagrammaticHardKernel`, used only to
  fix the normalisation of the one-loop coefficient entering the Gross–Llewellyn Smith sum
  rule.
- `QFT.Factorization.Convolution.Collinear` and `.Properties` — the collinear convolution and
  its algebraic properties; `.Mellin` — `mellinDis`, `MellinDisConvergent`,
  `MellinConvolutionAssumptions`, `mellinDis_convolveAt`, `moment_convolveAt` and
  `mellinMoment_convolveAt`, the machinery that turns a convolution into a product of moments
  and what makes Layer 4 expressible.
- `QFT.Factorization.Evolution.MomentSpace` — the moment-space form of evolution, cited as the
  interface across which `CollinearEvolution` supplies the scale dependence of the reduced
  matrix elements.
- `Particles.Parton.PDF.Basic` — `Pdf`, `mellinMoment`, `IsPartonDensity`, `Regularity`,
  `Assumptions` with `assumptions_iff`, `mellinMoment_integrable`, `SumRuleAssumptions`,
  `momentum_sumRule`, `valence_sumRule`; `.Positivity` — `SpinDensity` with its
  `Matrix.PosSemidef` field, `f1`, `f1_nonneg`, which is both the object Layer 2 is written in
  terms of and the idiom Layer 1 follows for the structure-function bounds; `.Model`, a
  concrete density for the examples.
- `Mathematics.DataStructures.Matrix.PosSemidef` — the positive-semidefiniteness lemmas that
  extract the Layer 1 bounds; `Mathematics.Distribution.BasicExtensions` — the
  plus-distribution structure of the one-loop coefficient.
- `Relativity.Tensors.RealTensor.Metrics.LeviCivita` and
  `Relativity.Tensors.LeviCivita.ContractionsExtensions` — the volume form and its
  contractions, used once, to identify the abstract parity-odd bilinear form of Layer 0 with a
  genuine Levi-Civita contraction.
- `QFT.Scattering.DIS.Corrections.Basic` — `TargetMassCorrection`, `HigherTwistCorrection`,
  `correctedObservable`, `correctedObservable_decompose`,
  `correctedObservable_eq_baseline_of_zero`, `BoundedCorrections` and
  `correctedObservable_sub_baseline_abs_le`. ⚠ The first two are bare type abbreviations for
  `ℝ → ℝ → ℝ`: they fix an interface and assert nothing about target-mass or higher-twist
  physics. Layer 5 supplies the inhabitants that make them mean something, and proves that the
  Nachtmann construction is one.

From `TauCeti`:

- `TauCeti.Probability.Moments.Basic` — the moment vocabulary the sum-rule integrals are stated
  in; the roadmap follows its naming rather than inventing its own. `.Determinacy` and
  `.CompactDeterminacy` are used in one direction only: distinct twist-two matrix element
  sequences give distinct moment sequences, so the Layer 4 identification is injective where
  determinacy holds.
- `TauCeti.Analysis.SpecialFunctions.Beta` — the Euler beta integrals that evaluate the moments
  of the model densities of the examples in closed form.
- `TauCeti.Analysis.Contour.PerWindow.CPV` — Cauchy principal values, for the Layer 4
  dispersion relation; `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` and
  `.Uniqueness` — the spectral representation used to state that relation and its uniqueness.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` — weak derivatives, for the `Q²` derivatives of
  moments that appear when the twist expansion is differentiated.

From `Mathlib`: `MeasureTheory.Integral.IntervalIntegral` for every moment integral;
`Analysis.SpecialFunctions.Log` and `Analysis.SpecialFunctions.Sqrt` for the logarithmic
variables and for the Nachtmann radical; `Analysis.Matrix.Spectrum` for the helicity matrix
spectrum; `Algebra.Order.CauSeq.BigOperators` and the ordered-field API for the positivity
algebra.

Genuine absences, and what the roadmap does about them:

- ⚠ **Bessel functions, polylogarithms and harmonic sums are absent from both Mathlib and
  TauCeti.** Nothing in this roadmap needs them: the only perturbative coefficient it states is
  the one-loop Gross–Llewellyn Smith correction, which is rational. The roadmap does not wait
  for them, and it does not state any higher-order coefficient function, which is
  `CollinearEvolution`'s problem and where those functions will first be needed.
- ⚠ **The existence half of the moment problem is absent from both libraries.** There is no
  Hausdorff or Hamburger reconstruction theorem. The roadmap therefore never reconstructs a
  structure function from its moments; every Layer 4 statement runs from the structure function
  to the moments, and the inverse direction is not claimed. The inverse problem of extracting a
  density from measured moments is `CollinearEvolution`'s and the inference modules' concern.
- ⚠ **There is no local composite-operator formalism in `EpsilonEridani`.** The Wick-algebra
  material available is `EpsilonEridani.QFT.PerturbationTheory.WickAlgebra.NormalOrder.BasicExtensions`,
  which is normal-ordering lemmas and not a theory of renormalised local operators with
  anomalous dimensions. The operator product expansion is consequently a hypothesis bundle in
  Layer 4 and not a theorem of this roadmap, and its derivation is not scheduled here or
  anywhere else in this collection. This is the roadmap's principal gap and it is stated as a
  gap.
- ⚠ **Neither the Nachtmann variable, nor any of the sum rules of Layer 3, nor the parity-odd
  structure function `F₃`, exists anywhere upstream.** The polarised sum rules in
  `EpsilonEridani.QFT.Scattering.DIS.Polarized.SumRules` are `SpinStructure`'s, and the shape
  of that file — a record per sum rule, carrying the convergence hypotheses, and a concrete
  model instance proving the record is inhabited — is the shape Layer 3 follows.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the invariant
  product, `Physlib.Relativity.Tensors.MetricTensor` and
  `Physlib.Relativity.Tensors.Contraction.Basic` for index contraction, and
  `Physlib.Relativity.LorentzGroup.Basic` for the covariance group. The tensor decomposition of
  Layer 0 is a statement about these objects, and
  `Physlib.Relativity.Tensors.RealTensor.Vector.Causality.Basic` supplies the space-like condition
  on the momentum transfer.

## Layer 0: the hadronic tensor and its three invariant coefficients

References: Devenish & Cooper-Sarkar ch. 3; Roberts ch. 1–2; Halzen & Martin ch. 8;
Yellow Report §7.1.1.

### 0.1 The leptonic tensor of a vector/axial-vector exchange

For an exchange with lepton-side vertex `γ^μ(v - a γ₅)`, the spin-summed leptonic tensor splits
into a symmetric and an antisymmetric part. The symmetric part is
`2(v² + a²)(k_μ k'_ν + k_ν k'_μ - (k·k') g_μν)` and the antisymmetric part is proportional to
`v a` times the Levi-Civita contraction `ε_{μναβ} k^α k'^β`. Targets to prove:

- The symmetric part is exactly `(v² + a²)` times `Tensors.Leptonic.lMuNu`, which already exists
  upstream; the proof is a rewriting of `rankOne` and `transverseMetric`, and its symmetry is
  `lMuNu_isSymm`.
- The antisymmetric part is a bilinear form on `V` which is antisymmetric and annihilates both
  `k` and `k'`, hence also `q = k - k'`.
- The leptonic tensor is conserved on the lepton momenta only up to lepton-mass terms; the
  massless-lepton statement `q^μ L_{μν} = 0` is the theorem, and its hypothesis is the
  vanishing of the lepton mass. State the hypothesis, do not assume it silently.

### 0.2 The hadronic tensor as a covariant conserved form

The hadronic tensor is taken as an abstract `W : Bilin V` subject to hypotheses, following
`Tensors.Basic`. The three hypotheses are Lorentz covariance in the sense of
`IsLorentzCovariant g K W` (invariance under the stabiliser of the kinematics), current
conservation `W K.q v = 0` and `W v K.q = 0` for all `v`, and hermiticity, which for a real
bilinear form means that the symmetric part is the absorptive parity-even piece and the
antisymmetric part is the parity-odd piece. Targets:

- Decomposition of an arbitrary `Bilin V` into symmetric and antisymmetric parts, with
  conservation inherited by each part separately.
- The symmetric, conserved, covariant part has the `fromF1F2` form. This is upstream:
  `exists_isF1F2Decomposition` under `SpectatorAssumptions`, with uniqueness from
  `decomposition_unique` under `UniquenessAssumptions`. The roadmap's obligation is to record
  precisely which hypotheses of those two bundles are physical statements about the target and
  which are non-degeneracy statements about the kinematics.
- The antisymmetric, conserved, covariant part is a single multiple of the parity-odd form
  `A := ε(·, ·, p, q)`. This is the new statement. Its proof needs the four-dimensionality of
  `V`, and it is the one place in the roadmap where that hypothesis is used.
- Consequently there are exactly three invariant coefficients, and the map from
  `(W₁, W₂, W₃)` to tensors is injective. This is the Layer 0 headline, and it is what licenses
  every later statement that a measurement of the cross section determines the structure
  functions.

### 0.3 The parity-odd form as a Levi-Civita contraction

Targets:

- Construct `A := ε(·, ·, p, q)` from the volume form of
  `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.LeviCivita` and prove it is
  antisymmetric, annihilates `p` and `q`, and is `IsLorentzCovariant`.
- Prove that `A` is nonzero exactly when `p` and `q` are linearly independent and the form is
  non-degenerate; this is the condition under which `W₃` is determined by the tensor.
- Prove that `A` vanishes identically when `V` has dimension at most three. This is why the
  upstream `Witness` namespace, which lives on `ℝ × ℝ × ℝ`, can witness the parity-even theory
  but cannot witness `F₃`; a four-dimensional witness is constructed alongside.

### 0.4 Dimensionless structure functions

Definitions, following the upstream `structureF2` convention that the dimensionless function is
obtained by multiplying the coefficient by `p·q`:

- `F₁ := W₁`, `F₂ := (p·q) W₂ / 1`, `F₃ := (p·q) W₃`, in the normalisation in which `F₂`
  and `x F₃` have the same parton-model magnitude. The precise factors are fixed by requiring
  the Layer 2 parton-model expressions to come out as `F₂ = x Σ e_f²(f + f̄)` and
  `x F₃ = x Σ 2 e_f a_f (f - f̄)`, and the roadmap proves the relation between the two
  normalisations rather than asserting it.
- The record `StructureFunctions` bundling `F1 F2 F3 : ℝ → ℝ → ℝ`.
- The massless longitudinal function is upstream's `Longitudinal.FL`. The target-mass-exact
  function is `FLExact M x Q2 F1 F2 := (1 + 4 * M^2 * x^2 / Q2) * F2 - 2 * x * F1`.

Theorems:

- `FLExact` at `M = 0` is `Longitudinal.FL`.
- The exact longitudinal projection: the self-pairing of `pTransverse` equals
  `(p·q)² (1 + M² Q² / (p·q)²) / Q²`. This is a rearrangement of the upstream identity
  `Q2_mul_pTransverse_self`, whose statement is `Q² (p_T · p_T) = Q² M² + (p·q)²`, and combined
  with `two_xBj_mul_pq` it shows that the target-mass factor `1 + 4 M² x² / Q²` is exactly the
  factor by which the longitudinal direction is longer than its massless value. This is the
  reason `FLExact` and not `FL` is the combination that measures longitudinal absorption.
- `FLExact` equals the longitudinal absorption up to the positive factor above, strengthening
  upstream's `isCallanGross_iff_apply_pTransverse_eq_zero` to the massive case.

### Examples

- The upstream `Tensors.Basic.Witness` triple `(gWit, kWit, wWit)`: verify it satisfies the
  Layer 0 hypotheses for the parity-even decomposition and that its `F₃` is necessarily zero.
- A four-dimensional witness with a nonzero volume form, a kinematics with `p` and `q`
  independent, and a tensor with all three coefficients nonzero; verify covariance,
  conservation and that the three coefficients are recovered.
- A tensor that is covariant and conserved but not hermitian, to show the third hypothesis is
  not redundant.

### Dependencies

`Tensors.Basic` and `Tensors.Longitudinal` upstream; `Kinematics.Basic` and `.Bounds`;
`Relativity.Tensors.RealTensor.Metrics.LeviCivita`. Nothing from another roadmap.

---

## Layer 1: the inclusive cross section and positivity

References: Devenish & Cooper-Sarkar ch. 4; H1 and ZEUS combined measurement,
Eur. Phys. J. C75 (2015) 580, for the reduced cross section as it is actually used;
Yellow Report §7.1.1.

### 1.1 Contraction and the `y` structure

Targets:

- The contraction `L^{μν} W_{μν}` of the Layer 0 tensors, evaluated in the invariants. The
  symmetric-symmetric and antisymmetric-antisymmetric terms survive; the cross terms vanish.
  Prove the vanishing rather than dropping the terms.
- The doubly differential cross section in `(x, Q²)`:
  `d²σ/dx dQ² = (K(Q²) / (x Q²)) · [ Y₊ F₂ ∓ Y₋ x F₃ - y² F_L ]`
  where `Y₊ := 1 + (1-y)²`, `Y₋ := 1 - (1-y)²`, the sign of the `F₃` term is the lepton-beam
  charge, and `K` is the exchange-dependent flux factor. For pure photon exchange
  `K = 2π α² / Q²`, and for charged-current exchange
  `K = G_F² M_W⁴ / (2π (M_W² + Q²)²)`. The propagator content of `K` is
  `ElectroweakAndBSM`'s; what is proved here is that the bracket has exactly this form.
- `Y₊ = 2 · yFactor y`, where `yFactor` is upstream. This is upstream's `two_mul_yFactor` read
  in the other direction, and it is the bridge that makes the next item provable.
- Reduction: at `F₃ = 0` and `F_L = 0` and photon exchange, the formula equals upstream's
  `loNCdSigma`. This is the compatibility theorem that keeps the roadmap from forking the
  library.
- `Y₊ ≥ 2 Y₋ ≥ 0` on `0 ≤ y ≤ 1`, and `Y₊ ≥ 1`; these are the inequalities that make the `F₃`
  term a correction rather than a competitor at small `y`, and they follow from
  `yFactor_ge_half` and `yFactor_pos`.

### 1.2 The reduced cross section

Definition: `σ_r := F₂ ∓ (Y₋ / Y₊) x F₃ - (y² / Y₊) F_L`, so that
`d²σ/dx dQ² = (K / (x Q²)) Y₊ σ_r`. Targets:

- The definition is well posed on the physical region, because `Y₊ > 0` there.
- `σ_r = F₂` exactly when `Y₋ x F₃ + y² F_L = 0`; in particular at `y → 0`.
- The separation statement: at fixed `(x, Q²)`, `σ_r` is an affine function of `y²/Y₊` with
  slope `-F_L`, so measurements at three inelasticities determine `F₂`, `x F₃` and `F_L`. State
  this as a linear-algebra statement about the invertibility of a `3 × 3` matrix of `y`
  coefficients, with the non-degeneracy hypothesis that the three inelasticities are distinct.
  The corresponding statistical inverse problem is not this roadmap's; the algebraic
  invertibility is.

### 1.3 Positivity from the helicity matrix

The forward amplitude for a vector/axial current on an unpolarised target, in the helicity basis
`(+1, 0, -1)` of the current, is a `3 × 3` hermitian matrix whose diagonal entries are the
absorption cross sections for the three current polarisations. Definitions and targets:

- The record `HelicityMatrix` carrying `mat : Matrix (Fin 3) (Fin 3) ℝ` and a field
  `posSemidef : mat.PosSemidef`, following the idiom of `PDF.Positivity.SpinDensity`.
- The identification of the entries: the transverse diagonal entries are `F₁ ∓ F₃ / 2` and the
  longitudinal diagonal entry is `F_L / (2 x)` up to the positive kinematic factor of Layer 0.3.
- `F₁ ≥ 0`, from non-negativity of the sum of the two transverse diagonal entries.
- `F_L ≥ 0`, from non-negativity of the longitudinal diagonal entry, using the positivity of the
  kinematic factor established in Layer 0.4.
- `|F₃| ≤ 2 F₁`, from non-negativity of each transverse diagonal entry separately. This is the
  precise sense in which the parity-odd function cannot exceed the parity-even one; a bound
  stated as `|x F₃| ≤ F₂` is a parton-model corollary and is proved in Layer 2, not here.
- `2 x F₁ ≤ F₂ (1 + 4 M² x² / Q²)`, which is `F_L ≥ 0` rewritten, and the statement that this
  is strictly weaker than the Callan–Gross relation.
- The Cauchy–Schwarz bound on the off-diagonal entries, giving the bound on the interference
  structure function in terms of the diagonal ones; the identification of that entry with a
  physical observable is `ElectroweakAndBSM`'s.

### Examples

- Photon exchange: `F₃ = 0`, the helicity matrix is block-diagonal, and the bounds reduce to
  `F₁ ≥ 0` and `F_L ≥ 0`.
- A structure-function triple saturating `|F₃| = 2 F₁`, corresponding to absorption of only one
  transverse helicity; exhibit it and verify the matrix is positive semidefinite with a zero
  eigenvalue.
- The upstream `loNCdSigma_f2LO_nonneg` as a special case of 1.1 plus 1.3.

### Dependencies

Layer 0. Upstream `CrossSection`, `Mathematics.DataStructures.Matrix.PosSemidef`,
Mathlib's `Matrix.PosSemidef` and `Analysis.Matrix.Spectrum`. The flux factor `K` and the
generalised neutral-current coefficient combinations are taken from `ElectroweakAndBSM` as
opaque data.

---

## Layer 2: the quark-parton model, Callan–Gross, and flavour

References: Bjorken, Phys. Rev. 179 (1969) 1547; Feynman, *Photon-Hadron Interactions*;
Callan & Gross, Phys. Rev. Lett. 22 (1969) 156; Devenish & Cooper-Sarkar ch. 5;
Yellow Report §7.1.1.

### 2.1 The elastic partonic channel

Upstream provides `Tensors.Longitudinal.ElasticChannel`, a record of pure data: charges, the
invariant `p·q`, an elastic weight, and the coefficients of the transverse projector and of
`p_T ⊗ p_T` in the partonic tensor. It provides `hardF1`, `hardF2`, `longitudinalKernel` and the
theorem `loStructureFunction_longitudinalKernel` that `F_L` is itself leading-order factorised.
Targets:

- A parity-odd extension `ElasticChannelOdd` carrying in addition the axial coupling and the
  coefficient of the parity-odd form, with `hardF3` defined from it.
- The spin-half elastic channel: the specific inhabitant of `ElasticChannel` whose coefficients
  are those of a free spin-half parton of charge `e_f`, and of `ElasticChannelOdd` with the
  vector and axial couplings `v_f`, `a_f`.
- `IsOnShell` for that inhabitant: its weight is supported at `z = x`, in the division-free form
  upstream uses.

### 2.2 Structure functions as charge-weighted sums

Definitions, as `IsLOFactorized` instances built from the hard kernels of 2.1 and a
`Pdf Flavor` satisfying `PDF.Basic.Assumptions`:

- `F₂^{QPM} = x Σ_f e_f² (f + f̄)`, which must be proved equal to upstream's
  `CrossSection.f2LO`.
- `F₁^{QPM} = (1/2) Σ_f e_f² (f + f̄)`.
- `x F₃^{QPM} = x Σ_f 2 v_f a_f (f - f̄)` for neutral-current exchange, and the charged-current
  specialisation in 2.4.

Theorems:

- Non-negativity of `F₂^{QPM}` and `F₁^{QPM}` from `IsPartonDensity`, refining upstream's
  `f2LO_nonneg`.
- `|x F₃^{QPM}| ≤ F₂^{QPM}` when `|2 v_f a_f| ≤ e_f²` for every flavour; state the coupling
  hypothesis explicitly, since it is a fact about the electroweak couplings supplied by
  `ElectroweakAndBSM` and not a general truth.
- The quark and antiquark densities are separately recovered from `F₂ ± x F₃` in the
  single-flavour case; this is the statement that `F₃` separates quarks from antiquarks, and it
  is a linear-algebra statement with an explicit non-degeneracy hypothesis on the couplings.

### 2.3 Callan–Gross

Targets:

- `longitudinalKernel` of the spin-half elastic channel is identically zero. This is the content
  of the Callan–Gross relation: it is a statement about the partonic tensor coefficients, and
  once proved, upstream's `loStructureFunction_longitudinalKernel` gives `F_L^{QPM} = 0` for any
  density.
- Hence `IsCallanGross x F₁^{QPM} F₂^{QPM}`, and by upstream's `isCallanGross_iff`,
  `F₂^{QPM} = 2 x F₁^{QPM}`.
- By upstream's `isCallanGross_iff_apply_pTransverse_eq_zero`, the parton-model tensor has no
  longitudinal absorption.
- The converse direction, which is the physically informative one: a nonzero `F_L` is
  incompatible with the spin-half elastic channel alone. Stated as: if
  `F_L(x, Q²) ≠ 0` then the structure functions are not `IsLOFactorized` with the spin-half
  elastic kernel. `F_L` therefore measures the departure from the naive parton model; what
  supplies that departure at order `α_s` is `CollinearEvolution`'s coefficient function and is
  not proved here.
- A scalar-parton channel, as the contrasting inhabitant: its `hardF1` vanishes and `F_L` is
  maximal. Exhibiting it proves that Callan–Gross is a statement about spin and not a kinematic
  identity.

### 2.4 Isospin, the neutron, and charged currents

Definitions:

- The isospin involution `τ : Flavor → Flavor` exchanging up and down and fixing everything
  else, and the neutron density `f^n := f^p ∘ τ` on an isospin-symmetric target pair. That the
  proton and neutron densities are related this way is an assumption of exact isospin symmetry
  and is labelled as such; its violation is a measurable quantity and is not modelled here.
- Charged-current structure functions, for `W`-exchange on the proton. With `W⁻` absorbed on an
  up-type quark or a down-type antiquark, `F₂^{CC,e⁻p} = 2x(u + c + d̄ + s̄)` and
  `x F₃^{CC,e⁻p} = 2x(u + c - d̄ - s̄)`; with `W⁺`, `F₂^{CC,e⁺p} = 2x(d + s + ū + c̄)` and
  `x F₃^{CC,e⁺p} = 2x(d + s - ū - c̄)`. The neutrino and antineutrino combinations follow by the
  same rule and are needed in Layer 3.
- The Cabibbo mixing that distributes the down-type flavours is taken from
  `ElectroweakAndBSM`; the flavour-diagonal statement above is the `V_CKM = 1` specialisation,
  and the roadmap proves the general statement with mixing as a matrix parameter.

Theorems:

- `F₂^{ep} - F₂^{en} = (x/3)(u + ū - d - d̄)` for three flavours, which is the identity the
  Gottfried sum rule integrates.
- `F₂^{ep} / F₂^{en} → 4` as `x → 1` under the hypothesis that the down density is negligible
  relative to the up density at large `x`; state the hypothesis as a limit hypothesis, not as a
  fact. The value of that ratio at `x → 1` is an open question experimentally and the roadmap
  labels it as a conditional statement, not a milestone.
- Charged-current and neutral-current structure functions agree in the flavour-blind limit in
  which all couplings are equal, which is the consistency check that the two hard kernels were
  normalised the same way.

### Examples

- A single-flavour valence-only density `f(x) = 1` on `[0,1]`: compute `F₁`, `F₂`, `F₃`, verify
  Callan–Gross and `F_L = 0`, and evaluate the moments in closed form using
  `TauCeti.Analysis.SpecialFunctions.Beta`. This mirrors the `modelG1` idiom of the upstream
  polarised sum-rule file.
- `EpsilonEridani.Particles.Parton.PDF.Model` as a less trivial density: verify the same
  statements.
- A three-flavour proton with valence numbers `(2, 1, 0)` and a flavour-symmetric sea: compute
  the Gottfried integrand and verify it vanishes.

### Dependencies

Layers 0 and 1. Upstream `Factorization.DIS.LO`, `.HardKernel`,
`Factorization.Convolution.Collinear`, `Particles.Parton.PDF.Basic` and `.Positivity`. Couplings
and CKM mixing from `ElectroweakAndBSM`.

---

## Layer 3: sum rules as moment identities

References: Adler, Phys. Rev. 143 (1966) 1144; Gross & Llewellyn Smith,
Nucl. Phys. B14 (1969) 337; Gottfried, Phys. Rev. Lett. 18 (1967) 1174;
Larin & Vermaseren, Phys. Lett. B259 (1991) 345; New Muon Collaboration,
Phys. Rev. Lett. 66 (1991) 2712; CCFR, Phys. Rev. Lett. 81 (1998) 3595;
Yellow Report §7.1.1.

Each sum rule is a record in the shape of the upstream polarised sum-rule file: the convergence
hypotheses are fields, the identity is the content, and a model instance proves the record is
inhabited. No sum rule is stated without its integrability hypothesis, and no integrability
hypothesis is a blanket one.

### 3.1 The moment vocabulary

Definitions:

- `momentF (F : ℝ → ℝ → ℝ) (w : ℝ → ℝ) (Q2 : ℝ) := ∫ x in (0:ℝ)..1, w x * F x Q2`, the weighted
  moment, with `IntervalIntegrable` as an explicit hypothesis wherever it is used.
- The weights that occur: `w x = x^(n-2)` for the OPE moments of `F₂`, `w x = x^(n-1)` for
  those of `F₃`, and `w x = 1/x` for Adler and Gottfried.
- The relation to `PDF.Basic.mellinMoment`: for a parton-model structure function, `momentF`
  with weight `x^(n-2)` is a charge-weighted sum of `mellinMoment`s. Prove this, using
  `mellinMoment_integrable` to discharge the integrability side condition, so that every sum
  rule below has both a structure-function form and a density form and they are provably the
  same statement.

The `1/x` weight is the one that can fail to converge. State once, as a lemma with an explicit
small-`x` hypothesis, that `∫ x in (0:ℝ)..1, F x Q2 / x` converges when `F x Q2 = O(x^δ)` for
some `δ > 0` as `x → 0`, and note that for the isospin-nonsinglet differences appearing in Adler
and Gottfried this is a statement about the difference and not about either term. Whether it
holds is an open question about the small-`x` behaviour of the sea asymmetry; the roadmap states
the sum rules conditionally on it and does not claim it.

### 3.2 The Adler sum rule

Statement: for the neutrino and antineutrino charged-current structure functions on the proton,
`∫₀¹ (dx/x) (F₂^{ν̄p} - F₂^{νp}) = 4 I₃ = 2`, where `I₃` is the third component of the target
isospin. Targets:

- The parton-model proof, from the flavour combinations of Layer 2.4 and the valence sum rules:
  the integrand is `2(u - ū - d + d̄)` and the integral is `2(2) - 2(1) = 2`.
- The statement that the sum rule is exact: it follows from the isospin current algebra and
  receives no perturbative correction. The roadmap states this as a property of the sum rule
  under the Layer 4 hypothesis bundle, namely that the relevant operator is the isospin charge,
  whose matrix element is fixed by the normalisation of the target state and whose Wilson
  coefficient is unity to all orders. It does not claim a derivation of the current algebra.
- The convergence hypothesis is on the nonsinglet difference only, from 3.1.

### 3.3 The Gross–Llewellyn Smith sum rule

Statement: for the isoscalar average `F₃^{νN} := (F₃^{νp} + F₃^{νn})/2`,
`∫₀¹ dx F₃^{νN}(x, Q²) = 3 (1 - α_s(Q²)/π) + O(α_s²)`. Targets:

- The parton-model value `3`, as the sum of valence numbers, from Layer 2.4 and
  `valence_sumRule`.
- The first-order correction, with the coefficient `-α_s/π` obtained from the one-loop
  coefficient function of `EpsilonEridani.QFT.Factorization.DIS.DiagrammaticHardKernel` at
  `n = 1`; the roadmap states the coefficient and the normalisation convention it is taken in,
  and proves that the stated normalisation is the one in which the parton-model term is exactly
  `3`.
- The running coupling `α_s(Q²)` is `CollinearEvolution`'s object; this roadmap takes it as a
  function and proves nothing about it. Orders beyond the first are coefficient functions and
  belong to `CollinearEvolution`.
- The convergence hypothesis: the unweighted integral of `F₃`, which requires
  `F₃ = O(x^{δ-1})` with `δ > 0`. This is weaker than the Adler hypothesis and is stated
  separately.

### 3.4 The Gottfried sum rule

Statement: `∫₀¹ (dx/x) (F₂^{ep} - F₂^{en}) = 1/3 + (2/3) ∫₀¹ dx (ū - d̄)`. Targets:

- The identity above, exactly, from the Layer 2.4 difference formula and the valence sum rules.
  Note that this is the substantive statement: it is an identity, not an approximation.
- The corollary: the value is `1/3` exactly when the light sea is flavour-symmetric, meaning
  `∫₀¹ dx (ū - d̄) = 0`. The measured departure is therefore a measurement of that integral and
  not a failure of the parton model. Preserve this framing; the sum rule is not a prediction
  that can fail, it is a definition of the asymmetry in terms of measurables.
- Flavour symmetry of the light sea is not assumed anywhere in this roadmap. It appears only as
  the hypothesis of this corollary.
- The convergence hypothesis is on the nonsinglet difference, from 3.1.

### 3.5 Momentum and quark-number sum rules

Upstream carries `PDF.Basic.SumRuleAssumptions`, a `Type`-valued record, together with
`momentum_sumRule` and `valence_sumRule` as interface theorems conditioned on it. Those are
hypotheses about the density, not theorems about the nucleon, and the roadmap says so. Targets:

- The quark-number sum rules `∫₀¹ dx (q - q̄) = N_q` for each flavour, with `N_q` the target's
  valence content, restated from `valence_sumRule` and connected to the structure-function
  moments of 3.1.
- The momentum sum rule `Σ_i ∫₀¹ dx x f_i(x, Q²) = 1`, with the sum over quarks, antiquarks and
  the gluon, restated from `momentum_sumRule`, and the corresponding statement about the second
  moment of `F₂`: the second moment of `F₂` accounts for the quark momentum fraction only, and
  its deficit relative to `1` is the gluon momentum fraction. The gluon density's own moment is
  `CollinearEvolution`'s and the operator statement that the total is exactly `1` is the
  forward matrix element of the energy–momentum tensor, which is
  `HadronMassAndEnergyMomentumTensor`'s. This roadmap proves the arithmetic that connects them
  and takes the normalisation `⟨p| T^{μν} |p⟩ = 2 p^μ p^ν` from that roadmap.
- The `Q²` independence of the quark-number sum rules and the `Q²` independence of the momentum
  sum rule are statements about the anomalous dimensions vanishing at `n = 1` and `n = 2`
  respectively; they are `CollinearEvolution`'s theorems and are cited, not proved.

### Examples

- The indicator density `f(x) = x` on `[0,1]` normalised to valence numbers `(2, 1)`: evaluate
  every sum rule of this layer in closed form with the beta integrals, and verify each record is
  inhabited. This is the analogue of the upstream `modelStructureFunctions` witness.
- A density with a `1/x` small-`x` rise in each of `ū` and `d̄` but a symmetric difference:
  verify that Adler and Gottfried converge although neither individual moment does. This is the
  example that shows why the convergence hypotheses are stated on differences.
- A density with an asymmetric sea: compute the Gottfried value and verify it differs from
  `1/3` by exactly `(2/3)` times the asymmetry integral.

### Dependencies

Layers 1 and 2. Upstream `PDF.Basic` sum-rule interfaces,
`TauCeti.Probability.Moments.Basic`, `TauCeti.Analysis.SpecialFunctions.Beta`, Mathlib's
interval integral. `α_s` and the anomalous-dimension statements from `CollinearEvolution`; the
energy–momentum normalisation from `HadronMassAndEnergyMomentumTensor`.

---

## Layer 4: the operator product expansion in moment space

References: Wilson, Phys. Rev. 179 (1969) 1499; Christ, Hasslacher & Mueller,
Phys. Rev. D6 (1972) 3543; Gross & Wilczek, Phys. Rev. D8 (1973) 3633; Jaffe & Soldate,
Phys. Rev. D26 (1982) 49; Devenish & Cooper-Sarkar ch. 7; Yellow Report §7.1.1.

This layer's content is what follows from the operator product expansion, stated as an explicit
hypothesis. It does not derive the expansion. That is the roadmap's principal gap, named in the
upstream-material section, and it is a gap because there is no renormalised local-operator
formalism in `EpsilonEridani` to derive it from.

### 4.1 The forward Compton amplitude and its dispersion relation

Definitions and targets:

- The forward Compton amplitude `T(ν, Q²)` for fixed `Q²` as a function of `ν = p·q`, with its
  analyticity domain as a hypothesis.
- The dispersion relation expressing `T` as a Cauchy principal-value integral of the absorptive
  part, which is the structure function, using `TauCeti.Analysis.Contour.PerWindow.CPV`.
- The moment expansion: the Taylor coefficients of `T` in `1/x` at fixed `Q²` are the moments of
  the structure function. This is the statement that connects an amplitude, which the expansion
  is about, to a structure function, which is measured; it needs the analyticity hypothesis and
  a uniform bound to interchange the sum and the integral, and both are stated.
- Uniqueness of the spectral representation, from
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Uniqueness`.

The unsubtracted dispersion relation requires the amplitude to fall off at large `ν`; whether it
does is the Regge behaviour of the amplitude, which is an open question and not a milestone. The
roadmap states the dispersion relation with a subtraction constant and proves that the
subtraction drops out of every moment with `n ≥ 2`.

### 4.2 The expansion as a hypothesis bundle

The record `OPEData` carries, as data: for each moment index `n` and twist `τ`, a Wilson
coefficient `C : ℕ → ℕ → ℝ → ℝ` depending on `n`, `τ` and `Q²/μ²`, and a reduced matrix element
`A : ℕ → ℕ → ℝ` depending on `n`, `τ` and the renormalisation scale. Its content is the
factorised moment identity

`M_n(Q²) = Σ_τ C(n, τ, Q²/μ²) · A(n, τ, μ²) / Q^(τ-2)`

together with the statement that the sum over `τ` converges for `Q²` above a threshold. Targets:

- The record, and the theorem that it determines `M_n(Q²)` uniquely given the data.
- Twist-two truncation: the definition of the leading-twist moment as the `τ = 2` term, and the
  theorem that the remainder is `O(1/Q²)` under the convergence hypothesis. This is what
  "leading twist" means and it is the only place the roadmap defines it.
- The scale-independence theorem: the product `C · A` is independent of `μ`, which is the
  statement that makes the factorisation meaningful. State it as a hypothesis on `OPEData`, not
  as a theorem, because it is equivalent to the renormalisation-group equation for the operator
  and that equation is `CollinearEvolution`'s.
- Injectivity: distinct twist-two matrix element sequences give distinct moment sequences, under
  a determinacy hypothesis taken from `TauCeti.Probability.Moments.Determinacy`. The converse,
  reconstructing the matrix elements from finitely many measured moments, is not claimed; the
  existence half of the moment problem is absent upstream.

### 4.3 The twist-two content of `F₂` and `F₃`

Targets:

- For `F₂`, the leading-twist moment `M_n^{(2)}(Q²) = ∫₀¹ dx x^(n-2) F₂(x, Q²)` factorises as
  `C_n^{(2)} · A_n^{(2)}` where `A_n^{(2)}` is the reduced matrix element of the symmetric
  traceless twist-two quark and gluon operators of spin `n`. The operators themselves are named
  and their index structure specified; their construction as renormalised composite operators is
  the gap.
- For `F₃`, the same with `M_n^{(3)} = ∫₀¹ dx x^(n-1) F₃(x, Q²)` and the parity-odd twist-two
  operators.
- The parton-model identification: at leading twist and leading order, `A_n^{(2)}` is the `n`-th
  `mellinMoment` of the charge-weighted quark density, and `C_n^{(2)} = 1`. Prove this by
  combining 4.2 with Layer 2 and `mellinMoment_convolveAt` from
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin`. This theorem is what ties the
  hypothesis bundle to something measured.
- The quark-number and momentum sum rules of Layer 3.5 re-derived as the `n = 1` nonsinglet and
  `n = 2` singlet matrix elements, conditional on the normalisation of the target state. This is
  the sense in which those sum rules are consequences rather than assumptions, and the roadmap
  states exactly which additional input — the normalisation — makes them so.

### 4.4 Higher twist

Definitions and targets:

- The twist-four contributions to `F₂` and `F_L`, as the `τ = 4` terms of `OPEData`, and the
  theorem that they scale as `1/Q²` relative to twist two.
- The statement that `F_L` receives a twist-four contribution which is not suppressed relative
  to its own leading-twist term at the `α_s` order where that term first appears; this is why
  `F_L` is the most higher-twist-sensitive of the three functions, and it is stated as a
  comparison of powers, with the `α_s` order taken from `CollinearEvolution`.
- Inhabitants of upstream's `Corrections.Basic.HigherTwistCorrection` built from `OPEData`, and
  the theorem that `correctedObservable` with those inhabitants reproduces the truncated
  expansion. This is what fills in the upstream type abbreviation.
- The bound `BoundedCorrections` of `Corrections.Basic` instantiated: above a stated `Q²`
  threshold and given the convergence hypothesis of 4.2, the higher-twist remainder is bounded,
  and `correctedObservable_sub_baseline_abs_le` then bounds the difference between the measured
  and the leading-twist structure function.

The correlator content of the twist-four matrix elements — which multi-parton correlation
functions they are — is `MultiPartonCorrelations`. Their lattice determination is
`LatticeBridge`. This roadmap defines them and states their scaling.

### Examples

- An `OPEData` with only `τ = 2` nonzero and `C = 1`: verify that its moments are exactly the
  parton-model moments of Layer 2, and that the sum rules of Layer 3 come out.
- An `OPEData` with a `τ = 4` term of known sign: verify the `1/Q²` scaling and the
  `BoundedCorrections` instance.
- The subtraction-constant example: an amplitude with a nonzero subtraction, verifying that
  moments with `n ≥ 2` are unaffected and the `n = 1` moment is.

### Dependencies

Layers 1 through 3. Upstream `Factorization.Convolution.Mellin`,
`Factorization.Evolution.MomentSpace`, `Corrections.Basic`. TauCeti's contour and Stieltjes
material, and `Probability.Moments.Determinacy`. The `μ` dependence of `C` and `A` from
`CollinearEvolution`; the twist-four correlators from `MultiPartonCorrelations`.

---

## Layer 5: target-mass corrections and the Nachtmann variable

References: Nachtmann, Nucl. Phys. B63 (1973) 237; Georgi & Politzer,
Phys. Rev. D14 (1976) 1829; De Rújula, Georgi & Politzer, Ann. Phys. 103 (1977) 315;
Osipenko et al., Phys. Rev. D67 (2003) 092001; Schienbein et al., J. Phys. G35 (2008) 053101;
Yellow Report §7.1.1.

Target-mass corrections are the `1/Q²` effects that are *not* higher twist: they are kinematic,
calculable, and entirely fixed by the nucleon mass. Separating them from the dynamical
higher-twist terms of Layer 4 is the whole point of this layer, and it is why the Nachtmann
variable exists.

### 5.1 The Nachtmann variable

Definitions:

- `rho M x Q2 := Real.sqrt (1 + 4 * M^2 * x^2 / Q2)`, the radical that already appeared in
  Layer 0.4 as the ratio of the true to the massless longitudinal length.
- `xi M x Q2 := 2 * x / (1 + rho M x Q2)`, the Nachtmann variable.

Theorems, all with `0 < Q2`, `0 ≤ x` and `0 ≤ M` as explicit hypotheses:

- `rho ≥ 1`, with equality exactly when `M * x = 0`.
- `xi ≤ x`, and `xi = x` exactly when `M * x = 0`. In particular `xi M 0 Q2 = 0`.
- `xi` is strictly monotone increasing in `x` on the physical region, hence injective, hence
  invertible: `x = xi / (1 - M² xi² / Q²)`. Prove the inversion formula, since every
  target-mass formula uses it.
- `xi M x Q2 → x` as `M → 0` at fixed `x`, `Q2`, and as `Q2 → ∞` at fixed `x`, `M`. Both limits,
  separately, because the two are used in different places.
- `xi M 1 Q2 = 2 / (1 + Real.sqrt (1 + 4 * M^2 / Q2)) < 1`. This is the elastic threshold in
  `ξ`, and the fact that it is strictly less than one is the source of the open question in 5.4.
- `xi` is the light-cone fraction: `ξ` is the positive root of
  `ξ² M² / Q² - ξ / x + 1 = 0` scaled appropriately, which is the statement that `ξ` and not
  `x` is the fraction of the target's light-cone momentum carried by the struck parton. Prove
  the algebraic identity `M² ξ² / Q² - ξ/x + 1 = 0` and state that this, and not the formula, is
  the definition's meaning.

### 5.2 The Georgi–Politzer target-mass-corrected structure functions

Given a leading-twist structure function `F₂^{(0)}` as a function of one variable, the
target-mass-corrected function is

`F₂(x, Q²) = (x² / (ρ³ ξ²)) F₂^{(0)}(ξ) + (6 M² x³ / (Q² ρ⁴)) ∫_ξ^1 (du/u²) F₂^{(0)}(u)`
`           + (12 M⁴ x⁴ / (Q⁴ ρ⁵)) ∫_ξ^1 du ∫_u^1 (dv/v²) F₂^{(0)}(v)`

and analogously for `F₁` and `F₃`, whose kernels are those of De Rújula, Georgi & Politzer,
Ann. Phys. 103 (1977) 315, eqs. (A.1)–(A.3). The roadmap fixes the `F₁` and `F₃` kernels by
citation to that reference rather than restating them; a contributor is to transcribe them from
there, and the acceptance test below pins the transcription. Targets:

- The definition above, as a `Corrections.Basic.TargetMassCorrection` inhabitant, with
  integrability of `F₂^{(0)}` on `[ξ, 1]` as an explicit hypothesis.
- The massless limit: at `M = 0` the first term is `F₂^{(0)}(x)` and the other two vanish.
  This is the theorem that the whole construction reduces to the uncorrected one, and it is what
  `correctedObservable_eq_baseline_of_zero` upstream is waiting for.
- The `1/Q²` counting: each successive term carries an extra `M²/Q²`, so truncating after the
  first term is an error of order `M² x² / Q²`, with an explicit bound under a bound on
  `F₂^{(0)}`.
- The corrections preserve positivity of `F₂` when `F₂^{(0)}` is non-negative, since every
  coefficient in the formula is non-negative on the physical region. This connects to Layer 1.3
  and is a nontrivial consistency check of the transcription.

### 5.3 Nachtmann moments

Definitions:

- The `F₂` Nachtmann moment
  `M_n^{ξ,(2)}(Q²) := ∫₀¹ dx (ξ^(n+1) / x³) · ((3 + 3(n+1) r + n(n+2) r²) / ((n+2)(n+3))) F₂(x, Q²)`
  with `r := rho M x Q2`, and the analogous `F₁` and `F₃` moments with the kernels of De Rújula,
  Georgi & Politzer.
- The defining property, which is what the kernels are *for*: the Nachtmann moment of the
  target-mass-corrected structure function of 5.2 equals the Bjorken moment of the underlying
  leading-twist function. In symbols, `M_n^{ξ,(2)}` computed from `F₂` equals
  `∫₀¹ du u^(n-2) F₂^{(0)}(u)`.

Targets:

- The defining property above, as the central theorem of this layer. It requires the inversion
  formula of 5.1 and a change of variables in the nested integrals of 5.2, and it is the
  statement that the Nachtmann kernels are correct. This theorem is also the acceptance test on
  the transcribed `F₁` and `F₃` kernels: a transcription error makes it false.
- Consequently, and combining with Layer 4: the Nachtmann moments of the measured structure
  functions obey the `OPEData` factorisation with no target-mass terms, so their `Q²` dependence
  is that of the twist-two Wilson coefficient alone. This is the form in which the expansion is
  actually used, and it is the reason the layer exists.
- The massless limit: `M_n^{ξ,(2)}` reduces to the Bjorken moment `M_n^{(2)}` of Layer 4.3 at
  `M = 0`, with the kernel reducing to `x^(n-2)`. Prove the kernel limit explicitly; it is the
  cheapest check that the kernel was transcribed correctly.
- The difference `M_n^{ξ,(2)} - M_n^{(2)}` is `O(M²/Q²)` with an explicit coefficient, so that
  the practical question of when target-mass corrections matter has a proved answer.

### 5.4 The threshold question

The Georgi–Politzer formula of 5.2 gives a nonzero `F₂(x, Q²)` for `x` above the point at which
`ξ(x) = ξ(1)`, that is, in a region beyond the elastic threshold where the structure function
must vanish. This is a known defect of the operator-product-expansion treatment of target-mass
corrections and not an artefact of the formalisation. The roadmap states it as an open question:

- The target-mass-corrected `F₂` of 5.2 does not vanish at `x = 1` for `M > 0`, and the
  roadmap proves that it does not, so that the defect is recorded in the library rather than
  hidden.
- No resolution is scheduled. The proposals in the literature — truncating the twist expansion
  at finite order, or replacing the moment-space construction by a light-cone one — change the
  content of the correction rather than deriving it, and none is adopted here.
- Consequently every statement in 5.3 carries the hypothesis `x` bounded away from `1`, or
  equivalently a hypothesis that the integrals are dominated by the region below threshold.
  State the hypothesis; do not let the threshold defect propagate silently into the moment
  identities.

### Examples

- `F₂^{(0)}(u) = u (1 - u)`: compute the target-mass-corrected `F₂` in closed form, compute its
  Nachtmann moments, and verify they equal the Bjorken moments of `F₂^{(0)}`, which are beta
  integrals.
- `M = 0`: verify every object of this layer reduces to its Layer 4 counterpart.
- A numerically large target-mass regime, `Q² = M²`: verify `ξ(1) < 1` explicitly and exhibit
  the threshold violation of 5.4 as a concrete inequality.

### Dependencies

Layers 0 and 4. Upstream `Corrections.Basic`, whose type abbreviations this layer inhabits.
Mathlib's `Real.sqrt` and interval integral; `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` for the
`Q²` derivatives. Nothing from another roadmap.

---

## Dependency graph

```
                Kinematics.Basic/.Bounds        Tensors.Basic/.Longitudinal
                          |                                |
                          +----------------+---------------+
                                           |
                                    Layer 0  tensor decomposition, F1 F2 F3 FL
                                           |
                    +----------------------+----------------------+
                    |                                             |
              Layer 1  cross section, positivity            (ElectroweakAndBSM
                    |                                        supplies couplings)
                    |
              Layer 2  quark-parton model, Callan-Gross, flavour
                    |
              Layer 3  sum rules            <--- HadronMassAndEnergyMomentumTensor
                    |                            (momentum sum rule normalisation)
                    |                       <--- CollinearEvolution (alpha_s)
                    |
              Layer 4  OPE in moment space  <--- MultiPartonCorrelations (twist-4 content)
                    |                       <--- LatticeBridge (matrix elements)
                    |
              Layer 5  target-mass corrections, Nachtmann moments
```

Layers 0 through 3 are self-contained given the upstream material and the couplings taken from
`ElectroweakAndBSM`. Layer 4 is the only layer resting on a hypothesis bundle the roadmap does
not derive. Layer 5 rests on Layer 4 and on Layer 0.4, and on nothing else.

## Acceptance examples

The roadmap is complete when the following are proved, each stated with its hypotheses and none
of them `sorry`.

1. An arbitrary Lorentz-covariant, conserved, hermitian `Bilin V` on a four-dimensional `V` with
   `p` and `q` independent is uniquely `W₁ · (transverse projector) + W₂ · (p_T ⊗ p_T) + W₃ · A`,
   and the parity-even part of that statement is upstream's `exists_isF1F2Decomposition` and
   `decomposition_unique`.
2. `Y₊ y = 2 * EpsilonEridani.QFT.Scattering.DIS.yFactor y` for every real `y`.
3. The Layer 1.1 cross section, specialised to `F₃ = 0`, `F_L = 0` and photon exchange, equals
   `EpsilonEridani.QFT.Scattering.DIS.loNCdSigma`.
4. `F₁ ≥ 0`, `F_L ≥ 0` and `|F₃| ≤ 2 F₁` from a `Matrix.PosSemidef` helicity matrix, with no
   additional positivity hypothesis.
5. The spin-half elastic channel satisfies `Tensors.Longitudinal.IsCallanGross`, and therefore
   so does its leading-order structure-function pair for every density satisfying
   `PDF.Basic.Assumptions`.
6. A scalar-parton channel with `F_L ≠ 0`, exhibited, proving that 5 is a statement about spin.
7. `F₂^{QPM}` built from the Layer 2 kernels equals
   `EpsilonEridani.QFT.Scattering.DIS.f2LO`.
8. The Adler sum rule for the three-flavour proton with valence content `(2, 1, 0)` and an
   arbitrary symmetric-difference sea satisfying the 3.1 convergence hypothesis, evaluating
   to `2`.
9. The Gottfried identity, exactly, with its sea-asymmetry term; and the corollary `1/3` under
   flavour symmetry of the light sea.
10. The Gross–Llewellyn Smith sum rule at parton-model level evaluating to `3`, and the
    first-order corrected form, with the coefficient traced to the one-loop hard kernel.
11. For an `OPEData` with only twist two and unit Wilson coefficients, the `n`-th moment of
    `F₂` equals the charge-weighted `n`-th `PDF.Basic.mellinMoment` of the density.
12. `xi 0 x Q2 = x`, `xi M x Q2 ≤ x`, the inversion formula, and `xi M 1 Q2 < 1` for `M > 0`.
13. The Nachtmann `F₂` moment of the Georgi–Politzer target-mass-corrected `F₂` built from
    `F₂^{(0)}(u) = u (1 - u)` equals `∫₀¹ du u^(n-2) F₂^{(0)}(u)`, for every `n ≥ 2`.
14. A `Corrections.Basic.BoundedCorrections` instance for the twist-four remainder above a
    stated `Q²` threshold, and the resulting bound on the difference between the measured and
    the leading-twist `F₂` via `correctedObservable_sub_baseline_abs_le`.
15. The threshold violation of 5.4, proved as an inequality rather than remarked on.

## References

- A. Accardi et al. (EIC Yellow Report), *Electron-Ion Collider: The Next QCD Frontier*,
  arXiv:2103.05419, Volume II, Chapter 7, §7.1.1 — the subsection this roadmap covers.
- J. D. Bjorken, *Asymptotic sum rules at infinite momentum*, Phys. Rev. 179 (1969) 1547 —
  scaling and the sum rules of Layer 3.
- C. G. Callan and D. J. Gross, *High-energy electroproduction and the constitution of the
  electric current*, Phys. Rev. Lett. 22 (1969) 156 — Layer 2.3.
- S. L. Adler, *Sum rules for the axial-vector coupling-constant renormalization in beta
  decay*, Phys. Rev. 143 (1966) 1144 — Layer 3.2.
- D. J. Gross and C. H. Llewellyn Smith, *High-energy neutrino-nucleon scattering, current
  algebra and partons*, Nucl. Phys. B14 (1969) 337 — Layer 3.3.
- K. Gottfried, *Sum rule for high-energy electron-proton scattering*,
  Phys. Rev. Lett. 18 (1967) 1174 — Layer 3.4.
- S. A. Larin and J. A. M. Vermaseren, *The αs³ corrections to the Bjorken sum rule for
  polarized electroproduction and to the Gross-Llewellyn Smith sum rule*,
  Phys. Lett. B259 (1991) 345 — the higher orders this roadmap does not state.
- K. G. Wilson, *Non-Lagrangian models of current algebra*, Phys. Rev. 179 (1969) 1499 — the
  expansion of Layer 4.
- N. Christ, B. Hasslacher and A. H. Mueller, *Light-cone behavior of perturbation theory*,
  Phys. Rev. D6 (1972) 3543 — the operator product expansion applied to deep inelastic
  scattering.
- D. J. Gross and F. Wilczek, *Asymptotically free gauge theories II*,
  Phys. Rev. D8 (1973) 3633 — the twist-two operator basis of Layer 4.3.
- R. L. Jaffe and M. Soldate, *Twist-four in the QCD analysis of leptoproduction*,
  Phys. Rev. D26 (1982) 49 — the twist-four objects of Layer 4.4.
- O. Nachtmann, *Positivity constraints for anomalous dimensions*,
  Nucl. Phys. B63 (1973) 237 — the variable `ξ` of Layer 5.1.
- H. Georgi and H. D. Politzer, *Freedom at moderate energies: masses in colour dynamics*,
  Phys. Rev. D14 (1976) 1829 — the target-mass-corrected structure functions of Layer 5.2.
- A. De Rújula, H. Georgi and H. D. Politzer, *Demythification of electroproduction, local
  duality and precocious scaling*, Ann. Phys. 103 (1977) 315, eqs. (A.1)–(A.3) — the `F₁` and
  `F₃` target-mass kernels this roadmap fixes by citation.
- M. Osipenko et al., *A kinematically complete measurement of the proton structure function
  F₂ in the resonance region and evaluation of its moments*, Phys. Rev. D67 (2003) 092001 —
  the Nachtmann moments of Layer 5.3 as they are used in practice.
- I. Schienbein et al., *A review of target mass corrections*, J. Phys. G35 (2008) 053101 — the
  threshold question of Layer 5.4.
- R. Devenish and A. Cooper-Sarkar, *Deep Inelastic Scattering*, Oxford University Press,
  2004 — the standard reference for Layers 0 through 2 and for the reduced cross section.
- R. G. Roberts, *The Structure of the Proton*, Cambridge University Press, 1990 — the moment
  and operator-product material of Layer 4.
- H1 and ZEUS Collaborations, *Combination of measurements of inclusive deep inelastic e±p
  scattering cross sections and QCD analysis of HERA data*,
  Eur. Phys. J. C75 (2015) 580 — the reduced cross section of Layer 1.2 and the `F_L`
  separation.
- New Muon Collaboration (P. Amaudruz et al.), *Gottfried sum from the ratio F₂ⁿ/F₂ᵖ*,
  Phys. Rev. Lett. 66 (1991) 2712 — the measured Gottfried value of Layer 3.4.
- CCFR Collaboration (J. H. Kim et al.), *A measurement of αs(Q²) from the Gross-Llewellyn
  Smith sum rule*, Phys. Rev. Lett. 81 (1998) 3595 — the measured Gross-Llewellyn Smith value.

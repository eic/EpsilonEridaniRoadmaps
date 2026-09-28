# Roadmap: nuclear parton distributions

The parton structure of a nucleus, and how it differs from the sum of its nucleons. The content is
a set of distributions with a mass-number dependence, the sum rules that constrain them, and the
precise statement of each named modification — shadowing, antishadowing, the European Muon
Collaboration effect, and Fermi motion — as a property of a ratio rather than as a mechanism.

The discipline the roadmap imposes is that separation. "Shadowing" in the literature names both an
observed suppression of the nuclear structure function at small momentum fraction and a family of
explanations for it: destructive interference of multiple scatterings, parton recombination,
saturation of the gluon field. Only the first of those is a statement about a distribution, and only
the first is formalised here as a definition. The explanations enter as theorems with hypotheses —
each one says that under stated conditions some other object reproduces the suppression — and a
theorem that fails to discharge its hypotheses is a named gap rather than a weakened definition.
The same treatment applies to antishadowing, to the European Muon Collaboration effect and to the
rise near the kinematic limit.

The final application is a determination problem. Nuclear densities are not measured; they are
inferred from ratios of cross sections on nuclear and light targets across a range of momentum
fractions and hard scales, under the assumption that the evolution kernels are the same as in the
free case and that the mass-number dependence is smooth. Each of those assumptions is a theorem or
a hypothesis in this roadmap, and the identifiability statements in Layer 5 say which combinations
of nuclear densities inclusive data can determine at all. The Electron-Ion Collider case for
nuclear beams rests on exactly those statements, so the roadmap is finished when they are proved
with their hypotheses visible rather than absorbed into a fit.

Mechanisms that operate on a parton after it is struck are `NuclearMedium`. Light nuclei, where
individual nucleon configurations matter, are `LightNuclei`. Coherent scattering off the whole
nucleus is `Photoproduction` and `Diffraction`.

## Scope

Included:

- Nuclear parton densities per nucleon and per nucleus, with the normalisation convention fixed and
  the rescaling between the two conventions proved rather than asserted.
- Coordinate-space nuclear densities: the two-parameter Fermi (Woods-Saxon) profile, the
  hard-sphere and Gaussian profiles as comparison cases, the normalisation to mass number, the
  nuclear thickness function, and the mass-number scaling of the central thickness. Neighbouring
  roadmaps that need a nuclear geometry take it from here.
- The nuclear modification ratio as a defined object, the measured structure-function ratio as a
  separate defined object, and the relation between the two with its leading-order form and the
  corrections beyond it named.
- The isospin decomposition of nuclear densities into proton and neutron content, the definition of
  an isoscalar nucleus, and the isoscalar-corrected ratio as a third distinct object.
- Number, baryon-number and momentum sum rules for a nucleus, and the theorems that force the
  modification ratio to cross unity.
- Shadowing, antishadowing, the European Muon Collaboration effect and the rise near the kinematic
  limit, each defined as a statement about the ratio on a stated momentum-fraction interval whose
  endpoints depend on mass number and hard scale.
- The kinematic support of the nuclear structure function, including the theorem that it extends to
  momentum fraction equal to the mass number.
- The nucleon-convolution representation, stated as a hypothesis, and the theorems that follow from
  it: sum-rule preservation, and the rise of the ratio near the kinematic limit.
- Spin-dependent nuclear densities with their normalisation, the polarised modification ratio, the
  effective-polarisation convolution, and the positivity bound relating polarised to unpolarised
  nuclear densities.
- Collinear evolution of nuclear densities with target-independent kernels, the theorem that the
  nuclear-minus-free difference obeys the same linear equation, and the resulting scale dependence
  of the modification ratio.
- Positivity constraints on nuclear densities and on the ratio, and the statement of which implies
  which.
- The determination problem: the mass-number parameterisation, the forward map from densities to
  inclusive observables, and identifiability statements about that map's kernel.
- The Gribov relation between the leading shadowing correction and diffraction off a nucleon, with
  its hypotheses named and the higher-rescattering series identified as an open problem.
- The matching between the shadowing region and the dipole description, and the mass-number
  dependence of the saturation scale expressed in this roadmap's variables.

Not included. The splitting kernels, the moment machinery, the running coupling and the solution
theory of the evolution equation are `CollinearEvolution`; this roadmap uses them and proves only
that they do not depend on the target. The free-nucleon densities that sit in every denominator,
and their own determination, are `InclusiveStructureFunctions`; the polarised free-nucleon
densities and the nucleon spin sum rules are `SpinStructure`. Dipole amplitudes, the saturation
scale's definition, and non-linear rapidity evolution are `SmallXAndSaturation`; this roadmap
imports the definition of the saturation scale and states only its mass-number scaling in
per-nucleon variables. Diffractive structure functions themselves, their factorisation and their
determination are `Diffraction`; the Gribov relation consumes them. Few-nucleon wavefunctions,
short-range correlations, and the configuration-level structure of the lightest nuclei are
`LightNuclei`, which also owns the nuclear spin wavefunctions that fix the effective polarisations
this roadmap's polarised convolution takes as input. Energy loss, transport coefficients, hadron
formation inside nuclei and any modification acting on the struck parton after the hard scattering
are `NuclearMedium`; the European Muon Collaboration effect is defined here but the medium-modified
nucleon offered as one explanation of it is built there. Coherent and incoherent photoproduction
cross sections on nuclei are `Photoproduction`. Nuclear generalised and transverse-momentum
distributions are `GeneralizedPartonDistributions` and `TransverseMomentumDistributions`; only the
collinear nuclear densities are here. Nuclear corrections to the leptonic radiative tail and to the
photon flux are `RadiativeCorrections`. Jet and heavy-quark observables in nuclear collisions are
`JetsAndEventShapes`; hadronic-collision data enter this roadmap only as external constraints in
the determination problem of Layer 5, and no hadronic cross section is constructed here.

Also excluded: any numerical fit. This roadmap builds the objects a determination acts on and the
theorems that constrain it, not a parameterisation with fitted numbers. Where a numerical value
appears below it is a reference point from the literature identifying which region is being
discussed, never a result of this roadmap.

The material belongs under `EpsilonEridani/Particles/Parton/PDF/Nuclear/`, with the coordinate-space
nuclear density profiles of Layer 0 under `EpsilonEridani/Particles/Nuclei/Density/` because
`Photoproduction`, `SmallXAndSaturation` and `LightNuclei` all consume them.

## Conventions and coordination with upstream

1. **A nucleus is explicit data, never a typeclass.** A nucleus is a mass number `A` with a proton
   number `Z ≤ A` and `0 < A`; the neutron number is derived. Every definition and every theorem
   takes that datum as a parameter. The trap is a development that proves things about lead and
   then discovers that the mass-number dependence, which is the entire physics content, was never a
   variable.

2. **Densities are per nucleon and the momentum fraction runs to `A`.** The default object is the
   density per nucleon, defined with the per-nucleon momentum `p_N = P_A / A`, so that the momentum
   fraction `x = Q² / (2 p_N · q)` has support on `(0, A]` and the free-nucleon limit of the ratio
   is the constant function one. The per-nucleus density is `A` times it, with momentum fraction
   `x_A = x / A` on `(0, 1]`. Both conventions are defined; the rescaling between them is a proved
   lemma, not a remark. The trap is the factor of `A` and the factor of `A` in the argument being
   applied inconsistently, which changes a sum rule's right-hand side without changing its
   appearance.

3. **Every ratio names its denominator, and the denominator is a free nucleon of stated isospin
   content.** `R_i^A` is the per-nucleon nuclear density over the free-nucleon density of the same
   flavour at the same momentum fraction and the same hard scale. Which free nucleon — proton,
   neutron, or the isoscalar average — is part of the name. The trap is comparing a ratio defined
   against an isoscalar average with one defined against a proton and reading the difference as
   nuclear physics.

4. **The modification ratio and the structure-function ratio are different objects.** `R_i^A` is a
   ratio of densities; `R_{F_2}^A` is a ratio of structure functions. They coincide only at leading
   order in the strong coupling and with no isospin correction; beyond that the relation is a
   theorem with a stated remainder. The trap is quoting a measured structure-function ratio as a
   density ratio and then evolving it with the density evolution equation.

5. **A named region is a property of the ratio on an interval, never a mechanism.** "Shadowing"
   means `R < 1` on a stated interval. "Antishadowing" means `R > 1` on a stated interval. Neither
   word carries an explanation. An explanation appears only as a separate theorem whose conclusion
   is such an inequality and whose hypotheses are listed. The trap is a definition that builds in
   multiple scattering and thereby makes the multiple-scattering explanation unfalsifiable.

6. **Every interval endpoint is a function of mass number and hard scale.** `x₁(A, Q²)`,
   `x₂(A, Q²)`, and so on are explicit arguments of the region definitions. A region boundary
   quoted as a number is a reference point from the literature, identified as such. The trap is a
   theorem that holds "for small `x`" with no statement of how small, which cannot be composed with
   anything.

7. **Scale arguments are arguments, not definitions.** The coherence condition that motivates the
   shadowing boundary — that the interaction length exceeds the nuclear radius — is recorded as a
   scale estimate with its own name and is never used as the definition of the region. The trap is
   a chain of reasoning in which an order-of-magnitude comparison silently becomes a hypothesis of
   a theorem.

8. **The convolution representation is a hypothesis with a name.** The representation of a nuclear
   density as a nucleon light-cone momentum distribution convolved with a free-nucleon density is
   not derived from the field theory; it is an assumption. It is stated as a named predicate on a
   nuclear density, results are proved *under* it, and its status is stated wherever it is used.
   The trap is presenting the Fermi-motion rise as a derivation when what has been derived is a
   consequence of an unproved representation.

9. **Sign and normalisation of spin-dependent densities.** Spin-dependent nuclear densities are
   defined as the difference of densities with parton helicity aligned and anti-aligned with the
   *nuclear* spin, per nucleon, with the nuclear spin quantisation axis stated. The positivity
   bound is `|Δf_i^A| ≤ f_i^A` pointwise. The trap is a sign convention referred to the nucleon
   spin in a nucleus whose spin is not the sum of its nucleons' spins.

10. **Coordinate-space nuclear densities normalise to mass number, not to one.** `∫ ρ_A d³r = A`,
    and the thickness function is `T_A(b) = ∫ dz ρ_A(b, z)` with `∫ T_A(b) d²b = A`. The trap is a
    probability-normalised profile entering a double-scattering formula that expects a number
    density, which moves the mass-number dependence of the result by one power of `A`.

11. **Frames.** Momentum fractions and densities are defined in the target rest frame with the
    light-cone direction fixed by the virtual photon, the same choice `InclusiveStructureFunctions`
    makes; the coherence and rescattering arguments of Layers 2 and 6 are stated in that frame and
    any statement made in another frame says so. The trap is a coherence-length argument that is
    frame-dependent being combined with a frame-independent definition.

12. **Upstream vocabulary.** Evolution equations are one-parameter semigroups with a generator, in
    the sense of `TauCeti.Analysis.Semigroups.Defs`; inverse problems are Fredholm problems, in the
    sense of `TauCeti.Analysis.Fredholm.Basic`. Nothing here reproves existence, uniqueness or
    index theory. The trap is a bespoke evolution-equation solution theory that cannot be composed
    with the one `CollinearEvolution` builds on the same upstream base.

13. **Unproved things are named in prose, not encoded as structure fields.** A `Prop`-valued field
    with a placeholder witness asserts nothing while looking like a hypothesis. Where this roadmap
    has an open problem — the higher-rescattering series of Layer 6, the direction of small-`x`
    evolution of the ratio in Layer 4 — it is named as such in the layer text and appears in
    `Suggested.lean` as a `sorry`-ed target, never as a field someone can fill with `trivial`.

## Existing upstream material used by the roadmap

- `EpsilonEridani.Particles.Parton.PDF.Basic` — the collinear parton density as an object with a
  flavour index, a momentum fraction and a scale. Nuclear densities are built as the same shape
  with a nucleus parameter added, so that the free case is recovered by `A = 1, Z = 1` rather than
  by a separate development.
- `EpsilonEridani.Particles.Parton.PDF.Positivity` and
  `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` — positivity of densities and the scheme
  dependence of that statement. Layer 5's positivity constraints are the nuclear instance of these,
  and the scheme caveat carries over unchanged: beyond leading order positivity is a property of a
  particular scheme, not of the distribution.
- `EpsilonEridani.Particles.Parton.PDF.Model` — parameterised density models. The mass-number
  parameterisation of Layer 5 is an instance of this shape.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`,
  `EpsilonEridani.QFT.Factorization.Evolution.CollinearForm` and
  `EpsilonEridani.QFT.Factorization.Evolution.Solutions` — the collinear evolution equation, its
  kernel form and its solutions. Layer 4 proves target independence of the kernel and then uses
  these unchanged.
- `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` — moments of the evolution equation,
  used for the sum-rule stability statements of Layer 4 and for the moment form of the crossing
  theorems.
- `EpsilonEridani.QFT.Factorization.Evolution.SmallX` — the small-momentum-fraction form of the
  evolution, used for the statement about the direction of evolution of the ratio in the shadowing
  region.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic`,
  `EpsilonEridani.QFT.Factorization.Convolution.Collinear` and
  `EpsilonEridani.QFT.Factorization.Convolution.Properties` — the collinear convolution and its
  algebraic properties. The nucleon-convolution representation of Layer 3 is expressed with this
  operation rather than a fresh one, which is what makes its sum-rule preservation a corollary of
  properties already available.
- `EpsilonEridani.QFT.Factorization.Convolution.Mellin` — the Mellin transform, under which the
  nucleon convolution factorises into a product of moments; this is the shortest route to the
  sum-rule theorems of Layer 3.
- `EpsilonEridani.QFT.Factorization.DIS.LO` — the leading-order hard kernel, which is what makes
  the density ratio and the structure-function ratio coincide at that order.
- `EpsilonEridani.QFT.Factorization.Basic` and `EpsilonEridani.QFT.Factorization.Scales.Basic` —
  factorisation and the scale bookkeeping that makes "at the same hard scale" a statement rather
  than an assumption.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` — deep-inelastic kinematics and the bounds
  on the invariants. The support theorem of Layer 3 is proved from these with the target mass set to
  the nuclear mass, which is the entire content of "support beyond unit momentum fraction".
- `EpsilonEridani.QFT.Scattering.DIS.Basic` and `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` —
  the hadronic tensor and the structure functions. The nuclear hadronic tensor is the same
  decomposition with the nuclear target's quantum numbers, and Layer 0 records which of its
  properties are independent of the target's spin.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` and
  `EpsilonEridani.QFT.Scattering.DIS.Inference.Unfolding` — the forward map from distributions to
  observables and the existing identifiability vocabulary. Layer 5 is the nuclear instance; it adds
  a nucleus parameter and the mass-number parameterisation, and reuses the notion of a determined
  combination rather than defining a second one.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Gluon` — what inclusive data say about the gluon.
  Layer 5's statement that inclusive nuclear data constrain the nuclear gluon only through evolution
  is the nuclear form of this, and is proved by the same route.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Conjectures` — the place where inference statements
  that are not theorems are recorded. The open problems this roadmap names belong in that shape.
- `EpsilonEridani.Mathematics.Distribution.BasicExtensions` — distributional extensions, for the
  endpoint behaviour of the convolution representation at momentum fraction approaching the
  kinematic limit.
- `TauCeti.Analysis.Semigroups.Defs`, `TauCeti.Analysis.Semigroups.Generator.Basic`,
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and
  `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness` — one-parameter semigroups, generators and
  the abstract Cauchy problem with uniqueness. Layer 4's target-independence theorem is a statement
  that one generator serves two initial conditions, and the uniqueness that makes the
  nuclear-minus-free difference statement sharp comes from here rather than being reproved.
- `TauCeti.Analysis.Semigroups.Generator.Uniqueness` — uniqueness of the generator, which is what
  turns "the same equation" into "the same evolution operator".
- `TauCeti.Analysis.Fredholm.Basic`, `TauCeti.Analysis.Fredholm.Criteria`,
  `TauCeti.Analysis.Fredholm.FiniteRank` and `TauCeti.Analysis.Fredholm.Index` — Fredholm theory.
  Layer 5's non-identifiability statements are statements about the kernel of a Fredholm operator,
  and the finite-rank results are what make "a finite data set determines a finite-dimensional
  combination" precise.
- `TauCeti.Analysis.Fredholm.CompactPerturbation` — compactness of perturbations of a Fredholm
  operator, which is the upstream material closest to an ill-posedness statement.
- `TauCeti.Probability.Moments.Basic` and `TauCeti.Probability.Moments.Covariance` — moments of a
  measure. The sum rules of Layer 1 are moment conditions and are stated with this vocabulary; the
  covariance material supports the statement of which moment combinations a determination can
  separate.
- `TauCeti.Probability.Moments.Determinacy` — when a measure is determined by its moments. The
  moment-space form of the determination problem in Layer 5 is stated against this.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` — weak derivatives, for the scale derivative of the
  ratio in Layer 4 without assuming pointwise differentiability of a fitted density.
- `TauCeti.Analysis.SpecialFunctions.Beta` — the beta function, which is the closed form of the
  moments of the endpoint-behaviour models used in the Layer 3 examples.
- `TauCeti.Analysis.Contour.PerWindow.CPV` — Cauchy principal values, needed for the dispersive form
  of the rescattering integral in Layer 6.
- `TauCeti.Analysis.PositiveDefinite.Basic` — positive-definiteness, used for the matrix form of the
  positivity constraints on a multi-flavour nuclear density in Layer 5.
- `TauCeti.Analysis.Matrix.Spectrum` — matrix spectra, for the eigen-decomposition of the
  parameter-space covariance that expresses which mass-number-dependence parameters are determined.
- Mathlib: `MeasureTheory.Integral.IntervalIntegral` and `MeasureTheory.Integral.FundThmCalculus`
  for the sum rules and their derivatives; `MeasureTheory.Integral.SetIntegral` and
  `MeasureTheory.Measure.Lebesgue.Basic` for the support statements; `Analysis.Convolution` for the
  nucleon convolution's analytic properties; `Analysis.SpecialFunctions.Pow.Real` and
  `Analysis.SpecialFunctions.Log.Basic` for the mass-number dependence and the logarithmic scale
  variable; `Analysis.SpecialFunctions.Exp` for the Woods-Saxon profile;
  `Analysis.Calculus.Deriv.Basic` and `Analysis.Calculus.MeanValue` for the crossing arguments;
  `Analysis.MeanInequalities` for the positivity bounds; `Topology.Algebra.InfiniteSum.Basic` for
  the rescattering series of Layer 6.

Genuine absences, and what the roadmap does instead:

- ⚠ **No notion of ill-posedness exists in TauCeti or Mathlib.** Layer 5 needs one: the statement
  that recovering nuclear densities from a finite set of ratio measurements is unstable is the
  content of the identifiability discussion. The roadmap defines ill-posedness *here*, as
  non-closedness of the range and compactness of the forward operator, built directly on
  `TauCeti.Analysis.Fredholm.Criteria` and `TauCeti.Analysis.Fredholm.CompactPerturbation` in the
  shape those files would want, and does not wait for an upstream regularisation theory. No
  regularised inverse is constructed; what is proved is the instability itself.
- ⚠ **No moment problem for a measure on a bounded interval with prescribed support exists
  upstream.** The sum rules of Layer 1 constrain finitely many moments of a density with support on
  `(0, A]`, and the question of which densities are consistent with a given finite set of moments is
  a Hausdorff-type moment problem. The roadmap builds the finite-moment consistency statements it
  needs directly from `TauCeti.Probability.Moments.Basic` and
  `TauCeti.Probability.Moments.Determinacy`, for the specific weights that occur, rather than a
  general theory.
- ⚠ **No harmonic sums and no polylogarithms exist in either library.** They are absent from
  Mathlib and from TauCeti at the pinned revisions. They are needed only in the moment-space forms
  of the higher-order kernels, which are `CollinearEvolution`'s to build; this roadmap's
  moment-space statements are written so that they hold for an abstract kernel with stated
  properties, and no result here depends on a closed form for one.
- ⚠ **No nuclear structure exists anywhere upstream.** There is no nucleus, no mass number, no
  nuclear density profile and no thickness function in EpsilonEridani, TauCeti or Mathlib. Layer 0
  builds all of it, in Mathlib's shape: a nucleus is a structure with a mass number and a proton
  number, and a density profile is a function with a proved normalisation, not a typeclass.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the nuclear
  invariants and `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the per-nucleon frame of
  Convention 1.

## Layer 0: nuclei, densities and the modification ratio

References: EIC Yellow Report arXiv:2103.05419 Vol. II §7.3.3; De Vries, De Jager and De Vries
(1987) for the Woods-Saxon parameters; Arneodo, Phys. Rept. 240 (1994) 301 for the conventions in
which nuclear ratios are quoted.

### 0.1 Nuclei

A nucleus is a structure carrying a mass number `A : ℕ` with `0 < A`, a proton number `Z : ℕ` with
`Z ≤ A`, and the derived neutron number `N = A - Z`. A nucleus is *isoscalar* when `2 Z = A`. The
free proton is the nucleus with `A = Z = 1` and the free neutron is `A = 1, Z = 0`; the deuteron is
`A = 2, Z = 1`. The point of defining the free cases as nuclei is that every theorem below then has
the free case as an instance, and the statement "the free limit of the nuclear ratio is one" is a
computation rather than a convention.

Theorem to prove: for a nucleus, `Z + N = A`, and isoscalarity is equivalent to `Z = N`.

### 0.2 Coordinate-space nuclear densities

A *nuclear density profile* for a nucleus is a non-negative measurable function `ρ_A : ℝ³ → ℝ` with
`∫ ρ_A d³r = A`. Three profiles are constructed:

- The two-parameter Fermi, or Woods-Saxon, profile
  `ρ_A(r) = ρ₀ / (1 + exp((r - R_A)/a))`, with `R_A` the half-density radius and `a` the surface
  thickness, and `ρ₀` fixed by the normalisation.
- The hard sphere `ρ_A(r) = (3A / 4π R_A³) · 1_{r ≤ R_A}`.
- The Gaussian `ρ_A(r) = A (π R_A²)^{-3/2} exp(-r²/R_A²)`, used for the lightest nuclei.

Theorems to prove: each profile is normalisable, and the normalising constant `ρ₀` of the
Woods-Saxon profile exists and is unique and positive. The hypotheses needed are `0 < a`, `0 < R_A`
and `0 < A`; no smoothness is required beyond measurability.

The *thickness function* is `T_A(b) = ∫_ℝ ρ_A(b, z) dz` for `b ∈ ℝ²`, the areal number density of
nucleons along a straight line. Theorems: `T_A ≥ 0`; `∫ T_A(b) d²b = A`; for the hard sphere,
`T_A(b) = (3A / 2π R_A³) √(R_A² - b²)` on `b ≤ R_A` and zero beyond, and hence
`T_A(0) = 3A / (2π R_A²)`.

Scaling statement: with `R_A = r₀ A^{1/3}` for a fixed length `r₀`, the central thickness satisfies
`T_A(0) ∝ A^{1/3}`. This is the only place the `A^{1/3}` that pervades the subject is introduced,
and it is introduced as a consequence of a geometric hypothesis on `R_A`, not as a law. The
hypothesis is named `RadiusCubeRootScaling` and every later result that uses an `A^{1/3}` carries
it.

### 0.3 Nuclear parton densities, per nucleon and per nucleus

Fix a nucleus. The *per-nucleon* nuclear parton densities are a family
`f_i^A : ℝ → ℝ → ℝ`, indexed by parton flavour `i`, of momentum fraction and hard scale, defined
with respect to the per-nucleon momentum `p_N = P_A / A`. They vanish outside `(0, A]` in the
momentum-fraction argument. The *per-nucleus* densities are `F_i^A(x_A, Q²) = A f_i^A(A x_A, Q²)`,
vanishing outside `(0, 1]`.

Theorem to prove (the rescaling lemma): the two families determine each other, the support
statements correspond, and for any weight `w` the moment identity
`∫_0^A w(x) f_i^A(x, Q²) dx = ∫_0^1 w(A x_A) F_i^A(x_A, Q²) dx_A` holds. Every sum rule in Layer 1
is then proved once and transported.

### 0.4 Isospin decomposition

Nuclear densities decompose into the densities of a bound proton and a bound neutron:
`f_i^A = (Z f_i^{p/A} + N f_i^{n/A}) / A`, where `f_i^{p/A}` and `f_i^{n/A}` are defined as the
per-nucleon densities of the proton and neutron content of the nucleus. This is a definition of the
right-hand side objects in terms of two functions summing to the left-hand side, and it is
underdetermined without a further assumption; the assumption normally made is that the bound-proton
and bound-neutron densities are related by the same isospin rotation as the free ones. That
assumption is named `BoundIsospinSymmetry` and is stated as a hypothesis, never used silently.

Theorem: for an isoscalar nucleus, under `BoundIsospinSymmetry`, `f_u^A = f_d^A` and the isovector
combination vanishes.

### 0.5 The modification ratio and the structure-function ratio

The *nuclear modification ratio* for flavour `i` is `R_i^A(x, Q²) = f_i^A(x, Q²) / f_i^N(x, Q²)`,
where `f^N` is the free-nucleon density of the *stated* reference — proton, neutron, or the
isoscalar average `(f^p + f^n)/2` — at the same momentum fraction and scale. The reference is part
of the object; three ratios are defined and none is the default.

The *structure-function ratio* is `R_{F_2}^A(x, Q²) = F_2^A(x, Q²) / (A F_2^N(x, Q²))` with `F_2^A`
the per-nucleus structure function; this is what an experiment reports.

The *isoscalar-corrected ratio* is `R_{F_2}^A` with the free-nucleon denominator replaced by the
isospin content of the actual nucleus, so that the isospin asymmetry of a heavy nucleus is removed
from the ratio by construction.

Theorem to prove: at leading order in the strong coupling, with `BoundIsospinSymmetry` and for an
isoscalar nucleus, `R_{F_2}^A(x, Q²) = Σ_q e_q² x (f_q^A + f_q̄^A) / Σ_q e_q² x (f_q^N + f_q̄^N)`,
which is a charge-weighted average of the `R_i^A` and coincides with a single `R^A` when all quark
ratios are equal. Beyond leading order the relation acquires the gluon through the hard kernel, and
the theorem is stated with the remainder identified as a convolution with the order-`α_s` kernel of
`EpsilonEridani.QFT.Factorization.DIS.LO` and its higher-order continuation. The three ratios are
*different functions*, and the theorem that says when they agree lists exactly the conditions.

### Examples

- The free proton: `A = Z = 1` gives `R_i^A ≡ 1` for every flavour and every scale, and the sum
  rules of Layer 1 reduce to the free-nucleon ones.
- The deuteron: `A = 2, Z = 1`, isoscalar, whose ratio is the smallest non-trivial case and is the
  denominator most experiments actually use. The distinction between "the deuteron ratio" and "the
  isoscalar nucleon" is made explicit here and is the reason the reference is part of the ratio's
  name.
- Carbon-12, `A = 12, Z = 6`: isoscalar, with a Woods-Saxon profile, used as the worked instance of
  the Layer 0 normalisation theorems.
- Lead-208, `A = 208, Z = 82`: strongly non-isoscalar, the case where the isoscalar-corrected ratio
  and the raw ratio differ visibly, and the worked instance of the isospin decomposition.

### Dependencies

`EpsilonEridani.Particles.Parton.PDF.Basic` for the density shape;
`EpsilonEridani.QFT.Scattering.DIS.Basic` and `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` for
the structure functions; `EpsilonEridani.QFT.Factorization.DIS.LO` for the leading-order relation;
`EpsilonEridani.QFT.Factorization.Scales.Basic` for "at the same scale"; Mathlib
`MeasureTheory.Integral.IntervalIntegral`, `MeasureTheory.Measure.Lebesgue.Basic`,
`Analysis.SpecialFunctions.Exp` and `Analysis.SpecialFunctions.Pow.Real`. The free-nucleon densities
in every denominator are `InclusiveStructureFunctions`.

---

## Layer 1: sum rules and the crossing theorems

References: EIC Yellow Report arXiv:2103.05419 Vol. II §7.3.3; Frankfurt, Guzey and Strikman,
Phys. Rept. 512 (2012) 255, §2 for the sum-rule bookkeeping; Eskola, Paakkinen, Paukkunen and
Salgado, Eur. Phys. J. C 82 (2022) 413 for the sum rules as imposed constraints in a determination.

### 1.1 The number and baryon-number sum rules

For a nucleus with `Z` protons and `N` neutrons, the valence content is `2Z + N` up quarks and
`Z + 2N` down quarks, so the per-nucleon number sum rules read

- `∫_0^A (f_u^A - f_ū^A) dx = (2Z + N)/A`
- `∫_0^A (f_d^A - f_d̄^A) dx = (Z + 2N)/A`
- `∫_0^A (f_q^A - f_q̄^A) dx = 0` for every other flavour, under the hypothesis of no intrinsic
  heavy flavour, which is named.

The baryon-number sum rule `(1/3) Σ_q ∫_0^A (f_q^A - f_q̄^A) dx = 1` is a consequence of the first
two for an isoscalar nucleus and of all of them in general.

Theorems to prove: the number sum rules are scale-independent, which follows from the vanishing of
the first moment of the non-singlet kernel and is imported from
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace`; and the baryon-number sum rule follows
from the number sum rules with the arithmetic `2Z + N + Z + 2N = 3A`.

### 1.2 The momentum sum rule

`Σ_i ∫_0^A x f_i^A(x, Q²) dx = 1`, the sum running over all quark, antiquark and gluon flavours,
with the right-hand side one in the per-nucleon convention. Theorem: in the per-nucleus convention
the same statement reads `Σ_i ∫_0^1 x_A F_i^A(x_A, Q²) dx_A = 1`, by the rescaling lemma of §0.3 —
this is the sharpest test of that lemma, because the naive transport gives `A` and the correct one
gives one.

Theorem: the momentum sum rule is scale-independent, from the vanishing of the second moment of the
singlet kernel matrix acting on the total, again imported rather than reproved.

Statement of what the momentum sum rule does *not* say: it does not constrain any individual
flavour's momentum fraction, and in particular it does not constrain the nuclear gluon momentum
fraction except through the sum. The nuclear gluon is the least constrained object in the subject
and the momentum sum rule is the only inclusive constraint on it that holds at a single scale; this
is made precise in Layer 5.

### 1.3 The crossing theorem, momentum-weighted form

Define the measure `dμ_i(x) = x f_i^N(x, Q²) dx` on `(0, 1]` for each flavour. Then the momentum
sum rules for the nucleus and for the free nucleon give

`Σ_i ∫_0^A x f_i^N(x, Q²) (R_i^A(x, Q²) - 1) dx = 0`,

where `f_i^N` is extended by zero beyond `x = 1`. Theorem (**the crossing theorem**): if every
`f_i^N` is non-negative and not almost everywhere zero, then it is impossible that
`R_i^A(x, Q²) < 1` for all `i` and almost all `x ∈ (0, 1]`, and impossible that `R_i^A > 1` for all
`i` and almost all `x`; either the ratios are almost everywhere one on the support of the measures,
or the set where some ratio exceeds one has positive measure and so does the set where some ratio
falls below one.

Two precision points, both essential and both routinely elided:

- The theorem is *flavour-summed*. It does not say that any single `R_i^A` crosses unity. A single
  flavour may be suppressed at every momentum fraction provided another is enhanced. Any statement
  that "the ratio must cross one" for one flavour needs the number sum rule instead.
- The theorem says nothing about the region `x > 1`, where the free-nucleon densities vanish and the
  ratio is not defined. The momentum carried by the nuclear densities above `x = 1` enters the
  left-hand side as an additive term with no counterpart in the free case, and the honest form of
  the identity carries it explicitly:
  `Σ_i ∫_0^1 x f_i^N (R_i^A - 1) dx + Σ_i ∫_1^A x f_i^A dx = 0`.
  The second term is non-negative, so the first is non-positive: the momentum-weighted average of
  `R - 1` over the free-nucleon support is *at most zero*, with equality only if the nuclear
  densities have no support above unit momentum fraction. This is stronger and cleaner than the
  usual statement and it is the form to prove.

### 1.4 The crossing theorem, valence form

For an isoscalar nucleus, the number sum rule gives, flavour by flavour on the valence combinations,
`∫_0^A f_{q_v}^N(x, Q²) (R_{q_v}^A(x, Q²) - 1) dx + ∫_1^A f_{q_v}^A dx = 0` with
`f_{q_v} = f_q - f_q̄`. Theorem: under the hypothesis that the valence densities are non-negative,
the number-weighted average of `R_{q_v} - 1` over `(0, 1]` is at most zero, flavour by flavour. For
a non-isoscalar nucleus the right-hand side acquires the computable offset
`(2Z + N)/A - 3/2` for up and `(Z + 2N)/A - 3/2` for down, and the theorem is stated with it.

This is the statement that makes antishadowing a *consequence* rather than an observation: given
valence suppression on an interval at small momentum fraction and suppression again on an interval
at large momentum fraction, the valence crossing theorem forces enhancement somewhere in between.
Layer 2 states that implication as a theorem with the interval hypotheses explicit.

### 1.5 Which sum rules a determination may impose

A determination of nuclear densities may impose the number and momentum sum rules as exact
constraints at the initial scale, because they are scale-independent and therefore consistent with
the evolution. It may not impose the crossing theorems as constraints, because they are consequences
of the sum rules and imposing a consequence as an independent constraint double-counts. Theorem: the
constraint set consisting of the number and momentum sum rules at one scale is equivalent to the
same set at every scale, so the choice of scale at which to impose them is immaterial. This is a
statement about the determination problem of Layer 5 and is proved here because it is a sum-rule
statement.

### Examples

- The deuteron, where the crossing theorem's offset vanishes and the two forms coincide, and where
  the support above `x = 1` extends only to `x = 2`.
- Lead-208, where the valence offsets `(2·82 + 126)/208 - 3/2 = -0.096...` and
  `(82 + 2·126)/208 - 3/2 = 0.105...` are worked out explicitly, demonstrating that the offset is
  small but not zero and must appear in the statement.
- A density that is uniformly suppressed at every momentum fraction below one and has all its
  compensating momentum above `x = 1`: consistent with the momentum sum rule, inconsistent with the
  observed magnitude of the effect, and the instance that shows the crossing theorem's second term
  is not vacuous.

### Dependencies

Layer 0 for the densities, the conventions and the rescaling lemma;
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` for the moment statements that give
scale independence; `TauCeti.Probability.Moments.Basic` and `TauCeti.Probability.Moments.Covariance`
for the moment vocabulary; Mathlib `MeasureTheory.Integral.IntervalIntegral`,
`MeasureTheory.Integral.SetIntegral` and `Analysis.MeanInequalities`. The first and second moments
of the splitting kernels are `CollinearEvolution`.

---

## Layer 2: the named regions as properties of the ratio

References: Aubert *et al.* (European Muon Collaboration), Phys. Lett. B 123 (1983) 275;
Geesaman, Saito and Thomas, Ann. Rev. Nucl. Part. Sci. 45 (1995) 337; Arneodo, Phys. Rept. 240
(1994) 301; Armesto, J. Phys. G 32 (2006) R367; Brodsky and Lu, Phys. Rev. Lett. 64 (1990) 1342.

Each region is a predicate on a modification ratio, a nucleus, a hard scale and an interval. None
of the four definitions mentions a mechanism, a scattering, a dipole or a nucleon. The interval
endpoints are arguments.

### 2.1 Shadowing

`Shadowing R A Q² x₁` holds when `R_i^A(x, Q²) < 1` for all `x ∈ (0, x₁)`. The region is the
interval; the statement is the inequality. Reference values from the literature put `x₁` near `0.05`
for heavy nuclei at scales of a few `GeV²`, and that number appears only as an identification of
which region is meant.

The *coherence estimate* is recorded separately and named: the interaction length associated with a
momentum fraction `x` in the target rest frame is of order `1/(2 M_N x)`, and it exceeds the nuclear
radius `R_A = r₀ A^{1/3}` when `x ≲ 1/(2 M_N r₀ A^{1/3})`. Under `RadiusCubeRootScaling` this gives
`x₁(A) ∝ A^{-1/3}` as an *estimate of where the region boundary sits*, with a theorem stating
exactly that: the coherence condition holds on an interval whose right endpoint scales as
`A^{-1/3}`. The estimate is never a hypothesis of a shadowing theorem, and no theorem below
concludes shadowing from it. This separation is the point of convention 7.

Theorem: shadowing on `(0, x₁)` for all flavours, together with the valence crossing theorem of
§1.4, implies that the valence ratio exceeds one on a subset of positive measure of `(x₁, A)`.

### 2.2 Antishadowing

`Antishadowing R A Q² x₁ x₂` holds when `R_i^A(x, Q²) > 1` for all `x ∈ (x₁, x₂)`. Reference values
place the region between about `0.05` and `0.3`.

Theorem (**forced antishadowing**): for an isoscalar nucleus, if the valence ratio is below one on
`(0, x₁)` and below one on `(x₃, 1)` with `x₂ ≤ x₃`, and the valence densities are non-negative,
then the valence ratio exceeds one on a positive-measure subset of `(x₁, x₂)`. The hypotheses are
exactly the two suppression statements and positivity; the conclusion is a positive-measure
statement, not a pointwise one. Pointwise enhancement on the whole interval does not follow from the
sum rules and is not claimed.

Precision point: forced antishadowing is a statement about the *valence* ratio, derived from the
number sum rule. The corresponding statement for the gluon would need the momentum sum rule, which
is flavour-summed, and therefore does not give a gluon-specific conclusion. Whether the nuclear
gluon antishadows is an open question at the level of this roadmap, constrained only through the
identifiability statements of Layer 5, and it is named as open rather than asserted.

### 2.3 The European Muon Collaboration effect

`EMCDepletion R A Q² x₃ x₄` holds when `R_i^A(x, Q²) < 1` for all `x ∈ (x₃, x₄)` with
`x₄ < 1`. Reference values place the region between about `0.3` and `0.7`, with the minimum near
`0.6`.

This is stated as an empirical property of the ratio. Four candidate explanations are named, and
none is assumed:

- Nuclear binding and nucleon off-shellness, which enters through the convolution representation of
  Layer 3 when the nucleon momentum distribution is taken off the mass shell.
- Short-range correlated nucleon pairs, whose configuration-level description is `LightNuclei`.
- Modification of the bound nucleon's own parton content, whose dynamics is `NuclearMedium`.
- A non-nucleonic component of the nuclear light-cone momentum, such as a pion excess, which appears
  in the convolution representation as an additional term with its own momentum fraction.

Each is recorded as a predicate that, combined with stated properties of its input, would yield
`EMCDepletion`. None of the four implications is proved in this roadmap, and saying so is the honest
statement of the situation: the effect has been measured for four decades and its explanation is
open. What *is* proved here is the constraint that the crossing theorems place on any explanation,
namely that a mechanism producing depletion on `(x₃, x₄)` must also produce compensating
enhancement, and where.

Theorem to prove: the mass-number dependence of the depletion is not fixed by the sum rules. Two
densities with the same integrals and different depletion depths both satisfy every sum rule of
Layer 1, so the observed approximate logarithmic growth of the depletion with mass number is a
datum, not a theorem, and the roadmap says so.

### 2.4 Fermi motion and the approach to the kinematic limit

`FermiRise R A Q² x₄` holds when `R_i^A(x, Q²) > 1` for all `x ∈ (x₄, 1)` and `R_i^A(x, Q²) → ∞`
as `x → 1⁻`. The divergence is part of the definition, and is what distinguishes this region from
antishadowing: the denominator vanishes at `x = 1` and the numerator does not.

Unlike the other three, this region has a derivation, and it is given in Layer 3 from the
convolution representation. Layer 2's role is only to define it.

### 2.5 The regions are not exhaustive and not disjoint by fiat

Theorem: the four predicates can hold simultaneously on their respective intervals only if the
intervals are ordered `0 < x₁ ≤ x₂ ≤ x₃ ≤ x₄ < 1`, and the union of the four intervals need not be
`(0, 1)`. The gaps between them are regions where the ratio's sign of departure from one is not
constrained by any statement in this roadmap. Naming the gaps is deliberate: a plot divided into
four labelled regions suggests a completeness that the definitions do not have.

### Examples

- A ratio built from a smooth interpolation through the four regions for an isoscalar `A = 12`
  nucleus, satisfying the number and momentum sum rules exactly, constructed as the worked instance
  that all four predicates can be simultaneously realised.
- A ratio satisfying `Shadowing` and `EMCDepletion` but violating the momentum sum rule, exhibited
  to show that the crossing theorem is a genuine constraint and that the four predicates are not
  independent of Layer 1.
- The deuteron, where all four regions are present but the departures from one are at the percent
  level, and where the region boundaries from the coherence estimate lie outside the measured range
  — the instance that shows the estimate's mass-number scaling matters.

### Dependencies

Layer 0 for the ratio and its reference; Layer 1 for the crossing theorems that force antishadowing;
`EpsilonEridani.Particles.Parton.PDF.Positivity` for the positivity hypotheses; Mathlib
`Analysis.SpecialFunctions.Pow.Real` for the `A^{-1/3}` scaling and
`MeasureTheory.Integral.SetIntegral` for the positive-measure conclusions. The candidate explanation
by medium modification of the bound nucleon is `NuclearMedium`; the candidate explanation by
correlated pairs is `LightNuclei`.

---

## Layer 3: kinematic support, the convolution representation, and polarised nuclei

References: EIC Yellow Report arXiv:2103.05419 Vol. II §7.2.5 and §7.3.3;
Frankfurt and Strikman, Phys. Rept. 160 (1988) 235; Kulagin and Petti, Nucl. Phys. A 765 (2006) 126;
Ciofi degli Atti, Scopetta, Pace and Salmè, Phys. Rev. C 48 (1993) R968 for polarised light nuclei;
Friar *et al.*, Phys. Rev. C 42 (1990) 2310 for the effective polarisations.

### 3.1 Support beyond unit momentum fraction

Theorem (**the support theorem**): for a nucleus of mass `M_A`, the per-nucleus momentum fraction
`x_A = Q²/(2 P_A · q)` satisfies `x_A ≤ 1` whenever the invariant mass of the hadronic final state
satisfies `W² ≥ M_A²`, and therefore the per-nucleon momentum fraction satisfies `x = A x_A ≤ A`.
The proof is the deep-inelastic kinematic identity `W² = M_A² + Q²(1/x_A - 1)` together with
`W² ≥ M_A²`, both of which are in
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds` with the target mass as a
parameter; the nuclear statement is the instance at `M_A`, not a new derivation. This is the
precise content of "the nuclear structure function has support beyond `x = 1`": it is kinematics,
and setting the target mass to the nuclear mass is the whole of it.

Corollary: the free-nucleon bound `x ≤ 1` is the case `A = 1`, and the ratio `R^A` is undefined for
`x > 1` because its denominator vanishes there. Every statement about `R^A` is therefore restricted
to `(0, 1]` by construction, and the nuclear density's content above `x = 1` is described by the
density itself, never by a ratio.

Sharper bound, named as an open refinement: requiring the final state to contain at least a residual
`A-1` system rather than merely to have `W² ≥ M_A²` gives a bound strictly below `A`, of the form
`x ≤ (M_A - M_{A-1} + ...) / M_N` up to the treatment of the excitation energy. The clean theorem is
`x ≤ A`; the sharper bound requires nuclear mass differences and a decision about which final states
to admit, and it is recorded as an open question rather than a milestone, because the choice of
admissible final states is not determined by anything in this roadmap.

### 3.2 The nucleon-convolution representation

Define a *nucleon light-cone momentum distribution* for a nucleus to be a non-negative function
`φ_A : ℝ → ℝ` supported in `(0, A]` with `∫_0^A φ_A(y) dy = 1` and `∫_0^A y φ_A(y) dy = 1`. The
first normalisation says the distribution is a probability density over nucleons; the second says
that, per nucleon, the nucleons carry all of the nuclear light-cone momentum. The second condition
is what the literature calls a *no-non-nucleonic-component* assumption and it is named as a
hypothesis, `NucleonsCarryAllMomentum`, because the pion-excess explanation of §2.3 violates it by
construction.

The representation, named `ConvolutionRepresentation`:

`f_i^A(x, Q²) = ∫_x^A (dy / y) φ_A(y) f_i^{N}(x/y, Q²)`,

with `f^N` the free-nucleon density of the appropriate isospin content. Written with the collinear
convolution of `EpsilonEridani.QFT.Factorization.Convolution.Collinear`, this is
`f^A = φ_A ⊗ f^N`.

This is a hypothesis, not a theorem. It is not derived from QCD; it presumes that the nucleus is a
collection of nucleons each of which carries a free-nucleon parton content, and it therefore cannot
by itself describe shadowing, which is a coherence phenomenon across nucleons, nor the European Muon
Collaboration effect, unless the nucleon densities inside are allowed to differ from the free ones.
Saying that plainly is the point: a representation with two of the four regions outside its reach is
still useful for the two it reaches.

### 3.3 What the representation proves

Theorem (**sum-rule preservation**): under `ConvolutionRepresentation` with `φ_A` satisfying both
normalisations, the number sum rules and the momentum sum rule of Layer 1 hold for `f^A` if and only
if they hold for `f^N` with the appropriate isospin counting. The proof is the multiplicativity of
Mellin moments under convolution, from
`EpsilonEridani.QFT.Factorization.Convolution.Mellin` and
`EpsilonEridani.QFT.Factorization.Convolution.Properties`: the `n`-th moment of `φ_A ⊗ f^N` is the
product of the `n`-th moments, and the two normalisations of `φ_A` are precisely the statements that
its zeroth and first moments are one.

Theorem (**the Fermi rise**): under `ConvolutionRepresentation`, if `φ_A` has support in `(y₀, A]`
for some `y₀ > 1` of positive measure, and the free-nucleon density behaves as
`f_i^N(x) = c (1-x)^n (1 + o(1))` as `x → 1⁻` with `c > 0` and `n > 0`, then
`R_i^A(x, Q²) → ∞` as `x → 1⁻`. The mechanism is visible in the statement: the numerator at `x`
close to one samples `f^N` at `x/y < x`, where it is larger by a power of `(1-x)`, while the
denominator vanishes. This is `FermiRise` of §2.4, proved, with its hypotheses being a support
condition on `φ_A` and an endpoint power law on `f^N`. The endpoint power law is the free-nucleon
large-`x` behaviour and belongs to `InclusiveStructureFunctions`; it enters here as a named
hypothesis with an exponent that is a parameter.

Theorem (**support inheritance**): under `ConvolutionRepresentation`, `f_i^A` is supported in
`(0, A]` if `φ_A` is, so the representation is consistent with the support theorem of §3.1. It does
*not* reproduce it: the support theorem is kinematics and holds without the representation.

Theorem (**what the representation cannot do**): under `ConvolutionRepresentation` with
`NucleonsCarryAllMomentum` and with `f^{N/A} = f^N` — bound nucleons identical to free ones — the
momentum-weighted average of `R - 1` over `(0, 1]` is at most zero with the deficit accounted
entirely by the support above `x = 1`, and the ratio tends to one as `φ_A` tends to a point mass at
`y = 1`. Consequently the representation with unmodified bound nucleons cannot produce a depletion
at small momentum fraction of the observed depth while preserving the sum rules: quantifying that
obstruction is the theorem, and it is the reason shadowing needs Layer 6.

### 3.4 Spin-dependent nuclear densities

Fix a nucleus of non-zero spin and a quantisation axis. The *per-nucleon spin-dependent nuclear
densities* `Δf_i^A(x, Q²)` are the difference of the densities for parton helicity aligned and
anti-aligned with the nuclear spin, per nucleon, with the same support `(0, A]`.

Theorem (**polarised positivity**): `|Δf_i^A(x, Q²)| ≤ f_i^A(x, Q²)` pointwise. This is the nuclear
instance of the free-nucleon bound in `EpsilonEridani.Particles.Parton.PDF.Positivity`, with the
same scheme caveat from `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity`: beyond leading order
it is a statement in a scheme.

The *polarised modification ratio* is `ΔR_i^A = Δf_i^A / Δf_i^N`, with the free-nucleon reference
stated as in §0.5. It is a different object from `R_i^A` and no relation between them is assumed;
the denominator `Δf_i^N` changes sign for some flavours, so `ΔR_i^A` has poles in the interior of
`(0, 1)` and the region language of Layer 2 does not transfer to it. That is stated explicitly
rather than left to be discovered.

The *effective-polarisation representation*, named `EffectivePolarisationRepresentation`:

`Δf_i^A = Σ_{N ∈ {p, n}} P_N^{eff} (φ_A^{Δ,N} ⊗ Δf_i^N)`,

with `P_N^{eff}` real coefficients and `φ_A^{Δ,N}` spin-dependent light-cone momentum
distributions. Theorem: under this representation with `∫ φ_A^{Δ,N}(y) dy = 1`, the first moment of
`Δf_i^A` is `Σ_N P_N^{eff}` times the first moment of `Δf_i^N`, which is the sense in which "the
nuclear spin structure is the nucleon's, diluted".

Precision point, and a theorem: the nuclear spin is *not* the sum of its nucleons' spins, so
`Σ_N P_N^{eff} ≠ 1` in general and the free-nucleon spin sum rules do not sum to nuclear ones. The
theorem to prove is that the nuclear first moment of `Δf^A` is unconstrained by the free-nucleon
spin sum rules of `SpinStructure` without the coefficients `P_N^{eff}` as additional input. The
coefficients themselves come from the nuclear spin wavefunction, which is `LightNuclei`; this
roadmap takes them as parameters and proves what follows from them. For polarised helium-3 the
literature values are close to `0.86` for the neutron and `-0.028` for the proton, quoted here only
to identify which coefficients are meant.

### Examples

- The support theorem instantiated at the deuteron: `x ≤ 2`, with the region `1 < x ≤ 2` the
  smallest laboratory for the statement.
- A three-parameter `φ_A` with support extending above `y = 1`, satisfying both normalisations,
  producing all of `FermiRise` explicitly — the worked instance of §3.3.
- Polarised helium-3 and polarised deuterium as the two instances of
  `EffectivePolarisationRepresentation`, with their effective polarisations as parameters and the
  observation that the deuteron's are nearly equal while helium-3's are wildly unequal.
- A `φ_A` equal to a point mass at `y = 1`, giving `f^A = f^N` and `R ≡ 1`: the degenerate instance
  that certifies the normalisation conventions.

### Dependencies

Layer 0 for the densities and the ratio; Layer 1 for the sum rules the representation preserves;
Layer 2 for the definition of `FermiRise` that §3.3 discharges;
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds` for the support theorem;
`EpsilonEridani.QFT.Factorization.Convolution.Collinear`, `.Mellin` and `.Properties` for the
convolution and its moments; `EpsilonEridani.Particles.Parton.PDF.Positivity` and
`.MsbarPositivity` for the polarised bound; `EpsilonEridani.Mathematics.Distribution.BasicExtensions`
for the endpoint behaviour; `TauCeti.Analysis.SpecialFunctions.Beta` for the moments of the endpoint
models; Mathlib `Analysis.Convolution` and `MeasureTheory.Integral.IntervalIntegral`. Free-nucleon
large-`x` behaviour is `InclusiveStructureFunctions`; free-nucleon polarised densities and spin sum
rules are `SpinStructure`; the nuclear spin wavefunctions behind the effective polarisations are
`LightNuclei`.

---

## Layer 4: evolution with target-independent kernels

References: EIC Yellow Report arXiv:2103.05419 Vol. II §7.3.3; Eskola, Paakkinen, Paukkunen and
Salgado, Eur. Phys. J. C 82 (2022) 413 §2 for the treatment of the initial scale;
Abdul Khalek, Ethier, Nocera and Rojo, Eur. Phys. J. C 82 (2022) 507 for the same in a different
parameterisation.

### 4.1 Target independence of the kernel

Theorem (**target independence**): the collinear evolution kernel is a property of the strong
interaction and the factorisation scheme alone, and does not depend on the hadronic target. Stated
against `EpsilonEridani.QFT.Factorization.Evolution.CollinearForm`: the generator of the evolution
semigroup is the same operator for the nuclear densities of any nucleus and for the free-nucleon
densities, and the nuclear densities obey

`∂ f_i^A(x, Q²) / ∂ ln Q² = Σ_j (P_{ij} ⊗ f_j^A)(x, Q²)`

with the *same* `P_{ij}`. What is being proved is not the evolution equation — that is
`CollinearEvolution`'s — but the assertion that the nucleus enters only through the initial
condition. The content is that the kernel is derived from the collinear limit of a partonic
splitting amplitude with no reference to the target's wavefunction, which is a statement about
`EpsilonEridani.QFT.Factorization.Basic` and the factorisation theorem it proves.

Corollary, via `TauCeti.Analysis.Semigroups.Generator.Uniqueness` and
`TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`: there is a single evolution family
`U(Q², Q₀²)`, and `f^A(Q²) = U(Q², Q₀²) f^A(Q₀²)` for every nucleus with the same `U`. The
mass-number dependence of the nuclear densities at any scale is entirely the mass-number dependence
of the initial condition at `Q₀²`, transported by a target-independent operator. This is the
theorem that licenses the entire practice of parameterising nuclear densities at an initial scale
and evolving.

Caveat to state: target independence holds for the *leading-twist* kernel. Power corrections in
`1/Q²` do depend on the target, and their nuclear enhancement is exactly the regime where the
leading-twist statement fails. The theorem is stated with leading twist as a hypothesis and the
power-suppressed remainder named, not dropped; the remainder's structure for nuclear targets is an
open question at the level of this roadmap and the transverse-momentum power corrections of
`EpsilonEridani.Particles.Parton.TMD.PowerCorrections` are the nearest available vocabulary for it.

### 4.2 The difference obeys the same equation

Theorem (**the difference theorem**): define `δf_i^A = f_i^A - f_i^N`, extending `f^N` by zero above
`x = 1`. Then by linearity of the evolution equation,

`∂ δf_i^A / ∂ ln Q² = Σ_j (P_{ij} ⊗ δf_j^A)`,

with the same kernel. The nuclear modification, as a difference, is itself a solution of the
evolution equation with initial condition `δf^A(Q₀²)`.

This is exact and it is the correct way to say "the nuclear effects evolve". It is strictly stronger
and cleaner than any statement about the ratio, because the ratio is a quotient of solutions and is
not a solution of anything. Every statement in §4.3 is derived from the difference theorem.

Corollary: `δf^A(Q₀²) = 0` implies `δf^A(Q²) = 0` for all `Q²`, by uniqueness. A nucleus whose
densities coincide with the free nucleon's at one scale coincides at every scale: the identity ratio
is a fixed point of the evolution, and any nuclear modification observed at any scale requires one
at every scale. The corresponding statement in terms of the ratio — that `R ≡ 1` is scale-stable —
follows, and is the only statement about the ratio that evolution makes exactly.

### 4.3 The ratio evolves

Theorem: `R_i^A(x, Q²) = 1 + δf_i^A(x, Q²) / f_i^N(x, Q²)`, and its logarithmic scale derivative is

`∂ R_i^A / ∂ ln Q² = [ Σ_j (P_{ij} ⊗ δf_j^A) - R_i^A Σ_j (P_{ij} ⊗ δ_{j} f^N) · ... ] / f_i^N`

— the point being that the derivative of the ratio is *not* a convolution of the kernel with the
ratio. The kernel acts on densities, not on ratios, and the ratio's evolution equation is
consequently non-local in a way the density's is not. The theorem to prove is the exact expression,
and the immediate consequence is stated as a warning with the status of a theorem: a modification
ratio quoted without a hard scale is an incomplete specification, and applying the evolution
equation to a ratio as though it were a density is wrong. The scale derivative is taken weakly, in
the sense of `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, because a parameterised initial condition
need not be pointwise differentiable in `x`.

Theorem: the number and momentum sum rules of Layer 1, being moment conditions annihilated by the
kernel's moments, are preserved by the evolution, so the crossing theorems of §1.3 and §1.4 hold at
every scale once they hold at one. Combined with §4.2 this says the *qualitative* structure of
Layer 2 — that suppression somewhere forces enhancement elsewhere — is scale-independent even though
the interval endpoints are not.

### 4.4 The direction of evolution at small momentum fraction

At small momentum fraction the evolution of a density is driven by the gluon at larger momentum
fraction, in the form given by
`EpsilonEridani.QFT.Factorization.Evolution.SmallX`. Applying the difference theorem, the scale
derivative of `δf^A` at small `x` is a convolution of the kernel with `δf_g^A` over momentum
fractions above `x`. The expected consequence — that a suppression at small `x` sitting below an
enhancement at intermediate `x` is filled in as the scale grows, so that shadowing weakens with
increasing `Q²` — is an inequality about a convolution of a sign-changing function with a
positive kernel, and it does not follow from the sign of the kernel alone.

This is named as an **open question**, precisely: under what conditions on the initial `δf_g^A` does
`∂ (δf^A / f^N) / ∂ ln Q² > 0` hold on `(0, x₁)`? A sufficient condition is that `δf_g^A` be
non-negative on `(x, 1)` for every `x` in the shadowing region, which is not what the shadowing
hypothesis says. The roadmap states the sufficient condition as a theorem, states that the
sufficient condition does not follow from `Shadowing`, and does not dress the general statement as a
milestone. What is in scope is the exact derivative expression, the sufficient condition, and a
counterexample showing the sufficient condition cannot be dropped.

### Examples

- A nucleus with `δf^A(Q₀²)` a single flavour's localised suppression and compensating enhancement,
  evolved in moment space, exhibiting the difference theorem concretely.
- The fixed-point instance: `δf^A(Q₀²) = 0` and its consequence at every scale, as the certificate
  of the uniqueness import.
- A ratio evolved directly with the kernel, compared against the correct evolution of the
  difference, exhibited as the worked counterexample to the error §4.3 warns against.
- The counterexample for §4.4: an initial `δf_g^A` satisfying `Shadowing` for which the small-`x`
  ratio derivative is negative, showing the sufficient condition is not vacuous.

### Dependencies

Layer 0 for the densities; Layer 1 for the sum rules preserved;
`EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.CollinearForm`, `.MomentSpace`, `.SmallX` and
`.Solutions` for the evolution equation and its solution theory;
`EpsilonEridani.QFT.Factorization.Basic` for the factorisation statement that makes the kernel
target-independent; `EpsilonEridani.Particles.Parton.TMD.PowerCorrections` for the vocabulary of
power-suppressed remainders; `TauCeti.Analysis.Semigroups.Defs`, `.Generator.Basic`,
`.Generator.Uniqueness`, `.CauchyProblem.Basic` and `.CauchyProblem.Uniqueness` for the semigroup
and its uniqueness; `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` for the weak scale derivative;
Mathlib `Analysis.SpecialFunctions.Log.Basic`, `Analysis.Calculus.Deriv.Basic` and
`MeasureTheory.Integral.FundThmCalculus`. The kernels themselves, their moments and the running
coupling are `CollinearEvolution`.

---

## Layer 5: determination, identifiability and positivity

References: EIC Yellow Report arXiv:2103.05419 Vol. II §7.3.3; Eskola, Paakkinen, Paukkunen and
Salgado, Eur. Phys. J. C 82 (2022) 413; Kovařík *et al.*, Phys. Rev. D 93 (2016) 085037;
Abdul Khalek, Ethier, Nocera and Rojo, Eur. Phys. J. C 82 (2022) 507; Kulagin and Petti,
Nucl. Phys. A 765 (2006) 126.

### 5.1 The mass-number parameterisation

A *nuclear density model* assigns to each nucleus an initial condition at `Q₀²`, as an instance of
`EpsilonEridani.Particles.Parton.PDF.Model` with the nucleus as an additional parameter. Two shapes
are defined:

- *Multiplicative*: `f_i^A(x, Q₀²) = R_i(x; A, Z, θ) f_i^N(x, Q₀²)`, with the free-nucleon density
  taken from `InclusiveStructureFunctions` and the modification parameterised.
- *Absolute*: `f_i^A(x, Q₀²) = g_i(x; A, Z, θ)` directly, with the free-nucleon case recovered as
  the `A = 1` instance of the same functional form.

Theorem: the two shapes are not equivalent as *constrained* problems. The sum rules of Layer 1 are
linear in the absolute shape and, in the multiplicative shape, linear in `R` only with the
free-nucleon density as a weight; so imposing the sum rules exactly is a linear constraint in one
shape and a weighted linear constraint in the other, and the sets of models satisfying them
correspond only if the free-nucleon density is held fixed. The theorem states the correspondence and
its hypothesis. The trap it closes is treating the free-nucleon density as fixed input in a
multiplicative model while simultaneously determining it, which makes the sum rules
scheme-dependent on the fitting procedure.

A *smooth mass-number dependence* is the hypothesis that `θ ↦ R_i(x; A, Z, θ)` depends on `A`
through a small number of functions of `A` — typically powers `A^{p}` and `ln A`, with
`Analysis.SpecialFunctions.Pow.Real` and `Analysis.SpecialFunctions.Log.Basic` supplying them. It is
named `SmoothMassNumberDependence` and stated as a hypothesis. Theorem: the hypothesis is
inconsistent with the few-nucleon systems, in the precise sense that a mass-number dependence
smooth in `A` cannot reproduce a deuteron modification that differs in *sign* of its intermediate-`x`
departure from the heavy-nucleus trend. The few-nucleon systems are `LightNuclei`; the content here
is the incompatibility statement and the identification of the mass-number range over which the
smooth parameterisation is assumed to hold.

### 5.2 The forward map

The *forward map* sends a nuclear density model to a finite vector of predicted observables: the
structure-function ratios of §0.5 at a finite set of momentum fractions and scales. It is an
instance of the forward map of `EpsilonEridani.QFT.Scattering.DIS.Inference.Basic`, composed with
the evolution of Layer 4 and the leading-order or higher-order relation of §0.5. Written as an
operator `T` from a function space of initial conditions to `ℝ^n`.

Theorem: `T` is linear in the absolute shape at leading order, bounded, and of finite rank, hence
Fredholm with a kernel of infinite dimension, by
`TauCeti.Analysis.Fredholm.FiniteRank` and `TauCeti.Analysis.Fredholm.Criteria`. The kernel of `T`
is the set of initial conditions indistinguishable by the data, and its infinite-dimensionality is
the statement that finitely many measurements do not determine a function. This is not a defect of
nuclear physics; it is the reason a parameterisation is needed, and stating it as a Fredholm kernel
makes the role of the parameterisation precise: the parameterisation is a finite-dimensional
subspace chosen to intersect `ker T` trivially, and *that* is the condition a parameterisation must
satisfy.

Theorem: with the sum rules of §1.5 imposed, the constrained forward problem is `T` restricted to an
affine subspace, and the relevant kernel is `ker T ∩ V` with `V` the subspace annihilated by the
moment functionals. The sum rules reduce the non-uniqueness by a codimension equal to the number of
independent sum rules imposed, and no more.

### 5.3 Ill-posedness

⚠ Neither Mathlib nor TauCeti has any notion of ill-posedness, and TauCeti has no regularisation
theory. The definitions are made here, in the shape
`TauCeti.Analysis.Fredholm` would want:

- The *continuum forward operator* `T_∞` sends an initial condition to the ratio as a function on a
  momentum-fraction interval, rather than to a finite vector. It is defined as a convolution-type
  integral operator with a continuous kernel on a bounded interval.
- `T_∞` is *compact*, by the standard criterion for integral operators with square-integrable
  kernels; the statement is proved here and recorded as a candidate for upstream.
- The determination problem is *ill-posed* when `T_∞` is compact and injective with dense,
  non-closed range: then `T_∞^{-1}` exists on the range but is unbounded. The theorem to prove is
  that unboundedness, with `TauCeti.Analysis.Fredholm.CompactPerturbation` supplying the stability
  of the Fredholm property under the compact part.

No regularised inverse is constructed and no regularisation parameter is chosen: that is a numerical
matter and §"Scope" excludes it. What is in scope, and proved, is that the inverse is unbounded, so
that any determination reporting an uncertainty must say which finite-dimensional restriction made
the problem bounded.

### 5.4 Identifiability, flavour by flavour

Theorem (**inclusive neutral-current blindness**): at leading order, inclusive neutral-current data
on a nucleus at a single hard scale determine only the charge-weighted combination
`Σ_q e_q² x (f_q^A + f_q̄^A)`. The quark-antiquark separation, the flavour separation beyond that
weighting, and the gluon are all in the kernel of the single-scale forward map. The proof is the
leading-order hard kernel of `EpsilonEridani.QFT.Factorization.DIS.LO` together with the
finite-rank statement of §5.2, and the nuclear case adds nothing to the free-nucleon argument in
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` beyond the nucleus parameter.

Theorem (**the gluon enters only through evolution**): the nuclear gluon density is in the kernel of
the leading-order single-scale forward map, and is determined by the multi-scale map only through
`∂ F_2^A / ∂ ln Q²` as given by Layer 4. Hence the nuclear gluon is constrained by inclusive
nuclear data only to the extent that the data span a range of hard scales at fixed momentum
fraction, and the constraint degrades to nothing as that range shrinks. This is the nuclear form of
`EpsilonEridani.QFT.Scattering.DIS.Inference.Gluon` and is the single most important identifiability
statement in the area, because it is why the Electron-Ion Collider's lever arm in `Q²` at small `x`
is the measurement that matters.

Theorem (**what breaks the degeneracy**): adding data with a different weighting breaks specific
combinations out of the kernel. Charged-current data weight `u` and `d` differently from neutral
current and separate the isovector combination; data at a second hard scale at the same momentum
fraction separates the gluon by the previous theorem. The theorem states, for each added weighting,
which subspace of `ker T` it removes. What the theorem does *not* do is construct the corresponding
cross sections: charged-current nuclear deep-inelastic scattering is
`ElectroweakAndBSM`'s to build, and hadronic-collision constraints are external input.

### 5.5 Positivity as a constraint on a determination

Theorem: positivity of the per-nucleon nuclear densities, `f_i^A ≥ 0`, is the nuclear instance of
`EpsilonEridani.Particles.Parton.PDF.Positivity`, and carries the same scheme caveat from
`.MsbarPositivity`: at leading order it is a property of the distribution, beyond leading order a
property of a scheme.

Theorem (**the ratio's positivity is not the density's**): in the multiplicative parameterisation,
imposing `R_i(x; A, Z, θ) ≥ 0` does not imply `f_i^A ≥ 0`, because the free-nucleon density
multiplying it is itself a determined object that may have negative excursions in a scheme where
positivity is not exact; and conversely imposing `f_i^A ≥ 0` does not bound `R_i` above or below in
any region where `f_i^N` is small. Both constraints must therefore be imposed separately, and the
theorem is the precise statement of the two non-implications with the hypotheses under which each
fails. This is the content of the draft's warning and it is stated as two counterexamples plus the
implications that *do* hold: `f^N > 0` and `R ≥ 0` together give `f^A ≥ 0`.

Multi-flavour form: the matrix of second moments of a multi-flavour nuclear density is positive
semi-definite, in the sense of
`TauCeti.Analysis.PositiveDefinite.Basic` and
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`, and the polarised bound
`|Δf_i^A| ≤ f_i^A` of §3.4 is the two-by-two instance. The parameter-space statement of which
combinations a determination resolves is the eigen-decomposition of the corresponding matrix, via
`TauCeti.Analysis.Matrix.Spectrum`.

### 5.6 The moment-space form of the determination problem

Theorem: in Mellin space the forward map at fixed scale is diagonal in moment index, so determining
the nuclear densities from data at a finite set of momentum fractions is equivalent to a truncated
moment problem for a measure on `(0, A]`. ⚠ No moment problem exists upstream; what is needed is
the finite-moment consistency statement — which non-negative measures on a bounded interval have a
prescribed finite set of moments — and it is built here from
`TauCeti.Probability.Moments.Basic` and `TauCeti.Probability.Moments.Determinacy` for the specific
weights `x^n` that occur, not as a general theory. Theorem: a finite set of moments does not
determine the measure, and the determinacy results bound how much a full moment sequence would; the
gap between the two is the parameterisation dependence of a determination, made precise.

### Examples

- A two-parameter multiplicative model for an isoscalar nucleus with the sum rules imposed exactly,
  as the worked instance of §5.1 and §5.2.
- The explicit kernel element for §5.4: two nuclear density sets with different quark-antiquark
  separation and identical leading-order neutral-current structure functions at one scale.
- The explicit pair for §5.5: a positive ratio with a non-positive density, and a positive density
  with an unbounded ratio.
- Lead-208 with a smooth mass-number parameterisation, and the deuteron, exhibited as the instance
  where `SmoothMassNumberDependence` fails, with the failure localised in momentum fraction.

### Dependencies

Layers 0, 1 and 4; `EpsilonEridani.Particles.Parton.PDF.Model`, `.Positivity` and
`.MsbarPositivity`; `EpsilonEridani.QFT.Scattering.DIS.Inference.Basic`, `.Identifiability`,
`.Gluon`, `.Unfolding` and `.Conjectures`; `EpsilonEridani.QFT.Factorization.DIS.LO`;
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`;
`TauCeti.Analysis.Fredholm.Basic`, `.Criteria`, `.FiniteRank`, `.Index` and `.CompactPerturbation`;
`TauCeti.Probability.Moments.Basic`, `.Covariance` and `.Determinacy`;
`TauCeti.Analysis.PositiveDefinite.Basic`; `TauCeti.Analysis.Matrix.Spectrum`; Mathlib
`Analysis.SpecialFunctions.Pow.Real`, `Analysis.SpecialFunctions.Log.Basic` and
`MeasureTheory.Integral.SetIntegral`. Free-nucleon densities are `InclusiveStructureFunctions`;
few-nucleon systems are `LightNuclei`; charged-current nuclear scattering is `ElectroweakAndBSM`.

---

## Layer 6: Gribov shadowing, the dipole matching, and the nuclear gluon

References: Gribov, Sov. Phys. JETP 29 (1969) 483; Frankfurt, Guzey and Strikman,
Phys. Rept. 512 (2012) 255; Armesto, J. Phys. G 32 (2006) R367; Mueller, Nucl. Phys. B 335 (1990)
115; Kovchegov and Levin, *Quantum Chromodynamics at High Energy*, Cambridge University Press 2012,
Ch. 4 and 8; EIC Yellow Report arXiv:2103.05419 Vol. II §7.3.1 and §7.3.3.

### 6.1 The leading shadowing correction

The *double-scattering*, or Gribov, correction expresses the leading departure of the nuclear
structure function from `A` times the nucleon's in terms of diffractive scattering off a single
nucleon. In the form this roadmap states it:

`δ F_2^{A,(2)}(x, Q²) = - 8π A(A-1)/2 ∫ d²b T_A(b)² ∫_x^{x_{P,max}} dx_P B_{diff}^{-1}
  F_2^{D(4)}(x_P, β, Q², t=0) · C(x_P, b)`,

where `F_2^{D(4)}` is the diffractive structure function of `Diffraction` at momentum transfer zero,
`β = x / x_P`, `B_{diff}` the diffractive slope, `T_A` the thickness function of §0.2, and
`C(x_P, b)` a phase factor from the longitudinal momentum transfer. The roadmap's task is to state
this with every hypothesis named and to prove the structural facts about it, not to compute it.

The hypotheses, each named as a separate predicate:

- `DoubleScatteringOnly`: only the two-nucleon term of the multiple-scattering series is retained.
- `ImaginaryDominance`: the diffractive amplitude is taken as purely imaginary, so the phase factor
  is a cosine and the correction has a definite sign.
- `FactorisedTDependence`: the diffractive amplitude's `t`-dependence is an exponential with slope
  `B_{diff}` independent of `x_P`, `β` and `Q²`.
- `CoherenceCondition`: the longitudinal momentum transfer is small compared with the inverse
  nuclear size, which is the coherence estimate of §2.1 promoted to an explicit hypothesis here,
  where it is genuinely used.
- `NoNuclearCorrelations`: the two-nucleon density factorises into a product of one-nucleon
  densities, which is where `T_A(b)²` comes from and which `LightNuclei` shows is false for the
  lightest nuclei.

Theorems to prove:

1. Under all five hypotheses, `δ F_2^{A,(2)} ≤ 0` pointwise: the double-scattering term is a
   suppression. The sign comes from `ImaginaryDominance` and the non-negativity of the diffractive
   structure function; this is the theorem that connects §2.1's *definition* of shadowing to
   diffraction, and it is the roadmap's central connection result.
2. Under `RadiusCubeRootScaling`, `∫ d²b T_A(b)² ∝ A^{4/3}`, so the double-scattering term scales as
   `A^{4/3}` against the `A` of the impulse term, and the *ratio* `R_{F_2}^A - 1` scales as
   `A^{1/3}`. The mass-number dependence of shadowing at leading order is therefore a geometric
   statement, and this theorem is what makes it one.
3. The correction vanishes as `x` approaches `x_{P,max}`, because the `x_P` integration range
   collapses; so double-scattering shadowing has a right endpoint, and that endpoint is the `x₁` of
   §2.1 computed rather than posited. Proving that this computed endpoint scales as `A^{-1/3}` under
   the coherence hypothesis closes the loop with §2.1's estimate.
4. The correction is expressible through a principal-value dispersion integral over the diffractive
   amplitude, which is where `TauCeti.Analysis.Contour.PerWindow.CPV` enters; this form is what
   makes `ImaginaryDominance` a visible approximation rather than a step in a calculation.

### 6.2 Higher rescatterings: an open problem

The multiple-scattering series beyond the two-nucleon term requires the amplitude for diffractive
scattering off `n` nucleons, which is not measurable and not determined by the diffractive structure
function. The quasi-eikonal and colour-fluctuation prescriptions in the literature each supply a
model for it.

This is named as an **open problem**, not a milestone. What is in scope:

- The series itself as a formal object, with its `n`-th term's mass-number scaling `A^{(n+2)/3}`
  under `RadiusCubeRootScaling`, proved; and the observation that the series is therefore not
  uniformly convergent in `A`, stated with the summability criterion from
  `Topology.Algebra.InfiniteSum.Basic`.
- The statement that `DoubleScatteringOnly` is *not* a controlled approximation for heavy nuclei at
  small momentum fraction, made quantitative by the previous item.
- Each prescription recorded as a named hypothesis that closes the series, together with what it
  implies, and no claim that any of them is derived.

The honest statement is that leading-twist nuclear shadowing is known in terms of measurable
quantities only at the two-nucleon level, and that the extension is model-dependent. This roadmap
proves the two-nucleon level and names the obstruction.

### 6.3 The dipole matching

`SmallXAndSaturation` builds the dipole amplitude and the dipole cross section. Take from it the
nuclear dipole amplitude in the Glauber-Mueller form
`N_A(r, b, Y) = 1 - exp(-(1/2) T_A(b) σ_dip(r, Y))`, with `σ_dip` the dipole-nucleon cross section
and `T_A` this roadmap's thickness function.

Theorem (**the matching**): expanding the Glauber-Mueller exponential to second order in
`T_A σ_dip` and inserting it into the dipole factorisation of the nuclear structure function
reproduces the double-scattering correction of §6.1, provided the dipole cross section is related to
the diffractive structure function by the relation that `Diffraction` and `SmallXAndSaturation`
supply, and provided `CoherenceCondition` and `FactorisedTDependence` hold. The theorem's content is
the second-order matching, stated with the two hypotheses and with the identification of the
dipole-side and diffraction-side inputs as an assumption imported from the two neighbouring
roadmaps, not proved here.

Corollary: the two descriptions of the shadowing region agree at second order in the nuclear
thickness and differ beyond it, and the difference is exactly the higher-rescattering ambiguity of
§6.2 — resummed by the exponential on the dipole side, modelled on the Gribov side. Stating the
disagreement as *the same* open problem seen twice is the useful output.

### 6.4 The saturation scale's mass-number dependence

Take the definition of the saturation scale from `SmallXAndSaturation`. Theorem: in the
Glauber-Mueller form with `RadiusCubeRootScaling`, the nuclear saturation scale at central impact
parameter satisfies `Q_{s,A}²(Y) ∝ A^{1/3} Q_{s,N}²(Y)` up to logarithmic corrections in `A`, the
`A^{1/3}` being the central-thickness scaling of §0.2. This is stated in this roadmap's
per-nucleon variables so that the two roadmaps' statements are comparable, and the logarithmic
corrections are named rather than dropped. Nothing about the *dynamics* of the saturation scale is
claimed here; the theorem is the geometric scaling of a quantity whose definition lives elsewhere.

### 6.5 The nuclear gluon

Collecting the statements that bear on the nuclear gluon density, since it is the object the
Electron-Ion Collider nuclear programme exists to determine:

- It is not constrained by the momentum sum rule individually, only through the flavour sum (§1.2).
- It is in the kernel of the leading-order single-scale inclusive forward map (§5.4).
- It is determined by inclusive data only through the scale derivative of the structure function
  (§5.4), and that determination degrades to nothing as the scale lever arm shrinks.
- Its small-momentum-fraction suppression is related to diffraction off a nucleon at the
  two-nucleon level (§6.1) and to the dipole amplitude's saturation (§6.3), and the two agree at
  second order in the thickness and not beyond.
- Whether it antishadows is not forced by any sum rule in this roadmap (§2.2).

Theorem to prove, collecting these: the nuclear gluon density at small momentum fraction is
determined by inclusive nuclear deep-inelastic data on a bounded kinematic domain only up to an
element of a non-trivial kernel, and the dimension of that kernel is bounded below by an explicit
function of the domain's scale lever arm. This is the roadmap's sharpest statement about what a
measurement can and cannot deliver, and it is the reason the area is worth formalising: the
identifiability statement is a theorem, and a theorem is what a case for a facility should rest on.

### Examples

- Carbon-12 and lead-208 double-scattering corrections with a fixed diffractive input, exhibiting
  the `A^{1/3}` scaling of the ratio's departure from one as the worked instance of §6.1.2.
- The hard-sphere profile, where `∫ d²b T_A(b)²` is computable in closed form, as the certificate of
  that scaling theorem.
- The Glauber-Mueller amplitude expanded to second and third order, with the third-order term
  exhibited as the first place the two descriptions differ.
- A dipole cross section for which the second-order matching holds exactly, constructed as the
  instance of §6.3.

### Dependencies

Layer 0 for the thickness function and its scaling; Layer 1 for the sum rules; Layer 2 for the
definition of shadowing that §6.1 connects to; Layer 4 for the evolution that makes the statements
scale-specific; Layer 5 for the identifiability vocabulary of §6.5;
`EpsilonEridani.QFT.Factorization.Evolution.SmallX` for the small-momentum-fraction evolution;
`EpsilonEridani.QFT.Scattering.DIS.Inference.Gluon` and `.Conjectures`;
`TauCeti.Analysis.Contour.PerWindow.CPV` for the dispersive form; Mathlib
`Topology.Algebra.InfiniteSum.Basic` for the rescattering series,
`Analysis.SpecialFunctions.Exp` for the Glauber-Mueller exponential and
`Analysis.SpecialFunctions.Pow.Real` for the mass-number powers. The diffractive structure function
and its factorisation are `Diffraction`; the dipole amplitude, the dipole cross section and the
saturation scale's definition and dynamics are `SmallXAndSaturation`; the failure of
`NoNuclearCorrelations` for the lightest nuclei is `LightNuclei`.

---

## Dependency graph

```
                    InclusiveStructureFunctions ──┐
                    SpinStructure ────────────────┤
                                                  v
Layer 0  nuclei, coordinate densities, per-nucleon and per-nucleus
         conventions, isospin decomposition, the three ratios
             │
             v
Layer 1  number / baryon / momentum sum rules; crossing theorems
         (momentum-weighted and valence forms); which sum rules
         a determination may impose
             │
             ├──────────────────────────────┐
             v                              v
Layer 2  named regions as properties    Layer 3  support theorem;
         of the ratio; forced                    nucleon convolution
         antishadowing from Layer 1               (hypothesis) and what
             │                                    it proves; polarised
             │                                    nuclear densities
             │                              │        │
             │                              │        └── LightNuclei
             │                              │            (effective
             │  §2.4 FermiRise <────────────┘             polarisations)
             v
Layer 4  target-independent kernel; the difference theorem;
         the ratio evolves; small-x direction (open)
             │                                  ^
             │                                  └── CollinearEvolution
             v                                      (kernels, moments)
Layer 5  parameterisation; forward map as Fredholm; ill-posedness
         (built here); identifiability flavour by flavour; the gluon
         only through evolution; positivity constraints; moment form
             │
             v
Layer 6  Gribov double scattering from diffraction; higher
         rescatterings (open); dipole matching at second order;
         A-dependence of the saturation scale; the nuclear gluon
             ^                      ^
             │                      └── SmallXAndSaturation
             └── Diffraction            (dipole, saturation scale)
                 (diffractive structure function)
```

Layers 2 and 3 are independent of each other except that Layer 3 discharges the `FermiRise`
predicate Layer 2 defines. Everything from Layer 4 onward depends on both.

## Acceptance examples

The roadmap is complete when each of the following is a proved statement in the library, with its
hypotheses explicit and no placeholder witnesses.

1. For a nucleus with `A = Z = 1`, every modification ratio is identically one, and the nuclear sum
   rules of Layer 1 reduce syntactically to the free-nucleon ones.
2. The Woods-Saxon normalising constant exists, is unique and is positive, for every `A > 0`,
   `R_A > 0`, `a > 0`; and `∫ T_A(b) d²b = A`.
3. The per-nucleon and per-nucleus conventions are equivalent: the moment identity of §0.3 holds for
   every integrable weight, and the momentum sum rule reads `= 1` in both.
4. For lead-208 the isoscalar-corrected ratio and the raw structure-function ratio differ, with the
   difference given in closed form by the isospin decomposition of §0.4 under
   `BoundIsospinSymmetry`.
5. The crossing theorem in the form of §1.3: the momentum-weighted average of `R - 1` over `(0, 1]`,
   summed over flavours, is at most zero, with equality if and only if the nuclear densities have no
   support above unit momentum fraction.
6. Forced antishadowing: suppression of the valence ratio on `(0, x₁)` and on `(x₃, 1)` with
   `x₂ ≤ x₃`, plus positivity, implies enhancement on a positive-measure subset of `(x₁, x₂)`, for
   an isoscalar nucleus; and the same statement with the explicit offset for lead-208.
7. The support theorem: `x ≤ A`, proved from the deep-inelastic kinematic bounds with the target
   mass set to `M_A`, and instantiated at the deuteron as `x ≤ 2`.
8. Sum-rule preservation under the nucleon convolution, proved through the multiplicativity of
   Mellin moments, with the two normalisations of `φ_A` as the hypotheses.
9. The Fermi rise: under `ConvolutionRepresentation` with `φ_A` supported above `y = 1` on a set of
   positive measure and `f^N ~ c(1-x)^n`, the ratio diverges as `x → 1⁻`.
10. Polarised positivity `|Δf_i^A| ≤ f_i^A` for every flavour, momentum fraction and scale, at
    leading order, with the scheme caveat stated for higher orders.
11. Target independence: one evolution generator serves every nucleus, so `f^A(Q²) = U f^A(Q₀²)`
    with `U` independent of `A` and `Z`, at leading twist.
12. The difference theorem: `δf^A = f^A - f^N` satisfies the same evolution equation, and
    `δf^A(Q₀²) = 0` implies `δf^A(Q²) = 0` for all `Q²`.
13. The exact scale derivative of the ratio, exhibiting that it is not a convolution of the kernel
    with the ratio; together with the worked counterexample of a ratio evolved as though it were a
    density.
14. The sufficient condition for the small-`x` ratio derivative to be positive, together with a
    counterexample satisfying `Shadowing` for which it is negative — so that the general statement
    stands recorded as an open question and not as a discharged milestone.
15. The forward map is finite-rank and Fredholm, with an infinite-dimensional kernel; and imposing
    `k` independent sum rules reduces the kernel's codimension in the constrained problem by exactly
    `k`.
16. The continuum forward operator is compact, and its inverse on its range is unbounded — the
    ill-posedness statement, defined and proved here because no upstream notion exists.
17. Inclusive neutral-current blindness: two nuclear density sets differing in quark-antiquark
    separation with identical leading-order structure functions at one scale, exhibited explicitly.
18. The gluon enters only through evolution, with a lower bound on the kernel dimension in terms of
    the scale lever arm of the kinematic domain.
19. The two non-implications of §5.5, each with an explicit counterexample, and the implication that
    does hold: `f^N > 0` and `R ≥ 0` give `f^A ≥ 0`.
20. The Gribov double-scattering correction is non-positive under its five named hypotheses, and its
    contribution to `R_{F_2}^A - 1` scales as `A^{1/3}` under `RadiusCubeRootScaling`; with the
    hard-sphere profile as the closed-form certificate.
21. The right endpoint of the double-scattering shadowing region, computed from the collapse of the
    `x_P` integration, scales as `A^{-1/3}` under `CoherenceCondition` — closing the loop with the
    coherence estimate of §2.1.
22. The dipole matching at second order in `T_A σ_dip`, with the third-order term exhibited as the
    first disagreement, and that disagreement identified with the open problem of §6.2.
23. `Q_{s,A}² ∝ A^{1/3} Q_{s,N}²` up to logarithms, with the definition of the saturation scale
    imported from `SmallXAndSaturation`.

## References

- **EIC Yellow Report.** R. Abdul Khalek *et al.*, "Science Requirements and Detector Concepts for
  the Electron-Ion Collider", Nucl. Phys. A 1026 (2022) 122447, arXiv:2103.05419. Volume II,
  Chapter 7, §7.2.5 (light polarised nuclei) and §7.3.3 (nuclear parton distributions).
- J. J. Aubert *et al.* (European Muon Collaboration), "The ratio of the nucleon structure functions
  `F₂ⁿ` for iron and deuterium", Phys. Lett. B 123 (1983) 275. The original observation defining
  the effect of §2.3.
- M. Arneodo, "Nuclear effects in structure functions", Phys. Rept. 240 (1994) 301. The conventions
  in which nuclear ratios are quoted, and the region nomenclature of Layer 2.
- D. F. Geesaman, K. Saito and A. W. Thomas, "The nuclear EMC effect", Ann. Rev. Nucl. Part. Sci. 45
  (1995) 337. The candidate explanations of §2.3, and the argument that none is established.
- N. Armesto, "Nuclear shadowing", J. Phys. G 32 (2006) R367. Survey of the shadowing region and of
  the relation between the Gribov and dipole descriptions.
- V. N. Gribov, "Glauber corrections and the interaction between high-energy hadrons and nuclei",
  Sov. Phys. JETP 29 (1969) 483 [Zh. Eksp. Teor. Fiz. 56 (1969) 892]. The relation of §6.1.
- L. Frankfurt, V. Guzey and M. Strikman, "Leading twist nuclear shadowing phenomena in hard
  processes with nuclei", Phys. Rept. 512 (2012) 255, arXiv:1106.2091. The double-scattering
  correction in the form §6.1 states it, its hypotheses, and the colour-fluctuation closure of the
  higher-rescattering series.
- L. L. Frankfurt and M. I. Strikman, "Hard nuclear processes and microscopic nuclear structure",
  Phys. Rept. 160 (1988) 235. The convolution representation of §3.2 and its limitations.
- S. J. Brodsky and H. J. Lu, "Shadowing and antishadowing of nuclear structure functions",
  Phys. Rev. Lett. 64 (1990) 1342. The sum-rule argument behind §2.2.
- S. A. Kulagin and R. Petti, "Global study of nuclear structure functions", Nucl. Phys. A 765
  (2006) 126, arXiv:hep-ph/0412425. An explicit convolution-based treatment with off-shell
  nucleons, i.e. the first candidate explanation of §2.3 made quantitative.
- K. J. Eskola, P. Paakkinen, H. Paukkunen and C. A. Salgado, "EPPS21: a global QCD analysis of
  nuclear PDFs", Eur. Phys. J. C 82 (2022) 413, arXiv:2112.12462. The determination problem of
  Layer 5 in multiplicative parameterisation, with the sum rules imposed at the initial scale.
- K. Kovařík *et al.*, "nCTEQ15 — Global analysis of nuclear parton distributions with uncertainties
  in the CTEQ framework", Phys. Rev. D 93 (2016) 085037, arXiv:1509.00792. The same problem in
  absolute parameterisation, i.e. the second shape of §5.1.
- R. Abdul Khalek, J. J. Ethier, E. R. Nocera and J. Rojo, "nNNPDF3.0: evidence for a modified
  partonic structure in heavy nuclei", Eur. Phys. J. C 82 (2022) 507, arXiv:2201.12363. A
  determination with a parameterisation chosen to minimise the bias §5.2 identifies.
- H. De Vries, C. W. De Jager and C. De Vries, "Nuclear charge-density-distribution parameters from
  elastic electron scattering", At. Data Nucl. Data Tables 36 (1987) 495. The Woods-Saxon parameters
  of §0.2.
- A. H. Mueller, "Small-x behavior and parton saturation: A QCD model", Nucl. Phys. B 335 (1990)
  115. The Glauber-Mueller form used in §6.3 and §6.4.
- Yu. V. Kovchegov and E. Levin, *Quantum Chromodynamics at High Energy*, Cambridge University Press
  (2012), Chapters 4 and 8. The dipole description of nuclear scattering and the mass-number
  dependence of the saturation scale.
- J. L. Friar, B. F. Gibson, G. L. Payne, A. M. Bernstein and T. E. Chupp, "Neutron polarization in
  polarized ³He targets", Phys. Rev. C 42 (1990) 2310. The effective polarisations of §3.4.
- C. Ciofi degli Atti, S. Scopetta, E. Pace and G. Salmè, "Nuclear effects in deep inelastic
  scattering off polarized ³He and the neutron spin structure function", Phys. Rev. C 48 (1993)
  R968. The polarised convolution of §3.4.
- O. Hen, G. A. Miller, E. Piasetzky and L. B. Weinstein, "Nucleon-nucleon correlations,
  short-lived excitations, and the quarks within", Rev. Mod. Phys. 89 (2017) 045002,
  arXiv:1611.09748. The correlated-pair candidate explanation of §2.3, whose configuration-level
  content is `LightNuclei`'s.

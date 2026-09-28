# Roadmap: the hadron mass, the energy-momentum tensor, and gravitational form factors

Where the mass of a hadron comes from, expressed as the decomposition of the expectation value of
the QCD energy-momentum tensor in a hadron state, and the form factors of that tensor — the
gravitational form factors — which encode the distribution of mass, angular momentum, pressure and
shear inside the hadron.

This roadmap owns the energy-momentum tensor as an object. It builds the operator itself in the
symmetric, gauge-invariant form; the decomposition of its matrix elements into form factors for
spin-zero and spin-half targets; the trace and the trace anomaly, and from them a mass
decomposition in which every term is a matrix element and none is a residual; the mechanical
reading of the stress components as pressure and shear densities, with the stability conditions
that reading suggests and the precise status of each; and the two routes by which the form factors
are reached from data, namely second Mellin moments of generalised parton distributions and
near-threshold heavy quarkonium photoproduction.

Roadmaps that need one of the form factors, in particular the angular-momentum sum rule used by
`SpinStructure` and `GeneralizedPartonDistributions`, cite it here rather than re-deriving it. The
final application is a library in which the sentence "the proton mass is mostly gluon field energy"
is a theorem about named matrix elements at a named scale in a named scheme, with the parts that
are scale-dependent marked as such, rather than a slogan attached to a number.

The roadmap is deliberately asymmetric in confidence. Layers 0 to 2 are field theory and algebra:
conservation, form-factor counting, the anomaly, and the mass sum rule are theorems, and the work
is to state them with the right hypotheses and prove them. Layers 3 and 5 contain the two places
where the physics itself is not settled — whether the Breit-frame densities are densities of
anything, and whether the threshold photoproduction amplitude factorises onto gluon form factors.
Those are carried as explicitly labelled hypotheses and open questions, and no milestone anywhere
in the roadmap is allowed to rest on them.

## Scope

Included:

- The canonical energy-momentum tensor of QCD, the Belinfante improvement to a symmetric
  gauge-invariant tensor, and the proof that the two differ by a total divergence with vanishing
  forward matrix element.
- Conservation of the total tensor, and the separate non-conservation of the quark and gluon parts,
  with the non-conservation exhibited as an operator identity rather than asserted.
- Renormalization of the quark and gluon parts as composite operators that mix, and the finiteness
  and scale-independence of the total.
- The decomposition of off-forward matrix elements in a spin-half target into the gravitational
  form factors `A`, `B`, `C` and, for each part separately, the non-conserved term `Cbar`; the
  counting theorem that says there are no others; and the corresponding spin-zero decomposition.
- The constraints at zero momentum transfer: that the momentum fractions of the parts sum to one
  and their angular momenta to one half, both proved from conservation.
- The dispersion representation of a gravitational form factor and the spectral positivity that
  the representation carries.
- The trace of the tensor, the trace anomaly, and the mass sum rule for a hadron at rest.
- Ji's four-term mass decomposition as the definition, the two-term trace decomposition as a
  theorem, and the three-term Lorcé decomposition as a separate definition related to the first by
  a proved identity.
- The nucleon sigma term as the quark-mass matrix element the decomposition needs, and the
  heavy-quark limit of the anomaly term.
- The static energy-momentum tensor in the Breit frame, the pressure and shear densities, the
  equilibrium equation, the von Laue condition, and the expression of the `D`-term as a second
  moment of the stress.
- The mass radius, the mechanical radius and the scalar radius, each defined so that it is a
  different number from the charge radius, with the relations between them proved.
- Light-front densities in impact-parameter space and the proved relation to the Breit-frame
  densities, with the difference between the two not suppressed.
- Mechanical stability conditions and the negativity of the `D`-term, each carried as a named
  conjecture with what a proof would require.
- Evolution and mixing of the form factors at the second moment, the asymptotic momentum fractions,
  and a precise account of which quantities are scheme-dependent.
- The relation of the form factors to second Mellin moments of generalised parton distributions,
  the Ji sum rule as a corollary, the statement of what exclusive data do and do not determine, and
  the threshold-photoproduction factorisation written down as a hypothesis with its assumptions.

Not included. The generalised parton distributions themselves — their definition, their support
properties, polynomiality, and impact-parameter imaging — belong to
`GeneralizedPartonDistributions`; this roadmap consumes the polynomiality statement and the second
moment, and does not restate them. Splitting kernels, the running coupling, and the anomalous
dimensions of twist-two operators belong to `CollinearEvolution`; this roadmap consumes the
second-moment anomalous-dimension matrix and the beta function and derives nothing about them. The
Jaffe-Manohar decomposition of angular momentum, orbital angular momentum as a Wigner-distribution
observable, and generalised transverse-momentum-dependent distributions belong to
`WignerDistributions`; only the Ji decomposition, which is a statement about the energy-momentum
tensor, is here. The dynamics of heavy quarkonium production — the non-relativistic expansion, the
colour structure, the bound-state wave function — belongs to `QuarkoniaAndExotics`, and the photon
flux and the photoproduction kinematics to `Photoproduction`; this roadmap supplies only the target
side of the hypothesised factorisation. Lattice regularisation, operator improvement on a lattice
and the continuum extrapolation belong to `LatticeBridge`, which consumes the operator definitions
and the renormalization statements proved here. Spin-one targets, the deuteron energy-momentum
tensor and nuclear matrix elements belong to `LightNuclei` and `NuclearMedium`, which cite the
general construction of Layer 0. The parton content of the pion and kaon belongs to
`MesonStructure`; the spin-zero form-factor decomposition and the chiral constraint on a spin-zero
target are here, because they are statements about the tensor. Polarised structure functions and
the helicity sum rule belong to `SpinStructure`, which takes `J_q` from Layer 5 here. Radiative
corrections to the exclusive observables used in Layer 5 belong to `RadiativeCorrections`.

The material belongs under two directories of `EpsilonEridani/`, split along the operator-versus-
state line: the operator content of Layers 0, 2 and 4 in
`EpsilonEridani/QFT/QCD/EnergyMomentumTensor/`, and the hadron-state content of Layers 1, 3 and 5
in `EpsilonEridani/Particles/Hadron/GravitationalFormFactors/`. The split matters because the
first is about QCD and the second about a target; a contributor adding a second target should not
have to touch the operator files.

## Conventions and coordination with upstream

1. **Signature and the momentum-transfer variable.** The metric is `(+,-,-,-)`, matching
   `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions`. Momenta are `p` for the
   incoming and `p'` for the outgoing target, `Δ := p' - p`, `P := (p + p')/2`, and `t := Δ^2 ≤ 0`
   in the physical region. Every form factor in this roadmap is a function of the **positive**
   variable `Q² := -t ≥ 0`, so its argument ranges over the non-negative reals and never over a
   subset of the negatives. The dictionary to the literature, which writes `A(t)` with `t ≤ 0` and integrates
   `∫_{-∞}^{0} dt`, is fixed once in Layer 1 and every transcribed formula goes through it. The
   trap is that a dispersion integral, a slope at the origin and a radius each pick up a sign from
   this choice, and a library that mixes the two conventions produces radii with the wrong sign
   and no error message.
2. **State normalisation.** One-particle states satisfy `⟨p'|p⟩ = 2 E_p (2π)³ δ³(p' - p)`, fixed
   once and carried explicitly in every matrix element. The trap is the factors of `2M` in the mass
   sum rule: with a different normalisation the mass decomposition acquires an overall factor, and
   the resulting numbers are compared with published ones as if they were the same quantity.
3. **Frame.** The Breit frame, in which the target has momenta `p = (E, -Δ/2)` and
   `p' = (E, +Δ/2)` and hence `Δ^0 = 0`, is the frame in which spatial densities are defined. The
   boost used to reach it is the one from
   `EpsilonEridani.Relativity.LorentzGroup.Restricted.FromBoostRotationExtensions`, applied
   explicitly rather than assumed. Light-front densities are a **separate** definition, related to
   the Breit-frame ones by a proved statement in Layer 3 and never used interchangeably with them.
   The trap is that both are called "the density of the proton", they are not equal, and the
   difference is not a small correction.
4. **Labelling of parts.** Every quantity derived from the quark part or the gluon part carries the
   label, as an explicit argument of type `Parton.Species` or its equivalent from
   `EpsilonEridani.Particles.Parton.Basic`. An **unlabelled** tensor or form factor means the
   conserved total. The trap is applying a total-only theorem — conservation, von Laue, the
   vanishing of `Cbar` — to a single part, where it is false.
5. **The non-conserved term is never dropped.** `Cbar_a` is a field of the form-factor data for
   every part, and the theorem `Σ_a Cbar_a Q² = 0` holds for all `Q²`, not only at the origin. The
   trap is a second-moment identity quoted for the quark part alone that is true only for the sum.
6. **Target data are explicit, gauge data are typeclasses.** The target — its mass, its spin, its
   charge — is an explicit `structure Target` argument, so that a spin-zero theorem and a spin-half
   theorem are visibly different statements. Colour and the gauge group arrive through the existing
   typeclass structure of `EpsilonEridani.QFT.QCD.Basic` and
   `EpsilonEridani.QFT.QCD.RepresentationColor`. The trap is a "hadron" theorem that silently
   assumes spin one half because the Dirac spinors were hard-wired into the statement.
7. **Scales and schemes are arguments.** Any quantity that depends on the renormalization scale or
   the scheme takes both as explicit arguments; a quantity written with no scale argument is one
   for which scale-independence has been proved, and the proof is cited at the definition. The trap
   is a mass decomposition whose terms depend on a scale the statement does not mention, presented
   as if it were a decomposition of a physical mass into physical pieces.
8. **One decomposition is the definition.** Ji's four-term decomposition is *the* definition of the
   mass decomposition in this library. The two-term trace decomposition is a theorem about it, and
   Lorcé's three-term decomposition is a separate definition tied to it by a proved identity. The
   trap is that the several decompositions in the literature use the same words — "quark energy",
   "gluon energy" — for different operators, and numbers taken from two of them are routinely added.
9. **Naming.** Form factors are `gff_A`, `gff_B`, `gff_C`, `gff_Cbar`, each a function of `Q²` and
   a part label. `dTerm` is the **number** `4 * gff_C 0` and `dTermFF` the function `Q² ↦ 4 * gff_C
   Q²`; the two never share a name. Densities are `energyDensity`, `pressure`, `shear`, each a
   function of `r : ℝ`, restricted to `0 < r` at every use rather than typed as `ℝ≥0`. The
   equilibrium equation is stated with `deriv` and the von Laue condition with `IntegrableOn ...
   (Set.Ioi 0)`, both of which are `ℝ`-based; typing the fields as `ℝ≥0 → ℝ` would put a
   coercion inside every derivative and integral for no gain, since the guards are needed
   anyway. The trap is the factor of four between `D` and `C`, which is silent in
   every formula in which it is wrong.
10. **Conjectures are propositions, never fields and never hypotheses in disguise.** A conjecture
    is a `def ..._Conjecture : Prop` with a docstring saying it is unproved. A theorem that needs
    it takes it as an explicit hypothesis argument. No `Prop`-valued structure field carries a
    placeholder witness anywhere in this area: such a field asserts nothing while looking like a
    hypothesis, and the audit that found the pattern elsewhere in the library is the reason this
    convention is binding.

## Existing upstream material used by the roadmap

From `EpsilonEridani`:

- `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions` and
  `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` for the metric, index
  contraction and the epsilon identities used in the form-factor counting.
- `EpsilonEridani.Relativity.CliffordAlgebraExtensions` and the Weyl-spinor extension modules
  (`EpsilonEridani.Relativity.Fermions.Weyl.ContractionExtensions`,
  `EpsilonEridani.Relativity.Fermions.Weyl.MetricExtensions`) for the Dirac bilinears in which the
  spin-half decomposition is written.
- `EpsilonEridani.Relativity.LorentzGroup.Restricted.FromBoostRotationExtensions` for the boost to
  the Breit frame.
- `EpsilonEridani.QFT.QCD.Basic` and `EpsilonEridani.QFT.QCD.RepresentationColor` for the field
  content and the colour structure of the operator.
- `EpsilonEridani.QFT.QCD.OneLoopBeta` and `EpsilonEridani.QFT.QCD.OneLoopBetaFromScalars` for the
  beta-function coefficient that appears in the trace anomaly, and
  `EpsilonEridani.QFT.QCD.Renormalization` and `EpsilonEridani.QFT.QCD.OneLoopCounterterms` for the
  renormalization vocabulary in which operator mixing is expressed.
- `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` and
  `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.TensorReduction` for the
  regularisation in which the anomaly is derived and for the tensor reduction of the two-index
  operator insertion.
- `EpsilonEridani.Particles.Parton.GPD.Basic`, `.Moments` and `.Polynomiality` for the second
  Mellin moment and the polynomiality statement that makes it a polynomial in the skewness, and
  `EpsilonEridani.Particles.Parton.GPD.Ambiguity` for the statement of what the moment does not
  determine.
- `EpsilonEridani.QFT.Factorization.Convolution.Mellin` and
  `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` for moment-space evolution, and
  `EpsilonEridani.QFT.Factorization.Scales.Basic` for the scale bookkeeping.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Amplitudes.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Basic` and
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Channels` for the exclusive-production
  kinematics and amplitude vocabulary used in Layer 5.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness` and
  `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` for the statement that the
  extraction problem of Layer 5 has a kernel.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` for the positive-semidefiniteness
  used in the spectral-positivity statement, and
  `EpsilonEridani.Mathematics.Distribution.BasicExtensions` for distributional pairing.

From `TauCeti`:

- `TauCeti.Analysis.Contour.PerWindow.CPV` and
  `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` for the Cauchy principal values in the
  form-factor dispersion integrals.
- `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`,
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.CompleteBernstein` and
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Inversion` for the Stieltjes representation of a
  form factor in terms of its spectral function, and for recovering the spectral function from it.
- `TauCeti.Analysis.PositiveDefinite.AddGroup` and `TauCeti.Analysis.PositiveDefinite.Basic` for
  the positivity of the spatial densities of Layer 3 and for the obstruction to pointwise
  positivity of a quantity defined by a Fourier transform.
- `TauCeti.Analysis.Fredholm.Criteria` and `TauCeti.Analysis.Fredholm.CompactPerturbation` for the
  extraction problem of Layer 5, whose non-uniqueness is a statement about a kernel.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` and `TauCeti.Analysis.Distribution.DuBoisReymond` for
  the weak form of the equilibrium equation and for concluding that a density with vanishing weak
  derivative is constant.
- `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` for the test functions against which the
  densities are paired.
- `TauCeti.MeasureTheory.Integral.Dilation` for the scaling behaviour of the radial integrals.
- `TauCeti.LinearAlgebra.Matrix.Trace.Basic` and `TauCeti.Analysis.InnerProductSpace.Trace` for
  trace vocabulary.
- `TauCeti.Geometry.Convex.Cone.Basic` for the cone of stress profiles that the stability
  conditions of Layer 3 cut out.
- `TauCeti.Probability.Moments.Basic` and `TauCeti.Probability.Moments.VanishingMoments` for moment
  vocabulary and for the statement that a vanishing moment is a constraint rather than a
  normalisation.

From `Mathlib`: `Analysis.Fourier.FourierTransform` and `Analysis.Fourier.Inversion` for the
three-dimensional Fourier transform defining the densities, `Analysis.Distribution.SchwartzSpace`
for the space it acts on, `MeasureTheory.Integral.DivergenceTheorem` for the integration by parts
behind the von Laue condition, `Analysis.Calculus.FDeriv.Basic` and `Analysis.Calculus.Deriv.Basic`
for the slopes that define the radii, `Analysis.InnerProductSpace.Basic`, and
`LinearAlgebra.Matrix.Trace`.

Genuine absences:

- ⚠ **Bessel functions are absent from both Mathlib and TauCeti.** The radial Fourier transform
  that turns `A(Q²)`, `C(Q²)` into `ε(r)`, `p(r)`, `s(r)` is written in the literature with the
  spherical Bessel kernels `j_0` and `j_2`. This roadmap therefore defines the radial transform
  directly as an angular average of the plane-wave kernel, proves the two kernel identities it
  needs from the integral definition, and puts them in the shape Mathlib's
  `Analysis.SpecialFunctions` would want so that they can move upstream later. Layer 3 does not
  wait for a Bessel API and does not assume one.
- ⚠ **There is no spherical-harmonic decomposition and no radial-Fourier machinery** in either
  library. The decomposition of the static stress tensor into its trace part and its traceless
  rank-two part is therefore done by hand, from the explicit tensor basis `r^i r^j / r² - δ^{ij}/3`
  and `δ^{ij}`, with the orthogonality of the two proved.
- ⚠ **`TauCeti.Analysis.PDE` is elliptic theory only** — the Dirichlet problem, Harnack,
  Caccioppoli, maximum principles. It does not apply to the equilibrium equation for `p` and `s`,
  which is a first-order radial system, not an elliptic boundary-value problem. Layer 3 treats that
  equation as a weak identity between distributions using the Sobolev and distribution modules
  named above, and as an ordinary differential relation where the densities are differentiable.
- ⚠ **Neither library has a notion of ill-posedness or of Tikhonov regularisation.** Layer 5's
  statement about what exclusive data do not determine is therefore made as a Fredholm statement —
  a non-trivial kernel and a compact operator — and not as a claim about regularisation, which this
  roadmap does not make.
- ⚠ **Nothing upstream knows about the Belinfante improvement, about composite-operator
  renormalization by mixing, or about the energy-momentum tensor of a gauge theory at all.** All
  three are built here, in Layer 0, in the vocabulary of
  `EpsilonEridani.QFT.QCD.Renormalization`.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Basic` and
  `Physlib.Relativity.Tensors.MetricTensor` for the energy-momentum tensor as a Lorentz tensor
  rather than a tuple of form factors, `Physlib.Relativity.Tensors.Contraction.Basic` for the
  trace, and `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the Breit frame of Layer 3.

## Layer 0: the energy-momentum tensor of QCD as an operator

References: Belinfante (1940), *Physica* 7, 449; Rosenfeld (1940); Callan, Coleman and Jackiw
(1970), *Ann. Phys.* 59, 42; Collins, Duncan and Joglekar (1977), *Phys. Rev. D* 16, 438; Nielsen
(1977), *Nucl. Phys. B* 120, 212; Freedman, Muzinich and Weinberg (1974), *Ann. Phys.* 87, 95.

This layer produces the operator. Nothing in it mentions a hadron state: the objects are the
canonical tensor, the improved tensor, their difference, the quark-gluon split, and the mixing
matrix under renormalization. The reason for doing it first is that almost every confusion in the
subject is a confusion between two different tensors, and the only way to prevent that here is to
have both in the library with a proved relation between them.

### 0.1 The canonical tensor, and why it is not the object

Define the canonical Noether tensor `T_can^{μν}` from the QCD Lagrangian by the standard
translation-invariance construction, using the field content of `EpsilonEridani.QFT.QCD.Basic`.
Prove:

- `T_can` is conserved, `∂_μ T_can^{μν} = 0`, on the equations of motion.
- `T_can` is **not** symmetric, and exhibit the antisymmetric part explicitly as a spin current.
- `T_can` is **not** gauge invariant, and exhibit the gauge variation explicitly.

The point of proving the two negative statements rather than remarking on them is that they are
what forces the improvement, and a contributor who has them as theorems cannot accidentally use
`T_can` in a matrix element.

### 0.2 The symmetric gauge-invariant tensor

Define the Belinfante-improved tensor

- quark part: `T_q^{μν} = (1/2) ψ̄ γ^{(μ} i D^{ν)} ψ`, symmetrised in `(μν)`, with `D^μ` the
  covariant derivative acting symmetrically to left and right, summed over flavours;
- gluon part: `T_g^{μν} = -F^{μα} F^{ν}{}_{α} + (1/4) g^{μν} F^{αβ} F_{αβ}`;
- total: `T^{μν} = T_q^{μν} + T_g^{μν}`.

Theorems:

1. `T^{μν}` is symmetric: `T^{μν} = T^{νμ}`, as an operator identity, with no use of the equations
   of motion.
2. `T^{μν}` is gauge invariant, in the sense that it is built from `F` and from covariant
   derivatives of `ψ` only, proved by exhibiting the transformation.
3. `T^{μν} - T_can^{μν} = ∂_λ B^{λμν}` for an explicit `B` antisymmetric in its first two indices,
   the Belinfante superpotential.
4. Consequently the forward matrix element of the difference vanishes, and the total four-momentum
   `∫ d³x T^{0ν}` agrees for the two tensors. This is the theorem that licenses using the improved
   tensor everywhere afterwards, and it is stated as an equality of charges, not of densities: the
   densities genuinely differ.

### 0.3 Conservation

Prove `∂_μ T^{μν} = 0` from the equations of motion of both the quark and the gluon field, with the
equations of motion appearing as explicit hypotheses. The formalisation should make visible that
this is an on-shell statement: the hypotheses are the Dirac equation in the background field and
the Yang-Mills equation with the quark current as source, and the proof is the cancellation between
the two. Additionally prove that the trace `T^μ{}_μ` is **not** zero, with the classical value
`Σ_q m_q ψ̄_q ψ_q`, deferring the anomalous addition to Layer 2.

### 0.4 The quark-gluon separation and the non-conservation of the parts

State and prove the operator identity

`∂_μ T_q^{μν} = - ∂_μ T_g^{μν} = (an explicit operator built from the quark current and F)`

so that the non-conservation of each part is a named operator, not the absence of a theorem. Two
consequences to prove:

- The parts exchange momentum: the quark and gluon four-momenta are separately not conserved in
  time, and the rate is the operator above.
- This is the reason the parts mix under renormalization and evolution, and the statement is set up
  so that Layer 4 can use it without repeating the algebra.

Also define the projection of the tensor onto its trace part and its traceless part, which
Layer 4 uses, and prove that the projection commutes with the quark-gluon split.

### 0.5 Renormalization and the mixing of the parts

Work in dimensional regularisation, using
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`. Define the renormalized
quark and gluon operators `[T_q]`, `[T_g]` as a linear combination of the bare ones with a `2 × 2`
mixing matrix `Z(μ)`, and prove:

1. The total is not renormalized: the sum `[T_q] + [T_g]` equals the bare sum, so the mixing matrix
   satisfies the two equalities `qq + gq = 0` and `qg + gg = 0`, which express momentum
   conservation without depending on a row-or-column convention. This is the operator statement
   behind the sum rule of Layer 1, and proving it here means the sum rule is not an input.
2. The traceless part and the trace part renormalize separately: the trace does not mix into the
   traceless part. This is what makes the mass decomposition of Layer 2 and the form-factor
   evolution of Layer 4 independent statements.
3. At one loop, identify the mixing matrix with the second-moment anomalous-dimension matrix
   supplied by `CollinearEvolution`, as an equality of two named objects, not as an assertion that
   they are "the same thing".

Where the two-loop mixing matrix is needed it is cited from `CollinearEvolution` and not derived
here; this roadmap derives the one-loop matrix, because the one-loop beta function and counterterm
machinery already exist in `EpsilonEridani.QFT.QCD.OneLoopBeta` and
`EpsilonEridani.QFT.QCD.OneLoopCounterterms`.

### Examples

- The free massive Dirac field: construct `T_can` and `T`, exhibit `B`, and verify conservation and
  the trace by direct computation.
- Free Maxwell theory as the abelian case of the gluon part: verify symmetry, gauge invariance, and
  the vanishing of the trace in four dimensions, and note that the last is special to four
  dimensions by computing the trace in `d` dimensions.
- A scalar field with the improvement term `ξ (g^{μν} ∂² - ∂^μ ∂^ν) φ²`: an example of a tensor
  that is symmetric, gauge invariant and conserved for every `ξ`, showing that "symmetric,
  conserved and gauge invariant" does not determine the tensor. The additional condition that fixes
  the QCD case — that the improvement be a Belinfante superpotential built from the spin current —
  is then stated as a definition rather than discovered later.

### Dependencies

`EpsilonEridani.QFT.QCD.Basic`, `.RepresentationColor`, `.Renormalization`, `.OneLoopBeta`,
`.OneLoopCounterterms`; `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` and
`.TensorReduction`; `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions`;
`EpsilonEridani.Relativity.CliffordAlgebraExtensions`; the second-moment anomalous-dimension matrix
from `CollinearEvolution`.

---

## Layer 1: gravitational form factors

References: Kobzarev and Okun (1962), *Zh. Eksp. Teor. Fiz.* 43, 1904; Pagels (1966), *Phys. Rev.*
144, 1250; Ji (1997), *Phys. Rev. Lett.* 78, 610 and *Phys. Rev. D* 55, 7114; Polyakov and
Schweitzer (2018), *Int. J. Mod. Phys. A* 33, 1830025, arXiv:1805.06596; Cotogno, Lorcé, Lowdon and
Morales (2020), *Phys. Rev. D* 101, 056016, arXiv:1912.08749.

This layer turns the operator of Layer 0 into numbers attached to a target. The whole content is a
decomposition theorem — that the matrix element is a specific finite combination of scalar functions
— plus the constraints those functions satisfy, plus their analytic structure.

### 1.1 Kinematics and the target data

Define `structure Target` carrying the mass `M > 0` and the spin, as explicit data per Convention 6.
Define the off-forward kinematics `p`, `p'`, `Δ`, `P`, `t`, `Q² := -t`, and prove the elementary
constraints: `P · Δ = 0` for an elastic transition, `t ≤ 0` in the physical region, and the
relation of `Q²` to the Breit-frame three-momentum transfer. The physical-region statement is a
theorem about the on-shell conditions and not a hypothesis.

Fix the literature dictionary here, once: a `def ofLiteratureT : (ℝ → ℝ) → (ℝ≥0 → ℝ)` that turns a
function of `t ≤ 0` into a function of `Q² ≥ 0`, with the two lemmas relating derivatives at the
origin and relating `∫_{-∞}^0 dt` to `∫_0^∞ dQ²`. Every formula transcribed from the references
goes through this, which is how Convention 1 is enforced rather than merely stated.

### 1.2 The spin-half decomposition

For a spin-half target, define the gravitational form factors by the decomposition of the matrix
element of each part `a`:

```
⟨p', s'| T_a^{μν} |p, s⟩ = ū(p', s') [ gff_A a Q² · γ^{(μ} P^{ν)}
                                     + gff_B a Q² · P^{(μ} i σ^{ν)α} Δ_α / (2M)
                                     + gff_C a Q² · (Δ^μ Δ^ν - g^{μν} Δ²) / M
                                     + gff_Cbar a Q² · M g^{μν} ] u(p, s)
```

with `(μν)` symmetrisation. The content to prove:

1. **Existence**: every matrix element of `T_a^{μν}` admits such a decomposition, given Lorentz
   covariance, parity, time reversal and hermiticity of the operator. The hypotheses are listed as
   explicit assumptions on the matrix element, so that the theorem can be applied to a model
   amplitude.
2. **Uniqueness**: the four functions are determined by the matrix element. This is the statement
   that makes `gff_A` a definition rather than a parametrisation, and it is proved by exhibiting
   projectors.
3. The four tensor structures are linearly independent as functions of the kinematics — the lemma
   that uniqueness rests on.

Define the derived combinations: the angular-momentum form factor `gff_J a Q² := (gff_A a Q² +
gff_B a Q²) / 2`, and the `D`-term function `dTermFF a Q² := 4 * gff_C a Q²` with `dTerm a :=
dTermFF a 0`.

### 1.3 The counting theorem

Prove that there are exactly four independent form factors for a spin-half target and a
non-conserved symmetric rank-two operator, and exactly three for a conserved one — and that
imposing symmetry is what removes the fifth structure that a general asymmetric tensor would carry.
The counting is done by constructing the space of admissible tensor structures as a finite-
dimensional vector space and computing its dimension, using the epsilon and metric identities of
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`. State explicitly that the
fifth, antisymmetric-tensor form factor is out of scope here because Layer 0 fixed the symmetric
tensor, and that it is the object `WignerDistributions` needs for the Jaffe-Manohar decomposition.

### 1.4 The constraints at zero momentum transfer

These are the theorems that make the form factors physics rather than bookkeeping. Each is proved
from the conservation statement of Layer 0 and the renormalization statement of 0.5, not imposed:

1. **Momentum sum rule**: `Σ_a gff_A a 0 = 1`. Proof from `∂_μ T^{μν} = 0` together with the state
   normalisation of Convention 2.
2. **Angular-momentum sum rule**: `Σ_a gff_J a 0 = 1/2` for a spin-half target, equivalently
   `Σ_a (gff_A a 0 + gff_B a 0) = 1`. Proof from conservation plus the Lorentz generators; the
   spin of the target enters through the `Target` data, so the corresponding spin-zero statement is
   a different theorem and not a special case of this one.
3. **Vanishing of the total non-conserved term**: `Σ_a gff_Cbar a Q² = 0` for all `Q²`, not only at
   the origin. Proof directly from conservation. Corollary: `gff_Cbar q Q² = - gff_Cbar g Q²`.
4. `gff_C` is **not** constrained at the origin by any of the above: the `D`-term is a free
   parameter of the theory, unlike `A(0)` and `J(0)`. This negative statement is proved, in the
   sense that the constraints of items 1 to 3 are shown to leave `gff_C 0` undetermined, and it is
   the reason the `D`-term is interesting and the reason its sign is a conjecture in Layer 3.

### 1.5 The spin-zero target

For a spin-zero target, define the decomposition

```
⟨p'| T_a^{μν} |p⟩ = 2 P^μ P^ν · gff_A a Q²
                  + (Δ^μ Δ^ν - g^{μν} Δ²) / 2 · gff_C a Q²
                  + 2 M² g^{μν} · gff_Cbar a Q²
```

and prove existence and uniqueness as in 1.2, the counting statement — three form factors for a
part, two for the conserved total — and the momentum sum rule. Prove also the relation to the
spin-half case: the spin-zero decomposition is the one obtained from the spin-half structures by
taking the spin-independent projection, so that `gff_A` and `gff_C` mean the same operator matrix
element in both cases while `gff_B` has no spin-zero analogue. The trap this closes is the habit of
quoting "the `D`-term of the pion" and "the `D`-term of the proton" as the same kind of object
without ever saying in what sense.

### 1.6 Analytic structure and spectral positivity

Assume analyticity in `t` with a cut on the positive-`t` axis beginning at the two-particle
threshold — stated as an explicit hypothesis, since it is a property of the full theory that this
roadmap does not prove. Then:

1. Derive the unsubtracted and once-subtracted dispersion representations of `gff_A` and `gff_C` in
   terms of their spectral functions, using the principal values of
   `TauCeti.Analysis.Contour.PerWindow.CPV`.
2. Show that a form factor with a non-negative spectral function is a Stieltjes function of `Q²`,
   using `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` and
   `.CompleteBernstein`, and recover the spectral function from the form factor using
   `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Inversion`.
3. Prove the consequences of that representation which are used later: monotonicity in `Q²`, sign
   of the slope at the origin, and the convergence conditions under which the radius integrals of
   Layer 3 exist.
4. State as a **hypothesis**, clearly labelled, that the spectral function of `gff_C` is of one
   sign. It is not known, and Layer 3's conjecture about the sign of the `D`-term would follow from
   it; recording the implication is useful, and asserting the hypothesis would not be.

### Examples

- A one-particle state of the free massive Dirac field: compute all four form factors explicitly.
  The value of its `D`-term is part of the computation and not an input, and the example is the
  cheapest available check on the projectors of 1.2.
- A model set `{gff_A, gff_B, gff_C, gff_Cbar}` built from multipole functions of `Q²` with the
  constraints of 1.4 imposed: the concrete instance against which the definitions of Layer 3 are
  exercised, and a demonstration that the constraints are consistent.
- A spin-zero target with a Gaussian `gff_A`: compute the dispersion representation and check the
  Stieltjes property of 1.6 directly.
- A two-part split of the model set showing `gff_Cbar q = - gff_Cbar g` explicitly, as an example
  of a quantity that vanishes for the total and not for the parts.

### Dependencies

Layer 0 throughout, in particular 0.3 and 0.5. `EpsilonEridani.Relativity.CliffordAlgebraExtensions`
and the Weyl extension modules; `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`;
`TauCeti.Analysis.Contour.PerWindow.CPV`;
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`, `.CompleteBernstein`, `.Inversion`;
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`.

---

## Layer 2: the trace, the anomaly, and the mass decomposition

References: Collins, Duncan and Joglekar (1977); Nielsen (1977); Shifman, Vainshtein and Zakharov
(1978), *Phys. Lett. B* 78, 443; Ji (1995), *Phys. Rev. Lett.* 74, 1071 and *Phys. Rev. D* 52, 271;
Lorcé (2018), *Eur. Phys. J. C* 78, 120, arXiv:1706.05853; Hatta, Rajan and Tanaka (2018), *JHEP*
12, 008, arXiv:1810.05116; Metz, Pasquini and Rodini (2020), *Phys. Rev. D* 102, 114042,
arXiv:2006.11171; Gao, Peng, Yang et al. for the lattice determinations consumed by `LatticeBridge`.

This layer answers the question the roadmap is named for. The structure of the answer is: the trace
of the tensor is a specific operator, its forward matrix element in a hadron at rest is the mass,
and therefore any splitting of that operator into named pieces is a mass decomposition. The work is
to make each piece a matrix element with a scale and a scheme, and to prove that the pieces sum to
the mass with nothing left over.

### 2.1 The trace and the anomaly

Define the trace operator `Θ := T^μ{}_μ` and prove the anomaly relation

`Θ = (β(g) / 2g) F^{αβ} F_{αβ} + Σ_q (1 + γ_m) m_q ψ̄_q ψ_q`

in dimensional regularisation, with the beta function taken from
`EpsilonEridani.QFT.QCD.OneLoopBeta` and the mass anomalous dimension `γ_m` from
`EpsilonEridani.QFT.QCD.Renormalization`. The formalisation makes three things explicit that prose
accounts often leave implicit:

1. The classical trace is `Σ_q m_q ψ̄_q ψ_q`, proved in Layer 0.3; the anomaly is the *difference*
   between the renormalized trace and the classical one, and is therefore defined only once the
   renormalization scheme is fixed.
2. The `F²` term and the `ψ̄ψ` term are separately scheme-dependent and separately
   scale-dependent; `Θ` is neither, because `T^{μν}` is not renormalized (0.5).
3. In `d = 4 - 2ε` dimensions the tree-level trace already contains an `O(ε)` term multiplying an
   operator with a `1/ε` matrix element, and the anomaly is what survives; a derivation that sets
   `d = 4` first gets zero. State this as the reason the derivation goes through the regularised
   theory.

### 2.2 The mass sum rule

Prove that for a hadron at rest, with the normalisation of Convention 2,

`⟨P| Θ |P⟩ = 2 M²`

and hence `M = ⟨P| Θ |P⟩ / (2M)`. This is the identity every mass decomposition is a rearrangement
of, and it is proved from conservation and the state normalisation, with the rest-frame condition
an explicit hypothesis. Prove also the form-factor version: the forward limit of the trace of the
spin-half decomposition of 1.2 reproduces this, which is the consistency check tying Layers 1 and 2
together. In particular `Σ_a gff_A a 0 = 1` is used here, so that the mass sum rule and the
momentum sum rule are visibly the same conservation statement seen twice.

### 2.3 Ji's four-term decomposition

This is *the* definition of the mass decomposition in the library, per Convention 8. Define the
four operators at scale `μ` in a fixed scheme:

- the quark kinetic and potential energy `H_q`, from the traceless part of `T_q^{00}` in the rest
  frame;
- the gluon field energy `H_g`, from the traceless part of `T_g^{00}`;
- the quark mass term `H_m := Σ_q m_q ψ̄_q ψ_q`;
- the anomaly term `H_a`, from the `F²` piece of `Θ`.

Then, with

- `a μ := Σ_q gff_A q μ 0`, the quark momentum fraction at scale `μ`, and
- `b μ` the dimensionless combination defined by `⟨P| H_m |P⟩ = b μ / (1 + γ_m) · 2 M²`,

prove that

`M = M_q + M_g + M_m + M_a`

with

- `M_q = (3/4) (a - b / (1 + γ_m)) M`,
- `M_g = (3/4) (1 - a) M`,
- `M_m = (b / (1 + γ_m)) M`,
- `M_a = (1/4) (1 - b / (1 + γ_m)) M`.

The four coefficients are to be **derived** from 2.1, 2.2 and the momentum sum rule, not posited;
the check that they sum to `M` identically in `a` and `b` is a separate lemma and is the cheapest
test that the derivation is right. No term is a residual: each of the four is the matrix element of
a named operator, and `M_a` in particular is defined by the `F²` operator and not by subtraction.

State and prove which of the four are scale-dependent: `a` runs, so `M_q` and `M_g` run, and
`M_m + M_a` is scale-independent while neither term separately is. This is the precise version of
the statement that "the gluon fraction of the proton mass" is a scheme-and-scale-dependent number.

### 2.4 The two-term and three-term decompositions

- **Two-term (trace) decomposition.** Prove `M = M_m' + M_a'` where the two terms are the quark-mass
  and anomaly pieces of `Θ` divided by `2M`, and prove the identity relating them to the four-term
  terms of 2.3. This decomposition has the advantage that both terms are scale-independent, and the
  disadvantage that neither is an energy; both facts are theorems here.
- **Three-term decomposition.** Define Lorcé's decomposition into quark and gluon "internal energy"
  plus a pressure term, as a separate definition, and prove the identity that relates it to 2.3.
  Prove in addition the statement that makes the comparison honest: the terms called "quark energy"
  in 2.3 and in this decomposition are matrix elements of different operators, so their numerical
  difference is not an error in either.

### 2.5 The sigma term

Define the nucleon sigma terms `σ_q := m_q ⟨P| ψ̄_q ψ_q |P⟩ / (2M)` and prove:

1. The relation of `b` in 2.3 to `Σ_q σ_q`, so that the quark-mass term of the decomposition is
   expressed in terms of the quantity that lattice computations and chiral analyses actually report.
2. The Feynman-Hellmann relation `σ_q = m_q ∂M / ∂m_q`, as a theorem about the mass as a function
   of the quark masses, with the differentiability an explicit hypothesis. This is the statement
   `LatticeBridge` consumes.
3. Scheme independence of the product `m_q ψ̄_q ψ_q` and hence of `σ_q`, and scheme dependence of
   the two factors separately.

### 2.6 The heavy-quark limit

For a quark of mass much larger than the hadronic scale, prove:

1. The heavy quark's contribution to the momentum fraction `gff_A Q 0` vanishes as an inverse power
   of its mass, with the power stated.
2. Its contribution to the trace does **not** vanish: integrating it out shifts the beta-function
   coefficient in the anomaly term by exactly the amount corresponding to one fewer active flavour.
   This is the precise content of the statement that a heavy quark contributes to the mass through
   the anomaly in a way fixed by the beta function it changes, and it is proved using the matching
   relation for the coupling at a flavour threshold from `CollinearEvolution` together with
   `EpsilonEridani.QFT.QCD.OneLoopBeta`.
3. Consequently the four-term decomposition is *not* invariant under changing the number of active
   flavours, and the transformation of its terms across a threshold is given explicitly.

### Examples

- A free quark field with one flavour: compute `Θ`, verify that the anomaly term is absent at zero
  coupling, and verify the mass sum rule for a free one-particle state.
- The `d`-dimensional trace of the gluon part computed explicitly, exhibiting the `O(ε)` term of
  2.1 item 3, so that the mechanism of the anomaly is visible and not a citation.
- A numerical instance of 2.3: given `a` and `b` as inputs, evaluate the four terms and check that
  they sum to `M`, and evaluate them again at a second scale to exhibit the running of `M_q` and
  `M_g` and the constancy of `M_m + M_a`.
- A three-flavour to four-flavour threshold crossing, exhibiting the redistribution of 2.6 item 3.

### Dependencies

Layer 0 (0.3 for the classical trace, 0.5 for non-renormalization), Layer 1 (1.2 and 1.4 for the
forward limit and the momentum sum rule); `EpsilonEridani.QFT.QCD.OneLoopBeta`,
`.OneLoopBetaFromScalars`, `.Renormalization`;
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`; the beta function and the
flavour-threshold matching from `CollinearEvolution`; `TauCeti.LinearAlgebra.Matrix.Trace.Basic`.

---

## Layer 3: the mechanical picture

References: Polyakov (2003), *Phys. Lett. B* 555, 57, arXiv:hep-ph/0210165; Goeke, Grabis,
Ossmann, Polyakov, Schweitzer, Silva and Urbano (2007), *Phys. Rev. C* 75, 055207; Perevalova,
Polyakov and Schweitzer (2016), *Phys. Rev. D* 94, 054024, arXiv:1607.07008; Polyakov and
Schweitzer (2018), arXiv:1805.06596; Lorcé, Moutarde and Trawiński (2019), *Eur. Phys. J. C* 79,
89, arXiv:1810.09837; Miller (2019), *Phys. Rev. C* 99, 035202, arXiv:1812.02714; Kharzeev (2021),
*Phys. Rev. D* 104, 054015, arXiv:2102.00110; Ji (2021), *Phys. Rev. D* 103, L031501,
arXiv:2102.07830.

This layer reads the spatial components of the tensor as a stress distribution. It is the most
interesting and the least secure layer of the roadmap, and the two facts are related: the
interpretation requires a Fourier transform in a frame, the frame dependence is real, and whether
the resulting functions are densities of anything is an open interpretational question. The layer
is therefore organised so that the *identities* — von Laue, the second-moment expressions for the
`D`-term, the radius formulas — are theorems about the Fourier transforms of the form factors, true
regardless of how one chooses to interpret them, while the interpretation itself is confined to
named hypotheses and a closing subsection of conjectures that nothing else uses.

### 3.1 The static energy-momentum tensor in the Breit frame

Define the radial Fourier transform. Because no Bessel-function API exists upstream, define it
directly: for `f : ℝ≥0 → ℝ` with sufficient decay,

`radialFT f r := (1 / (2π)³) ∫ d³Δ  e^{-i Δ · r} f (|Δ|²)`

and prove the two kernel identities the layer needs — the reduction of the angular integral of the
plane wave to a one-dimensional integral, and the corresponding reduction for the transform
weighted by `Δ^i Δ^j` decomposed into its trace and traceless parts. These are the `j_0` and `j_2`
statements of the literature, proved here from the integral definition, phrased so that they are
statements about an angular average and not about a named special function, and placed in the shape
`Analysis.SpecialFunctions` would want. Existence hypotheses come from the decay conditions of
Layer 1.6; integrability is proved, not assumed.

Then define the static tensor

`T_static a^{μν} (r) := ∫ d³Δ / ((2π)³ 2M) · e^{-i Δ · r} · ⟨p'| T_a^{μν} |p⟩`

in the Breit frame of Convention 3, where `Δ^0 = 0` and the exponent is unambiguous. Prove:

1. `T_static^{00}(r)` is real, and expressible through `radialFT` applied to a combination of
   `gff_A`, `gff_C` and `gff_Cbar` which is written out explicitly.
2. The normalisation `∫ d³r T_static^{00}(r) = M` for the total tensor, from `Σ_a gff_A a 0 = 1` and
   `Σ_a gff_Cbar a 0 = 0`.
3. The spatial part `T_static^{ij}(r)` is symmetric and decomposes uniquely into a trace part and a
   traceless part with respect to the tensor basis `δ^{ij}` and `r^i r^j / r² - δ^{ij}/3`. Prove the
   orthogonality of the two structures under the angular average, since there is no
   spherical-harmonic machinery upstream to appeal to.

State as an explicit hypothesis, and label it as such, the assumption that these Fourier transforms
may be read as densities in position space. Item 3.6 and the open question at the end of 3.7 say
what is wrong with that reading; every theorem in 3.2 to 3.5 is a statement about the transforms
and remains true if the interpretation is rejected.

### 3.2 Pressure and shear

Define `pressure a r` and `shear a r` by

`T_static a^{ij}(r) = shear a r · (r^i r^j / r² - δ^{ij}/3) + pressure a r · δ^{ij}`

and prove that the definition is well-posed, i.e. that the two functions are uniquely determined by
`T_static^{ij}` using 3.1 item 3. Express each explicitly through `radialFT` of `gff_C` and
`gff_Cbar`: the shear comes from the traceless structure of the `C`-term, and the pressure has a
contribution from `gff_C` and, for a part, from `gff_Cbar`. Prove:

1. For the total tensor, `pressure` and `shear` are determined by `gff_C` alone.
2. For a single part, both receive a `gff_Cbar` contribution, which is why the quark pressure and
   the gluon pressure are not separately meaningful in the same way as the total — and why the
   von Laue condition below holds for the total and fails for a part. This is Convention 4 in action.
3. The relation between `pressure` and `energyDensity := T_static^{00}` is not algebraic: they are
   transforms of different combinations of form factors, so there is no equation of state relating
   them pointwise. State this as a negative theorem to forestall the assumption.

### 3.3 The equilibrium equation and the von Laue condition

From `∂_i T_static^{ij}(r) = 0`, which follows from the conservation theorem of Layer 0.3
transported through the Fourier transform, prove:

1. **The equilibrium equation** `(2/3) ∂_r shear r + (2/r) shear r + ∂_r pressure r = 0`, in the
   weak sense using `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, and in the classical sense where the
   densities are differentiable. This is a first-order radial system and not an elliptic
   boundary-value problem, so `TauCeti.Analysis.PDE` does not apply; the weak formulation pairs
   against the test functions of `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff`.
2. **The von Laue condition** `∫_0^∞ dr r² pressure r = 0` for the total tensor, proved from item 1
   by integration by parts with `MeasureTheory.Integral.DivergenceTheorem`, with the decay
   hypotheses that make the boundary term vanish stated explicitly and traced back to Layer 1.6.
3. **A corollary with content**: the pressure must change sign at least once. Prove this from item 2
   together with continuity, using the intermediate-value theorem; and prove that it fails for a
   single part, exhibiting the `gff_Cbar` term that spoils it.
4. The uniqueness statement that makes item 1 usable: a pair `(pressure, shear)` satisfying the
   equilibrium equation with the same `shear` and the same decay agrees, via
   `TauCeti.Analysis.Distribution.DuBoisReymond`. This is what licenses reconstructing the pressure
   from the shear, the operation every model calculation performs.

### 3.4 The `D`-term as a second moment of the stress

Prove the two second-moment expressions for the `D`-term:

1. `dTerm` equals `M` times the second moment of the pressure, `∫ d³r r² pressure r`, up to a
   numerical constant that is to be **derived** from the definitions of 3.1 and 3.2 and not copied
   from a reference.
2. `dTerm` equals `M` times the second moment of the shear, up to a different constant, likewise
   derived.
3. The two expressions are equal, and the ratio of the two constants is fixed by the equilibrium
   equation of 3.3 item 1 — which is the cleanest available consistency check on the whole layer,
   because it ties a Fourier-transform identity to a conservation law.

Because the von Laue condition says the *zeroth* moment of the pressure vanishes while the second
does not, the `D`-term is precisely the leading non-trivial moment of the internal stress; state
this as the reason the layer exists.

### 3.5 Mass, mechanical and scalar radii

Three radii, deliberately three different definitions, all distinct from the charge radius of
`GeneralizedPartonDistributions`:

1. **The mass radius**, defined as the second moment of `energyDensity` normalised to its integral.
   Prove the closed form: it is `6` times the slope of `gff_A` at the origin *plus* a term
   proportional to `dTerm / M²`, whose coefficient is to be derived from 3.1 item 1. The presence
   of the second term is the whole point — a "mass radius" read off from the slope of `A` alone is
   a different quantity, and the difference is not small. Prove that the two agree if and only if
   the `D`-term vanishes.
2. **The mechanical radius**, defined from the combination `(2/3) shear r + pressure r` that the
   equilibrium equation singles out, normalised to its own integral. Prove the closed form
   `⟨r²⟩_mech = 6 · gff_C 0 / ∫_0^∞ dQ² gff_C Q²`, with the sign convention of Convention 1 carried
   through; the literature's version of this formula has `∫_{-∞}^0 dt` and the dictionary of 1.1 is
   what relates them. Prove that the denominator is non-zero under the decay hypotheses of 1.6.
3. **The scalar radius**, defined as the second moment of the transform of the trace form factor
   of Layer 2, i.e. the slope at the origin of the forward-trace form factor. Prove its relation to
   the mass radius: the two differ by a term involving `dTerm`, and the relation is an identity,
   not an approximation. This is the precise version of the disagreement in the literature about
   "the mass radius of the proton": the two published definitions are both well-defined and are
   different numbers, and the roadmap's contribution is the identity between them rather than a
   ruling on which deserves the name.

Prove in addition that none of the three equals the charge radius, by exhibiting the different form
factor each is a slope of.

### 3.6 Light-front densities and the relation to the Breit frame

Define the impact-parameter densities on the light front, as two-dimensional Fourier transforms of
the form factors with respect to the transverse momentum transfer at zero skewness, and prove:

1. The two-dimensional transforms are well-defined under weaker decay hypotheses than the
   three-dimensional ones, and the hypotheses are stated.
2. The relation to the Breit-frame quantities of 3.1: an explicit integral relation, proved, which
   is **not** an equality of densities. Per Convention 3 this relation is the only permitted bridge
   between the two, and the difference is exhibited in the model example below rather than described
   as a relativistic correction.
3. The light-front energy density is not the transform of `gff_A` alone either; write out which
   combination it is.

### 3.7 Stability conditions and the sign of the `D`-term: conjectures

This subsection contains no milestones that can be discharged. It contains named propositions, a
statement of what each would give, and a statement of what proving it would require. Nothing
elsewhere in this roadmap depends on any of them, and any theorem that uses one takes it as an
explicit hypothesis argument per Convention 10.

- **`dTermNegativity_Conjecture`**: `dTerm < 0` for the conserved total tensor of any stable
  hadron. Status: unproved. It holds in every model that has been examined and in every lattice
  determination, and no first-principles argument is known. What a proof would require: a positivity
  condition on the static stress tensor that does not follow from conservation, since Layer 1.4
  item 4 proves that conservation leaves `gff_C 0` free. One sufficient condition is the
  one-sign-spectral-function hypothesis of 1.6 item 4; the implication from that hypothesis to the
  conjecture is a theorem this roadmap proves, which is the honest form of progress available here.
- **`mechanicalStability_Conjecture`**: `(2/3) shear r + pressure r ≥ 0` pointwise. Status:
  unproved, and stronger than the von Laue condition, which is a theorem. It is the condition under
  which the mechanical radius of 3.5 item 2 is a radius of a non-negative distribution rather than
  a ratio of integrals. Formalise the set of `(pressure, shear)` profiles it cuts out as a convex
  cone using `TauCeti.Geometry.Convex.Cone.Basic`, and prove that the cone is preserved by the
  equilibrium equation — a real theorem about the conjecture that does not assert it.
- **`localEnergyPositivity_Conjecture`**: `energyDensity r ≥ 0` pointwise. Status: unproved, and
  known to be *false* for some light-front and Breit-frame definitions of energy density in
  field-theoretic models. Because `energyDensity` is defined by a Fourier transform,
  `TauCeti.Analysis.PositiveDefinite.AddGroup` supplies the relevant obstruction: pointwise
  positivity of a transform is not implied by any condition this roadmap can impose on the form
  factors, and the roadmap states the obstruction rather than the conjecture.

**Open question, recorded and not scheduled.** Whether the Breit-frame functions of 3.1 are
densities of a localised object at all is not settled. A hadron cannot be localised to better than
its Compton wavelength, the Breit-frame transform integrates over momenta for which the
non-relativistic reading fails, and the phase-space construction of Lorcé, Moutarde and Trawiński
and the criticism of Miller are two positions on what the functions mean. This roadmap therefore
proves identities about the transforms and provides the relation of 3.6, and does not claim that
either set of functions is *the* internal structure of the hadron. No later layer uses such a claim.

### Examples

- A static perfect-fluid ball with a specified pressure profile: verify the equilibrium equation,
  verify von Laue, exhibit the sign change of 3.3 item 3, compute `dTerm` both ways as a check on
  3.4, and compute all three radii of 3.5. This is the example in which every formula in the layer
  is checkable by hand, and it should be built first.
- The model form-factor set of Layer 1: compute `energyDensity`, `pressure`, `shear`, the three
  radii, and both light-front densities; exhibit numerically that the Breit-frame and light-front
  energy densities differ, and verify the integral relation of 3.6 item 2 between them.
- A part-only computation showing that von Laue fails for the quark part alone, with the
  `gff_Cbar` term that breaks it identified.
- A model set with `dTerm = 0`: verify that the mass radius and the `A`-slope radius coincide,
  confirming 3.5 item 1, and that the mechanical radius is undefined, confirming that the
  non-vanishing of the denominator is a genuine hypothesis and not a technicality.

### Dependencies

Layer 0.3 (conservation), Layer 1 (1.2, 1.4, 1.5, 1.6), Layer 2 (2.1, 2.2 for the trace form
factor of 3.5 item 3). `Mathlib.Analysis.Fourier.FourierTransform`, `.Inversion`,
`Mathlib.Analysis.Distribution.SchwartzSpace`, `Mathlib.MeasureTheory.Integral.DivergenceTheorem`,
`Mathlib.Analysis.Calculus.Deriv.Basic`; `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`,
`TauCeti.Analysis.Distribution.DuBoisReymond`, `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff`,
`TauCeti.Analysis.PositiveDefinite.AddGroup`, `TauCeti.Geometry.Convex.Cone.Basic`,
`TauCeti.MeasureTheory.Integral.Dilation`;
`EpsilonEridani.Relativity.LorentzGroup.Restricted.FromBoostRotationExtensions`;
`EpsilonEridani.Mathematics.Distribution.BasicExtensions`. The radial-transform kernels of 3.1 are
built inside this layer because Bessel functions are absent upstream.

---

## Layer 4: scale dependence, mixing, and what is scheme-dependent

References: Ji (1995); Tarrach (1982), *Nucl. Phys. B* 196, 45; Hatta, Rajan and Tanaka (2018);
Tanaka (2018), *JHEP* 01, 120, arXiv:1811.07879; Lorcé (2018); Polyakov and Schweitzer (2018) §3.

Layers 1 to 3 treat the form factors at a fixed scale. This layer says how they move, and is short
because it is almost entirely an application of material owned by `CollinearEvolution` to the
initial conditions owned here. Its purpose is that no statement anywhere else in the roadmap is
allowed to omit a scale it depends on.

### 4.1 The second-moment mixing matrix

Take the `2 × 2` second-moment anomalous-dimension matrix from `CollinearEvolution`, and the
identification with the operator mixing matrix proved in Layer 0.5. Prove:

1. `gff_A q μ 0` and `gff_A g μ 0` satisfy a coupled linear evolution equation in `log μ²`, and the
   equation is the abstract Cauchy problem of `TauCeti.Analysis.Semigroups.CauchyProblem.Basic`
   with the generator built from that matrix. Existence and uniqueness of the solution are taken
   from `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness` and `TauCeti.Analysis.Semigroups.Generator`
   and are **not** reproved: this is the standing rule that an evolution equation is a semigroup.
2. The sum `gff_A q μ 0 + gff_A g μ 0` is constant in `μ`, recovering Layer 1.4 item 1 at every
   scale. This is the compatibility theorem between the sum rule and the evolution, and it is the
   check that the matrix from `CollinearEvolution` satisfies the momentum-conservation equalities
   Layer 0.5 proved it must satisfy.

### 4.2 The asymptotic momentum fractions

Prove that as `μ → ∞` the momentum fractions approach fixed values determined by the mixing matrix
alone: the gluon fraction tends to `16 / (16 + 3 n_f)` and the quark fraction to
`3 n_f / (16 + 3 n_f)`, for `n_f` active flavours. The proof is the spectral decomposition of the
`2 × 2` matrix — its zero eigenvalue is the conserved direction of 4.1 item 2 and the corresponding
eigenvector is the asymptotic ratio — using `TauCeti.Analysis.Matrix.Spectrum`. State explicitly
that this is a statement about the leading-order matrix, and that the corresponding
next-to-leading-order statement requires the two-loop matrix from `CollinearEvolution`.

### 4.3 Evolution of the `C` and `Cbar` form factors

Prove:

1. `gff_C q μ Q²` and `gff_C g μ Q²` mix under evolution with the same matrix as `gff_A`, at each
   fixed `Q²`, because both are second moments of the same twist-two operators. Their sum is
   therefore `μ`-independent, which is the statement that the total `D`-term is a physical,
   scale-independent number and each part's `D`-term is not.
2. The asymptotic ratio of `gff_C g` to `gff_C q` is the same as that of the momentum fractions, by
   4.2.
3. `gff_Cbar q μ Q² = - gff_Cbar g μ Q²` at every scale, which is Layer 1.4 item 3 promoted to a
   statement about the evolution, and is proved from it rather than re-derived.

### 4.4 What is scheme-dependent

Prove or state precisely, with each item carrying its own proof or its own explicit hypothesis:

1. `gff_A a 0` depends on the scheme at next-to-leading order and beyond; the total does not.
2. The total `dTerm` is scheme- and scale-independent; the quark and gluon `D`-terms are neither.
3. In Layer 2's decomposition, `M_m + M_a` is scale-independent and scheme-independent, `M_q` and
   `M_g` are both, and the split of `M_a` from `M_m` depends on the definition of `γ_m`.
4. The three radii of Layer 3.5 are defined from the total form factors and are therefore
   scheme-independent; a "quark mass radius" is not, and the roadmap does not define one.

### Examples

- Solve the `2 × 2` leading-order system explicitly for three flavours, from a given initial
  condition at a given scale, and verify 4.1 item 2 and the limit of 4.2 numerically.
- Exhibit a quark `D`-term that changes sign between two scales while the total is constant,
  demonstrating 4.3 item 1 concretely and closing the trap of quoting "the quark `D`-term" with no
  scale.

### Dependencies

Layer 0.5, Layer 1.4, Layer 2.3. The anomalous-dimension matrix, the running coupling and the
flavour-threshold matching from `CollinearEvolution`;
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` and
`EpsilonEridani.QFT.Factorization.Scales.Basic`; `TauCeti.Analysis.Semigroups.Defs`, `.Generator`,
`.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness`; `TauCeti.Analysis.Matrix.Spectrum`.

---

## Layer 5: access through measurement

References: Ji (1997), *Phys. Rev. Lett.* 78, 610; Diehl (2003), *Phys. Rep.* 388, 41; Kharzeev
(1996), *Proc. Enrico Fermi School* 130, 105, arXiv:nucl-th/9601029; Kharzeev, Satz, Syamtomov and
Zinovjev (1999), *Eur. Phys. J. C* 9, 459; Hatta and Yang (2018), *Phys. Rev. D* 98, 074003,
arXiv:1808.02163; Guo, Ji and Liu (2021), *Phys. Rev. D* 103, 096010, arXiv:2103.11506; Duran et al.
(2023), *Nature* 615, 813 (the J/ψ-007 measurement); Gryniuk and Vanderhaeghen (2016), *Phys. Rev.
D* 94, 074001; Burkert, Elouadrhiri and Girod (2018), *Nature* 557, 396, together with the
subsequent extraction-uncertainty literature.

Layers 1 to 4 are about an operator and its matrix elements. This layer is about the two ways those
matrix elements are reached from cross sections, and about the honest statement of what each way
determines. It is the layer most likely to be misread as more secure than it is, so each subsection
ends with what it does not give.

### 5.1 Second Mellin moments of the generalised distributions

Take from `GeneralizedPartonDistributions` the definitions of `H_a(x, ξ, t)` and `E_a(x, ξ, t)` and
the polynomiality theorem, and from `EpsilonEridani.Particles.Parton.GPD.Moments` the moment
machinery. Prove the second-moment relations

- `∫_{-1}^{1} dx  x H_a(x, ξ, t) = gff_A a Q² + 4 ξ² gff_C a Q²`,
- `∫_{-1}^{1} dx  x E_a(x, ξ, t) = gff_B a Q² - 4 ξ² gff_C a Q²`,

for each part `a`, with `Q² = -t` per Convention 1. The proof is the matching of the local
twist-two operator whose matrix element defines the moment against the decomposition of Layer 1.2;
polynomiality is what guarantees that the right-hand sides are polynomials of degree two in `ξ` and
so that no further form factor can appear. Prove the two corollaries that make the relations usable:

1. The sum `∫ dx x (H_a + E_a)` is independent of `ξ`, since the `gff_C` terms cancel. This is the
   statement that makes the Ji sum rule a statement about a physical quantity and not about a
   particular skewness.
2. The `ξ²` coefficient isolates `gff_C a`, so the `D`-term is in principle reachable from the
   skewness dependence of the second moment — and the "in principle" is discharged in 5.3.

For a spin-zero target the corresponding statement uses the spin-zero decomposition of 1.5, with
`gff_B` absent; prove it separately, since `MesonStructure` needs it in that form.

### 5.2 The Ji sum rule

Prove, as a corollary of 5.1 and Layer 1.4 item 2:

`J_a = (1/2) ∫_{-1}^{1} dx  x [ H_a(x, ξ, 0) + E_a(x, ξ, 0) ]`,

independent of `ξ`, with `Σ_a J_a = 1/2` for a spin-half target. State the hypotheses honestly: the
sum rule requires the forward limit of the moment to exist, which is a convergence condition on the
distributions at `x → 0` that is a hypothesis here and a property proved in
`GeneralizedPartonDistributions`. This is the statement `SpinStructure` cites for the quark and
gluon total angular momenta; it does not decompose `J_q` into spin and orbital pieces, and the
decomposition that does is `WignerDistributions`.

### 5.3 What exclusive data determine, and what they do not

This subsection is a negative result, and it is a milestone because the negative result is a
theorem. Deeply virtual Compton scattering measures Compton form factors, which are convolutions of
the generalised distributions against a hard kernel at fixed `ξ` — the objects of
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Convolution.Basic` and
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVCS.Basic`. Prove:

1. The map from a generalised distribution to the Compton form factors at leading order and fixed
   `ξ` is a compact integral operator with a non-trivial kernel. This is a Fredholm statement, made
   with `TauCeti.Analysis.Fredholm.Criteria` and `TauCeti.Analysis.Fredholm.CompactPerturbation`,
   and it is the same statement as the deconvolution result of
   `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness` and the shadow-distribution
   ambiguity of `EpsilonEridani.Particles.Parton.GPD.Ambiguity`, cited and not reproved.
2. Consequently the second moments of 5.1 are **not** determined by leading-order Compton form
   factor data at a single `ξ` without further input; exhibit the kernel elements that change the
   moment while leaving the Compton form factors unchanged, or cite them from
   `GeneralizedPartonDistributions` where they are constructed.
3. What does determine them: state precisely the additional information that closes the kernel —
   evolution over a range of scales, which acts non-trivially on the kernel directions, together
   with the sum rules of Layer 1.4 as constraints. Prove the reduction of the identifiable subspace
   under those constraints, in the vocabulary of
   `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`.

This roadmap makes **no** claim about regularisation of the inverse problem; neither Mathlib nor
TauCeti has a notion of ill-posedness or of Tikhonov regularisation, and the statements above are
kernel statements, which is what can be said without one.

### 5.4 Near-threshold heavy quarkonium photoproduction as a hypothesis

The second route to the gluon form factors is near-threshold photoproduction of a heavy quarkonium.
The link from the amplitude to the gluon gravitational form factors is a **hypothesis**, and this
subsection's milestone is to write it down with all of its assumptions explicit, together with the
theorems that hold given it, and not to assert it.

Define the process kinematics using
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic` and the amplitude vocabulary of
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Amplitudes.Basic` and
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Basic`, with the channel content from
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Channels`. Then:

1. Define `thresholdFactorization_Hypothesis` as a `Prop`: that in the near-threshold region the
   amplitude is, to leading order in an expansion whose parameter is named, proportional to a
   specified combination of `gff_A g` and `gff_C g` evaluated at the momentum transfer of the
   process. The assumptions are listed as separate hypotheses of the proposition, each named: that
   the quarkonium is small compared with the target, that the non-relativistic expansion of its
   bound state applies, that the operator product expansion at threshold is dominated by the
   two-index gluon operator, and that higher-twist and quark-exchange contributions are suppressed
   by a stated power.
2. Prove what follows **given** the hypothesis: the differential cross section's `t`-dependence is
   determined by the gluon form factors, and the extraction of `gff_A g` and `dTerm g` from a
   measured `t`-slope is a well-posed finite-dimensional fit within a stated model family. The
   theorem takes the hypothesis as an explicit argument.
3. Prove what does **not** follow: the hypothesis does not determine the anomaly term `M_a` of
   Layer 2.3, because that term involves the full trace including quark contributions, and the
   threshold amplitude is assumed to be gluon-dominated. The widespread description of these
   measurements as measuring "the proton's mass radius" or "the trace anomaly" therefore requires
   the additional assumption that the quark contribution is negligible, and that assumption is a
   named separate hypothesis here, not part of the first.
4. State as an **open question** whether the hypothesis holds: the expansion parameter at the
   charm threshold is not small, different implementations — holographic, two-gluon-exchange, and
   generalised-distribution-based — give extractions that differ by more than their quoted
   uncertainties, and no proof or disproof is available. Record it and schedule nothing on it.

The production dynamics — the non-relativistic bound state, the colour structure, the short-distance
coefficients — belong to `QuarkoniaAndExotics`, and the photon flux and photoproduction kinematics
to `Photoproduction`. This roadmap supplies only the target side of the hypothesised factorisation
and the statement of what it would buy.

### 5.5 The lattice route and the operator definitions it consumes

Lattice determinations compute the forward and off-forward matrix elements of the operators of
Layer 0 directly. What this roadmap owes `LatticeBridge` is a precise specification, and what it
takes back is nothing:

1. The renormalized operators `[T_q]`, `[T_g]` of Layer 0.5 with their mixing matrix, in a form in
   which a lattice scheme can be matched to the continuum one.
2. The sigma-term relation of Layer 2.5 item 2, which is how the quark-mass term is computed.
3. The sum rules of Layer 1.4 as checks that any set of lattice matrix elements must satisfy, stated
   as a decidable predicate on a set of numbers so that they can be applied to a table of lattice
   results.

`LatticeBridge` owns the discretisation, the improvement and the continuum limit; none of that is
here.

### Examples

- Verify 5.1 on the double-distribution model of
  `EpsilonEridani.Particles.Parton.GPD.DoubleDistribution`: compute the second moment explicitly
  and read off `gff_A`, `gff_B`, `gff_C`, and check the `ξ`-independence of 5.1 corollary 1.
- Verify the Ji sum rule on the same model, and check `Σ_a J_a = 1/2` after adding a gluon
  contribution constructed to satisfy the momentum sum rule.
- Exhibit, for that model, a kernel element from 5.3 item 1 which changes `gff_C q` while leaving
  the leading-order Compton form factors at a fixed `ξ` unchanged — the concrete form of the
  negative result.
- A model threshold amplitude built to satisfy `thresholdFactorization_Hypothesis` by
  construction, and the fit of 5.4 item 2 performed on it, so that the *conditional* content of the
  hypothesis is exercised without the hypothesis being assumed anywhere else.

### Dependencies

Layers 1 and 2 throughout, Layer 4 for the scales. `GeneralizedPartonDistributions` for the
distributions, polynomiality, the forward-limit convergence and the shadow-distribution
construction; `CollinearEvolution` for the evolution used in 5.3 item 3; `QuarkoniaAndExotics` and
`Photoproduction` for the production side of 5.4; `LatticeBridge` as a consumer of 5.5;
`SpinStructure` as a consumer of 5.2. Upstream: `EpsilonEridani.Particles.Parton.GPD.Moments`,
`.Polynomiality`, `.Ambiguity`, `.DoubleDistribution`;
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`;
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Convolution.Basic`, `.DVCS.Basic`,
`.Deconvolution.Uniqueness`, `.Kinematics.Basic`, `.Amplitudes.Basic`, `.DVMP.Basic`,
`.DVMP.Channels`; `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`;
`TauCeti.Analysis.Fredholm.Criteria`, `.CompactPerturbation`; `TauCeti.Probability.Moments.Basic`,
`.VanishingMoments`.

---

## Dependency graph

```
                Layer 0: the operator
       (canonical, Belinfante, conservation, mixing)
                          |
              +-----------+-----------+
              |                       |
   Layer 1: form factors      Layer 2: trace, anomaly,
   (decomposition, sum           mass decomposition
    rules, dispersion)         (needs 1.4 momentum sum rule)
              |                       |
              +-----------+-----------+
                          |
              +-----------+-----------+
              |                       |
   Layer 3: mechanical        Layer 4: scale, mixing,
   (Breit frame, p and s,        scheme dependence
    von Laue, radii,          (needs 0.5, 1.4, 2.3)
    conjectures)
              |                       |
              +-----------+-----------+
                          |
                Layer 5: access
      (second moments, Ji sum rule, what data
       do not give, threshold hypothesis, lattice)
```

External edges, all incoming except where noted:

- from `CollinearEvolution`: the beta function, the running coupling, the second-moment
  anomalous-dimension matrix, and flavour-threshold matching — used in 0.5, 2.1, 2.6, 4.1, 4.2;
- from `GeneralizedPartonDistributions`: the distributions themselves, polynomiality, the
  forward-limit convergence, and the shadow-distribution construction — used in 5.1, 5.2, 5.3;
- from `QuarkoniaAndExotics` and `Photoproduction`: the production side of 5.4;
- outgoing to `SpinStructure`: `J_q` and `J_g` from 5.2;
- outgoing to `GeneralizedPartonDistributions`: the form-factor targets of the second moments;
- outgoing to `LatticeBridge`: the operator and renormalization specification of 5.5;
- outgoing to `LightNuclei` and `NuclearMedium`: the Layer 0 construction, for other targets;
- outgoing to `MesonStructure`: the spin-zero decomposition of 1.5 and the spin-zero second-moment
  relation of 5.1;
- boundary with `WignerDistributions`: the fifth, antisymmetric form factor and the Jaffe-Manohar
  decomposition are theirs; the counting theorem of 1.3 says so explicitly.

## Acceptance examples

The roadmap is complete when each of the following is a theorem in the library, with no `sorry`
and no unstated hypothesis:

1. `T^{μν}` as defined in 0.2 is symmetric and differs from the canonical tensor by the divergence
   of an explicit antisymmetric superpotential, and the two give the same total four-momentum.
2. `∂_μ T^{μν} = 0` given the equations of motion, and `∂_μ T_q^{μν}` equals an explicitly named
   non-zero operator.
3. `[T_q] + [T_g]` is not renormalized, and the one-loop mixing matrix equals the second-moment
   anomalous-dimension matrix of `CollinearEvolution`.
4. The spin-half matrix element admits the four-form-factor decomposition, the four functions are
   unique, and there is no fifth structure for a symmetric tensor.
5. `Σ_a gff_A a 0 = 1` and `Σ_a gff_J a 0 = 1/2`, both proved from conservation; and `gff_C 0` is
   not determined by those constraints.
6. `Σ_a gff_Cbar a Q² = 0` for all `Q²`.
7. The anomaly relation of 2.1, and `⟨P| Θ |P⟩ = 2 M²` for a hadron at rest.
8. Ji's four terms sum to `M` identically in `a` and `b`, with the four coefficients derived; and
   `M_m + M_a` is scale-independent while `M_q` and `M_g` are not.
9. `σ_q = m_q ∂M / ∂m_q` under a stated differentiability hypothesis.
10. The equilibrium equation in the weak sense, and `∫_0^∞ dr r² pressure r = 0` for the total, with
    the corollary that the pressure changes sign, and a counterexample showing both fail for a part.
11. The two second-moment expressions for `dTerm` agree, with both numerical constants derived and
    their ratio fixed by the equilibrium equation.
12. `⟨r²⟩_mech = 6 gff_C 0 / ∫_0^∞ dQ² gff_C Q²`, and the mass radius equals `6` times the slope of
    `gff_A` at the origin plus the derived `dTerm / M²` term, the two agreeing exactly when
    `dTerm = 0`.
13. The integral relation between the Breit-frame and light-front densities, together with the
    model computation exhibiting that they differ.
14. `dTermNegativity_Conjecture` and `mechanicalStability_Conjecture` exist as propositions with
    docstrings recording that they are unproved, no theorem in the library assumes either
    implicitly, and the implication from the one-sign-spectral-function hypothesis of 1.6 to the
    first is proved.
15. The momentum fractions evolve as a semigroup whose generator is the mixing matrix, their sum is
    constant, and the gluon fraction tends to `16 / (16 + 3 n_f)`.
16. The total `dTerm` is scale-independent and each part's is not, exhibited on a model.
17. `∫ dx x H_a = gff_A a + 4 ξ² gff_C a` and `∫ dx x E_a = gff_B a - 4 ξ² gff_C a`, and the Ji sum
    rule as a corollary with its convergence hypothesis explicit.
18. The Compton-form-factor map is compact with non-trivial kernel, and a kernel element is
    exhibited on the double-distribution model that moves `gff_C q` without moving the data.
19. `thresholdFactorization_Hypothesis` exists as a proposition with its four assumptions as named
    hypotheses; the conditional extraction theorem of 5.4 item 2 is proved from it; and the
    statement of 5.4 item 3 — that it does not determine `M_a` — is proved.
20. The sum rules of Layer 1.4 are available as a decidable predicate on a table of numbers, so that
    `LatticeBridge` can apply them.

## References

- F. J. Belinfante, "On the current and the density of the electric charge, the energy, the linear
  momentum and the angular momentum of arbitrary fields", *Physica* **7** (1940) 449.
- L. Rosenfeld, "Sur le tenseur d'impulsion-énergie", *Mém. Acad. Roy. Belg.* **18** (1940) 1.
- I. Yu. Kobzarev and L. B. Okun, "Gravitational interaction of fermions", *Zh. Eksp. Teor. Fiz.*
  **43** (1962) 1904; *Sov. Phys. JETP* **16** (1963) 1343.
- H. Pagels, "Energy-momentum structure form factors of particles", *Phys. Rev.* **144** (1966) 1250.
- C. G. Callan, S. Coleman and R. Jackiw, "A new improved energy-momentum tensor", *Ann. Phys.*
  **59** (1970) 42.
- D. Z. Freedman, I. J. Muzinich and E. J. Weinberg, "On the energy-momentum tensor in gauge field
  theories", *Ann. Phys.* **87** (1974) 95.
- J. C. Collins, A. Duncan and S. D. Joglekar, "Trace and dilatation anomalies in gauge theories",
  *Phys. Rev. D* **16** (1977) 438.
- N. K. Nielsen, "The energy-momentum tensor in a non-abelian quark gluon theory", *Nucl. Phys. B*
  **120** (1977) 212.
- M. A. Shifman, A. I. Vainshtein and V. I. Zakharov, "Remarks on Higgs boson interactions with
  nucleons", *Phys. Lett. B* **78** (1978) 443.
- R. Tarrach, "The renormalization of `FF`", *Nucl. Phys. B* **196** (1982) 45.
- X. Ji, "QCD analysis of the mass structure of the nucleon", *Phys. Rev. Lett.* **74** (1995) 1071,
  arXiv:hep-ph/9410274; and "Breakup of hadron masses and the energy-momentum tensor of QCD",
  *Phys. Rev. D* **52** (1995) 271, arXiv:hep-ph/9502213.
- X. Ji, "Gauge-invariant decomposition of nucleon spin", *Phys. Rev. Lett.* **78** (1997) 610,
  arXiv:hep-ph/9603249; and "Off-forward parton distributions", *Phys. Rev. D* **55** (1997) 7114,
  arXiv:hep-ph/9609381.
- D. Kharzeev, "Quarkonium interactions in hadronic matter", *Proc. Int. School of Physics Enrico
  Fermi* **130** (1996) 105, arXiv:nucl-th/9601029.
- D. Kharzeev, H. Satz, A. Syamtomov and G. Zinovjev, "J/ψ photoproduction and the gluon structure
  of the nucleon", *Eur. Phys. J. C* **9** (1999) 459, arXiv:hep-ph/9901375.
- M. Diehl, "Generalized parton distributions", *Phys. Rep.* **388** (2003) 41,
  arXiv:hep-ph/0307382.
- M. V. Polyakov, "Generalized parton distributions and strong forces inside nucleons and nuclei",
  *Phys. Lett. B* **555** (2003) 57, arXiv:hep-ph/0210165.
- K. Goeke, J. Grabis, J. Ossmann, M. V. Polyakov, P. Schweitzer, A. Silva and D. Urbano,
  "Nucleon form factors of the energy-momentum tensor in the chiral quark-soliton model",
  *Phys. Rev. C* **75** (2007) 055207, arXiv:hep-ph/0702031.
- O. V. Selyugin and O. V. Teryaev, "Generalized parton distributions and the description of
  electromagnetic and gravitational form factors of the nucleon", *Phys. Rev. D* **79** (2009)
  033003, arXiv:0901.1786.
- O. V. Gryniuk and M. Vanderhaeghen, "Accessing the real part of the forward J/ψ-p scattering
  amplitude from J/ψ photoproduction on protons around threshold", *Phys. Rev. D* **94** (2016)
  074001, arXiv:1608.08205.
- I. A. Perevalova, M. V. Polyakov and P. Schweitzer, "On LHCb pentaquarks as a baryon-ψ(2S) bound
  state: prediction of isospin-3/2 pentaquarks with hidden charm", *Phys. Rev. D* **94** (2016)
  054024, arXiv:1607.07008 — for the `D`-term negativity discussion.
- C. Lorcé, "On the hadron mass decomposition", *Eur. Phys. J. C* **78** (2018) 120,
  arXiv:1706.05853.
- V. D. Burkert, L. Elouadrhiri and F. X. Girod, "The pressure distribution inside the proton",
  *Nature* **557** (2018) 396.
- M. V. Polyakov and P. Schweitzer, "Forces inside hadrons: pressure, surface tension, mechanical
  radius, and all that", *Int. J. Mod. Phys. A* **33** (2018) 1830025, arXiv:1805.06596.
- Y. Hatta and D. L. Yang, "Holographic J/ψ production near threshold and the proton mass problem",
  *Phys. Rev. D* **98** (2018) 074003, arXiv:1808.02163.
- Y. Hatta, A. Rajan and K. Tanaka, "Quark and gluon contributions to the QCD trace anomaly",
  *JHEP* **12** (2018) 008, arXiv:1810.05116.
- K. Tanaka, "Operator relations for gravitational form factors of a spin-0 hadron", *JHEP* **01**
  (2019) 120, arXiv:1811.07879.
- C. Lorcé, H. Moutarde and A. P. Trawiński, "Revisiting the mechanical properties of the nucleon",
  *Eur. Phys. J. C* **79** (2019) 89, arXiv:1810.09837.
- G. A. Miller, "Defining the proton radius: a unified treatment", *Phys. Rev. C* **99** (2019)
  035202, arXiv:1812.02714.
- C. Cotogno, C. Lorcé, P. Lowdon and M. Morales, "Covariant multipole expansion of local currents
  for massive states of any spin", *Phys. Rev. D* **101** (2020) 056016, arXiv:1912.08749.
- A. Metz, B. Pasquini and S. Rodini, "Gravitational form factors and the hadron mass
  decomposition", *Phys. Rev. D* **102** (2020) 114042, arXiv:2006.11171.
- D. E. Kharzeev, "Mass radius of the proton", *Phys. Rev. D* **104** (2021) 054015,
  arXiv:2102.00110.
- X. Ji, "Proton mass decomposition: naturalness and interpretations", *Phys. Rev. D* **103** (2021)
  L031501, arXiv:2102.07830.
- Y. Guo, X. Ji and Y. Liu, "QCD analysis of near-threshold photon-proton production of heavy
  quarkonium", *Phys. Rev. D* **103** (2021) 096010, arXiv:2103.11506.
- B. Duran et al., "Determining the gluonic gravitational form factors of the proton", *Nature*
  **615** (2023) 813, arXiv:2207.05212.
- R. Abdul Khalek et al., "Science requirements and detector concepts for the Electron-Ion
  Collider: EIC Yellow Report", *Nucl. Phys. A* **1026** (2022) 122447, arXiv:2103.05419 —
  Volume II, Section 7.1.4, "Origin of the hadron mass", is the subsection this roadmap covers.

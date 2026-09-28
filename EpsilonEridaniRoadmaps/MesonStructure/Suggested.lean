import EpsilonEridani

/-!
# MesonStructure: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Three design choices are made explicit below. A pseudoscalar meson is a `structure` of explicit
data over a flavour type, never a typeclass, so that the flavour relations of Layer 1 can compare
two mesons built over the same flavour type. Symmetry relations take the breaking parameters as
data and their vanishing as a hypothesis, so no relation is stated as an approximate equality. The
three momentum fractions of Convention 2 stay distinct: `u` for a quark in a distribution
amplitude, `x` for a parton in a meson, `xi` for a meson in a nucleon.

An opaque `Prop` argument marks a hypothesis whose form is fixed elsewhere — parity of the current,
the upstream evolution statement, the regularisation of the triangle. It weakens the theorem and
makes the dependency visible, rather than inventing an upstream name for it. `sorry` marks a
roadmap obligation. No `Prop`-valued field below is discharged by a placeholder witness: each is a
hypothesis its construction genuinely takes as input.

The Gegenbauer polynomials of index `3/2` are absent from both Mathlib and TauCeti, which carry the
Chebyshev and Hermite families only. They appear here as roadmap targets in the shape of
`TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev`, and are the one piece of pure
mathematics this roadmap owes.
-/

namespace EpsilonEridaniRoadmaps.MesonStructure

/-! ## Layer 0: the spin-zero target -/

/-- The parity-odd antisymmetric structure of a spin-zero hadronic tensor vanishes for
electromagnetic exchange: `epsStructure` is the Levi-Civita contraction with the target momentum and
the momentum transfer. Layer 0.1. -/
theorem epsCoeff_eq_zero_of_spinZero
    {V : Type} [AddCommGroup V] [Module ℝ V]
    (g : LinearMap.BilinForm ℝ V)
    (K : EpsilonEridani.QFT.Scattering.DIS.Kinematics.DisKinematics V)
    (W : LinearMap.BilinForm ℝ V)
    (hW : EpsilonEridani.QFT.Scattering.DIS.Tensors.Hadronic.Assumptions g K W)
    (epsStructure : LinearMap.BilinForm ℝ V) (c : ℝ)
    (hEps : ∀ v w : V, W v w = c * epsStructure v w + W w v)
    (isParityEven : Prop) (hParity : isParityEven) : c = 0 := by
  sorry

/-- The two structure functions of a spin-zero target are unique: the transverse metric and the
rank-one form built from the transverse target momentum are independent. Layer 0.2. -/
theorem f1f2_unique
    {V : Type} [AddCommGroup V] [Module ℝ V]
    (g : LinearMap.BilinForm ℝ V)
    (K : EpsilonEridani.QFT.Scattering.DIS.Kinematics.DisKinematics V)
    (W : LinearMap.BilinForm ℝ V) (F1 F2 F1' F2' : ℝ)
    (h : EpsilonEridani.QFT.Scattering.DIS.Tensors.Hadronic.IsF1F2Decomposition g K W F1 F2)
    (h' : EpsilonEridani.QFT.Scattering.DIS.Tensors.Hadronic.IsF1F2Decomposition g K W F1' F2')
    (hQ2 : g K.q K.q ≠ 0) : F1 = F1' ∧ F2 = F2' := by
  sorry

/-! ## Layer 1: parton densities of the pion and kaon -/

/-- A pseudoscalar meson as explicit data: mass, decay constant in the convention
`<0|qbar gamma^mu gamma_5 q|M(P)> = i f_M P^mu`, charge in units of the positron charge, and the
valence flavour pair. Convention 1, Layer 1.1. -/
structure PseudoscalarMeson (Flavor : Type) where
  /-- The meson mass. -/
  mass : ℝ
  /-- The decay constant, in the convention of Convention 3. -/
  decayConstant : ℝ
  /-- The electric charge in units of the positron charge. -/
  charge : ℝ
  /-- The valence quark flavour. -/
  valenceQuark : Flavor
  /-- The valence antiquark flavour. -/
  valenceAntiquark : Flavor
  /-- Masses are positive; the chiral limit is a limit of a family, not an instance. -/
  mass_pos : 0 < mass
  /-- Positive, because Layers 3 and 4 divide by it. -/
  decayConstant_pos : 0 < decayConstant

/-- Flavour-symmetry breaking carried as data, so that the relations of 1.3 and 1.4 are
conditionals on its vanishing rather than approximate equalities. Layer 1.1. -/
structure FlavorBreaking where
  /-- The light quark mass difference; its vanishing is the isospin limit. -/
  isospin : ℝ
  /-- The strange-to-light mass difference; vanishing with `isospin` is the SU(3) limit. -/
  strange : ℝ

/-- The isospin limit. -/
def FlavorBreaking.IsIsospinLimit (b : FlavorBreaking) : Prop := b.isospin = 0

/-- The SU(3) flavour limit. -/
def FlavorBreaking.IsSU3Limit (b : FlavorBreaking) : Prop := b.isospin = 0 ∧ b.strange = 0

/-- The valence normalisation, against the upstream Mellin moment so that the sum-rule interface of
`EpsilonEridani.Particles.Parton.PDF.Basic` applies unchanged. Layer 1.2. -/
def ValenceNormalised {Flavor : Type} (M : PseudoscalarMeson Flavor)
    (conj : Flavor → Flavor) (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor) (Q2 : ℝ) : Prop :=
  EpsilonEridani.Particles.Parton.PDF.mellinMoment f 0 M.valenceQuark Q2
    - EpsilonEridani.Particles.Parton.PDF.mellinMoment f 0 (conj M.valenceQuark) Q2 = 1

/-- In the isospin limit the up density in the positive pion equals the down-antiquark density, at
every fraction and scale. Layer 1.3. -/
theorem pion_isospin_relation {Flavor : Type}
    (b : FlavorBreaking) (hb : b.IsIsospinLimit) (piPlus : PseudoscalarMeson Flavor)
    (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor)
    (hf : EpsilonEridani.Particles.Parton.PDF.Assumptions f) (conj : Flavor → Flavor) :
    ∀ x Q2 : ℝ, f piPlus.valenceQuark x Q2 = f (conj piPlus.valenceAntiquark) x Q2 := by
  sorry

/-- The converse fails: the relation can hold at one scale with the breaking parameter non-zero, so
a fitted equality is not evidence of a symmetry. Layer 1.3. -/
theorem isospin_relation_not_sufficient {Flavor : Type} [Inhabited Flavor] :
    ∃ (b : FlavorBreaking) (piPlus : PseudoscalarMeson Flavor)
      (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor) (Q2 : ℝ) (conj : Flavor → Flavor),
      EpsilonEridani.Particles.Parton.PDF.Assumptions f ∧ ¬ b.IsIsospinLimit ∧
        ∀ x : ℝ, f piPlus.valenceQuark x Q2 = f (conj piPlus.valenceAntiquark) x Q2 := by
  sorry

/-- Scale independence of the valence sum rule. The evolution is `CollinearEvolution`, entering as
the opaque hypothesis `evolvesByDglap`; this is the meson instance. Layer 1.5. -/
theorem valenceNormalised_scale_invariant {Flavor : Type}
    (M : PseudoscalarMeson Flavor) (conj : Flavor → Flavor)
    (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor)
    (hf : EpsilonEridani.Particles.Parton.PDF.Assumptions f)
    (evolvesByDglap : Prop) (hEv : evolvesByDglap) (Q2 Q2' : ℝ) (hQ2 : 0 < Q2) (hQ2' : 0 < Q2')
    (h : ValenceNormalised M conj f Q2) : ValenceNormalised M conj f Q2' := by
  sorry

/-! ## Layer 2: light-cone distribution amplitudes and ERBL evolution -/

/-- A leading-twist light-cone distribution amplitude of the quark fraction `u` and the scale. The
decay constant is carried separately by Convention 4 and does not appear here. Layer 2.1. -/
structure DistributionAmplitude where
  /-- The amplitude as a function of the light-cone fraction and the scale. -/
  toFun : ℝ → ℝ → ℝ
  /-- Support in the unit interval. -/
  support : ∀ u Q2 : ℝ, (u < 0 ∨ 1 < u) → toFun u Q2 = 0
  /-- Unit integral at every scale. -/
  normalised : ∀ Q2 : ℝ, (∫ u in Set.Icc (0 : ℝ) 1, toFun u Q2) = 1
  /-- Integrability, which the Gegenbauer coefficients of 2.2 require. -/
  integrable : ∀ Q2 : ℝ, MeasureTheory.Integrable fun u : ℝ => toFun u Q2

/-- Reflection of the fraction about one half: a theorem for the pion in the isospin limit and for
the neutral pion from charge conjugation alone, a hypothesis in general. Layer 2.1. -/
def DistributionAmplitude.IsReflectionInvariant (φ : DistributionAmplitude) : Prop :=
  ∀ u Q2 : ℝ, φ.toFun u Q2 = φ.toFun (1 - u) Q2

/-- The asymptotic amplitude: the unique unit-integral zero mode of the ERBL operator. Layer 2.4. -/
noncomputable def asymptoticAmplitude : DistributionAmplitude where
  toFun u _ := if 0 ≤ u ∧ u ≤ 1 then 6 * u * (1 - u) else 0
  support := by sorry
  normalised := by sorry
  integrable := by sorry

/-- The Gegenbauer polynomials of index `3/2`, by three-term recurrence. Absent from Mathlib and
TauCeti; built here in the shape of TauCeti's Chebyshev family. Layer 2.2. -/
noncomputable def gegenbauer : ℕ → Polynomial ℝ
  | 0 => 1
  | 1 => 3 * Polynomial.X
  | (n + 2) => sorry

/-- Orthogonality for the weight `1 - y^2` on `[-1, 1]`. Layer 2.2. -/
theorem gegenbauer_orthogonal {m n : ℕ} (h : m ≠ n) :
    (∫ y in Set.Icc (-1 : ℝ) 1,
      (1 - y ^ 2) * (gegenbauer m).eval y * (gegenbauer n).eval y) = 0 := by
  sorry

/-- Completeness, in the form that carries the content: a weighted-square-integrable function
orthogonal to every member is null in the weighted space. This is the one step of 2.2 with no
Chebyshev proof to copy, the Chebyshev argument going through the cosine substitution. -/
theorem gegenbauer_total {f : ℝ → ℝ}
    (hf : MeasureTheory.IntegrableOn (fun y : ℝ => (1 - y ^ 2) * f y ^ 2) (Set.Icc (-1 : ℝ) 1))
    (h : ∀ n : ℕ,
      (∫ y in Set.Icc (-1 : ℝ) 1, (1 - y ^ 2) * f y * (gegenbauer n).eval y) = 0) :
    (∫ y in Set.Icc (-1 : ℝ) 1, (1 - y ^ 2) * f y ^ 2) = 0 := by
  sorry

/-- The ERBL kernel, with the plus-prescription endpoint subtraction explicit. Layer 2.3. -/
noncomputable def erblKernel : ℝ → ℝ → ℝ := sorry

/-- The plus prescription is what makes the unit normalisation scale-independent: the kernel
annihilates the total integral. Dissipativity and the exhibition of the kernel as a generator in the
sense of `TauCeti.Analysis.Semigroups.Generator` are stated in `README.md` 2.3 and not restated
here, the generator bundle's shape being fixed upstream. -/
theorem erblKernel_conserves_normalisation (f : ℝ → ℝ)
    (hf : MeasureTheory.IntegrableOn f (Set.Icc (0 : ℝ) 1)) :
    (∫ u in Set.Icc (0 : ℝ) 1, ∫ v in Set.Icc (0 : ℝ) 1, erblKernel u v * f v) = 0 := by
  sorry

/-- The anomalous dimension attached to Gegenbauer degree `n`. Layer 2.4. -/
noncomputable def anomalousDimension : ℕ → ℝ := sorry

/-- The zeroth anomalous dimension vanishes and the rest are positive and increasing. The vanishing
is what makes the normalisation conserved; the positivity is what the asymptotic limit needs.
Layer 2.4, item 2. -/
theorem anomalousDimension_zero_and_strictMono :
    anomalousDimension 0 = 0 ∧ (∀ n : ℕ, 0 < anomalousDimension (n + 1)) ∧
      ∀ n : ℕ, anomalousDimension (n + 1) < anomalousDimension (n + 2) := by
  sorry

/-- Uniqueness of the zero mode. The companion convergence statement, in the weighted norm and not
pointwise, is stated in `README.md` 2.4. -/
theorem asymptoticAmplitude_unique_zero_mode (φ : DistributionAmplitude)
    (h : ∀ u Q2 : ℝ, (∫ v in Set.Icc (0 : ℝ) 1, erblKernel u v * φ.toFun v Q2) = 0) :
    ∀ u Q2 : ℝ, φ.toFun u Q2 = asymptoticAmplitude.toFun u Q2 := by
  sorry

/-- The inverse first moment: the only functional of the amplitude that the asymptotic form factor
of 3.4 and the transition form factor of 4.3 depend on. Finiteness is a hypothesis, the flat
amplitude making it divergent. -/
noncomputable def inverseFirstMoment (φ : DistributionAmplitude) (Q2 : ℝ) : ℝ :=
  ∫ u in Set.Icc (0 : ℝ) 1, φ.toFun u Q2 / u

/-- The inverse first moment of the asymptotic amplitude is three. Layer 2.4, item 5. -/
theorem inverseFirstMoment_asymptotic (Q2 : ℝ) :
    inverseFirstMoment asymptoticAmplitude Q2 = 3 := by
  sorry

/-- The ERBL kernel is the generalised-distribution kernel restricted to the region where the
momentum fraction is smaller in modulus than the skewness, transported by `x = (2u - 1) * xi`. The
kernel on the other side is owned by `GeneralizedPartonDistributions` and enters as the opaque
hypothesis `isGpdEvolutionKernel`. Layer 2.5. -/
theorem erbl_eq_gpd_kernel_on_erbl_region
    (gpdKernel : ℝ → ℝ → ℝ → ℝ) (isGpdEvolutionKernel : Prop) (hker : isGpdEvolutionKernel)
    (xi : ℝ) (hxi : 0 < xi) :
    ∀ u v : ℝ, u ∈ Set.Icc (0 : ℝ) 1 → v ∈ Set.Icc (0 : ℝ) 1 →
      erblKernel u v = 2 * xi * gpdKernel ((2 * u - 1) * xi) ((2 * v - 1) * xi) xi := by
  sorry

/-! ## Layer 3: the electromagnetic form factor -/

/-- The elastic electromagnetic form factor of a spin-zero hadron: one scalar function of the
invariant momentum transfer `t`, negative in the spacelike region. Layer 3.1. -/
structure ElasticFormFactor {Flavor : Type} (M : PseudoscalarMeson Flavor) where
  /-- The form factor as a function of the invariant momentum transfer. -/
  toFun : ℝ → ℝ
  /-- Charge normalisation at zero momentum transfer. -/
  normalised : toFun 0 = M.charge

/-- The charge radius squared, in the sign convention of Convention 6. Differentiability at zero is
a hypothesis, discharged by the spectral representation of 3.3. Layer 3.2. -/
noncomputable def chargeRadiusSq {Flavor : Type} {M : PseudoscalarMeson Flavor}
    (F : ElasticFormFactor M) : ℝ := 6 * deriv F.toFun 0

/-- Hard-scattering factorisation as an explicit hypothesis on the data. Not a theorem here or
anywhere in this collection. Layer 3.4. -/
structure IsHardFactorised {Flavor : Type} {M : PseudoscalarMeson Flavor}
    (F : ElasticFormFactor M) (φ : DistributionAmplitude) : Type where
  /-- The hard kernel at the order the statement holds to. -/
  hardKernel : ℝ → ℝ → ℝ
  /-- The remainder, power-suppressed in the momentum transfer. -/
  remainder : ℝ → ℝ
  /-- The convolution identity the hypothesis asserts. -/
  identity : ∀ t : ℝ, t < 0 → F.toFun t =
    (∫ u in Set.Icc (0 : ℝ) 1, ∫ v in Set.Icc (0 : ℝ) 1,
      φ.toFun u (-t) * hardKernel u v * φ.toFun v (-t)) + remainder t

/-- The asymptotic form factor. The coefficient `16 * pi / 9` for the charged pion is derived from
`hardKernel` in the convention of Convention 3, not quoted. Layer 3.4, items 3 and 4.

The running coupling is divided out rather than evaluated at zero: `alphaS 0` is the coupling at
vanishing scale, where perturbation theory does not apply and where a one-loop `alphaS` is not
even finite. The asymptotic statement is that `(-t) F(t) / α_s(-t)` tends to the constant. -/
theorem asymptotic_form_factor {Flavor : Type} {M : PseudoscalarMeson Flavor}
    (F : ElasticFormFactor M) (φ : DistributionAmplitude)
    (hFact : IsHardFactorised F φ) (alphaS : ℝ → ℝ) :
    Filter.Tendsto (fun t : ℝ => (-t) * F.toFun t / alphaS (-t)) Filter.atBot
      (nhds ((16 * Real.pi / 9) * M.decayConstant ^ 2 *
        (inverseFirstMoment φ 0) ^ 2)) := by
  sorry

/-- The convolution diverges for an amplitude that does not vanish at the endpoints, which is why
endpoint integrability is a hypothesis of the asymptotic formula. Layer 3.4, item 2. -/
theorem flat_amplitude_inverseMoment_not_integrable :
    ∃ φ : DistributionAmplitude, ∀ Q2 : ℝ,
      ¬ MeasureTheory.IntegrableOn (fun u : ℝ => φ.toFun u Q2 / u) (Set.Icc (0 : ℝ) 1) := by
  sorry

/-! ## Layer 4: the two-photon transition form factor -/

/-- The two-photon transition form factor, multiplying the Levi-Civita structure that Layer 0
excluded for the elastic tensor. Layer 4.1. -/
structure TransitionFormFactor {Flavor : Type} (M : PseudoscalarMeson Flavor) where
  /-- The form factor as a function of the two photon virtualities. -/
  toFun : ℝ → ℝ → ℝ

/-- The anomaly value at vanishing virtualities, from the one-loop triangle. The regularisation is a
hypothesis: no scheme-independence theorem is available upstream and none is claimed. Layer 4.2. -/
theorem transition_anomaly_value {Flavor : Type} {M : PseudoscalarMeson Flavor}
    (F : TransitionFormFactor M) (chargeFactor : ℝ) (regularisation : Prop)
    (hReg : regularisation) :
    F.toFun 0 0 = chargeFactor / (4 * Real.pi ^ 2 * M.decayConstant) := by
  sorry

/-- The large-virtuality limit at one photon on shell, linear in the amplitude: twice the decay
constant for the asymptotic amplitude. Layer 4.3. -/
theorem transition_asymptotic {Flavor : Type} {M : PseudoscalarMeson Flavor}
    (F : TransitionFormFactor M) (φ : DistributionAmplitude) (factorisation : Prop)
    (hFact : factorisation) :
    Filter.Tendsto (fun Q2 : ℝ => Q2 * F.toFun Q2 0) Filter.atTop
      (nhds (2 / 3 * M.decayConstant * inverseFirstMoment φ 0)) := by
  sorry

/-! ## Layer 5: chiral constraints -/

/-- A chiral family: meson data as a function of a non-negative quark mass parameter, together with
the condensate. The Gell-Mann-Oakes-Renner relation is a statement about the family, not about any
one member. Layer 5.1. -/
structure ChiralFamily (Flavor : Type) where
  /-- The meson data at each quark mass parameter. -/
  meson : ℝ → PseudoscalarMeson Flavor
  /-- The chiral condensate. -/
  condensate : ℝ
  /-- The decay constant in the chiral limit. -/
  decayConstantAtZero : ℝ
  /-- The chiral limit exists, with a non-vanishing decay constant there. -/
  hasChiralLimit : Filter.Tendsto (fun m : ℝ => (meson m).decayConstant)
    (nhdsWithin 0 (Set.Ioi 0)) (nhds decayConstantAtZero) ∧ decayConstantAtZero ≠ 0

/-- The Gell-Mann-Oakes-Renner relation in its exact form: a derivative at the chiral point, not an
equation between numbers. Layer 5.1. -/
theorem gmor {Flavor : Type} (C : ChiralFamily Flavor) :
    deriv (fun m : ℝ => (C.meson m).mass ^ 2) 0 =
      -2 * C.condensate / C.decayConstantAtZero ^ 2 := by
  sorry

/-- The quoted first-order form is not implied at positive quark mass: two families with the same
derivative at zero can differ at any fixed positive mass. The trap theorem of 5.1. -/
theorem gmor_quoted_form_fails_at_positive_mass {Flavor : Type} [Inhabited Flavor] :
    ∃ (C D : ChiralFamily Flavor) (m : ℝ), 0 < m ∧
      deriv (fun m : ℝ => (C.meson m).mass ^ 2) 0
        = deriv (fun m : ℝ => (D.meson m).mass ^ 2) 0 ∧
      (C.meson m).mass ≠ (D.meson m).mass := by
  sorry

/-- The twist-three normalisation left free in 2.6, fixed by the soft-pion theorem, has a finite
non-zero chiral limit even though the mass squared vanishes there. Layer 5.2, item 2. -/
theorem twistThree_normalisation_chiral_limit {Flavor : Type} (C : ChiralFamily Flavor)
    (quarkMassSum : ℝ → ℝ) (hSum : ∀ m : ℝ, 0 < m → 0 < quarkMassSum m) :
    Filter.Tendsto (fun m : ℝ => (C.meson m).mass ^ 2 / quarkMassSum m)
      (nhdsWithin 0 (Set.Ioi 0)) (nhds (-2 * C.condensate / C.decayConstantAtZero ^ 2)) := by
  sorry

/-! ## Layer 6: the Sullivan process -/

/-- The meson flux, as one named object. No theorem after this definition produces a statement about
meson structure from a cross section without the flux in its statement. Layer 6.2, Convention 10. -/
structure MesonFlux where
  /-- The flux as a function of the meson momentum fraction `xi` and the momentum transfer `t`. -/
  toFun : ℝ → ℝ → ℝ
  /-- Non-negativity. -/
  nonneg : ∀ xi t : ℝ, 0 ≤ toFun xi t
  /-- Support in the physical domain of the meson fraction. -/
  support : ∀ xi t : ℝ, (xi < 0 ∨ 1 < xi) → toFun xi t = 0
  /-- Integrability in the momentum transfer at fixed meson fraction. -/
  integrable : ∀ xi : ℝ, MeasureTheory.Integrable fun t : ℝ => toFun xi t

/-- On-shell only. Convention 2 reserves `x = xBj / xi` for the Layer 6 theorem, which carries the
momentum-transfer correction; this definition is the on-shell limit of that relation, and the
name says so. -/
noncomputable def partonFractionInMesonOnShell (xBj xi : ℝ) : ℝ := xBj / xi

/-- Sullivan factorisation as an explicit hypothesis, with the off-shellness remainder named
because it cannot vanish identically. Layer 6.3. -/
structure IsSullivanFactorised (flux : MesonFlux) (crossSection : ℝ → ℝ → ℝ → ℝ)
    (F2meson : ℝ → ℝ → ℝ) : Type where
  /-- The off-shellness remainder. -/
  remainder : ℝ → ℝ → ℝ → ℝ
  /-- The factorisation identity. -/
  identity : ∀ xBj xi t : ℝ, crossSection xBj xi t =
    flux.toFun xi t * F2meson (partonFractionInMesonOnShell xBj xi) (-t) + remainder xBj xi t

/-- Flux independence of a ratio at equal meson fraction, cross-multiplied so that no division is
taken. The companion negative statement, flux dependence of a ratio at different meson fractions, is
in `README.md` 6.2. -/
theorem scale_ratio_flux_independent (flux flux' : MesonFlux)
    (crossSection crossSection' : ℝ → ℝ → ℝ → ℝ) (F2meson : ℝ → ℝ → ℝ)
    (h : IsSullivanFactorised flux crossSection F2meson)
    (h' : IsSullivanFactorised flux' crossSection' F2meson)
    (hrem : ∀ xBj xi t : ℝ, h.remainder xBj xi t = 0)
    (hrem' : ∀ xBj xi t : ℝ, h'.remainder xBj xi t = 0) :
    ∀ xBj xBj' xi t : ℝ,
      crossSection xBj xi t * crossSection' xBj' xi t
        = crossSection xBj' xi t * crossSection' xBj xi t := by
  sorry

/-- The extraction operator has non-trivial kernel when the measured domain in the meson fraction is
a proper subinterval. The explicit element is the theorem; the abstract statement is
`TauCeti.Analysis.Fredholm.Criteria`. Layer 6.4, item 3. -/
theorem extraction_kernel_nontrivial (flux : MesonFlux) (a b : ℝ) (ha : 0 < a) (hab : a < b)
    (hb : b < 1) :
    ∃ F G : ℝ → ℝ → ℝ, F ≠ G ∧
      ∀ xBj xi t : ℝ, xi ∈ Set.Icc a b →
        flux.toFun xi t * F (partonFractionInMesonOnShell xBj xi) (-t)
          = flux.toFun xi t * G (partonFractionInMesonOnShell xBj xi) (-t) := by
  sorry

/-- The pion-pole hypothesis: an analyticity statement of the same kind as the elastic cut of 3.3,
and no more provable here. Layer 6.5. -/
structure HasMesonPole {Flavor : Type} (M : PseudoscalarMeson Flavor)
    (amplitude : ℝ → ℝ) : Type where
  /-- The residue at the pole. -/
  residue : ℝ
  /-- The pole behaviour as the momentum transfer approaches the squared meson mass. -/
  pole : Filter.Tendsto (fun t : ℝ => (t - M.mass ^ 2) * amplitude t)
    (nhdsWithin (M.mass ^ 2) (Set.Iio (M.mass ^ 2))) (nhds residue)

/-- Instability of the extrapolation, in the form that says what it means for data of finite
precision: amplitudes uniformly small on the measured interval with residue one at the pole. The
companion uniqueness statement of 6.5 item 2 needs the holomorphy domain that `HasMesonPole` does
not carry, and is stated in `README.md`. -/
theorem pole_residue_not_determined_by_bounded_data {Flavor : Type}
    (M : PseudoscalarMeson Flavor) (a b : ℝ) (hab : a < b) (hb : b < 0) :
    ∃ (A : ℕ → ℝ → ℝ) (h : ∀ n : ℕ, HasMesonPole M (A n)),
      (∀ n : ℕ, ∀ t ∈ Set.Icc a b, |A n t| ≤ 1 / (n + 1)) ∧ ∀ n : ℕ, (h n).residue = 1 := by
  sorry

/-- The kaon lever arm is longer at equal measured domain, so the extrapolation bound of 6.5 item 4
is weaker for the kaon than for the pion. Layer 6.6. -/
theorem kaon_lever_arm_longer {Flavor : Type}
    (pion kaon : PseudoscalarMeson Flavor) (h : pion.mass < kaon.mass) (tMax : ℝ)
    (htMax : tMax ≤ 0) : |tMax - pion.mass ^ 2| < |tMax - kaon.mass ^ 2| := by
  sorry

end EpsilonEridaniRoadmaps.MesonStructure

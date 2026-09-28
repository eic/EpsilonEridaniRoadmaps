import EpsilonEridani

/-!
# Diffraction: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by the signatures below.

First, the kinematics are carried by invariant scalar products rather than by momentum fractions,
so that `x = ξ β` is a theorem about definitions and not a definition that assumes itself.

Second, a coefficient function has type `F → ℝ → ℝ → ℝ` — flavour, convolution argument,
factorisation scale — and therefore *cannot* depend on the diffractive variables `ξ` and `t`. The
substance of diffractive collinear factorisation is exactly that independence, so it is encoded in
a type rather than asserted in a hypothesis.

Third, Regge factorisation is a `Prop` taking the flux data as an argument. No instance is
constructed anywhere, and no structure carries it as a field.

Fourth, the Good–Walker separation is stated against a single probability measure on a
configuration space, so that coherent, total and incoherent cross sections are the squared mean,
the mean square and the variance of one function against one measure, and the identity relating
them is available.

Every unproved statement is a `sorry`-ed theorem. No proposition is encoded as a structure field
with a placeholder witness.
-/

namespace EpsilonEridaniRoadmaps.Diffraction

open MeasureTheory

/-! ## Layer 0: diffractive kinematics and the rapidity gap -/

/-- The invariants of a diffractive event, with `Pq = P · q`, `Dq = Δ · q` for `Δ = P - P'`,
`Q2 = -q²` and `t = Δ²`. Carrying the scalar products rather than the momentum fractions is what
makes `x = ξ β` provable. -/
structure Invariants where
  /-- `P · q`, positive in the physical region. -/
  Pq : ℝ
  /-- `Δ · q` with `Δ = P - P'`, positive in the physical region. -/
  Dq : ℝ
  /-- Photon virtuality `Q² = -q²`. -/
  Q2 : ℝ
  /-- Invariant momentum transfer to the target, non-positive throughout (Convention 2). -/
  t : ℝ
  Pq_pos : 0 < Pq
  Dq_pos : 0 < Dq
  Q2_pos : 0 < Q2
  t_nonpos : t ≤ 0

namespace Invariants

/-- The inclusive Bjorken variable. -/
noncomputable def x (i : Invariants) : ℝ := i.Q2 / (2 * i.Pq)

/-- The momentum fraction lost by the target, written `ξ` in the roadmap. -/
noncomputable def xi (i : Invariants) : ℝ := i.Dq / i.Pq

/-- The parton's fraction of the exchanged momentum, written `β` in the roadmap. -/
noncomputable def beta (i : Invariants) : ℝ := i.Q2 / (2 * i.Dq)

/-- The positive momentum transfer `|t|`, so that no power law is written with a sign ambiguity
(Convention 2). -/
noncomputable def absT (i : Invariants) : ℝ := -i.t

/-- The invariant mass squared of the diffractive system. -/
noncomputable def MX2 (i : Invariants) : ℝ := i.Q2 * (1 / i.beta - 1) + i.t

theorem absT_nonneg (i : Invariants) : 0 ≤ i.absT := by sorry

/-- Layer 0.1: the identity that licenses calling `β` a momentum fraction. Exact, with no mass or
high-energy approximation. -/
theorem x_eq_xi_mul_beta (i : Invariants) : i.x = i.xi * i.beta := by sorry

/-- Layer 0.1: the exact relation between the parton fraction and the diffractive mass. -/
theorem beta_eq_of_MX2 (i : Invariants) : i.beta = i.Q2 / (i.Q2 + i.MX2 - i.t) := by sorry

theorem x_le_xi_of_beta_le_one (i : Invariants) (h : i.beta ≤ 1) : i.x ≤ i.xi := by sorry

end Invariants

/-- Layer 0.2: the kinematic boundary in `t` at fixed `ξ` in the target-elastic case, with `M` the
target mass. -/
noncomputable def tMinElastic (M xi : ℝ) : ℝ := -(xi ^ 2 * M ^ 2) / (1 - xi)

theorem tMinElastic_nonpos (M xi : ℝ) (hM : 0 ≤ M) (h : xi < 1) (h0 : 0 ≤ xi) :
    tMinElastic M xi ≤ 0 := by sorry

/-- Layer 0.3: the gap-`ξ` relation is a two-sided bound with computed error terms, never the
equality `Δη = ln(1/ξ)`. The bounds `c₁` and `c₂` are data of the event. -/
def GapBound (gap xi c₁ c₂ : ℝ) : Prop :=
  0 < xi ∧ xi < 1 ∧
    Real.log (1 / xi) - c₁ ≤ gap ∧ gap ≤ Real.log (1 / xi) + c₂

/-! ## Layer 1: diffractive structure functions -/

/-- Layer 1.2: the `t`-integration carrying its range as explicit data (Convention 3). A `D3`
object is this applied to a `D4` object; the two are never conflated. -/
noncomputable def tIntegrate (tLo tHi : ℝ) (f : ℝ → ℝ) : ℝ := ∫ t in Set.Icc tLo tHi, f t

/-- Layer 1.2: `F₂^{D(3)}` does not determine `F₂^{D(4)}`. The witness is any non-zero function
integrating to zero over the stated range. -/
theorem tIntegrate_not_injective (tLo tHi : ℝ) (h : tLo < tHi) :
    ∃ f : ℝ → ℝ, f ≠ 0 ∧ tIntegrate tLo tHi f = 0 := by sorry

/-! ## Layer 2: diffractive parton distributions and collinear factorisation -/

variable {F : Type*}

/-- Diffractive parton distributions as explicit data (Convention 4): a function of flavour, `β`,
the factorisation scale `μ²`, and the diffractive variables `ξ` and `t`, with its support and its
positivity in the stated scheme. -/
structure DiffractivePDFs (F : Type*) where
  /-- `val a β μ² ξ t`. -/
  val : F → ℝ → ℝ → ℝ → ℝ → ℝ
  nonneg : ∀ a b m xi t, 0 ≤ val a b m xi t
  support_beta : ∀ a b m xi t, (b ≤ 0 ∨ 1 < b) → val a b m xi t = 0
  support_xi : ∀ a b m xi t, (xi ≤ 0 ∨ 1 < xi) → val a b m xi t = 0

/-- The collinear convolution in `β`, in the shape of
`EpsilonEridani.QFT.Factorization.Convolution.Collinear`. -/
noncomputable def conv (C d : ℝ → ℝ) (b : ℝ) : ℝ := ∫ z in Set.Ioc b (1 : ℝ), C (b / z) * d z / z

/-- Layer 2.3: diffractive collinear factorisation. The coefficient function has type
`F → ℝ → ℝ → ℝ`, so it cannot depend on `ξ` or `t`; that impossibility *is* the theorem, and it is
why this is stated with the coefficient functions as a separate argument rather than as part of a
factorised ansatz. -/
def CollinearFactorisation [Fintype F] (C : F → ℝ → ℝ → ℝ) (D : DiffractivePDFs F)
    (F2D : ℝ → ℝ → ℝ → ℝ → ℝ) : Prop :=
  ∀ b q xi t, F2D b q xi t =
    Finset.univ.sum fun a => conv (fun u => C a u q) (fun z => D.val a z q xi t) b

/-- Layer 2.3: the leading-order instance, which a contributor can discharge. `e2 a` is the squared
electric charge of flavour `a`. -/
def FactorisesAtLO [Fintype F] (e2 : F → ℝ) (D : DiffractivePDFs F)
    (F2D : ℝ → ℝ → ℝ → ℝ → ℝ) : Prop :=
  ∀ b q xi t, F2D b q xi t = Finset.univ.sum fun a => e2 a * b * D.val a b q xi t

theorem factorisesAtLO_of_collinearFactorisation [Fintype F] (e2 : F → ℝ)
    (C : F → ℝ → ℝ → ℝ) (D : DiffractivePDFs F) (F2D : ℝ → ℝ → ℝ → ℝ → ℝ)
    (hLO : ∀ a u q, C a u q = e2 a * u) (h : CollinearFactorisation C D F2D) :
    FactorisesAtLO e2 D F2D := by sorry

/-- Layer 2.5: `ξ` and `t` are spectators of the evolution. The generator acts on the `β`- and
`μ²`-dependence only, which is what the type of `gen` records. -/
def EvolvesAtFixedDiffractiveVariables (gen : (ℝ → ℝ) → ℝ → ℝ → ℝ)
    (D : DiffractivePDFs F) : Prop :=
  ∀ a m xi t b, HasDerivAt (fun m' => D.val a b m' xi t)
    (gen (fun b' => D.val a b' m xi t) b m) m

/-- Layer 2.6: a hadron-hadron gap survival factor is data with no assumed properties beyond
membership in `[0,1]`. It is not assumed universal, not assumed to factorise, and not assumed
independent of the hard process. -/
structure GapSurvival where
  /-- `val s kin sel`: collision energy, hard kinematics, selection. -/
  val : ℝ → ℝ → ℝ → ℝ
  mem : ∀ s kin sel, val s kin sel ∈ Set.Icc (0 : ℝ) 1

/-! ## Layer 3: Regge factorisation, the trajectory and the flux -/

/-- The data of a Regge exchange. No numerical value for the intercept or the slope is asserted
anywhere (Convention 10). -/
structure ReggeData where
  /-- Flux normalisation, fixed by the convention of Layer 3.3. -/
  N : ℝ
  /-- Intercept `α(0)`. -/
  alpha0 : ℝ
  /-- Slope `α'`. -/
  alphaPrime : ℝ
  /-- Residue function of the momentum transfer. -/
  residue : ℝ → ℝ
  N_pos : 0 < N
  residue_pos : ∀ t, 0 < residue t

namespace ReggeData

/-- The linear trajectory `α(t) = α₀ + α' t`. -/
def trajectory (R : ReggeData) (t : ℝ) : ℝ := R.alpha0 + R.alphaPrime * t

/-- The flux `f(ξ, t) = N · R(t) · ξ^{1 - 2α(t)}`. -/
noncomputable def flux (R : ReggeData) (xi t : ℝ) : ℝ :=
  R.N * R.residue t * xi ^ (1 - 2 * R.trajectory t)

theorem flux_pos (R : ReggeData) (xi t : ℝ) (h : 0 < xi) : 0 < R.flux xi t := by sorry

end ReggeData

/-- Layer 3.1: Regge factorisation, as a hypothesis taking its data as an argument (Convention 5). -/
def ReggeFactorised (D : DiffractivePDFs F) (R : ReggeData) (d : F → ℝ → ℝ → ℝ) : Prop :=
  ∀ a b m xi t, D.val a b m xi t = R.flux xi t * d a b m

/-- Layer 3.3: only the product of flux and Pomeron distribution is determined. Rescaling the flux
by `c` and the distribution by `c⁻¹` gives the same diffractive distributions, so a "Pomeron parton
distribution" is not an observable. -/
theorem reggeFactorised_rescale (D : DiffractivePDFs F) (R R' : ReggeData)
    (d : F → ℝ → ℝ → ℝ) (c : ℝ) (hc : c ≠ 0)
    (hR : ∀ xi t, R'.flux xi t = c * R.flux xi t)
    (h : ReggeFactorised D R d) :
    ReggeFactorised D R' (fun a b m => c⁻¹ * d a b m) := by sorry

/-- Layer 3.5: a Regge-factorised initial condition stays Regge-factorised with the *same* flux,
because the generator commutes with multiplication by a function of the spectator variables. This
is a consistency property of the hypothesis and is not evidence for it. -/
theorem reggeFactorised_preserved (gen : (ℝ → ℝ) → ℝ → ℝ → ℝ)
    (D : DiffractivePDFs F) (R : ReggeData) (d : F → ℝ → ℝ → ℝ)
    (hEv : EvolvesAtFixedDiffractiveVariables gen D)
    (h : ∀ a b xi t, D.val a b 0 xi t = R.flux xi t * d a b 0) :
    ReggeFactorised D R d := by sorry

/-! ## Layer 4: analyticity, unitarity and the forward amplitude -/

/-- Layer 4.2: the optical theorem, recorded as a proposition relating the forward amplitude to the
total cross section in a fixed normalisation. It is stated rather than proved here, because the
unitarity relation it follows from is not available in the library; Layer 4.2 supplies that
relation as a named hypothesis. -/
def OpticalTheorem (A : ℝ → ℂ) (sigmaTot fluxFactor : ℝ → ℝ) : Prop :=
  ∀ s, 2 * (A s).im = fluxFactor s * sigmaTot s

/-- The positivity of the forward imaginary part, which is what makes the Herglotz representation of
Layer 4.3 applicable. -/
theorem im_nonneg_of_opticalTheorem (A : ℝ → ℂ) (sigmaTot fluxFactor : ℝ → ℝ)
    (hO : OpticalTheorem A sigmaTot fluxFactor) (hs : ∀ s, 0 ≤ sigmaTot s)
    (hf : ∀ s, 0 ≤ fluxFactor s) : ∀ s, 0 ≤ (A s).im := by sorry

/-- Layer 4.4: the single-pole Regge form of the forward amplitude, as explicit data. Its domain of
validity is an argument, per Layer 4.5. -/
def ReggeForm (A : ℝ → ℂ) (R : ReggeData) (residueC : ℂ) (dom : Set ℝ) : Prop :=
  ∀ s ∈ dom, A s = residueC * (s : ℂ) ^ (R.alpha0 : ℂ)

/-- Layer 4.4: the energy dependence of the total cross section follows from the Regge form and the
optical theorem, with the constant computed. -/
theorem sigmaTot_power_of_reggeForm (A : ℝ → ℂ) (sigmaTot fluxFactor : ℝ → ℝ)
    (R : ReggeData) (residueC : ℂ) (dom : Set ℝ)
    (hO : OpticalTheorem A sigmaTot fluxFactor) (hR : ReggeForm A R residueC dom)
    (hf : ∀ s, fluxFactor s = s) :
    ∃ c : ℝ, ∀ s ∈ dom, 0 < s → sigmaTot s = c * s ^ (R.alpha0 - 1) := by sorry

/-! ## Layer 5: Good–Walker -/

variable {Ω : Type*} [MeasurableSpace Ω]

/-- Layer 5.2: the coherent cross section is the squared modulus of the configuration average. -/
noncomputable def coherent (μ : Measure Ω) (A : Ω → ℂ) : ℝ := ‖∫ ω, A ω ∂μ‖ ^ 2

/-- Layer 5.2: the total diffractive cross section is the average of the squared modulus. -/
noncomputable def totalDiffractive (μ : Measure Ω) (A : Ω → ℂ) : ℝ := ∫ ω, ‖A ω‖ ^ 2 ∂μ

/-- Layer 5.2: the incoherent cross section is the difference, against the same measure. -/
noncomputable def incoherent (μ : Measure Ω) (A : Ω → ℂ) : ℝ :=
  totalDiffractive μ A - coherent μ A

/-- Layer 5.2: the Good–Walker identity. Incoherent diffraction is the variance of the amplitude
over target configurations. The hypotheses are integrability and square-integrability and nothing
else: the separation of the two channels is a theorem about a measure. -/
theorem incoherent_eq_variance (μ : Measure Ω) [IsProbabilityMeasure μ] (A : Ω → ℂ)
    (hA : Integrable A μ) (hA2 : Integrable (fun ω => ‖A ω‖ ^ 2) μ) :
    incoherent μ A = ∫ ω, ‖A ω - ∫ ω', A ω' ∂μ‖ ^ 2 ∂μ := by sorry

theorem incoherent_nonneg (μ : Measure Ω) [IsProbabilityMeasure μ] (A : Ω → ℂ)
    (hA : Integrable A μ) (hA2 : Integrable (fun ω => ‖A ω‖ ^ 2) μ) :
    0 ≤ incoherent μ A := by sorry

/-- Layer 5.5: incoherent diffraction vanishes exactly when the amplitude does not fluctuate over
configurations. This is the sense in which it measures fluctuations. -/
theorem incoherent_eq_zero_iff (μ : Measure Ω) [IsProbabilityMeasure μ] (A : Ω → ℂ)
    (hA : Integrable A μ) (hA2 : Integrable (fun ω => ‖A ω‖ ^ 2) μ) :
    incoherent μ A = 0 ↔ ∀ᵐ ω ∂μ, A ω = ∫ ω', A ω' ∂μ := by sorry

/-- Layer 5.4: the radial kernel of the two-dimensional Fourier transform of an azimuthally
symmetric amplitude, defined by its integral representation. This object is the Bessel function
`J₀`, which is absent from both Mathlib and TauCeti at the pinned revisions; it belongs upstream in
the shape Mathlib's special-function library would want, and nothing here waits for that. Only the
two properties below are used: the value at the origin and the uniform bound. -/
noncomputable def radialKernel (Δ b : ℝ) : ℝ :=
  (1 / (2 * Real.pi)) * ∫ φ in Set.Icc 0 (2 * Real.pi), Real.cos (Δ * b * Real.cos φ)

theorem radialKernel_zero (b : ℝ) : radialKernel 0 b = 1 := by sorry

theorem radialKernel_abs_le_one (Δ b : ℝ) : |radialKernel Δ b| ≤ 1 := by sorry

/-! ## Layer 6: the black disc -/

/-- The impact-parameter profile of a fully absorptive disc of radius `R`. -/
noncomputable def blackDisc (R : ℝ) (b : ℝ) : ℝ := if b ≤ R then 1 else 0

/-- `σ_tot = 2 ∫ d²b Im a(b)` for an azimuthally symmetric profile. -/
noncomputable def totalFromProfile (a : ℝ → ℝ) : ℝ :=
  4 * Real.pi * ∫ b in Set.Ioi (0 : ℝ), b * a b

/-- `σ_el = ∫ d²b |a(b)|²` for an azimuthally symmetric profile. -/
noncomputable def elasticFromProfile (a : ℝ → ℝ) : ℝ :=
  2 * Real.pi * ∫ b in Set.Ioi (0 : ℝ), b * (a b) ^ 2

/-- Layer 6.4: for a sharp-edged fully absorptive profile the elastic-to-total ratio is exactly one
half. Both hypotheses — sharp edge and purely imaginary amplitude — are used, and the Gaussian
example of Layer 6.4 shows the ratio is not one half without them. -/
theorem blackDisc_ratio (R : ℝ) (hR : 0 < R) :
    totalFromProfile (blackDisc R) = 2 * Real.pi * R ^ 2 ∧
    elasticFromProfile (blackDisc R) = Real.pi * R ^ 2 ∧
    elasticFromProfile (blackDisc R) / totalFromProfile (blackDisc R) = 1 / 2 := by sorry

/-- Layer 6.3: with the unitarity bound on the dipole amplitude, the coherent cross section is
bounded by the squared geometric area, so the suppression factor relative to the impulse
approximation is at most one. -/
theorem coherent_le_of_unitarity (μ : Measure Ω) [IsProbabilityMeasure μ] (A : Ω → ℂ)
    (hA : Integrable A μ) (hbound : ∀ ω, ‖A ω‖ ≤ 1) :
    coherent μ A ≤ 1 := by sorry

end EpsilonEridaniRoadmaps.Diffraction

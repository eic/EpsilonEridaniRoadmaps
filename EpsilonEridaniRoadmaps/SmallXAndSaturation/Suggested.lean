import EpsilonEridani

/-!
# SmallXAndSaturation: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit here. The amplitude is a function of the **two transverse
endpoints**, never of the dipole size alone, so that the impact-parameter dependence survives
(Convention 4). Admissibility is a `Prop` on an amplitude whose every field is a full assertion,
not a placeholder-witnessed field, so a term of `Admissible` carries real content (the standing
rule on `Prop`-valued fields). Rapidity evolution is a **semigroup on the non-negative reals**
acting on the admissible set, not a group and not a linear flow, because backward BK evolution is
ill-posed (Convention 2). And the digamma function and the critical anomalous dimension are
`sorry`-ed targets rather than calls into an upstream name: both are absent from Mathlib and
TauCeti, and Layers 2.3 and 4.3 build them.

Every `sorry` below is a target of the roadmap, not an admitted assumption.
-/

namespace EpsilonEridaniRoadmaps.SmallXAndSaturation

open scoped Matrix

/-! ## Layer 0: transverse geometry, Wilson lines, and the dipole amplitude -/

/-- A position in the transverse plane. -/
abbrev Transverse : Type := EuclideanSpace ℝ (Fin 2)

/-- A colour dipole, recorded by its two endpoints. Convention 4: the endpoints are the data;
size and impact parameter are derived. -/
structure Dipole where
  /-- Transverse position of the quark. -/
  quark : Transverse
  /-- Transverse position of the antiquark. -/
  antiquark : Transverse

/-- The dipole vector, `r = x - y`. -/
def Dipole.size (d : Dipole) : Transverse := d.quark - d.antiquark

/-- The impact parameter, `b = (x + y) / 2`. -/
def Dipole.impactParameter (d : Dipole) : Transverse := (2 : ℝ)⁻¹ • (d.quark + d.antiquark)

/-- A light-cone Wilson-line configuration of the target: a unitary matrix at each transverse
position. The path-ordered-exponential origin of these matrices is recorded in the roadmap; the
theory of Layers 0-4 uses only unitarity and the gauge transformation law. -/
abbrev WilsonConfiguration (Nc : ℕ) : Type :=
  Transverse → Matrix.unitaryGroup (Fin Nc) ℂ

/-- The dipole operator of a configuration: the normalised real part of the trace of the Wilson
line at one endpoint against the conjugate line at the other. -/
noncomputable def dipoleS {Nc : ℕ} (U : WilsonConfiguration Nc) (x y : Transverse) : ℝ :=
  (Nc : ℝ)⁻¹ * (Matrix.trace ((U x : Matrix (Fin Nc) (Fin Nc) ℂ) *
    (U y : Matrix (Fin Nc) (Fin Nc) ℂ)ᴴ)).re

/-- A point-like dipole does not interact: colour transparency, at the level of a single
configuration. Layer 0.3. -/
theorem dipoleS_self {Nc : ℕ} [NeZero Nc] (U : WilsonConfiguration Nc) (x : Transverse) :
    dipoleS U x x = 1 := by
  sorry

/-- Unitarity bounds the dipole operator, before any averaging. Layer 0.3. -/
theorem abs_dipoleS_le_one {Nc : ℕ} [NeZero Nc] (U : WilsonConfiguration Nc)
    (x y : Transverse) : |dipoleS U x y| ≤ 1 := by
  sorry

/-- The quadrupole operator. Its coincidence limits reduce to dipoles; Layer 0.6. -/
noncomputable def quadrupoleS {Nc : ℕ} (U : WilsonConfiguration Nc) (x y z w : Transverse) : ℝ :=
  (Nc : ℝ)⁻¹ * (Matrix.trace ((U x : Matrix (Fin Nc) (Fin Nc) ℂ) *
    (U y : Matrix (Fin Nc) (Fin Nc) ℂ)ᴴ * (U z : Matrix (Fin Nc) (Fin Nc) ℂ) *
    (U w : Matrix (Fin Nc) (Fin Nc) ℂ)ᴴ)).re

/-- A dipole scattering amplitude at one rapidity: `N = 1 - S` after averaging over the target.
Convention 3 fixes the normalisation, so `0` is transparency and `1` is the black disc. -/
abbrev Amplitude : Type := Transverse → Transverse → ℝ

/-- Admissibility. Every field is a complete assertion about `N`; none is a placeholder for an
unproved obligation. Layer 1.1. -/
structure Admissible (N : Amplitude) : Prop where
  /-- Colour transparency: a point-like dipole is transparent. -/
  diag : ∀ x, N x x = 0
  /-- Unitarity: the amplitude lies in the unit interval at every pair of endpoints. -/
  unitarity : ∀ x y, N x y ∈ Set.Icc (0 : ℝ) 1
  /-- Exchange symmetry of the endpoints. -/
  symm : ∀ x y, N x y = N y x
  /-- Positive semidefiniteness of the S-matrix kernel `1 - N`, as a kernel on any finite family
  of transverse positions. Layer 0.5. -/
  posSemidef : ∀ (n : ℕ) (p : Fin n → Transverse),
    (Matrix.of fun i j => (1 : ℝ) - N (p i) (p j)).PosSemidef

/-- The black disc: the amplitude saturating the unitarity bound away from the diagonal. -/
noncomputable def blackDisc : Amplitude := fun x y => if x = y then 0 else 1

/-- The Golec-Biernat-Wüsthoff amplitude at saturation scale `Qs`, the standard test initial
condition of the roadmap. -/
noncomputable def gbw (Qs : ℝ) : Amplitude :=
  fun x y => 1 - Real.exp (-(Qs ^ 2 * ‖x - y‖ ^ 2) / 4)

/-- The Golec-Biernat-Wüsthoff form is admissible for a positive saturation scale. Layer 0
`Examples`. -/
theorem admissible_gbw {Qs : ℝ} (hQs : 0 < Qs) : Admissible (gbw Qs) := by
  sorry

/-! ## Layer 1: the dipole space and rapidity evolution as a semigroup -/

/-- A rapidity evolution is a semigroup of maps on amplitudes indexed by the *non-negative*
rapidity increment. Convention 2: there is no group here, and the inverse direction is not
available.

`step` is indexed by `ℝ` with non-negativity as a hypothesis on the laws rather than by
`ℝ≥0`, so that `TauCeti.Analysis.Semigroups`, which indexes by `ℝ`, applies without a coercion
at every use. The cost is that `step` is defined at negative increments, where it is junk; no
statement in this file evaluates it there, and `step_add` is stated only for non-negative
increments. -/
structure RapidityEvolution where
  /-- The evolution operator over a rapidity increment. -/
  step : ℝ → Amplitude → Amplitude
  /-- The identity at zero increment. -/
  step_zero : ∀ N, step 0 N = N
  /-- The semigroup law, on non-negative increments only. -/
  step_add : ∀ {Y₁ Y₂ : ℝ}, 0 ≤ Y₁ → 0 ≤ Y₂ →
    ∀ N, step (Y₁ + Y₂) N = step Y₂ (step Y₁ N)

/-- An evolution *preserves unitarity* when the admissible set is invariant under it. This is the
shape in which Layers 2.5 and 3.2 make their opposing claims. -/
def PreservesUnitarity (E : RapidityEvolution) : Prop :=
  ∀ {N : Amplitude}, Admissible N → ∀ Y : ℝ, 0 ≤ Y → Admissible (E.step Y N)

/-! ## Layer 2: BFKL, and the theorem that it violates unitarity -/

/-- The leading-order dipole (BFKL) kernel in coordinate space. Non-negative, and singular at
`z = x` and `z = y`; Layer 2.1 proves that the singularities cancel against the virtual term. -/
noncomputable def dipoleKernel (x y z : Transverse) : ℝ :=
  ‖x - y‖ ^ 2 / (‖x - z‖ ^ 2 * ‖z - y‖ ^ 2)

/-- Non-negativity of the dipole kernel. Layer 2.1. -/
theorem dipoleKernel_nonneg (x y z : Transverse) : 0 ≤ dipoleKernel x y z := by
  sorry

/-- The real-virtual combination appearing under the BFKL integral. -/
noncomputable def bfklBracket (N : Amplitude) (x y z : Transverse) : ℝ :=
  N x z + N z y - N x y

/-- The digamma function. Absent from both Mathlib and TauCeti; Layer 2.3 constructs it as the
logarithmic derivative of the Gamma function and proves the recurrence, the reflection formula and
convexity on the positive reals. -/
noncomputable def digamma : ℝ → ℝ := sorry

/-- The BFKL characteristic function, `χ γ = 2 ψ 1 - ψ γ - ψ (1 - γ)`, the eigenvalue of the
leading-order kernel on the power eigenfunctions. Layer 2.3. -/
noncomputable def chi (γ : ℝ) : ℝ := 2 * digamma 1 - digamma γ - digamma (1 - γ)

/-- The characteristic function attains its minimum on the open unit interval at `γ = 1/2`, with
value `4 log 2`. Acceptance example 4. -/
theorem chi_min : IsMinOn chi (Set.Ioo (0 : ℝ) 1) (1 / 2) ∧ chi (1 / 2) = 4 * Real.log 2 := by
  sorry

/-- The hard Pomeron intercept at fixed coupling `ᾱs`. Layer 2.4. -/
noncomputable def pomeronIntercept (αbar : ℝ) : ℝ := αbar * chi (1 / 2)

/-- **The unitarity-violation theorem.** A BFKL evolution with positive intercept cannot preserve
unitarity: there is an admissible initial amplitude and a rapidity at which the evolved amplitude
leaves the unit interval. Acceptance example 5, Layer 2.5.

The hypothesis `hgrowth` is the exponential lower bound on the growth of a solution with non-zero
overlap against the leading eigenfunction, which Layer 2.4 supplies. -/
theorem not_preservesUnitarity_of_growth (E : RapidityEvolution) (αbar : ℝ) (hαbar : 0 < αbar)
    (hgrowth : ∃ (N₀ : Amplitude) (x y : Transverse), Admissible N₀ ∧ 0 < N₀ x y ∧
      ∀ Y : ℝ, 0 ≤ Y → Real.exp (pomeronIntercept αbar * Y) * N₀ x y ≤ E.step Y N₀ x y) :
    ¬ PreservesUnitarity E := by
  sorry

/-! ## Layer 3: the Balitsky-Kovchegov equation -/

/-- The Balitsky-Kovchegov combination under the integral: the BFKL bracket minus the quadratic
dipole term. Its sign on the boundary of the admissible set is the whole content of Layer 3.2. -/
noncomputable def bkBracket (N : Amplitude) (x y z : Transverse) : ℝ :=
  N x z + N z y - N x y - N x z * N z y

/-- On the upper face of the admissible set the BK bracket factorises, and is therefore
non-positive: the evolution pushes the amplitude back inside. Acceptance example 6, Layer 3.2. -/
theorem bkBracket_factor_of_eq_one {N : Amplitude} {x y z : Transverse} (h : N x y = 1) :
    bkBracket N x y z = -((1 - N x z) * (1 - N z y)) := by
  sorry

/-- The mean-field closure: the averaged quadrupole factorises into averaged dipoles. A named
hypothesis, supplied as an argument to the theorems that need it, never a structure field
(Convention 8). Layers 3.1 and 5.4. -/
def IsMeanField {Nc : ℕ} (ensemble : (WilsonConfiguration Nc → ℝ) → ℝ) : Prop :=
  ∀ x y z w : Transverse,
    ensemble (fun U => dipoleS U x y * dipoleS U z w) =
      ensemble (fun U => dipoleS U x y) * ensemble (fun U => dipoleS U z w)

/-- The Balitsky-Kovchegov right-hand side at fixed coupling: the dipole kernel integrated against
the BK bracket over the emission point. Layer 3.1. -/
noncomputable def bkRhs (αbar : ℝ) (N : Amplitude) : Amplitude :=
  fun x y => (αbar / (2 * Real.pi)) * ∫ z : Transverse, dipoleKernel x y z * bkBracket N x y z

/-- The BK Cauchy problem in rapidity, in the shape of `IsBkSolution` in
`EpsilonEridani.QFT.Factorization.Evolution.SmallX` but for the concrete dipole amplitude. -/
def IsBKSolution (αbar : ℝ) (N : ℝ → Amplitude) : Prop :=
  ∀ (x y : Transverse) (Y : ℝ), HasDerivAt (fun Y' => N Y' x y) (bkRhs αbar (N Y) x y) Y

/-- **The central theorem of the roadmap.** Balitsky-Kovchegov evolution preserves unitarity: an
admissible initial amplitude stays admissible, hence in the unit interval, at every rapidity. This
closes the fourth declared gap of `EpsilonEridani.QFT.Factorization.Evolution.SmallX`, which states
the abstract Cauchy problem without the a priori bound. Acceptance example 7, Layer 3.2. -/
theorem bk_admissible_of_admissible {αbar : ℝ} (hαbar : 0 < αbar) {N : ℝ → Amplitude}
    (hsol : IsBKSolution αbar N) (h0 : Admissible (N 0)) :
    ∀ Y : ℝ, 0 ≤ Y → Admissible (N Y) := by
  sorry

/-- The comparison principle: pointwise ordering of admissible initial data is preserved by the
evolution. TauCeti has no order-preserving semigroup theory, so Layer 3.3 proves this directly by a
Grönwall argument on the difference. Acceptance example 8. -/
theorem bk_comparison {αbar : ℝ} (hαbar : 0 < αbar) {N M : ℝ → Amplitude}
    (hN : IsBKSolution αbar N) (hM : IsBKSolution αbar M)
    (hN0 : Admissible (N 0)) (hM0 : Admissible (M 0))
    (hle : ∀ x y, N 0 x y ≤ M 0 x y) :
    ∀ Y : ℝ, 0 ≤ Y → ∀ x y, N Y x y ≤ M Y x y := by
  sorry

/-! ## Layer 4: the saturation scale, travelling waves, and geometric scaling -/

/-- The saturation scale at level `κ`: the inverse dipole size at which the amplitude equals `κ`.
Convention 9 makes `κ` a parameter of the definition and of every theorem.

Quantifying over all pairs at a given separation makes this an impact-parameter-independent
notion, so it applies to the diffusive reduction of Layer 4.2 rather than to the full
impact-parameter-dependent amplitude that Convention 4 keeps explicit. The `b`-dependent
saturation scale is a separate object and is not defined here. -/
def IsSaturationScale (N : Amplitude) (κ Qs : ℝ) : Prop :=
  0 < Qs ∧ ∀ x y : Transverse, ‖x - y‖ = Qs⁻¹ → N x y = κ

/-- The critical anomalous dimension: the unique `γ` in the open unit interval at which the chord
from the origin to `χ` is tangent to it. Layer 4.3 constructs it from the strict convexity of `χ`;
it is not an upstream name. -/
noncomputable def criticalAnomalousDimension : ℝ := sorry

/-- Existence and uniqueness of the critical anomalous dimension, from strict convexity of `χ`.
Acceptance example 9, Layer 4.3. Differentiability is a hypothesis: `deriv` is total and returns
zero where `chi` is not differentiable, which would make the tangency condition say something
other than tangency. -/
theorem existsUnique_criticalAnomalousDimension
    (hchi : ∀ γ ∈ Set.Ioo (0 : ℝ) 1, DifferentiableAt ℝ chi γ) :
    ∃! γ : ℝ, γ ∈ Set.Ioo (0 : ℝ) 1 ∧ γ * deriv chi γ = chi γ := by
  sorry

/-- The saturation exponent: the selected front speed of the travelling-wave analysis. Layer 4.4. -/
noncomputable def saturationExponent (αbar : ℝ) : ℝ :=
  αbar * chi criticalAnomalousDimension / criticalAnomalousDimension

/-- The saturation scale grows exponentially in rapidity with the saturation exponent, and the
exponent does not depend on the level `κ`. Acceptance example 10, Layer 4.4. Stated for the
diffusive reduction of Layer 4.2; the full BK equation is claimed only at leading order. -/
theorem log_saturationScale_div_tendsto {αbar : ℝ} (hαbar : 0 < αbar)
    {N : ℝ → Amplitude} (hsol : IsBKSolution αbar N) (h0 : Admissible (N 0))
    {κ : ℝ} (hκ : κ ∈ Set.Ioo (0 : ℝ) 1) (Qs : ℝ → ℝ)
    (hQs : ∀ Y : ℝ, 0 ≤ Y → IsSaturationScale (N Y) κ (Qs Y)) :
    Filter.Tendsto (fun Y => Real.log (Qs Y ^ 2) / Y) Filter.atTop
      (nhds (saturationExponent αbar)) := by
  sorry

/-- Geometric scaling: in the scaling window the amplitude depends on dipole size and rapidity only
through `r * Qs Y`. Acceptance example 11, Layer 4.5. -/
def IsGeometricallyScaling (N : ℝ → Amplitude) (Qs : ℝ → ℝ) (Φ : ℝ → ℝ) (window : Set ℝ) : Prop :=
  ∀ Y : ℝ, 0 ≤ Y → ∀ x y : Transverse, ‖x - y‖ * Qs Y ∈ window →
    N Y x y = Φ (‖x - y‖ * Qs Y)

/-! ## Layer 5: JIMWLK, the Balitsky hierarchy, and the McLerran-Venugopalan initial condition -/

/-- An ensemble of Wilson-line configurations, presented dually as a positive normalised functional
on observables. Layer 5.1 works in this form because no measure theory on the configuration space is
available upstream. -/
structure Ensemble (Nc : ℕ) where
  /-- The expectation functional. -/
  expect : (WilsonConfiguration Nc → ℝ) → ℝ
  /-- Normalisation. -/
  expect_one : expect (fun _ => 1) = 1
  /-- Positivity. -/
  expect_nonneg : ∀ f, (∀ U, 0 ≤ f U) → 0 ≤ expect f
  /-- Linearity, without which `expect` is not an expectation and the factorisation statements of
  Layer 5.3 do not follow. -/
  expect_add : ∀ f g, expect (fun U => f U + g U) = expect f + expect g
  /-- Homogeneity. -/
  expect_smul : ∀ (c : ℝ) f, expect (fun U => c * f U) = c * expect f

/-- The dipole amplitude of an ensemble. Layer 5.1: this is the bridge from the Color Glass
Condensate description to the amplitude of Layers 0-4. -/
noncomputable def Ensemble.amplitude {Nc : ℕ} (e : Ensemble Nc) : Amplitude :=
  fun x y => 1 - e.expect (fun U => dipoleS U x y)

/-- The amplitude of an ensemble is admissible. Layer 5.1, and the verification that makes Layer
5.6 usable as an initial condition for Layer 3.2. -/
theorem admissible_ensemble_amplitude {Nc : ℕ} [NeZero Nc] (e : Ensemble Nc) :
    Admissible e.amplitude := by
  sorry

/-- The McLerran-Venugopalan dipole amplitude in closed form, with initial saturation scale `Qs0`
and infrared scale `Λ`. Layer 5.6. -/
noncomputable def mvAmplitude (Qs0 Λ : ℝ) : Amplitude :=
  fun x y => 1 - Real.exp (-(Qs0 ^ 2 * ‖x - y‖ ^ 2) / 4 *
    Real.log (1 / (Λ ^ 2 * ‖x - y‖ ^ 2) + Real.exp 1))

/-- The McLerran-Venugopalan amplitude is admissible. Acceptance example 14, Layer 5.6. -/
theorem admissible_mvAmplitude {Qs0 Λ : ℝ} (hQ : 0 < Qs0) (hΛ : 0 < Λ) :
    Admissible (mvAmplitude Qs0 Λ) := by
  sorry

/-! ## Layer 6: observables -/

/-- The dipole cross section: the amplitude integrated over the impact parameter at fixed dipole
size. Layer 0.7 and Layer 6.2. -/
noncomputable def dipoleCrossSection (N : Amplitude) (r : Transverse) : ℝ :=
  2 * ∫ b : Transverse, N (b + (2 : ℝ)⁻¹ • r) (b - (2 : ℝ)⁻¹ • r)

/-- The dipole cross section of an admissible amplitude is non-negative. This is the substantive
half of acceptance example 15: given it, and the non-negativity of the squared photon light-cone
wave functions of Layer 0.7, both `F_T` and `F_L` are non-negative. Layer 6.2. -/
theorem dipoleCrossSection_nonneg {N : Amplitude} (hN : Admissible N) (r : Transverse) :
    0 ≤ dipoleCrossSection N r := by
  sorry

/-- `0 ≤ F_L ≤ F₂` in the dipole formulation, once `F₂` is the sum of the transverse and
longitudinal pieces and each is non-negative by the previous result. Acceptance example 15,
Layer 6.2. -/
theorem FL_le_F2 {F2 FT FL : ℝ → ℝ → ℝ}
    (hsum : ∀ x Q2, F2 x Q2 = FT x Q2 + FL x Q2) (hFT : ∀ x Q2, 0 ≤ FT x Q2) :
    ∀ x Q2 : ℝ, FL x Q2 ≤ F2 x Q2 := by
  sorry

/-- The mass-number shift of the rapidity at which a given saturation scale is reached:
`ΔY = log A / (3 λ)`. Layer 6.1, the statement that makes nuclear targets the setting for this
physics. -/
noncomputable def nuclearRapidityShift (A αbar : ℝ) : ℝ :=
  Real.log A / (3 * saturationExponent αbar)

/-- The nuclear rapidity shift is positive for a nucleus and independent of the level `κ`.
Layer 6.1. -/
theorem nuclearRapidityShift_pos {A αbar : ℝ} (hA : 1 < A) (hαbar : 0 < αbar) :
    0 < nuclearRapidityShift A αbar := by
  sorry

end EpsilonEridaniRoadmaps.SmallXAndSaturation

import EpsilonEridani

/-!
# Inclusive structure functions: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Three design choices are made explicit. The nucleon mass is an argument of every object that can
depend on it, so the massless statement is always a corollary obtained by substituting `0`; this
is why `FLExact` and `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal.FL` are related by
a theorem rather than being one definition. Positivity is carried by a `Matrix.PosSemidef` field
on a helicity matrix, following
`EpsilonEridani.Particles.Parton.PDF.Positivity.SpinDensity`, so `F₁ ≥ 0` is a theorem about a
model and not a hypothesis imposed on one. The operator product expansion appears only as a
record of data plus a factorisation hypothesis on that data: nothing here derives it, and every
consequence takes the record as an argument.

Every unproved obligation is a `sorry`. No signature below asserts that its statement holds.
-/

namespace EpsilonEridaniRoadmap.InclusiveStructureFunctions

open EpsilonEridani.QFT.Scattering.DIS

/-! ## Layer 0: the hadronic tensor and its three invariant coefficients -/

/-- The unpolarised inclusive structure functions, bundled in the same shape as the polarised
pair `g₁`, `g₂` of `EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic.StructureFunctions`. -/
structure StructureFunctions where
  /-- The transverse structure function `F₁(x, Q²)`. -/
  F1 : ℝ → ℝ → ℝ
  /-- The structure function `F₂(x, Q²)`. -/
  F2 : ℝ → ℝ → ℝ
  /-- The parity-odd structure function `F₃(x, Q²)`. -/
  F3 : ℝ → ℝ → ℝ

/-- The target-mass factor `γ² = 4 M² x² / Q²`, which Layer 0.4 identifies with the squared
ratio of the true longitudinal length to its massless value. -/
noncomputable def gammaSq (M x Q2 : ℝ) : ℝ := 4 * M ^ 2 * x ^ 2 / Q2

/-- The target-mass-exact longitudinal structure function `(1 + γ²) F₂ - 2 x F₁`. -/
noncomputable def FLExact (M x Q2 F1 F2 : ℝ) : ℝ := (1 + gammaSq M x Q2) * F2 - 2 * x * F1

/-- At zero target mass the exact longitudinal function is the upstream massless
combination. -/
theorem FLExact_zero_mass (x Q2 F1 F2 : ℝ) (hQ : Q2 ≠ 0) :
    FLExact 0 x Q2 F1 F2 = Tensors.Longitudinal.FL x F1 F2 := by
  sorry

/-- The parity-odd bilinear form `ε(·, ·, p, q)`, as data together with the properties that make
the third invariant coefficient well defined. Identifying it with a genuine Levi-Civita
contraction on a four-dimensional space is the separate obligation of Layer 0.3. -/
structure ParityOddForm (V : Type) [AddCommGroup V] [Module ℝ V]
    (g : Kinematics.Bilin V) (K : Kinematics.DisKinematics V) where
  /-- The form itself. -/
  form : Kinematics.Bilin V
  /-- Antisymmetry. -/
  antisymm : ∀ v w, form v w = - form w v
  /-- The form annihilates the hadron momentum. -/
  annihilates_p : ∀ v, form K.p v = 0
  /-- The form annihilates the momentum transfer. -/
  annihilates_q : ∀ v, form K.q v = 0
  /-- Invariance under the stabiliser of the kinematics, in the upstream sense. -/
  covariant : Tensors.Hadronic.IsLorentzCovariant g K form

/-- A decomposition of a hadronic tensor into the two parity-even invariant structures of
`Tensors.Hadronic` and the parity-odd structure. -/
def IsF1F2F3Decomposition {V : Type} [AddCommGroup V] [Module ℝ V]
    (g : Kinematics.Bilin V) (K : Kinematics.DisKinematics V)
    (A : ParityOddForm V g K) (W : Kinematics.Bilin V) (F1 F2 F3 : ℝ) : Prop :=
  ∀ v w, W v w = (Tensors.Hadronic.fromF1F2 g K F1 F2) v w + F3 * A.form v w

/-- **Three coefficients are exactly enough.** The parity-even half of this statement is
upstream's `Tensors.Hadronic.exists_isF1F2Decomposition`. -/
theorem exists_isF1F2F3Decomposition {V : Type} [AddCommGroup V] [Module ℝ V]
    (g : Kinematics.Bilin V) (K : Kinematics.DisKinematics V)
    (A : ParityOddForm V g K) (W : Kinematics.Bilin V)
    (hcov : Tensors.Hadronic.IsLorentzCovariant g K W)
    (hcons : ∀ v, W K.q v = 0 ∧ W v K.q = 0) :
    ∃ F1 F2 F3, IsF1F2F3Decomposition g K A W F1 F2 F3 := by
  sorry

/-! ## Layer 1: the inclusive cross section and positivity -/

/-- The inelasticity combination `Y₊ = 1 + (1-y)²`. -/
noncomputable def Yplus (y : ℝ) : ℝ := 1 + (1 - y) ^ 2

/-- The inelasticity combination `Y₋ = 1 - (1-y)²`. -/
noncomputable def Yminus (y : ℝ) : ℝ := 1 - (1 - y) ^ 2

/-- `Y₊` is twice the upstream inelasticity factor. This is the bridge that lets the Layer 1
cross section be compared with `loNCdSigma`. -/
theorem Yplus_eq_two_mul_yFactor (y : ℝ) : Yplus y = 2 * yFactor y := by
  sorry

/-- The bracket of the inclusive cross section, `Y₊ F₂ ∓ Y₋ x F₃ - y² F_L`. The sign `s` is the
lepton-beam charge; the exchange-dependent flux factor is supplied separately, since its
propagator content belongs to `ElectroweakAndBSM`. -/
noncomputable def crossSectionBracket (S : StructureFunctions) (M s x Q2 y : ℝ) : ℝ :=
  Yplus y * S.F2 x Q2 - s * Yminus y * (x * S.F3 x Q2)
    - y ^ 2 * FLExact M x Q2 (S.F1 x Q2) (S.F2 x Q2)

/-- The reduced cross section `σ_r = F₂ ∓ (Y₋/Y₊) x F₃ - (y²/Y₊) F_L`. -/
noncomputable def reduced (S : StructureFunctions) (M s x Q2 y : ℝ) : ℝ :=
  crossSectionBracket S M s x Q2 y / Yplus y

/-- **Compatibility with the upstream leading-order cross section.** With no parity-odd and no
longitudinal contribution the bracket collapses to `Y₊ F₂`, which is the content of
`loNCdSigma`. -/
theorem crossSectionBracket_of_callanGross (S : StructureFunctions) (x Q2 y : ℝ)
    (h3 : S.F3 x Q2 = 0)
    (hL : Tensors.Longitudinal.IsCallanGross x (S.F1 x Q2) (S.F2 x Q2)) (hQ : Q2 ≠ 0) :
    crossSectionBracket S 0 1 x Q2 y = 2 * yFactor y * S.F2 x Q2 := by
  sorry

/-- The forward helicity amplitude matrix in the current-helicity basis `(+1, 0, -1)`. The
positive-semidefiniteness field carries the physical content: the diagonal entries are
absorption cross sections. -/
structure HelicityMatrix where
  /-- The matrix of forward helicity amplitudes. -/
  mat : Matrix (Fin 3) (Fin 3) ℝ
  /-- Positive semidefiniteness, i.e. the probability interpretation of the amplitudes. -/
  posSemidef : mat.PosSemidef

/-- `F₁` read off the helicity matrix: half the sum of the transverse diagonal entries. -/
noncomputable def F1OfHelicity (H : HelicityMatrix) : ℝ := (H.mat 0 0 + H.mat 2 2) / 2

/-- `F₃` read off the helicity matrix: the difference of the transverse diagonal entries. -/
def F3OfHelicity (H : HelicityMatrix) : ℝ := H.mat 2 2 - H.mat 0 0

/-- **Transverse positivity**, with no positivity hypothesis beyond the helicity matrix. -/
theorem F1OfHelicity_nonneg (H : HelicityMatrix) : 0 ≤ F1OfHelicity H := by
  sorry

/-- **The parity-odd bound** `|F₃| ≤ 2 F₁`, from non-negativity of each transverse diagonal
entry separately. -/
theorem abs_F3OfHelicity_le (H : HelicityMatrix) :
    |F3OfHelicity H| ≤ 2 * F1OfHelicity H := by
  sorry

/-! ## Layer 2: the quark-parton model, Callan-Gross and flavour -/

/-- The parton-model `F₂ = x ∑_f e_f² (f + f̄)`. -/
noncomputable def f2QPM {Flavor : Type} [Fintype Flavor]
    (e : Flavor → ℝ) (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor) (x Q2 : ℝ) : ℝ :=
  x * ∑ i, e i ^ 2 * f i x Q2

/-- The parton-model `F₁ = (1/2) ∑_f e_f² (f + f̄)`. -/
noncomputable def f1QPM {Flavor : Type} [Fintype Flavor]
    (e : Flavor → ℝ) (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor) (x Q2 : ℝ) : ℝ :=
  (∑ i, e i ^ 2 * f i x Q2) / 2

/-- **The parton-model `F₂` is the upstream leading-order `F₂`.** The two must not drift
apart. -/
theorem f2QPM_eq_f2LO {Flavor : Type} [Fintype Flavor]
    (e : Flavor → ℝ) (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor) (x Q2 : ℝ) :
    f2QPM e f x Q2 = f2LO e f x Q2 := by
  sorry

/-- **Callan-Gross in the parton model**, for every density. -/
theorem isCallanGross_qpm {Flavor : Type} [Fintype Flavor]
    (e : Flavor → ℝ) (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor) (x Q2 : ℝ) :
    Tensors.Longitudinal.IsCallanGross x (f1QPM e f x Q2) (f2QPM e f x Q2) := by
  sorry

/-! ## Layer 3: sum rules as moment identities -/

/-- A weighted moment of a structure function at fixed virtuality. -/
noncomputable def momentF (F : ℝ → ℝ → ℝ) (w : ℝ → ℝ) (Q2 : ℝ) : ℝ :=
  ∫ x in (0:ℝ)..1, w x * F x Q2

/-- **The Adler sum rule.** The integrability hypothesis is on the charged-current difference,
not on either term; that is the substance of the statement. -/
theorem adler_sum_rule (F2nup F2nubarp : ℝ → ℝ → ℝ) (Q2 I3 : ℝ)
    (hint : IntervalIntegrable (fun x => (F2nubarp x Q2 - F2nup x Q2) / x)
      MeasureTheory.volume 0 1) :
    momentF (fun x Q2 => F2nubarp x Q2 - F2nup x Q2) (fun x => 1 / x) Q2 = 4 * I3 := by
  sorry

/-- **The Gottfried sum rule, as an identity.** The value `1/3` is the corollary obtained when
the sea asymmetry vanishes; it is not the content of the sum rule. -/
theorem gottfried_identity (F2ep F2en : ℝ → ℝ → ℝ) (seaAsymmetry Q2 : ℝ)
    (hint : IntervalIntegrable (fun x => (F2ep x Q2 - F2en x Q2) / x)
      MeasureTheory.volume 0 1) :
    momentF (fun x Q2 => F2ep x Q2 - F2en x Q2) (fun x => 1 / x) Q2
      = 1 / 3 + 2 / 3 * seaAsymmetry := by
  sorry

/-- **The Gross-Llewellyn Smith sum rule** with its first-order correction. The running coupling
is `CollinearEvolution`'s object and appears here only as a value. -/
theorem gross_llewellyn_smith (F3nuN : ℝ → ℝ → ℝ) (Q2 alphaS : ℝ)
    (hint : IntervalIntegrable (fun x => F3nuN x Q2) MeasureTheory.volume 0 1) :
    momentF F3nuN (fun _ => 1) Q2 = 3 * (1 - alphaS / Real.pi) := by
  sorry

/-! ## Layer 4: the operator product expansion in moment space -/

/-- The operator product expansion as a record of data: `wilson n τ r` is the Wilson coefficient
of the spin-`n`, twist-`τ` operator at scale ratio `r`, and `reduced n τ` its reduced matrix
element. This record derives nothing. -/
structure OPEData where
  /-- Wilson coefficients, indexed by spin, twist and scale ratio. -/
  wilson : ℕ → ℕ → ℝ → ℝ
  /-- Reduced matrix elements of the twist-`τ`, spin-`n` operators. -/
  reduced : ℕ → ℕ → ℝ

/-- The twist-two term of the expansion for the `n`-th moment. -/
noncomputable def twistTwoTerm (D : OPEData) (n : ℕ) (Q2 mu2 : ℝ) : ℝ :=
  D.wilson n 2 (Q2 / mu2) * D.reduced n 2

/-- The factorisation hypothesis, truncated at twist four: the `n`-th Bjorken moment of `F₂` is
the twist-two term plus a twist-four term suppressed by `1/Q²`. -/
def IsOPEFactorized (D : OPEData) (F2 : ℝ → ℝ → ℝ) (n : ℕ) (Q2 mu2 : ℝ) : Prop :=
  2 ≤ n ∧
  momentF F2 (fun x => x ^ (n - 2)) Q2
    = twistTwoTerm D n Q2 mu2 + D.wilson n 4 (Q2 / mu2) * D.reduced n 4 / Q2

/-- **The parton-model identification**, which ties the hypothesis bundle to something
measured. -/
theorem twistTwo_eq_mellinMoment {Flavor : Type} [Fintype Flavor]
    (e : Flavor → ℝ) (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor)
    (D : OPEData) (n : ℕ) (Q2 mu2 : ℝ) (hunit : ∀ r, D.wilson n 2 r = 1)
    (hfact : IsOPEFactorized D (f2QPM e f) n Q2 mu2) (hno4 : D.reduced n 4 = 0) :
    D.reduced n 2
      = ∑ i, e i ^ 2 * EpsilonEridani.Particles.Parton.PDF.mellinMoment f n i Q2 := by
  sorry

/-! ## Layer 5: target-mass corrections and the Nachtmann variable -/

/-- The Nachtmann radical `ρ = √(1 + 4 M² x² / Q²)`. -/
noncomputable def rho (M x Q2 : ℝ) : ℝ := Real.sqrt (1 + gammaSq M x Q2)

/-- The Nachtmann variable `ξ = 2x / (1 + ρ)`. -/
noncomputable def xi (M x Q2 : ℝ) : ℝ := 2 * x / (1 + rho M x Q2)

/-- At zero target mass the Nachtmann variable is the Bjorken variable. -/
theorem xi_zero_mass (x Q2 : ℝ) (hQ : 0 < Q2) : xi 0 x Q2 = x := by
  sorry

/-- The Nachtmann variable never exceeds the Bjorken variable. -/
theorem xi_le (M x Q2 : ℝ) (hM : 0 ≤ M) (hx : 0 ≤ x) (hQ : 0 < Q2) : xi M x Q2 ≤ x := by
  sorry

/-- **The defining algebraic identity**: `ξ` is the light-cone momentum fraction, the root of
`M² ξ² / Q² - ξ / x + 1 = 0`. The roadmap treats this, not the closed formula, as the meaning of
the definition. -/
theorem xi_lightCone_identity (M x Q2 : ℝ) (hx : 0 < x) (hQ : 0 < Q2) :
    M ^ 2 * xi M x Q2 ^ 2 / Q2 - xi M x Q2 / x + 1 = 0 := by
  sorry

/-- The Nachtmann variable at the elastic threshold is strictly below one for a massive target.
This is the inequality behind the open question of Layer 5.4: the target-mass-corrected
structure function does not vanish where it must. -/
theorem xi_one_lt_one (M Q2 : ℝ) (hM : 0 < M) (hQ : 0 < Q2) : xi M 1 Q2 < 1 := by
  sorry

/-- The kernel of the `F₂` Nachtmann moment. -/
noncomputable def nachtmannKernelF2 (n : ℕ) (M x Q2 : ℝ) : ℝ :=
  (xi M x Q2 ^ (n + 1) / x ^ 3)
    * ((3 + 3 * (n + 1) * rho M x Q2 + n * (n + 2) * rho M x Q2 ^ 2)
        / ((n + 2) * (n + 3)))

/-- The `F₂` Nachtmann moment. -/
noncomputable def nachtmannMomentF2 (F2 : ℝ → ℝ → ℝ) (n : ℕ) (M Q2 : ℝ) : ℝ :=
  ∫ x in (0:ℝ)..1, nachtmannKernelF2 n M x Q2 * F2 x Q2

/-- **What the Nachtmann kernels are for.** The Nachtmann moment of a target-mass-corrected
structure function is the Bjorken moment of the underlying leading-twist function, so its scale
dependence is that of the twist-two Wilson coefficient alone. `hGP` is the hypothesis that
`F2tmc` was built from `F2lt` by the Georgi-Politzer construction of Layer 5.2. -/
theorem nachtmannMomentF2_eq_bjorkenMoment (F2lt : ℝ → ℝ) (F2tmc : ℝ → ℝ → ℝ) (n : ℕ) (M Q2 : ℝ)
    (hM : 0 ≤ M) (hQ : 0 < Q2) (hn : 2 ≤ n)
    (hGP : ∀ x, 0 < x → x < 1 → F2tmc x Q2 = F2lt (xi M x Q2)) :
    nachtmannMomentF2 F2tmc n M Q2 = ∫ u in (0:ℝ)..1, u ^ (n - 2) * F2lt u := by
  sorry

/-- **The massless limit of the kernel** is the Bjorken weight `x^(n-2)`: the cheapest check
that the kernel was transcribed correctly. -/
theorem nachtmannKernelF2_zero_mass (n : ℕ) (x Q2 : ℝ) (hx : 0 < x) (hQ : 0 < Q2) :
    nachtmannKernelF2 n 0 x Q2 = x ^ (n - 2) := by
  sorry

end EpsilonEridaniRoadmap.InclusiveStructureFunctions

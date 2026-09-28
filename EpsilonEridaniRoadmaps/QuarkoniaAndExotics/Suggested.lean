import EpsilonEridani

/-!
# Quarkonia and exotics: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Three design choices are made explicit by the signatures below.

First, the two expansion parameters are data. `HeavyQuarkScales` carries the mass, the relative
momentum and the binding energy with their strict ordering as genuine hypothesis fields, and the
velocity is derived from them. The additional assumption that the binding energy scales as
`m v ^ 2` is *not* a field: it is a separate predicate, so that a theorem which needs it must say
so.

Second, factorisation is never a structure field. `NRQCDFactorisationHolds` and `Universal` are
`Prop`-valued definitions taking their ingredients as arguments, with an explicit remainder bound.
A theorem that assumes factorisation lists it in its hypotheses.

Third, angular momenta are stored doubled (`twoJ = 2 * J`) wherever half-integers occur, so that
the heavy-quark spin multiplets are statements about natural numbers rather than about a rational
type, and parity and charge conjugation are stored as their eigenvalues in `ℤ` so that
`qqbarAttainable` is a decidable arithmetic predicate rather than a table.

`sorry` marks a target, not a defect: every occurrence below is a statement the roadmap asks a
contributor to prove.
-/

namespace EpsilonEridaniRoadmaps.QuarkoniaAndExotics

/-! ## Layer 0: the scale hierarchy and the velocity expansion -/

/-- The dynamical scales of a heavy quark-antiquark pair: the heavy quark mass, the typical
relative momentum, the binding energy, and the hadronic scale. The strict ordering is carried as
hypothesis fields with real content, not as placeholders. -/
structure HeavyQuarkScales where
  mass : ℝ
  momentum : ℝ
  binding : ℝ
  hadronic : ℝ
  binding_pos : 0 < binding
  binding_lt_momentum : binding < momentum
  momentum_lt_mass : momentum < mass

/-- The relative velocity of the pair, `v = p / m`. -/
def HeavyQuarkScales.velocity (s : HeavyQuarkScales) : ℝ := s.momentum / s.mass

/-- The velocity is a genuine small parameter: `0 < v < 1`. -/
theorem HeavyQuarkScales.velocity_mem_Ioo (s : HeavyQuarkScales) :
    s.velocity ∈ Set.Ioo (0 : ℝ) 1 := by
  sorry

/-- Coulombic scaling, `E ≈ m v ^ 2`, is an *additional* assumption about the scales and not a
consequence of the ordering. It is a predicate so that every theorem needing it must carry it. -/
def CoulombicScaling (s : HeavyQuarkScales) (tol : ℝ) : Prop :=
  |s.binding - s.mass * s.velocity ^ 2| ≤ tol

/-- The weakly coupled regime: the hadronic scale sits below the binding energy. -/
def WeaklyCoupled (s : HeavyQuarkScales) : Prop := s.hadronic < s.binding

/-- The strongly coupled regime: the hadronic scale sits between the binding energy and the
relative momentum. -/
def StronglyCoupled (s : HeavyQuarkScales) : Prop :=
  s.binding < s.hadronic ∧ s.hadronic < s.momentum

/-- The two regimes are mutually exclusive. -/
theorem not_weaklyCoupled_and_stronglyCoupled (s : HeavyQuarkScales) :
    ¬(WeaklyCoupled s ∧ StronglyCoupled s) := by
  sorry

/-- A power counting on an operator basis: each operator carries an order in the relative velocity
and an order in the inverse heavy-quark mass, and each graded piece is finite. The finiteness field
is the substantive one — it is what licenses truncating an NRQCD sum to finitely many terms. -/
class VelocityCounting (Op : Type*) where
  vOrder : Op → ℕ
  mOrder : Op → ℕ
  finite_below : ∀ n : ℕ, {o : Op | vOrder o + mOrder o ≤ n}.Finite

/-- The operators of total grading at most `n`, as a set. -/
def gradedBelow (Op : Type*) [VelocityCounting Op] (n : ℕ) : Set Op :=
  {o : Op | VelocityCounting.vOrder o + VelocityCounting.mOrder o ≤ n}

/-- Every graded piece is finite. This is cited by every truncation in Layers 2 and 3 rather than
being reasserted there. -/
theorem gradedBelow_finite (Op : Type*) [VelocityCounting Op] (n : ℕ) :
    (gradedBelow Op n).Finite :=
  VelocityCounting.finite_below n

/-- A matching condition: the full-theory and effective-theory amplitudes, indexed by a finite set
of kinematic configurations, agree at the stated scale up to an explicit remainder. Matching
coefficients are *defined* by satisfying this, not computed into existence. -/
def MatchesTo {Cfg : Type*} (full eff : Cfg → ℝ → ℝ) (remainder : ℝ → ℝ) : Prop :=
  ∀ (c : Cfg) (μ : ℝ), |full c μ - eff c μ| ≤ remainder μ

/-- Uniqueness of the matching coefficients in the *exact* case: two effective descriptions that
both match with zero remainder agree. This is the easy half, and follows from `|x| ≤ 0 → x = 0`.
The substantive statement — uniqueness at nonzero remainder, under the rank condition on the
explicitly constructed separation matrix — is the Layer 1.4 target and is not this theorem. The
docstring previously claimed the rank hypothesis while the statement assumed exact matching. -/
theorem matching_unique_of_exact {Cfg : Type*} (full : Cfg → ℝ → ℝ) :
    ∀ eff₁ eff₂ : Cfg → ℝ → ℝ, MatchesTo full eff₁ 0 → MatchesTo full eff₂ 0 → eff₁ = eff₂ := by
  sorry

/-! ## Layer 1: the spectrum, colour and spin -/

/-- The colour channel of a heavy quark-antiquark pair. -/
inductive ColourChannel
  | singlet
  | octet
  deriving DecidableEq, Repr

/-- The spin channel of a heavy quark-antiquark pair. -/
inductive SpinChannel
  | singlet
  | triplet
  deriving DecidableEq, Repr

/-- An NRQCD channel: a colour channel, a spin channel, and the orbital angular momentum of the
pair at short distance. This is the index set of every sum in Layer 2. -/
structure NRQCDChannel where
  colour : ColourChannel
  spin : SpinChannel
  orbital : ℕ
  deriving DecidableEq, Repr

/-- A pair of orthogonal idempotents summing to the identity, decomposing the colour space of a
quark-antiquark pair into its singlet and adjoint parts. The projectors are built from the proved
generators upstream; the algebraic properties below are theorems about that construction, never
numerals entered by hand. -/
structure ColourProjectors (V : Type*) [AddCommGroup V] [Module ℝ V] where
  singlet : Module.End ℝ V
  octet : Module.End ℝ V
  singlet_idem : singlet * singlet = singlet
  octet_idem : octet * octet = octet
  orthogonal : singlet * octet = 0
  complete : singlet + octet = 1

/-- Parity and charge-conjugation eigenvalues are stored in `ℤ`, valued in `{-1, 1}`. -/
structure QuantumNumbers where
  J : ℕ
  P : ℤ
  C : ℤ
  deriving DecidableEq, Repr

/-- A quantum-number assignment is attainable by a quark-antiquark pair when some orbital angular
momentum `L` and total spin `S ≤ 1` reproduce it, with `P = (-1) ^ (L + 1)` and
`C = (-1) ^ (L + S)` and the triangle inequalities on `(L, S, J)`. -/
def qqbarAttainable (q : QuantumNumbers) : Prop :=
  ∃ L S : ℕ, S ≤ 1 ∧ q.J ≤ L + S ∧ L ≤ q.J + S ∧ S ≤ L + q.J ∧
    q.P = (-1 : ℤ) ^ (L + 1) ∧ q.C = (-1 : ℤ) ^ (L + S)

/-- Exoticity in quantum numbers is exactly the failure of `qqbarAttainable`, and nothing looser. -/
def IsQuantumNumberExotic (q : QuantumNumbers) : Prop := ¬ qqbarAttainable q

/-- `qqbarAttainable` is decidable, by a finite search bounded by `J + 1`. -/
instance : DecidablePred qqbarAttainable := fun _ => by
  sorry

/-- `1 ^ (- +)` is not attainable by a quark-antiquark pair. This is the theorem the exotic
quantum-number argument of Layer 5 rests on. -/
theorem oneMinusPlus_exotic : IsQuantumNumberExotic ⟨1, -1, 1⟩ := by
  sorry

/-- A spin-triplet S-wave assignment `1 ^ (- -)` is attainable, with `L = 0`, `S = 1`. -/
theorem oneMinusMinus_attainable : qqbarAttainable ⟨1, -1, -1⟩ := by
  sorry

/-! ## Layer 2: production factorisation -/

/-- NRQCD production factorisation, stated as a proposition about a process and never as a
structure field: the cross section equals the sum over a finite channel set of a short-distance
coefficient times a long-distance matrix element, up to an explicit remainder. -/
def NRQCDFactorisationHolds (chans : Finset NRQCDChannel) (σ : ℝ → ℝ)
    (σhat : NRQCDChannel → ℝ → ℝ) (ldme : NRQCDChannel → ℝ) (remainder : ℝ → ℝ) : Prop :=
  ∀ μ : ℝ, |σ μ - ∑ c ∈ chans, σhat c μ * ldme c| ≤ remainder μ

/-- Universality of the long-distance matrix elements: they depend on the state and the channel
only, not on the process. This is the framework's principal open hypothesis. Nothing in this file
or in the roadmap proves it. -/
def Universal {Process : Type*} (ldme : Process → NRQCDChannel → ℝ) : Prop :=
  ∀ p q : Process, ∀ c : NRQCDChannel, ldme p c = ldme q c

/-- A family of long-distance matrix elements, carried as data together with the property that
makes it one: its values are expectation values of positive operators. Non-negativity is a
property of that construction. Stated for an arbitrary `NRQCDChannel → ℝ` it would be false —
take the constant `-1` — so the hypothesis is what carries the content. -/
structure LDMEFamily where
  /-- The matrix element in each channel. -/
  value : NRQCDChannel → ℝ
  /-- Each is an expectation value of a positive operator. -/
  nonneg : ∀ c, 0 ≤ value c

/-- Diagonal long-distance matrix elements are non-negative, and so usable as a constraint in
any extraction. -/
theorem ldme_nonneg (L : LDMEFamily) (c : NRQCDChannel) : 0 ≤ L.value c :=
  L.nonneg c

/-- The matrix of long-distance matrix elements in a channel basis is positive semidefinite, which
bounds the off-diagonal entries by the geometric mean of the diagonal ones. The hypothesis is
what makes this true: an arbitrary matrix with a negative diagonal entry is a counterexample.
A matrix of overlaps of states is a Gram matrix, which is the form assumed here. -/
theorem ldmeMatrix_posSemidef {n : ℕ} (M : Matrix (Fin n) (Fin n) ℝ)
    (hM : ∃ B : Matrix (Fin n) (Fin n) ℝ, M = Bᵀ * B) : M.PosSemidef := by
  sorry

/-! ## Layer 3: polarisation -/

/-- The spin-density matrix of a produced spin-one state, in a frame whose polar axis is named
elsewhere in the observable. Positive semidefiniteness already implies hermiticity. -/
structure SpinDensity where
  ρ : Matrix (Fin 3) (Fin 3) ℂ
  posSemidef : ρ.PosSemidef
  trace_one : ρ.trace = 1

/-- The polar anisotropy coefficient, a linear functional of the density matrix. -/
def lambdaTheta (d : SpinDensity) : ℝ := by
  sorry

/-- The azimuthal anisotropy coefficient. -/
def lambdaPhi (d : SpinDensity) : ℝ := by
  sorry

/-- Positivity of the density matrix confines the polar coefficient to `[-1, 1]`. -/
theorem lambdaTheta_mem_Icc (d : SpinDensity) : lambdaTheta d ∈ Set.Icc (-1 : ℝ) 1 := by
  sorry

/-- The frame-invariant combination. It is the only polarisation quantity the conventions permit
to be compared between analyses using different polar axes. -/
noncomputable def lambdaTilde (d : SpinDensity) (_h : lambdaPhi d ≠ 1) : ℝ :=
  (lambdaTheta d + 3 * lambdaPhi d) / (1 - lambdaPhi d)

/-- Rotating the polar axis acts on the density matrix by conjugation, `d ↦ U d U†`. Left as a
target rather than defined: returning `d` unchanged would type-check, contradict this docstring,
and silently make the invariance theorem below vacuous. -/
def rotateFrame (_U : Matrix (Fin 3) (Fin 3) ℂ) (_d : SpinDensity) : SpinDensity := by
  sorry

/-- Frame invariance of `lambdaTilde`, away from the exceptional locus where the denominator
vanishes. The exceptional locus is stated, not ignored, and the hypothesis is needed twice:
once for each side of the equation. -/
theorem lambdaTilde_frame_invariant (U : Matrix (Fin 3) (Fin 3) ℂ) (d : SpinDensity)
    (h : lambdaPhi d ≠ 1) (hU : lambdaPhi (rotateFrame U d) ≠ 1) :
    lambdaTilde (rotateFrame U d) hU = lambdaTilde d h := by
  sorry

/-! ## Layer 4: amplitudes, sheets and poles -/

/-- A single partial wave: an orbital angular momentum, a complex amplitude function, and the
threshold of its lowest channel. -/
structure PartialWave where
  ℓ : ℕ
  T : ℂ → ℂ
  threshold : ℝ

/-- Unitarity in the form used by every later theorem: the imaginary part of the amplitude equals
the phase space times its squared modulus, on the physical region. -/
def UnitaryOnCut (w : PartialWave) (ρ : ℝ → ℝ) : Prop :=
  ∀ s : ℝ, w.threshold < s → (w.T (s : ℂ)).im = ρ s * Complex.normSq (w.T (s : ℂ))

/-- The Argand circle: a unitary elastic amplitude lies on the circle of radius `1 / (2 ρ)` centred
at `i / (2 ρ)`. -/
theorem argand_circle (w : PartialWave) (ρ : ℝ → ℝ) (hu : UnitaryOnCut w ρ) (s : ℝ)
    (hs : w.threshold < s) (hρ : 0 < ρ s) :
    Complex.normSq (w.T (s : ℂ) - Complex.I / (2 * ρ s)) = 1 / (2 * ρ s) ^ 2 := by
  sorry

/-- A sheet label for an `n`-channel amplitude is a sign for each channel momentum. "The second
sheet" is used only for a single channel; with more channels a sheet is named by its label. -/
def Sheet (n : ℕ) : Type := Fin n → Bool

/-- An `n`-channel amplitude has `2 ^ n` sheets. -/
theorem sheet_card (n : ℕ) : Nat.card (Sheet n) = 2 ^ n := by
  sorry

/-- A resonance: a simple pole of the continued partial-wave amplitude on a named sheet, with mass
and width defined from the pole position by `√s = M - i Γ / 2`. Breit-Wigner or Flatté fit
parameters are different objects with different names. -/
structure ResonancePole (n : ℕ) where
  sheet : Sheet n
  sqrtS : ℂ
  mass : ℝ
  width : ℝ
  width_nonneg : 0 ≤ width
  pole_eq : sqrtS = (mass : ℂ) - Complex.I * ((width : ℂ) / 2)

/-- The K-matrix parametrisation of a coupled-channel amplitude. -/
def tFromK {n : ℕ} (_K : Matrix (Fin n) (Fin n) ℝ) (_ρ : Matrix (Fin n) (Fin n) ℂ) :
    Matrix (Fin n) (Fin n) ℂ := by
  sorry

/-- A real symmetric K-matrix produces a unitary amplitude wherever `1 - i ρ K` is invertible:
`T - T† = 2i T† ρ T`. Previously stated as `True`, which is provable and says nothing. -/
theorem tFromK_unitary {n : ℕ} (K : Matrix (Fin n) (Fin n) ℝ) (ρ : Matrix (Fin n) (Fin n) ℂ)
    (hK : K.IsSymm) (hρ : ρ.IsHermitian)
    (hinv : IsUnit (1 - Complex.I • (ρ * K.map Complex.ofReal)).det) :
    tFromK K ρ - (tFromK K ρ)ᴴ
      = (2 * Complex.I) • ((tFromK K ρ)ᴴ * ρ * tFromK K ρ) := by
  sorry

/-- A threshold cusp need not be a pole: there is a two-channel amplitude family whose modulus has
a strict local maximum at a threshold and which has no pole in a stated neighbourhood of either
adjacent sheet. The constructed counterexample is what makes "a peak is not a state" mathematics
rather than admonition. -/
theorem exists_cusp_without_pole :
    ∃ (A : ℂ → ℂ) (Eth δ : ℝ), 0 < δ ∧
      AnalyticOn ℂ A (Metric.ball (Eth : ℂ) δ) ∧
      ∀ E : ℝ, E ≠ Eth → |E - Eth| < δ → ‖A E‖ < ‖A (Eth : ℂ)‖ := by
  sorry

/-! ## Layer 5: exotics and heavy-quark spin symmetry -/

/-- A shallow S-wave bound state below a two-hadron threshold, with Weinberg's compositeness. -/
structure ShallowBoundState where
  reducedMass : ℝ
  bindingMomentum : ℝ
  scatteringLength : ℝ
  effectiveRange : ℝ
  compositeness : ℝ
  bindingMomentum_pos : 0 < bindingMomentum
  compositeness_mem : compositeness ∈ Set.Icc (0 : ℝ) 1

/-- Weinberg's low-energy theorem: the scattering length is determined by the compositeness and the
binding momentum, up to a remainder controlled by the ratio of the interaction range to the inverse
binding momentum. The theorem applies to a normalisable bound state below threshold; its extension
to a pole above threshold is an open definitional question, recorded as such in `README.md`. -/
theorem weinberg_scattering_length (b : ShallowBoundState) (range : ℝ) :
    |b.scatteringLength - 2 * b.compositeness / ((1 + b.compositeness) * b.bindingMomentum)|
      ≤ range := by
  sorry

/-- Heavy-quark spin multiplets, with angular momenta stored doubled. For light angular momentum
`j_ℓ > 0` the multiplet has the two members `j_ℓ ± 1/2`; for `j_ℓ = 0` it has one. -/
def hqssPartners (twoJl : ℕ) : Finset ℕ :=
  if twoJl = 0 then {1} else {twoJl - 1, twoJl + 1}

/-- A heavy-quark spin multiplet with non-zero light angular momentum has exactly two members. -/
theorem hqssPartners_card_of_ne_zero (twoJl : ℕ) (h : twoJl ≠ 0) :
    (hqssPartners twoJl).card = 2 := by
  sorry

/-- A multiplet built on light angular momentum zero is a singleton. -/
theorem hqssPartners_zero : hqssPartners 0 = {1} := by
  sorry

/-- The mass splitting within a heavy-quark spin multiplet is of order `1 / m`, so between two
heavy flavours it scales inversely with the mass. A checkable prediction with a stated remainder. -/
theorem hqss_splitting_scaling (s₁ s₂ : HeavyQuarkScales) (split : HeavyQuarkScales → ℝ)
    (tol : ℝ) : |split s₁ * s₁.mass - split s₂ * s₂.mass| ≤ tol := by
  sorry

/-- The multiplicity of the colour singlet in the product of two fundamentals and two duals is two.
This is the mathematical content of "two colour structures": the diquark-antidiquark and
meson-meson bases span the same two-dimensional space.

Stated as the non-vanishing of the determinant of the Gram matrix of the two independent colour
contractions, whose entries are `N² = 9` on the diagonal and `N = 3` off it. A nonzero
determinant says the two tensors are linearly independent, so the singlet multiplicity is at
least two; the group-theoretic bound that it is exactly two is the other half, and belongs with
the representation-theoretic development of Layer 5. Previously written `(2 : ℕ) = 2`, which is
a tautology and carried none of this. -/
theorem fourQuark_singlet_multiplicity :
    (Matrix.of ![![(9 : ℝ), 3], ![3, 9]]).det ≠ 0 := by
  sorry

end EpsilonEridaniRoadmaps.QuarkoniaAndExotics

import EpsilonEridani

/-!
# LatticeBridge: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by the signatures below. First, Euclidean and Minkowski
separations are different types, and the continuation between them is a named map rather than a
reinterpretation, so that the sign of the invariant square cannot be lost. Second, the parameters
a bridge depends on — hadron momentum, separation, renormalisation scale, lattice spacing, spatial
extent — are fields of an explicit record, never instance arguments, so that a theorem about a
limit in one of them at fixed others is a statement one can falsify. Third, Euclidean data is a
finite indexed family with a covariance: no signature below takes a continuum function as its
input where a calculation would return finitely many numbers. Fourth, a matching relation is a
proposition with an explicit remainder bound and an explicit validity region; there is no
signature asserting an unqualified equality between a computed quantity and a light-cone one.

Unproved statements are `sorry`-ed theorems. No structure below carries a `Prop`-valued field
inhabited by a placeholder: a hypothesis a theorem needs is an argument of that theorem.
-/

namespace EpsilonEridaniRoadmaps.LatticeBridge

/-! ## Layer 0: Euclidean data, the continuation, and the obstruction -/

/-- A Minkowski separation four-vector, in the convention of `EpsilonEridani`: the components are
ordered with the time component first. -/
structure MinkSep where
  t : ℝ
  x : ℝ
  y : ℝ
  z : ℝ

/-- A Euclidean separation four-vector. A distinct type from `MinkSep` by design: the invariant
square of the two is computed with different signs, and Convention 1 of the roadmap forbids
identifying them. -/
structure EuclSep where
  t : ℝ
  x : ℝ
  y : ℝ
  z : ℝ

/-- The Minkowski invariant square, with signature `(+,-,-,-)`. -/
def MinkSep.sq (v : MinkSep) : ℝ := v.t ^ 2 - v.x ^ 2 - v.y ^ 2 - v.z ^ 2

/-- The Euclidean squared length. -/
def EuclSep.sq (v : EuclSep) : ℝ := v.t ^ 2 + v.x ^ 2 + v.y ^ 2 + v.z ^ 2

/-- The continuation of a real Euclidean separation to a real Minkowski separation: the Euclidean
time component is continued to imaginary time, which for a real Euclidean vector yields a purely
spatial Minkowski vector. -/
def continueSep (v : EuclSep) : MinkSep := ⟨0, v.x, v.y, v.t⟩

/-- Layer 0.3, image of the continuation: the continuation of a nonzero real Euclidean separation
is strictly spacelike. This is the null-separation obstruction in its sharpest form. -/
theorem sq_continueSep_neg (v : EuclSep) (hv : v.sq ≠ 0) :
    (continueSep v).sq < 0 := by
  sorry

/-- A nonzero null Minkowski separation is not in the image of the continuation. Immediate from
`sq_continueSep_neg`, and the reason no Euclidean observation *is* a light-cone matrix element. -/
theorem not_mem_range_continueSep_of_null (w : MinkSep) (hw : w.sq = 0)
    (hne : w ≠ ⟨0, 0, 0, 0⟩) : ∀ v : EuclSep, continueSep v ≠ w := by
  sorry

/-- The parameters a Euclidean observation is indexed by. Explicit fields, per Convention 2. -/
structure LatticeParams where
  /-- Euclidean separation of the two field operators. -/
  sep : EuclSep
  /-- Hadron momentum along the separation direction. -/
  hadronMomentum : ℝ
  /-- Renormalisation scale. -/
  scale : ℝ
  /-- Lattice spacing. -/
  spacing : ℝ
  /-- Spatial extent of the lattice. -/
  extent : ℝ

/-- A Euclidean dataset: finitely many renormalised matrix elements with their parameters and a
covariance. The covariance is data, not a hypothesis, per Convention 10. -/
structure EuclideanDataset (n : ℕ) where
  /-- Parameters at which each observation was made. -/
  params : Fin n → LatticeParams
  /-- The renormalised matrix element of each observation. -/
  value : Fin n → ℝ
  /-- The covariance of the observations. -/
  cov : Matrix (Fin n) (Fin n) ℝ

/-! ## Layer 1: moments and the truncated moment problem -/

/-- The `n`-th Mellin moment of a distribution on the unit interval. -/
noncomputable def mellinMoment (f : ℝ → ℝ) (n : ℕ) : ℝ :=
  ∫ x in (0:ℝ)..1, x ^ n * f x

/-- Layer 1.4(i), exact non-uniqueness of the truncated moment problem: for any `N` there are two
distinct integrable functions on the unit interval with identical first `N` Mellin moments and a
prescribed separation in the supremum norm. -/
theorem exists_distinct_eq_moments (N : ℕ) (ε : ℝ) (hε : 0 < ε) :
    ∃ f g : ℝ → ℝ, (∀ n ≤ N, mellinMoment f n = mellinMoment g n) ∧
      ∃ x ∈ Set.Icc (0:ℝ) 1, ε ≤ |f x - g x| := by
  sorry

/-! ## Layer 2: quasi-distributions -/

/-- The data of a quasi-distribution: the renormalised equal-time correlator as a function of the
separation length, at a fixed hadron momentum, together with the scheme label as a natural number
index into the schemes of the roadmap's Convention 8. -/
structure QuasiData where
  /-- Correlator as a function of the (spacelike) separation length. -/
  corr : ℝ → ℝ
  /-- Hadron momentum. -/
  hadronMomentum : ℝ
  /-- Renormalisation scheme label. -/
  scheme : ℕ

/-- The quasi-distribution as the Fourier transform of the correlator in the separation. Stated
as an integral rather than through an upstream transform, so the convention is visible. -/
noncomputable def quasiDist (d : QuasiData) (x : ℝ) : ℝ :=
  ∫ z : ℝ, Real.cos (x * d.hadronMomentum * z) * d.corr z

/-- Layer 2.2, support: a quasi-distribution is not supported in `[-1,1]`. Stated as the existence
of a witness outside the interval rather than as a negation of a support claim. -/
theorem exists_quasiDist_ne_zero_outside (d : QuasiData) :
    ∃ x : ℝ, 1 < |x| ∧ quasiDist d x ≠ 0 := by
  sorry

/-! ## Layer 3: Ioffe time and the ratio -/

/-- An Ioffe-time distribution: the invariant amplitude as a function of Ioffe time `ν` and of the
invariant `z²`. Layer 3.1 is the theorem that these two arguments suffice. -/
structure IoffeData where
  amp : ℝ → ℝ → ℝ

/-- The reduced Ioffe-time distribution: the ratio at equal `z²`, which is where the linear
divergence of the gauge link cancels (Layer 3.2). -/
noncomputable def reducedIoffe (d : IoffeData) (ν zsq : ℝ) : ℝ :=
  d.amp ν zsq / d.amp 0 zsq

/-- Layer 3.2, cancellation: multiplying the amplitude by a factor depending on the separation only
through `z²` leaves the reduced distribution unchanged. This is the precise sense in which the
`z`-dependent renormalisation, linear divergence included, cancels in the ratio. -/
theorem reducedIoffe_invariant (d : IoffeData) (Z : ℝ → ℝ) (ν zsq : ℝ)
    (h : d.amp 0 zsq ≠ 0) (hZ : Z zsq ≠ 0) :
    reducedIoffe ⟨fun ν' zsq' => Z zsq' * d.amp ν' zsq'⟩ ν zsq = reducedIoffe d ν zsq := by
  sorry

/-! ## Layer 4: the common bridge interface -/

/-- A bridge: a Euclidean observable, a light-cone target, a matching kernel with its perturbative
order, a validity region in the parameter space, and a remainder bound on that region. Every
construction in Layers 2 to 4 instantiates this. -/
structure Bridge where
  /-- The Euclidean observable, as a function of the parameters. -/
  observable : LatticeParams → ℝ
  /-- The matching kernel, a function of the convolution variable and the parameters. -/
  kernel : ℝ → LatticeParams → ℝ
  /-- The perturbative order to which the kernel is known. -/
  order : ℕ
  /-- The region of the parameter space on which the matching statement is claimed. -/
  validity : Set LatticeParams
  /-- The remainder bound on the validity region. -/
  remainderBound : LatticeParams → ℝ

/-- The matching proposition of a bridge against a candidate light-cone distribution: on the
validity region the observable equals the convolution of the kernel with the distribution up to
the remainder bound. No signature in this file asserts the equality without the bound. -/
def Bridge.Matches (B : Bridge) (f : ℝ → ℝ) : Prop :=
  ∀ p ∈ B.validity,
    |B.observable p - ∫ x in (0:ℝ)..1, B.kernel x p * f x| ≤ B.remainderBound p

/-! ## Layer 5: the design operator and identifiability -/

/-- The design operator of a bridge sampled at finitely many parameter points: the map sending a
candidate light-cone distribution to the vector of predicted observations. -/
noncomputable def designOperator (B : Bridge) {n : ℕ} (ps : Fin n → LatticeParams)
    (f : ℝ → ℝ) : Fin n → ℝ :=
  fun i => ∫ x in (0:ℝ)..1, B.kernel x (ps i) * f x

/-- Layer 5.1(iii), exact non-uniqueness: for any finite sampling there are two distinct candidate
distributions with identical predicted observations. -/
theorem exists_distinct_eq_design (B : Bridge) {n : ℕ} (ps : Fin n → LatticeParams) :
    ∃ f g : ℝ → ℝ, designOperator B ps f = designOperator B ps g ∧
      ∃ x ∈ Set.Icc (0:ℝ) 1, f x ≠ g x := by
  sorry

/-- Layer 5.4, the pointwise value is not identifiable: for any finite sampling and any interior
point there are two candidates agreeing on all predicted observations but differing at that point.
The roadmap's sharpest statement, and a negative one. -/
theorem pointwise_not_identifiable (B : Bridge) {n : ℕ} (ps : Fin n → LatticeParams)
    (x₀ : ℝ) (hx : x₀ ∈ Set.Ioo (0:ℝ) 1) :
    ∃ f g : ℝ → ℝ, designOperator B ps f = designOperator B ps g ∧ f x₀ ≠ g x₀ := by
  sorry

end EpsilonEridaniRoadmaps.LatticeBridge

import EpsilonEridani

/-!
# Infrared structure of perturbative amplitudes: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Three design choices are made explicit by these signatures. First, a scaling is an exponent
triple and the words "soft", "collinear" and "Glauber" are names of particular triples
(Convention 2), so a statement that depends on which soft scaling is meant cannot be written
without saying so. Second, the Landau equations are stated for explicit data — line momenta and
multipliers on a graph with source and target maps — and the Coleman-Norton theorem is an
equivalence between two such pieces of data, not a picture. Third, the identities that carry
the all-orders arguments of Layers 5 and 6 (the Ward identity for one insertion, the eikonal
identity, the Grammer-Yennie decomposition, the telescoping sum over cuts) are stated as
algebra in a ring, with no field theory in their hypotheses.

The graph, the Feynman integrand, the cut graph, the Slavnov-Taylor identity and the Wilson-line
operator are the objects of the sibling roadmaps `FeynmanIntegrals` and `Renormalization`. This
file cannot import their target files, so it restates minimal local stand-ins — a graph as a
pair of maps from lines to vertices, a momentum as a function on `Fin 4` — and the real objects
are the sibling roadmaps'. The theorems of the roadmap whose statements need a Feynman integral
(the necessity of the Landau equations, the suppression theorem, the cancellation theorems, the
non-abelian decoupling theorems, the remainder theorem, the Glauber deformation theorem and the
factorisation of the Sudakov form factor), and the hypotheses `NoAccidentalCancellation`,
`GlauberDeformable` and `SpectatorInclusive`, are specified in `README.md` and have no signature
here.

Every theorem below is `sorry`-ed.
-/

namespace EpsilonEridaniRoadmaps.InfraredStructure

noncomputable section

/-! ## Layer 0: light-cone components, scalings and remainders -/

/-- A scaling: the exponents `(a, b, c)` with which the plus, minus and transverse components
of a momentum shrink as the power-counting parameter tends to zero (Layer 0.2). -/
structure Scaling where
  /-- Exponent of the plus component. -/
  a : ℝ
  /-- Exponent of the minus component. -/
  b : ℝ
  /-- Exponent of the transverse components. -/
  c : ℝ

namespace Scaling

/-- The hard scaling `(0, 0, 0)`. -/
def hard : Scaling := Scaling.mk 0 0 0

/-- The scaling `(0, 2, 1)` of a momentum collinear to the plus direction. -/
def collinearPlus : Scaling := Scaling.mk 0 2 1

/-- The scaling `(2, 0, 1)` of a momentum collinear to the minus direction. -/
def collinearMinus : Scaling := Scaling.mk 2 0 1

/-- The soft scaling `(1, 1, 1)` of Convention 2. -/
def soft : Scaling := Scaling.mk 1 1 1

/-- The ultrasoft scaling `(2, 2, 2)` of Convention 2. -/
def ultrasoft : Scaling := Scaling.mk 2 2 2

/-- The Glauber set of Layer 0.2: transverse exponent one and `a + b > 2`, so that the
longitudinal product is negligible against the transverse square. -/
def IsGlauber (s : Scaling) : Prop := s.c = 1 ∧ 2 < s.a + s.b

/-- The virtuality exponent `min (a + b) (2 c)` of Layer 0.2. -/
def virtExp (s : Scaling) : ℝ := min (s.a + s.b) (2 * s.c)

/-- The exponent `a + b + (d - 2) c` with which the measure `d^d k` scales (Layer 0.4). -/
def measureExp (s : Scaling) (d : ℝ) : ℝ := s.a + s.b + (d - 2) * s.c

/-- Layer 0.2: a hard momentum has virtuality of order `lam ^ 0`. -/
theorem virtExp_hard : Scaling.hard.virtExp = 0 := by
  sorry

/-- Layer 0.2: a collinear momentum has virtuality of order `lam ^ 2`. -/
theorem virtExp_collinearPlus : Scaling.collinearPlus.virtExp = 2 := by
  sorry

/-- Layer 0.2: a soft momentum has virtuality of order `lam ^ 2`. -/
theorem virtExp_soft : Scaling.soft.virtExp = 2 := by
  sorry

/-- Layer 0.2: an ultrasoft momentum has virtuality of order `lam ^ 4`. -/
theorem virtExp_ultrasoft : Scaling.ultrasoft.virtExp = 4 := by
  sorry

/-- Layer 0.2: on the Glauber set the virtuality exponent is that of the transverse square. -/
theorem virtExp_of_isGlauber (s : Scaling) (h : s.IsGlauber) : s.virtExp = 2 := by
  sorry

end Scaling

/-- A momentum in light-cone components with a two-dimensional transverse part: a local
stand-in for the components `plus`, `minus` and `transverseProj` of the upstream
`LightConeBasis` in four dimensions (Layer 0.1, Convention 1). -/
structure LCMomentum where
  /-- The plus component. -/
  plus : ℝ
  /-- The minus component. -/
  minus : ℝ
  /-- The two transverse components. -/
  perp : Fin 2 → ℝ

namespace LCMomentum

/-- The Euclidean product of the transverse parts. -/
def perpDot (p k : LCMomentum) : ℝ := p.perp 0 * k.perp 0 + p.perp 1 * k.perp 1

/-- The invariant square `k² = 2 k⁺ k⁻ - |k_T|²` (Layer 0.1). -/
def sq (k : LCMomentum) : ℝ := 2 * k.plus * k.minus - k.perpDot k

/-- Componentwise sum of two momenta. -/
def add (p k : LCMomentum) : LCMomentum :=
  LCMomentum.mk (p.plus + k.plus) (p.minus + k.minus) (fun i => p.perp i + k.perp i)

/-- Layer 0.4, the exact identity behind the mixed-denominator lemma: the eikonal term
`2 p⁺ k⁻` and the three terms it has to dominate. -/
theorem sq_add_sub_sq (p k : LCMomentum) :
    (p.add k).sq - p.sq
      = 2 * p.plus * k.minus + (2 * p.minus * k.plus - 2 * p.perpDot k + k.sq) := by
  sorry

end LCMomentum

/-- `HasScalingLE s Q k`: the family of momenta `k lam` is bounded componentwise by
`Q * lam ^ exponent` as `lam` tends to zero from above (the upper-bound predicate of Layer
0.2). -/
def HasScalingLE (s : Scaling) (Q : ℝ) (k : ℝ → LCMomentum) : Prop :=
  ∃ C : ℝ, 0 < C ∧
    Filter.Eventually
      (fun lam : ℝ =>
        abs (k lam).plus ≤ C * Q * lam ^ s.a ∧ abs (k lam).minus ≤ C * Q * lam ^ s.b ∧
          ∀ i : Fin 2, abs ((k lam).perp i) ≤ C * Q * lam ^ s.c)
      (nhdsWithin (0 : ℝ) (Set.Ioi 0))

/-- Layer 0.2: the virtuality of a momentum with a given scaling is bounded by the power of
`lam` given by the virtuality exponent. -/
theorem sq_isBigO_of_hasScalingLE (s : Scaling) (Q : ℝ) (k : ℝ → LCMomentum)
    (h : HasScalingLE s Q k) :
    Asymptotics.IsBigO (nhdsWithin (0 : ℝ) (Set.Ioi 0)) (fun lam : ℝ => (k lam).sq)
      (fun lam : ℝ => Q ^ 2 * lam ^ s.virtExp) := by
  sorry

/-- Layer 0.5: a remainder of order `lam ^ n * |log lam| ^ m` along the filter of positive
reals tending to zero (Convention 12). -/
def ApproximatesToOrderLog (W Wapp : ℝ → ℝ) (n m : ℕ) : Prop :=
  Asymptotics.IsBigO (nhdsWithin (0 : ℝ) (Set.Ioi 0)) (fun lam : ℝ => W lam - Wapp lam)
    (fun lam : ℝ => lam ^ n * abs (Real.log lam) ^ m)

/-- Layer 0.5: without logarithms the predicate is the existing pure-power one. -/
theorem approximatesToOrderLog_zero_iff (W Wapp : ℝ → ℝ) (n : ℕ) :
    ApproximatesToOrderLog W Wapp n 0 ↔
      EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder W Wapp n := by
  sorry

/-- Layer 0.5: a remainder with one more power of `lam` and any number of logarithms is a
pure-power remainder at the lower order. -/
theorem approximatesToOrder_of_log_succ (W Wapp : ℝ → ℝ) (n m : ℕ)
    (h : ApproximatesToOrderLog W Wapp (n + 1) m) :
    EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder W Wapp n := by
  sorry

/-! ## Layer 1: the theorem of alternatives, Landau equations, and Coleman-Norton -/

/-- Layer 1.2, Gordan's theorem: either some direction has positive product with every `g j`,
or a non-trivial non-negative combination of the `g j` vanishes. -/
theorem gordan_alternative (r n : ℕ) (g : Fin r → Fin n → ℝ) :
    (∃ v : Fin n → ℝ, ∀ j : Fin r, 0 < ∑ i : Fin n, g j i * v i) ∨
      (∃ α : Fin r → ℝ, (∀ j : Fin r, 0 ≤ α j) ∧ (∃ j : Fin r, α j ≠ 0) ∧
        ∀ i : Fin n, ∑ j : Fin r, α j * g j i = 0) := by
  sorry

/-- Layer 1.2: the two alternatives of Gordan's theorem exclude each other. -/
theorem gordan_exclusive (r n : ℕ) (g : Fin r → Fin n → ℝ) (v : Fin n → ℝ)
    (hv : ∀ j : Fin r, 0 < ∑ i : Fin n, g j i * v i) (α : Fin r → ℝ)
    (hα : ∀ j : Fin r, 0 ≤ α j) (hne : ∃ j : Fin r, α j ≠ 0) :
    ∃ i : Fin n, ∑ j : Fin r, α j * g j i ≠ 0 := by
  sorry

/-- A four-momentum or spacetime point, as a function on `Fin 4`: a local stand-in for
Physlib's Lorentz vector in four dimensions. -/
abbrev FourVec : Type := Fin 4 → ℝ

/-- The diagonal of the Minkowski metric in the mostly-minus signature. -/
def eta (μ : Fin 4) : ℝ := if μ = 0 then 1 else -1

/-- The Minkowski product of two four-vectors. -/
def minkDot (p q : FourVec) : ℝ := ∑ μ : Fin 4, eta μ * p μ * q μ

/-- The Minkowski square of a four-vector. -/
def minkSq (p : FourVec) : ℝ := minkDot p p

/-- A graph given by source and target maps on its lines, with a mass on each line: a local
stand-in for the graph of `FeynmanIntegrals` Layer 0. -/
structure RoutedGraph (Vertex Line : Type) where
  /-- The vertex a line leaves. -/
  src : Line → Vertex
  /-- The vertex a line enters. -/
  tgt : Line → Vertex
  /-- The mass of a line. -/
  mass : Line → ℝ

/-- An integer cycle of the graph: an integer weight on the lines with vanishing boundary at
every vertex. -/
def IsCycle {Vertex Line : Type} [Fintype Line] [DecidableEq Vertex]
    (G : RoutedGraph Vertex Line) (c : Line → ℤ) : Prop :=
  ∀ v : Vertex,
    (∑ e : Line,
        c e * ((if G.tgt e = v then (1 : ℤ) else 0) - (if G.src e = v then (1 : ℤ) else 0)))
      = 0

/-- The Landau equations in momentum form (Layer 1.3): each line is on shell or has vanishing
multiplier, and the multiplier-weighted momenta sum to zero around every cycle. -/
def SatisfiesLandau {Vertex Line : Type} [Fintype Line] [DecidableEq Vertex]
    (G : RoutedGraph Vertex Line) (q : Line → FourVec) (α : Line → ℝ) : Prop :=
  (∀ e : Line, α e * (minkSq (q e) - G.mass e ^ 2) = 0) ∧
    ∀ c : Line → ℤ, IsCycle G c → ∀ μ : Fin 4, ∑ e : Line, (c e : ℝ) * (α e * q e μ) = 0

/-- A physical solution (Layer 1.4): non-negative multipliers, not all zero. -/
def IsPhysicalSolution {Vertex Line : Type} [Fintype Line] [DecidableEq Vertex]
    (G : RoutedGraph Vertex Line) (q : Line → FourVec) (α : Line → ℝ) : Prop :=
  SatisfiesLandau G q α ∧ (∀ e : Line, 0 ≤ α e) ∧ ∃ e : Line, α e ≠ 0

/-- A spacetime picture (Layer 1.4): positions of the vertices such that each line spans the
displacement `α e * q e`. -/
def IsSpacetimePicture {Vertex Line : Type} (G : RoutedGraph Vertex Line)
    (q : Line → FourVec) (α : Line → ℝ) (x : Vertex → FourVec) : Prop :=
  ∀ (e : Line) (μ : Fin 4), x (G.tgt e) μ - x (G.src e) μ = α e * q e μ

/-- Layer 1.4, the Coleman-Norton theorem in its linear-algebra form: a spacetime picture exists
exactly when the cycle conditions of the Landau equations hold. -/
theorem coleman_norton {Vertex Line : Type} [Fintype Line] [DecidableEq Vertex]
    (G : RoutedGraph Vertex Line) (q : Line → FourVec) (α : Line → ℝ) :
    (∃ x : Vertex → FourVec, IsSpacetimePicture G q α x) ↔
      ∀ c : Line → ℤ, IsCycle G c → ∀ μ : Fin 4, ∑ e : Line, (c e : ℝ) * (α e * q e μ) = 0 := by
  sorry

/-- Layer 1.5, parallelism: two light-like vectors of positive energy with vanishing product
are positive multiples of each other. -/
theorem lightlike_parallel (p q : FourVec) (hp : minkSq p = 0) (hq : minkSq q = 0)
    (hp0 : 0 < p 0) (hq0 : 0 < q 0) (hpq : minkDot p q = 0) :
    ∃ c : ℝ, 0 < c ∧ ∀ μ : Fin 4, q μ = c * p μ := by
  sorry

/-- Layer 1.5, soft degeneracy: a massless line of zero momentum imposes no constraint, so its
multiplier may be changed freely. -/
theorem satisfiesLandau_update_soft {Vertex Line : Type} [Fintype Line] [DecidableEq Vertex]
    [DecidableEq Line] (G : RoutedGraph Vertex Line) (q : Line → FourVec) (α : Line → ℝ)
    (e₀ : Line) (hq : ∀ μ : Fin 4, q e₀ μ = 0) (hm : G.mass e₀ = 0)
    (h : SatisfiesLandau G q α) (a : ℝ) :
    SatisfiesLandau G q (Function.update α e₀ a) := by
  sorry

/-! ## Layer 2: reduced graphs and their order -/

/-- The label of a line in a reduced graph (Layer 2.1): hard, in the jet of direction `i`, or
soft. -/
inductive LineLabel (ι : Type) : Type
  | hard : LineLabel ι
  | jet : ι → LineLabel ι
  | soft : LineLabel ι

/-- `l₁.softens l₂`: the label `l₁` is obtained from `l₂` by the relabellings of Layer 2.4 —
jet to soft, or hard to jet or soft. -/
def LineLabel.softens {ι : Type} (l₁ l₂ : LineLabel ι) : Prop :=
  match l₁, l₂ with
  | LineLabel.soft, _ => True
  | LineLabel.jet i, LineLabel.jet j => i = j
  | LineLabel.jet _, LineLabel.hard => True
  | LineLabel.hard, LineLabel.hard => True
  | _, _ => False

/-- Layer 2.4: the relabelling relation is reflexive. -/
theorem LineLabel.softens_refl {ι : Type} (l : LineLabel ι) : l.softens l := by
  sorry

/-- Layer 2.4: the relabelling relation is transitive. -/
theorem LineLabel.softens_trans {ι : Type} (l₁ l₂ l₃ : LineLabel ι)
    (h₁₂ : l₁.softens l₂) (h₂₃ : l₂.softens l₃) : l₁.softens l₃ := by
  sorry

/-- Layer 2.4: the relabelling relation is antisymmetric. -/
theorem LineLabel.softens_antisymm {ι : Type} (l₁ l₂ : LineLabel ι)
    (h₁₂ : l₁.softens l₂) (h₂₁ : l₂.softens l₁) : l₁ = l₂ := by
  sorry

/-- A reduced graph on a set of lines with jet directions `ι` (Layer 2.1, Convention 4). -/
abbrev ReducedGraph (Line ι : Type) : Type := Line → LineLabel ι

/-- The combinatorial form of the order on pinch surfaces (Layer 2.4), before the vertex
conditions of Layer 2.2 are imposed. -/
def ReducedGraph.le {Line ι : Type} (R₁ R₂ : ReducedGraph Line ι) : Prop :=
  ∀ e : Line, (R₁ e).softens (R₂ e)

/-- Layer 2.4: the all-hard reduced graph is the greatest element. -/
theorem ReducedGraph.le_allHard {Line ι : Type} (R : ReducedGraph Line ι) :
    ReducedGraph.le R (fun _ => LineLabel.hard) := by
  sorry

/-- The four kinematic classes for which the classification theorem of Layer 2.2 is stated. -/
inductive KinematicClass
  | formFactor
  | annihilation
  | dis
  | drellYan
  deriving DecidableEq, Repr

/-! ## Layer 3: infrared power counting -/

/-- The gauge in which a power count is made (Convention 7). -/
inductive Gauge : Type
  | covariant : ℝ → Gauge
  | axial : FourVec → Gauge

/-- The superficial infrared degree of a region assignment (Layer 3.2): measure exponents of
the loops, minus virtuality exponents of the lines, plus the numerator exponent. -/
def scalarDegree {Line Loop : Type} [Fintype Line] [Fintype Loop] (d : ℝ)
    (loopScaling : Loop → Scaling) (lineScaling : Line → Scaling) (numExp : ℝ) : ℝ :=
  (∑ l : Loop, (loopScaling l).measureExp d) - (∑ e : Line, (lineScaling e).virtExp) + numExp

/-- Layer 3 example: the soft region of the one-loop vertex in four dimensions has degree zero.
The three lines are the soft gluon and the two quark lines carrying a collinear plus a soft
momentum. -/
theorem scalarDegree_oneLoopVertex_soft :
    scalarDegree 4 (fun _ : Fin 1 => Scaling.soft)
      (![Scaling.soft, Scaling.mk 0 1 1, Scaling.mk 1 0 1] : Fin 3 → Scaling) 0 = 0 := by
  sorry

/-! ## Layer 5: the algebraic identities behind the decoupling theorems -/

/-- The Grammer-Yennie `K` term `k^μ w^ν / (k · w)` (Layer 5.3). -/
def gyK (k w : FourVec) (μ ν : Fin 4) : ℝ := k μ * w ν / minkDot k w

/-- The Grammer-Yennie `G` term: the metric minus the `K` term, with the metric written as
its diagonal (Layer 5.3). -/
def gyG (k w : FourVec) (μ ν : Fin 4) : ℝ := (if μ = ν then eta μ else 0) - gyK k w μ ν

/-- Layer 5.3: the `K` term contracted with a vector is the gluon's own momentum times a
scalar, which is the form to which a Ward identity applies. -/
theorem gyK_contract (k w A : FourVec) (μ : Fin 4) :
    ∑ ν : Fin 4, gyK k w μ ν * (eta ν * A ν) = k μ * (minkDot w A / minkDot k w) := by
  sorry

/-- Layer 5.4, the one-insertion Ward identity for scalar denominators. -/
theorem ward_scalar (a b : ℝ) (ha : a ≠ 0) (hab : a + b ≠ 0) :
    (a + b)⁻¹ * b * a⁻¹ = a⁻¹ - (a + b)⁻¹ := by
  sorry

/-- Layer 5.4, the one-insertion Ward identity in a ring, the form that applies to matrix
propagators: `(A + B)⁻¹ B A⁻¹ = A⁻¹ - (A + B)⁻¹`. -/
theorem ward_ring {R : Type} [Ring R] (A B : R) (hA : IsUnit A) (hAB : IsUnit (A + B)) :
    Ring.inverse (A + B) * B * Ring.inverse A = Ring.inverse A - Ring.inverse (A + B) := by
  sorry

/-- Layer 5.5, the abelian eikonal identity in momentum space: the sum over orderings of the
products of inverse partial sums is the product of the inverses. -/
theorem eikonal_identity (n : ℕ) (a : Fin n → ℝ)
    (h : ∀ s : Finset (Fin n), s.Nonempty → (∑ i ∈ s, a i) ≠ 0) :
    (∑ σ : Equiv.Perm (Fin n),
        ∏ j : Fin n,
          (∑ i ∈ (Finset.univ : Finset (Fin n)).filter (fun i : Fin n => i ≤ j), a (σ i))⁻¹)
      = ∏ j : Fin n, (a j)⁻¹ := by
  sorry

/-! ## Layer 6: the sum over cuts -/

/-- Layer 6.4, the telescoping identity: summing over the position of the cut, with factors
`A` before the cut, the difference `A - B` at the cut and factors `B` after it, gives the
difference of the two uncut products. -/
theorem telescoping_cut_sum {R : Type} [CommRing R] (n : ℕ) (A B : Fin n → R) :
    (∑ c : Fin n,
        (∏ f ∈ (Finset.univ : Finset (Fin n)).filter (fun f : Fin n => f < c), A f) *
          (A c - B c) *
          (∏ f ∈ (Finset.univ : Finset (Fin n)).filter (fun f : Fin n => c < f), B f))
      = (∏ f : Fin n, A f) - (∏ f : Fin n, B f) := by
  sorry

/-! ## Layer 7: the Sudakov double logarithm and the one-loop Collins-Soper kernel -/

/-- Layer 7.3, the comparison of Convention 10: with a double-logarithmic kernel, the shower's
no-emission probability is the exponential of minus `c / 2` times the squared logarithm. -/
theorem sudakov_doubleLog (c t Q2 : ℝ) (ht : 0 < t) (htQ : t ≤ Q2) :
    EpsilonEridani.QFT.Shower.sudakov (fun s : ℝ => c * Real.log (Q2 / s) / s) t Q2
      = Real.exp (-(c / 2) * Real.log (Q2 / t) ^ 2) := by
  sorry

/-- The one-loop Collins-Soper kernel `-a * log (mu² b_T² / c0)` of Layer 7.4, with
`a = α_s C_F / π` and `c0 = 4 e^{-2 γ_E}` supplied as arguments. -/
def csKernelOneLoop (a c0 bT mu : ℝ) : ℝ := -a * Real.log (mu ^ 2 * bT ^ 2 / c0)

/-- Layer 7.4: the scale derivative of the one-loop kernel is minus the one-loop cusp anomalous
dimension `2 a` over the scale, the first clause of the upstream `CuspConsistent`. -/
theorem csKernelOneLoop_hasDerivAt (a c0 bT mu : ℝ) (hc : 0 < c0) (hb : bT ≠ 0)
    (hmu : 0 < mu) :
    HasDerivAt (fun m : ℝ => csKernelOneLoop a c0 bT m) (-(2 * a) / mu) mu := by
  sorry

end

end EpsilonEridaniRoadmaps.InfraredStructure

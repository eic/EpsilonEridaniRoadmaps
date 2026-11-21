import Mathlib
import EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic
import EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.OneLoopScalars

/-!
# Feynman graphs and Feynman integrals: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by these signatures. First, a Feynman graph is a term of
Mathlib's multigraph type `Graph` together with extra data, and its external legs are a separate
type with an attachment map: they are not edges, so they carry no Schwinger parameter and do not
affect one-particle irreducibility (Conventions 1 and 2). Second, the orientation is data of the
structure, and the statements below about the first Symanzik polynomial do not mention it
(Convention 3). Third, the first Symanzik polynomial is an `MvPolynomial` in the edge variables,
not a function, so that homogeneity is a statement about a polynomial and its evaluation on
positive parameters is a separate lemma (Convention 5). Fourth, the dimension of space-time is a
natural number where an integral over momentum space is written and a complex number where a
closed form is continued, and the regulator is tied to it by the existing `regularizedDimension`,
so that `d = 4 - ε` (Convention 8).

For brevity the structure below takes the vertex and edge sets of the underlying `Graph` to be
the whole of two finite types, and the connected case is the one stated. The roadmap asks for the
general development over `Graph α β` with finite vertex and edge sets.

Every theorem below is `sorry`-ed.
-/

namespace EpsilonEridaniRoadmaps.FeynmanIntegrals

open MeasureTheory

noncomputable section

/-! ## Layer 0: Feynman graphs -/

/-- A Feynman graph on vertex type `V`, edge type `E` and external-leg type `L`: a Mathlib
multigraph whose vertex and edge sets are everything, an orientation of each edge, and the
attachment of each external leg to a vertex. Layer 0.1 and Layer 0.6. -/
structure FeynmanGraph (V E L : Type) where
  /-- The underlying multigraph. Self-loops and parallel edges are allowed. -/
  graph : _root_.Graph V E
  /-- Every element of `V` is a vertex. -/
  vertexSet_eq : graph.vertexSet = Set.univ
  /-- Every element of `E` is an edge. -/
  edgeSet_eq : graph.edgeSet = Set.univ
  /-- The tail of each edge in the chosen orientation. -/
  src : E → V
  /-- The head of each edge in the chosen orientation. -/
  tgt : E → V
  /-- The orientation is an orientation of the multigraph. -/
  isLink_src_tgt : ∀ e : E, graph.IsLink e (src e) (tgt e)
  /-- The vertex to which each external leg is attached. -/
  attach : L → V

namespace FeynmanGraph

variable {V E L : Type}

/-- The signed incidence number of the vertex `v` and the edge `e`: `+1` at the head, `-1` at the
tail, and `0` for a self-loop. Layer 0.6. -/
def incidence [DecidableEq V] (G : FeynmanGraph V E L) (v : V) (e : E) : ℤ :=
  (if G.tgt e = v then (1 : ℤ) else 0) - (if G.src e = v then (1 : ℤ) else 0)

/-- Every column of the incidence matrix sums to zero. Layer 0.6. -/
theorem sum_incidence_eq_zero [Fintype V] [DecidableEq V] (G : FeynmanGraph V E L) (e : E) :
    ∑ v : V, G.incidence v e = 0 := by
  sorry

/-- Two vertices are joined by the edge set `T` if a walk using only edges of `T` connects them.
Layer 0.2. -/
def JoinedBy (G : FeynmanGraph V E L) (T : Set E) : V → V → Prop :=
  Relation.ReflTransGen (fun x y : V => ∃ e : E, e ∈ T ∧ G.graph.IsLink e x y)

/-- Connectedness of a Feynman graph: it has a vertex, and any two vertices are joined. The
graph with no vertices is not connected; without that clause the spanning-tree and Symanzik
statements below would be false for it. Layer 0.2. -/
def IsConnected (G : FeynmanGraph V E L) : Prop :=
  Nonempty V ∧ ∀ x y : V, G.JoinedBy Set.univ x y

/-- One-particle irreducibility: connected and without a bridge. External legs do not enter.
Layer 0.5. -/
def IsOnePI (G : FeynmanGraph V E L) : Prop :=
  G.IsConnected ∧ ∀ e : E, ¬ G.graph.IsBridge e

/-- The loop number (cycle rank) of a connected Feynman graph, `|E| - |V| + 1`. Layer 0.4. -/
def loopNumber [Fintype V] [Fintype E] (_G : FeynmanGraph V E L) : ℕ :=
  Fintype.card E + 1 - Fintype.card V

/-- A connected graph has at least `|V| - 1` edges, so the truncated subtraction in `loopNumber`
loses nothing. Layer 0.4. -/
theorem card_vertices_le_card_edges_add_one [Fintype V] [Fintype E] (G : FeynmanGraph V E L)
    (hG : G.IsConnected) : Fintype.card V ≤ Fintype.card E + 1 := by
  sorry

/-- A spanning tree, as an edge set: it joins every pair of vertices and has `|V| - 1` edges.
Layer 0.4 proves the equivalence with the other characterisations. -/
def IsSpanningTree [Fintype V] (G : FeynmanGraph V E L) (T : Finset E) : Prop :=
  (∀ x y : V, G.JoinedBy (T : Set E) x y) ∧ T.card + 1 = Fintype.card V

/-- A connected Feynman graph has a spanning tree. Layer 0.4. -/
theorem exists_isSpanningTree [Fintype V] [Fintype E] (G : FeynmanGraph V E L)
    (hG : G.IsConnected) : ∃ T : Finset E, G.IsSpanningTree T := by
  sorry

/-- A momentum routing with values in the momentum space `M`: a momentum on each edge and on each
external leg, conserved at every vertex. External momenta are counted as incoming. Layer 0.7. -/
structure MomentumRouting [Fintype E] [Fintype L] [DecidableEq V] (G : FeynmanGraph V E L)
    (M : Type) [AddCommGroup M] where
  /-- The momentum carried by each edge, along its orientation. -/
  internal : E → M
  /-- The momentum entering through each external leg. -/
  external : L → M
  /-- Momentum conservation at each vertex. -/
  conservation : ∀ v : V,
    (∑ e : E, G.incidence v e • internal e)
      + (∑ l : L, (if G.attach l = v then external l else 0)) = 0

/-- A routing exists only if the external momenta sum to zero. Layer 0.7 proves the converse for
a connected graph. -/
theorem MomentumRouting.sum_external_eq_zero [Fintype V] [Fintype E] [Fintype L] [DecidableEq V]
    {G : FeynmanGraph V E L} {M : Type} [AddCommGroup M] (r : MomentumRouting G M) :
    ∑ l : L, r.external l = 0 := by
  sorry

/-- The cut edges of a vertex set, through Mathlib's `Graph.edgeCut`. Layer 7.1. -/
def cutEdges (G : FeynmanGraph V E L) (S : Set V) : Set E :=
  G.graph.edgeCut S

/-! ## Layer 1: the Symanzik polynomials -/

open Classical in
/-- The first Symanzik polynomial of a connected Feynman graph: the sum over spanning trees of the
product of the variables of the edges outside the tree. Layer 1.1. -/
def symanzikU [Fintype V] [Fintype E] (G : FeynmanGraph V E L) : MvPolynomial E ℤ :=
  ∑ T ∈ (Finset.univ : Finset (Finset E)).filter (fun T => G.IsSpanningTree T),
    ∏ e ∈ (Finset.univ : Finset E) \ T, MvPolynomial.X e

/-- The first Symanzik polynomial is homogeneous of degree the loop number. Layer 1.1. -/
theorem symanzikU_isHomogeneous [Fintype V] [Fintype E] (G : FeynmanGraph V E L)
    (hG : G.IsConnected) : MvPolynomial.IsHomogeneous G.symanzikU G.loopNumber := by
  sorry

/-- The first Symanzik polynomial of a connected graph is not zero. Layer 1.1. -/
theorem symanzikU_ne_zero [Fintype V] [Fintype E] (G : FeynmanGraph V E L)
    (hG : G.IsConnected) : G.symanzikU ≠ 0 := by
  sorry

/-- The value of the first Symanzik polynomial at real Schwinger parameters. Layer 1.1. -/
def evalU [Fintype V] [Fintype E] (G : FeynmanGraph V E L) (a : E → ℝ) : ℝ :=
  MvPolynomial.eval₂ (Int.castRingHom ℝ) a G.symanzikU

/-- The first Symanzik polynomial is strictly positive on the open positive orthant. This is what
makes the Schwinger integrand of Layer 2.2 well defined. -/
theorem evalU_pos [Fintype V] [Fintype E] (G : FeynmanGraph V E L) (hG : G.IsConnected)
    (a : E → ℝ) (ha : ∀ e : E, 0 < a e) : 0 < G.evalU a := by
  sorry

/-- Scaling all Schwinger parameters by `t` scales the first Symanzik polynomial by `t` to the
loop number. Layer 1.1, in the form used by the radial integration of Layer 2.3. -/
theorem evalU_smul [Fintype V] [Fintype E] (G : FeynmanGraph V E L) (hG : G.IsConnected)
    (t : ℝ) (a : E → ℝ) : G.evalU (fun e => t * a e) = t ^ G.loopNumber * G.evalU a := by
  sorry

/-- The weighted Laplacian of a Feynman graph with edge weights `x`. Layer 1.2. -/
def weightedLaplacian [Fintype E] [DecidableEq V] (G : FeynmanGraph V E L) (x : E → ℝ) :
    Matrix V V ℝ :=
  Matrix.of fun v w : V => ∑ e : E, (G.incidence v e : ℝ) * x e * (G.incidence w e : ℝ)

open Classical in
/-- The matrix-tree theorem for a weighted multigraph: the determinant of the Laplacian with the
row and column of one vertex removed is the sum over spanning trees of the product of the weights
of the edges in the tree. Layer 1.2. -/
theorem det_reduced_weightedLaplacian [Fintype V] [Fintype E] (G : FeynmanGraph V E L)
    (x : E → ℝ) (r : V) :
    ((G.weightedLaplacian x).submatrix
        (fun v : {v : V // v ≠ r} => (v : V)) (fun v : {v : V // v ≠ r} => (v : V))).det
      = ∑ T ∈ (Finset.univ : Finset (Finset E)).filter (fun T => G.IsSpanningTree T),
          ∏ e ∈ T, x e := by
  sorry

/-! ## Layer 3: power counting -/

/-- The superficial degree of divergence of a connected graph in dimension `d` with propagator
powers `ν`. Layer 3.1. -/
def superficialDegree [Fintype V] [Fintype E] (G : FeynmanGraph V E L) (d : ℝ) (ν : E → ℝ) : ℝ :=
  d * (G.loopNumber : ℝ) - 2 * ∑ e : E, ν e

end FeynmanGraph

/-! ## Layer 2: the Euclidean integral and its parametrisations -/

/-- The Schwinger trick for a single propagator. Layer 2.2. -/
theorem schwinger_one_propagator (ν D : ℝ) (hν : 0 < ν) (hD : 0 < D) :
    ∫ a in Set.Ioi (0 : ℝ), a ^ (ν - 1) * Real.exp (-(a * D)) = Real.Gamma ν / D ^ ν := by
  sorry

/-- Feynman's formula for two positive denominators. Layer 2.3. -/
theorem feynman_two_denominators (A B : ℝ) (hA : 0 < A) (hB : 0 < B) :
    ∫ x in (0 : ℝ)..1, 1 / (x * A + (1 - x) * B) ^ 2 = 1 / (A * B) := by
  sorry

/-- The massive Euclidean tadpole in natural-number dimension `d`, for a propagator power `ν`
above `d / 2`, with the integral over `EuclideanSpace ℝ (Fin d)` against Lebesgue measure.
Dividing by `π ^ (d / 2)` gives the normalisation of Convention 7. Layer 2.5. -/
theorem euclidean_tadpole (d : ℕ) (hd : 0 < d) (m ν : ℝ) (hm : 0 < m) (hν : (d : ℝ) / 2 < ν) :
    ∫ k : EuclideanSpace ℝ (Fin d), (‖k‖ ^ 2 + m ^ 2) ^ (-ν)
      = Real.pi ^ ((d : ℝ) / 2) * Real.Gamma (ν - (d : ℝ) / 2) / Real.Gamma ν
          * (m ^ 2) ^ ((d : ℝ) / 2 - ν) := by
  sorry

/-! ## Layer 4: dimensional regularisation -/

/-- `I` is a dimensionally regularised continuation of `I₀` from the convergence domain `D`: it is
meromorphic in the dimension and agrees with `I₀` on `D`. Convention 10 and Layer 4.2. -/
def IsDimRegContinuation (I₀ : ℂ → ℂ) (D : Set ℂ) (I : ℂ → ℂ) : Prop :=
  MeromorphicOn I Set.univ ∧ ∀ d : ℂ, d ∈ D → I d = I₀ d

/-- Two continuations from the same non-empty open domain agree wherever both are analytic.
Layer 4.2. -/
theorem IsDimRegContinuation.eq_of_analyticAt {I₀ I₁ I₂ : ℂ → ℂ} {D : Set ℂ} (hD : IsOpen D)
    (hne : D.Nonempty) (h₁ : IsDimRegContinuation I₀ D I₁) (h₂ : IsDimRegContinuation I₀ D I₂)
    (d : ℂ) (hd₁ : AnalyticAt ℂ I₁ d) (hd₂ : AnalyticAt ℂ I₂ d) : I₁ d = I₂ d := by
  sorry

/-- The closed form of the one-loop tadpole with unit propagator power, as a function of the
complex dimension and the squared mass, in the normalisation of Convention 7. Layer 4.6. -/
def tadpoleClosedForm (d : ℂ) (mSq : ℝ) : ℂ :=
  Complex.Gamma (1 - d / 2) * (mSq : ℂ) ^ (d / 2 - 1)

/-- The closed form of the massless one-loop bubble with unit propagator powers, as a function of
the complex dimension and the Euclidean squared momentum, in the normalisation of Convention 7.
Layer 4.6. -/
def masslessBubbleClosedForm (d : ℂ) (pSq : ℝ) : ℂ :=
  Complex.Gamma (2 - d / 2) * Complex.Gamma (d / 2 - 1) ^ 2 / Complex.Gamma (d - 2)
    * (pSq : ℂ) ^ (d / 2 - 2)

/-- The tadpole closed form is meromorphic in the dimension. Layer 4.2 and Layer 4.6. -/
theorem meromorphicOn_tadpoleClosedForm (mSq : ℝ) (hm : 0 < mSq) :
    MeromorphicOn (fun d : ℂ => tadpoleClosedForm d mSq) Set.univ := by
  sorry

/-- The massless bubble closed form is meromorphic in the dimension. Layer 4.2 and Layer 4.6. -/
theorem meromorphicOn_masslessBubbleClosedForm (pSq : ℝ) (hp : 0 < pSq) :
    MeromorphicOn (fun d : ℂ => masslessBubbleClosedForm d pSq) Set.univ := by
  sorry

/-- For a dimension with real part above two, the tadpole tends to zero with the mass. This is the
limit whose continuation defines the value zero of the massless tadpole. Layer 4.4. -/
theorem tendsto_tadpoleClosedForm_zero (d : ℂ) (hd : 2 < d.re) :
    Filter.Tendsto (fun mSq : ℝ => tadpoleClosedForm d mSq)
      (nhdsWithin (0 : ℝ) (Set.Ioi 0)) (nhds 0) := by
  sorry

/-- The massless bubble at the dimension `regularizedDimension ε = 4 - ε` of the existing
dimensional-regularisation module. Layer 4.6. -/
def masslessBubbleAt (pSq ε : ℝ) : ℂ :=
  masslessBubbleClosedForm
    ((EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.regularizedDimension ε : ℝ) :
      ℂ) pSq

/-- The residue at `ε = 0` of the massless bubble is the pole coefficient of the existing record
`masslessBubble 2`: the record's coefficient argument is a value of an actual integral. Layer 4.6.
-/
theorem tendsto_eps_mul_masslessBubbleAt (pSq : ℝ) (hp : 0 < pSq) :
    Filter.Tendsto (fun ε : ℝ => (ε : ℂ) * masslessBubbleAt pSq ε)
      (nhdsWithin (0 : ℝ) (Set.Ioi 0))
      (nhds (((EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.OneLoopScalars.masslessBubble
        2).poleCoeff : ℝ) : ℂ)) := by
  sorry

/-- The finite part of the massless bubble at `d = 4 - ε` in the normalisation of Convention 7 is
`2 - γ - log p²`. Layer 4.6. -/
theorem tendsto_masslessBubbleAt_sub_pole (pSq : ℝ) (hp : 0 < pSq) :
    Filter.Tendsto (fun ε : ℝ => masslessBubbleAt pSq ε - 2 / (ε : ℂ))
      (nhdsWithin (0 : ℝ) (Set.Ioi 0))
      (nhds (((2 - Real.eulerMascheroniConstant - Real.log pSq : ℝ)) : ℂ)) := by
  sorry

/-- The pole and finite part of the tadpole at `d = 4 - ε` in the normalisation of Convention 7:
`m² (-2/ε + γ - 1 + log m²)`. Layer 4.6. -/
theorem tendsto_tadpole_sub_pole (mSq : ℝ) (hm : 0 < mSq) :
    Filter.Tendsto
      (fun ε : ℝ => tadpoleClosedForm (4 - (ε : ℂ)) mSq + 2 * (mSq : ℂ) / (ε : ℂ))
      (nhdsWithin (0 : ℝ) (Set.Ioi 0))
      (nhds (((mSq * (Real.eulerMascheroniConstant - 1 + Real.log mSq) : ℝ)) : ℂ)) := by
  sorry

end

end EpsilonEridaniRoadmaps.FeynmanIntegrals

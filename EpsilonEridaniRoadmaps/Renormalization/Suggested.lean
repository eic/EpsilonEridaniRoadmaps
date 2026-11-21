import EpsilonEridani

/-!
# Renormalisation: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by the signatures below.

First, the graphs, their subgraphs and their integrals are the objects of the `FeynmanIntegrals`
roadmap, which this file cannot import. The combinatorial statements are therefore written
against minimal local stand-ins: `SubgraphData` records the three relations a forest is defined
by, and the R-operation is specified over an abstract type of graphs with a finite set of
"subdivergence, cograph" pairs. The real objects are `FeynmanIntegrals`' graphs with their
renormalisation parts and contractions (Layers 0 and 3 there); no statement here depends on how
they are built. The finiteness and locality theorems of Layer 1 need the integrals themselves and
are not stated in this file.

Second, a subtraction operator is data satisfying the Rota-Baxter identity (Convention 7), not a
fixed scheme. The pole-part projection on formal Laurent series is one instance, characterised by
its action on coefficients.

Third, the one-loop renormalisation constants of QCD in a general covariant gauge are written
down as an explicit record of the existing type
`EpsilonEridani.QFT.QCD.Renormalization.RenormalizationConstants`, so that the contracts of that
module — `SlavnovTaylorAssumptions` and `Beta0RenormalizationAssumptions` — become theorems about
a named object rather than hypotheses. The pole coefficients are those of `a₄ / eps` with
`d = 4 - 2 eps` and `a₄ = α_s / (4π)` (Conventions 1 and 2). That the integrals of
`FeynmanIntegrals` Layer 4 have these poles is the target of README Layer 2.6 and is not stated
here.

Fourth, scale independence of a Wilson coefficient contracted with a matrix element (Layer 6.4)
is stated as a theorem about two families of functions obeying transposed linear differential
equations, with the anomalous-dimension matrix in the sign convention of Convention 4.

Every theorem below is `sorry`-ed.
-/

namespace EpsilonEridaniRoadmaps.Renormalization

noncomputable section

/-! ## Layer 0: renormalisation parts and forests -/

/-- Stand-in for the subgraph structure of a Feynman graph (Layer 0.2): which subgraphs are
renormalisation parts, the subgraph relation, and vertex-disjointness. The real relations are
those of `FeynmanIntegrals` Layer 0 together with the superficial degree of its Layer 3. -/
structure SubgraphData (G : Type) where
  /-- `IsRenPart g`: `g` is one-particle irreducible with non-negative degree of divergence. -/
  IsRenPart : G → Prop
  /-- `le g h`: `g` is a subgraph of `h`. -/
  le : G → G → Prop
  /-- `disjoint g h`: `g` and `h` share no vertex. -/
  disjoint : G → G → Prop

/-- A forest of `top` (Layer 0.3): a finite set of renormalisation parts of `top`, any two of
which are equal, disjoint or nested. -/
def IsForest {G : Type} (D : SubgraphData G) (top : G) (F : Finset G) : Prop :=
  (∀ g ∈ F, D.IsRenPart g ∧ D.le g top) ∧
    ∀ g ∈ F, ∀ h ∈ F, g = h ∨ D.disjoint g h ∨ D.le g h ∨ D.le h g

/-- The empty set is a forest (Layer 0.3). -/
theorem isForest_empty {G : Type} (D : SubgraphData G) (top : G) :
    IsForest D top (∅ : Finset G) := by
  sorry

/-- A subset of a forest is a forest (Layer 0.3). -/
theorem IsForest.subset {G : Type} {D : SubgraphData G} {top : G} {F F' : Finset G}
    (h : IsForest D top F) (hsub : F' ⊆ F) : IsForest D top F' := by
  sorry

/-- A forest is normal if it does not contain the whole graph (Layer 0.3). -/
def IsNormalForest {G : Type} (D : SubgraphData G) (top : G) (F : Finset G) : Prop :=
  IsForest D top F ∧ top ∉ F

/-- Removing the whole graph from a forest gives a normal forest: one half of the bijection
between full and normal forests (Layer 0.3). -/
theorem IsForest.erase_top {G : Type} [DecidableEq G] {D : SubgraphData G} {top : G}
    {F : Finset G} (h : IsForest D top F) : IsNormalForest D top (F.erase top) := by
  sorry

/-! ## Layer 1: subtraction operators and the R-operation -/

/-- The Rota-Baxter identity of weight `-1` for a map on a commutative ring (Layer 1.1). -/
def IsRotaBaxter {A : Type} [CommRing A] (T : A → A) : Prop :=
  ∀ x y : A, T x * T y + T (x * y) = T (T x * y) + T (x * T y)

/-- If `T` is additive and satisfies the Rota-Baxter identity, so does `1 - T` (Layer 1.1). -/
theorem isRotaBaxter_complement {A : Type} [CommRing A] (T : A → A)
    (hadd : ∀ x y : A, T (x + y) = T x + T y) (hT : IsRotaBaxter T) :
    IsRotaBaxter (fun x : A => x - T x) := by
  sorry

/-- For an additive Rota-Baxter map, the image is closed under multiplication (Layer 1.1). -/
theorem isRotaBaxter_image_mul {A : Type} [CommRing A] (T : A → A)
    (hadd : ∀ x y : A, T (x + y) = T x + T y) (hT : IsRotaBaxter T) (x y : A) :
    ∃ z : A, T x * T y = T z := by
  sorry

/-- `P` is the pole-part projection on formal Laurent series in the regulator: it keeps the
coefficients of strictly negative powers and discards the rest (Layer 1.1). The type
`HahnSeries ℤ ℂ` is Mathlib's `LaurentSeries ℂ`. -/
def IsPolePart (P : HahnSeries ℤ ℂ → HahnSeries ℤ ℂ) : Prop :=
  ∀ (x : HahnSeries ℤ ℂ) (n : ℤ), (P x).coeff n = if n < 0 then x.coeff n else 0

/-- The pole-part projection is idempotent (Layer 1.1). -/
theorem isPolePart_idempotent (P : HahnSeries ℤ ℂ → HahnSeries ℤ ℂ) (hP : IsPolePart P)
    (x : HahnSeries ℤ ℂ) : P (P x) = P x := by
  sorry

/-- The pole-part projection satisfies the Rota-Baxter identity (Layer 1.1). This is the property
of minimal subtraction that makes the counterterm map multiplicative (Layer 1.5). -/
theorem isRotaBaxter_of_isPolePart (P : HahnSeries ℤ ℂ → HahnSeries ℤ ℂ) (hP : IsPolePart P) :
    IsRotaBaxter P := by
  sorry

/-- Bogoliubov's recursion (Layer 1.2), as a specification. `cop g` is the finite set of pairs
`(s, q)` with `s` a non-empty product of pairwise disjoint proper renormalisation parts of `g` and
`q` the cograph `g / s`; `U` gives unrenormalised values; `T` is the subtraction operator. The
triple `(Rbar, Cnt, R)` consists of the value with subdivergences subtracted, the counterterm and
the renormalised value. -/
structure IsROperation {G A : Type} [CommRing A] (cop : G → Finset (G × G)) (U : G → A)
    (T : A → A) (Rbar Cnt R : G → A) : Prop where
  /-- `R̄(Γ) = U(Γ) + Σ C(γ) U(Γ/γ)`. -/
  rbar_eq : ∀ g : G, Rbar g = U g + ∑ p ∈ cop g, Cnt p.1 * U p.2
  /-- `C(Γ) = -T(R̄(Γ))`. -/
  cnt_eq : ∀ g : G, Cnt g = -T (Rbar g)
  /-- `R(Γ) = R̄(Γ) + C(Γ)`. -/
  r_eq : ∀ g : G, R g = Rbar g + Cnt g

/-- For a graph with no proper subdivergence, the renormalised value is `(1 - T) U`
(Layer 1.2). -/
theorem IsROperation.primitive {G A : Type} [CommRing A] {cop : G → Finset (G × G)} {U : G → A}
    {T : A → A} {Rbar Cnt R : G → A} (h : IsROperation cop U T Rbar Cnt R) (g : G)
    (hprim : cop g = ∅) : R g = U g - T (U g) := by
  sorry

/-- The recursion is well founded and determines the renormalised value uniquely, when every
subdivergence has strictly fewer loops than the graph (Layer 1.2). -/
theorem IsROperation.unique {G A : Type} [CommRing A] {cop : G → Finset (G × G)} {U : G → A}
    {T : A → A} {Rbar Cnt R Rbar' Cnt' R' : G → A} (loops : G → ℕ)
    (hloops : ∀ (g : G) (p : G × G), p ∈ cop g → loops p.1 < loops g)
    (h : IsROperation cop U T Rbar Cnt R) (h' : IsROperation cop U T Rbar' Cnt' R') :
    R = R' ∧ Cnt = Cnt' := by
  sorry

/-- With the pole part as subtraction operator, the renormalised value has no pole as a formal
Laurent series: the regular half of the Birkhoff decomposition (Layer 1.5). This is the algebraic
statement only; that the same holds for the Laurent expansions of the integrals, with
subdivergences that are not polynomial before subtraction, is the BPHZ theorem (Layer 1.3). -/
theorem IsROperation.renormalized_regular {G : Type} {cop : G → Finset (G × G)}
    {U : G → HahnSeries ℤ ℂ} {P : HahnSeries ℤ ℂ → HahnSeries ℤ ℂ}
    {Rbar Cnt R : G → HahnSeries ℤ ℂ} (hP : IsPolePart P)
    (h : IsROperation cop U P Rbar Cnt R) (g : G) (n : ℤ) (hn : n < 0) :
    (R g).coeff n = 0 := by
  sorry

/-! ## Layer 2: poles, the beta function, and the one-loop constants of QCD -/

/-- A function of the regulator is regular at `eps = 0`: meromorphic there with non-negative
order (Layers 1.3 and 2.1). -/
def IsRegularAtZero (f : ℂ → ℂ) : Prop :=
  MeromorphicAt f 0 ∧ (0 : WithTop ℤ) ≤ meromorphicOrderAt f 0

/-- Functions regular at `eps = 0` are closed under multiplication (Layer 2.1). -/
theorem IsRegularAtZero.mul {f g : ℂ → ℂ} (hf : IsRegularAtZero f) (hg : IsRegularAtZero g) :
    IsRegularAtZero (fun z : ℂ => f z * g z) := by
  sorry

/-- The residue formula (Layer 2.4). If the simple-pole part of the coupling renormalisation is
`Z_a^{(1)}(a) = Σ_n z n · a^n`, the beta function `β(a) = a² dZ_a^{(1)}/da` has coefficient
`n · z n` at `a^(n+1)`. -/
def betaCoeffFromResidue (z : ℕ → ℝ) (n : ℕ) : ℝ :=
  (n : ℝ) * z n

/-- The two-loop shift of an anomalous dimension under a finite renormalisation
`a' = a + c₁ a²` of the coupling and `1 + z₁ a` of the renormalised quantity (Layer 2.5). -/
def gammaTwoLoopShift (gamma0 beta0 c1 z1 : ℝ) : ℝ :=
  -(c1 * gamma0) - beta0 * z1

/-- A Laurent record with simple-pole coefficient `c`, finite part one and no remainder: the
form of a one-loop minimal-subtraction renormalisation constant. -/
def simplePole (c : ℝ) :
    EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.LaurentExpansionAtZero where
  poleCoeff := c
  finitePart := 1
  regularPart := fun _ => 0

/-- The one-loop minimal-subtraction renormalisation constants of QCD in a covariant gauge with
gauge parameter `xi` (`xi = 1` Feynman, `xi = 0` Landau), as coefficients of `a₄ / eps`
(Layer 2.6). -/
def oneLoopConstants (cf : EpsilonEridani.QFT.QCD.ColorFactors) (xi : ℝ) :
    EpsilonEridani.QFT.QCD.Renormalization.RenormalizationConstants where
  zG := simplePole (-(EpsilonEridani.QFT.QCD.beta0 cf) / 2)
  z3 := simplePole ((13 / 6 - xi / 2) * cf.cA - (4 / 3) * cf.tF * cf.nF)
  z2 := simplePole (-(cf.cF * xi))
  z1F := simplePole (-(cf.cF * xi + cf.cA * (3 + xi) / 4))
  z1c := simplePole (-(cf.cA * xi / 2))
  z3c := simplePole (cf.cA * (3 - xi) / 4)

/-- The one-loop constants satisfy both Slavnov-Taylor pole relations of the existing module,
for every gauge parameter (Layers 2.6 and 4.4). -/
theorem oneLoopConstants_slavnovTaylor (cf : EpsilonEridani.QFT.QCD.ColorFactors) (xi : ℝ) :
    EpsilonEridani.QFT.QCD.Renormalization.SlavnovTaylorAssumptions (oneLoopConstants cf xi) := by
  sorry

/-- The coupling pole is independent of the gauge parameter (Layer 4.5). -/
theorem oneLoopConstants_zG_gaugeIndependent (cf : EpsilonEridani.QFT.QCD.ColorFactors)
    (xi xi' : ℝ) :
    EpsilonEridani.QFT.QCD.Renormalization.poleCoeff (oneLoopConstants cf xi).zG =
      EpsilonEridani.QFT.QCD.Renormalization.poleCoeff (oneLoopConstants cf xi').zG := by
  sorry

/-- The beta coefficient reconstructed from the coupling pole by the existing
`beta0FromCouplingPole` is the colour-factor expression `beta0` (Layer 2.6). -/
theorem beta0_eq_beta0FromCouplingPole (cf : EpsilonEridani.QFT.QCD.ColorFactors) (xi : ℝ) :
    EpsilonEridani.QFT.QCD.beta0 cf =
      EpsilonEridani.QFT.QCD.Renormalization.beta0FromCouplingPole
        (EpsilonEridani.QFT.QCD.Renormalization.poleCoeff (oneLoopConstants cf xi).zG) := by
  sorry

/-- There is minimal-subtraction data built on the one-loop constants for which the existing
contract `Beta0RenormalizationAssumptions` holds (Layer 2.6). -/
theorem exists_msData_beta0Assumptions (cf : EpsilonEridani.QFT.QCD.ColorFactors) (xi : ℝ) :
    ∃ ms : EpsilonEridani.QFT.QCD.Renormalization.MSLikeRenormalizationData,
      ms.Z = oneLoopConstants cf xi ∧
        EpsilonEridani.QFT.QCD.Renormalization.Beta0RenormalizationAssumptions cf ms := by
  sorry

/-- The one-loop quark-mass anomalous dimension, `d log m / d log μ² = -3 C_F a₄` (Layer 2.6,
Conventions 2 and 3). -/
def oneLoopMassAnomalousDim (cf : EpsilonEridani.QFT.QCD.ColorFactors) (a : ℝ) : ℝ :=
  -(3 * cf.cF * a)

/-! ## Layer 3: twist-two operators -/

/-- The one-loop non-singlet anomalous dimension of the twist-two operator of spin `n`, in the
kernel normalisation of `CollinearEvolution` Convention 2 and the sign of Convention 4:
`C_F (3/2 + 1/(n(n+1)) - 2 S₁(n))` (Layer 3.6). -/
def gammaQQ (cF : ℝ) (n : ℕ) : ℝ :=
  cF * (3 / 2 + 1 / ((n : ℝ) * ((n : ℝ) + 1)) - 2 * ((harmonic n : ℚ) : ℝ))

/-- The spin-one non-singlet operator is the conserved vector current: its anomalous dimension
vanishes (Layers 3.3 and 3.6). -/
theorem gammaQQ_one (cF : ℝ) : gammaQQ cF 1 = 0 := by
  sorry

/-- The spin-two value (Layer 3.6). -/
theorem gammaQQ_two (cF : ℝ) : gammaQQ cF 2 = -(4 / 3) * cF := by
  sorry

/-- The non-singlet anomalous dimension is non-positive for `0 ≤ C_F` and every spin `n ≥ 1`:
the moments of a non-singlet density do not grow with the scale (Layer 3.6). -/
theorem gammaQQ_nonpos (cF : ℝ) (hcF : 0 ≤ cF) (n : ℕ) (hn : 1 ≤ n) : gammaQQ cF n ≤ 0 := by
  sorry

/-- The one-loop spin-two singlet anomalous-dimension matrix in the basis (quark singlet, gluon),
rows the daughter and columns the parent (Conventions 4 and 6, Layer 3.6). -/
def spinTwoSinglet (cf : EpsilonEridani.QFT.QCD.ColorFactors) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![-(4 / 3) * cf.cF, (2 / 3) * cf.tF * cf.nF; (4 / 3) * cf.cF, -(2 / 3) * cf.tF * cf.nF]

/-- The column sums of the spin-two singlet matrix vanish: the total energy-momentum tensor is
not renormalised (Layers 3.3 and 3.6). -/
theorem spinTwoSinglet_column_sum (cf : EpsilonEridani.QFT.QCD.ColorFactors) (j : Fin 2) :
    ∑ i : Fin 2, spinTwoSinglet cf i j = 0 := by
  sorry

/-- The quark-quark entry of the singlet matrix is the non-singlet value at spin two
(Layer 3.6). -/
theorem spinTwoSinglet_zero_zero (cf : EpsilonEridani.QFT.QCD.ColorFactors) :
    spinTwoSinglet cf 0 0 = gammaQQ cf.cF 2 := by
  sorry

/-! ## Layer 5: the cusp anomalous dimension -/

/-- The one-loop cusp anomalous dimension for Minkowski cusp angle `chi`, Casimir `cR` and
coupling `a = α_s / (4π)`, normalised to `d / d log μ`: `4 C_R a (χ coth χ - 1)` (Layer 5.3).
The value at `chi = 0` is not meaningful; the theorem below gives the limit. -/
def oneLoopCusp (cR a chi : ℝ) : ℝ :=
  4 * cR * a * (chi * Real.cosh chi / Real.sinh chi - 1)

/-- The cusp anomalous dimension vanishes as the cusp closes: a smooth path has none
(Layer 5.3). -/
theorem oneLoopCusp_tendsto_zero (cR a : ℝ) :
    Filter.Tendsto (fun chi : ℝ => oneLoopCusp cR a chi)
      (nhdsWithin (0 : ℝ) {x : ℝ | x ≠ 0}) (nhds 0) := by
  sorry

/-- The light-like cusp anomalous dimension at one loop (Layer 5.3). -/
def oneLoopLightLikeCusp (cR a : ℝ) : ℝ :=
  4 * cR * a

/-- Linear growth at large angle, with slope the light-like cusp anomalous dimension
(Layer 5.3). -/
theorem oneLoopCusp_div_tendsto (cR a : ℝ) :
    Filter.Tendsto (fun chi : ℝ => oneLoopCusp cR a chi / chi) Filter.atTop
      (nhds (oneLoopLightLikeCusp cR a)) := by
  sorry

/-- Casimir scaling at one loop (Layer 5.3). -/
theorem oneLoopCusp_casimir_scaling (cR cR' a chi : ℝ) :
    cR' * oneLoopCusp cR a chi = cR * oneLoopCusp cR' a chi := by
  sorry

/-! ## Layer 6: the operator product expansion -/

/-- The remainder bound of the operator product expansion at loop order `L` (Layer 6.2,
Convention 14): as the separation `r` tends to zero from above, the difference between a Green
function `G` and its truncated expansion `approx` is `O(r ^ p * |log r| ^ L)`. -/
def HasOPERemainder (G approx : ℝ → ℝ) (p : ℝ) (L : ℕ) : Prop :=
  Asymptotics.IsBigO (nhdsWithin (0 : ℝ) (Set.Ioi 0)) (fun r : ℝ => G r - approx r)
    (fun r : ℝ => r ^ p * |Real.log r| ^ L)

/-- A remainder bound with a larger exponent implies the bound with a smaller one
(Layer 6.2). -/
theorem HasOPERemainder.mono_exponent {G approx : ℝ → ℝ} {p p' : ℝ} {L : ℕ} (hp : p ≤ p')
    (h : HasOPERemainder G approx p' L) : HasOPERemainder G approx p L := by
  sorry

/-- A remainder bound at loop order `L` implies the bound with more logarithms (Layer 6.2). -/
theorem HasOPERemainder.mono_log {G approx : ℝ → ℝ} {p : ℝ} {L L' : ℕ} (hL : L ≤ L')
    (h : HasOPERemainder G approx p L) : HasOPERemainder G approx p L' := by
  sorry

/-- Scale independence for a single operator (Layer 6.4). If the matrix element `A` has anomalous
dimension `gam` in the variable `t = log μ²` (Convention 4) and the coefficient `C` obeys the
equation with the opposite sign, the product `C · A` does not depend on the scale. -/
theorem coefficient_mul_matrixElement_const (C A gam : ℝ → ℝ)
    (hA : ∀ t : ℝ, HasDerivAt A (gam t * A t) t)
    (hC : ∀ t : ℝ, HasDerivAt C (-(gam t) * C t) t) (s t : ℝ) :
    C s * A s = C t * A t := by
  sorry

/-- Scale independence with operator mixing (Layers 6.4 and 6.5). The matrix elements obey
`dA_i/dt = Σ_j γ_ij A_j` and the coefficients the transposed equation with the opposite sign;
then the contraction `Σ_i C_i A_i` is scale independent. This is the property that the record
`OPEData` of `InclusiveStructureFunctions` Layer 4.2 takes as a hypothesis. -/
theorem coefficient_contraction_const {ι : Type} [Fintype ι] (C A : ℝ → ι → ℝ)
    (gam : ℝ → Matrix ι ι ℝ)
    (hA : ∀ (t : ℝ) (i : ι), HasDerivAt (fun s : ℝ => A s i) (∑ j : ι, gam t i j * A t j) t)
    (hC : ∀ (t : ℝ) (j : ι),
      HasDerivAt (fun s : ℝ => C s j) (-(∑ i : ι, C t i * gam t i j)) t)
    (s t : ℝ) : ∑ i : ι, C s i * A s i = ∑ i : ι, C t i * A t i := by
  sorry

end

end EpsilonEridaniRoadmaps.Renormalization

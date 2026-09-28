import EpsilonEridani

/-!
# Collinear evolution: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by these signatures.

First, a splitting kernel is *not* a function. It is the triple `(regular part, coefficient of
`[1/(1-z)]₊`, coefficient of `δ(1-z)`)` of `KernelForm`, because the conservation identities of
Layer 1.4 are identities between functionals and are unstatable for a function with a
regularisation prescription understood. The equality of a `KernelForm` with the familiar
unregularised expression is then a theorem, `pqq_normalForm`, rather than a definition.

Second, the colour factors and the number of active flavours are explicit data, the fields of
`ColourData`, never numerals. The same definitions are therefore usable at the supersymmetric
point `C_F = C_A = 2 n_f T_F`, which is what makes `susy_relation` a check on the kernels rather
than a tautology.

Third, moments are indexed by `M[f](N) = ∫₀¹ x^(N-1) f x dx`, so quark number is `N = 1` and
momentum is `N = 2`. Every harmonic-sum argument in this file depends on that choice.

Fourth, nothing below carries a `Prop`-valued field. Where the roadmap depends on something it
does not prove — the two-loop kernels, the all-order factorisation formula — the object is
carried as data and the identities it must satisfy are separate theorems. A `Prop` field with a
placeholder witness asserts nothing while looking like a hypothesis.

Unproved statements are `sorry`. That is the honest record of what is a target and what is a
theorem; no signature below has been weakened to make it closable.
-/

namespace EpsilonEridaniRoadmap.CollinearEvolution

/-! ## Layer 0: the convolution algebra, plus distributions, harmonic sums -/

/-- A collinear density: a real function of the momentum fraction, to be used together with the
support hypothesis `SupportedInUnitInterval`. Per convention 12 the support condition is a
predicate rather than part of the type, because the Mellin transform and the analytic
continuation in the moment index both want the ambient real line. -/
def Density : Type := ℝ → ℝ

/-- The support hypothesis carried alongside a `Density`. -/
def SupportedInUnitInterval (f : Density) : Prop :=
  ∀ x : ℝ, (x < 0 ∨ 1 < x) → f x = 0

/-- Mellin convolution on the momentum-fraction interval,
`(f ⊗ g) x = ∫_x^1 (dy / y) f y * g (x / y)`. Layer 0.2.

Extended by zero outside `[0,1]` explicitly rather than by relying on the integral: for `x < 0`
the interval integral runs the wrong way and returns a negative of the intended value, and for
`x > 1` it is again orientation-reversed, so the support and positivity statements of Layer 0.2
would be false as stated without this branch. -/
noncomputable def mellinConv (f g : Density) : Density := fun x =>
  if 0 ≤ x ∧ x ≤ 1 then ∫ y in x..(1 : ℝ), f y * g (x / y) / y else 0

@[inherit_doc] scoped infixl:70 " ⊛ " => mellinConv

/-- Commutativity of the Mellin convolution, by the substitution `y ↦ x / y`. -/
theorem mellinConv_comm (f g : Density) : f ⊛ g = g ⊛ f := by
  sorry

/-- Associativity of the Mellin convolution. Needs joint integrability on the ordered simplex
`{(y, z) | x ≤ y * z, y ≤ 1, z ≤ 1}` and is false without it; the hypothesis is stated in the
roadmap and elided in this signature. -/
theorem mellinConv_assoc (f g h : Density) : (f ⊛ g) ⊛ h = f ⊛ (g ⊛ h) := by
  sorry

/-- The convolution of two non-negative densities is non-negative. This is the statement other
roadmaps cite to carry a positivity constraint through a factorisation formula. -/
theorem mellinConv_nonneg {f g : Density} (hf : ∀ x, 0 ≤ f x) (hg : ∀ x, 0 ≤ g x) :
    ∀ x, 0 ≤ (f ⊛ g) x := by
  sorry

/-- The plus functional attached to a function `K` singular at `1`:
`φ ↦ ∫₀¹ K z * (φ z - φ 1) dz`. Layer 0.3. The convergence hypothesis is that `(1 - z) * K z`
is bounded near `1`. -/
noncomputable def plusFunctional (K : ℝ → ℝ) (φ : ℝ → ℝ) : ℝ :=
  ∫ z in (0 : ℝ)..1, K z * (φ z - φ 1)

/-- The standard plus distribution `[1/(1-z)]₊`, as a functional. -/
noncomputable def plusOneMinus (φ : ℝ → ℝ) : ℝ :=
  plusFunctional (fun z => (1 - z)⁻¹) φ

/-- The defining property: the plus distribution annihilates constants. -/
theorem plusOneMinus_const (c : ℝ) : plusOneMinus (fun _ => c) = 0 := by
  sorry

/-- The first harmonic sum, `S₁ n = ∑_{k=1}^{n} 1/k`. Absent from Mathlib and TauCeti at the
pinned revisions, so built here; Layer 0.5 builds the general nested family of which this is the
depth-one, weight-one member. -/
noncomputable def S₁ (n : ℕ) : ℝ := ∑ k ∈ Finset.range n, (1 : ℝ) / (k + 1)

/-- The second harmonic sum, `S₂ n = ∑_{k=1}^{n} 1/k²`. -/
noncomputable def S₂ (n : ℕ) : ℝ := ∑ k ∈ Finset.range n, (1 : ℝ) / (k + 1) ^ 2

/-- The depth-two harmonic sum `S_{1,1}`. -/
noncomputable def S₁₁ (n : ℕ) : ℝ := ∑ k ∈ Finset.range n, S₁ (k + 1) / (k + 1)

/-- The simplest quasi-shuffle relation. A check on the nested recursion, and the pattern by
which any moment expression is reduced to a basis. Layer 0.5. -/
theorem harmonic_quasiShuffle (n : ℕ) : S₁ n * S₁ n = 2 * S₁₁ n - S₂ n := by
  sorry

/-- The Mellin moment `M[f] N = ∫₀¹ x^(N-1) * f x dx`, per convention 6. Layer 0.4. Stated for
real `N`; the analytic continuation to complex `N` and the inversion contour are Layer 0.4 and
0.5 and are not in this signature. -/
noncomputable def moment (f : Density) (N : ℝ) : ℝ :=
  ∫ x in (0 : ℝ)..1, x ^ (N - 1) * f x

/-- The convolution theorem, the technical heart of the roadmap: it is what turns the
integro-differential DGLAP system into an ordinary differential equation. Layer 0.4. -/
theorem moment_mellinConv (f g : Density) (N : ℝ) :
    moment (f ⊛ g) N = moment f N * moment g N := by
  sorry

/-- The moment of the plus distribution against the moment test function, the bridge between
Layer 0.3 and Layer 0.5 and the reason the kernel moments are harmonic sums at all:
`⟨[1/(1-z)]₊, z^(N-1)⟩ = -S₁ (N - 1)`. -/
theorem plusOneMinus_moment (n : ℕ) (hn : 1 ≤ n) :
    plusOneMinus (fun z => z ^ (n - 1)) = -S₁ (n - 1) := by
  sorry

/-! ## Layer 1: the leading-order splitting kernels -/

/-- The colour data a kernel is parametrised by, per convention 7: never numerals, so that the
same definitions are usable at the supersymmetric point. `nf` is the number of active flavours.
-/
structure ColourData where
  /-- The fundamental-representation Casimir. -/
  cF : ℝ
  /-- The adjoint Casimir. -/
  cA : ℝ
  /-- The fundamental trace normalisation. -/
  tF : ℝ
  /-- The number of active flavours. -/
  nf : ℕ

/-- The QCD instantiation for `SU(3)`. The theorem that these are the values proved in
`EpsilonEridani.QFT.QCD.RepresentationColor` is Layer 1.1 and is not asserted by this
definition. -/
def qcdColour (nf : ℕ) : ColourData :=
  { cF := 4 / 3, cA := 3, tF := 1 / 2, nf := nf }

/-- The `N = 1` supersymmetric point, `C_F = C_A = 2 n_f T_F`. Not a physical QCD
configuration, but a valid instantiation of `ColourData`, which is exactly what makes
`susy_relation` a usable check on the kernels. -/
def susyColour (nf : ℕ) (hnf : 0 < nf) : ColourData :=
  { cF := 1, cA := 1, tF := 1 / (2 * nf), nf := nf }

/-- A splitting kernel in the distributional normal form of convention 4: a regular part
integrable on the open interval, a coefficient of `[1/(1-z)]₊`, and a coefficient of `δ(1-z)`.
The uniqueness of this decomposition is a du Bois-Reymond statement, proved in Layer 0.3, and it
is what makes the convention well-posed. -/
structure KernelForm where
  /-- The locally integrable regular part on the open interval. -/
  regular : ℝ → ℝ
  /-- The coefficient of the plus distribution `[1/(1-z)]₊`. -/
  plusCoeff : ℝ
  /-- The coefficient of `δ(1-z)`. -/
  deltaCoeff : ℝ

/-- The pairing of a kernel in normal form with a test function. -/
noncomputable def KernelForm.pair (P : KernelForm) (φ : ℝ → ℝ) : ℝ :=
  (∫ z in (0 : ℝ)..1, P.regular z * φ z) + P.plusCoeff * plusOneMinus φ + P.deltaCoeff * φ 1

/-- The Mellin moment of a kernel, indexed as in convention 6. -/
noncomputable def KernelForm.moment (P : KernelForm) (n : ℕ) : ℝ :=
  P.pair (fun z => z ^ (n - 1))

/-- The leading-order quark-to-quark kernel,
`P_qq z = C_F [ 2 [1/(1-z)]₊ - (1 + z) + (3/2) δ(1-z) ]`. Layer 1.2. -/
def pqq (c : ColourData) : KernelForm :=
  { regular := fun z => -c.cF * (1 + z), plusCoeff := 2 * c.cF, deltaCoeff := 3 / 2 * c.cF }

/-- The leading-order gluon-in-quark kernel, `P_gq z = C_F (1 + (1-z)²)/z`. No plus part and no
delta part; singular as `z → 0`, which in moment space is the pole at `N = 1`. -/
def pgq (c : ColourData) : KernelForm :=
  { regular := fun z => c.cF * (1 + (1 - z) ^ 2) / z, plusCoeff := 0, deltaCoeff := 0 }

/-- The leading-order quark-in-gluon kernel per flavour, `P_qg z = T_F (z² + (1-z)²)`. The
singlet-normalised entry is `pqgSinglet`, and the two are distinguished by name because
conflating them breaks the momentum sum rule by exactly the factor `2 n_f`. -/
def pqg (c : ColourData) : KernelForm :=
  { regular := fun z => c.tF * (z ^ 2 + (1 - z) ^ 2), plusCoeff := 0, deltaCoeff := 0 }

/-- The singlet-normalised quark-in-gluon kernel, `2 n_f` times the per-flavour kernel. -/
def pqgSinglet (c : ColourData) : KernelForm :=
  { regular := fun z => 2 * c.nf * c.tF * (z ^ 2 + (1 - z) ^ 2), plusCoeff := 0,
    deltaCoeff := 0 }

/-- The leading-order gluon-to-gluon kernel,
`P_gg z = 2 C_A [ [z/(1-z)]₊ + (1-z)/z + z(1-z) ] + ((11/6) C_A - (2/3) n_f T_F) δ(1-z)`,
put into normal form using `z/(1-z) = 1/(1-z) - 1`. The `n_f` dependence of the delta
coefficient is there for the momentum sum rule to hold, which Layer 1.4 proves. -/
def pgg (c : ColourData) : KernelForm :=
  { regular := fun z => 2 * c.cA * (-1 + (1 - z) / z + z * (1 - z)),
    plusCoeff := 2 * c.cA,
    deltaCoeff := 11 / 6 * c.cA - 2 / 3 * c.nf * c.tF }

/-- The normal form of `pqq` agrees with the familiar unregularised expression
`C_F [(1 + z²)/(1 - z)]₊` as a functional. A theorem, not a definition: it is proved with the
multiplication identity of Layer 0.3, and it is the statement that convention 4 loses nothing.
-/
theorem pqq_normalForm (c : ColourData) (φ : ℝ → ℝ) :
    (pqq c).pair φ = c.cF * plusFunctional (fun z => (1 + z ^ 2) / (1 - z)) φ := by
  sorry

/-- Quark-number conservation, Layer 1.4: the valence moment of the non-singlet kernel
vanishes. Proved *from* the kernel, not used to fix it. -/
theorem pqq_moment_one (c : ColourData) : (pqq c).moment 1 = 0 := by
  sorry

/-- Momentum conservation in the quark column, Layer 1.4. The individual values are
`-(4/3) C_F` and `+(4/3) C_F`. -/
theorem momentum_quarkColumn (c : ColourData) :
    (pqq c).moment 2 + (pgq c).moment 2 = 0 := by
  sorry

/-- Momentum conservation in the gluon column, Layer 1.4. The individual values are
`-(2/3) n_f T_F` and `+(2/3) n_f T_F`. -/
theorem momentum_gluonColumn (c : ColourData) :
    (pgg c).moment 2 + (pqgSinglet c).moment 2 = 0 := by
  sorry

/-- The leading-order quark-to-quark anomalous dimension in closed form,
`γ_qq N = C_F [3/2 - 2 S₁ N + 1/(N(N+1))]`. Layer 1.5. -/
theorem gamma_qq_closedForm (c : ColourData) (n : ℕ) (hn : 1 ≤ n) :
    (pqq c).moment n = c.cF * (3 / 2 - 2 * S₁ n + 1 / ((n : ℝ) * ((n : ℝ) + 1))) := by
  sorry

/-- The supersymmetric relation, Layer 1.3: at the point `C_F = C_A = 2 n_f T_F` the
singlet-normalised leading-order moments satisfy
`γ_qq + γ_gq - γ_qg - γ_gg = 0` for every `N`. A genuine check, independent of the two
conservation identities: it fails if any of the four kernels carries a wrong coefficient. -/
theorem susy_relation (nf : ℕ) (hnf : 0 < nf) (n : ℕ) (hn : 2 ≤ n) :
    (pqq (susyColour nf hnf)).moment n + (pgq (susyColour nf hnf)).moment n
        - (pqgSinglet (susyColour nf hnf)).moment n - (pgg (susyColour nf hnf)).moment n = 0 := by
  sorry

/-! ## Layer 2: the running coupling and the beta function -/

/-- The one-loop beta-function coefficient in the `α_s/(4π)` normalisation of convention 3,
`β₀ = (11/3) C_A - (4/3) T_F n_f`. For `SU(3)` this is `11 - 2 n_f / 3`. -/
def beta0 (c : ColourData) : ℝ := 11 / 3 * c.cA - 4 / 3 * c.tF * c.nf

/-- The two-loop coefficient, `β₁ = (34/3) C_A² - 4 C_F T_F n_f - (20/3) C_A T_F n_f`. For
`SU(3)` this is `102 - 38 n_f / 3`. Stated as data with its colour decomposition: deriving it
needs the two-loop renormalisation of the coupling, which is not in this roadmap. What the
roadmap proves about it is the scheme-invariance statement of Layer 2.4. -/
def beta1 (c : ColourData) : ℝ :=
  34 / 3 * c.cA ^ 2 - 4 * c.cF * c.tF * c.nf - 20 / 3 * c.cA * c.tF * c.nf

/-- Asymptotic freedom is a condition on the flavour number, Layer 2.2: `β₀ > 0` exactly when
`n_f < 11 C_A / (4 T_F)`, which for `SU(3)` is `n_f < 16.5`. -/
theorem beta0_pos_iff (c : ColourData) (hT : 0 < c.tF) :
    0 < beta0 c ↔ (c.nf : ℝ) < 11 * c.cA / (4 * c.tF) := by
  sorry

/-- The one-loop running coupling in the `α_s/(4π)` normalisation, as an explicit function of
the evolution variable `t = log (Q²/μ₀²)`. Layer 2.3. -/
noncomputable def coupling1Loop (c : ColourData) (a0 t : ℝ) : ℝ :=
  a0 / (1 + beta0 c * a0 * t)

/-- The one-loop coupling solves the truncated renormalisation-group equation
`da/dt = -β₀ a²`, and is the unique solution with that initial value. Layer 2.3. -/
theorem coupling1Loop_hasDerivAt (c : ColourData) (a0 t : ℝ)
    (ht : 1 + beta0 c * a0 * t ≠ 0) :
    HasDerivAt (coupling1Loop c a0) (-beta0 c * coupling1Loop c a0 t ^ 2) t := by
  sorry

/-- Asymptotic freedom, Layer 2.3: the one-loop coupling tends to zero at large scale. The rate
`a t = 1/(β₀ t) + O(t⁻²)` is the accompanying statement and is not in this signature. This is
the theorem that makes the perturbative expansion of everything else in the roadmap
meaningful. -/
theorem coupling1Loop_tendsto_zero (c : ColourData) (a0 : ℝ) (ha : 0 < a0)
    (hb : 0 < beta0 c) :
    Filter.Tendsto (coupling1Loop c a0) Filter.atTop (nhds 0) := by
  sorry

/-! ## Layer 3: the DGLAP system as a one-parameter semigroup -/

/-- The leading-order singlet anomalous dimension matrix, assembled from the four kernel moments
in the basis `(Σ, g)` of Layer 3.1: index `0` is the quark singlet `Σ = ∑_i (q_i + q̄_i)` and
index `1` the gluon, with the row index the daughter and the column index the parent, per
convention 5. Layer 1.5. The theorem that this two-dimensional space is invariant under the
leading-order generator, rather than the full `2 n_f + 1`-dimensional flavour space being
irreducible, is Layer 3.1. -/
noncomputable def gammaS (c : ColourData) (n : ℕ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![(pqq c).moment n, (pqgSinglet c).moment n;
     (pgq c).moment n, (pgg c).moment n]

/-- The reparametrised evolution variable `τ t = ∫₀^t a s ds` of Layer 3.3. Strictly increasing
by positivity of the coupling, hence invertible; it is in this variable, and not in `t`, that the
evolution is a one-parameter semigroup. Convention 11 is the statement of exactly this, and
asserting a one-parameter composition law directly in `t` with a running coupling is false in a
way that is invisible at leading-logarithmic accuracy. -/
noncomputable def tau (a : ℝ → ℝ) (t : ℝ) : ℝ := ∫ s in (0 : ℝ)..t, a s

/-- The moment-space non-singlet evolution operator, `exp (τ * γ_qq N)`. Layer 3.5. -/
noncomputable def nonSingletEvolution (c : ColourData) (n : ℕ) (τ : ℝ) : ℝ :=
  Real.exp (τ * (pqq c).moment n)

/-- The semigroup composition law in the reparametrised variable, Layer 3.3. Stated here in the
scalar non-singlet moment case, where it is provable directly; the operator statement on
densities is the upstream theorem of `TauCeti.Analysis.Semigroups.Defs` applied to the generator
exhibited in Layer 3.3, and is not reproved in this roadmap. -/
theorem nonSingletEvolution_add (c : ColourData) (n : ℕ) (τ₁ τ₂ : ℝ) :
    nonSingletEvolution c n (τ₁ + τ₂)
      = nonSingletEvolution c n τ₁ * nonSingletEvolution c n τ₂ := by
  sorry

/-- The vanishing eigenvalue at `N = 2`, Layer 3.6: `(1, 1)` is a left null vector of the
singlet matrix at `N = 2`, which is the mechanism behind the momentum sum rule. The conservation
of `∑_a M[f_a] 2` under the flow is the corollary, and the general form — a left null vector of
`γ N` gives a conserved linear functional of the moments — is what makes the two sum rules QCD
has checkable rather than coincidental. -/
theorem singlet_momentum_nullVector (c : ColourData) :
    Matrix.vecMul (fun _ : Fin 2 => (1 : ℝ)) (gammaS c 2) = 0 := by
  sorry

/-! ## Layer 4: polarised, transversity, and timelike kernels -/

/-- The leading-order transversity kernel,
`δP_qq z = C_F [ 2 [1/(1-z)]₊ - 2 + (3/2) δ(1-z) ]`, differing from `pqq` only in its regular
part, per convention 8. -/
def deltaTPqq (c : ColourData) : KernelForm :=
  { regular := fun _ => -2 * c.cF, plusCoeff := 2 * c.cF, deltaCoeff := 3 / 2 * c.cF }

/-- The leading-order polarised gluon-in-quark kernel, `ΔP_gq z = C_F (2 - z)`. -/
def DeltaPgq (c : ColourData) : KernelForm :=
  { regular := fun z => c.cF * (2 - z), plusCoeff := 0, deltaCoeff := 0 }

/-- The leading-order polarised quark-in-gluon kernel per flavour, `ΔP_qg z = T_F (2z - 1)`. -/
def DeltaPqg (c : ColourData) : KernelForm :=
  { regular := fun z => c.tF * (2 * z - 1), plusCoeff := 0, deltaCoeff := 0 }

/-- The leading-order polarised gluon-to-gluon kernel,
`ΔP_gg z = 2 C_A [ [1/(1-z)]₊ - 2z + 1 ] + ((11/6) C_A - (2/3) n_f T_F) δ(1-z)`. -/
def DeltaPgg (c : ColourData) : KernelForm :=
  { regular := fun z => 2 * c.cA * (1 - 2 * z),
    plusCoeff := 2 * c.cA,
    deltaCoeff := 11 / 6 * c.cA - 2 / 3 * c.nf * c.tF }

/-- Convention 8's trap made concrete, Layer 4.1: the polarised, unpolarised and transversity
kernels have the *same* plus and delta coefficients and differ only in their regular parts, so a
naming collision between them would be silent. -/
theorem polarised_deltaCoeff_eq (c : ColourData) :
    (DeltaPgg c).deltaCoeff = (pgg c).deltaCoeff ∧
      (deltaTPqq c).deltaCoeff = (pqq c).deltaCoeff ∧
      (deltaTPqq c).plusCoeff = (pqq c).plusCoeff := by
  sorry

/-- The transversity system has no conserved first moment: `δγ_qq 1 = C_F / 2 ≠ 0`, in contrast
with `pqq_moment_one`. Layer 4.4. -/
theorem deltaTPqq_moment_one (c : ColourData) : (deltaTPqq c).moment 1 = c.cF / 2 := by
  sorry

/-- The timelike kernels governing fragmentation functions, carried as data. They are data
rather than definitions because the statement that interests Layer 4.3 is a comparison with the
spacelike kernels, and a definition that built the coincidence in would make that comparison
vacuous. -/
structure TimelikeKernels where
  /-- The timelike quark-to-quark kernel. -/
  qq : KernelForm
  /-- The timelike gluon-in-quark kernel. -/
  gq : KernelForm
  /-- The timelike quark-in-gluon kernel, per flavour. -/
  qg : KernelForm
  /-- The timelike gluon-to-gluon kernel. -/
  gg : KernelForm

/-- The Gribov-Lipatov property: the timelike kernels coincide with the spacelike ones. Layer
4.3 proves this holds of the leading-order timelike kernels and records that it **fails** at two
loops; the reciprocity-respecting reformulation that replaces it there is a conjecture supported
to three loops, not a target to discharge. -/
def GribovLipatov (c : ColourData) (T : TimelikeKernels) : Prop :=
  T.qq = pqq c ∧ T.gq = pgq c ∧ T.qg = pqg c ∧ T.gg = pgg c

/-! ## Layer 5: factorisation scheme change -/

/-- A factorisation scheme change, per convention 10: explicit data, a structure, never a
typeclass. A typeclass would let two different scheme choices unify by instance resolution and
would make every statement below vacuous. The field is the order-`a` term of the transformation
matrix on the singlet moments, in the basis of `gammaS`; the leading term is the identity and is
not carried. -/
structure SchemeChange where
  /-- The order-`a` coefficient of the transformation matrix on the singlet moments, as a
  function of the moment index. -/
  z1 : ℕ → Matrix (Fin 2) (Fin 2) ℝ

/-- The order-`a²` shift of the singlet anomalous dimension under a scheme change, Layer 5.1:
the inhomogeneous conjugation `γ ↦ Z γ Z⁻¹ + (dZ/dτ) Z⁻¹` expanded to first order. That the
order-`a` part is *not* shifted — the scheme independence of the leading-order kernels, Layer
5.2 — is the statement that this expression begins at order `a²`, and it is what licenses Layer
1 to speak of "the" leading-order kernels without naming a scheme. -/
noncomputable def nloShift (c : ColourData) (S : SchemeChange) (n : ℕ) :
    Matrix (Fin 2) (Fin 2) ℝ :=
  gammaS c n * S.z1 n - S.z1 n * gammaS c n - (2 * beta0 c) • S.z1 n

/-- The next-to-leading-order kernels are scheme dependent in a way no choice of scheme change
removes, Layer 5.2: the commutator is traceless, so the trace of the shift is the inhomogeneous
term alone and vanishes only for a traceless `Z₁`. A statement quoting the two-loop kernels
without a scheme label is therefore incomplete. -/
theorem trace_nloShift (c : ColourData) (S : SchemeChange) (n : ℕ) :
    Matrix.trace (nloShift c S n) = -(2 * beta0 c) * Matrix.trace (S.z1 n) := by
  sorry

end EpsilonEridaniRoadmap.CollinearEvolution

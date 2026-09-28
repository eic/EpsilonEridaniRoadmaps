import EpsilonEridani

/-!
# Multi-parton correlations and higher twist: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results in
any layer.

Four design choices are made explicit by the signatures below. First, twist is a grading computed
from light-cone field content, so it is a function on a data type of field insertions and not a
numeral attached by hand; additivity is then a lemma and not a convention. Second, a gauge link is
a field of every correlator, carrying its direction and colour representation, so that the
process dependence of a naive-time-reversal-odd correlator is expressible rather than implicit.
Third, a correlator of two momentum fractions carries its value as a function on the whole plane
together with a separate support predicate, so that the soft-gluon-pole restriction to the diagonal
is a definition one can reason about and the support statement is a theorem. Fourth, a power
correction carries its subtraction scheme and its target-mass-resummation flag as data, because
without them the quantity it names is ambiguous by an amount of its own size.

Nothing here encodes an unproved statement as a structure field. Unproved targets appear as
`sorry`-ed theorems whose hypotheses are written out; statements that are hypotheses of the physics
rather than theorems of it appear as explicit hypotheses of the signature.
-/

open MeasureTheory
open scoped BigOperators

namespace EpsilonEridaniRoadmaps.MultiPartonCorrelations

/-! ## Layer 0: twist as a grading on light-cone operators -/

/-- A single field insertion in a light-cone operator, labelled by the light-cone component that
determines its contribution to the twist of the operator. `goodQuark` is `P₊ψ`, `badQuark` is
`P₋ψ`, `transverseStrength` is `F^{+i}`, and `plusMinusStrength` is `F^{+-}`. -/
inductive FieldInsertion
  | goodQuark
  | badQuark
  | transverseStrength
  | plusMinusStrength
  deriving DecidableEq, Repr

/-- The twist carried by a single field insertion: one for a good quark field or a transverse
field strength, two for a bad quark field or for `F^{+-}`. This is the counting of README 0.2. -/
def FieldInsertion.twist : FieldInsertion → ℕ
  | .goodQuark => 1
  | .badQuark => 2
  | .transverseStrength => 1
  | .plusMinusStrength => 2

/-- A light-cone operator, recorded as its list of field insertions. The Dirac and colour
structure do not affect the twist and are carried elsewhere. -/
abbrev LightConeOperator := List FieldInsertion

/-- The twist of a light-cone operator: the sum of the twists of its field insertions. -/
def opTwist (O : LightConeOperator) : ℕ := (O.map FieldInsertion.twist).sum

/-- Twist is additive under juxtaposition of field content. -/
theorem opTwist_append (O P : LightConeOperator) :
    opTwist (O ++ P) = opTwist O + opTwist P := by
  simp [opTwist]

/-- The twist-two two-field operator: two good quark fields. -/
example : opTwist [.goodQuark, .goodQuark] = 2 := by decide

/-- The twist-three quark-gluon-quark operator of README 0.2 and Layer 1. -/
example : opTwist [.goodQuark, .transverseStrength, .goodQuark] = 3 := by decide

/-- The twist-three two-field operator with one bad component. -/
example : opTwist [.goodQuark, .badQuark] = 3 := by decide

/-- The four-quark operator that is both the twist-four operator content of Layer 4 and, at
non-zero transverse separation, the double parton distribution of Layer 6. -/
example : opTwist [.goodQuark, .goodQuark, .goodQuark, .goodQuark] = 4 := by decide

/-! ## Layer 1: gauge links and the twist-three operator basis -/

/-- The direction of a light-cone staple: to future or past light-cone infinity. Reversing it is
the naive time reversal of README 1.3, and the sign relating the correlators of README 2.5 to the
Sivers function of `TransverseMomentumDistributions` depends on this field. -/
inductive LinkDirection
  | future
  | past
  deriving DecidableEq, Repr

/-- The colour representation a link is taken in. -/
inductive ColourRep
  | fundamental
  | adjoint
  deriving DecidableEq, Repr

/-- The gauge link data every multi-parton correlator carries, per README Convention 3. -/
structure LinkPath where
  direction : LinkDirection
  rep : ColourRep
  deriving DecidableEq, Repr

/-- Reversing the staple direction. -/
def LinkDirection.reverse : LinkDirection → LinkDirection
  | .future => .past
  | .past => .future

theorem LinkDirection.reverse_reverse (d : LinkDirection) : d.reverse.reverse = d := by
  cases d <;> rfl

/-- The chirality structure of the Dirac matrix in a correlator: chiral-even structures connect
equal chiralities, chiral-odd structures opposite ones. `g_T` is chiral-even; `h_L` and `e` are
chiral-odd. -/
inductive Chirality
  | even
  | odd
  deriving DecidableEq, Repr

/-- A forward twist-three quark-gluon-quark correlator. `value x₁ x₂` uses the argument order of
README Convention 4: `x₁` is the fraction of the left-hand quark field and the gluon carries
`x₁ - x₂`. The value is recorded on all of `ℝ × ℝ`, with the physical support carried by
`InSupport` below rather than by a field, so that the support statement of Layer 1 is a theorem. -/
structure QGQCorrelator (Flavour : Type) where
  flavour : Flavour
  chirality : Chirality
  link : LinkPath
  value : ℝ → ℝ → ℝ

/-- The support region of a twist-three correlator cut out by the spectral condition. -/
def InSupport (x₁ x₂ : ℝ) : Prop :=
  |x₁| ≤ 1 ∧ |x₂| ≤ 1

/-- The soft-gluon-pole restriction of a correlator to the diagonal. Its existence as a
restriction of a distribution is the regularity statement of README 2.4; here the diagonal of a
function is taken, and the theorem that the distributional restriction agrees with it is a target
of Layer 2. -/
def softGluonPole {Flavour : Type} (T : QGQCorrelator Flavour) : ℝ → ℝ :=
  fun x => T.value x x

/-- README 1.3 and 2.4: the chiral-even transverse-spin correlator is symmetric under exchange of
its two momentum fractions. -/
theorem qgq_symm_of_chiralEven {Flavour : Type} (T : QGQCorrelator Flavour)
    (hchi : T.chirality = Chirality.even) (x₁ x₂ : ℝ) :
    T.value x₁ x₂ = T.value x₂ x₁ := by
  sorry

/-! ## Layer 2: the twist-three collinear functions -/

/-- The Wandzura-Wilczek part of `g_T`, README 2.2. -/
noncomputable def wwGT (g₁ : ℝ → ℝ) (x : ℝ) : ℝ := ∫ y in Set.Ioc x (1 : ℝ), g₁ y / y

/-- The Wandzura-Wilczek part of `h_L`, README 2.2. -/
noncomputable def wwHL (h₁ : ℝ → ℝ) (x : ℝ) : ℝ :=
  -2 * x * ∫ y in Set.Ioc x (1 : ℝ), h₁ y / y ^ 2

/-- The mass term that plays the role of a Wandzura-Wilczek part for `e`, README 2.2. `mq` is the
quark mass and `M` the nucleon mass. -/
noncomputable def wwE (mq M : ℝ) (f₁ : ℝ → ℝ) (x : ℝ) : ℝ := (mq / M) * f₁ x / x

/-- README 1.4, the equation-of-motion relation for `g_T`, with the three-parton term retained.
`g1Tmoment` is the first transverse moment supplied by `TransverseMomentumDistributions`, and
`threeParton` is the integral of the correlator over its second argument, which `hthree` fixes.
The integrability condition that makes the transverse moment exist is a hypothesis of the
transverse-moment operation on that roadmap's side and is not restated here. -/
theorem eom_gT {Flavour : Type} (T : QGQCorrelator Flavour) (gT h₁ g1Tmoment : ℝ → ℝ)
    (threeParton : ℝ → ℝ) (mq M : ℝ) (x : ℝ) (hx : 0 < x)
    (hthree : ∀ y, threeParton y = ∫ z in Set.Icc (-1 : ℝ) 1, T.value y z) :
    x * gT x = g1Tmoment x + (mq / M) * h₁ x + threeParton x := by
  sorry

/-- README 1.5: the Lorentz-invariance relation in the form in which the three-parton terms are
retained. `g1TmomentDeriv` is the derivative of the first transverse moment, supplied with the
hypothesis that it is one. The statement that the naive form, obtained by deleting `threeParton`,
is false is a separate target exhibited by a model counterexample. -/
theorem lorentzInvarianceRelation (gT g₁ g1Tmoment g1TmomentDeriv threeParton : ℝ → ℝ) (x : ℝ)
    (hderiv : ∀ y, HasDerivAt g1Tmoment (g1TmomentDeriv y) y) :
    gT x = g₁ x + g1TmomentDeriv x + threeParton x := by
  sorry

/-- README 2.3, the Burkhardt-Cottingham sum rule, with both hypotheses explicit: integrability on
the open interval, and the vanishing of `x g₂(x)` at the origin, which excludes a contribution
supported at `x = 0`. Neither hypothesis is claimed to be proved by this roadmap. -/
theorem burkhardtCottingham (g₂ : ℝ → ℝ)
    (hint : IntegrableOn g₂ (Set.Ioc (0 : ℝ) 1))
    (hzero : Filter.Tendsto (fun x : ℝ => x * g₂ x)
      (nhdsWithin 0 (Set.Ioi (0 : ℝ))) (nhds 0)) :
    ∫ x in Set.Ioc (0 : ℝ) 1, g₂ x = 0 := by
  sorry

/-- README 2.5: the diagonal value of the Efremov-Teryaev-Qiu-Sterman correlator against the first
transverse moment of the Sivers function. The constant `c` is fixed by Conventions 2, 4 and 6 and
by the link direction; deriving it, with its sign, is the content of the target. -/
theorem etqs_sivers {Flavour : Type} (T : QGQCorrelator Flavour) (siversMoment : ℝ → ℝ)
    (M c : ℝ) (hlink : T.link.direction = LinkDirection.future) (x : ℝ) :
    softGluonPole T x = c * M * siversMoment x := by
  sorry

/-! ## Layer 3: evolution beyond DGLAP -/

/-- A two-variable evolution kernel, README 3.2. It is not a product of one-variable kernels and
is not diagonal in either argument, so it is recorded as a function of four fractions. -/
structure TwoVariableKernel where
  kernel : ℝ → ℝ → ℝ → ℝ → ℝ

/-- The integral operator a two-variable kernel defines on functions of two momentum fractions. -/
noncomputable def TwoVariableKernel.apply (K : TwoVariableKernel) (F : ℝ → ℝ → ℝ) :
    ℝ → ℝ → ℝ :=
  fun x₁ x₂ => ∫ y₁ in Set.Icc (-1 : ℝ) 1, ∫ y₂ in Set.Icc (-1 : ℝ) 1,
    K.kernel x₁ x₂ y₁ y₂ * F y₁ y₂

/-- README 3.2: the diagonal value of a twist-three correlator does not evolve autonomously. The
statement is that there exist two correlators agreeing on the diagonal whose images under the
evolution operator do not, which is the precise content of "not a DGLAP equation". -/
theorem diagonal_not_autonomous :
    ∃ (K : TwoVariableKernel) (F G : ℝ → ℝ → ℝ),
      (∀ x, F x x = G x x) ∧ ∃ x, K.apply F x x ≠ K.apply G x x := by
  sorry

/-- README 3.4: in the large-`N_c` limit the evolution of the diagonal closes onto a one-variable
kernel. The hypothesis `hclosed` — that the diagonal image depends only on the diagonal of the
input — is what the colour counting of Layer 3 establishes in that limit, and is exactly what
`diagonal_not_autonomous` denies at finite `N_c`; the conclusion is the representation by a
one-variable kernel. -/
theorem largeNc_diagonal_closure (K : TwoVariableKernel)
    (hclosed : ∀ F G : ℝ → ℝ → ℝ, (∀ x, F x x = G x x) → ∀ x, K.apply F x x = K.apply G x x) :
    ∃ k : ℝ → ℝ → ℝ, ∀ F : ℝ → ℝ → ℝ, ∀ x : ℝ,
      K.apply F x x = ∫ y in Set.Icc (-1 : ℝ) 1, k x y * F y y := by
  sorry

/-! ## Layer 4: power corrections to inclusive structure functions -/

/-- The subtraction prescription defining the leading-twist term a power correction corrects,
README Convention 7. Without this field a twist-four matrix element is ambiguous by an amount of
its own size. -/
inductive SubtractionScheme
  | msbar
  | renormalonSubtracted
  | cutoff (mu0 : ℝ)

/-- A power correction to an inclusive structure function. `order` is the perturbative order at
which the leading-twist term was computed and `tmcResummed` records whether target-mass
corrections have been resummed into it, per README Convention 8. -/
structure PowerCorrection where
  scheme : SubtractionScheme
  order : ℕ
  tmcResummed : Bool
  coeff : ℝ → ℝ

/-- The Nachtmann variable, README 4.3. -/
noncomputable def nachtmann (M x Q2 : ℝ) : ℝ :=
  2 * x / (1 + Real.sqrt (1 + 4 * M ^ 2 * x ^ 2 / Q2))

/-- README 4.3: the Nachtmann variable is bounded by the Bjorken variable. -/
theorem nachtmann_le (M x Q2 : ℝ) (hx : 0 < x) (hQ : 0 < Q2) : nachtmann M x Q2 ≤ x := by
  sorry

/-- README 4.4: the twist-two plus twist-four sum is independent of the subtraction scheme to the
stated accuracy, while the twist-four coefficient alone is not. `remainder` bounds the accuracy. -/
theorem scheme_independence (F2 : ℝ → ℝ → ℝ) (P Q : PowerCorrection) (remainder : ℝ → ℝ → ℝ)
    (hsame : P.order = Q.order) (x Q2 : ℝ) :
    |(F2 x Q2 + P.coeff x / Q2) - (F2 x Q2 + Q.coeff x / Q2)| ≤ |remainder x Q2| := by
  sorry

/-! ## Layer 5: twist-three single-spin asymmetries -/

/-- The Dirac-trace data behind a Born-level single-transverse-spin observable in collinear
factorisation: the trace of the interfering amplitude pair, as a function of the quark mass. -/
structure BornTraceData where
  mass : ℝ
  trace : ℝ → ℝ

/-- README 5.1, the chirality half of the vanishing theorem. The hypothesis `hchir` — that the
trace is proportional to the quark mass, because massless perturbative QCD conserves chirality —
is the theorem of Layer 5; given it, the vanishing for massless quarks is immediate, and stating
the implication separately is what keeps the massless hypothesis visible. -/
theorem asymmetry_vanishes_of_massless {c : ℝ → ℝ} (T : BornTraceData)
    (hchir : ∀ m, T.trace m = m * c m) (hm : T.mass = 0) : T.trace T.mass = 0 := by
  rw [hm, hchir, zero_mul]

/-- README 5.2 and 5.3: the combination of the diagonal correlator and its diagonal derivative
that enters a twist-three single-spin asymmetry. The derivative is a weak derivative in the full
development; here it is supplied as data so the combination can be named. -/
def derivativeCombination (T diagDeriv : ℝ → ℝ) (x : ℝ) : ℝ := T x - x * diagDeriv x

/-! ## Layer 6: double parton distributions -/

/-- The colour channel of a double parton distribution: the two bilinears each a colour singlet,
or each in the adjoint and coupled to a singlet. The adjoint channel is Sudakov suppressed but is
retained in the definition, per README 6.1. -/
inductive ColourChannel
  | singletSinglet
  | adjointAdjoint
  deriving DecidableEq, Repr

/-- A double parton distribution, README 6.1. `value x₁ x₂ y` takes the two momentum fractions and
the transverse separation. The support `x₁ + x₂ ≤ 1` is a theorem, not a field. -/
structure DoublePartonDistribution (Flavour : Type) where
  flavour₁ : Flavour
  flavour₂ : Flavour
  colour : ColourChannel
  value : ℝ → ℝ → ℝ → ℝ

/-- The support region of a double parton distribution: the ordered simplex. -/
def DPDSupport (x₁ x₂ : ℝ) : Prop := 0 < x₁ ∧ 0 < x₂ ∧ x₁ + x₂ ≤ 1

/-- README 6.1: the support statement, proved from the spectral condition on the intermediate
states. `remnantPlus` is the plus-momentum fraction left in the hadron remnant after both partons
are removed, and `spectral` is the condition that a non-vanishing matrix element requires both
removed fractions and the remnant fraction to be physical. Deriving the ordered simplex from that
condition is the target. -/
theorem dpd_support_of_spectral {Flavour : Type} (F : DoublePartonDistribution Flavour)
    (remnantPlus : ℝ → ℝ → ℝ)
    (hremnant : ∀ x₁ x₂, remnantPlus x₁ x₂ = 1 - x₁ - x₂)
    (spectral : ∀ x₁ x₂ y, F.value x₁ x₂ y ≠ 0 → 0 < x₁ ∧ 0 < x₂ ∧ 0 ≤ remnantPlus x₁ x₂)
    (x₁ x₂ y : ℝ) (h : F.value x₁ x₂ y ≠ 0) : DPDSupport x₁ x₂ := by
  sorry

/-- The transverse-separation-integrated double parton distribution, on which the sum rules of
README 6.3 are stated. -/
noncomputable def DoublePartonDistribution.integrated {Flavour : Type}
    (F : DoublePartonDistribution Flavour) (x₁ x₂ : ℝ) : ℝ :=
  ∫ y in Set.Ioi (0 : ℝ), 2 * Real.pi * y * F.value x₁ x₂ y

/-- README 6.3, the momentum sum rule, for a family of distributions indexed by the first parton's
flavour and summed over it. `single` is the single-parton density of
`InclusiveStructureFunctions`. -/
theorem momentumSumRule {Flavour : Type} [Fintype Flavour]
    (F : Flavour → DoublePartonDistribution Flavour) (single : ℝ → ℝ) (x₂ : ℝ)
    (hx₂ : 0 < x₂) (hx₂' : x₂ < 1)
    (hint : ∀ a, IntegrableOn (fun x₁ => x₁ * (F a).integrated x₁ x₂)
      (Set.Ioc (0 : ℝ) (1 - x₂))) :
    (∑ a : Flavour, ∫ x₁ in Set.Ioc (0 : ℝ) (1 - x₂), x₁ * (F a).integrated x₁ x₂)
      = (1 - x₂) * single x₂ := by
  sorry

/-- README 6.3, the number sum rule for a quark flavour. `valenceCount` is the number of valence
quarks of the first parton's flavour, `deltaAnti` is one when that flavour is the antiflavour of
the second parton and zero otherwise, and `deltaSame` is one when the two flavours coincide. The
`deltaAnti - deltaSame` structure is the part of this sum rule that is invisible if flavour is
implicit, per README Convention 11, and the sum rule is false without it. -/
theorem numberSumRule {Flavour : Type} (F : DoublePartonDistribution Flavour) (single : ℝ → ℝ)
    (valenceCount deltaAnti deltaSame : ℝ) (x₂ : ℝ) (hx₂ : 0 < x₂) (hx₂' : x₂ < 1)
    (hint : IntegrableOn (fun x₁ => F.integrated x₁ x₂) (Set.Ioc (0 : ℝ) (1 - x₂))) :
    ∫ x₁ in Set.Ioc (0 : ℝ) (1 - x₂), F.integrated x₁ x₂
      = (valenceCount + deltaAnti - deltaSame) * single x₂ := by
  sorry

/-- The inhomogeneous source of README 6.4: a single parton of momentum fraction `x₁ + x₂`
splitting into the two observed partons. -/
noncomputable def splittingSource (single : ℝ → ℝ) (P : ℝ → ℝ) (alphaS x₁ x₂ : ℝ) : ℝ :=
  (alphaS / (2 * Real.pi)) * (1 / (x₁ + x₂)) * single (x₁ + x₂) * P (x₁ / (x₁ + x₂))

/-- README 6.4, the conservation theorem. `sum t x₂` is the momentum-sum-rule left-hand side at
evolution time `t` and `single t x₂` the single-parton density at the same time. The physics
content is the hypothesis `hdefect`: under the inhomogeneous evolution the scale derivative of the
sum-rule defect vanishes, which is what the inhomogeneous term is for, and which fails for the
homogeneous part alone. Given it, the sum rule holds at every scale once it holds at one. -/
theorem momentumSumRule_preserved (sum single : ℝ → ℝ → ℝ)
    (hinit : ∀ x₂, sum 0 x₂ = (1 - x₂) * single 0 x₂)
    (hdefect : ∀ x₂ t, HasDerivAt (fun s => sum s x₂ - (1 - x₂) * single s x₂) 0 t)
    (t x₂ : ℝ) : sum t x₂ = (1 - x₂) * single t x₂ := by
  sorry

/-- The inverse effective cross section as a position-space integral of the squared transverse
profile, README 6.5, for a radially symmetric profile `G`. -/
noncomputable def sigmaEffInv (G : ℝ → ℝ) : ℝ :=
  ∫ y in Set.Ioi (0 : ℝ), 2 * Real.pi * y * (G y) ^ 2

/-- The pocket formula, README 6.5. `m` is one for identical processes and two otherwise, and the
derivation of that factor from the symmetry of the two-process final state is a target of
Layer 6. -/
noncomputable def pocketFormula (m : ℕ) (sigmaA sigmaB sigmaEff : ℝ) : ℝ :=
  ((m : ℝ) / 2) * sigmaA * sigmaB / sigmaEff

/-- The double-scattering cross section in position space for a distribution of the factorised
form of README 6.5: the two single-scattering cross sections times the overlap of the squared
transverse profile. Deriving this expression from the operator definition of the distribution,
rather than positing it, is the target of Layer 6; here it is the definition against which the
pocket formula is identified. -/
noncomputable def dpsCrossSection (m : ℕ) (sigmaA sigmaB : ℝ) (G : ℝ → ℝ) : ℝ :=
  ((m : ℝ) / 2) * sigmaA * sigmaB * sigmaEffInv G

/-- README 6.5: with `σ_eff` defined as the reciprocal of the squared-profile overlap, the
position-space double-scattering cross section takes the pocket form. -/
theorem dpsCrossSection_eq_pocketFormula (m : ℕ) (sigmaA sigmaB : ℝ) (G : ℝ → ℝ) :
    dpsCrossSection m sigmaA sigmaB G
      = pocketFormula m sigmaA sigmaB (sigmaEffInv G)⁻¹ := by
  sorry

/-- README 6.5: a product form imposed at one scale is not a product form at another. This is the
theorem that makes the factorisation hypothesis of the pocket formula a hypothesis rather than a
property of QCD, and it is stated as an existence statement over an evolving family indexed by
evolution time. -/
theorem factorisation_not_preserved :
    ∃ (F : ℝ → DoublePartonDistribution ℕ) (f₁ f₂ G : ℝ → ℝ),
      (∀ x₁ x₂ y, (F 0).value x₁ x₂ y = f₁ x₁ * f₂ x₂ * G y) ∧
      ∀ g₁ g₂ H : ℝ → ℝ, ∃ x₁ x₂ y, (F 1).value x₁ x₂ y ≠ g₁ x₁ * g₂ x₂ * H y := by
  sorry

end EpsilonEridaniRoadmaps.MultiPartonCorrelations

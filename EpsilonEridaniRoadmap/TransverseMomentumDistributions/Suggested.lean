import EpsilonEridani

/-!
# Transverse-momentum-dependent distributions: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Three design choices are made explicit by these signatures. First, the gauge-link path is a field
of the distribution's *argument list*, not a parameter with a default: a statement about "the
Sivers function" that is true for one path and false for the other cannot be written down without
naming the path, so the sign-change theorem of Layer 1.4 is quantified over paths rather than
asserted about a symbol. Second, a properly defined distribution carries both scales; the
single-scale correlator appears only as a separate structure, so that the divergence theorem of
Layer 2.3 is a statement about a different type and cannot be confused with a statement about a
distribution. Third, the eight leading-twist functions and the eighteen azimuthal structure
functions are given as enumerated types, so that the completeness statements of Layers 1.1 and 5.1
and the bijection of Layer 5.2 are statements about finite types rather than informal claims about
a list.

Every theorem below is `sorry`-ed. Where a result depends on a hypothesis that this roadmap does
not prove — region completeness and Glauber cancellation for the factorisation theorem, the
vanishing of the genuine twist-three functions for the Wandzura-Wilczek-type relations — the
hypothesis is an explicit argument, so that no statement is stronger than the roadmap claims.
-/

namespace EpsilonEridaniRoadmap.TransverseMomentumDistributions

open scoped Real
open MeasureTheory

/-! ## Layer 0: kinematics and the transverse plane -/

/-- The transverse plane: the common orthogonal complement of the two light-like directions of
Layer 0.1. All transverse momenta and the impact-parameter variable live here. -/
abbrev TransversePlane := EuclideanSpace ℝ (Fin 2)

/-- The orientation datum fixing the sign convention for azimuthal angles (Convention 5). The
Trento convention is one of the two values; every structure function refers to this datum. -/
inductive Orientation
  | trento
  | opposite
  deriving DecidableEq, Repr

/-! ## Layer 1: the gauge link, the eight distributions, and the sign -/

/-- A staple-shaped gauge-link path. `future` is the path running out along the light cone to
plus infinity, transversely across, and back; `past` the same with the light-cone direction
reversed; `straight` the direct segment, which is time-reversal even (Layer 1.2). -/
inductive LinkPath
  | future
  | past
  | straight
  deriving DecidableEq, Repr

/-- Reversal of a link path, exchanging the two staples and fixing the straight path. This is the
only operation on paths the sign-change theorem uses (Layer 1.2). -/
def LinkPath.reverse : LinkPath → LinkPath
  | .future => .past
  | .past => .future
  | .straight => .straight

/-- Reversal is an involution. -/
theorem LinkPath.reverse_reverse (p : LinkPath) : p.reverse.reverse = p := by
  cases p <;> rfl

/-- The eight leading-twist quark transverse-momentum-dependent distributions, named after the
Mulders-Tangerman amplitudes (Convention 6). -/
inductive TmdName
  | f1 | g1L | h1 | f1Tperp | h1perp | g1T | h1Lperp | h1Tperp
  deriving DecidableEq, Repr

/-- The time-reversal classification of Layer 1.4: exactly `f1Tperp` and `h1perp` are T-odd. -/
def TmdName.isTOdd : TmdName → Bool
  | .f1Tperp => true
  | .h1perp => true
  | _ => false

/-- A single leading-twist distribution as a function of the momentum fraction, the parton
transverse momentum and the gauge-link path. The path is an argument, never a default. -/
structure Tmd where
  eval : ℝ → TransversePlane → LinkPath → ℝ

/-- A distribution is T-even when the two staple paths agree.

Stated as equality of the two staple evaluations rather than through a `LinkPath.reverse`
involution. With only two staples the two formulations coincide, and the explicit form keeps the
statement readable at the cost of not generalising if a third path is added. -/
def Tmd.IsTEven (F : Tmd) : Prop :=
  ∀ x k, F.eval x k .future = F.eval x k .past

/-- A distribution is T-odd when the two staple paths differ by a sign. -/
def Tmd.IsTOdd (F : Tmd) : Prop :=
  ∀ x k, F.eval x k .future = -F.eval x k .past

/-- The eight distributions of a single hadron, indexed by name (Layer 1.1). -/
structure LeadingTwistFamily where
  dist : TmdName → Tmd

/-- Layer 1.4, the central universality statement: the classification by `TmdName.isTOdd`
agrees with the behaviour under exchange of the two staple paths. Stated once, quantified over
the eight names, per Convention 8. -/
theorem sign_change_of_isTOdd (Φ : LeadingTwistFamily) (n : TmdName) :
    (n.isTOdd = true → (Φ.dist n).IsTOdd) ∧ (n.isTOdd = false → (Φ.dist n).IsTEven) :=
  sorry

/-- Layer 1.4, corollary: a T-odd distribution defined with the time-reversal-even straight link
vanishes identically. This is the precise sense in which the staple is what allows the T-odd
functions to be non-zero. -/
theorem tOdd_vanishes_straight (Φ : LeadingTwistFamily) (n : TmdName)
    (hn : n.isTOdd = true) (x : ℝ) (k : TransversePlane) :
    (Φ.dist n).eval x k .straight = 0 :=
  sorry

/-- Layer 1.6: the leading pointwise positivity bound, a one-by-one minor of the
positive-semidefinite correlator matrix. -/
theorem f1_nonneg (Φ : LeadingTwistFamily) (x : ℝ) (k : TransversePlane) (p : LinkPath) :
    0 ≤ (Φ.dist .f1).eval x k p :=
  sorry

/-- Layer 1.6: the generalised Soffer bound, a two-by-two minor of the same matrix. -/
theorem soffer_tmd (Φ : LeadingTwistFamily) (x : ℝ) (k : TransversePlane) (p : LinkPath) :
    2 * |(Φ.dist .h1).eval x k p| ≤ (Φ.dist .f1).eval x k p + (Φ.dist .g1L).eval x k p :=
  sorry

/-- Layer 1.5: the `n`-th transverse moment, with the weight of Convention 7 supplied by the
target mass. The weight appears in the definition so that no statement can silently use a
different one. -/
def transverseMoment (F : Tmd) (p : LinkPath) (M : ℝ) (n : ℕ) (x : ℝ) : ℝ :=
  sorry

/-! ## Layer 2: the two definitions, and why only one of them is a distribution -/

/-- The naive single-scale correlator of Layer 2.3: a perfectly definable object whose defining
integral diverges in the light-cone limit. It is a separate type from `TmdTwoScale` so that the
divergence theorem cannot be mistaken for a statement about a distribution (Convention 3). -/
structure NaiveCorrelator where
  eval : ℝ → TransversePlane → LinkPath → ℝ
  /-- The light-cone cutoff at which the object is evaluated; the divergence is in its removal. -/
  cutoff : ℝ

/-- Layer 2.3: the naive correlator's rapidity divergence, stated as unboundedness in the
removal of the cutoff. -/
theorem naive_rapidity_divergent (C : ℝ → NaiveCorrelator) (x : ℝ) (k : TransversePlane) :
    ¬ ∃ L : ℝ, ∀ Λ : ℝ, |(C Λ).eval x k .future| ≤ L :=
  sorry

/-- A properly defined distribution in impact-parameter space, depending on the renormalisation
scale and the rapidity scale (Convention 3). The transverse argument is named `bT` and is
conjugate to the parton transverse momentum, never the impact parameter of
`GeneralizedPartonDistributions` (Convention 4). -/
structure TmdTwoScale where
  /-- `eval x bT μ ζ p` -/
  eval : ℝ → TransversePlane → ℝ → ℝ → LinkPath → ℝ

/-- The hypotheses of the factorisation theorem of Layer 2.4 that this roadmap does not prove.
They are carried as an explicit argument of every statement derived from the theorem. -/
structure FactorisationHypotheses where
  regionComplete : Prop
  glauberCancels : Prop
  eikonalValid : Prop
  powerCounting : Prop

/-! ## Layer 3: evolution -/

/-- The Collins-Soper kernel: a function of the impact-parameter variable and the renormalisation
scale only. Independence of `x` and of the rapidity scale is Layer 3.1, not part of this
definition. -/
structure CollinsSoperKernel where
  eval : TransversePlane → ℝ → ℝ

/-- Layer 3.3: the Collins-Soper equation, stated as a derivative in the logarithm of the
rapidity scale at fixed impact parameter. Multiplicativity in `bT` is what makes the right-hand
side a scalar. -/
def SatisfiesCollinsSoper (F : TmdTwoScale) (K : CollinsSoperKernel) : Prop :=
  ∀ (x : ℝ) (bT : TransversePlane) (μ ζ : ℝ) (p : LinkPath),
    0 < μ → 0 < ζ → x ∈ Set.Ioo (0 : ℝ) 1 →
      HasDerivAt (fun s => Real.log (F.eval x bT μ (Real.exp (2 * s)) p))
        (K.eval bT μ) (Real.log (Real.sqrt ζ))

/-- Layer 3.4: the consistency condition. The renormalisation-scale derivative of the
Collins-Soper kernel is minus the cusp anomalous dimension, which is independent of the impact
parameter. This single equation is the commutation of the two evolution derivatives. -/
theorem evolution_consistency (K : CollinsSoperKernel) (Γcusp : ℝ → ℝ) :
    ∀ bT μ, 0 < μ →
      HasDerivAt (fun t => K.eval bT (Real.exp t)) (-(Γcusp μ)) (Real.log μ) :=
  sorry

/-- Layer 3.3: the exponentiated solution solves the Collins-Soper equation. The generator being
multiplication by the kernel makes this an instance of a multiplication semigroup rather than a
construction. Both rapidity scales are positive: `Real.sqrt` and `Real.log` are total, so without
the hypotheses the equation would also be asserted at `ζ ≤ 0`, where the exponent is junk. -/
theorem collinsSoper_solution (F : TmdTwoScale) (K : CollinsSoperKernel)
    (h : SatisfiesCollinsSoper F K) (x : ℝ) (bT : TransversePlane) (μ ζi ζf : ℝ)
    (hζi : 0 < ζi) (hζf : 0 < ζf)
    (p : LinkPath) :
    F.eval x bT μ ζf p =
      F.eval x bT μ ζi p *
        Real.exp (K.eval bT μ * Real.log (Real.sqrt ζf / Real.sqrt ζi)) :=
  sorry

/-! ## Layer 5: the eighteen azimuthal structure functions -/

/-- The eighteen independent structure functions of the semi-inclusive cross section for a
polarised beam and a polarised target (Layer 5.1). The names are the beam and target polarisation
labels together with the azimuthal modulation. -/
inductive StructureFunctionName
  | UU_T | UU_L | UU_cos1 | UU_cos2
  | LU_sin1
  | UL_sin1 | UL_sin2
  | LL | LL_cos1
  | UT_T_sinHmS | UT_L_sinHmS | UT_sinHpS | UT_sin3HmS | UT_sinS | UT_sin2HmS
  | LT_cosHmS | LT_cosS | LT_cos2HmS
  deriving DecidableEq, Repr

/-- Layer 5.2: which leading-twist distribution each leading-power structure function is a
convolution of. The subleading ten have no entry here; their twist-three content is Layer 5.5. -/
def StructureFunctionName.leadingPartner : StructureFunctionName → Option TmdName
  | .UU_T => some .f1
  | .LL => some .g1L
  | .UT_T_sinHmS => some .f1Tperp
  | .UT_sinHpS => some .h1
  | .UU_cos2 => some .h1perp
  | .UL_sin2 => some .h1Lperp
  | .LT_cosHmS => some .g1T
  | .UT_sin3HmS => some .h1Tperp
  | _ => none

/-- Layer 5.2, the completeness statement: the leading-power structure functions are in bijection
with the eight leading-twist distributions. Stated as unique existence, so that it asserts both
that every distribution is measured by some modulation and that no two modulations measure the
same one at leading power. -/
theorem leadingPartner_bijective (n : TmdName) :
    ∃! s : StructureFunctionName, s.leadingPartner = some n :=
  sorry

/-- Layer 5.4: the Sivers sign change, as a corollary of `sign_change_of_isTOdd` together with
the path assignment derived in the factorisation theorem. The factorisation hypotheses and the
azimuthal orientation are explicit arguments: without the first the statement is not a theorem of
QCD, and without the second it has no sign. -/
theorem sivers_sign_change (Φ : LeadingTwistFamily) (H : FactorisationHypotheses)
    (hR : H.regionComplete) (hG : H.glauberCancels) (o : Orientation) (ho : o = .trento)
    (x : ℝ) (k : TransversePlane) :
    (Φ.dist .f1Tperp).eval x k .past = -(Φ.dist .f1Tperp).eval x k .future :=
  sorry

/-- Layer 5.6: the Wandzura-Wilczek-type approximation, as a named hypothesis rather than a
rewriting step. `tildeVanishes` is the assumption that the genuine twist-three functions of
Layer 1.5 are zero; every lemma using the approximation takes it as an argument. -/
structure WandzuraWilczekType where
  tildeVanishes : Prop

/-- Layer 5.6: the relation for the first transverse moment of `g1T`, conditional on the
approximation. The collinear helicity density is supplied by `SpinStructure`. -/
theorem g1T_moment_ww (Φ : LeadingTwistFamily) (W : WandzuraWilczekType)
    (hW : W.tildeVanishes) (g1 : ℝ → ℝ) (M x : ℝ) (hx : x ∈ Set.Ioo (0 : ℝ) 1) :
    transverseMoment (Φ.dist .g1T) .future M 1 x = ∫ y in Set.Ioo x 1, g1 y / y :=
  sorry

end EpsilonEridaniRoadmap.TransverseMomentumDistributions

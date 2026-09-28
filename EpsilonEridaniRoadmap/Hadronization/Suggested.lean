import Mathlib
import EpsilonEridani.Particles.Fragmentation.Basic
import EpsilonEridani.Particles.Parton.TMD.Basic
import EpsilonEridani.Particles.Parton.TMD.PowerCorrections
import EpsilonEridani.QFT.Factorization.Convolution.Basic
import EpsilonEridani.QFT.Factorization.Convolution.Collinear
import EpsilonEridani.QFT.Factorization.Evolution.Reciprocity

/-!
# Hadronization and fragmentation functions: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

The signatures make four design choices explicit. First, the hadron species is a type parameter
carrying a `Fintype` instance where a sum over species is taken, so that the completeness
assumption behind the momentum sum rule is visible in the statement rather than hidden in a
typeclass. Second, the direction of the gauge link is an argument of every fragmentation
correlator, because the universality of the Collins function is a statement about that argument
and cannot be formulated without it. Third, the timelike anomalous dimension is not redefined
here: it is `EpsilonEridani.QFT.Factorization.Evolution.ReggeTrajectory.timelikeAnomalousDim`, so
the Gribov-Lipatov relation is a specialisation of an upstream theorem and its failure beyond
first order is inherited with it. Fourth, the momentum fraction of the hadron in the parton and
the momentum fraction of the parton in the target never share a name.

Unproved statements are `sorry`, never a `Prop`-valued field with a placeholder witness.
-/

namespace EpsilonEridaniRoadmap.Hadronization

open EpsilonEridani

/-! ## Layer 0: the collinear fragmentation function and its constraints -/

/-- The direction in which the Wilson line of a correlator runs to light-cone infinity. For a
fragmentation correlator it is `future`; the distinction exists because the Collins-function
universality theorem of Layer 3 is the statement that the two choices agree. -/
inductive LinkDirection
  | future
  | past
  deriving DecidableEq, Repr

/-- The data of a collinear fragmentation correlator: the observed hadron species, the fragmenting
parton flavour, the link direction, and the renormalisation scale at which it is defined. The
analytic properties the correlator must have are named hypotheses, not fields. -/
structure FragCorrelatorData (Hadron Flavor : Type) where
  /-- The observed hadron species. -/
  hadron : Hadron
  /-- The flavour of the fragmenting parton. -/
  flavor : Flavor
  /-- The direction of the gauge link. -/
  link : LinkDirection
  /-- The renormalisation scale squared. -/
  scale : ℝ

/-- The collinear fragmentation function extracted from a correlator, as a member of the family
type already in the library. The body is the light-cone Fourier transform of the correlator with
the final-state sum, which is not yet stateable against the pinned API. -/
def fragOfCorrelator {Hadron Flavor : Type}
    (_data : FragCorrelatorData Hadron Flavor) :
    Particles.Fragmentation.Frag Hadron Flavor :=
  sorry

/-- The fragmentation function of a correlator satisfies the structural assumptions of
`EpsilonEridani.Particles.Fragmentation.Assumptions`: support in the unit interval from the
spectral condition on the unobserved state, and non-negativity from positivity of the
final-state sum. -/
theorem assumptions_fragOfCorrelator {Hadron Flavor : Type}
    (data : FragCorrelatorData Hadron Flavor) :
    Particles.Fragmentation.Assumptions (fragOfCorrelator data) :=
  sorry

/-- The momentum sum rule: the momentum of the fragmenting parton is distributed among the
hadrons. The `Fintype Hadron` instance is what makes the species sum writable, and the identity
holds only when that species type is complete for the final-state sum — a hypothesis recorded in
the roadmap prose, not in this definition. -/
def MomentumSumRule {Hadron Flavor : Type} [Fintype Hadron]
    (D : Particles.Fragmentation.Frag Hadron Flavor) : Prop :=
  ∀ (i : Flavor) (Q2 : ℝ),
    Finset.sum Finset.univ (fun h : Hadron => Particles.Fragmentation.zMoment D 1 h i Q2) = 1

/-- The usable consequence of the sum rule for a single species: its first moment is bounded by
one. Only non-negativity of the other terms is needed, not completeness of the species type. -/
theorem zMoment_one_le_one {Hadron Flavor : Type} [Fintype Hadron]
    (D : Particles.Fragmentation.Frag Hadron Flavor)
    (_hD : Particles.Fragmentation.Assumptions D)
    (_hsum : MomentumSumRule D) (h : Hadron) (i : Flavor) (Q2 : ℝ) :
    Particles.Fragmentation.zMoment D 1 h i Q2 ≤ 1 :=
  sorry

/-- No multiplicity sum rule follows from the definition: there is a family satisfying the
structural assumptions and the momentum sum rule whose zeroth moment is not the integral of an
integrable function. Stated as the existence of a family together with a divergence witness. -/
theorem exists_momentumSumRule_not_integrable :
    ∃ (D : Particles.Fragmentation.Frag Unit Unit),
      Particles.Fragmentation.Assumptions D ∧ MomentumSumRule D ∧
        ¬ MeasureTheory.IntegrableOn (fun z : ℝ => D () () z 1) (Set.Icc (0 : ℝ) 1) :=
  sorry

/-- The valence content of a hadron, as explicit data: which parton flavours are valence
constituents. The favoured and unfavoured combinations of the roadmap are defined through this
relation rather than through a naming convention.

Carried as a field of a structure rather than as `def ... : Prop := sorry`. An opaque `Prop`
with a `sorry` body is not data: nothing can be proved or disproved about it, and it is the
placeholder pattern this roadmap's own conventions forbid. -/
structure ValenceContent (Hadron Flavor : Type) where
  /-- Whether flavour `i` is a valence constituent of hadron `h`. -/
  isValence : Hadron → Flavor → Prop

/-! ## Layer 2: timelike evolution and the Gribov-Lipatov relation -/

/-- The harmonic sum `S_1 n`, absent from Mathlib and TauCeti and therefore defined here. The
Mellin moments of the splitting kernels are polynomials in these. -/
def harmonicSum (n : ℕ) : ℝ :=
  Finset.sum (Finset.range n) (fun k => 1 / (k + 1 : ℝ))

/-- The difference between the timelike and the spacelike splitting kernel, as a named object.
It vanishes at leading order and is non-zero at next-to-leading order; keeping it named is what
prevents the one-loop identification from being used at two loops. -/
def timelikeKernelDiff (Flavor : Type) : Type :=
  QFT.Factorization.Evolution.SplittingKernel Flavor

/-- The quantitative Gribov-Lipatov statement, specialised to a trajectory built from a
perturbative anomalous dimension: the timelike and spacelike anomalous dimensions differ by at
most the trajectory's Lipschitz constant times the anomalous dimension itself. The general form
is `ReggeTrajectory.norm_timelike_sub_spacelike_le`; what is asked for here is the construction of
the trajectory from the one-loop non-singlet kernel and the discharge of its `lip_lt_one` field. -/
theorem gribovLipatov_of_oneLoopKernel
    (T : QFT.Factorization.Evolution.ReggeTrajectory) (N : ℂ) :
    ‖T.timelikeAnomalousDim N - T.spacelikeAnomalousDim N‖
      ≤ (T.lip : ℝ) * ‖T.timelikeAnomalousDim N‖ :=
  T.norm_timelike_sub_spacelike_le N

/-- The Gribov-Lipatov relation fails beyond first order: there is a trajectory satisfying every
hypothesis whose two anomalous dimensions differ at some spin. The witness is
`affineTrajectory`. -/
theorem exists_reggeTrajectory_timelike_ne_spacelike :
    ∃ (T : QFT.Factorization.Evolution.ReggeTrajectory) (N : ℂ),
      T.timelikeAnomalousDim N ≠ T.spacelikeAnomalousDim N :=
  sorry

/-- Conservation of the momentum sum rule along the timelike evolution. The hypothesis to be
discharged is a vanishing condition on the kernel moments at the momentum index; the conclusion
is that the sum rule holds at every scale if it holds at one. -/
theorem momentumSumRule_of_timelikeEvolution {Hadron Flavor : Type} [Fintype Hadron]
    (_P : QFT.Factorization.Evolution.SplittingKernel Flavor)
    (D : ℝ → Particles.Fragmentation.Frag Hadron Flavor)
    (_hinit : MomentumSumRule (D 0)) :
    ∀ t : ℝ, MomentumSumRule (D t) :=
  sorry

/-! ## Layer 3: transverse-momentum-dependent and spin-dependent fragmentation -/

/-- A transverse-momentum-dependent fragmentation family, with the same argument shape as
`EpsilonEridani.Particles.Parton.TMD.Tmd` and an additional hadron-species index. -/
abbrev TmdFrag (Hadron Flavor : Type) : Type :=
  Hadron → Flavor → ℝ → ℝ → ℝ → ℝ → ℝ

/-- The collinear fragmentation function obtained from a transverse-momentum-dependent one by
integration against the transverse measure `2π k_T dk_T`, mirroring
`EpsilonEridani.Particles.Parton.TMD.Reduction.collinearFromTmd`. -/
def collinearFromTmdFrag {Hadron Flavor : Type}
    (D : TmdFrag Hadron Flavor) (h : Hadron) (i : Flavor) (z Q2 ζ ktMax : ℝ) : ℝ :=
  ∫ kT in Set.Icc (0 : ℝ) ktMax, (2 * Real.pi * kT) * D h i z kT Q2 ζ

/-- The first transverse-momentum-weighted moment, which is the object with a collinear meaning
for a function whose unweighted transverse integral vanishes. -/
def weightedMomentTmdFrag {Hadron Flavor : Type}
    (D : TmdFrag Hadron Flavor) (h : Hadron) (i : Flavor) (z Q2 ζ ktMax : ℝ) : ℝ :=
  ∫ kT in Set.Icc (0 : ℝ) ktMax, (2 * Real.pi * kT) * kT * D h i z kT Q2 ζ

/-- The Collins function, as a member of the leading-twist set, carrying its link direction. -/
def collins (Hadron Flavor : Type) (_link : LinkDirection) : TmdFrag Hadron Flavor :=
  sorry

/-- The unweighted transverse reduction of the Collins function vanishes: the collinear object is
the weighted moment, not the plain integral. -/
theorem collinearFromTmdFrag_collins_eq_zero {Hadron Flavor : Type}
    (link : LinkDirection) (h : Hadron) (i : Flavor) (z Q2 ζ ktMax : ℝ) :
    collinearFromTmdFrag (collins Hadron Flavor link) h i z Q2 ζ ktMax = 0 :=
  sorry

/-- **Universality of the Collins function.** The function defined with a future-pointing link
equals the one defined with a past-pointing link. This is where the contrast with the Sivers
function lives: the initial-state analogue satisfies the opposite sign relation. -/
theorem collins_universality (Hadron Flavor : Type) :
    collins Hadron Flavor LinkDirection.future = collins Hadron Flavor LinkDirection.past :=
  sorry

/-! ## Layer 5: target fragmentation -/

/-- A fracture function: the joint density of a struck parton of fraction `x` and an observed
target-region hadron of target-momentum fraction `ζ`, at scale `Q2`. -/
abbrev Fracture (Hadron Flavor : Type) : Type := Hadron → Flavor → ℝ → ℝ → ℝ → ℝ

/-- The structural assumptions of a fracture function. The support is coupled: `x ≤ 1 - ζ`, which
is what forbids a product ansatz. -/
structure FractureAssumptions {Hadron Flavor : Type} (M : Fracture Hadron Flavor) : Prop where
  /-- Vanishing outside the coupled support region. -/
  support : ∀ h i x ζ Q2, (x < 0 ∨ ζ < 0 ∨ 1 - ζ < x) → M h i x ζ Q2 = 0
  /-- Non-negativity on the support region. -/
  nonneg : ∀ h i x ζ Q2, 0 ≤ x → 0 ≤ ζ → x ≤ 1 - ζ → 0 ≤ M h i x ζ Q2

/-- The inhomogeneous source term of the fracture-function evolution equation: a convolution of a
parton density with a fragmentation function. Recording it as its own definition is the point of
the milestone — the structure of this term is the content of the statement.

Left as a target. The previous body convolved the density with a kernel and never used `D`, so
it was not the stated source term at all; a definition that silently drops one of its two
factors is worse than an honest gap. -/
def fractureSource {Hadron Flavor : Type}
    (_D : Particles.Fragmentation.Frag Hadron Flavor) (_h : Hadron) (_i : Flavor)
    (_f : ℝ → ℝ) (_C : ℝ → ℝ) (_x : ℝ) : ℝ := by
  sorry

/-! ## Layer 6: dispersive power corrections -/

/-- The leading power correction to the mean of an event shape, as a power-correction bundle at
order one in the inverse hard scale. Using the upstream bundle fixes what "leading `1/Q`
correction" means and makes the uniqueness of its coefficient an already-proved statement. -/
def leadingHadronizationCorrection (W : ℝ → ℝ)
    (_milanFactor : ℝ) : Particles.Parton.TMD.PowerCorrections.Kpc W 1 :=
  sorry

/-- The fragmentation-side prediction for the mean of an event shape: the convolution of the
collinear fragmentation functions with the observable's weight. -/
def fragmentationEventShapeMean {Hadron Flavor : Type} [Fintype Hadron] [Fintype Flavor]
    (_D : Particles.Fragmentation.Frag Hadron Flavor) (_weight : ℝ → ℝ) : ℝ → ℝ :=
  sorry

/-- The two descriptions of the same physics — the fragmentation-function convolution of Layer 0
and the dispersive power correction of Layer 6 — have the same leading power behaviour in the
inverse hard scale. No identity between their coefficients is known; that gap is named in the
roadmap and is not asserted here. -/
theorem approximatesToOrder_fragmentationEventShapeMean
    {Hadron Flavor : Type} [Fintype Hadron] [Fintype Flavor]
    (D : Particles.Fragmentation.Frag Hadron Flavor) (weight : ℝ → ℝ) (W : ℝ → ℝ)
    (K : Particles.Parton.TMD.PowerCorrections.Kpc W 1) :
    Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder
      (fragmentationEventShapeMean D weight) K.leadingPower 1 :=
  sorry

end EpsilonEridaniRoadmap.Hadronization

import EpsilonEridani

/-!
# Electroweak physics, effective operators, and connections beyond QCD: target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

The design choices the signatures below make explicit are the ones the roadmap's conventions turn
into type-level obligations. The weak mixing angle never appears as a numeral: it is a field of a
record that also carries a renormalisation-scheme tag and a scale, so two parameter records from
different schemes are different terms and cannot be silently compared. The neutral-current
couplings are functions of a fermion's weak isospin third component and electric charge, with the
physical fermions as instances rather than as a table. A cross section carries its beam helicity
as an argument, and the helicity dependence of the electroweak terms is derived from a chiral
decomposition rather than asserted, so that the vanishing of one charged-current helicity
combination is a theorem with a stated coupling hypothesis. Effective-operator coefficients live
in a quotient of a module by the equation-of-motion submodule, so a coefficient vector is visibly
a set of coordinates and only a functional on the quotient is physical. A blind direction is an
element of the kernel of a named linear map whose observable set is an argument.

No `Prop`-valued structure field stands in for an unproved statement anywhere below, and no
signature is stated in a form that is vacuous or that could not hold. Where the content of a
Layer 5 result needs objects that do not yet exist, the statement is recorded as a named
predicate with real content rather than as a theorem whose hypotheses assert nothing.
-/

namespace EpsilonEridaniRoadmap.ElectroweakAndBSM

/-! ## Layer 0: gauge structure and the electroweak couplings -/

/-- Chirality of a fermion field. -/
inductive Chirality where
  | left : Chirality
  | right : Chirality
  deriving DecidableEq, Repr

/-- The renormalisation scheme in which an electroweak parameter is defined. Carried as data so
that a mismatch between a parameter and a correction computed for it is a failure to supply an
equality hypothesis rather than a numerical discrepancy. -/
inductive Scheme where
  | msBar : Scheme
  | onShell : Scheme
  deriving DecidableEq, Repr

/-- The electroweak quantum numbers of one fermion multiplet: weak isospin third component,
hypercharge in the normalisation `Q = T³ + Y/2`, and chirality. The hypercharge normalisation is
fixed here once and is not restated elsewhere. -/
structure Multiplet where
  /-- Weak isospin third component. -/
  T3 : ℝ
  /-- Hypercharge, normalised so that `Q = T³ + Y/2`. -/
  Y : ℝ
  /-- Chirality of the multiplet. -/
  chirality : Chirality

/-- Electric charge as the eigenvalue of the unbroken generator. A definition here; the roadmap's
§0.2 asks for the theorem that it agrees with the weight computation on the gauge
representations. -/
def Multiplet.charge (m : Multiplet) : ℝ := m.T3 + m.Y / 2

/-- Electroweak parameters at a scale, in a named scheme. No definition in this file has a decimal
number on its right-hand side; a value is obtained by transporting an initial condition along the
coupling flow. -/
structure Parameters where
  /-- The renormalisation scheme. -/
  scheme : Scheme
  /-- The scale at which the parameters are defined. -/
  scale : ℝ
  /-- The squared sine of the weak mixing angle at `scale`, in `scheme`. -/
  sin2ThetaW : ℝ
  /-- The electromagnetic coupling at `scale`, in `scheme`. -/
  alphaEM : ℝ

/-- Vector neutral-current coupling of a fermion with the given quantum numbers. -/
def gV (m : Multiplet) (p : Parameters) : ℝ := m.T3 - 2 * m.charge * p.sin2ThetaW

/-- Axial neutral-current coupling of a fermion with the given quantum numbers. -/
def gA (m : Multiplet) (_p : Parameters) : ℝ := m.T3

/-- Left-handed chiral neutral-current coupling. -/
def gL (m : Multiplet) (p : Parameters) : ℝ := (gV m p + gA m p) / 2

/-- Right-handed chiral neutral-current coupling. -/
def gR (m : Multiplet) (p : Parameters) : ℝ := (gV m p - gA m p) / 2

/-- The chiral couplings reconstruct the vector coupling. -/
theorem gV_eq_gL_add_gR (m : Multiplet) (p : Parameters) : gV m p = gL m p + gR m p := by
  sorry

/-- The chiral couplings reconstruct the axial coupling. -/
theorem gA_eq_gL_sub_gR (m : Multiplet) (p : Parameters) : gA m p = gL m p - gR m p := by
  sorry

/-- Left-handed up-type quark of the first generation. -/
def upLeft : Multiplet := { T3 := 1 / 2, Y := 1 / 3, chirality := Chirality.left }

/-- Left-handed down-type quark of the first generation. -/
def downLeft : Multiplet := { T3 := -1 / 2, Y := 1 / 3, chirality := Chirality.left }

/-- Left-handed charged lepton of the first generation. -/
def electronLeft : Multiplet := { T3 := -1 / 2, Y := -1, chirality := Chirality.left }

/-- Left-handed neutrino of the first generation. -/
def neutrinoLeft : Multiplet := { T3 := 1 / 2, Y := -1, chirality := Chirality.left }

/-- The up-quark charge follows from the assignment rather than being declared. -/
theorem charge_upLeft : upLeft.charge = 2 / 3 := by sorry

/-- The neutrino is electrically neutral as a consequence of its assignment. -/
theorem charge_neutrinoLeft : neutrinoLeft.charge = 0 := by sorry

/-- The neutrino's axial neutral-current coupling does not vanish: the neutral current sees a
particle the electromagnetic current does not. -/
theorem gA_neutrinoLeft_ne_zero (p : Parameters) : gA neutrinoLeft p ≠ 0 := by sorry

/-- The neutrino's vector neutral-current coupling is its isospin component alone, because its
charge vanishes. This is the coupling the neutrino cross sections of Layer 5 are evaluated at. -/
theorem gV_neutrinoLeft (p : Parameters) : gV neutrinoLeft p = 1 / 2 := by sorry

/-- The parity-violating coupling combination conventionally called `C₁q`, derived from the
fundamental couplings rather than tabulated. -/
def C1 (q : Multiplet) (p : Parameters) : ℝ := 2 * gA electronLeft p * gV q p

/-- The parity-violating coupling combination conventionally called `C₂q`. -/
def C2 (q : Multiplet) (p : Parameters) : ℝ := 2 * gV electronLeft p * gA q p

/-- The combination measured by the deuteron asymmetry, as a function of the mixing angle alone.
The roadmap's Convention 5 makes this a theorem about `C1` rather than a definition of it. -/
theorem twoC1u_sub_C1d (p : Parameters) :
    2 * C1 upLeft p - C1 downLeft p = -(3 / 2) + (10 / 3) * p.sin2ThetaW := by
  sorry

/-- The quark mixing matrix, as an element of the unitary submonoid of the three-by-three complex
matrices. Unitarity is a property of the ambient type, not a field of a structure, so every
unitarity relation used downstream is a theorem about that type. -/
abbrev MixingMatrix : Type := Matrix.unitaryGroup (Fin 3) ℂ

/-- Row unitarity of the mixing matrix, as a relation among the moduli of its entries. -/
theorem mixing_row_sum (V : MixingMatrix) (i : Fin 3) :
    ∑ j : Fin 3, ‖(V.val i j)‖ ^ 2 = 1 := by
  sorry

/-- The one-loop flow field for the electroweak couplings, in the logarithm of the scale, in a
named scheme. The gauge-boson and fermion-loop coefficients are derived from the representation
content; the scalar-loop contribution is an input, labelled a hypothesis in the roadmap and
deliberately not an acceptance criterion. -/
def couplingFlow (_s : Scheme) (_c : Fin 3 → ℝ) : Fin 3 → ℝ := by sorry

/-- Well-posedness of the coupling flow on an interval where the couplings remain in the domain on
which the one-loop truncation is stated to apply. Existence, uniqueness and global extension come
from the upstream ordinary-differential-equation theory and are not reproved. -/
theorem couplingFlow_unique (s : Scheme) (c₀ : Fin 3 → ℝ) (T : ℝ) :
    ∃! f : ℝ → Fin 3 → ℝ,
      (∀ t ∈ Set.Icc (0 : ℝ) T, HasDerivAt f (couplingFlow s (f t)) t) ∧ f 0 = c₀ := by
  sorry

/-- Transporting parameters from their own scale to a target scale along the flow. A measurement at
one scale constrains the parameter at another only through this map. -/
def transport (_s : Scheme) (_p : Parameters) (_targetScale : ℝ) : Parameters := by sorry

/-- Stability of the transported mixing angle in its initial condition: an uncertainty at one scale
becomes a controlled uncertainty at another, with a constant depending on the flow field and the
interval. This is the precise content of "constrains it at another scale only through the
running". -/
theorem sin2ThetaW_transport_stability (s : Scheme) (p q : Parameters) (targetScale : ℝ)
    (hp : p.scheme = s) (hq : q.scheme = s) (hscale : p.scale = q.scale) :
    ∃ L : ℝ, 0 ≤ L ∧
      |(transport s p targetScale).sin2ThetaW - (transport s q targetScale).sin2ThetaW|
        ≤ L * |p.sin2ThetaW - q.sin2ThetaW| := by
  sorry

/-! ## Layer 1: electroweak cross sections and their helicity structure -/

/-- Beam helicity state, an argument of every cross-section function so that the sign convention of
an asymmetry is visible in its definition. -/
inductive Helicity where
  | plus : Helicity
  | minus : Helicity
  deriving DecidableEq, Repr

/-- The lepton chirality a beam helicity state probes, for a massless lepton. -/
def Helicity.chirality : Helicity → Chirality
  | Helicity.plus => Chirality.right
  | Helicity.minus => Chirality.left

/-- A deep-inelastic kinematic point, in the invariants of the upstream kinematics module. -/
structure KinPoint where
  /-- Momentum-fraction variable. -/
  x : ℝ
  /-- Momentum transfer squared. -/
  Q2 : ℝ
  /-- Inelasticity. -/
  y : ℝ

/-- Hadronic and kinematic input to an electroweak cross section: the structure functions supplied
by `InclusiveStructureFunctions`, the propagator factors, and the kinematic coefficients with
which each structure function enters. All are opaque here; this roadmap contracts against them and
does not define them. -/
structure HadronicInput where
  /-- Transverse structure function. -/
  F1 : KinPoint → ℝ
  /-- Longitudinal-plus-transverse structure function. -/
  F2 : KinPoint → ℝ
  /-- Parity-odd structure function, produced by electroweak exchange alone. -/
  F3 : KinPoint → ℝ
  /-- Photon propagator factor. -/
  propGamma : KinPoint → ℝ
  /-- `Z` propagator factor. -/
  propZ : KinPoint → ℝ
  /-- Kinematic coefficient of the parity-even structure functions. -/
  kEven : KinPoint → ℝ
  /-- Kinematic coefficient of the parity-odd structure function. -/
  kOdd : KinPoint → ℝ

/-- The neutral-current cross section, separated into pure-photon, interference and pure-`Z` terms
by propagator and coupling structure rather than by size. -/
structure NeutralCurrent where
  /-- Pure one-photon-exchange term. -/
  photon : KinPoint → Helicity → ℝ
  /-- Photon-`Z` interference term. -/
  interference : KinPoint → Helicity → ℝ
  /-- Pure `Z`-exchange term. -/
  zBoson : KinPoint → Helicity → ℝ

/-- The total neutral-current cross section. -/
def NeutralCurrent.total (nc : NeutralCurrent) (k : KinPoint) (h : Helicity) : ℝ :=
  nc.photon k h + nc.interference k h + nc.zBoson k h

/-- The sign a beam helicity contributes to a parity-odd term. -/
def Helicity.sign : Helicity → ℝ
  | Helicity.plus => 1
  | Helicity.minus => -1

/-- The neutral-current cross section built from the Layer 0 couplings and a hadronic input. The
helicity dependence is derived from the coupling structure here, which is what makes the parity
statements below theorems rather than assertions. -/
def ncOfCouplings (q : Multiplet) (p : Parameters) (H : HadronicInput) : NeutralCurrent where
  photon := fun k _ => H.propGamma k * H.kEven k * H.F1 k
  interference := fun k h =>
    H.propZ k * (gV electronLeft p * gV q p * H.kEven k * H.F2 k
      + h.sign * gA electronLeft p * gV q p * H.kOdd k * H.F3 k)
  zBoson := fun k h =>
    H.propZ k * H.propZ k * (gV electronLeft p * gV q p * H.kEven k * H.F2 k
      + h.sign * gA electronLeft p * gA q p * H.kOdd k * H.F3 k)

/-- The pure-photon term does not depend on the beam helicity. This is the structural reason the
parity-violating asymmetry has no one-photon-exchange contribution. -/
theorem photon_helicity_even (q : Multiplet) (p : Parameters) (H : HadronicInput) (k : KinPoint) :
    (ncOfCouplings q p H).photon k Helicity.plus = (ncOfCouplings q p H).photon k Helicity.minus := by
  sorry

/-- The helicity difference of the interference term is carried entirely by the parity-odd
structure function, with the electron's axial coupling as its coefficient. -/
theorem interference_helicity_difference (q : Multiplet) (p : Parameters) (H : HadronicInput)
    (k : KinPoint) :
    (ncOfCouplings q p H).interference k Helicity.plus
        - (ncOfCouplings q p H).interference k Helicity.minus
      = 2 * H.propZ k * gA electronLeft p * gV q p * H.kOdd k * H.F3 k := by
  sorry

/-- A cross section decomposed over lepton and quark chirality, with the chiral coupling weights
separated from the hadronic parts. The charged-current helicity theorem is a statement about the
weights, which is where the chiral projection of the interaction enters. -/
structure ChiralCrossSection where
  /-- Hadronic part for a given lepton and quark chirality. -/
  part : Chirality → Chirality → KinPoint → ℝ
  /-- Chiral coupling weight for a given lepton and quark chirality. -/
  weight : Chirality → Chirality → ℝ

/-- The cross section at a kinematic point for a beam helicity, summing over quark chirality. -/
def ChiralCrossSection.sigma (D : ChiralCrossSection) (k : KinPoint) (h : Helicity) : ℝ :=
  D.weight h.chirality Chirality.left * D.part h.chirality Chirality.left k
    + D.weight h.chirality Chirality.right * D.part h.chirality Chirality.right k

/-- For a charged current with no right-handed lepton coupling, the cross section for the
corresponding beam helicity vanishes identically. The coupling hypothesis is what the chiral
projection of the Standard Model charged current supplies, and the roadmap's §1.4 asks for that
derivation; the lepton mass is neglected, which is where `Helicity.chirality` is used. -/
theorem chargedCurrent_one_helicity_zero (D : ChiralCrossSection) (k : KinPoint)
    (hW : ∀ cq, D.weight Chirality.right cq = 0) :
    D.sigma k Helicity.plus = 0 := by
  sorry

/-! ## Layer 2: parity-violating asymmetries -/

/-- The single-spin parity-violating asymmetry, with the roadmap's Convention 4: the beam is
polarised, the target is not, and the numerator is the difference of the two beam-helicity cross
sections in the stated order. -/
def asymmetryPV (nc : NeutralCurrent) (k : KinPoint) : ℝ :=
  (nc.total k Helicity.plus - nc.total k Helicity.minus) /
    (nc.total k Helicity.plus + nc.total k Helicity.minus)

/-- Given a helicity-even photon term, the pure-photon contribution cancels from the numerator of
the asymmetry exactly. The hypothesis is discharged for `ncOfCouplings` by
`photon_helicity_even`. -/
theorem asymmetryPV_numerator (nc : NeutralCurrent) (k : KinPoint)
    (hphoton : nc.photon k Helicity.plus = nc.photon k Helicity.minus) :
    nc.total k Helicity.plus - nc.total k Helicity.minus
      = (nc.interference k Helicity.plus - nc.interference k Helicity.minus)
        + (nc.zBoson k Helicity.plus - nc.zBoson k Helicity.minus) := by
  sorry

/-- Rescaling all three terms of the cross section leaves the asymmetry unchanged: the asymmetry is
independent of the luminosity normalisation, as a theorem about its definition. -/
theorem asymmetryPV_scale_invariant (nc : NeutralCurrent) (k : KinPoint) (c : ℝ) (hc : c ≠ 0) :
    asymmetryPV
      { photon := fun k' h => c * nc.photon k' h,
        interference := fun k' h => c * nc.interference k' h,
        zBoson := fun k' h => c * nc.zBoson k' h } k = asymmetryPV nc k := by
  sorry

/-- The deuteron asymmetry as the reduced coupling-and-kinematics function plus exhibited
remainders. The remainders are named quantities, not terms that have been dropped: the sea-quark
and strange residual is this roadmap's, and the nuclear correction slot is `LightNuclei`'s. -/
structure DeuteronAsymmetry where
  /-- The coupling-and-kinematics function that survives the cancellation. -/
  reduced : KinPoint → Parameters → ℝ
  /-- Residual dependence on the sea-quark and strange density ratios. -/
  remainder : KinPoint → ℝ
  /-- Nuclear correction slot, owned by `LightNuclei`. -/
  nuclear : KinPoint → ℝ

/-- The full deuteron asymmetry from its parts. -/
def DeuteronAsymmetry.value (d : DeuteronAsymmetry) (k : KinPoint) (p : Parameters) : ℝ :=
  d.reduced k p + d.remainder k + d.nuclear k

/-- With the sea-quark residual and the nuclear correction vanishing, the deuteron asymmetry is a
function of the couplings and the kinematics alone. This is what makes the deuteron the target of
choice for a coupling measurement, stated with its hypotheses rather than asserted. -/
theorem deuteron_reduction (d : DeuteronAsymmetry) (k : KinPoint) (p : Parameters)
    (hsea : d.remainder k = 0) (hnuc : d.nuclear k = 0) :
    d.value k p = d.reduced k p := by
  sorry

/-! ## Layer 3: the dimension-six operator basis -/

/-- An operator basis for a sector of the dimension-six effective Lagrangian: the size of the naive
enumeration together with the submodule of relations generated by the equations of motion. A
coefficient vector is meaningless without this object, which is why it is an argument of the
coefficient type. -/
structure OperatorBasis where
  /-- Number of operators in the naive enumeration. -/
  card : ℕ
  /-- Submodule generated by the equation-of-motion relations. -/
  relations : Submodule ℝ (Fin card → ℝ)

/-- The physical coefficient space: naive coefficients modulo the equation-of-motion relations. Two
coefficient vectors differing by a relation are the same point here, which is the precise content
of operator redundancy. -/
abbrev OperatorBasis.coeffs (B : OperatorBasis) : Type := (Fin B.card → ℝ) ⧸ B.relations

/-- Whether a prediction retains only the interference of a higher-dimension operator with the
Standard Model amplitude, or also its square. Two predictions with different truncation records
are different objects and are not interchangeable. -/
inductive Truncation where
  | interferenceOnly : Truncation
  | withSquare : Truncation
  deriving DecidableEq, Repr

/-! ## Layer 4: constraint geometry and blind directions -/

/-- The first-order map from physical coefficients to the shifts in a finite set of observables. The
observable set is part of the data: blindness is a property of a measurement, not of nature. -/
structure ConstraintMap (B : OperatorBasis) (nObs : ℕ) where
  /-- Kinematic point at which each observable is evaluated. -/
  points : Fin nObs → KinPoint
  /-- Linear map from physical coefficients to observable shifts. -/
  map : B.coeffs →ₗ[ℝ] (Fin nObs → ℝ)

/-- A blind direction of a constraint map is a non-zero element of its kernel. -/
def ConstraintMap.Blind {B : OperatorBasis} {n : ℕ} (C : ConstraintMap B n) (v : B.coeffs) : Prop :=
  v ≠ 0 ∧ v ∈ LinearMap.ker C.map

/-- Enlarging the observable set can only shrink the kernel. This keeps a blindness statement
honest: a blind direction may be lifted by adding observables, which is why the observable set is
an argument of `ConstraintMap.Blind`. -/
theorem blind_antitone {B : OperatorBasis} {n m : ℕ}
    (C : ConstraintMap B n) (D : ConstraintMap B (n + m))
    (hres : ∀ v i, D.map v (Fin.castAdd m i) = C.map v i) :
    LinearMap.ker D.map ≤ LinearMap.ker C.map := by
  sorry

/-- The quadratic prediction on physical coefficient space, for the truncation that keeps the square
of a dimension-six insertion. -/
structure QuadraticMap (B : OperatorBasis) where
  /-- The quadratic form on physical coefficient space. -/
  form : B.coeffs → B.coeffs → ℝ

/-- A direction blind to the quadratic prediction lies in the radical of its form. -/
def QuadraticMap.Radical {B : OperatorBasis} (Qf : QuadraticMap B) (v : B.coeffs) : Prop :=
  ∀ w, Qf.form v w = 0

/-- The two truncations have different blind directions: there is a constraint map, a quadratic
form and a direction blind to first order that is not in the radical of the form. This is the formal
content of keeping `Truncation` as explicit data. -/
theorem exists_blind_not_radical :
    ∃ (B : OperatorBasis) (n : ℕ) (C : ConstraintMap B n) (Qf : QuadraticMap B) (v : B.coeffs),
      C.Blind v ∧ ¬ Qf.Radical v := by
  sorry

/-- A right-right coupling added to a charged current that had none: the weight at
`(lepton, quark) = (right, right)`. Both chiralities are right-handed, which is what makes the
null test of the next theorem a test of the Standard Model's left-handed charged current. -/
def withRightHanded (D : ChiralCrossSection) (c : ℝ) : ChiralCrossSection where
  part := D.part
  weight := fun cl cq =>
    match cl, cq with
    | Chirality.right, Chirality.right => c
    | _, _ => D.weight cl cq

/-- The right-handed operator lifts the null test: the beam-helicity cross section that vanishes
identically in the Standard Model is non-zero at first order in the new coefficient. The
hypotheses of `chargedCurrent_one_helicity_zero` are exactly what makes the Standard Model
prediction exactly zero, so the observable is a genuine null test. -/
theorem rightHanded_lifts_null_test (D : ChiralCrossSection) (k : KinPoint) (c : ℝ) (hc : c ≠ 0)
    (hW : ∀ cq, D.weight Chirality.right cq = 0)
    (hpart : D.part Chirality.right Chirality.right k ≠ 0) :
    (withRightHanded D c).sigma k Helicity.plus ≠ 0 := by
  sorry

/-! ## Layer 5: connections to neighbouring fields -/

/-- The record of radiative and electroweak corrections a precision asymmetry requires. Each field
names a correction; the corrections themselves are supplied by `RadiativeCorrections`. -/
structure CorrectionRecord where
  /-- The scheme in which the corrections were computed. -/
  scheme : Scheme
  /-- The gamma-`Z` box contribution to the effective couplings. -/
  boxGammaZ : KinPoint → ℝ
  /-- The QED radiative tail in the reconstructed kinematics. -/
  qedTail : KinPoint → ℝ
  /-- Electroweak vertex and propagator corrections defining the scheme of the mixing angle. -/
  vertexPropagator : KinPoint → ℝ

/-- A correction record is usable with a parameter record only when their schemes agree. Making
this an equality hypothesis rather than an editorial convention is the point of §5.6: a scheme
mismatch becomes a failure to supply a hypothesis. -/
def CorrectionRecord.Compatible (c : CorrectionRecord) (p : Parameters) : Prop :=
  c.scheme = p.scheme

/-- The corrected asymmetry, definable only relative to a compatible correction record. -/
def correctedAsymmetry (nc : NeutralCurrent) (c : CorrectionRecord) (p : Parameters)
    (k : KinPoint) (_h : c.Compatible p) : ℝ :=
  asymmetryPV nc k + c.boxGammaZ k + c.qedTail k + c.vertexPropagator k

/-- A region carries all but `ε` of a cross-section weight, in the pointwise form available without
measure-theoretic input. The roadmap's §5.2 asks for the integral form; this predicate names the
statement so that the sensitivity claim of the ultra-high-energy extrapolation is a bound rather
than a picture. -/
def CarriesAllBut (w : KinPoint → ℝ) (region : Set KinPoint) (ε : ℝ) : Prop :=
  0 ≤ ε ∧ ∀ k ∉ region, |w k| ≤ ε

/-- The universality statement, as a predicate with its hypotheses as arguments: given
factorisation for the lepton-nucleon and hadron-hadron processes in a common scheme, the density
appearing in each is the same object, so a hadron-hadron cross section is the stated functional of
the density extracted from lepton-nucleon data. Naming it as a predicate rather than a theorem is
deliberate: per the roadmap's Convention 14 it is a hypothesis with a domain, and it is not a
milestone this roadmap can discharge alone. -/
def SameDensityUsable (densityLN densityHH : ℝ → ℝ → ℝ) (domain : Set (ℝ × ℝ)) : Prop :=
  ∀ z ∈ domain, densityHH z.1 z.2 = densityLN z.1 z.2

/-- The transverse-momentum sign-reversal statement, as a predicate on the two extracted functions.
The function definitions and their rapidity evolution belong to
`TransverseMomentumDistributions`; what is named here is the relation between the two processes,
so that the cross-field test exists in one place as a falsifiable equality. -/
def SignReversal (fromSIDIS fromAnnihilation : KinPoint → ℝ) : Prop :=
  ∀ k, fromAnnihilation k = -(fromSIDIS k)

end EpsilonEridaniRoadmap.ElectroweakAndBSM

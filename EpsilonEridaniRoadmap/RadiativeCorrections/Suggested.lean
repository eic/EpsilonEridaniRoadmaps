import EpsilonEridani

/-!
# QED radiative corrections: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results in
any layer.

Three design choices are made explicit by the signatures below.

First, true and reconstructed invariants are *different types*. `TrueInvariants` carries the
invariants of the hard scattering and `Reconstructed` carries the invariants computed from a
measurement; there is no coercion between them, and every passage from one to the other is a named
map. The commonest error in this subject is a correction derived at fixed true invariants and
applied at fixed reconstructed ones, and the type distinction makes that error a type error.

Second, the integral operators are *abstract*. The radiative correction is an integral operator
with a distributional kernel, and the signatures here deliberately carry the operator rather than
the integral, so that the statements of Layers 2 and 3 do not depend on a particular integration
API. Concretely, a `CorrectionOperator` carries only the map on functions; its bounds are separate
predicates rather than fields, so that a statement may assume exactly the bound it needs. The
kernel appears only where its pointwise values are the subject. Norm hypotheses are expressed as
explicit uniform bounds rather than through a normed-space instance, for the same reason.

Third, no `Prop`-valued structure field carries an unproved obligation. Side conditions such as
admissibility of a kinematic point, nonnegativity of a kernel, or a contraction bound on an
operator are separate predicates, stated as hypotheses of the theorems that need them. A structure
field with a placeholder witness would assert nothing while looking like a hypothesis.

Every unproved statement is `sorry`, and the roadmap says in prose which of them are theorems to
be proved and which are hypotheses or open questions. In particular `peaking_error` and
`elastic_kernel_dimension` below are open questions, not milestones.
-/

namespace EpsilonEridaniRoadmap.RadiativeCorrections

noncomputable section

/-! ## Layer 0: first-order corrections and the infrared cancellation -/

/-- Invariants of the hard scattering: the Bjorken variable and the photon virtuality. -/
structure TrueInvariants where
  x : ℝ
  Q2 : ℝ

/-- Invariants computed from a measurement by a stated reconstruction method. There is
deliberately no map to or from `TrueInvariants`; see `shift`. -/
structure Reconstructed where
  x : ℝ
  Q2 : ℝ

/-- Admissibility of a hard-scattering point: inside the deep-inelastic region. -/
def TrueInvariants.Admissible (t : TrueInvariants) : Prop :=
  0 < t.x ∧ t.x ≤ 1 ∧ 0 < t.Q2

/-- Admissibility of a reconstructed point. -/
def Reconstructed.Admissible (r : Reconstructed) : Prop :=
  0 < r.x ∧ r.x ≤ 1 ∧ 0 < r.Q2

/-- The point lies on the elastic line, where the elastic radiative tail accumulates. -/
def TrueInvariants.OnElasticLine (t : TrueInvariants) : Prop := t.x = 1

/-- A Born cross section is data for this roadmap: a nonnegative function on the hard-scattering
invariants, with no parton content assumed. -/
abbrev BornCrossSection : Type := TrueInvariants → ℝ

/-- An observed cross section is a function of the reconstructed invariants. -/
abbrev ObservedCrossSection : Type := Reconstructed → ℝ

/-- The contributions to the first-order correction. `emissionInterference` belongs to neither the
leptonic nor the hadronic set and is charge-odd; see `chargeOdd_decomposition`. -/
inductive FirstOrderContribution
  | vacuumPolarisation
  | leptonVertex
  | leptonSelfEnergy
  | leptonEmission
  | hadronEmission
  | emissionInterference

/-- An infrared regulator: a positive photon mass, together with the soft-photon cutoff which
separates the soft region from the hard-emission integral. Both are explicit data, and no
definition in the roadmap hides either of them. -/
structure SoftRegulator where
  photonMass : ℝ
  softCutoff : ℝ

/-- The virtual first-order correction at a given regulator. Divergent as the photon mass tends to
zero; see `ir_cancellation`. -/
def virtualCorrection (_reg : SoftRegulator) (_t : TrueInvariants) : ℝ := sorry

/-- The soft real-emission first-order correction at a given regulator. -/
def softRealCorrection (_reg : SoftRegulator) (_t : TrueInvariants) : ℝ := sorry

/-- Infrared finiteness: the sum of the virtual and soft-real corrections has a limit as the
photon mass tends to zero, at fixed soft cutoff. Stated in epsilon-delta form so that the
signature does not depend on a choice of filter vocabulary. -/
theorem ir_cancellation (t : TrueInvariants) (ω₀ : ℝ) (hω : 0 < ω₀)
    (hadm : t.Admissible) :
    ∃ L : ℝ, ∀ ε : ℝ, 0 < ε → ∃ δ : ℝ, 0 < δ ∧ ∀ lam : ℝ, 0 < lam → lam < δ →
      |virtualCorrection ⟨lam, ω₀⟩ t + softRealCorrection ⟨lam, ω₀⟩ t - L| ≤ ε := by
  sorry

/-- The eikonal current of a set of charged legs, contracted with itself; the infrared exponent is
built from this. Charges and momenta are supplied by the caller. -/
def eikonalExponent (_charges : List ℝ) (_reg : SoftRegulator) : ℝ := sorry

/-- Yennie-Frautschi-Suura: the infrared exponent is independent of the photon mass, so the
exponentiated form is infrared finite before the residual is computed. -/
theorem yfs_ir_finite (charges : List ℝ) (ω₀ lam₁ lam₂ : ℝ)
    (hω : 0 < ω₀) (h₁ : 0 < lam₁) (h₂ : 0 < lam₂) :
    eikonalExponent charges ⟨lam₁, ω₀⟩ = eikonalExponent charges ⟨lam₂, ω₀⟩ := by
  sorry

/-! ## Layer 1: shifted kinematics and the radiative tail -/

/-- The reconstruction methods. Each is a different function of a different subset of the measured
momenta; `doubleAngle` additionally needs the beam configuration, which is why the shift theorems
are stated per method. -/
inductive ReconstructionMethod
  | electron
  | hadronic
  | mixed
  | sigma
  | doubleAngle

/-- Whether the photon was emitted from the incoming or the outgoing lepton line. This is a label
on the amplitude, not a property of the photon momentum. -/
inductive Emission
  | initialState
  | finalState

/-- A radiative configuration: the photon energy fraction of the emitting lepton, the cosine of
its angle to that lepton, and which line it came from. -/
structure RadiativeConfig where
  z : ℝ
  cosθ : ℝ
  line : Emission

/-- The configuration is exactly collinear with the emitting lepton. -/
def RadiativeConfig.Collinear (c : RadiativeConfig) : Prop := c.cosθ = 1

/-- The invariants a given method reconstructs from a radiative event with given true invariants
and photon configuration. -/
def reconstruct (_m : ReconstructionMethod) (_c : RadiativeConfig) (_t : TrueInvariants) :
    Reconstructed := sorry

/-- An observable is collinear safe if its measurement function does not distinguish a lepton from
the same lepton accompanied by an exactly collinear photon. This is data about the observable, not
a property assumed of all observables. -/
structure Observable where
  weight : Reconstructed → ℝ

/-- Collinear safety of an observable: its weight does not distinguish a reconstructed point
obtained with an exactly collinear photon from the one obtained without it. Stated as a predicate
so that no structure field carries an undischarged obligation. -/
def Observable.CollinearSafe (O : Observable) (m : ReconstructionMethod) : Prop :=
  ∀ (c : RadiativeConfig) (t : TrueInvariants), c.Collinear →
    O.weight (reconstruct m c t) = O.weight (reconstruct m ⟨0, c.cosθ, c.line⟩ t)

/-- The shift between reconstructed and true invariants, componentwise. -/
def shift (m : ReconstructionMethod) (c : RadiativeConfig) (t : TrueInvariants) : ℝ × ℝ :=
  ((reconstruct m c t).x - t.x, (reconstruct m c t).Q2 - t.Q2)

/-- At vanishing photon energy every method returns the true invariants. -/
theorem shift_eq_zero_of_no_emission (m : ReconstructionMethod) (c : RadiativeConfig)
    (t : TrueInvariants) (hz : c.z = 0) : shift m c t = (0, 0) := by
  sorry

/-- The Sigma method is exact for collinear initial-state radiation: this is the decisive
statement of Layer 1, and the reason the method exists. -/
theorem shift_sigma_collinear_isr (c : RadiativeConfig) (t : TrueInvariants)
    (hcol : c.Collinear) (hline : c.line = Emission.initialState) :
    shift ReconstructionMethod.sigma c t = (0, 0) := by
  sorry

/-- The electron method is not: for collinear initial-state radiation of energy fraction `z`
strictly between zero and one, the reconstructed virtuality differs from the true one. -/
theorem shift_electron_collinear_isr (c : RadiativeConfig) (t : TrueInvariants)
    (hadm : t.Admissible) (hcol : c.Collinear) (hline : c.line = Emission.initialState)
    (hz : 0 < c.z) (hz1 : c.z < 1) :
    (reconstruct ReconstructionMethod.electron c t).Q2 ≠ t.Q2 := by
  sorry

/-- The set of true invariants contributing to a given reconstructed point: the radiative tail. -/
def tailSupport (m : ReconstructionMethod) (r : Reconstructed) : Set TrueInvariants :=
  {t | ∃ c : RadiativeConfig, reconstruct m c t = r}

/-- For the electron method the tail reaches the elastic line above a threshold in inelasticity,
so the observed cross section receives an elastic contribution in a deep-inelastic bin. -/
theorem tailSupport_reaches_elastic (r : Reconstructed) (hadm : r.Admissible) :
    ∃ y₀ : ℝ, 0 < y₀ ∧ y₀ < 1 ∧
      ∃ t ∈ tailSupport ReconstructionMethod.electron r, t.OnElasticLine := by
  sorry

/-- The peaking approximation replaces the photon angular distribution by two collinear
contributions. This is a definition; its error is `peaking_error` below, which is open. -/
def peakingApproximant (_m : ReconstructionMethod) (_leptonMass : ℝ)
    (_σ : BornCrossSection) : ObservedCrossSection := sorry

/-- Uniform bound on a function: the norm vocabulary used throughout, kept elementary on purpose. -/
def UnifBound (f : Reconstructed → ℝ) (C : ℝ) : Prop := ∀ r : Reconstructed, |f r| ≤ C

/-! ## Layer 2: the radiator kernel and the structure-function method -/

/-- The hard part of the radiator kernel, as a pointwise function. The diagonal and elastic parts
are distributional and are carried by the operator, not by this function. -/
structure RadiatorKernel where
  method : ReconstructionMethod
  hard : Reconstructed → TrueInvariants → ℝ

/-- Nonnegativity of the hard kernel, as a predicate rather than a structure field. -/
def RadiatorKernel.Nonneg (K : RadiatorKernel) : Prop :=
  ∀ r t, 0 ≤ K.hard r t

/-- The kernel is supported on the radiative tail of Layer 1, as a predicate rather than a
theorem about an arbitrary kernel. `RadiatorKernel` constrains only `hard`, so a freely chosen
`hard` is a counterexample to the unconditional statement; the property belongs to the kernels
Layer 3.2 constructs, and is discharged there alongside the construction. -/
def RadiatorKernel.SupportedOnTail (K : RadiatorKernel) : Prop :=
  ∀ r t, K.hard r t ≠ 0 → t ∈ tailSupport K.method r

/-- The support property is what the structure-function method of Layer 3.2 must establish for
the kernel it builds. -/
theorem kernel_support (K : RadiatorKernel) (hK : K.SupportedOnTail)
    (r : Reconstructed) (t : TrueInvariants) (h : K.hard r t ≠ 0) :
    t ∈ tailSupport K.method r :=
  hK r t h

/-- The correction operator, carried abstractly: a map from Born cross sections to observed cross
sections. The integral is not exposed, so the statements below do not depend on an integration
API. -/
structure CorrectionOperator where
  act : BornCrossSection → ObservedCrossSection

/-- The perturbation `C = R - I`, expressed by its action on a Born cross section restricted to a
region where the two types are identified by a stated embedding `ι`. -/
def perturbation (R : CorrectionOperator) (ι : Reconstructed → TrueInvariants)
    (σ : BornCrossSection) : ObservedCrossSection :=
  fun r => R.act σ r - σ (ι r)

/-- A uniform operator bound on the perturbation, with constant `c`: the hypothesis that drives
every result in Layer 3. -/
def PerturbationBound (R : CorrectionOperator) (ι : Reconstructed → TrueInvariants) (c : ℝ) :
    Prop :=
  ∀ (σ : BornCrossSection) (M : ℝ), (∀ t, |σ t| ≤ M) → UnifBound (perturbation R ι σ) (c * M)

/-- The perturbation is of order the fine-structure constant times the QED logarithm, away from
the elastic line. The constant is existential: the roadmap does not claim a numerical value. -/
theorem perturbation_bound_alpha (R : CorrectionOperator) (ι : Reconstructed → TrueInvariants)
    (α L : ℝ) (hα : 0 < α) (hL : 0 ≤ L) :
    ∃ c : ℝ, 0 < c ∧ PerturbationBound R ι (c * α * (1 + L)) := by
  sorry

/-- The QED lepton density at momentum fraction `z` and evolution variable `t`. -/
def leptonDensity (_z _t : ℝ) : ℝ := sorry

/-- The photon density in the lepton. `Photoproduction` consumes this object; this roadmap stops
at the density and says nothing about the photon-hadron interaction. -/
def photonDensity (_z _t : ℝ) : ℝ := sorry

/-- The first moment functional on the momentum-fraction interval. It is opaque here so that the
moment statements below have content without committing to an integration API. -/
def firstMoment (_f : ℝ → ℝ) : ℝ := sorry

/-- Momentum conservation along the QED evolution: the first moment of the lepton and photon
densities together is independent of the evolution variable. -/
theorem qedEvolution_momentum_conservation (t₁ t₂ : ℝ) (ht₁ : 0 ≤ t₁) (ht₂ : 0 ≤ t₂) :
    firstMoment (fun z => z * (leptonDensity z t₁ + photonDensity z t₁))
      = firstMoment (fun z => z * (leptonDensity z t₂ + photonDensity z t₂)) := by
  sorry

/-- The exponentiated radiator near the soft endpoint, with exponent `β`. -/
def exponentiatedRadiator (_β _z : ℝ) : ℝ := sorry

/-- The exponentiated radiator is nonnegative on the open unit interval: it is a density, and
this is the part of the normalisation convention that can be stated without an integral. -/
theorem exponentiatedRadiator_nonneg (β z : ℝ) (hβ : 0 < β) (hz : 0 < z) (hz1 : z < 1) :
    0 ≤ exponentiatedRadiator β z := by
  sorry

/-! ## Layer 3: the unfolding inverse problem -/

/-- The additive iteration used in practice: correct the data with the current estimate and
re-extract. -/
def additiveIteration (C : ObservedCrossSection → ObservedCrossSection)
    (obs : ObservedCrossSection) : ℕ → ObservedCrossSection
  | 0 => obs
  | n + 1 => fun r => obs r - C (additiveIteration C obs n) r

/-- The iteration is a contraction when the perturbation is small, with a geometric bound on
successive differences. This is the convergence result the roadmap exists to supply, and its
hypothesis is `perturbation_bound_alpha`. -/
theorem additiveIteration_geometric (C : ObservedCrossSection → ObservedCrossSection)
    (obs : ObservedCrossSection) (c M : ℝ) (hc : 0 < c) (hc1 : c < 1)
    (hM : UnifBound obs M)
    (hC : ∀ (f : ObservedCrossSection) (K : ℝ), UnifBound f K → UnifBound (C f) (c * K)) :
    ∀ n : ℕ, UnifBound
      (fun r => additiveIteration C obs (n + 1) r - additiveIteration C obs n r)
      (c ^ (n + 1) * M) := by
  sorry

/-- The iteration has a unique fixed point under the same hypothesis, and it is the solution of
the unfolding problem. -/
theorem additiveIteration_fixedPoint (C : ObservedCrossSection → ObservedCrossSection)
    (obs : ObservedCrossSection) (c : ℝ) (hc : 0 < c) (hc1 : c < 1)
    (hC : ∀ (f : ObservedCrossSection) (K : ℝ), UnifBound f K → UnifBound (C f) (c * K)) :
    ∃ σ : ObservedCrossSection, (∀ r, σ r = obs r - C σ r) ∧
      ∀ τ : ObservedCrossSection, (∀ r, τ r = obs r - C τ r) → ∀ r, τ r = σ r := by
  sorry

/-- The bin-by-bin variant, in which the correction is applied as a pointwise factor. -/
def binByBinIteration (factor : ObservedCrossSection → Reconstructed → ℝ)
    (obs : ObservedCrossSection) : ℕ → ObservedCrossSection
  | 0 => obs
  | n + 1 => fun r => obs r / factor (binByBinIteration factor obs n) r

/-- The bin-by-bin fixed point differs from the solution of the unfolding problem unless the
correction operator acts as multiplication. The lower bound is the oscillation of the Born cross
section across the tail support; this signature records only that the difference is nonzero. -/
theorem binByBin_fixedPoint_biased :
    ∃ (factor : ObservedCrossSection → Reconstructed → ℝ) (C : ObservedCrossSection →
      ObservedCrossSection) (obs σ τ : ObservedCrossSection),
      (∀ r, σ r = obs r - C σ r) ∧ (∀ r, τ r = obs r / factor τ r) ∧ ∃ r, τ r ≠ σ r := by
  sorry

/-- Regularised inversion. Tikhonov regularisation is absent from Mathlib and TauCeti, so the
regularised inverse is built here: this signature records its existence and its uniform bound,
which is what the rate theorem of the roadmap rests on. -/
theorem regularisedInverse_exists (R : CorrectionOperator) (μ : ℝ) (hμ : 0 < μ) :
    ∃ Rinv : ObservedCrossSection → BornCrossSection,
      ∃ c : ℝ, 0 < c ∧ ∀ (obs : ObservedCrossSection) (M : ℝ), UnifBound obs M →
        ∀ t : TrueInvariants, |Rinv obs t| ≤ c * M := by
  sorry

/-! ## Layer 4: beyond first order and beyond QED -/

/-- A choice of how to split the photon-Z box between the QED and the weak corrections, together
with the renormalisation scheme for the electroweak parameters. It is explicit data because the
split is not canonical. -/
structure SeparationScheme where
  boxSplit : ℝ
  parameterScheme : ℕ

/-- The QED part of the one-loop correction in a given scheme. -/
def qedPart (_s : SeparationScheme) (_r : Reconstructed) : ℝ := sorry

/-- The weak remainder in a given scheme. -/
def weakPart (_s : SeparationScheme) (_r : Reconstructed) : ℝ := sorry

/-- Each part depends on the scheme. -/
theorem separation_scheme_dependent :
    ∃ (s₁ s₂ : SeparationScheme) (r : Reconstructed), qedPart s₁ r ≠ qedPart s₂ r := by
  sorry

/-- Their sum does not. Together with the previous statement this is the whole content of the
separation: it is meaningful, it is not canonical, and a quoted QED-corrected cross section is
incomplete without the scheme. -/
theorem total_scheme_independent (s₁ s₂ : SeparationScheme) (r : Reconstructed) :
    qedPart s₁ r + weakPart s₁ r = qedPart s₂ r + weakPart s₂ r := by
  sorry

/-- Two-photon exchange is not the action of a positive kernel on a real Born cross section: it
has an imaginary part above the hadronic threshold. This signature records the consequence, that
the charge-odd cross section is the sum of the two-photon interference and the bremsstrahlung
interference of Layer 0 and of nothing else at this order. -/
def chargeOddCrossSection : ObservedCrossSection := sorry

/-- The interference of one-photon and two-photon exchange. -/
def twoPhotonInterference : ObservedCrossSection := sorry

/-- The lepton-hadron bremsstrahlung interference, which is charge-odd as well. -/
def bremsInterference : ObservedCrossSection := sorry

theorem chargeOdd_decomposition (r : Reconstructed) :
    chargeOddCrossSection r = twoPhotonInterference r + bremsInterference r := by
  sorry

/-- The bremsstrahlung interference does not vanish, so a measured charge asymmetry does not
isolate two-photon exchange: it must be subtracted with the kernel of Layer 2 first. -/
theorem bremsInterference_nonzero : ∃ r : Reconstructed, bremsInterference r ≠ 0 := by
  sorry

/-! ## Open questions

The two statements below are open questions, recorded here so that no layer silently depends on
them. Neither is a milestone.
-/

/-- Open: a quantitative bound on the error of the peaking approximation. The form conjectured is
that the approximant converges to the exact corrected cross section uniformly as the lepton mass
tends to zero at fixed kinematics. No result in the roadmap depends on it; results that need a
quantitative bound take the validity of the approximation as an explicit hypothesis instead. -/
theorem peaking_error_conjecture (m : ReconstructionMethod) (σ : BornCrossSection)
    (R : CorrectionOperator) :
    ∀ ε : ℝ, 0 < ε → ∃ m₀ : ℝ, 0 < m₀ ∧ ∀ mass : ℝ, 0 < mass → mass < m₀ →
      UnifBound (fun r => peakingApproximant m mass σ r - R.act σ r) ε := by
  sorry

/-- The non-uniqueness contributed by the elastic tail: on a region containing the elastic line
the correction operator has a nonzero kernel, so the inelastic Born cross section near the elastic
line and the elastic contribution are not separately determined by the observed cross section.

The exact dimension of that kernel is an open question and is deliberately not stated here as a
theorem; the roadmap records it in prose, and nothing depends on the answer. -/
def CorrectionOperator.HasNontrivialKernel (R : CorrectionOperator) : Prop :=
  ∃ σ : BornCrossSection, (∃ t : TrueInvariants, σ t ≠ 0) ∧ ∀ r : Reconstructed, R.act σ r = 0

/-- The non-uniqueness is a property of the radiative operator built in Layer 3.1, not of every
`CorrectionOperator`: the structure constrains only `act`, so an injective `act` is a
counterexample to the unconditional form. Stated as the predicate, it is dischargeable where the
operator is constructed. -/
theorem elasticTail_nonuniqueness (R : CorrectionOperator) (hR : R.HasNontrivialKernel) :
    ∃ σ : BornCrossSection, (∃ t : TrueInvariants, σ t ≠ 0) ∧ ∀ r : Reconstructed, R.act σ r = 0 :=
  hR

end

end EpsilonEridaniRoadmap.RadiativeCorrections

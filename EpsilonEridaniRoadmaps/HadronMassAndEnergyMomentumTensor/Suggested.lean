import EpsilonEridani

/-!
# The hadron mass and the energy-momentum tensor: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Three design choices are made explicit here.

First, a gravitational form factor is a function of the **non-negative** variable `Q² = -t`, per
Convention 1 of the roadmap. Nothing in this file takes a form factor at a negative argument, and
the radius and dispersion integrals therefore run over `Set.Ioi 0` rather than over a half-line of
negatives. The dictionary to the literature's `t ≤ 0` lives in Layer 1.1 and is not duplicated here.

Second, the target is explicit data (`Target`), and the part label is an explicit argument
(`EMTPart`), so that a spin-half theorem and a spin-zero theorem are visibly different statements
and a total-only theorem cannot be applied to a part by accident. An unlabelled form factor means
`GFFSet.total`.

Third, and most important: every unproved statement of the roadmap appears here as either a
`sorry`-ed theorem or a named `Prop`, never as a structure field. `DTermNegativity`,
`MechanicalStability` and `ThresholdFactorizationHypothesis` are propositions that theorems take as
explicit hypothesis arguments. No structure in this file has a `Prop`-valued field carrying a
placeholder witness: such a field would assert nothing while looking like a hypothesis.

The predicates written `:= sorry` (`ArisesFromConservedEMT`, `RepresentsGFF`,
`SpectralFunctionOneSign`, `ThresholdFactorizationHypothesis`) are definitional obligations of the
layers named in their docstrings, not proof obligations; they are the places where the operator
content of Layer 0 and the factorisation content of Layer 5 attach to the form-factor data.
-/

namespace EpsilonEridaniRoadmaps.HadronMassAndEnergyMomentumTensor

open MeasureTheory

/-! ## Layer 0: the operator, and the part label it carries -/

/-- The two parts of the QCD energy-momentum tensor. The label is an explicit argument of every
quantity derived from a single part; an unlabelled quantity means the conserved total. -/
inductive EMTPart
  | quark
  | gluon
  deriving DecidableEq, Repr

/-- A hadron target. The mass and twice the spin are explicit data, so that a theorem which needs
spin one half says so in its statement rather than in its choice of spinors. `spinTwice = 0` and
`spinTwice = 1` are the cases in scope for this roadmap; spin one and above belong to
`LightNuclei`. -/
structure Target where
  mass : ℝ
  mass_pos : 0 < mass
  spinTwice : ℕ

/-- The spin-zero case. -/
def Target.IsSpinZero (T : Target) : Prop := T.spinTwice = 0

/-- The spin-half case. -/
def Target.IsSpinHalf (T : Target) : Prop := T.spinTwice = 1

/-! ## Layer 1: gravitational form factors -/

/-- The gravitational form factors of one part of the energy-momentum tensor. Each field is a
function of `Q² = -t ≥ 0`; its values at negative arguments are not meaningful. `Cbar` is the
non-conserved form factor, which is carried for every part and vanishes only for the total. -/
structure GFF where
  A : ℝ → ℝ
  B : ℝ → ℝ
  C : ℝ → ℝ
  Cbar : ℝ → ℝ

/-- The form factors of both parts. -/
structure GFFSet where
  part : EMTPart → GFF

/-- The form factors of the conserved total tensor. -/
def GFFSet.total (S : GFFSet) : GFF where
  A := fun q => (S.part EMTPart.quark).A q + (S.part EMTPart.gluon).A q
  B := fun q => (S.part EMTPart.quark).B q + (S.part EMTPart.gluon).B q
  C := fun q => (S.part EMTPart.quark).C q + (S.part EMTPart.gluon).C q
  Cbar := fun q => (S.part EMTPart.quark).Cbar q + (S.part EMTPart.gluon).Cbar q

/-- The angular-momentum form factor, `J = (A + B)/2`. -/
def gffJ (G : GFF) (q : ℝ) : ℝ := (G.A q + G.B q) / 2

/-- The `D`-term as a **function** of `Q²`. Distinct from `dTerm`, which is the number at the
origin; the factor of four between `D` and `C` is silent wherever it is wrong. -/
def dTermFF (G : GFF) (q : ℝ) : ℝ := 4 * G.C q

/-- The `D`-term as a **number**. -/
def dTerm (G : GFF) : ℝ := dTermFF G 0

/-- That a form-factor set is the set of matrix elements of the symmetric, gauge-invariant,
conserved energy-momentum tensor constructed in Layer 0 of the roadmap. Layer 0.2 to 0.5 supply the
definition; the sum rules below are proved **from** this predicate and not imposed. -/
def ArisesFromConservedEMT (T : Target) (S : GFFSet) : Prop := sorry

/-- Layer 1.4 item 1: the momentum sum rule, proved from conservation. -/
theorem momentum_sum_rule (T : Target) (S : GFFSet) (h : ArisesFromConservedEMT T S) :
    (S.total).A 0 = 1 := sorry

/-- Layer 1.4 item 2: the angular-momentum sum rule for a spin-half target. The spin enters
through `Target`, so the spin-zero statement is a different theorem and not an instance of this
one. -/
theorem angularMomentum_sum_rule (T : Target) (hT : T.IsSpinHalf) (S : GFFSet)
    (h : ArisesFromConservedEMT T S) :
    gffJ (S.part EMTPart.quark) 0 + gffJ (S.part EMTPart.gluon) 0 = 1 / 2 := sorry

/-- Layer 1.4 item 3: the non-conserved form factor of the total vanishes at **every** `Q²`, not
only at the origin. -/
theorem cbar_total_eq_zero (T : Target) (S : GFFSet) (h : ArisesFromConservedEMT T S)
    (q : ℝ) (hq : 0 ≤ q) : (S.total).Cbar q = 0 := sorry

/-- Corollary of `cbar_total_eq_zero`: the parts' non-conserved form factors are opposite. This is
the quantity Convention 5 forbids dropping. -/
theorem cbar_parts_neg (T : Target) (S : GFFSet) (h : ArisesFromConservedEMT T S)
    (q : ℝ) (hq : 0 ≤ q) :
    (S.part EMTPart.quark).Cbar q = -(S.part EMTPart.gluon).Cbar q := sorry

/-- Layer 1.4 item 4, as a negative theorem: conservation leaves the `D`-term free. This is why the
sign of the `D`-term is a conjecture rather than a corollary. -/
theorem dTerm_not_determined_by_conservation (T : Target) :
    ∃ S₁ S₂ : GFFSet, ArisesFromConservedEMT T S₁ ∧ ArisesFromConservedEMT T S₂ ∧
      dTerm S₁.total ≠ dTerm S₂.total := sorry

/-- Layer 1.6 item 4, a **hypothesis**: the spectral function of `C` is of one sign. Unknown. It is
recorded because `dTermNegativity_of_spectral_one_sign` below is the honest form of progress
available on the `D`-term conjecture. -/
def SpectralFunctionOneSign (G : GFF) : Prop := sorry

/-! ## Layer 2: the trace anomaly and the mass decomposition -/

/-- The two forward matrix elements that Ji's four-term mass decomposition needs: the quark
momentum fraction `a` at the scale in question, and `bHat`, the quark-mass matrix element already
divided by `1 + γ_m`. Both are scale- and scheme-dependent, which is why `scale` is a field and not
an afterthought. -/
structure MassDecompositionData where
  scale : ℝ
  a : ℝ
  bHat : ℝ

/-- Quark kinetic and potential energy. -/
def MassDecompositionData.quarkEnergy (D : MassDecompositionData) (T : Target) : ℝ :=
  (3 / 4) * (D.a - D.bHat) * T.mass

/-- Gluon field energy. -/
def MassDecompositionData.gluonEnergy (D : MassDecompositionData) (T : Target) : ℝ :=
  (3 / 4) * (1 - D.a) * T.mass

/-- Quark mass term. -/
def MassDecompositionData.massTerm (D : MassDecompositionData) (T : Target) : ℝ :=
  D.bHat * T.mass

/-- Trace-anomaly term. Defined by its own operator, not by subtraction: no term of the
decomposition is a residual. -/
def MassDecompositionData.anomalyTerm (D : MassDecompositionData) (T : Target) : ℝ :=
  (1 / 4) * (1 - D.bHat) * T.mass

/-- Layer 2.3: the four terms sum to the mass, identically in `a` and `bHat`. This is pure algebra
once the four coefficients are derived, and it is the cheapest available test that the derivation
is right. -/
theorem massDecomposition_sum (T : Target) (D : MassDecompositionData) :
    D.quarkEnergy T + D.gluonEnergy T + D.massTerm T + D.anomalyTerm T = T.mass := sorry

/-- Layer 2.3: `M_m + M_a` is scale-independent although neither term is. -/
theorem massTerm_add_anomalyTerm_scale_independent (T : Target) (D D' : MassDecompositionData)
    (h : D.bHat = D'.bHat) :
    D.massTerm T + D.anomalyTerm T = D'.massTerm T + D'.anomalyTerm T := sorry

/-- Layer 5.4 item 3, half of it: the anomaly term genuinely depends on the quark-mass matrix
element, which no gluon form factor determines. -/
theorem anomalyTerm_depends_on_massTerm (T : Target) (μ a : ℝ) :
    ∃ b b' : ℝ, MassDecompositionData.anomalyTerm ⟨μ, a, b⟩ T
      ≠ MassDecompositionData.anomalyTerm ⟨μ, a, b'⟩ T := sorry

/-! ## Layer 3: the mechanical picture -/

/-- The static energy-momentum tensor in the Breit frame, reduced to its three radial functions.
The argument is `r ≥ 0`. These are Fourier transforms of the form factors; whether they are
densities of a localised object is the open question recorded in Layer 3.7, and no theorem below
needs an answer to it. -/
structure StaticStress where
  /-- Energy density at radius `r`; only `0 < r` is meaningful. -/
  energyDensity : ℝ → ℝ
  /-- Radial pressure at radius `r`; only `0 < r` is meaningful. -/
  pressure : ℝ → ℝ
  /-- Shear force distribution at radius `r`; only `0 < r` is meaningful. -/
  shear : ℝ → ℝ

/-- Layer 3.3 item 1: the radial equilibrium equation, in the classical sense. The weak form pairs
against compactly supported test functions and is the version Layer 3.3 actually proves. -/
def Equilibrium (St : StaticStress) : Prop :=
  ∀ r : ℝ, 0 < r →
    (2 / 3) * deriv St.shear r + (2 / r) * St.shear r + deriv St.pressure r = 0

/-- Layer 3.3 item 2: the von Laue condition. A theorem for the total tensor, false for a part. -/
def VonLaue (St : StaticStress) : Prop :=
  ∫ r in Set.Ioi (0 : ℝ), r ^ 2 * St.pressure r = 0

/-- Layer 3.3 item 2: von Laue follows from the equilibrium equation, given decay at infinity. The
decay hypothesis is what makes the boundary term vanish and is traced back to Layer 1.6. -/
theorem vonLaue_of_equilibrium (St : StaticStress) (hEq : Equilibrium St)
    (hDecay : Filter.Tendsto (fun r : ℝ => r ^ 3 * St.shear r) Filter.atTop (nhds 0))
    (hInt : IntegrableOn (fun r : ℝ => r ^ 2 * St.pressure r) (Set.Ioi 0)) :
    VonLaue St := sorry

/-- Layer 3.3 item 3: a von Laue pressure that is not identically zero changes sign. -/
theorem pressure_changes_sign (St : StaticStress) (hCont : Continuous St.pressure)
    (hVL : VonLaue St) (hNZ : ∃ r : ℝ, 0 < r ∧ St.pressure r ≠ 0) :
    (∃ r : ℝ, 0 < r ∧ 0 < St.pressure r) ∧ (∃ r : ℝ, 0 < r ∧ St.pressure r < 0) := sorry

/-- Layer 3.5 item 2: the mechanical radius squared, in the sign convention of Convention 1. The
literature's `∫_{-∞}^0 dt C(t)` becomes `∫_0^∞ dQ² C(Q²)` under the dictionary of Layer 1.1, with
no sign change in the measure. Well-defined only when the denominator is non-zero, which Layer 3.5
proves from the decay hypotheses of Layer 1.6 and which the `dTerm = 0` example shows is a genuine
hypothesis. -/
def mechanicalRadiusSq (G : GFF) : ℝ :=
  6 * G.C 0 / ∫ q in Set.Ioi (0 : ℝ), G.C q

/-- The coefficient of `dTerm / M²` in the mass radius of Layer 3.5 item 1. Left as an obligation
rather than written as a guessed numeral: it is derived from the Breit-frame transform of the
`C`-term contribution to `T^{00}`, and a wrong numeral here would be invisible. -/
def massRadiusDTermCoefficient : ℝ := sorry

/-- Layer 3.5 item 1: the mass radius squared. The leading term carries a minus sign because the
argument is `Q²` and not `t`. The second term is what distinguishes the mass radius from the radius
read off from the slope of `A` alone. -/
def massRadiusSq (T : Target) (G : GFF) : ℝ :=
  -6 * deriv G.A 0 + massRadiusDTermCoefficient * dTerm G / T.mass ^ 2

/-- Layer 3.5 item 1: the two candidate "mass radii" agree exactly when the `D`-term vanishes. -/
theorem massRadiusSq_eq_slope_iff_dTerm_eq_zero (T : Target) (G : GFF)
    (hCoeff : massRadiusDTermCoefficient ≠ 0) :
    massRadiusSq T G = -6 * deriv G.A 0 ↔ dTerm G = 0 := sorry

/-- **Conjecture, unproved.** The `D`-term of the conserved total tensor of a stable hadron is
negative. It holds in every model and lattice determination examined, and no first-principles proof
is known; `dTerm_not_determined_by_conservation` says why conservation cannot supply one. No
theorem in the library may assume this implicitly. -/
def DTermNegativity (S : GFFSet) : Prop := dTerm S.total < 0

/-- **Conjecture, unproved.** Pointwise mechanical stability. Strictly stronger than `VonLaue`,
which is a theorem. -/
def MechanicalStability (St : StaticStress) : Prop :=
  ∀ r : ℝ, 0 < r → 0 ≤ (2 / 3) * St.shear r + St.pressure r

/-- Layer 3.7: the implication that is available. A one-sign spectral function for `C` would give
the `D`-term conjecture; the hypothesis is taken as an explicit argument and is not asserted
anywhere. -/
theorem dTermNegativity_of_spectral_one_sign (T : Target) (S : GFFSet)
    (hEMT : ArisesFromConservedEMT T S) (hSpec : SpectralFunctionOneSign S.total) :
    DTermNegativity S := sorry

/-! ## Layer 4: scale dependence and mixing -/

/-- The second-moment mixing matrix, taken from `CollinearEvolution` and identified with the
operator mixing matrix of Layer 0.5. -/
structure MixingMatrix where
  qq : ℝ
  qg : ℝ
  gq : ℝ
  gg : ℝ

/-- Momentum conservation, stated as the two equalities themselves rather than as a row- or
column-sum, since which is which depends on a matrix convention this roadmap does not fix:
`qq + gq = 0` and `qg + gg = 0`. Proved in Layer 0.5 and checked against `CollinearEvolution`'s
matrix in Layer 4.1. -/
def MixingMatrix.ConservesMomentum (M : MixingMatrix) : Prop :=
  M.qq + M.gq = 0 ∧ M.qg + M.gg = 0

/-- Layer 4.2: the asymptotic gluon momentum fraction for `nf` active flavours. -/
def asymptoticGluonFraction (nf : ℕ) : ℝ := 16 / (16 + 3 * (nf : ℝ))

/-- Layer 4.2: the asymptotic quark momentum fraction. -/
def asymptoticQuarkFraction (nf : ℕ) : ℝ := 3 * (nf : ℝ) / (16 + 3 * (nf : ℝ))

/-- Layer 4.2: the asymptotic fractions are a partition of unity, as the momentum sum rule
requires at every scale including the limit. -/
theorem asymptotic_fractions_sum (nf : ℕ) :
    asymptoticGluonFraction nf + asymptoticQuarkFraction nf = 1 := sorry

/-- That `S'` is obtained from `S` by second-moment evolution from one scale to another, with the
mixing matrix of `CollinearEvolution`. The evolution itself is the abstract Cauchy problem of
`TauCeti.Analysis.Semigroups.CauchyProblem.Basic`; Layer 4.1 builds the generator from `M`. -/
def EvolvesTo (M : MixingMatrix) (μ μ' : ℝ) (S S' : GFFSet) : Prop := sorry

/-- Layer 4.3 item 1: the total `D`-term is scale-independent. The parts' `D`-terms are not, which
is the trap of quoting "the quark `D`-term" with no scale. -/
theorem total_dTerm_scale_independent (T : Target) (S S' : GFFSet) (M : MixingMatrix) (μ μ' : ℝ)
    (hCons : M.ConservesMomentum) (hEMT : ArisesFromConservedEMT T S)
    (hEvol : EvolvesTo M μ μ' S S') :
    dTerm S.total = dTerm S'.total := sorry

/-! ## Layer 5: access through measurement -/

/-- A pair of generalised parton distributions for one part, as functions of `x`, the skewness `ξ`
and `Q²`. The distributions themselves, their support and polynomiality belong to
`GeneralizedPartonDistributions`; this is the interface across which their second moments are
read. -/
structure GPDPair where
  H : ℝ → ℝ → ℝ → ℝ
  E : ℝ → ℝ → ℝ → ℝ

/-- That a pair of generalised distributions has the given form factors as its second moments, in
the sense of the twist-two operator matching of Layer 5.1. -/
def RepresentsGFF (D : GPDPair) (G : GFF) : Prop := sorry

/-- Layer 5.1: the second moment of `H`. The `ξ²` coefficient is `4 C`, which is how the `D`-term
enters the moment, and polynomiality is what guarantees no further structure appears. -/
theorem secondMoment_H (G : GFF) (D : GPDPair) (h : RepresentsGFF D G) (ξ q : ℝ) (hq : 0 ≤ q) :
    (∫ x in Set.Icc (-1 : ℝ) 1, x * D.H x ξ q) = G.A q + 4 * ξ ^ 2 * G.C q := sorry

/-- Layer 5.1: the second moment of `E`, with the opposite `ξ²` coefficient. -/
theorem secondMoment_E (G : GFF) (D : GPDPair) (h : RepresentsGFF D G) (ξ q : ℝ) (hq : 0 ≤ q) :
    (∫ x in Set.Icc (-1 : ℝ) 1, x * D.E x ξ q) = G.B q - 4 * ξ ^ 2 * G.C q := sorry

/-- The Ji angular momentum of one part, read from the second moment at zero momentum transfer. -/
def jiAngularMomentum (D : GPDPair) (ξ : ℝ) : ℝ :=
  (1 / 2) * ∫ x in Set.Icc (-1 : ℝ) 1, x * (D.H x ξ 0 + D.E x ξ 0)

/-- Layer 5.2: the Ji sum rule, as a corollary of `secondMoment_H` and `secondMoment_E`. The
convergence hypothesis on the forward limit is explicit, since it is a property proved in
`GeneralizedPartonDistributions` and a hypothesis here. This is the statement `SpinStructure`
cites; it does not decompose `J` into spin and orbital pieces, which is `WignerDistributions`. -/
theorem ji_sum_rule (G : GFF) (D : GPDPair) (h : RepresentsGFF D G) (ξ : ℝ)
    (hConv : IntegrableOn (fun x : ℝ => x * (D.H x ξ 0 + D.E x ξ 0)) (Set.Icc (-1) 1)) :
    jiAngularMomentum D ξ = gffJ G 0 := sorry

/-- Layer 5.2: and therefore the Ji angular momentum does not depend on the skewness. -/
theorem jiAngularMomentum_xi_independent (G : GFF) (D : GPDPair) (h : RepresentsGFF D G)
    (ξ ξ' : ℝ)
    (hConv : IntegrableOn (fun x : ℝ => x * (D.H x ξ 0 + D.E x ξ 0)) (Set.Icc (-1) 1))
    (hConv' : IntegrableOn (fun x : ℝ => x * (D.H x ξ' 0 + D.E x ξ' 0)) (Set.Icc (-1) 1)) :
    jiAngularMomentum D ξ = jiAngularMomentum D ξ' := sorry

/-- The leading-order Compton form factors produced by a generalised distribution at a fixed
skewness: the convolution against the hard kernel, taken from
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Convolution.Basic`. Recorded as an obligation rather
than spelled out here, because the kernel is that roadmap's object and not this one's. -/
def comptonFormFactors (D : GPDPair) (ξ : ℝ) : ℝ → ℂ := sorry

/-- Layer 5.3 item 2, the negative result: two generalised distributions can share every
leading-order Compton form factor at a fixed skewness and still have different `D`-terms, so the
form factors are not determined by such data alone. The shadow-distribution construction belongs to
`GeneralizedPartonDistributions`; what is stated here is its consequence for this roadmap. -/
theorem secondMoment_not_determined_by_compton_data (ξ : ℝ) :
    ∃ D₁ D₂ : GPDPair, ∃ G₁ G₂ : GFF,
      RepresentsGFF D₁ G₁ ∧ RepresentsGFF D₂ G₂ ∧
      comptonFormFactors D₁ ξ = comptonFormFactors D₂ ξ ∧
      dTerm G₁ ≠ dTerm G₂ := sorry

/-- **Hypothesis**, Layer 5.4 item 1: that the near-threshold heavy-quarkonium photoproduction
amplitude is, to leading order in a named expansion, a specified combination of the gluon form
factors. Its four assumptions — small quarkonium, non-relativistic bound state, gluon-operator
dominance of the threshold operator product expansion, and power suppression of higher-twist and
quark-exchange contributions — are part of the definition in Layer 5.4. Whether it holds is an open
question; nothing outside 5.4 depends on it. -/
def ThresholdFactorizationHypothesis (T : Target) (S : GFFSet) (amp : ℝ → ℝ) : Prop := sorry

/-- Layer 5.4 item 3, the other half: the hypothesis is a statement about the gluon part only.
Together with `anomalyTerm_depends_on_massTerm` this is the precise reason a threshold
photoproduction measurement does not by itself determine the anomaly term of the mass
decomposition. -/
theorem thresholdFactorization_depends_only_on_gluon (T : Target) (S S' : GFFSet) (amp : ℝ → ℝ)
    (hGluon : S.part EMTPart.gluon = S'.part EMTPart.gluon)
    (h : ThresholdFactorizationHypothesis T S amp) :
    ThresholdFactorizationHypothesis T S' amp := sorry

/-- Layer 5.4 item 2: what follows **given** the hypothesis. The hypothesis is an explicit
argument, so the conditional nature of the extraction is visible in the statement. -/
theorem gluon_dTerm_from_threshold_slope (T : Target) (S : GFFSet) (amp : ℝ → ℝ)
    (h : ThresholdFactorizationHypothesis T S amp) :
    ∃ f : (ℝ → ℝ) → ℝ, f amp = dTerm (S.part EMTPart.gluon) := sorry

/-- Layer 5.5 item 3: the sum rules as a check any table of lattice matrix elements must pass,
in a form `LatticeBridge` can apply. -/
def SumRulesHold (T : Target) (S : GFFSet) : Prop :=
  (S.total).A 0 = 1 ∧ ((S.total).A 0 + (S.total).B 0) = 1 ∧ (S.total).Cbar 0 = 0

end EpsilonEridaniRoadmaps.HadronMassAndEnergyMomentumTensor

import EpsilonEridani

/-!
# Light nuclei, short-range correlations, and the nuclear force: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

The signatures below make four design choices explicit. First, the two momentum fractions of the
roadmap's second convention are separate arguments everywhere, and the light-cone fraction of a
bound nucleon is a third: no definition takes "the" momentum fraction. Second, the off-shell
dependence of a bound nucleon's structure function is an argument of the fold and never a
correction absorbed into it. Third, a plateau is a bounded-deviation statement over an interval
whose endpoints and tolerance are arguments, so that it asserts something; the same discipline
applies to the pair-dominance and contact-factorisation statements, which are `Prop`-valued
definitions taken as explicit hypotheses rather than structure fields. Fourth, the deuteron wave
function appears twice: as data in Layer 1 and as the ground state of a potential in Layer 5, and
the two are connected by a theorem rather than identified by fiat.

Spherical Bessel functions and Legendre polynomials are absent from Mathlib and TauCeti at the
pinned revisions, so Layer 0 builds them here, in the order-indexed shape with a ladder relation
and an orthogonality statement that the upstream Hermite function family takes.
-/

namespace EpsilonEridaniRoadmap.LightNuclei

/-! ## Layer 0: spherical Bessel functions, Legendre polynomials, and partial waves -/

/-- The spherical Bessel function of the first kind of order `l`, on the nonnegative half-line.
Defined by the Rayleigh formula rather than by its series, so that the recurrence is a
consequence of differentiation. -/
noncomputable def sphericalBesselJ (l : ℕ) (x : ℝ) : ℝ := sorry

/-- The order-zero member takes the value one at the origin. -/
theorem sphericalBesselJ_zero_at_zero : sphericalBesselJ 0 0 = 1 := sorry

/-- Every member of positive order vanishes at the origin. -/
theorem sphericalBesselJ_at_zero (l : ℕ) (hl : l ≠ 0) : sphericalBesselJ l 0 = 0 := sorry

/-- The three-term recurrence in the order. This is the analogue of the upstream Hermite ladder
relation, and every later manipulation of the family goes through it. -/
theorem sphericalBesselJ_recurrence (l : ℕ) (x : ℝ) (hx : 0 < x) :
    sphericalBesselJ (l + 2) x =
      (2 * (l : ℝ) + 3) / x * sphericalBesselJ (l + 1) x - sphericalBesselJ l x := sorry

/-- Each member is bounded by one on the nonnegative half-line. -/
theorem abs_sphericalBesselJ_le_one (l : ℕ) (x : ℝ) (hx : 0 ≤ x) :
    |sphericalBesselJ l x| ≤ 1 := sorry

/-- The large-argument asymptotic form: the order-`l` member is the sine of the argument shifted
by `l` right angles, divided by the argument, up to a remainder decaying faster than the
reciprocal of the argument. The remainder bound is the content. -/
theorem sphericalBesselJ_asymptotic (l : ℕ) :
    ∀ ε > 0, ∃ R > 0, ∀ x > R,
      |sphericalBesselJ l x - Real.sin (x - (l : ℝ) * (Real.pi / 2)) / x| ≤ ε / x := sorry

/-- The spherical Bessel function of the second kind of order `l`. Its domain is the strictly
positive half-line, because it is singular at the origin, and the type records that. -/
noncomputable def sphericalBesselY (l : ℕ) (x : Set.Ioi (0 : ℝ)) : ℝ := sorry

/-- The Wronskian identity: the two families are independent solutions of the same equation. -/
theorem sphericalBessel_wronskian (l : ℕ) (x : Set.Ioi (0 : ℝ)) :
    sphericalBesselJ (l + 1) x.1 * sphericalBesselY l x
      - sphericalBesselJ l x.1 * sphericalBesselY (l + 1) x = 1 / x.1 ^ 2 := sorry

/-- The Riccati-Bessel function of the first kind: the argument times the spherical Bessel
function. This is the form in which the radial equation has no first-derivative term, and it is
the form Layer 5 uses. -/
noncomputable def riccatiBesselS (l : ℕ) (x : ℝ) : ℝ := x * sphericalBesselJ l x

/-- The Legendre polynomial of degree `l`, as an element of the real polynomial ring, defined by
the three-term recurrence in the degree. -/
noncomputable def legendreP (l : ℕ) : Polynomial ℝ := sorry

/-- Orthogonality of the Legendre family on the closed unit interval about the origin, with its
explicit normalisation. -/
theorem legendreP_orthogonality (l m : ℕ) :
    ∫ x in Set.Icc (-1 : ℝ) 1, (legendreP l).eval x * (legendreP m).eval x
      = if l = m then 2 / (2 * (l : ℝ) + 1) else 0 := sorry

/-- A two-body partial-wave channel: total spin, orbital angular momentum and total angular
momentum, subject to the triangle condition. Spectroscopic names appear only in docstrings, so
that no channel is identified by a string literal. -/
structure ChannelLabel where
  /-- Total spin of the two nucleons. -/
  S : ℕ
  /-- Orbital angular momentum of the relative motion. -/
  L : ℕ
  /-- Total angular momentum. -/
  J : ℕ
  /-- The triangle condition relating the three. -/
  triangle : J ≤ L + S ∧ L ≤ J + S ∧ S ≤ J + L

/-- The channel with total spin one, orbital angular momentum zero and total angular momentum
one: the deuteron's s-wave channel. -/
def channelSWave : ChannelLabel := ⟨1, 0, 1, by omega⟩

/-- The channel with total spin one, orbital angular momentum two and total angular momentum
one: the deuteron's d-wave channel. -/
def channelDWave : ChannelLabel := ⟨1, 2, 1, by omega⟩

/-! ## Layer 1: the deuteron and the spin-one hadronic tensor -/

/-- A deuteron wave function, as the pair of `r`-weighted radial amplitudes of the two channels
of Layer 0, normalised so that the sum of their squared norms is one. The weighting convention is
fixed here and nowhere reintroduced. -/
structure DeuteronWave where
  /-- Radial amplitude of the s-wave channel, `r` times the radial function. -/
  uS : ℝ → ℝ
  /-- Radial amplitude of the d-wave channel, `r` times the radial function. -/
  uD : ℝ → ℝ
  /-- Normalisation of the pair. -/
  normalised : ∫ r in Set.Ioi (0 : ℝ), (uS r ^ 2 + uD r ^ 2) = 1

/-- The d-state probability: the weight of the d-wave channel under the normalisation above. It
is a functional of the wave function, not a free parameter, and Layer 5 shows it is not an
observable. -/
noncomputable def dStateProbability (ψ : DeuteronWave) : ℝ :=
  ∫ r in Set.Ioi (0 : ℝ), ψ.uD r ^ 2

/-- The d-state probability lies in the unit interval. -/
theorem dStateProbability_mem_Icc (ψ : DeuteronWave) :
    dStateProbability ψ ∈ Set.Icc (0 : ℝ) 1 := sorry

/-- The spin state of a spin-one target: a positive semidefinite matrix of unit trace. -/
structure SpinOneDensity where
  /-- The density matrix in the spin basis. -/
  M : Matrix (Fin 3) (Fin 3) ℂ
  /-- Positive semidefiniteness, which also gives hermiticity. -/
  posSemidef : M.PosSemidef
  /-- Unit trace. -/
  trace_one : M.trace = 1

/-- The degree-two isotypic component of a density matrix under the rotation action: the
symmetric traceless rank-two part. For a spin-one target this is the tensor polarisation. -/
noncomputable def rankTwoComponent (n : ℕ) (M : Matrix (Fin n) (Fin n) ℂ) :
    Matrix (Fin n) (Fin n) ℂ := sorry

/-- A spin-one-half target has no tensor polarisation: the degree-two component of a
two-dimensional density matrix vanishes identically. This is the structural reason the tensor
structure functions have no spin-one-half analogue. -/
theorem rankTwoComponent_two_eq_zero (M : Matrix (Fin 2) (Fin 2) ℂ) :
    rankTwoComponent 2 M = 0 := sorry

/-- The structure functions of a spin-one target, as functions of the nucleon-normalised Bjorken
variable and the hard scale. The four tensor structure functions follow the
Hoodbhoy-Jaffe-Manohar normalisation; `b1` is the fixed combination of hadronic tensor components
at definite target spin projection recorded in the roadmap's fifth convention. -/
structure SpinOneStructureFunctions where
  /-- Unpolarised transverse structure function. -/
  F1 : ℝ → ℝ → ℝ
  /-- Unpolarised structure function in the scaling combination. -/
  F2 : ℝ → ℝ → ℝ
  /-- Leading vector-polarised structure function. -/
  g1 : ℝ → ℝ → ℝ
  /-- Subleading vector-polarised structure function. -/
  g2 : ℝ → ℝ → ℝ
  /-- Leading tensor structure function. -/
  b1 : ℝ → ℝ → ℝ
  /-- Second tensor structure function. -/
  b2 : ℝ → ℝ → ℝ
  /-- Third tensor structure function. -/
  b3 : ℝ → ℝ → ℝ
  /-- Fourth tensor structure function. -/
  b4 : ℝ → ℝ → ℝ

/-- The spin-one structure functions determined by a deuteron wave function. Left as a target:
without it the theorem below quantifies over an arbitrary `F` unrelated to `ψ`, and is then
false rather than unproved. -/
def spinOneOfWave (_ψ : DeuteronWave) : SpinOneStructureFunctions := by
  sorry

/-- The leading tensor structure function vanishes when the d-wave amplitude does. The converse
fails, and the roadmap's Layer 1 says why. -/
theorem b1_eq_zero_of_uD_eq_zero (ψ : DeuteronWave) (hψ : ψ.uD = 0) :
    (spinOneOfWave ψ).b1 = 0 := sorry

/-! ## Layer 2: the convolution formula, neutron extraction, and spectator tagging -/

/-- The light-cone momentum distribution of one nucleon species in a nucleus of mass number `A`,
in the light-cone fraction of the roadmap's third convention.

Layer 2.1 describes this as a measure on `(0, A)`. It is carried here as a density with respect
to Lebesgue measure, which is the assumption under which the convolution below is an integral
rather than a pushforward; a distribution with atoms is outside the scope of these signatures.
The roadmap states the measure-valued formulation, and the two agree exactly when the density
exists. -/
structure LightConeDistribution (A : ℕ) where
  /-- The distribution in the light-cone fraction. -/
  f : ℝ → ℝ
  /-- Nonnegativity. -/
  nonneg : ∀ a, 0 ≤ f a
  /-- Support in the open interval from zero to the mass number. -/
  support : ∀ a, f a ≠ 0 → a ∈ Set.Ioo (0 : ℝ) (A : ℝ)
  /-- Normalisation to the number of nucleons of the species. -/
  count : ℝ
  /-- The normalisation condition. -/
  normalised : ∫ a in Set.Ioo (0 : ℝ) (A : ℝ), f a = count

/-- A bound-nucleon structure function: the nucleon-normalised Bjorken variable, the hard scale,
and the invariant mass of the struck nucleon, in that order. The third argument is the off-shell
dependence of the roadmap's sixth convention, and it is never absorbed. -/
abbrev OffShellStructureFunction := ℝ → ℝ → ℝ → ℝ

/-- The convolution formula: the nuclear structure function as the fold of the light-cone
distribution against the bound-nucleon structure function, with the Jacobian of the change from
the light-cone fraction to the rescaled Bjorken variable carried explicitly. -/
noncomputable def convolvedStructureFunction (A : ℕ) (f : LightConeDistribution A)
    (FN : OffShellStructureFunction) (xN Q2 : ℝ) : ℝ := sorry

/-- The fold reaches nucleon-normalised momentum fractions above one, which is the kinematic room
the short-range correlation region of Layer 4 occupies. The two nontriviality hypotheses are what
make this true: for the zero distribution, or a distribution supported below one, the fold
vanishes identically above one and the unconditional statement is false. -/
theorem convolvedStructureFunction_support (A : ℕ) (hA : 2 ≤ A) (f : LightConeDistribution A)
    (FN : OffShellStructureFunction) (Q2 : ℝ)
    (hf : ∃ a, 1 < a ∧ f.f a ≠ 0) (hFN : ∃ u v w, FN u v w ≠ 0) :
    ∃ xN > 1, convolvedStructureFunction A f FN xN Q2 ≠ 0 := sorry

/-- The binding correction: the difference between the fold and the free sum at fixed off-shell
function. It is a defined quantity, not a fitted residual. -/
noncomputable def bindingCorrection (A : ℕ) (f : LightConeDistribution A)
    (FN : OffShellStructureFunction) (xN Q2 : ℝ) : ℝ :=
  convolvedStructureFunction A f FN xN Q2 - f.count * FN xN Q2 0

/-- The kinematics of a tagged event: the inclusive variables together with the spectator's
light-cone fraction and transverse momentum. -/
structure TaggedKinematics where
  /-- Nucleon-normalised Bjorken variable. -/
  xN : ℝ
  /-- Hard scale. -/
  Q2 : ℝ
  /-- Light-cone fraction of the detected spectator. -/
  alphaS : ℝ
  /-- Transverse momentum of the detected spectator. -/
  pT : ℝ

/-- The tagged structure function. -/
noncomputable def taggedStructureFunction (A : ℕ) (f : LightConeDistribution A)
    (FN : OffShellStructureFunction) (k : TaggedKinematics) : ℝ := sorry

/-- The invariant mass of the struck nucleon, determined by the measured spectator momentum. -/
noncomputable def struckMass (A : ℕ) (k : TaggedKinematics) : ℝ := sorry

/-- Tagging removes the fold: the tagged structure function is a product, with no integral, of the
momentum distribution at the measured spectator fraction and the bound-nucleon structure function
at the correspondingly rescaled argument. This is the theorem that makes the extraction of a
neutron structure function free of the model dependence of the untagged case; the residual
dependence is exactly the third argument of `FN`. -/
theorem taggedStructureFunction_factorises (A : ℕ) (f : LightConeDistribution A)
    (FN : OffShellStructureFunction) (k : TaggedKinematics) :
    taggedStructureFunction A f FN k
      = f.f k.alphaS * FN (k.xN / ((A : ℝ) - k.alphaS)) k.Q2 (struckMass A k) := sorry

/-! ## Layer 4: short-range correlations -/

/-- A plateau statement: the ratio differs from the coefficient `C` by at most `eps` throughout
the interval from `a` to `b`, uniformly in the hard scale above `Q2min`. The interval endpoints
and the tolerance are arguments, so the statement asserts something. -/
def PlateauStatement (ratio : ℝ → ℝ → ℝ) (C a b eps Q2min : ℝ) : Prop :=
  1 < a ∧ a < b ∧ 0 < eps ∧
    ∀ x ∈ Set.Icc a b, ∀ Q2 ≥ Q2min, |ratio x Q2 - C| ≤ eps

/-- Under a plateau statement the coefficient is determined by the ratio up to twice the
tolerance, which is what makes a pair-count coefficient a property of the nucleus rather than a
value of a function at a point. -/
theorem plateau_coefficient_unique {ratio : ℝ → ℝ → ℝ} {C C' a b eps Q2min : ℝ}
    (h : PlateauStatement ratio C a b eps Q2min)
    (h' : PlateauStatement ratio C' a b eps Q2min) : |C - C'| ≤ 2 * eps := sorry

/-- The two-nucleon momentum distribution of a nucleus, in the relative and total momenta of a
pair of a given species. -/
structure PairDistribution (A : ℕ) where
  /-- The distribution in relative and total pair momentum. -/
  rho : ℝ → ℝ → ℝ
  /-- Nonnegativity. -/
  nonneg : ∀ k K, 0 ≤ rho k K

/-- The contact factorisation hypothesis: above relative momentum `kmin` and below total momentum
`Kmax`, the pair distribution of every nucleus is a nucleus-independent function of the relative
momentum times a nucleus-dependent coefficient. Both the universal function and the coefficient
are arguments. This is a hypothesis about solutions of a many-body problem; it is not proved
anywhere in this roadmap, and results that use it take it as an explicit argument. -/
def ContactFactorisation {A : ℕ} (ρ : PairDistribution A) (universal : ℝ → ℝ) (contact : ℝ)
    (kmin Kmax : ℝ) : Prop :=
  ∀ k > kmin, ∀ K ∈ Set.Icc (0 : ℝ) Kmax, ρ.rho k K = contact * universal k

/-- The momentum-space deuteron amplitude in the s-wave channel: the radial transform of the
weighted amplitude of Layer 1. -/
noncomputable def momentumSpaceAmplitude (ψ : DeuteronWave) (k : ℝ) : ℝ := sorry

/-- The pair distribution of the deuteron itself, built from its wave function. -/
noncomputable def deuteronPairDistribution (ψ : DeuteronWave) : PairDistribution 2 := sorry

/-- Under the contact factorisation hypothesis, applied to the deuteron with its own contact
normalised to one, the universal function in the total-spin-one, isospin-zero channel is the
squared momentum-space deuteron amplitude above `kmin`. Both sides are independently determined,
which is what makes this the hypothesis's sharpest consequence. -/
theorem universal_eq_deuteron_of_contactFactorisation {universal : ℝ → ℝ} {kmin Kmax : ℝ}
    (ψ : DeuteronWave)
    (hD : ContactFactorisation (deuteronPairDistribution ψ) universal 1 kmin Kmax) :
    ∀ k > kmin, universal k = momentumSpaceAmplitude ψ k ^ 2 := sorry

/-- Dominance of proton-neutron pairs: the proton-neutron contact exceeds each like-species
contact by at least the factor `r` in the stated region. Stated as a `Prop` with the factor as an
argument; the tensor-force explanation of it is a separate hypothesis, and the roadmap identifies
the observable that tests the explanation. -/
def PnDominance (contactPN contactPP contactNN r : ℝ) : Prop :=
  1 < r ∧ r * contactPP ≤ contactPN ∧ r * contactNN ≤ contactPN

/-! ## Layer 5: the nucleon-nucleon interaction, three-nucleon forces, and strange systems -/

/-- The nucleon-nucleon interaction, as the radial functions multiplying the complete list of
invariant operators. Charge-independence breaking is a separate named term rather than being
absorbed into the isospin-dependent functions, so that the mirror-symmetry breaking of Layer 3
can be traced to it. -/
structure NNPotential where
  /-- Central component. -/
  vC : ℝ → ℝ
  /-- Spin-spin component. -/
  vSS : ℝ → ℝ
  /-- Tensor component. -/
  vT : ℝ → ℝ
  /-- Spin-orbit component. -/
  vLS : ℝ → ℝ
  /-- Quadratic spin-orbit component. -/
  vLL : ℝ → ℝ
  /-- Isospin-dependent central component. -/
  vCtau : ℝ → ℝ
  /-- Isospin-dependent spin-spin component. -/
  vSStau : ℝ → ℝ
  /-- Isospin-dependent tensor component. -/
  vTtau : ℝ → ℝ
  /-- Charge-independence-breaking component. -/
  vCIB : ℝ → ℝ

/-- The tensor part of the one-pion-exchange potential, with the pion-nucleon coupling and the
pion mass as explicit parameters. -/
noncomputable def onePionExchangeTensor (gPiN mPi r : ℝ) : ℝ := sorry

/-- The energy functional of a two-channel wave function in a given potential. -/
noncomputable def energy (V : NNPotential) (ψ : DeuteronWave) : ℝ := sorry

/-- `ψ₀` is a ground state of `V` in the deuteron sector. -/
def IsDeuteronGroundState (V : NNPotential) (ψ₀ : DeuteronWave) : Prop :=
  energy V ψ₀ < 0 ∧ ∀ ψ : DeuteronWave, energy V ψ₀ ≤ energy V ψ

/-- Existence of a bound state from a negative-energy trial function: this is the variational
criterion that makes "the deuteron is bound" a checkable statement about the potential rather
than an input. -/
theorem exists_deuteronGroundState (V : NNPotential)
    (h : ∃ ψ : DeuteronWave, energy V ψ < 0) :
    ∃ ψ₀ : DeuteronWave, IsDeuteronGroundState V ψ₀ := sorry

/-- A purely central potential has no tensor coupling, so its ground state has no d-wave
component and zero d-state probability. Together with the quadrupole moment this single instance
ties four of the roadmap's statements to one witness. -/
theorem dStateProbability_eq_zero_of_central (V : NNPotential) (hV : V.vT = 0 ∧ V.vTtau = 0)
    (ψ₀ : DeuteronWave) (h : IsDeuteronGroundState V ψ₀) :
    dStateProbability ψ₀ = 0 := sorry

/-- A baryon label: mass, strangeness, and twice the spin. The nucleon is the label with zero
strangeness; Layer 5 states which of this roadmap's constructions are indifferent to the label
and which are not. -/
structure BaryonLabel where
  /-- Mass. -/
  mass : ℝ
  /-- Strangeness. -/
  strangeness : ℤ
  /-- Twice the spin, so that a spin-one-half baryon has value one. -/
  twiceSpin : ℕ

/-- The generalised two-body potential between two labelled baryons, of which `NNPotential` is
the case of two nucleon labels. The conversion term coupling a hyperon-nucleon channel to a
two-nucleon channel of the same strangeness is the field with no nucleonic analogue. -/
structure BaryonPotential (b₁ b₂ : BaryonLabel) where
  /-- The potential in the same operator decomposition as the nucleonic case. -/
  core : NNPotential
  /-- Coupling to a channel with the same strangeness and different baryon content. -/
  conversion : ℝ → ℝ

end EpsilonEridaniRoadmap.LightNuclei

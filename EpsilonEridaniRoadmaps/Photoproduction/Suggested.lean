import EpsilonEridani

/-!
# Photoproduction and ultra-peripheral collisions: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by these signatures. The photon virtuality is a field of
`PhotonKin` and never a default, so that photoproduction is a limit with hypotheses rather than a
separate vocabulary. The two impact parameters of the subject are distinct arguments with distinct
names — `bSep` for the separation of the two source centres, `bTar` for a transverse position
relative to a target centre — so that they cannot be silently exchanged. Vector-meson dominance is
a `Prop`-valued predicate taken as an explicit hypothesis by the theorems that use it, never a
structure field carrying a placeholder witness. And the modified Bessel functions, absent from both
Mathlib and TauCeti at the pinned revisions, are defined here by their integral representations
rather than assumed upstream.
-/

namespace EpsilonEridaniRoadmaps.Photoproduction

open MeasureTheory

/-! ## Layer 0: photon kinematics and the equivalent photon flux -/

/-- A charged source of equivalent photons. All four quantities are explicit data: the `Z²`
scaling of the flux is then a theorem about `charge`, and the coherence bound is a theorem about
`radius`, rather than properties resolved by a typeclass. -/
structure ChargedSource where
  /-- Electric charge in units of the positron charge. -/
  charge : ℝ
  /-- Mass of the source. -/
  mass : ℝ
  /-- Charge radius; the length scale entering the coherence condition. -/
  radius : ℝ
  /-- Lorentz factor of the source in the collider frame. -/
  gamma : ℝ

/-- Photon kinematics. The virtuality is carried explicitly so that every photoproduction
statement is a limit of a virtual statement. -/
structure PhotonKin where
  /-- Photon energy in the collider frame. -/
  energy : ℝ
  /-- Photon virtuality `Q² ≥ 0`. -/
  virtuality : ℝ

/-- The real-photon point. -/
def PhotonKin.IsReal (k : PhotonKin) : Prop := k.virtuality = 0

/-- The modified Bessel function `K₀`, by its integral representation, on the positive reals.
Absent from Mathlib and TauCeti at the pinned revisions; defined here in the indexed-family shape
upstream would want. The integral diverges for `x ≤ 0`, where Lean's junk value would be `0` and
silently satisfy the monotonicity and positivity statements of Layer 1, so the domain is a
branch rather than a comment. -/
noncomputable def besselK0 (x : ℝ) : ℝ :=
  if 0 < x then ∫ t in Set.Ioi (0 : ℝ), Real.exp (-(x * Real.cosh t)) else 0

/-- The modified Bessel function `K₁`, by its integral representation on the positive reals, with
the same domain branch as `besselK0`. -/
noncomputable def besselK1 (x : ℝ) : ℝ :=
  if 0 < x then ∫ t in Set.Ioi (0 : ℝ), Real.exp (-(x * Real.cosh t)) * Real.cosh t else 0

/-- `K₀` is strictly positive on the positive reals. -/
theorem besselK0_pos {x : ℝ} (hx : 0 < x) : 0 < besselK0 x := sorry

/-- The derivative relation `K₀' = -K₁`, from which the recurrences of Layer 0.5 follow. -/
theorem hasDerivAt_besselK0 {x : ℝ} (hx : 0 < x) :
    HasDerivAt besselK0 (-besselK1 x) x := sorry

/-- The exponential decay of `K₁` at infinity, which is the analytic content of the coherence
cutoff: the flux is suppressed once the photon energy exceeds `gamma / bSep`. -/
theorem besselK1_le_exp {x : ℝ} (hx : 1 ≤ x) :
    besselK1 x ≤ besselK1 1 * Real.exp (-(x - 1)) := sorry

/-- Maximal photon virtuality compatible with coherent emission from an extended source. -/
noncomputable def coherentVirtualityBound (s : ChargedSource) : ℝ := 1 / s.radius ^ 2

/-- Maximal photon energy in the collider frame compatible with coherent emission. -/
noncomputable def coherentEnergyBound (s : ChargedSource) : ℝ := s.gamma / s.radius

/-- The integrated equivalent-photon spectrum `dN/dk` of a point charge with minimum impact
parameter `bmin`, in the Weizsäcker–Williams form. `alpha` is the fine-structure constant, carried
as a parameter rather than taken from a global constant. -/
noncomputable def photonFlux (alpha : ℝ) (s : ChargedSource) (bmin k : ℝ) : ℝ :=
  let xi := k * bmin / s.gamma
  (2 * alpha * s.charge ^ 2) / (Real.pi * k) *
    (xi * besselK0 xi * besselK1 xi
      - xi ^ 2 / 2 * ((besselK1 xi) ^ 2 - (besselK0 xi) ^ 2))

/-- The flux differential in the separation of the source centres, `d³N/(dk d²bSep)`. -/
noncomputable def photonFluxImpact (alpha : ℝ) (s : ChargedSource) (bSep k : ℝ) : ℝ :=
  let xi := k * bSep / s.gamma
  (alpha * s.charge ^ 2) / (Real.pi ^ 2 * k * bSep ^ 2) * xi ^ 2 * (besselK1 xi) ^ 2

/-- The flux is positive at positive photon energy. -/
theorem photonFlux_pos {alpha : ℝ} {s : ChargedSource} {bmin k : ℝ}
    (halpha : 0 < alpha) (hZ : s.charge ≠ 0) (hb : 0 < bmin) (hk : 0 < k)
    (hg : 0 < s.gamma) : 0 < photonFlux alpha s bmin k := sorry

/-- Consistency of the two forms of the flux. This fixes the relative normalisation, so that the
factors of `2π` of convention 3 are a theorem rather than a stipulation. -/
theorem photonFlux_eq_integral_photonFluxImpact
    {alpha : ℝ} {s : ChargedSource} {bmin k : ℝ}
    (hb : 0 < bmin) (hk : 0 < k) (hg : 0 < s.gamma) :
    photonFlux alpha s bmin k
      = 2 * Real.pi * ∫ b in Set.Ioi bmin, b * photonFluxImpact alpha s b k := sorry

/-! ## Layer 1: nuclear geometry, the survival factor, and two-photon luminosity -/

/-- A nuclear matter distribution. The profile is data; the Woods–Saxon and uniform-sphere
instances are definitions elsewhere in the layer. -/
structure NuclearProfile where
  /-- Radial density, normalised so that its volume integral is the mass number. -/
  density : ℝ → ℝ
  /-- Nuclear radius parameter. -/
  radius : ℝ
  /-- Mass number. -/
  massNumber : ℕ

/-- The thickness function: the density integrated along the beam direction at fixed transverse
position `bTar`. -/
noncomputable def thickness (N : NuclearProfile) (bTar : ℝ) : ℝ :=
  ∫ z : ℝ, N.density (Real.sqrt (bTar ^ 2 + z ^ 2))

/-- The overlap of two thickness functions at source separation `bSep`. -/
noncomputable def overlap (N₁ N₂ : NuclearProfile) (bSep : ℝ) : ℝ := sorry

/-- The hadronic survival factor: the probability of no inelastic nucleon-nucleon interaction at
separation `bSep`, given the inelastic nucleon-nucleon cross section `sigmaNN`. -/
noncomputable def survival (N₁ N₂ : NuclearProfile) (sigmaNN bSep : ℝ) : ℝ :=
  Real.exp (-(sigmaNN * overlap N₁ N₂ bSep))

/-- The survival factor is a probability. -/
theorem survival_mem_Icc (N₁ N₂ : NuclearProfile) {sigmaNN bSep : ℝ}
    (hs : 0 ≤ sigmaNN) (hoverlap : 0 ≤ overlap N₁ N₂ bSep) :
    survival N₁ N₂ sigmaNN bSep ∈ Set.Icc (0 : ℝ) 1 := sorry

/-- The black-disk idealisation, kept as a separate definition so that the difference between it
and `survival` is a bounded quantity rather than a hidden change of meaning. -/
noncomputable def survivalBlackDisk (N₁ N₂ : NuclearProfile) (bSep : ℝ) : ℝ :=
  if N₁.radius + N₂.radius < bSep then 1 else 0

/-! ## Layer 2: the real-photon limit and vector-meson dominance -/

/-- Vector-meson dominance, as a hypothesis on a photon-proton and a vector-meson-proton cross
section with a given coupling. It is a `Prop` taken as an argument by the theorems that use it;
no definition in this development presupposes it. -/
def VectorMesonDominance (sigmaGammaP sigmaVP : ℝ → ℝ) (alpha coupling : ℝ) : Prop :=
  ∀ W, sigmaGammaP W = (4 * Real.pi * alpha / coupling ^ 2) * sigmaVP W

/-- Under vector-meson dominance the ratio of two photoproduction cross sections is fixed by the
couplings alone. Stated with the hypothesis explicit, so that the conclusion is attributable. -/
theorem ratio_of_vectorMesonDominance
    {sigmaGammaP sigmaV₁ sigmaV₂ : ℝ → ℝ} {alpha g₁ g₂ : ℝ}
    (h₁ : VectorMesonDominance sigmaGammaP sigmaV₁ alpha g₁)
    (h₂ : VectorMesonDominance sigmaGammaP sigmaV₂ alpha g₂) :
    ∀ W, g₂ ^ 2 * sigmaV₁ W = g₁ ^ 2 * sigmaV₂ W := sorry

/-! ## Layer 3: the photon light-cone wave functions and the exclusive amplitude -/

/-- `ε² = z(1-z)Q² + m_f²`, the inverse transverse size scale of the photon fluctuation. -/
noncomputable def epsSq (k : PhotonKin) (z mq : ℝ) : ℝ :=
  z * (1 - z) * k.virtuality + mq ^ 2

/-- The squared transverse photon light-cone wave function, up to the flavour charge factor. -/
noncomputable def psiTransverseSq (k : PhotonKin) (z mq r : ℝ) : ℝ :=
  let e := Real.sqrt (epsSq k z mq)
  (z ^ 2 + (1 - z) ^ 2) * e ^ 2 * (besselK1 (e * r)) ^ 2 + mq ^ 2 * (besselK0 (e * r)) ^ 2

/-- The squared longitudinal photon light-cone wave function, up to the flavour charge factor. -/
noncomputable def psiLongitudinalSq (k : PhotonKin) (z mq r : ℝ) : ℝ :=
  let e := Real.sqrt (epsSq k z mq)
  4 * z ^ 2 * (1 - z) ^ 2 * k.virtuality * (besselK0 (e * r)) ^ 2

/-- The longitudinal photon decouples at the real-photon point. This is the wave-function form of
the statement proved in Layer 2 from the tensor decomposition. -/
theorem psiLongitudinalSq_of_isReal {k : PhotonKin} (hk : k.IsReal) (z mq r : ℝ) :
    psiLongitudinalSq k z mq r = 0 := sorry

/-- The exclusive photoproduction amplitude as a function of momentum transfer, built from the
overlap of the photon wave function with a vector-meson wave function and the dipole amplitude
supplied by `SmallXAndSaturation`. The dipole amplitude is an argument, not a definition here. -/
noncomputable def exclusiveAmplitude
    (psiOverlap : ℝ → ℝ → ℝ) (dipole : ℝ → ℝ → ℂ) (t : ℝ) : ℂ := sorry

/-- The transverse profile: the two-dimensional Fourier transform of the momentum-transfer
amplitude, reduced to its radial `J₀` kernel. -/
noncomputable def transverseProfile (amp : ℝ → ℂ) (bTar : ℝ) : ℂ := sorry

/-- Positive-definiteness of the amplitude as a function on the transverse translation group,
written out rather than imported, so that the hypothesis of the theorem below is visible. -/
def PositiveDefiniteAmplitude (amp : ℝ → ℂ) : Prop :=
  ∀ (n : ℕ) (x : Fin n → ℝ) (c : Fin n → ℂ),
    0 ≤ (∑ i, ∑ j, (starRingEnd ℂ) (c i) * c j * amp (x i - x j)).re

/-- Positivity of the transverse profile is not automatic: it holds exactly when the amplitude is
positive-definite on the transverse translation group. This is Bochner's theorem, available in
`TauCeti.Analysis.Bochner.BochnerTheorem`; the obligation of Layer 3.5 is to transport it to the
radial two-dimensional transform used here. -/
theorem transverseProfile_nonneg_iff (amp : ℝ → ℂ) :
    (∀ bTar, 0 ≤ (transverseProfile amp bTar).re) ↔ PositiveDefiniteAmplitude amp := sorry

/-! ## Layer 4: nuclear form factors, coherent and incoherent photoproduction -/

/-- The spherical Bessel function of order zero, the radial kernel of the three-dimensional
transform. `LightNuclei` builds the family `jₗ`; only `j₀` is used here. -/
noncomputable def sphericalJ0 (x : ℝ) : ℝ := if x = 0 then 1 else Real.sin x / x

/-- The nuclear form factor: the transform of the density, normalised to one at zero momentum
transfer when the density integrates to the mass number. -/
noncomputable def formFactor (N : NuclearProfile) (q : ℝ) : ℝ :=
  (4 * Real.pi / (N.massNumber : ℝ)) *
    ∫ r in Set.Ioi (0 : ℝ), r ^ 2 * sphericalJ0 (q * r) * N.density r

/-- A uniform sphere of radius `R`, normalised to mass number `A`. -/
noncomputable def uniformSphere (A : ℕ) (R : ℝ) : NuclearProfile where
  density := fun r => if r ≤ R then (A : ℝ) * 3 / (4 * Real.pi * R ^ 3) else 0
  radius := R
  massNumber := A

/-- The closed form of the uniform-sphere form factor. -/
theorem formFactor_uniformSphere {A : ℕ} {R q : ℝ} (hR : 0 < R) (hq : q ≠ 0) :
    formFactor (uniformSphere A R) q
      = 3 * (Real.sin (q * R) - q * R * Real.cos (q * R)) / (q * R) ^ 3 := sorry

/-- The diffractive minima are exactly the non-zero solutions of `tan (qR) = qR`. This is the
statement that the positions of the minima measure the nuclear radius. -/
theorem formFactor_uniformSphere_eq_zero_iff {A : ℕ} {R q : ℝ} (hR : 0 < R) (hq : 0 < q) :
    formFactor (uniformSphere A R) q = 0 ↔ Real.tan (q * R) = q * R := sorry

/-- The coherent amplitude in the optical limit: mass number times nucleon amplitude times form
factor. The corrections beyond this limit are separate definitions in Layer 4.2. -/
noncomputable def coherentAmplitudeOptical
    (N : NuclearProfile) (ampN : ℝ → ℂ) (t : ℝ) : ℂ :=
  (N.massNumber : ℂ) * ampN t * (formFactor N (Real.sqrt (-t)) : ℂ)

/-- The incoherent cross section as the variance of the amplitude over nuclear configurations.
The Good–Walker decomposition itself is `Diffraction`; this signature applies it, supplying the
configuration space. -/
noncomputable def incoherentFromVariance
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) (amp : Ω → ℝ → ℂ) (t : ℝ) : ℝ := sorry

/-- A configuration-independent amplitude produces no incoherent cross section: the incoherent
channel measures fluctuation and nothing else. -/
theorem incoherentFromVariance_eq_zero_of_const
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) (f : ℝ → ℂ) (t : ℝ) :
    incoherentFromVariance μ (fun _ => f) t = 0 := sorry

/-! ## Layer 5: two-source interference -/

/-- The parity of the produced system, as a two-case datatype. Carried this way rather than as a
real number constrained by a docstring: with `parity : ℝ` nothing stops a caller passing `0`,
and every downstream statement would then need a `parity = 1 ∨ parity = -1` side condition. -/
inductive Parity where
  /-- Negative parity, as for a vector meson. -/
  | negative : Parity
  /-- Positive parity. -/
  | positive : Parity
  deriving DecidableEq, Repr

/-- The sign carried by a parity. -/
def Parity.sign : Parity → ℝ
  | .negative => -1
  | .positive => 1

/-- The interference weight for two indistinguishable photon sources at separation `bSep`,
producing a system of transverse momentum `delta`. The sign is `-1` for a negative-parity final
state such as a vector meson and `+1` otherwise. -/
noncomputable def interferenceWeight (parity : Parity) (delta bSep : ℝ) : ℝ :=
  2 * (1 + parity.sign * Real.cos (delta * bSep))

/-- The characteristic dip: for a vector meson the interference weight vanishes identically at
zero pair transverse momentum, for every source separation. -/
theorem interferenceWeight_vectorMeson_zero (bSep : ℝ) :
    interferenceWeight .negative 0 bSep = 0 := sorry

/-! ## Layer 6: photon-photon processes -/

/-- The velocity of each lepton in the photon-photon centre-of-mass frame. -/
noncomputable def beta (m W : ℝ) : ℝ := Real.sqrt (1 - 4 * m ^ 2 / W ^ 2)

/-- The Breit–Wheeler total cross section for `γγ → ℓ⁺ℓ⁻`. The closed form is to be derived from
the crossed Compton amplitude, not quoted; the two theorems below are the checks any derivation
must pass. -/
noncomputable def breitWheeler (alpha m W : ℝ) : ℝ := sorry

/-- The process vanishes below threshold. -/
theorem breitWheeler_eq_zero_of_lt_threshold {alpha m W : ℝ} (hW : W < 2 * m) :
    breitWheeler alpha m W = 0 := sorry

/-- The threshold behaviour: the cross section vanishes linearly in the lepton velocity. The
limiting constant is whatever the derivation of `breitWheeler` produces; it is existentially
quantified here rather than quoted, since quoting it would assert a number this file has not
derived. -/
theorem breitWheeler_threshold {alpha m : ℝ} (halpha : 0 < alpha) (hm : 0 < m) :
    ∃ c : ℝ, 0 < c ∧
      Filter.Tendsto (fun W => breitWheeler alpha m W / beta m W)
        (nhdsWithin (2 * m) (Set.Ioi (2 * m))) (nhds c) := sorry

end EpsilonEridaniRoadmaps.Photoproduction

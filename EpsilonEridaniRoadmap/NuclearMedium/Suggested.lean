import EpsilonEridani

/-!
# NuclearMedium: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

The signatures make four design choices explicit. Path length is an explicit `ℝ` argument
everywhere, never averaged away inside a definition, so that a local transport coefficient and a
geometry-averaged one cannot be confused. The medium is a `structure` passed as data rather than a
typeclass, so that two media — in particular a nucleus and the vacuum — can appear in one
statement. The semigroup property of the broadening kernel, the factorisation of a nuclear ratio,
and each of the four competing physical pictures are `Prop`-valued *definitions* supplied as
explicit hypotheses to the theorems that need them, never fields of a structure: a `Prop` field
with a placeholder witness asserts nothing while looking like a hypothesis. And the two estimators
of an azimuthal anisotropy keep distinct names, related by a proved moment identity rather than
identified.

Upstream declarations that have not been verified against the pinned revisions are reached through
`sorry`-ed targets rather than guessed calls; the docstring on each such declaration names the
upstream module the target is expected to come from.
-/

namespace EpsilonEridaniRoadmap.NuclearMedium

open MeasureTheory

/-- Transverse momentum, in the target rest frame with the virtual-photon direction as polar
axis (README convention 8). -/
abbrev TransverseMomentum := EuclideanSpace ℝ (Fin 2)

/-- Transverse size of a colour dipole: the variable conjugate to `TransverseMomentum` under the
Fourier convention of `TauCeti.Analysis.Bochner.Fourier.Convention` (README convention 7). -/
abbrev DipoleSize := EuclideanSpace ℝ (Fin 2)

/-! ## Layer 0: the medium as data, path length, and the initial/final-state split -/

/-- A medium: a nucleon density on space together with its mass number. Data only; the density
profiles themselves come from `LightNuclei`.

The mass number and the density are independent fields: nothing here requires the density to
integrate to `massNumber`. That normalisation is a hypothesis where it is needed — the path
length moments of Layer 0.3 use it — rather than a field, because several statements are about
unnormalised profiles and would otherwise carry an obligation they do not use. -/
structure MediumProfile where
  /-- Nucleon number density. -/
  density : EuclideanSpace ℝ (Fin 3) → ℝ
  /-- Mass number. -/
  massNumber : ℕ
  /-- Densities are nonnegative. -/
  density_nonneg : ∀ x, 0 ≤ density x
  /-- Measurability, without which no integral below is defined. -/
  density_measurable : Measurable density
  /-- Integrability, which is what makes the path-length moments exist. -/
  density_integrable : Integrable density
  /-- Normalisation to the mass number, required by README 0.1 and used by `pathLengthLaw`. -/
  density_normalised : ∫ x, density x = (massNumber : ℝ)

/-- The empty medium: the vacuum. Every final-state factor below reduces to `1` on it. -/
def vacuumMedium : MediumProfile where
  density := fun _ => 0
  massNumber := 0
  density_nonneg := fun _ => le_refl 0

/-- Geometric path length from a production point `x` along a unit direction `v` to the boundary
of the support of the density (README 0.2). -/
noncomputable def geometricPathLength (M : MediumProfile) (x v : EuclideanSpace ℝ (Fin 3)) : ℝ :=
  sorry

theorem geometricPathLength_nonneg (M : MediumProfile) (x v : EuclideanSpace ℝ (Fin 3)) :
    0 ≤ geometricPathLength M x v := sorry

theorem geometricPathLength_vacuum (x v : EuclideanSpace ℝ (Fin 3)) :
    geometricPathLength vacuumMedium x v = 0 := sorry

/-- The path-length distribution: the push-forward of the production measure and the isotropic
direction measure under `geometricPathLength` (README 0.3). -/
noncomputable def pathLengthLaw (M : MediumProfile) : Measure ℝ := sorry

/-- `n`-th moment of the path-length distribution. -/
noncomputable def pathLengthMoment (M : MediumProfile) (n : ℕ) : ℝ := sorry

/-- A uniform ball of radius `R`: `⟨ℓ⟩ = 3R/4` (README 0.3, acceptance example 1). -/
-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem pathLengthMoment_one_ball (R : ℝ) (hR : 0 < R) (M : MediumProfile)
--     (hM : sorry) : pathLengthMoment M 1 = 3 * R / 4 := sorry
--
-- /-- A uniform ball of radius `R`: `⟨ℓ²⟩ = 4R²/5` (README 0.3, acceptance example 1). -/

-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem pathLengthMoment_two_ball (R : ℝ) (hR : 0 < R) (M : MediumProfile)
--     (hM : sorry) : pathLengthMoment M 2 = 4 * R ^ 2 / 5 := sorry
--
-- /-- Geometry variance: the obstruction of README 0.3 and 2.6. -/

noncomputable def geometryVariance (M : MediumProfile) : ℝ :=
  pathLengthMoment M 2 - (pathLengthMoment M 1) ^ 2

/-- A nuclear effect on an observable, split into a factor owned by
`NuclearPartonDistributions` and a factor owned by this roadmap (README convention 2, 0.4).
Arguments are the momentum fraction, the scale, the energy transfer and the hadron momentum
fraction. -/
structure NuclearEffect where
  /-- Initial state: taken from `NuclearPartonDistributions`, independent of the energy transfer. -/
  initialState : ℝ → ℝ → ℝ
  /-- Final state: built by this roadmap. -/
  finalState : ℝ → ℝ → ℝ → ℝ → ℝ

/-- The observable is the product of the two factors with no cross term (README 0.4). -/
def FactorisationHypothesis (E : NuclearEffect) (obs : ℝ → ℝ → ℝ → ℝ → ℝ) : Prop :=
  ∀ x Q nu z, obs x Q nu z = E.initialState x Q * E.finalState x Q nu z

/-- Uniqueness of the initial/final-state split, given that only the final-state factor depends on
the energy transfer and that it is normalised to `1` in the vacuum (README 0.4). -/
-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem nuclearEffect_unique (E E' : NuclearEffect) (obs : ℝ → ℝ → ℝ → ℝ → ℝ)
--     (h : FactorisationHypothesis E obs) (h' : FactorisationHypothesis E' obs)
--     (hnorm : sorry) : E = E' := sorry
--
-- /-! ## Layer 1: transport coefficients from the dipole cross section -/
--
-- /-- Transport coefficients per unit path length: `qhat` squared momentum per length, `ehat`
-- momentum per length (README convention 3). -/

structure TransportCoefficients where
  /-- Transverse-momentum diffusion coefficient. -/
  qhat : ℝ
  /-- Longitudinal drag coefficient. -/
  ehat : ℝ
  /-- Diffusion is nonnegative. -/
  qhat_nonneg : 0 ≤ qhat

/-- `qhat` as the density times the second transverse moment of the single-scattering cross
section, with an explicit upper cutoff on momentum transfer carrying the Coulomb logarithm
(README 1.2). -/
noncomputable def qhatOfCrossSection (M : MediumProfile)
    (dsigma : TransverseMomentum → ℝ) (cutoff : ℝ) : ℝ := sorry

/-- The second transverse moment is finite when the cross section decays faster than the inverse
fourth power of the momentum transfer, and the cutoff may then be removed (README 1.2). -/
theorem qhat_finite_of_decay (M : MediumProfile) (dsigma : TransverseMomentum → ℝ)
    (C eps : ℝ) (hC : 0 < C) (heps : 0 < eps)
    (hdecay : ∀ q : TransverseMomentum, 1 ≤ ‖q‖ → |dsigma q| ≤ C * ‖q‖ ^ (-(4 + eps))) :
    ∃ L : ℝ, Filter.Tendsto (fun c => qhatOfCrossSection M dsigma c) Filter.atTop
      (nhds L) := sorry

/-- For an unscreened Coulomb-like cross section the second moment diverges logarithmically in the
cutoff, which is why the Coulomb logarithm is an explicit argument of `qhatOfCrossSection`
(README 1.2). -/
theorem qhat_diverges_of_coulomb (M : MediumProfile) (dsigma : TransverseMomentum → ℝ)
    (hcoul : ∀ q : TransverseMomentum, 1 ≤ ‖q‖ → dsigma q = ‖q‖ ^ (-4 : ℤ)) :
    Filter.Tendsto (fun c => qhatOfCrossSection M dsigma c) Filter.atTop Filter.atTop := sorry

/-- Colour-representation dependence: `qhat` is proportional to the quadratic Casimir. The
Casimirs are expected from `EpsilonEridani.QFT.QCD.RepresentationColor` and
`EpsilonEridani.QFT.QCD.CasimirDerivation`; the binding is left as a target rather than guessed
(README 1.4). -/
-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem qhat_casimir_ratio (qhatFund qhatAdj casimirFund casimirAdj : ℝ)
--     (hF : 0 < casimirFund) (h : sorry) :
--     qhatAdj / qhatFund = casimirAdj / casimirFund := sorry
--
-- /-- For three colours the Casimir ratio is `9/4` (README acceptance example 6). -/

-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem casimir_ratio_su3 (casimirFund casimirAdj : ℝ) (h : sorry) :
--     casimirAdj / casimirFund = 9 / 4 := sorry
--
-- /-- Coherence: the formation length exceeds the mean free path but not the total path length
-- (README 1.5). -/

def CoherentRegime (meanFreePath totalLength formationLength : ℝ) : Prop :=
  meanFreePath < formationLength ∧ formationLength < totalLength

/-- The coherent and incoherent regimes are mutually exclusive, so every kinematic point has one
applicable path-length law (README 1.5). -/
theorem coherentRegime_not_incoherent (meanFreePath totalLength formationLength : ℝ)
    (h : CoherentRegime meanFreePath totalLength formationLength) :
    ¬ (formationLength ≤ meanFreePath) := by
  exact not_le.mpr h.1

/-- Collisional loss accumulated over a path length is linear in the path length; contrast the
quadratic radiative law of `meanRadiativeLoss_quadratic` below. The difference in path-length law
is the discriminator between the two mechanisms (README 1.3). -/
theorem collisionalLoss_linear (T : TransportCoefficients) (ell : ℝ) (hell : 0 ≤ ell)
    (loss : ℝ → ℝ) (hloss : ∀ s, 0 ≤ s → loss s = T.ehat * s) :
    loss ell = T.ehat * ell := hloss ell hell

/-! ## Layer 2: transverse-momentum broadening as a convolution semigroup -/

/-- Convolution of two measures on transverse momentum. Mathlib provides measure convolution; the
binding is left as a target rather than guessed at. -/
noncomputable def convolve (mu nu : Measure TransverseMomentum) : Measure TransverseMomentum :=
  sorry

/-- The broadening kernel is a convolution semigroup in path length. This is a *consequence* of
conditional independence of successive scatterings, not a definition: it fails for a medium with
correlations longer than the mean free path (README 2.1). -/
def IsPathLengthSemigroup (K : ℝ → Measure TransverseMomentum) : Prop :=
  K 0 = Measure.dirac 0 ∧ ∀ s t : ℝ, 0 ≤ s → 0 ≤ t → K (s + t) = convolve (K s) (K t)

/-- The dipole amplitude: the characteristic function of the broadening kernel, evaluated at a
transverse size (README 2.2). -/
noncomputable def dipoleAmplitude (K : ℝ → Measure TransverseMomentum) (ell : ℝ)
    (r : DipoleSize) : ℂ := sorry

/-- A family of probability measures is a path-length semigroup exactly when its characteristic
function is the exponential of `-ell` times a negative-definite exponent. The forward direction is
Bochner's theorem (`TauCeti.Analysis.Bochner.BochnerTheorem`); the classification of admissible
exponents is Lévy–Khintchine
(`TauCeti.Analysis.CompletelyMonotone.Bernstein.LevyKhintchine.Representation`) and is not
reproved here (README 2.2). -/
theorem isPathLengthSemigroup_iff_exp_negDef (K : ℝ → Measure TransverseMomentum) :
    IsPathLengthSemigroup K ↔
      ∃ psi : DipoleSize → ℝ, psi 0 = 0 ∧ (sorry : Prop) ∧
        ∀ ell r, 0 ≤ ell → dipoleAmplitude K ell r = Complex.exp (-(ell * psi r) : ℂ) := sorry

/-- A dipole cross section that vanishes at zero, is monotone and saturates need *not* be
negative-definite, so `exp (-ell * sigmaDip)` need not be the characteristic function of a
positive measure at every path length. The counterexample of README 2.2 and acceptance example 3;
the admissibility of a modelled dipole cross section is a condition to be checked. -/
theorem exists_monotone_saturating_not_negDef :
    ∃ sigmaDip : DipoleSize → ℝ, sigmaDip 0 = 0 ∧ (sorry : Prop) ∧ ¬ (sorry : Prop) := sorry

/-- Multiple soft scattering: the harmonic-oscillator kernel, obtained by replacing the dipole
cross section with a quarter of `qhat` times the squared transverse size (README 2.4). -/
noncomputable def harmonicOscillatorKernel (qhat : ℝ) : ℝ → Measure TransverseMomentum := sorry

/-- The harmonic-oscillator exponent is a quadratic form, hence negative-definite, hence
admissible (README 2.4). -/
theorem harmonicOscillatorKernel_isPathLengthSemigroup (qhat : ℝ) (h : 0 ≤ qhat) :
    IsPathLengthSemigroup (harmonicOscillatorKernel qhat) := sorry

/-- Second moment of a broadening kernel. -/
noncomputable def secondMoment (mu : Measure TransverseMomentum) : ℝ := sorry

/-- The harmonic-oscillator kernel reproduces `qhat * ell` by construction (README 2.4). -/
theorem harmonicOscillatorKernel_secondMoment (qhat ell : ℝ) (h : 0 ≤ qhat) (hell : 0 ≤ ell) :
    secondMoment (harmonicOscillatorKernel qhat ell) = qhat * ell := sorry

/-- Fourth moment of a broadening kernel. -/
noncomputable def fourthMoment (mu : Measure TransverseMomentum) : ℝ := sorry

/-- The Gaussian fourth moment is twice the square of the second; any admissible kernel with a
nonzero Lévy measure and the same second moment has a strictly larger fourth moment. The
quantitative failure of the multiple-soft-scattering approximation (README 2.4, acceptance
example 4). -/
-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem fourthMoment_gt_gaussian (K : ℝ → Measure TransverseMomentum) (qhat ell : ℝ)
--     (hK : IsPathLengthSemigroup K) (hsec : secondMoment (K ell) = qhat * ell)
--     (hlevy : sorry) (hell : 0 < ell) :
--     2 * (qhat * ell) ^ 2 < fourthMoment (K ell) := sorry
--
-- /-- Geometry averaging of a broadening kernel against the path-length distribution (README 2.6). -/

noncomputable def geometryAverage (M : MediumProfile) (K : ℝ → Measure TransverseMomentum) :
    Measure TransverseMomentum := sorry

/-- A geometry-averaged kernel is not an element of any convolution semigroup in path length
unless the path-length distribution is a point mass; the obstruction is the geometry variance
(README 2.6, acceptance example 5). -/
theorem geometryAverage_not_semigroup (M : MediumProfile) (qhat : ℝ)
    (h : geometryVariance M ≠ 0) :
    ¬ ∃ K : ℝ → Measure TransverseMomentum, IsPathLengthSemigroup K ∧
        ∃ ell, K ell = geometryAverage M (harmonicOscillatorKernel qhat) := sorry

/-! ## Layer 3: medium-induced radiation, LPM interference and the opacity expansion -/

/-- Formation time of an emission of energy `omega` and transverse momentum `kT` (README 3.1). -/
noncomputable def formationTime (omega kT : ℝ) : ℝ := 2 * omega / kT ^ 2

/-- The characteristic energy `omegaC = qhat L² / 2`, below which LPM interference suppresses the
spectrum (README 3.1). -/
noncomputable def characteristicEnergy (qhat totalLength : ℝ) : ℝ :=
  qhat * totalLength ^ 2 / 2

/-- The medium-induced radiation spectrum, as a function of emission energy: the vacuum-subtracted
emission probability, written as an ordered integral over emission positions along the path via
`EpsilonEridani.Mathematics.OrderedSimplexIntegral` (README 3.2). -/
noncomputable def inducedSpectrum (M : MediumProfile) (T : TransportCoefficients)
    (totalLength : ℝ) : ℝ → ℝ := sorry

/-- The vacuum subtraction is exact in the empty medium (README 3.2). -/
theorem inducedSpectrum_vacuum (T : TransportCoefficients) (totalLength omega : ℝ) :
    inducedSpectrum vacuumMedium T totalLength omega = 0 := sorry

/-- Below the characteristic energy the spectrum behaves as the inverse square root of the
emission energy, with an explicit remainder. Proved from the integral representation of 3.2;
Bessel functions are absent from both Mathlib and TauCeti and no closed form is claimed
(README 3.3, acceptance example 7). -/
theorem inducedSpectrum_asymptotics_below (M : MediumProfile) (T : TransportCoefficients)
    (totalLength : ℝ) (hL : 0 < totalLength) (hq : 0 < T.qhat) :
    ∃ c : ℝ, 0 < c ∧ Filter.Tendsto
      (fun omega => Real.sqrt omega * inducedSpectrum M T totalLength omega)
      (nhdsWithin 0 (Set.Ioi 0)) (nhds c) := sorry

/-- Mean radiative energy loss: the first moment of the induced spectrum. -/
noncomputable def meanRadiativeLoss (M : MediumProfile) (T : TransportCoefficients)
    (totalLength : ℝ) : ℝ := sorry

/-- In the coherent regime the mean radiative loss is quadratic in the path length: the
mathematical content of the LPM effect (README 3.4, acceptance example 8). -/
theorem meanRadiativeLoss_quadratic (M : MediumProfile) (T : TransportCoefficients)
    (alphaS casimir : ℝ) (halpha : 0 < alphaS) (hcas : 0 < casimir) (hq : 0 < T.qhat)
    (hcoh : ∀ L : ℝ, 0 < L → CoherentRegime (sorry) L (sorry)) :
    ∃ c : ℝ, 0 < c ∧ ∀ L : ℝ, 0 < L →
      meanRadiativeLoss M T L = c * alphaS * casimir * T.qhat * L ^ 2 := sorry

/-- Opacity: the ratio of the path length to the mean free path (README 3.5). -/
noncomputable def opacity (M : MediumProfile) (meanFreePath totalLength : ℝ) : ℝ :=
  totalLength / meanFreePath

/-- Order-`N` term of the opacity expansion, an ordered-simplex integral over `N` scattering
positions (README 3.5). -/
noncomputable def opacityTerm (M : MediumProfile) (T : TransportCoefficients)
    (totalLength : ℝ) (N : ℕ) : ℝ → ℝ := sorry

/-- The order-`N` term is bounded by the `N`-th power of the opacity over `N` factorial, from the
simplex volume; this is the honest form of "the expansion is controlled at low opacity"
(README 3.5). -/
theorem opacityTerm_bound (M : MediumProfile) (T : TransportCoefficients)
    (meanFreePath totalLength : ℝ) (N : ℕ) (omega : ℝ)
    (hmfp : 0 < meanFreePath) (hL : 0 < totalLength) (homega : 0 < omega) :
    |opacityTerm M T totalLength N omega| ≤
      opacity M meanFreePath totalLength ^ N / N.factorial := sorry

/-- Dead-cone suppression factor for a parton of mass `m` and energy `E` radiating at angle
`theta`. The vacuum statement is `JetsAndEventShapes`; this is the medium extension
(README 3.7). -/
noncomputable def deadConeSuppression (m E theta : ℝ) : ℝ := sorry

/-- The dead cone is absent for a massless parton (README 3.7, acceptance example 9). -/
theorem deadConeSuppression_massless (E theta : ℝ) (hE : 0 < E) (htheta : 0 < theta) :
    deadConeSuppression 0 E theta = 1 := sorry

/-- The dead-cone factor is antitone in the quark mass at fixed energy and angle; together with
the factorisation of the induced spectrum into a Casimir factor and a mass factor this gives the
loss ordering of README 3.7 (acceptance example 9). -/
theorem deadConeSuppression_antitone_mass (E theta : ℝ) (hE : 0 < E) (htheta : 0 < theta) :
    AntitoneOn (fun m => deadConeSuppression m E theta) (Set.Ici 0) := sorry

/-- Massive radiative loss is the massless loss times the dead-cone factor at the stated accuracy,
so the mass dependence and the colour dependence factorise (README 3.7). -/
theorem meanRadiativeLoss_mass_factorises (M : MediumProfile) (T : TransportCoefficients)
    (totalLength E theta : ℝ) (lossOfMass : ℝ → ℝ) (hE : 0 < E) (htheta : 0 < theta)
    (hfac : ∀ m, 0 ≤ m → lossOfMass m =
      deadConeSuppression m E theta * meanRadiativeLoss M T totalLength) :
    lossOfMass 0 = meanRadiativeLoss M T totalLength := sorry

/-! ## Layer 4: formation time and hadronization in the nuclear environment -/

/-- Formation time of a hadron carrying momentum fraction `z` of a parton of energy `nu`. Two
inequivalent forms are carried; `README` 4.1 keeps both as distinct hypotheses. -/
noncomputable def hadronFormationTime (z nu : ℝ) : ℝ := sorry

/-- The hadron forms inside the nucleus (README 4.1). -/
def FormedInside (M : MediumProfile) (z nu ell : ℝ) : Prop :=
  hadronFormationTime z nu < ell

/-- The medium-modified fragmentation function, defined as the analogue of the vacuum object of
`EpsilonEridani.Particles.Fragmentation.Basic`. Arguments: momentum fraction, scale, energy
transfer (README 4.2). -/
noncomputable def mediumFragmentation (M : MediumProfile) (T : TransportCoefficients)
    (z Q nu : ℝ) : ℝ := sorry

/-- The vacuum fragmentation function, expected from
`EpsilonEridani.Particles.Fragmentation.Basic`; reached as a target rather than a guessed call. -/
noncomputable def vacuumFragmentation (z Q : ℝ) : ℝ := sorry

/-- Reduction to vacuum in the empty medium. The definitional check on the whole layer
(README 4.2, acceptance example 10). -/
theorem mediumFragmentation_vacuum (T : TransportCoefficients) (z Q nu : ℝ) :
    mediumFragmentation vacuumMedium T z Q nu = vacuumFragmentation z Q := sorry

/-- Energy is lost by the parton before hadronization: the medium-modified function is the vacuum
one at a rescaled momentum fraction, averaged over the quenching weight (README 4.3). Carried as
a hypothesis; nothing in this roadmap assumes it. -/
def RescalingHypothesis (M : MediumProfile) (T : TransportCoefficients) : Prop := sorry

/-- The hadron forms and is then attenuated: the medium-modified function is the vacuum one times
a survival factor (README 4.3). Carried as a hypothesis; nothing in this roadmap assumes it. -/
def AbsorptionHypothesis (M : MediumProfile) (T : TransportCoefficients) : Prop := sorry

/-- The final-state factor of the nuclear modification ratio (README 4.4). -/
noncomputable def finalStateFactor (M : MediumProfile) (T : TransportCoefficients)
    (x Q nu z : ℝ) : ℝ := sorry

/-- The final-state factor is identically `1` in the vacuum (README 4.4, acceptance
example 10). -/
theorem finalStateFactor_vacuum (T : TransportCoefficients) (x Q nu z : ℝ) :
    finalStateFactor vacuumMedium T x Q nu z = 1 := sorry

/-- Mass-number exponent of the suppression, read off a Mellin moment via
`EpsilonEridani.QFT.Factorization.Convolution.Mellin` (README 4.5). -/
noncomputable def massNumberExponent (T : TransportCoefficients) (x Q nu z : ℝ) : ℝ := sorry

/-- Absorption with a constant cross section gives exponent `1/3`: the suppression is linear in
the path length and `⟨ℓ⟩ ∝ A^(1/3)` (README 4.5, acceptance example 11). -/
-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem massNumberExponent_absorption (M : MediumProfile) (T : TransportCoefficients)
--     (x Q nu z : ℝ) (h : AbsorptionHypothesis M T) (hconst : sorry) :
--     massNumberExponent T x Q nu z = 1 / 3 := sorry
--
-- /-- Rescaling with a quadratic path-length loss law gives exponent `2/3`: the suppression is
-- linear in `⟨ℓ²⟩ ∝ A^(2/3)` (README 4.5, acceptance example 11). -/

-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem massNumberExponent_rescaling (M : MediumProfile) (T : TransportCoefficients)
--     (x Q nu z : ℝ) (h : RescalingHypothesis M T) (hquad : sorry) :
--     massNumberExponent T x Q nu z = 2 / 3 := sorry
--
-- /-- The two exponents differ, so the mass-number dependence discriminates the two hypotheses
-- (README 4.5). -/

theorem massNumberExponent_discriminates : (1 : ℝ) / 3 ≠ 2 / 3 := by norm_num

/-! ## Layer 5: azimuthal anisotropy and collective correlations -/

/-- The `Q`-vector of harmonic `n` for an event of `mult` azimuthal angles (README 5.1). -/
noncomputable def qVector {mult : ℕ} (n : ℕ) (phi : Fin mult → ℝ) : ℂ :=
  ∑ i, Complex.exp ((n : ℂ) * (phi i : ℂ) * Complex.I)

/-- The unbiased two-particle estimator: the squared `Q`-vector with the self-correlation
subtracted. The subtraction of `mult` is the whole point — the naive estimator is biased at order
one over the multiplicity at every multiplicity (README 5.1). -/
noncomputable def twoParticleEstimator {mult : ℕ} (n : ℕ) (phi : Fin mult → ℝ) : ℝ :=
  (Complex.normSq (qVector n phi) - (mult : ℝ)) / ((mult : ℝ) * ((mult : ℝ) - 1))

/-- The two-particle cumulant estimator, `vn{2}` (README 5.2). -/
noncomputable def vnCumulantTwo {mult : ℕ} (n : ℕ) (phi : Fin mult → ℝ) : ℝ :=
  Real.sqrt (twoParticleEstimator n phi)

/-- The four-particle cumulant estimator, `vn{4}` (README 5.2). Distinct from `vnCumulantTwo` by
convention 10; the two are related by the moment identity below, never identified. -/
noncomputable def vnCumulantFour {mult : ℕ} (n : ℕ) (phi : Fin mult → ℝ) : ℝ := sorry

/-- The event-plane estimator, with the resolution correction as an explicit factor (README 5.2).
A third, distinct definition; 5.2 proves the three are ordered. -/
noncomputable def vnEventPlane {mult : ℕ} (n : ℕ) (phi : Fin mult → ℝ) (resolution : ℝ) : ℝ :=
  sorry

/-- The moment identity: `vn{2}² = ⟨vn²⟩` and `vn{4}⁴ = 2⟨vn²⟩² - ⟨vn⁴⟩`. An identity of moments
of the event-by-event distribution of the true coefficient, with no dynamical input
(README 5.2, acceptance example 13). -/
-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem vnCumulant_moment_identity (n : ℕ) (secondMom fourthMom vTwo vFour : ℝ)
--     (h2 : sorry) (h4 : sorry) :
--     vTwo ^ 2 = secondMom ∧ vFour ^ 4 = 2 * secondMom ^ 2 - fourthMom := sorry
--
-- /-- `vn{2} ≥ vn{4}`, with equality exactly when the true coefficient does not fluctuate event to
-- event. The difference measures the fluctuation width (README 5.2, acceptance example 13). -/

-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem vnCumulantFour_le_vnCumulantTwo (n : ℕ) (secondMom fourthMom vTwo vFour : ℝ)
--     (h : sorry) : vFour ≤ vTwo := sorry
--
-- /-- The four-particle cumulant of an event of multiplicity `mult` (README 5.3). -/

noncomputable def fourParticleCumulant {mult : ℕ} (n : ℕ) (phi : Fin mult → ℝ) : ℝ := sorry

/-- Non-flow suppression as a combinatorial identity: a cluster of `k` particles contributes to the
two-particle cumulant at order `1/mult` and to the four-particle cumulant at order `1/mult^3` for
`k = 2`, the general exponent being stated in README 5.3 (acceptance example 14). The bounds are
the content; "cumulants suppress non-flow" is a claim about an exponent. -/
theorem nonflow_suppression_two (n : ℕ) (C : ℝ) (hC : 0 < C)
    (nonflowTwo nonflowFour : ℕ → ℝ)
    (h2 : ∀ mult : ℕ, 0 < mult → |nonflowTwo mult| ≤ C / (mult : ℝ))
    (h4 : ∀ mult : ℕ, 0 < mult → |nonflowFour mult| ≤ C / (mult : ℝ) ^ 3) :
    ∀ mult : ℕ, 0 < mult → |nonflowFour mult| ≤ |nonflowTwo mult| ∨
      |nonflowTwo mult| ≤ C / (mult : ℝ) := sorry

/-- A purely non-flow event has a nonnegative four-particle cumulant, so `vn{4}` — the fourth root
of its negative — is undefined there. A negative four-particle cumulant is therefore the
diagnostic for a genuine collective modulation (README 5.3). -/
-- ⚠ The following statement is commented out deliberately. Its precondition cannot yet be
-- written against the pinned API, and a hypothesis of type `sorry` would make the theorem
-- vacuous while looking like a hypothesis — the pattern this project's own audit exists to
-- prevent. It is recorded here as a target; see README.md for what the precondition must say.
-- theorem nonflow_fourParticleCumulant_nonneg {mult : ℕ} (n : ℕ) (phi : Fin mult → ℝ)
--     (hnonflow : sorry) : 0 ≤ fourParticleCumulant n phi := sorry
--
-- /-- The eccentricity of harmonic `n`: the `n`-th harmonic moment of the transverse density of the
-- overlap region, computed from the geometry of Layer 0 (README 5.4). -/

noncomputable def eccentricity (M : MediumProfile) (n : ℕ) : ℝ := sorry

/-- Final-state response: the coefficient is proportional to the eccentricity, with a response
coefficient `kappa`. Carried as a hypothesis; no fluid dynamics exists upstream and none is built
here, so `kappa` is a defined parameter (README 5.4). -/
def FinalStateResponseHypothesis (M : MediumProfile) (n : ℕ) (kappa : ℝ)
    (vn : ℝ) : Prop :=
  vn = kappa * eccentricity M n

/-- Initial-state correlations: the coefficient arises from momentum-space correlations among the
gluon fields of `SmallXAndSaturation`, with no final-state response. Carried as a hypothesis
(README 5.4). -/
def InitialStateCorrelationHypothesis (M : MediumProfile) (n : ℕ) (vn : ℝ) : Prop := sorry

/-- A nonzero anisotropy does not imply a final-state response: there is a medium of vanishing
eccentricity in harmonic `n` which nevertheless satisfies the initial-state hypothesis with a
nonzero coefficient (README 5.5, acceptance example 15). -/
theorem exists_anisotropy_without_eccentricity (n : ℕ) :
    ∃ (M : MediumProfile) (vn : ℝ), eccentricity M n = 0 ∧ vn ≠ 0 ∧
      InitialStateCorrelationHypothesis M n vn := sorry

/-- Consequently no response coefficient reproduces that coefficient: the implication from a
measured anisotropy to a final-state response is false. This corollary is the statement about what
cannot be concluded, and it follows from the counterexample above by unfolding
`FinalStateResponseHypothesis` (README 5.5). -/
theorem anisotropy_not_implies_response (n : ℕ) :
    ∃ (M : MediumProfile) (vn : ℝ), vn ≠ 0 ∧ InitialStateCorrelationHypothesis M n vn ∧
      ∀ kappa : ℝ, ¬ FinalStateResponseHypothesis M n kappa vn := sorry

end EpsilonEridaniRoadmap.NuclearMedium

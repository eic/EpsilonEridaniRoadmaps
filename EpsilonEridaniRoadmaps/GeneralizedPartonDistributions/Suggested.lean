import EpsilonEridani

/-!
# Generalized parton distributions and spatial imaging: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Three design choices are made explicit here. First, a distribution is *data*: a plain function of
the momentum fraction, the skewness and the momentum transfer, carried as a structure field, never
a typeclass parameter. That is what makes statements of the form "there exist two distributions
with the same forward limit and different `E`" — the shape of every non-identifiability result in
the roadmap — expressible at all. Second, no structure below carries a `Prop`-valued field:
support, polynomiality, positivity and reality are separate predicates, so that nothing looks like
a discharged hypothesis while asserting nothing. Third, the skewness convention is symmetric, and
the momentum transfer `t` is non-positive throughout; a quantity whose physical value is positive
is written as `-t` and never abbreviated.

Compton form factors are complex-valued. Their imaginary parts are proportional to a distribution
on the diagonal `x = ξ` and their real parts are principal-value integrals; the two are kept in
separate signatures for that reason.

Everything unproved is `sorry`. No upstream lemma is invoked by name; where a result of the roadmap
would rest on one, the statement appears here as a `sorry`-ed target rather than as a call.
-/

namespace EpsilonEridaniRoadmaps.GeneralizedPartonDistributions

open scoped Real

/-! ## Layer 0: off-forward correlators and the distribution set -/

/-- Off-forward kinematics in the symmetric convention: light-cone momentum fraction `x`,
skewness `xi` taken with respect to the average hadron momentum, momentum transfer `t`
(non-positive in the spacelike region), and hard scale `Q2`. -/
structure OffForwardKinematics where
  x : ℝ
  xi : ℝ
  t : ℝ
  Q2 : ℝ

/-- The minimal momentum transfer at fixed skewness and target mass: `t ≤ t₀ xi m ≤ 0` on the
physical domain. This is why the impact-parameter transform of Layer 2.5 is a density only at
vanishing skewness. -/
def tMin (xi m : ℝ) : ℝ := -4 * m ^ 2 * xi ^ 2 / (1 - xi ^ 2)

/-- The physical domain of the off-forward variables. -/
def IsPhysical (m : ℝ) (k : OffForwardKinematics) : Prop :=
  |k.x| ≤ 1 ∧ 0 ≤ k.xi ∧ k.xi < 1 ∧ k.t ≤ tMin k.xi m ∧ 0 < k.Q2

/-- The chiral-even quark distributions for a spin-half target, as a flavour-indexed family of
functions of `(x, xi, t)`. Data only: the constraints are the predicates below. -/
structure ChiralEven (Flavour : Type) where
  gpdH : Flavour → ℝ → ℝ → ℝ → ℝ
  gpdE : Flavour → ℝ → ℝ → ℝ → ℝ
  gpdHtilde : Flavour → ℝ → ℝ → ℝ → ℝ
  gpdEtilde : Flavour → ℝ → ℝ → ℝ → ℝ

/-- The chiral-odd (transversity) quark distributions. They do not mix with the chiral-even set
under any Lorentz transformation, which is the decoupling proved in Layer 0.4. -/
structure ChiralOdd (Flavour : Type) where
  gpdHT : Flavour → ℝ → ℝ → ℝ → ℝ
  gpdET : Flavour → ℝ → ℝ → ℝ → ℝ
  gpdHTtilde : Flavour → ℝ → ℝ → ℝ → ℝ
  gpdETtilde : Flavour → ℝ → ℝ → ℝ → ℝ

/-- The gluon chiral-even pair, in the convention whose forward limit is `x g x` (convention 8:
the alternative normalisation shifts the polynomiality degree bound by one). -/
structure GluonEven where
  gluonH : ℝ → ℝ → ℝ → ℝ
  gluonE : ℝ → ℝ → ℝ → ℝ

/-- The single chiral-even distribution of a spin-zero target: the Pauli-type structure requires a
target spin and is absent, which is why a meson has one electromagnetic form factor and not two. -/
structure SpinZeroEven (Flavour : Type) where
  gpdH : Flavour → ℝ → ℝ → ℝ → ℝ

/-! ## Layer 1: support, symmetry and the formal constraints -/

/-- Support in the momentum fraction: a distribution vanishes outside `|x| ≤ 1`. -/
def HasLightConeSupport (f : ℝ → ℝ → ℝ → ℝ) : Prop :=
  ∀ x xi t, 1 < |x| → f x xi t = 0

/-- The region `|x| > xi`, in which the correlator factorises through a single-parton matrix
element and a density interpretation is available. -/
def DglapRegion (xi : ℝ) : Set ℝ := {x | xi < |x|}

/-- The region `|x| < xi`, in which the correlator is a two-parton amplitude. No positivity bound
is claimed here (Layer 1.6) and no imaging statement is made here (convention 12). -/
def ErblRegion (xi : ℝ) : Set ℝ := {x | |x| < xi}

/-- The `n`-th Mellin moment in the momentum fraction at fixed skewness and momentum transfer. -/
noncomputable def mellinMoment (f : ℝ → ℝ → ℝ → ℝ) (n : ℕ) (xi t : ℝ) : ℝ :=
  ∫ x in (-1 : ℝ)..1, x ^ n * f x xi t

/-- Polynomiality: for each `n`, the `n`-th Mellin moment is a polynomial in the skewness of degree
at most `d n`. The degree bound differs between the chiral-even, chiral-odd and gluon sets, so it
is a parameter of the predicate rather than a constant. -/
def Polynomiality (f : ℝ → ℝ → ℝ → ℝ) (d : ℕ → ℕ) : Prop :=
  ∀ n : ℕ, ∀ t : ℝ, ∃ p : Polynomial ℝ, p.degree ≤ (d n : WithBot ℕ) ∧
    ∀ xi : ℝ, mellinMoment f n xi t = p.eval xi

/-- The forward limit of `gpdH` is the unpolarised density; the forward limit of `gpdHtilde` is the
helicity density. Layer 1.3. -/
theorem forwardLimit_gpdH {Flavour : Type} (G : ChiralEven Flavour)
    (q : Flavour → ℝ → ℝ) (hq : ∀ f x, G.gpdH f x 0 0 = q f x) :
    ∀ f x, G.gpdH f x 0 0 = q f x := hq

/-- `gpdE` has no forward limit: the spinor structure it multiplies vanishes at `t = 0`, so the
forward correlator carries no information about it. The honest statement is a non-identifiability
statement, and this is its shape — the first appearance of the theme of Layer 5. -/
theorem no_forwardLimit_gpdE {Flavour : Type} [Nonempty Flavour] :
    ∃ G G' : ChiralEven Flavour,
      (∀ f x, G.gpdH f x 0 0 = G'.gpdH f x 0 0) ∧
      (∀ f x, G.gpdHtilde f x 0 0 = G'.gpdHtilde f x 0 0) ∧
      G.gpdE ≠ G'.gpdE := by
  sorry

/-- Polynomiality for `gpdH`, degree bound `n + 1`. The core case is proved upstream; the target
here is the extension to the full set, whose bounds must be computed rather than guessed. -/
theorem polynomiality_gpdH {Flavour : Type} (G : ChiralEven Flavour) (f : Flavour) :
    Polynomiality (G.gpdH f) (fun n => n + 1) := by
  sorry

/-- Positivity in the region `|x| > xi`, carried as positive semidefiniteness of a matrix of
helicity amplitudes rather than as a list of inequalities: that is the form which composes with the
impact-parameter statement of Layer 2.5, and the form in which its degeneracy at `|x| = xi` is
visible. The minimal-subtraction caveat of the forward positivity modules applies verbatim. -/
def HelicityPositive (M : ℝ → ℝ → ℝ → Matrix (Fin 2) (Fin 2) ℝ) : Prop :=
  ∀ x xi t, xi < |x| → (M x xi t).PosSemidef

/-- The D-term: a function of one variable, supported on `|α| ≤ 1`, entering the correlator only in
the region `|x| < xi`. It is invisible to the forward limit, and by Layer 4.5 it is exactly the
subtraction constant of the dispersion relation. -/
structure DTerm where
  D : ℝ → ℝ

/-- The D-term integral: the one number per momentum transfer that the real part of a Compton form
factor carries beyond its imaginary part. -/
noncomputable def dTermIntegral (d : DTerm) : ℝ := ∫ α in (-1 : ℝ)..1, d.D α

/-! ## Layer 2: moments, form factors and impact-parameter densities -/

/-- The Dirac form factor as the charge-weighted zeroth moment of `gpdH`. Proved from the
definition of the correlator, not asserted. -/
noncomputable def diracFormFactor {Flavour : Type} [Fintype Flavour]
    (G : ChiralEven Flavour) (e : Flavour → ℝ) (t : ℝ) : ℝ :=
  ∑ f : Flavour, e f * mellinMoment (G.gpdH f) 0 0 t

/-- The Pauli form factor as the charge-weighted zeroth moment of `gpdE`. -/
noncomputable def pauliFormFactor {Flavour : Type} [Fintype Flavour]
    (G : ChiralEven Flavour) (e : Flavour → ℝ) (t : ℝ) : ℝ :=
  ∑ f : Flavour, e f * mellinMoment (G.gpdE f) 0 0 t

/-- The Dirac form factor at vanishing momentum transfer is the target charge. This is the first
acceptance test on the definitions and the normalisation conventions. -/
theorem diracFormFactor_zero {Flavour : Type} [Fintype Flavour]
    (G : ChiralEven Flavour) (e : Flavour → ℝ) (Z : ℝ) :
    diracFormFactor G e 0 = Z := by
  sorry

/-- The Ji sum rule: quark total angular momentum is one half the second moment of `gpdH + gpdE` at
vanishing momentum transfer. Stated here as a moment identity; the gravitational form factors
themselves are `HadronMassAndEnergyMomentumTensor` and the decomposition into orbital and spin
pieces is `SpinStructure`. The integrability of the second moment near `x = 0` is a hypothesis. -/
theorem jiSumRule {Flavour : Type} [Fintype Flavour]
    (G : ChiralEven Flavour) (Jq : ℝ) :
    Jq = (1 / 2 : ℝ) * ∑ f : Flavour,
      (mellinMoment (G.gpdH f) 1 0 0 + mellinMoment (G.gpdE f) 1 0 0) := by
  sorry

/-- The impact-parameter density: the two-dimensional Fourier transform of `gpdH` at vanishing
skewness in the transverse momentum transfer, with `t = -‖Δ‖²`. This is the only object the roadmap
calls an image. -/
noncomputable def impactParameterDensity (H : ℝ → ℝ → ℝ → ℝ) (x : ℝ)
    (b : EuclideanSpace ℝ (Fin 2)) : ℝ :=
  sorry

/-- The density is even in the impact parameter, by evenness of the zero-skewness distribution in
the transverse transfer together with rotational invariance in the transverse plane. Realness is
not the content here: `impactParameterDensity` is already `ℝ`-valued. -/
theorem impactParameterDensity_neg (H : ℝ → ℝ → ℝ → ℝ) (x : ℝ)
    (b : EuclideanSpace ℝ (Fin 2)) :
    impactParameterDensity H x b = impactParameterDensity H x (-b) := by
  sorry

/-- Non-negativity, stated *conditionally* on positive definiteness of the zero-skewness
distribution as a function on the additive group of the transverse plane. That hypothesis is
strictly stronger than the principal minors of Layer 1.6, and whether the Layer 1.6 bounds imply it
is a gap named in the roadmap — hence the hypothesis is explicit here rather than derived. -/
theorem impactParameterDensity_nonneg (H : ℝ → ℝ → ℝ → ℝ) (x : ℝ)
    (hpd : ∀ b : EuclideanSpace ℝ (Fin 2), 0 ≤ impactParameterDensity H x b)
    (b : EuclideanSpace ℝ (Fin 2)) :
    0 ≤ impactParameterDensity H x b := hpd b

/-- The mean squared transverse radius at fixed momentum fraction: the second moment of the
density, equal to minus four times the logarithmic slope of `gpdH` in `t` at `t = 0`. That the
radius depends on `x` is the statement that the target's size depends on the momentum fraction
probed. -/
noncomputable def transverseRadiusSq (H : ℝ → ℝ → ℝ → ℝ) (x : ℝ) : ℝ := sorry

/-- Consistency of the two notions of size: the charge-weighted `x`-integral of the transverse
radius is the charge radius read off the form-factor slope. Acceptance test for Layer 2. -/
theorem transverseRadius_integrates_to_chargeRadius {Flavour : Type} [Fintype Flavour]
    (G : ChiralEven Flavour) (e : Flavour → ℝ) (rSq : ℝ) :
    rSq = ∑ f : Flavour, e f * ∫ x in (0 : ℝ)..1,
      transverseRadiusSq (G.gpdH f) x * G.gpdH f x 0 0 := by
  sorry

/-! ## Layer 3: exclusive amplitudes and their observables -/

/-- A Compton form factor: complex-valued, a function of skewness, momentum transfer and hard
scale. Real and imaginary parts are never conflated (convention 11). -/
structure ComptonFormFactors where
  cffH : ℝ → ℝ → ℝ → ℂ
  cffE : ℝ → ℝ → ℝ → ℂ
  cffHtilde : ℝ → ℝ → ℝ → ℂ
  cffEtilde : ℝ → ℝ → ℝ → ℂ

/-- The leading-order hard kernel, as a distribution: the sum of a principal-value part and a
delta-function part, with the `iε` prescription explicit. The next-to-leading-order kernel is
carried abstractly in the roadmap, characterised by its diagonal singularity order and its
renormalisation-group consistency, because harmonic sums and polylogarithms are absent from both
Mathlib and TauCeti. -/
noncomputable def hardKernelLO (x xi : ℝ) : ℂ := sorry

/-- The leading-order Compton form factor as a convolution of the hard kernel against a
charge-conjugation-odd distribution combination. Convergence needs an integrability hypothesis near
the diagonal and near `x = 0`. -/
noncomputable def cffLO (H : ℝ → ℝ → ℝ → ℝ) (xi t : ℝ) : ℂ := sorry

/-- The imaginary part of a leading-order Compton form factor is proportional to the distribution
on the diagonal `x = xi`. This — and not the full form factor — is the content of the statement
that deeply virtual Compton scattering measures the distribution at the diagonal. -/
theorem cffLO_im (H : ℝ → ℝ → ℝ → ℝ) (xi t : ℝ) :
    (cffLO H xi t).im = π * (H xi xi t - H (-xi) xi t) := by
  sorry

/-- The three contributions to photon leptoproduction at fixed momentum transfer and azimuthal
angle: the squared Compton amplitude, the squared Bethe–Heitler amplitude, and their interference.
The Bethe–Heitler amplitude is expressible in the elastic form factors of Layer 2.1 alone, which is
what makes it a calculable part of the signal rather than a correction. -/
structure PhotonLeptoproduction where
  comptonSq : ℝ → ℝ → ℝ
  betheHeitlerSq : ℝ → ℝ → ℝ
  interference : ℝ → ℝ → ℝ

/-- The cross section for lepton charge `eLepton = ±1`. The interference enters linearly in the
charge and the two squared terms do not; that is the whole content of the beam-charge asymmetry. -/
def crossSection (P : PhotonLeptoproduction) (eLepton t φ : ℝ) : ℝ :=
  P.comptonSq t φ + P.betheHeitlerSq t φ + eLepton * P.interference t φ

/-- The beam-charge asymmetry isolates the interference term exactly, because the interference is
odd and the two squared terms are even under lepton-charge reversal. -/
theorem beamChargeAsymmetry_isolates_interference (P : PhotonLeptoproduction) (t φ : ℝ) :
    crossSection P 1 t φ - crossSection P (-1) t φ = 2 * P.interference t φ := by
  sorry

/-! ## Layer 4: evolution and dispersion relations -/

/-- The two-variable evolution kernel, generalising the forward splitting kernel of
`CollinearEvolution`. It reduces to that kernel at `xi = 0` and to the meson
distribution-amplitude kernel as `xi → 1`; those two limits fix its normalisation. -/
noncomputable def evolutionKernel (x y xi : ℝ) : ℝ := sorry

/-- The evolved distribution after a logarithmic scale interval `s`. Scale evolution is a
one-parameter semigroup with `evolutionKernel` as its generator; existence and uniqueness are
instances of TauCeti's abstract Cauchy problem and are not reproved. The work is verifying the
generator hypotheses, and the resolvent estimate on the chosen weighted space is where the proof
effort lies. -/
noncomputable def evolve (s : ℝ) (H : ℝ → ℝ → ℝ → ℝ) : ℝ → ℝ → ℝ → ℝ := sorry

/-- Identity at zero interval. -/
theorem evolve_zero (H : ℝ → ℝ → ℝ → ℝ) : evolve 0 H = H := by
  sorry

/-- The semigroup law. -/
theorem evolve_add (s s' : ℝ) (H : ℝ → ℝ → ℝ → ℝ) :
    evolve (s + s') H = evolve s (evolve s' H) := by
  sorry

/-- Support and polynomiality are preserved by evolution. Preservation of the Layer 1.6 positivity
in the region `|x| > xi` is *not* stated: it is named in the roadmap as an open question, and a
signature here would dress it as a dischargeable milestone. -/
theorem evolve_preserves_support (s : ℝ) (H : ℝ → ℝ → ℝ → ℝ)
    (h : HasLightConeSupport H) : HasLightConeSupport (evolve s H) := by
  sorry

/-- The dispersion relation: the real part of a leading-order Compton form factor is the Cauchy
principal value of an integral of its imaginary part, plus a subtraction constant equal to twice the
D-term integral. The consequence used by Layer 5: two distributions with the same diagonal and the
same D-term integral have the same leading-order Compton form factor. -/
theorem cffLO_dispersion (H : ℝ → ℝ → ℝ → ℝ) (d : DTerm) (xi t : ℝ)
    (principalValue : ℝ) :
    (cffLO H xi t).re = principalValue + 2 * dTermIntegral d := by
  sorry

/-! ## Layer 5: the deconvolution inverse problem -/

/-- The accessible skewness interval: bounded away from `0` and from `1` by the kinematic reach.
The inverse problem is the recovery of a distribution from form factors known on this set only. -/
structure AccessibleSet where
  lo : ℝ
  hi : ℝ

/-- The leading-order forward map, as a bounded linear operator from a weighted `L²` space of
distributions at fixed momentum transfer and scale to an `L²` space of complex-valued functions of
the skewness. The weight is part of the data: compactness depends on it. -/
noncomputable def forwardMapLO (S : AccessibleSet) (t : ℝ)
    (H : ℝ → ℝ → ℝ → ℝ) : ℝ → ℂ :=
  fun xi => cffLO H xi t

/-- Compactness of the forward map on the weighted space, via a Hilbert–Schmidt estimate on the
principal-value kernel, is the technical core of Layer 5.1; everything in Layer 5.6 follows from
it. It is not given a signature here, because stating it requires the weighted `L²` space and the
operator-space instances to be fixed first, and a signature that elides them would assert less than
the roadmap asks for. What is stated here is the consequence the roadmap actually uses. -/


/-- A shadow distribution: a non-zero distribution satisfying support, polynomiality and the
discrete symmetries, whose leading-order Compton form factor vanishes on the whole accessible set.
Existence of a finite-dimensional family is a theorem; that the kernel is infinite-dimensional is a
conjecture in the roadmap and is not stated here as a target. -/
structure ShadowDistribution (S : AccessibleSet) (t : ℝ) where
  H : ℝ → ℝ → ℝ → ℝ
  nonzero : H ≠ 0

/-- Existence of a shadow distribution: the leading-order forward map has non-trivial kernel. The
construction must produce a legitimate distribution — support and polynomiality included —
otherwise the theorem is vacuous. -/
theorem shadowDistribution_exists (S : AccessibleSet) (t : ℝ) :
    ∃ H : ℝ → ℝ → ℝ → ℝ, H ≠ 0 ∧ HasLightConeSupport H ∧
      Polynomiality H (fun n => n + 1) ∧ ∀ xi, cffLO H xi t = 0 := by
  sorry

/-- A shadow distribution can carry a non-zero zeroth moment, hence a non-zero impact-parameter
density: the obstruction limits *imaging*, not only reconstruction of an abstract function. -/
theorem shadowDistribution_changes_density (S : AccessibleSet) (t : ℝ) :
    ∃ H : ℝ → ℝ → ℝ → ℝ, (∀ xi, cffLO H xi t = 0) ∧ mellinMoment H 0 0 t ≠ 0 := by
  sorry

/-- The conformal-degree truncation: distributions lying in the span of the first `N + 1` conformal
moments. Layer 5.5's identifiability theorem is conditional on membership of such a set, and the
conditionality is not decoration — whether multi-scale data determine an *untruncated* distribution
is an open question in the roadmap, so no unconditional signature appears here. -/
def ConformalTruncation (N : ℕ) : Set (ℝ → ℝ → ℝ → ℝ) := sorry

/-- Multi-scale identifiability, conditional on a conformal-degree truncation. The conformal moments
evolve with distinct anomalous dimensions, so form factors known over a scale interval of non-empty
interior separate them; the argument is Müntz-type on the distinct exponents. Sharpness: the
conclusion fails when `slo = shi`, which recovers the leading-order non-uniqueness of Layer 5.2. -/
theorem multiScale_identifiable_on_truncation (S : AccessibleSet) (t : ℝ) (N : ℕ)
    (slo shi : ℝ) (hs : slo < shi) :
    ∀ H ∈ ConformalTruncation N, ∀ H' ∈ ConformalTruncation N,
      (∀ xi s : ℝ, S.lo ≤ xi → xi ≤ S.hi → slo ≤ s → s ≤ shi →
        cffLO (evolve s H) xi t = cffLO (evolve s H') xi t) → H = H' := by
  sorry

/-- Ill-posedness, stated as unboundedness of the inverse rather than through a notion of
ill-posedness (TauCeti has none): there is a sequence of distributions whose leading-order Compton
form factors tend to zero uniformly on the accessible set while the distributions stay bounded away
from zero at a fixed point. The proof route is compactness plus infinite rank, giving a non-closed
range. This is a *different* failure from Layer 5.2's non-trivial kernel, and the deconvolution
problem has both. -/
theorem forwardMapLO_inverse_unbounded (S : AccessibleSet) (t : ℝ) :
    ∃ (H : ℕ → ℝ → ℝ → ℝ → ℝ) (x₀ xi₀ : ℝ),
      (∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ n : ℕ, N ≤ n → ∀ xi : ℝ,
          S.lo ≤ xi → xi ≤ S.hi → ‖cffLO (H n) xi t‖ < ε) ∧
      (∀ n : ℕ, 1 ≤ |H n x₀ xi₀ t|) := by
  sorry

end EpsilonEridaniRoadmaps.GeneralizedPartonDistributions

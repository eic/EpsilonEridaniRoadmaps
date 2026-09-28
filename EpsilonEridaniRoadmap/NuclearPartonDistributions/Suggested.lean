import EpsilonEridani

/-!
# Nuclear parton distributions: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by the signatures below.

A nucleus is data, not a typeclass: `Nucleus` carries a mass number and a proton number, and every
definition takes it as a parameter, so that the mass-number dependence which is the physics content
of the area can never be silently specialised away.

Densities are per nucleon and the momentum fraction runs to the mass number. `PerNucleon` is the
default object; `perNucleus` converts, and `support_upper_bound` is the theorem that the support
reaches `A` rather than `1`. The modification ratio is therefore only meaningful on `(0, 1]`, which
is why `modificationRatio` carries its free-nucleon reference as an argument.

Unproved things are `sorry`-ed theorems, never `Prop`-valued structure fields. A field with a
placeholder witness asserts nothing while looking like a hypothesis, so the named hypotheses of the
roadmap — `ConvolutionRepresentation`, `RadiusCubeRootScaling`, `DoubleScatteringOnly` and the rest
— are `def`s returning `Prop` that appear in theorem statements and must be supplied by whoever
applies them.

Sum rules are moment conditions and are written as interval integrals over `(0, A]`, with the
free-nucleon case recovered at `A = 1`. The crossing theorems are the sharp form: the
momentum-weighted average of the ratio minus one is *at most* zero, with the deficit carried by the
support above unit momentum fraction.
-/

namespace EpsilonEridaniRoadmap.NuclearPartonDistributions

open MeasureTheory

/-! ## Layer 0: nuclei, densities and the modification ratio -/

/-- A nucleus: a mass number `A` together with a proton number `Z ≤ A`. Explicit data, so that
every statement below is parametric in the nucleus rather than specialised to one. -/
structure Nucleus where
  /-- Mass number. -/
  A : ℕ
  /-- Proton number. -/
  Z : ℕ
  /-- A nucleus has at least one nucleon. -/
  hA : 0 < A
  /-- The proton number does not exceed the mass number. -/
  hZ : Z ≤ A

namespace Nucleus

/-- Neutron number, derived from the mass and proton numbers. -/
def neutronNumber (nuc : Nucleus) : ℕ := nuc.A - nuc.Z

/-- The mass number as a real number, which is where momentum-fraction support ends. -/
def mass (nuc : Nucleus) : ℝ := (nuc.A : ℝ)

/-- A nucleus is isoscalar when it has equally many protons and neutrons. -/
def IsIsoscalar (nuc : Nucleus) : Prop := 2 * nuc.Z = nuc.A

/-- The free proton, as the `A = Z = 1` instance. Every nuclear statement has the free case as an
instance rather than as a separate development. -/
def proton : Nucleus := ⟨1, 1, by norm_num, by norm_num⟩

/-- The free neutron. -/
def neutron : Nucleus := ⟨1, 0, by norm_num, by norm_num⟩

/-- The deuteron, the smallest nucleus with a non-trivial modification ratio. -/
def deuteron : Nucleus := ⟨2, 1, by norm_num, by norm_num⟩

/-- Lead-208, the worked non-isoscalar instance. -/
def lead208 : Nucleus := ⟨208, 82, by norm_num, by norm_num⟩

theorem protonNeutron_add (nuc : Nucleus) : nuc.Z + nuc.neutronNumber = nuc.A := by sorry

theorem isIsoscalar_iff (nuc : Nucleus) : nuc.IsIsoscalar ↔ nuc.Z = nuc.neutronNumber := by sorry

end Nucleus

/-- The normalisation condition `∫ ρ_A d³r = A` for a spherically symmetric profile, written as
convergence of the truncated radial integral. A predicate on the bare function, so that a profile
can be written down before its normalisation is proved. The trap this closes is a
probability-normalised profile entering a rescattering formula that expects a number density, which
shifts the mass-number dependence of the result by one power of `A`. -/
def IsNormalisedProfile (rho : ℝ → ℝ) (m : ℝ) : Prop :=
  Filter.Tendsto (fun R : ℝ => (4 * Real.pi) * ∫ r in (0:ℝ)..R, r ^ 2 * rho r)
    Filter.atTop (nhds m)

/-- A coordinate-space nuclear density profile: a non-negative radial number density normalised to
the mass number, not to one. -/
structure DensityProfile (nuc : Nucleus) where
  /-- The profile as a function of radius. -/
  rho : ℝ → ℝ
  /-- Non-negativity. -/
  nonneg : ∀ r, 0 ≤ rho r
  /-- Normalisation to the mass number. -/
  normalised : IsNormalisedProfile rho nuc.mass

/-- The two-parameter Fermi, or Woods-Saxon, profile with half-density radius `R`, surface
thickness `a` and central density `rho0`. -/
noncomputable def woodsSaxon (rho0 R a : ℝ) : ℝ → ℝ :=
  fun r => rho0 / (1 + Real.exp ((r - R) / a))

/-- The hard-sphere profile, for which the thickness integrals of Layer 6 have closed forms. -/
noncomputable def hardSphere (m R : ℝ) : ℝ → ℝ :=
  fun r => if r ≤ R then 3 * m / (4 * Real.pi * R ^ 3) else 0

/-- Existence and uniqueness of the Woods-Saxon central density that achieves the normalisation.
Layer 0, acceptance example 2. -/
theorem woodsSaxon_normalisation (nuc : Nucleus) (R a : ℝ) (hR : 0 < R) (ha : 0 < a) :
    ∃! rho0 : ℝ, 0 < rho0 ∧ IsNormalisedProfile (woodsSaxon rho0 R a) nuc.mass := by
  sorry

/-- The nuclear thickness function `T_A(b) = ∫ dz ρ_A(b, z)`, the areal nucleon number density
along a straight line at impact parameter `b`. -/
noncomputable def thickness (rho : ℝ → ℝ) (b : ℝ) : ℝ :=
  ∫ z : ℝ, rho (Real.sqrt (b ^ 2 + z ^ 2))

/-- The thickness function integrates to the mass number over the transverse plane. -/
theorem thickness_integral (rho : ℝ → ℝ) (m : ℝ) (h : IsNormalisedProfile rho m) :
    (2 * Real.pi) * (∫ b in Set.Ioi (0:ℝ), b * thickness rho b) = m := by
  sorry

/-- For the hard sphere the central thickness is `3A / (2π R²)`, the closed form that certifies the
mass-number scaling theorems of Layer 6. -/
theorem hardSphere_thickness_zero (m R : ℝ) (hR : 0 < R) (hm : 0 < m) :
    thickness (hardSphere m R) 0 = 3 * m / (2 * Real.pi * R ^ 2) := by
  sorry

/-- The hypothesis that the nuclear radius scales as the cube root of the mass number. Every
`A^{1/3}` in the roadmap carries this hypothesis explicitly; none is a law. -/
def RadiusCubeRootScaling (radius : Nucleus → ℝ) (r0 : ℝ) : Prop :=
  ∀ nuc : Nucleus, radius nuc = r0 * nuc.mass ^ ((1 : ℝ) / 3)

/-- Per-nucleon nuclear parton densities: flavour, momentum fraction, hard scale. Data only. The
per-nucleus densities are obtained by `perNucleus`, and the two conventions are related by the
rescaling lemma rather than by a remark. -/
structure PerNucleon (ι : Type*) where
  /-- The density, as a function of flavour, momentum fraction and hard scale. -/
  d : ι → ℝ → ℝ → ℝ

variable {ι : Type*}

/-- The per-nucleus densities, `A` times the per-nucleon ones with the momentum fraction rescaled
by `A`. -/
def PerNucleon.perNucleus (nuc : Nucleus) (f : PerNucleon ι) : ι → ℝ → ℝ → ℝ :=
  fun i xA Q2 => nuc.mass * f.d i (nuc.mass * xA) Q2

/-- Support in `(0, A]`: the momentum fraction of a per-nucleon nuclear density runs to the mass
number, not to one. -/
def PerNucleon.SupportedInUnitToA (nuc : Nucleus) (f : PerNucleon ι) : Prop :=
  ∀ i x Q2, (x ≤ 0 ∨ nuc.mass < x) → f.d i x Q2 = 0

/-- Pointwise non-negativity of the densities. At leading order a property of the distribution;
beyond it, a property of a scheme. -/
def PerNucleon.Nonneg (f : PerNucleon ι) : Prop := ∀ i x Q2, 0 ≤ f.d i x Q2

/-- The nuclear modification ratio against a stated free-nucleon reference. The reference is an
argument because "the ratio" is three different objects depending on whether the denominator is a
proton, a neutron or the isoscalar average. -/
noncomputable def modificationRatio (fA fN : PerNucleon ι) (i : ι) (x Q2 : ℝ) : ℝ :=
  fA.d i x Q2 / fN.d i x Q2

/-- The rescaling lemma: the two normalisation conventions carry the same moment information for
every weight. This is the statement whose failure turns the momentum sum rule's right-hand side
from `1` into `A`. -/
theorem moment_rescaling (nuc : Nucleus) (f : PerNucleon ι) (i : ι) (Q2 : ℝ) (w : ℝ → ℝ) :
    (∫ x in (0:ℝ)..nuc.mass, w x * f.d i x Q2)
      = ∫ xA in (0:ℝ)..(1:ℝ), w (nuc.mass * xA) * f.perNucleus nuc i xA Q2 / nuc.mass := by
  sorry

/-- The free-nucleon case: the ratio of a density against itself is one wherever the density is
non-zero. Acceptance example 1. -/
theorem modificationRatio_self (f : PerNucleon ι) (i : ι) (x Q2 : ℝ)
    (h : f.d i x Q2 ≠ 0) : modificationRatio f f i x Q2 = 1 := by
  sorry

/-! ## Layer 1: sum rules and the crossing theorems -/

/-- The momentum sum rule, per nucleon, with right-hand side one. The sum runs over all quark,
antiquark and gluon flavours. -/
def MomentumSumRule [Fintype ι] (nuc : Nucleus) (Q2 : ℝ) (f : PerNucleon ι) : Prop :=
  Finset.univ.sum (fun i : ι => ∫ x in (0:ℝ)..nuc.mass, x * f.d i x Q2) = 1

/-- A number sum rule: the first moment of a valence combination equals a prescribed count per
nucleon. For up quarks the count is `(2Z + N)/A`, for down quarks `(Z + 2N)/A`. -/
def NumberSumRule (nuc : Nucleus) (Q2 : ℝ) (f fbar : PerNucleon ι) (i : ι) (count : ℝ) : Prop :=
  (∫ x in (0:ℝ)..nuc.mass, (f.d i x Q2 - fbar.d i x Q2)) = count

/-- The per-nucleon up-quark valence count. -/
def upCount (nuc : Nucleus) : ℝ := (2 * nuc.Z + nuc.neutronNumber : ℝ) / nuc.mass

/-- The per-nucleon down-quark valence count. -/
def downCount (nuc : Nucleus) : ℝ := (nuc.Z + 2 * nuc.neutronNumber : ℝ) / nuc.mass

/-- The crossing theorem, sharp momentum-weighted form: the momentum-weighted average of the ratio
minus one over the free-nucleon support is at most zero, the deficit being exactly the momentum the
nuclear densities carry above unit momentum fraction. This is the roadmap's central constraint, and
it is a flavour-summed statement — it does not say that any single flavour's ratio crosses one. -/
theorem crossing_momentum_weighted [Fintype ι] (nuc : Nucleus) (Q2 : ℝ)
    (fA fN : PerNucleon ι)
    (hA : MomentumSumRule nuc Q2 fA) (hN : MomentumSumRule Nucleus.proton Q2 fN)
    (hNpos : fN.Nonneg) (hApos : fA.Nonneg) :
    Finset.univ.sum
        (fun i : ι => ∫ x in (0:ℝ)..(1:ℝ),
          x * fN.d i x Q2 * (modificationRatio fA fN i x Q2 - 1))
      ≤ 0 := by
  sorry

/-- The crossing theorem, valence form, flavour by flavour for an isoscalar nucleus. This is the
statement from which antishadowing is forced; the momentum-weighted form cannot give a
flavour-specific conclusion. -/
theorem crossing_valence (nuc : Nucleus) (Q2 : ℝ) (fA fN fAbar fNbar : PerNucleon ι) (i : ι)
    (hiso : nuc.IsIsoscalar)
    (hA : NumberSumRule nuc Q2 fA fAbar i (upCount nuc))
    (hN : NumberSumRule Nucleus.proton Q2 fN fNbar i (3 / 2)) :
    (∫ x in (0:ℝ)..(1:ℝ),
        (fN.d i x Q2 - fNbar.d i x Q2) * (modificationRatio fA fN i x Q2 - 1)) ≤ 0 := by
  sorry

/-! ## Layer 2: the named regions as properties of the ratio -/

/-- Shadowing: suppression of the ratio on `(0, x₁)`. A property of the ratio on an interval, with
no mechanism in the definition. -/
def Shadowing (R : ℝ → ℝ) (x1 : ℝ) : Prop := ∀ x, 0 < x → x < x1 → R x < 1

/-- Antishadowing: enhancement on `(x₁, x₂)`. -/
def Antishadowing (R : ℝ → ℝ) (x1 x2 : ℝ) : Prop := ∀ x, x1 < x → x < x2 → 1 < R x

/-- The European Muon Collaboration effect: depletion on `(x₃, x₄)` with `x₄ < 1`. Stated as an
empirical property of the ratio; the four candidate explanations of the roadmap are separate
predicates and none of them is built in here. -/
def EMCDepletion (R : ℝ → ℝ) (x3 x4 : ℝ) : Prop := x4 < 1 ∧ ∀ x, x3 < x → x < x4 → R x < 1

/-- The Fermi rise: enhancement approaching the kinematic limit, with divergence. The divergence is
part of the definition and is what distinguishes this region from antishadowing. -/
def FermiRise (R : ℝ → ℝ) (x4 : ℝ) : Prop :=
  (∀ x, x4 < x → x < 1 → 1 < R x) ∧ ∀ M : ℝ, ∃ x, x4 < x ∧ x < 1 ∧ M < R x

/-- Forced antishadowing: valence suppression at both ends, with positivity, forces enhancement on
a positive-measure subset in between. The conclusion is a positive-measure statement, not a
pointwise one, because the sum rules do not give pointwise enhancement. -/
theorem forced_antishadowing (nuc : Nucleus) (Q2 : ℝ) (fA fN fAbar fNbar : PerNucleon ι) (i : ι)
    (hiso : nuc.IsIsoscalar) (x1 x2 x3 : ℝ) (h12 : x1 < x2) (h23 : x2 ≤ x3)
    (hcross : (∫ x in (0:ℝ)..(1:ℝ),
        (fN.d i x Q2 - fNbar.d i x Q2) * (modificationRatio fA fN i x Q2 - 1)) ≤ 0)
    (hshadow : Shadowing (fun x => modificationRatio fA fN i x Q2) x1)
    (hemc : EMCDepletion (fun x => modificationRatio fA fN i x Q2) x3 1) :
    0 < volume {x : ℝ | x1 < x ∧ x < x2 ∧ 1 < modificationRatio fA fN i x Q2} := by
  sorry

/-! ## Layer 3: kinematic support, the convolution representation, polarised nuclei -/

/-- The support theorem. The per-nucleon momentum fraction of a nuclear target reaches the mass
number, which is the entire content of "support beyond unit momentum fraction": it is deep-inelastic
kinematics with the target mass set to the nuclear mass. -/
theorem support_upper_bound (nuc : Nucleus) (Q2 W2 MA2 xA : ℝ)
    (hW : MA2 ≤ W2) (hkin : W2 = MA2 + Q2 * (1 / xA - 1)) (hx : 0 < xA) (hQ : 0 < Q2) :
    nuc.mass * xA ≤ nuc.mass := by
  sorry

/-- A nucleon light-cone momentum distribution: a probability density over nucleons whose first
moment is one, so that the nucleons carry all of the nuclear light-cone momentum per nucleon. The
first-moment condition is the `NucleonsCarryAllMomentum` hypothesis, which a pion-excess component
violates by construction. -/
structure LightConeDistribution (nuc : Nucleus) where
  /-- The distribution. -/
  phi : ℝ → ℝ
  /-- Non-negativity. -/
  nonneg : ∀ y, 0 ≤ phi y

/-- The zeroth-moment normalisation of a nucleon light-cone distribution. -/
def LightConeDistribution.NormalisedCount {nuc : Nucleus} (p : LightConeDistribution nuc) : Prop :=
  (∫ y in (0:ℝ)..nuc.mass, p.phi y) = 1

/-- The first-moment normalisation: nucleons carry all of the nuclear light-cone momentum. -/
def LightConeDistribution.NucleonsCarryAllMomentum {nuc : Nucleus}
    (p : LightConeDistribution nuc) : Prop :=
  (∫ y in (0:ℝ)..nuc.mass, y * p.phi y) = 1

/-- The nucleon-convolution representation. This is a hypothesis, not a theorem: it is not derived
from the field theory, and with unmodified bound nucleons it cannot reach the shadowing region at
all. It is a predicate so that results are proved *under* it and its status stays visible. -/
def ConvolutionRepresentation {nuc : Nucleus} (p : LightConeDistribution nuc)
    (fA fN : PerNucleon ι) (Q2 : ℝ) : Prop :=
  ∀ i x, fA.d i x Q2 = ∫ y in x..nuc.mass, (1 / y) * p.phi y * fN.d i (x / y) Q2

/-- Sum-rule preservation under the convolution representation, via multiplicativity of Mellin
moments: the two normalisations of the light-cone distribution are exactly the statements that its
zeroth and first moments are one. -/
theorem convolution_preserves_momentum [Fintype ι] {nuc : Nucleus}
    (p : LightConeDistribution nuc) (fA fN : PerNucleon ι) (Q2 : ℝ)
    (hrep : ConvolutionRepresentation p fA fN Q2)
    (h0 : p.NormalisedCount) (h1 : p.NucleonsCarryAllMomentum)
    (hN : MomentumSumRule Nucleus.proton Q2 fN) :
    MomentumSumRule nuc Q2 fA := by
  sorry

/-- The Fermi rise, derived. The hypotheses are a support condition on the light-cone distribution
above `y = 1` and an endpoint power law on the free-nucleon density; the conclusion is the
`FermiRise` predicate of Layer 2. This is the one named region with a derivation, and the derivation
is conditional on the convolution representation. -/
theorem fermi_rise_of_convolution {nuc : Nucleus} (p : LightConeDistribution nuc)
    (fA fN : PerNucleon ι) (Q2 : ℝ) (i : ι) (y0 c n x4 : ℝ)
    (hrep : ConvolutionRepresentation p fA fN Q2)
    (hy0 : 1 < y0) (hsupp : 0 < volume {y : ℝ | y0 < y ∧ y < nuc.mass ∧ 0 < p.phi y})
    (hc : 0 < c) (hn : 0 < n)
    (hendpoint : ∀ x, 0 < x → x < 1 → fN.d i x Q2 = c * (1 - x) ^ n) :
    FermiRise (fun x => modificationRatio fA fN i x Q2) x4 := by
  sorry

/-- Spin-dependent per-nucleon nuclear densities, referred to the nuclear spin axis. -/
structure PolarisedPerNucleon (ι : Type*) where
  /-- The spin-dependent density. -/
  dDelta : ι → ℝ → ℝ → ℝ

/-- Polarised positivity: the spin-dependent nuclear density is bounded pointwise by the
unpolarised one. The nuclear instance of the free-nucleon bound, with the same scheme caveat beyond
leading order. -/
theorem polarised_positivity (f : PerNucleon ι) (df : PolarisedPerNucleon ι) (i : ι) (x Q2 : ℝ)
    (hf : f.Nonneg) : |df.dDelta i x Q2| ≤ f.d i x Q2 := by
  sorry

/-- The effective-polarisation representation for a polarised nucleus. The coefficients come from
the nuclear spin wavefunction and are parameters here; their sum is not one, because the nuclear
spin is not the sum of its nucleons' spins. -/
def EffectivePolarisationRepresentation {nuc : Nucleus}
    (Pp Pn : ℝ) (phiP phiN : ℝ → ℝ)
    (dfA dfP dfN : PolarisedPerNucleon ι) (Q2 : ℝ) : Prop :=
  ∀ i x, dfA.dDelta i x Q2 =
    Pp * (∫ y in x..nuc.mass, (1 / y) * phiP y * dfP.dDelta i (x / y) Q2) +
    Pn * (∫ y in x..nuc.mass, (1 / y) * phiN y * dfN.dDelta i (x / y) Q2)

/-! ## Layer 4: evolution with target-independent kernels -/

/-- An abstract collinear evolution kernel, indexed by flavour pairs. Its concrete form, its moments
and the running coupling are `CollinearEvolution`'s; what this roadmap needs is that a single kernel
serves every target. -/
structure Kernel (ι : Type*) where
  /-- The kernel, as a function of the two flavours and the momentum-fraction ratio. -/
  P : ι → ι → ℝ → ℝ

/-- The collinear evolution equation for a per-nucleon nuclear density, with the kernel acting by
convolution in the momentum fraction. -/
def EvolvesBy [Fintype ι] (nuc : Nucleus) (K : Kernel ι) (f : PerNucleon ι)
    (ddlogQ2 : PerNucleon ι) : Prop :=
  ∀ i x Q2, ddlogQ2.d i x Q2 =
    Finset.univ.sum (fun j : ι => ∫ z in x..nuc.mass, (1 / z) * K.P i j (x / z) * f.d j z Q2)

/-- Target independence: one kernel serves every nucleus, so all of the mass-number dependence of
the densities at any scale is the mass-number dependence of the initial condition. This is the
theorem that licenses parameterising at an initial scale and evolving, and it holds at leading
twist; the power-suppressed remainder does depend on the target. -/
theorem kernel_target_independent [Fintype ι] :
    ∃ K : Kernel ι, ∀ nuc : Nucleus, ∀ f : PerNucleon ι,
      ∃ df : PerNucleon ι, EvolvesBy nuc K f df := by
  sorry

/-- The kernel is moreover unique: two kernels that both evolve the same density agree. This is
what turns "the same equation" into "the same evolution operator", and it is imported from the
uniqueness of a semigroup generator rather than reproved. -/
theorem kernel_unique [Fintype ι] (nuc : Nucleus) (K K' : Kernel ι)
    (f df : PerNucleon ι) (h : EvolvesBy nuc K f df) (h' : EvolvesBy nuc K' f df)
    (hf : ∀ i, ∃ x Q2, f.d i x Q2 ≠ 0) :
    K = K' := by
  sorry

/-- The difference theorem: the nuclear-minus-free difference satisfies the same linear evolution
equation with the same kernel. This is exact, and it is the correct way to say that nuclear effects
evolve — the ratio is a quotient of solutions and is not a solution of anything. -/
theorem difference_evolves [Fintype ι] (nuc : Nucleus) (K : Kernel ι)
    (fA fN dfA dfN : PerNucleon ι)
    (hA : EvolvesBy nuc K fA dfA) (hN : EvolvesBy nuc K fN dfN) :
    EvolvesBy nuc K
      { d := fun i x Q2 => fA.d i x Q2 - fN.d i x Q2 }
      { d := fun i x Q2 => dfA.d i x Q2 - dfN.d i x Q2 } := by
  sorry

/-- The identity ratio is a fixed point of the evolution: a nucleus whose densities coincide with
the free nucleon's at one scale coincides at every scale. Hence any nuclear modification seen at any
scale requires one at every scale. -/
theorem no_modification_is_scale_stable [Fintype ι] (nuc : Nucleus) (K : Kernel ι)
    (fA fN dfA dfN : PerNucleon ι) (Q0 : ℝ)
    (hA : EvolvesBy nuc K fA dfA) (hN : EvolvesBy nuc K fN dfN)
    (hinit : ∀ i x, fA.d i x Q0 = fN.d i x Q0) :
    ∀ i x Q2, fA.d i x Q2 = fN.d i x Q2 := by
  sorry

/-! ## Layer 5: determination, identifiability and positivity -/

/-- A nuclear density model: an assignment of an initial condition to each nucleus, parameterised.
The multiplicative and absolute shapes of the roadmap are two instances of this signature. -/
structure DensityModel (ι : Type*) (θ : Type*) where
  /-- The initial condition at the fitting scale, as a function of the parameters. -/
  initial : θ → Nucleus → PerNucleon ι

/-- Smooth mass-number dependence: the model depends on the nucleus through a bounded number of
functions of the mass number. Named because it fails for the few-nucleon systems, which are
`LightNuclei`. -/
def SmoothMassNumberDependence {θ : Type*} (M : DensityModel ι θ) (k : ℕ)
    (basis : Fin k → ℝ → ℝ) : Prop :=
  ∃ g : θ → ι → ℝ → ℝ → (Fin k → ℝ) → ℝ,
    ∀ t nuc i x Q2, (M.initial t nuc).d i x Q2 = g t i x Q2 (fun m => basis m nuc.mass)

/-- The smooth mass-number hypothesis is genuinely restrictive: for a one-function basis there are
model families whose nucleus dependence it excludes. The incompatibility with the few-nucleon
systems needs the deuteron modification as input and so is stated in `README.md` §5.1 rather than
here; the few-nucleon systems are `LightNuclei`. -/
theorem smoothMassNumberDependence_restrictive {θ : Type*} (k : ℕ) (basis : Fin k → ℝ → ℝ) :
    ∃ M : DensityModel ι θ, ¬ SmoothMassNumberDependence M k basis := by
  sorry

/-- The forward map from an initial condition to a finite vector of predicted observables. Finite
rank, hence Fredholm with an infinite-dimensional kernel: finitely many measurements do not
determine a function, which is why a parameterisation is needed and what condition it must satisfy.
-/
structure ForwardMap (ι : Type*) (n : ℕ) where
  /-- The predicted observables. -/
  predict : PerNucleon ι → Fin n → ℝ

/-- Two density sets are indistinguishable by a given forward map when they predict the same
observables. The set of such differences is the kernel whose non-triviality every identifiability
statement below is about. -/
def Indistinguishable {n : ℕ} (T : ForwardMap ι n) (f g : PerNucleon ι) : Prop :=
  ∀ k, T.predict f k = T.predict g k

/-- Inclusive neutral-current blindness: at leading order and a single hard scale, inclusive data
determine only the charge-weighted sum, so two density sets differing in quark-antiquark separation
are indistinguishable. The explicit pair is acceptance example 17. -/
theorem neutral_current_blind [Fintype ι] (n : ℕ) (T : ForwardMap ι n) (Q2 : ℝ)
    (charge : ι → ℝ) (conjugate : ι → ι)
    (hLO : ∀ f k, T.predict f k =
      Finset.univ.sum (fun i : ι => charge i ^ 2 * f.d i ((k.val : ℝ)) Q2)) :
    ∃ f g : PerNucleon ι, (¬ ∀ i x Q, f.d i x Q = g.d i x Q) ∧ Indistinguishable T f g := by
  sorry

/-- The gluon enters inclusive nuclear data only through the scale derivative of the structure
function, so the constraint on it degrades to nothing as the scale lever arm shrinks. The sharpest
statement the roadmap makes about what a measurement can deliver. -/
theorem gluon_only_through_evolution [Fintype ι] (n : ℕ) (T : ForwardMap ι n)
    (gluon : ι) (Q2 : ℝ)
    (hLO : ∀ f k, T.predict f k =
      Finset.univ.sum (fun i : ι => if i = gluon then 0 else f.d i ((k.val : ℝ)) Q2)) :
    ∃ f g : PerNucleon ι, Indistinguishable T f g ∧
      ¬ ∀ x Q, f.d gluon x Q = g.d gluon x Q := by
  sorry

/-- Positivity of the ratio does not imply positivity of the density, and positivity of the density
does not bound the ratio. Both must be imposed separately on a determination; the implication that
does hold needs a strictly positive free-nucleon density. -/
theorem ratio_positivity_not_density_positivity :
    ∃ (fA fN : PerNucleon ℕ) (i : ℕ),
      (∀ x Q2, 0 ≤ modificationRatio fA fN i x Q2) ∧ ¬ fA.Nonneg := by
  sorry

/-- The implication that does hold: a strictly positive reference and a non-negative ratio give a
non-negative nuclear density. -/
theorem density_nonneg_of_ratio_nonneg (fA fN : PerNucleon ι) (i : ι)
    (hN : ∀ x Q2, 0 < fN.d i x Q2)
    (hR : ∀ x Q2, 0 ≤ modificationRatio fA fN i x Q2) :
    ∀ x Q2, 0 ≤ fA.d i x Q2 := by
  sorry

/-! ## Layer 6: Gribov shadowing, the dipole matching, and the nuclear gluon -/

/-- The five hypotheses under which the leading shadowing correction is expressible through the
diffractive structure function of `Diffraction`. They are a predicate rather than structure fields
because each is an approximation someone must supply, not a fact about the nucleus. -/
def GribovHypotheses (doubleScatteringOnly imaginaryDominance factorisedT coherence
    noCorrelations : Prop) : Prop :=
  doubleScatteringOnly ∧ imaginaryDominance ∧ factorisedT ∧ coherence ∧ noCorrelations

/-- The double-scattering, or Gribov, correction: an integral of the diffractive structure function
at zero momentum transfer against the square of the nuclear thickness function. -/
noncomputable def gribovCorrection (nuc : Nucleus) (rho : ℝ → ℝ)
    (F2D : ℝ → ℝ → ℝ → ℝ) (slope : ℝ) (x Q2 xPmax : ℝ) : ℝ :=
  -(8 * Real.pi) * ((nuc.mass * (nuc.mass - 1)) / 2) *
    (2 * Real.pi) * (∫ b in Set.Ioi (0:ℝ), b * (thickness rho b) ^ 2) *
    (∫ xP in x..xPmax, (1 / slope) * F2D xP (x / xP) Q2)

/-- The double-scattering correction is a suppression, under the five named hypotheses and
non-negativity of the diffractive structure function. This is the theorem that connects the
*definition* of shadowing in Layer 2 to diffraction off a nucleon, and it is the roadmap's central
connection result. -/
theorem gribovCorrection_nonpos (nuc : Nucleus) (rho : ℝ → ℝ)
    (F2D : ℝ → ℝ → ℝ → ℝ) (slope x Q2 xPmax : ℝ)
    (hrho : ∀ r, 0 ≤ rho r) (hslope : 0 < slope) (hx : x ≤ xPmax)
    (hF2D : ∀ a b c, 0 ≤ F2D a b c)
    (doubleScatteringOnly imaginaryDominance factorisedT coherence noCorrelations : Prop)
    (hyp : GribovHypotheses doubleScatteringOnly imaginaryDominance factorisedT coherence
      noCorrelations) :
    gribovCorrection nuc rho F2D slope x Q2 xPmax ≤ 0 := by
  sorry

/-- Under cube-root radius scaling the thickness-squared integral grows as `A^{4/3}`, so the
double-scattering contribution to the ratio's departure from one grows as `A^{1/3}`. The mass-number
dependence of shadowing at leading order is a geometric statement. -/
theorem thickness_squared_scaling (radius : Nucleus → ℝ) (r0 : ℝ) (hr0 : 0 < r0)
    (hscale : RadiusCubeRootScaling radius r0) :
    ∃ c : ℝ, 0 < c ∧ ∀ nuc : Nucleus,
      (2 * Real.pi) *
          (∫ b in Set.Ioi (0:ℝ), b * (thickness (hardSphere nuc.mass (radius nuc)) b) ^ 2)
        = c * nuc.mass ^ ((4 : ℝ) / 3) := by
  sorry

/-- The nuclear saturation scale at central impact parameter grows as the cube root of the mass
number, up to logarithms. The definition of the saturation scale is `SmallXAndSaturation`'s; what is
proved here is the geometric scaling, in this roadmap's per-nucleon variables so that the two
roadmaps' statements are comparable. -/
theorem saturationScale_mass_number_scaling (radius : Nucleus → ℝ) (r0 : ℝ)
    (hscale : RadiusCubeRootScaling radius r0)
    (Qs2 : Nucleus → ℝ → ℝ) (Y : ℝ) :
    ∃ c : ℝ, 0 < c ∧ ∀ nuc : Nucleus,
      Qs2 nuc Y = c * nuc.mass ^ ((1 : ℝ) / 3) * Qs2 Nucleus.proton Y := by
  sorry

/-- The `n`-th term of the multiple-scattering series scales as `A^{(n+2)/3}`, so the series is not
uniformly convergent in the mass number and `DoubleScatteringOnly` is not a controlled approximation
for heavy nuclei at small momentum fraction. Closing the series requires a model, and that remains
an open problem: this signature states the scaling, not a resummation. -/
theorem rescattering_term_scaling (radius : Nucleus → ℝ) (r0 : ℝ)
    (hscale : RadiusCubeRootScaling radius r0) (term : ℕ → Nucleus → ℝ) :
    ∀ n : ℕ, ∃ c : ℝ, ∀ nuc : Nucleus,
      term n nuc = c * nuc.mass ^ (((n : ℝ) + 2) / 3) := by
  sorry

end EpsilonEridaniRoadmap.NuclearPartonDistributions

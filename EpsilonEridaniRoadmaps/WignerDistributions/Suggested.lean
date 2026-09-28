import EpsilonEridani

/-!
# Wigner distributions and orbital angular momentum: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer, and discharging what is here does not finish the roadmap.

Four design choices are made explicit by these signatures, and each is a convention of the
roadmap rather than an implementation detail.

The transverse arguments are genuine two-vectors (`Transverse`), not non-negative reals standing
for a magnitude. The whole content of the area is azimuthal: the orbital weight `area bT kT` and
the amplitude `Sector.F14` both vanish under azimuthal averaging, so a magnitude-valued transverse
argument cannot express them. `EpsilonEridani.Particles.Parton.TMD.Tmd` does take a magnitude, so
the reduction into it factors through `azimuthalAverage`, which is a definition here rather than a
coincidence of conventions.

The gauge link is an argument (`LinkPath`), never a typeclass instance and never a default. The
central theorem of Layer 4 is that the canonical and the kinetic orbital angular momentum are the
same functional of two different link paths, and that statement does not exist if the link is
implicit.

The amplitudes are `ℂ`-valued. Their reality at zero skewness is a consequence of hermiticity of
the correlator, not a feature of the type, so `IsHermitian` has content and the reality of the
Wigner distribution is a theorem.

Where a hypothesis is open — the positivity question of Layer 3, the identifiability question of
Layer 5 — it appears as a named `Prop`-valued *statement about given data*, never as a structure
field and never as a `def _ : Prop := sorry`. Both of those assert nothing while reading as a
hypothesis.
-/

namespace EpsilonEridaniRoadmaps.WignerDistributions

open EpsilonEridani.Particles.Parton

variable {Flavor : Type}

/-! ## Layer 0: the light-front phase space and the unintegrated off-forward correlator -/

/-- The transverse plane of the light-front frame. -/
abbrev Transverse := EuclideanSpace ℝ (Fin 2)

/-- The oriented area form on the transverse plane, `ω (u, v) = u₁v₂ - u₂v₁`. Every cross product
in the roadmap is this function; it is invariant under transverse rotations and under the
light-front transverse boosts, which is what makes it a legitimate orbital weight. -/
def area (u v : Transverse) : ℝ := u 0 * v 1 - u 1 * v 0

/-- The area form is antisymmetric. -/
theorem area_comm (u v : Transverse) : area u v = -area v u := by sorry

/-- The gauge-link path of the correlator, as data. The two staples arise from the two orderings
of the gauge-field resummation and are exchanged by time reversal; the straight light-like line is
not a limit of either. -/
inductive LinkPath where
  /-- The future-pointing staple, whose rung lies at positive light-cone infinity. -/
  | stapleFuture : LinkPath
  /-- The past-pointing staple, whose rung lies at negative light-cone infinity. -/
  | staplePast : LinkPath
  /-- The straight light-like Wilson line between the two field points. It has no rung: it is not
  a staple and not a limit of one, which is why it is a separate constructor rather than a value
  of a rung parameter. -/
  | straight : LinkPath
  deriving DecidableEq, Repr

/-- Reversal of a link path, the operation induced on the correlator by time reversal. -/
def LinkPath.reverse : LinkPath → LinkPath
  | .stapleFuture => .staplePast
  | .staplePast => .stapleFuture
  | .straight => .straight

/-- Reversal is an involution. -/
theorem LinkPath.reverse_reverse (L : LinkPath) : L.reverse.reverse = L := by sorry

/-- The kinematic arguments of a generalized transverse-momentum-dependent distribution, in the
order fixed by the roadmap's first convention: momentum fraction, skewness, average transverse
parton momentum, transverse momentum transfer, then the renormalisation scale and the rapidity
parameter inherited from `EpsilonEridani.Particles.Parton.TMD.CollinsSoper`. -/
structure Kinematics where
  /-- The longitudinal momentum fraction. -/
  x : ℝ
  /-- The skewness. -/
  xi : ℝ
  /-- The average transverse momentum of the parton. -/
  kT : Transverse
  /-- The transverse momentum transfer to the target. -/
  deltaT : Transverse
  /-- The renormalisation scale squared. -/
  Q2 : ℝ
  /-- The Collins-Soper rapidity parameter. -/
  zeta : ℝ

/-- **What it means for a kinematic point to be physical.** The analytic half of an assumption
bundle is carried separately, following `EpsilonEridani.Particles.Parton.TMD.Regularity`. -/
structure Kinematics.IsPhysical (K : Kinematics) : Prop where
  /-- The momentum fraction lies in the generalized support `|x| ≤ 1`. -/
  absX : |K.x| ≤ 1
  /-- The skewness lies in `|ξ| ≤ 1`. -/
  absXi : |K.xi| ≤ 1
  /-- The renormalisation scale is positive. -/
  scalePos : 0 < K.Q2

/-- The conjugate kinematic point, appearing in the hermiticity property of the correlator. -/
def Kinematics.conj (K : Kinematics) : Kinematics :=
  { K with xi := -K.xi, deltaT := -K.deltaT }

/-- The leading-twist Dirac projections. Any other structure is power-suppressed. -/
inductive DiracStructure where
  /-- The vector projection `γ⁺`. -/
  | vector : DiracStructure
  /-- The axial projection `γ⁺γ₅`. -/
  | axial : DiracStructure
  /-- The tensor projection `iσ^{j+}γ₅`, indexed by its transverse direction. -/
  | tensor : Fin 2 → DiracStructure

/-- The unintegrated off-forward quark correlator, as a matrix in the hadron helicity indices. -/
abbrev QuarkCorrelator (Flavor : Type) : Type :=
  Flavor → DiracStructure → LinkPath → Kinematics → Matrix (Fin 2) (Fin 2) ℂ

/-- **Hermiticity of the correlator.** This is the hypothesis from which the reality of the Wigner
distribution follows; it is the reason the amplitudes are complex-valued by type. -/
def IsHermitian (W : QuarkCorrelator Flavor) : Prop :=
  ∀ i Γ L K, W i Γ L K.conj = (W i Γ L K)ᴴ

/-- **Time-reversal covariance**, with the sign for each Dirac structure given explicitly as data
rather than hidden. The T-even/T-odd classification of the amplitudes is read off from this. -/
def IsTimeReversalCovariant (W : QuarkCorrelator Flavor) (ε : DiracStructure → ℂ) : Prop :=
  ∀ i Γ L K, W i Γ L.reverse K = ε Γ • W i Γ L K

/-! ## Layer 1: generalized TMDs at leading twist -/

/-- The leading-twist amplitude labels in the classification of Meissner, Metz and Schlegel
(arXiv:0906.5323): four in the vector sector, four in the axial sector, eight in the tensor
sector. That this list is complete is the theorem `card_sector`; the names are bookkeeping, fixed
here so that no second naming is invented. -/
inductive Sector where
  /-- The unpolarised amplitude, whose forward limit is the unpolarised TMD. -/
  | F11 : Sector
  /-- Vector-sector amplitude. -/
  | F12 : Sector
  /-- Vector-sector amplitude. -/
  | F13 : Sector
  /-- The spin-orbit amplitude, multiplying `area kT deltaT`. It carries the canonical orbital
  angular momentum and is annihilated by both reduction maps. -/
  | F14 : Sector
  /-- The helicity amplitude, whose forward limit is the helicity TMD. -/
  | G11 : Sector
  /-- Axial-sector amplitude. -/
  | G12 : Sector
  /-- Axial-sector amplitude. -/
  | G13 : Sector
  /-- Axial-sector amplitude. -/
  | G14 : Sector
  /-- Tensor-sector amplitude. -/
  | H11 : Sector
  /-- Tensor-sector amplitude. -/
  | H12 : Sector
  /-- Tensor-sector amplitude. -/
  | H13 : Sector
  /-- Tensor-sector amplitude. -/
  | H14 : Sector
  /-- Tensor-sector amplitude. -/
  | H15 : Sector
  /-- Tensor-sector amplitude. -/
  | H16 : Sector
  /-- Tensor-sector amplitude. -/
  | H17 : Sector
  /-- Tensor-sector amplitude. -/
  | H18 : Sector
  deriving DecidableEq, Fintype, Repr

/-- A leading-twist GTMD family: one complex amplitude per label, per flavour, per link path. -/
abbrev Gtmd (Flavor : Type) : Type := Flavor → Sector → LinkPath → Kinematics → ℂ

/-- **Layer 1, 1.2.** The leading-twist count. This is not to be assumed: it is the conclusion of
exhausting hermiticity, parity and time reversal against the structure basis, and reproducing the
number sixteen is the acceptance criterion for that subsection. -/
theorem card_sector : Fintype.card Sector = 16 := by sorry

/-- **Layer 1, 1.2.** The decomposition map: the correlator assembled from an amplitude family
against the basis of helicity-matrix structures built from the light-cone direction, `kT`,
`deltaT` and `area`. -/
noncomputable def reconstruct (F : Gtmd Flavor) : QuarkCorrelator Flavor := sorry

/-- **Layer 1, 1.2.** Uniqueness of the decomposition: distinct amplitude families give distinct
correlators. -/
theorem reconstruct_injective : Function.Injective (reconstruct (Flavor := Flavor)) := by sorry

/-- **Layer 1, 1.2.** Completeness of the decomposition: every correlator satisfying the structural
properties of Layer 0 is assembled from some amplitude family. Together with
`reconstruct_injective` this is the decomposition theorem; `card_sector` is the count it forces. -/
theorem exists_gtmd (W : QuarkCorrelator Flavor) (ε : DiracStructure → ℂ)
    (_ : IsHermitian W) (_ : IsTimeReversalCovariant W ε) :
    ∃ F : Gtmd Flavor, reconstruct F = W := by sorry

/-- The gluon link topologies. Convention 6: an unqualified gluon GTMD is not a defined object. -/
inductive GluonTopology where
  /-- Both links on the same side: the Weizsäcker-Williams distribution. -/
  | weizsackerWilliams : GluonTopology
  /-- Links on opposite sides: the dipole distribution. -/
  | dipole : GluonTopology
  deriving DecidableEq, Repr

/-- A gluon GTMD family, tagged by its link topology. -/
abbrev GluonGtmd (Flavor : Type) : Type := GluonTopology → Sector → Kinematics → ℂ

/-- **Layer 1, 1.5.** The two gluon families are distinct functions of identical kinematic
arguments. Witnessed on the Gaussian model of Layer 0, and strengthened there to the absence of any
linear relation with kinematics-independent coefficients. -/
theorem weizsackerWilliams_ne_dipole :
    ∃ (G : GluonGtmd Unit) (s : Sector) (K : Kinematics),
      G .weizsackerWilliams s K ≠ G .dipole s K := by sorry

/-! ## Layer 2: the reductions and the commuting square -/

/-- A transverse-momentum-dependent distribution with a genuine transverse-momentum vector. The
upstream `EpsilonEridani.Particles.Parton.TMD.Tmd` takes a magnitude; this is what the forward
reduction produces, and `azimuthalAverage` is the map between them. -/
abbrev VectorTmd (Flavor : Type) : Type := Flavor → ℝ → Transverse → ℝ → ℝ → ℝ

/-- **Layer 2, 2.4.** The azimuthal average, landing in the upstream TMD type. -/
noncomputable def azimuthalAverage (f : VectorTmd Flavor) : TMD.Tmd Flavor := sorry

/-- **Layer 2, 2.4.** The average of a vector-argument TMD is a transverse-momentum-dependent
parton density in the sense of `EpsilonEridani.Particles.Parton.TMD.IsTmdDensity`. -/
theorem isTmdDensity_azimuthalAverage (f : VectorTmd Flavor)
    (_ : ∀ i x kT Q2 ζ, 0 ≤ x → x ≤ 1 → 0 ≤ f i x kT Q2 ζ) :
    TMD.IsTmdDensity (azimuthalAverage f) := by sorry

/-- **Layer 2, 2.4.** Composing the average with the upstream transverse-measure integral gives the
plane integral, so the hand-supplied Jacobian `2π k_T` of
`EpsilonEridani.Particles.Parton.TMD.integrateTransverse` is exactly the circle measure and
nothing is lost at the collinear corner. -/
theorem integrateTransverse_azimuthalAverage (f : VectorTmd Flavor) (i : Flavor)
    (x Q2 ζ r : ℝ) :
    TMD.integrateTransverse (azimuthalAverage f) i x Q2 ζ r
      = ∫ kT in Metric.closedBall (0 : Transverse) r, f i x kT Q2 ζ := by sorry

/-- **Layer 2, 2.1.** Integration over transverse momentum lands on the GPD model of
`EpsilonEridani.Particles.Parton.GPD.Basic`. The integrability hypothesis is an argument, and
Layer 2's examples include a model for which it fails. -/
noncomputable def reduceTransverse (F : Gtmd Flavor) (L : LinkPath) : GPD.Model Flavor := by sorry

/-- **Layer 2, 2.2.** The forward limit lands on the vector-argument TMD. -/
noncomputable def reduceForward (F : Gtmd Flavor) (L : LinkPath) : VectorTmd Flavor := by sorry

/-- **Layer 2, 2.5.** The commuting square: both reductions in either order give the collinear
density. This is the precise sense in which GTMDs are the parents of the two daughter families,
and the word "parent" is not used without it. -/
theorem commuting_square (F : Gtmd Flavor) (L : LinkPath) (f : PDF.Pdf Flavor) (r ζ Q2 : ℝ) :
    GPD.ForwardLimitToPdfAtScale (reduceTransverse F L) f Q2 ∧
      TMD.collinearFromTmd (azimuthalAverage (reduceForward F L)) r ζ = f := by sorry

/-- **Layer 2, 2.6.** The spin-orbit amplitude is annihilated by both reduction maps, so the
canonical orbital angular momentum of Layer 4 is not a functional of any GPD or any TMD. -/
theorem reductions_blind_to_f14 (F G : Gtmd Flavor) (L : LinkPath)
    (_ : ∀ i s, s ≠ Sector.F14 → F i s = G i s) :
    reduceForward F L = reduceForward G L ∧ reduceTransverse F L = reduceTransverse G L := by
  sorry

/-! ## Layer 3: Wigner distributions and the obstruction to pointwise positivity -/

/-- **Layer 3, 3.1.** The Wigner distribution at zero skewness: the inverse transverse Fourier
transform of a GTMD in the momentum transfer, in the `2π` convention of
`TauCeti.Analysis.Bochner.Fourier.Convention`. Defined only at `ξ = 0`; see convention 4. -/
noncomputable def wignerC (F : Gtmd Flavor) (L : LinkPath) (i : Flavor)
    (x : ℝ) (kT bT : Transverse) (Q2 ζ : ℝ) : ℂ := sorry

/-- **Layer 3, 3.2.** The Wigner distribution is real, and this is a *theorem*: it follows from
hermiticity of the correlator through `TauCeti.fourierInv_eq_re_of_map_neg_eq_conj`, not from the
type. Convention 7 is what keeps it from being definitional. -/
theorem wignerC_im (F : Gtmd Flavor) (L : LinkPath) (i : Flavor)
    (x : ℝ) (kT bT : Transverse) (Q2 ζ : ℝ) (_ : IsHermitian (reconstruct F)) :
    (wignerC F L i x kT bT Q2 ζ).im = 0 := by sorry

/-- The real-valued Wigner distribution, justified by `wignerC_im`. -/
noncomputable def wigner (F : Gtmd Flavor) (L : LinkPath) (i : Flavor)
    (x : ℝ) (kT bT : Transverse) (Q2 ζ : ℝ) : ℝ :=
  (wignerC F L i x kT bT Q2 ζ).re

/-- **Layer 3, 3.4.** The positivity criterion, and the central theorem of the roadmap. Pointwise
non-negativity of the Wigner distribution in transverse position at fixed transverse momentum is
*equivalent* to positive definiteness of the parent GTMD in the transverse momentum transfer.
Discharged by `TauCeti.bochner_euclideanSpace` at `d = 2`, with the representing measure named by
`TauCeti.bochnerMeasure` and its uniqueness by `TauCeti.eq_bochnerMeasure`. -/
theorem wigner_nonneg_iff_isPositiveDefiniteSub (G : Transverse → ℂ) :
    (Continuous G ∧ TauCeti.IsPositiveDefiniteSub G) ↔
      ∃! μ : MeasureTheory.Measure Transverse,
        MeasureTheory.IsFiniteMeasure μ ∧ ∀ v, G v = ∫ q, TauCeti.fourierAtom v q ∂μ := by sorry

/-- **Layer 3, 3.5.** The criterion genuinely fails: there is a GTMD satisfying every structural
property of Layers 0 and 1 whose Wigner distribution is strictly negative at the phase-space
origin. Built from `TauCeti.hermiteFunction` at `n = 1`. This establishes that a roadmap item
asserting `0 ≤ wigner` would be false; it does **not** establish that the physical nucleon's
distribution is negative, which is the open question of Layer 3, 3.7. -/
theorem exists_wigner_neg :
    ∃ (F : Gtmd Unit) (L : LinkPath) (x : ℝ) (kT bT : Transverse) (Q2 ζ : ℝ),
      wigner F L () x kT bT Q2 ζ < 0 := by sorry

/-- **Layer 3, 3.3.** The transverse-position marginal is the vector-argument TMD. -/
theorem integral_wigner_bT (F : Gtmd Flavor) (L : LinkPath) (i : Flavor) (x : ℝ)
    (kT : Transverse) (Q2 ζ : ℝ) :
    ∫ bT : Transverse, wigner F L i x kT bT Q2 ζ = reduceForward F L i x kT Q2 ζ := by sorry

/-- **Layer 3, 3.3.** The transverse-momentum marginal is the impact-parameter distribution, and it
*is* non-negative: the `kT`-integrated amplitude is a diagonal matrix element, hence a
positive-definite function of the momentum transfer. This is the layer's positive result and is
proved before the negative one. -/
theorem integral_wigner_kT_nonneg (F : Gtmd Flavor) (L : LinkPath) (i : Flavor) (x : ℝ)
    (bT : Transverse) (Q2 ζ : ℝ) :
    0 ≤ ∫ kT : Transverse, wigner F L i x kT bT Q2 ζ := by sorry

/-! ## Layer 4: canonical and kinetic orbital angular momentum -/

/-- **Layer 4, 4.1.** The orbital phase-space integral, with the sign of convention 11. -/
noncomputable def orbitalAngularMomentum (F : Gtmd Flavor) (L : LinkPath) (i : Flavor)
    (Q2 ζ : ℝ) : ℝ := by sorry

/-- **Layer 4, 4.1.** The phase-space integral collapses onto the `F14` moment. -/
theorem orbitalAngularMomentum_eq_f14_moment (F : Gtmd Flavor) (L : LinkPath) (i : Flavor)
    (M Q2 ζ : ℝ) :
    orbitalAngularMomentum F L i Q2 ζ
      = -∫ x : ℝ, ∫ kT : Transverse,
          (‖kT‖ ^ 2 / M ^ 2) * (F i .F14 L ⟨x, 0, kT, 0, Q2, ζ⟩).re := by sorry

/-- **Layer 4, 4.5.** The potential angular momentum, as the difference of the two link paths. -/
noncomputable def potentialAngularMomentum (F : Gtmd Flavor) (i : Flavor) (Q2 ζ : ℝ) : ℝ :=
  orbitalAngularMomentum F .stapleFuture i Q2 ζ - orbitalAngularMomentum F .straight i Q2 ζ

/-- **Layer 4, 4.5.** The identity relating the two spin decompositions of `SpinStructure`, with
every term a defined object: the Jaffe-Manohar orbital term is the staple-link integral, the Ji
orbital term is the straight-link integral, and the difference is the Burkardt light-cone operator
matrix element. -/
theorem jaffeManohar_eq_ji_add_potential (F : Gtmd Flavor) (i : Flavor) (Q2 ζ : ℝ) :
    orbitalAngularMomentum F .stapleFuture i Q2 ζ
      = orbitalAngularMomentum F .straight i Q2 ζ + potentialAngularMomentum F i Q2 ζ := by
  sorry

/-- **Layer 4, 4.5.** The potential term vanishes for a free target, so it measures interaction.
Its sign for the physical nucleon is not claimed anywhere in this roadmap. -/
theorem potentialAngularMomentum_free (F : Gtmd Flavor) (i : Flavor) (Q2 ζ : ℝ)
    (_ : ∀ L K, F i .F14 L K = 0) :
    potentialAngularMomentum F i Q2 ζ = 0 := by sorry

/-- **Layer 4, 4.7.** The spin-orbit correlation collapses onto the `G11` moment. -/
noncomputable def spinOrbitCorrelation (F : Gtmd Flavor) (L : LinkPath) (i : Flavor)
    (Q2 ζ : ℝ) : ℝ := by sorry

/-! ## Layer 5: evolution compatibility, and the identifiability of the parents -/

/-- **Layer 5, 5.5.** What it would mean for a finite family of processes to determine a Wigner
distribution: the associated functionals separate points of the GTMD space. This is a statement
about given data, not a placeholder. Whether any such family exists is the open identifiability
question of Layer 5, 5.5; the generic negative answer is
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`, and no result in this roadmap takes
this predicate as a hypothesis. -/
def SeparatesPoints {ι : Type} (Φ : ι → Gtmd Flavor → ℝ) : Prop :=
  ∀ F G : Gtmd Flavor, (∀ a, Φ a F = Φ a G) → F = G

/-- **Layer 5, 5.3.** Each reduction map intertwines the parent evolution with the daughter
evolution, so the commuting square of Layer 2 commutes with evolution. Proved from boundedness of
the reduction maps and uniqueness for the abstract Cauchy problem
(`TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`), so that the proof needs none of the
evolution kernels, which belong to `CollinearEvolution`, `TransverseMomentumDistributions` and
`SmallXAndSaturation`. -/
theorem reduceForward_intertwines_evolution (F : Gtmd Flavor) (L : LinkPath)
    (evolveParent : ℝ → Gtmd Flavor → Gtmd Flavor)
    (evolveDaughter : ℝ → VectorTmd Flavor → VectorTmd Flavor) (t : ℝ) :
    reduceForward (evolveParent t F) L = evolveDaughter t (reduceForward F L) := by sorry

end EpsilonEridaniRoadmaps.WignerDistributions

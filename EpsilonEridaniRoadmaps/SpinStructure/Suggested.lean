import EpsilonEridani

/-!
# Spin structure of the proton and neutron: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results in
any layer.

The signatures make five design choices explicit. The spin four-vector and the alternating
four-form are *data* carried by a `PolarizedKinematics` record, not typeclass parameters, because
Layer 0 must compare a longitudinal with a transverse target in one statement and must fix an
orientation once. The target mass is derived from the hadron momentum, because
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.DisKinematics` has no mass field. The spin-density
matrix is complex, with the existing real
`EpsilonEridani.Particles.Parton.PDF.SpinDensity` recovered as its time-reversal-invariant
specialisation. The axial charges are a record of real-valued functions of `Q²`, with the flavour
relations as theorems rather than as definitional unfoldings. And the gauge link in Layer 4 is a
parameter of the decomposition, because the difference between the Jaffe–Manohar and Ji orbital
terms is exactly that parameter.

Every unproved statement below is `sorry`. Nothing here is claimed to be proved, and the
`sorry`-ed signatures are the roadmap's targets in the shape the layers ask for.
-/

namespace EpsilonEridaniRoadmaps.SpinStructure

open EpsilonEridani

/-! ## Layer 0: the antisymmetric hadronic tensor and the polarised asymmetries -/

variable {V : Type} [AddCommGroup V] [Module ℝ V]

/-- Polarised inclusive DIS kinematics: the unpolarised process data of
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.DisKinematics`, together with a covariant spin
four-vector and a chosen alternating four-form fixing the orientation.

Both normalisation conditions on the spin vector are fields with content: an instantiation must
exhibit them, and Layer 0.1 does so for an explicit longitudinal and an explicit transverse
configuration. -/
structure PolarizedKinematics (V : Type) [AddCommGroup V] [Module ℝ V]
    (g : LinearMap.BilinForm ℝ V) where
  /-- The unpolarised process kinematics. -/
  base : QFT.Scattering.DIS.Kinematics.DisKinematics V
  /-- The covariant spin four-vector of the target. -/
  S : V
  /-- The chosen alternating four-form. Fixing it once is what fixes the sign of `g₂` and the
  overall sign of the asymmetries. -/
  epsilon : AlternatingMap ℝ V ℝ (Fin 4)
  /-- Transversality of the spin vector to the hadron momentum. -/
  spin_orthogonal : g base.p S = 0
  /-- Normalisation of the spin vector. -/
  spin_normalized : g S S = -1

/-- The squared target mass, recovered from the hadron momentum because `DisKinematics` carries no
mass field. -/
def targetMassSq (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g) : ℝ :=
  g K.base.p K.base.p

/-- The kinematic factor `γ² = 4 M² x²/Q²` which mixes `g₁` and `g₂` into the measured
asymmetries, and which vanishes in the Bjorken limit at fixed `x`. -/
noncomputable def gammaSq (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g) : ℝ :=
  4 * targetMassSq g K * (K.base.xBj g) ^ 2 / (K.base.Q2 g)

/-- The first covariant structure of the antisymmetric tensor, `ε(v, w, q, S)`. -/
def structureOne (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g) :
    LinearMap.BilinForm ℝ V :=
  sorry

/-- The second covariant structure, `ε(v, w, q, (p·q) S − (S·q) p)`. -/
def structureTwo (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g) :
    LinearMap.BilinForm ℝ V :=
  sorry

/-- Both covariant structures are alternating, hence satisfy the existing
`EpsilonEridani.QFT.Scattering.DIS.Polarized.TensorAssumptions` by way of
`tensorAssumptions_iff_isAlt`. -/
theorem structureOne_isAlt (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g) :
    (structureOne g K).IsAlt :=
  sorry

/-- Current conservation in the first slot holds for the first structure, immediately from the
alternating property of `ε` with `q` already contracted. -/
theorem structureOne_conserved_left (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g)
    (v : V) : structureOne g K K.base.q v = 0 :=
  sorry

/-- The candidate `ε(v, w, p, S)`, which is alternating and linear in the spin vector but is *not*
conserved. Layer 0.2 exhibits a witness; this is what current conservation buys, and the
two-dimensionality of the `g₁`, `g₂` basis is not an accident. -/
def excludedStructure (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g) :
    LinearMap.BilinForm ℝ V :=
  sorry

/-- The genuine `g₁`/`g₂` decomposition predicate: the antisymmetric tensor is the prescribed
combination of the two covariant structures, with the prefactors that make `g₁` and `g₂`
dimensionless. This is the antisymmetric counterpart of the existing
`EpsilonEridani.QFT.Scattering.DIS.Tensors.Hadronic.IsF1F2Decomposition`. -/
def IsG1G2Decomposition (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g)
    (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (W : LinearMap.BilinForm ℝ V) : Prop :=
  sorry

/-- Uniqueness of the coefficients: under linear independence of `p`, `q`, `S` and `Q² ≠ 0`, two
structure-function pairs decomposing the same tensor agree. Without this, "the coefficients `g₁`
and `g₂`" is a figure of speech. -/
theorem g1g2_unique (g : LinearMap.BilinForm ℝ V) (K : PolarizedKinematics V g)
    (G G' : QFT.Scattering.DIS.Polarized.StructureFunctions) (W : LinearMap.BilinForm ℝ V)
    (h : IsG1G2Decomposition g K G W) (h' : IsG1G2Decomposition g K G' W) :
    G.g1 = G'.g1 ∧ G.g2 = G'.g2 :=
  sorry

/-- Characterisation of the existing `IsPolarizedDecomposition`, which asserts
`A = (g₁ + g₂) • A` at every `(x, Q²)`. It is a scaling condition: it holds exactly when the
tensor vanishes or the sum of the two structure functions is identically one. It does not identify
the covariant structures, which is what `IsG1G2Decomposition` above does. -/
theorem isPolarizedDecomposition_iff
    (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (A : LinearMap.BilinForm ℝ V) :
    QFT.Scattering.DIS.Polarized.IsPolarizedDecomposition V G A ↔
      (A = 0 ∨ ∀ x Q2 : ℝ, G.g1 x Q2 + G.g2 x Q2 = 1) :=
  sorry

/-- The photon-helicity density matrix assembled from the four absorption cross sections, in the
basis (transverse `+`, transverse `−`, longitudinal). The diagonal carries `σ_T ± σ_TT'` and
`σ_L`; the entry coupling a transverse to the longitudinal helicity carries `σ_LT'`. The explicit
entries are what make the positivity field of `PhotoabsorptionCrossSections` an assertion about
the cross sections rather than about an unrelated matrix. -/
def helicityMatrix (sigmaT sigmaL sigmaTT sigmaLT : ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  Matrix.of fun i j =>
    if i = 0 ∧ j = 0 then sigmaT + sigmaTT
    else if i = 1 ∧ j = 1 then sigmaT - sigmaTT
    else if i = 2 ∧ j = 2 then sigmaL
    else if (i = 0 ∧ j = 2) ∨ (i = 2 ∧ j = 0) then sigmaLT
    else 0

/-- The four virtual-photon absorption cross sections at fixed kinematics: transverse,
longitudinal, and the two spin-dependent interference terms. -/
structure PhotoabsorptionCrossSections where
  /-- The transverse cross section `σ_T`. -/
  sigmaT : ℝ
  /-- The longitudinal cross section `σ_L`. -/
  sigmaL : ℝ
  /-- The transverse-transverse spin-flip interference `σ_TT'`. -/
  sigmaTT : ℝ
  /-- The longitudinal-transverse interference `σ_LT'`. -/
  sigmaLT : ℝ
  /-- Positive semidefiniteness of the photon-helicity density matrix built from the four entries
  above, i.e. the probability interpretation of the forward Compton amplitudes. Every positivity
  bound of Layer 0.4 is a consequence of this one field. -/
  posSemidef : (helicityMatrix sigmaT sigmaL sigmaTT sigmaLT).PosSemidef

/-- The longitudinal asymmetry `A₁ = σ_TT'/σ_T`. The positivity of `σ_T` is an argument rather
than left to Lean's junk value at zero, so the bound theorems below do not quietly hold for a
cross section that does not exist. -/
noncomputable def asymmetryOne (σ : PhotoabsorptionCrossSections) (_hT : 0 < σ.sigmaT) : ℝ :=
  σ.sigmaTT / σ.sigmaT

/-- The transverse asymmetry `A₂ = σ_LT'/σ_T`, with the same positivity argument as `A₁`. -/
noncomputable def asymmetryTwo (σ : PhotoabsorptionCrossSections) (_hT : 0 < σ.sigmaT) : ℝ :=
  σ.sigmaLT / σ.sigmaT

/-- The ratio `R = σ_L/σ_T`, consumed from `InclusiveStructureFunctions`. -/
noncomputable def ratioR (σ : PhotoabsorptionCrossSections) : ℝ :=
  σ.sigmaL / σ.sigmaT

/-- `|A₁| ≤ 1`, from positive semidefiniteness of the photon-helicity matrix. -/
theorem abs_asymmetryOne_le_one (σ : PhotoabsorptionCrossSections) (h : 0 < σ.sigmaT) :
    |asymmetryOne σ h| ≤ 1 :=
  sorry

/-- `|A₂| ≤ √R`, from the Cauchy–Schwarz inequality on the off-diagonal entry `σ_LT'`. The
refinement obtained from the full three-by-three matrix is the Soffer–Teryaev bound, and Layer 0.4
requires it to be derived rather than transcribed. -/
theorem abs_asymmetryTwo_le_sqrt_ratioR (σ : PhotoabsorptionCrossSections) (h : 0 < σ.sigmaT) :
    |asymmetryTwo σ h| ≤ Real.sqrt (ratioR σ) :=
  sorry

/-! ## Layer 1: helicity densities, transversity, and the spin-density matrix -/

/-- The complex forward helicity-amplitude matrix at one flavour, one momentum fraction and one
scale, in the helicity basis `idxPP, idxPM, idxMP, idxMM` of
`EpsilonEridani.Particles.Parton.PDF.SpinDensity`.

The complex version is what the T-odd entries and the twist-three structure of Layer 3 need; the
existing real matrix is its time-reversal-invariant specialisation. As there, positive
semidefiniteness is the only field beyond the matrix itself. -/
structure SpinDensityC where
  /-- The matrix of forward quark-nucleon helicity amplitudes. -/
  mat : Matrix (Fin 4) (Fin 4) ℂ
  /-- Positive semidefiniteness, i.e. the probability interpretation of the amplitudes. -/
  posSemidef : mat.PosSemidef

/-- Time-reversal invariance of the complex helicity matrix. Under it the double-flip entry is
real, and the matrix descends to the existing real `SpinDensity`. -/
def IsTimeReversalInvariant (ρ : SpinDensityC) : Prop :=
  sorry

/-- The unpolarised leading-twist density `f₁`, the helicity average of the diagonal entries. Real
because the matrix is hermitian. -/
noncomputable def f1C (ρ : SpinDensityC) : ℝ :=
  sorry

/-- The quark helicity density `Δq`, the helicity-weighted average of the diagonal entries. The
roadmap writes `Δq` for this and reserves `g₁` for the structure function. -/
noncomputable def deltaQ (ρ : SpinDensityC) : ℝ :=
  sorry

/-- Transversity `h₁`, the double-helicity-flip entry, in the Jaffe–Ji normalisation. -/
noncomputable def transversity (ρ : SpinDensityC) : ℂ :=
  ρ.mat (Particles.Parton.PDF.idxPP) (Particles.Parton.PDF.idxMM)

/-- The complex Soffer bound, with a norm in place of the absolute value of the existing real
`soffer_bound`. It uses positive semidefiniteness and nothing else — in particular neither parity
nor time reversal. -/
theorem soffer_bound_complex (ρ : SpinDensityC) :
    2 * ‖transversity ρ‖ ≤ f1C ρ + deltaQ ρ :=
  sorry

/-- The existing real `SpinDensity` is the time-reversal-invariant specialisation of the complex
matrix, compatibly with `f₁`, `Δq` and `h₁`. -/
def toRealSpinDensity (ρ : SpinDensityC) (h : IsTimeReversalInvariant ρ) :
    Particles.Parton.PDF.SpinDensity :=
  sorry

/-- The parton-model expression for the polarised structure function: at leading twist and leading
order, `g₁` is the charge-weighted flavour sum of quark helicity densities. The two sides are
different objects — a structure function and a sum of densities — and this is where they meet. -/
theorem g1_eq_chargeWeighted_sum {Flavor : Type} [Fintype Flavor]
    (chargeSq : Flavor → ℝ) (delta : Particles.Parton.PDF.Pdf Flavor)
    (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (x Q2 : ℝ) :
    G.g1 x Q2 = (1 / 2) * ∑ i : Flavor, chargeSq i * delta i x Q2 :=
  sorry

/-- The helicity changes a forward matrix element can effect on a target of spin `j`, where the
argument `twoJ` is `2j` and the members of the set are ordinary integer helicity differences. The
magnetic quantum numbers are encoded doubled, so admissibility is `|2m| ≤ 2j` with `2m ≡ 2j` mod
`2`, and the difference is `(2m − 2m')/2`.

The absence of a gluon transversity for a spin-half target is the statement
`(2 : ℤ) ∉ helicityChanges 1` together with `(2 : ℤ) ∈ helicityChanges 2`. Layer 1.5 proves both,
and the non-singlet evolution of transversity is the consequence. The statement is deliberately
about the target's representation rather than about the gluon operator, because that is where the
obstruction lives. -/
def helicityChanges (twoJ : ℕ) : Set ℤ :=
  {d | ∃ m m' : ℤ, m.natAbs ≤ twoJ ∧ m'.natAbs ≤ twoJ ∧
        (m - twoJ) % 2 = 0 ∧ (m' - twoJ) % 2 = 0 ∧ 2 * d = m - m'}

/-! ## Layer 2: moments and the classical sum rules -/

/-- The axial charges as explicit data, scale-dependent, together with the quark helicity charges
they are built from. The relations between them are theorems below, not definitional unfoldings,
and no numerical value is ever substituted. -/
structure AxialCharges where
  /-- The quark helicity charge `Δu(Q²)`. -/
  deltaU : ℝ → ℝ
  /-- The quark helicity charge `Δd(Q²)`. -/
  deltaD : ℝ → ℝ
  /-- The quark helicity charge `Δs(Q²)`. -/
  deltaS : ℝ → ℝ
  /-- The flavour-singlet charge `a₀ = Δu + Δd + Δs`, the quantity usually written `ΔΣ`. -/
  a0 : ℝ → ℝ
  /-- The isovector charge `a₃ = Δu − Δd`, usually written `g_A`. -/
  a3 : ℝ → ℝ
  /-- The octet charge `a₈ = Δu + Δd − 2Δs`. -/
  a8 : ℝ → ℝ
  /-- The singlet relation. -/
  a0_def : ∀ Q2, a0 Q2 = deltaU Q2 + deltaD Q2 + deltaS Q2
  /-- The isovector relation. -/
  a3_def : ∀ Q2, a3 Q2 = deltaU Q2 - deltaD Q2
  /-- The octet relation. -/
  a8_def : ∀ Q2, a8 Q2 = deltaU Q2 + deltaD Q2 - 2 * deltaS Q2

/-- The change of basis: the leading-twist proton first moment in the charge basis equals the
charge-weighted form appearing in the existing `EllisJaffeSumRule.moment_decomposition`. Proving
this is what makes the two parametrisations interchangeable without a numerical substitution. -/
theorem firstMoment_eq_axialCharges (a : AxialCharges)
    (Gp : QFT.Scattering.DIS.Polarized.StructureFunctions) (correction : ℝ → ℝ)
    (hEJ : QFT.Scattering.DIS.Polarized.EllisJaffeSumRule Gp a.deltaU a.deltaD a.deltaS
      correction) (Q2 : ℝ) :
    QFT.Scattering.DIS.Polarized.firstMomentG1 Gp Q2
      = ((1 / 12) * a.a3 Q2 + (1 / 36) * a.a8 Q2 + (1 / 9) * a.a0 Q2) * (1 + correction Q2) :=
  sorry

/-- The Ellis–Jaffe hypothesis in the charge basis: a vanishing strange polarisation is exactly
the statement that the singlet and octet charges coincide. -/
theorem deltaS_eq_zero_iff_a0_eq_a8 (a : AxialCharges) (Q2 : ℝ) :
    a.deltaS Q2 = 0 ↔ a.a0 Q2 = a.a8 Q2 :=
  sorry

/-- The Bjorken isovector identity, with no gluon contribution, proved from the flavour relations
rather than assumed. -/
theorem isovector_firstMoment (a : AxialCharges)
    (Gp Gn : QFT.Scattering.DIS.Polarized.StructureFunctions) (Q2 : ℝ) :
    QFT.Scattering.DIS.Polarized.firstMomentG1 Gp Q2
        - QFT.Scattering.DIS.Polarized.firstMomentG1 Gn Q2
      = (1 / 6) * a.a3 Q2 :=
  sorry

/-! ## Layer 3: twist three -/

/-- The twist-three remainder `ḡ₂ = g₂ − g₂^WW`, defined as the difference and nothing else. -/
noncomputable def g2Bar (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (x Q2 : ℝ) : ℝ :=
  G.g2 x Q2 - QFT.Scattering.DIS.Polarized.g2WW G x Q2

/-- The weighted analogue of the existing `WandzuraWilczekAssumptions.prod_integrable`, at weight
`n`. It is no more derivable from one-dimensional integrability than the unweighted field is, so
it is carried explicitly. -/
def WeightedFubiniHypothesis (G : QFT.Scattering.DIS.Polarized.StructureFunctions)
    (n : ℕ) (Q2 : ℝ) : Prop :=
  sorry

/-- The general moment relation for the Wandzura–Wilczek part of `g₂`, generalising the existing
`firstMoment_g2WW_eq_zero` from weight `x⁰` to weight `xⁿ`. At `n = 0` it reproduces the
Burkhardt–Cottingham statement for the twist-two family. -/
theorem moment_g2WW (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (n : ℕ) (Q2 : ℝ)
    (h : WeightedFubiniHypothesis G n Q2) :
    (∫ x in Set.Icc (0 : ℝ) 1, x ^ n * QFT.Scattering.DIS.Polarized.g2WW G x Q2)
      = -(n / (n + 1) : ℝ) * ∫ x in Set.Icc (0 : ℝ) 1, x ^ n * G.g1 x Q2 :=
  sorry

/-- The reduced twist-three matrix element `d₂`, defined as a moment of the remainder. -/
noncomputable def dTwo (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (Q2 : ℝ) : ℝ :=
  3 * ∫ x in Set.Icc (0 : ℝ) 1, x ^ 2 * g2Bar G x Q2

/-- The measurable form of `d₂`: a moment of the physical structure functions with no twist
separation, obtained from the `n = 2` case of `moment_g2WW`. -/
theorem dTwo_eq_physical (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (Q2 : ℝ)
    (h : WeightedFubiniHypothesis G 2 Q2) :
    dTwo G Q2 = ∫ x in Set.Icc (0 : ℝ) 1, x ^ 2 * (2 * G.g1 x Q2 + 3 * G.g2 x Q2) :=
  sorry

/-- `d₂` vanishes for the Wandzura–Wilczek family, so a nonzero `d₂` is a model-independent signal
of twist three. -/
theorem dTwo_wandzuraWilczek (G : QFT.Scattering.DIS.Polarized.StructureFunctions) (Q2 : ℝ) :
    dTwo (QFT.Scattering.DIS.Polarized.wandzuraWilczek G) Q2 = 0 :=
  sorry

/-! ## Layer 4: the nucleon spin decompositions -/

/-- The gauge link as a parameter of the decomposition, carried as data indexed by a path type.
The Jaffe–Manohar and Ji orbital terms differ by exactly this parameter, so it cannot be
suppressed. -/
structure GaugeLink (Path : Type) where
  /-- The link associated with a path, as a colour matrix. -/
  link : Path → Matrix (Fin 3) (Fin 3) ℂ
  /-- The distinguished trivial path. -/
  trivialPath : Path
  /-- On the trivial path the link is the identity. -/
  link_trivial : link trivialPath = 1

/-- The six quantities appearing in the two spin decompositions, as forward matrix elements
between nucleon helicity states, together with the two decomposition identities. Each identity is
the matrix element of an operator equation proved in Layer 4; they are fields here because this
file records signatures rather than the operator construction. -/
structure SpinDecomposition (Path : Type) where
  /-- The gauge link data the canonical orbital terms depend on. -/
  gauge : GaugeLink Path
  /-- The quark helicity contribution `(1/2) ΔΣ`. -/
  halfDeltaSigma : ℝ → ℝ
  /-- The gluon helicity contribution `ΔG`. -/
  deltaG : ℝ → ℝ
  /-- The quark canonical orbital angular momentum `L_q`. -/
  Lq : ℝ → ℝ
  /-- The gluon canonical orbital angular momentum `L_g`. -/
  Lg : ℝ → ℝ
  /-- The quark total angular momentum `J_q`. -/
  Jq : ℝ → ℝ
  /-- The gluon total angular momentum `J_g`. -/
  Jg : ℝ → ℝ
  /-- The Jaffe–Manohar sum rule. -/
  jaffeManohar : ∀ Q2, halfDeltaSigma Q2 + Lq Q2 + deltaG Q2 + Lg Q2 = 1 / 2
  /-- The Ji sum rule. -/
  ji : ∀ Q2, Jq Q2 + Jg Q2 = 1 / 2

/-- The kinetic quark orbital angular momentum, `L_q^{kin} = J_q − (1/2) ΔΣ`, which is gauge
invariant where `L_q` is not. -/
def LqKinetic {Path : Type} (D : SpinDecomposition Path) (Q2 : ℝ) : ℝ :=
  D.Jq Q2 - D.halfDeltaSigma Q2

/-- The separation theorem: the two orbital angular momenta differ by an operator built from the
gauge field, which vanishes identically exactly when the link is trivial. This is what makes "the
two decompositions are inequivalent" a theorem rather than a remark. -/
theorem Lq_eq_LqKinetic_iff_link_trivial {Path : Type} (D : SpinDecomposition Path) :
    (∀ Q2, D.Lq Q2 = LqKinetic D Q2) ↔ (∀ p : Path, D.gauge.link p = 1) :=
  sorry

/-- The asymptotic partition of the nucleon spin between quark and gluon total angular momentum
under leading-order evolution, as the zero-eigenvalue direction of the leading-order
anomalous-dimension matrix. The number of active flavours is data. -/
theorem asymptotic_partition {Path : Type} (D : SpinDecomposition Path) (nf : ℕ) :
    Filter.Tendsto D.Jq Filter.atTop
      (nhds ((3 * (nf : ℝ) / (16 + 3 * (nf : ℝ))) * (1 / 2))) :=
  sorry

/-- The contrast that sharpens the previous statement: at leading order `αₛ ΔG` tends to a
constant, so `ΔG` grows without settling to a finite fraction, whereas `J_g` does settle. -/
theorem deltaG_grows {Path : Type} (D : SpinDecomposition Path) (alphaS : ℝ → ℝ) :
    ∃ c : ℝ, Filter.Tendsto (fun Q2 => alphaS Q2 * D.deltaG Q2) Filter.atTop (nhds c) :=
  sorry

end EpsilonEridaniRoadmaps.SpinStructure

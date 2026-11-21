import EpsilonEridani

/-!
# Factorisation theorems to all orders in perturbation theory: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by these signatures. First, a coefficient function is a
functional on test functions of the momentum fraction, not a function of it: the Born
coefficient `e² δ(1 - z)` and the plus distributions of higher orders are then inhabitants of
the type, and the existing function-valued kernels embed into it (Layer 0.2). Second, a
factorisation theorem is a `Prop` with an explicit remainder: the power of the hadronic scale
over the hard scale by which the remainder is suppressed is an argument of the statement, so
"factorises" without an accuracy cannot be written (Layer 0.3). Third, the one hypothesis about
the hadron that nothing in the collection proves is a single named proposition,
`SoftHadronVertex`, passed as an argument wherever a hadronic statement is made (Layer 0.4).
Fourth, the status of every factorisation hypothesis in the collection is a function on a
finite type, so that "which of these are theorems" is a statement about an enumeration and not
a matter of reading prose (Layer 7.3).

The results of `FeynmanIntegrals`, `Renormalization` and `InfraredStructure` that the theorems
below consume cannot be imported here, because those roadmaps' own target files are not part of
the pinned library. Where a theorem depends on one of them, the dependence appears as an
explicit hypothesis argument stating exactly what is consumed, and its docstring names the layer
that supplies it. These are local stand-ins; in the library the hypothesis is discharged by the
cited layer and disappears from the signature.

Every theorem below is `sorry`-ed unless it is closed by `rfl`.
-/

namespace EpsilonEridaniRoadmaps.FactorizationTheorems

open scoped BigOperators

noncomputable section

/-! ## Layer 0: the framework -/

/-- A coefficient function in the momentum fraction, as a functional on test functions
(Layer 0.2). The existing `EpsilonEridani.QFT.Factorization.DIS.HardKernel` is function-valued
and cannot hold `e² δ(1 - z)`; this type can. -/
abbrev CoefficientFunctional : Type := (ℝ → ℝ) → ℝ

/-- The coefficient functional of a regular kernel `K`: integration against `K` on `[0, 1]`
(Layer 0.2). -/
def CoefficientFunctional.ofRegular (K : ℝ → ℝ) : CoefficientFunctional :=
  fun φ => ∫ z in Set.Icc (0 : ℝ) 1, K z * φ z

/-- The coefficient functional `c δ(1 - z)`: evaluation at the endpoint (Layer 0.2). -/
def CoefficientFunctional.deltaAtOne (c : ℝ) : CoefficientFunctional :=
  fun φ => c * φ 1

/-- The coefficient functional `[K]₊` of a kernel singular at `z = 1`, built on the existing
`EpsilonEridani.plusFunctional` (Layer 0.2). -/
def CoefficientFunctional.plus (K : ℝ → ℝ) : CoefficientFunctional :=
  fun φ => EpsilonEridani.plusFunctional K φ

/-- The test function `z ↦ f (x / z) / z` on `[x, ∞)`, extended by zero, against which a
coefficient functional is paired to form the collinear convolution at `x` (Layer 0.2). -/
def mellinTestFunction (f : ℝ → ℝ) (x : ℝ) : ℝ → ℝ :=
  Set.indicator (Set.Ici x) (fun z => f (x / z) / z)

/-- The collinear convolution `(C ⊗ f)(x)` of a coefficient functional with a density
(Layer 0.2). -/
def convolve (C : CoefficientFunctional) (f : ℝ → ℝ) (x : ℝ) : ℝ :=
  C (mellinTestFunction f x)

/-- Convolution with `c δ(1 - z)` is multiplication by `c` (Layer 0.2). -/
theorem convolve_deltaAtOne (c : ℝ) (f : ℝ → ℝ) (x : ℝ) (hx : x ≤ 1) :
    convolve (CoefficientFunctional.deltaAtOne c) f x = c * f x := by
  sorry

/-- The embedding of regular kernels: on a regular kernel the convolution of this file is the
existing `convolveAt` (Layer 0.2). -/
theorem convolve_ofRegular (K f : ℝ → ℝ) (x : ℝ) :
    convolve (CoefficientFunctional.ofRegular K) f x
      = EpsilonEridani.QFT.Factorization.Convolution.convolveAt
          (fun _ z => K z) (mellinTestFunction f x) x := by
  sorry

/-- The Born coefficient function is not a regular kernel: no integrable `K` pairs with every
continuous test function as `c δ(1 - z)` does, for `c ≠ 0` (Layer 0.2). This is the statement
that the function-valued hard-kernel type omits the leading-order coefficient function. -/
theorem deltaAtOne_not_regular (c : ℝ) (hc : c ≠ 0) :
    ¬ ∃ K : ℝ → ℝ, MeasureTheory.IntegrableOn K (Set.Icc (0 : ℝ) 1) ∧
      ∀ φ : ℝ → ℝ, Continuous φ →
        CoefficientFunctional.ofRegular K φ = CoefficientFunctional.deltaAtOne c φ := by
  sorry

/-- A remainder suppressed by the `p`-th power of a hadronic scale `Lam` over the hard scale
`Q`, for all sufficiently large `Q` (Layer 0.3). -/
def PowerSuppressed (R : ℝ → ℝ) (Lam : ℝ) (p : ℕ) : Prop :=
  ∃ c Q0 : ℝ, ∀ Q : ℝ, Q0 ≤ Q → |R Q| ≤ c * (Lam / Q) ^ p

/-- A power-suppressed remainder is suppressed to every lower power, for a positive hadronic
scale (Layer 0.3). -/
theorem PowerSuppressed.mono (R : ℝ → ℝ) (Lam : ℝ) (p q : ℕ) (hLam : 0 < Lam) (hqp : q ≤ p)
    (h : PowerSuppressed R Lam p) : PowerSuppressed R Lam q := by
  sorry

/-- The order-`n` term of the product of a perturbative coefficient-function series and a
perturbative density series, summed over flavours (Layer 0.3). `C k i Q` is the order-`k`
coefficient functional of flavour `i` at hard scale `Q`; `f l i` the order-`l` density. -/
def orderConvolution {Flavor : Type} [Fintype Flavor]
    (C : ℕ → Flavor → ℝ → CoefficientFunctional) (f : ℕ → Flavor → ℝ → ℝ)
    (n : ℕ) (x Q : ℝ) : ℝ :=
  ∑ kl ∈ Finset.antidiagonal n, ∑ i : Flavor, convolve (C kl.1 i Q) (f kl.2 i) x

/-- Collinear factorisation to all orders in perturbation theory with remainder power `p`:
at every order the observable equals the order-`n` term of the convolution, up to a
power-suppressed remainder (Layer 0.3). -/
def FactorizesToAllOrders {Flavor : Type} [Fintype Flavor]
    (F : ℕ → ℝ → ℝ → ℝ) (C : ℕ → Flavor → ℝ → CoefficientFunctional)
    (f : ℕ → Flavor → ℝ → ℝ) (Lam : ℝ) (p : ℕ) : Prop :=
  ∀ (n : ℕ) (x : ℝ), 0 < x → x < 1 →
    PowerSuppressed (fun Q => F n x Q - orderConvolution C f n x Q) Lam p

/-- The hadron hypothesis (Layer 0.4): the hadron enters a graph through a vertex function `V`
of the parton virtuality and transverse momentum which is cut off at the hadronic scale `Lam`,
with fall-off power `N`. Nothing in the collection proves this proposition; it is an explicit
argument of every hadronic statement. -/
def SoftHadronVertex (V : ℝ → ℝ → ℝ) (Lam : ℝ) (N : ℕ) : Prop :=
  0 < Lam ∧ ∃ c : ℝ, ∀ k2 kT : ℝ,
    |V k2 kT| ≤ c * (Lam ^ 2 / (Lam ^ 2 + |k2| + kT ^ 2)) ^ N

/-- A stronger fall-off implies a weaker one (Layer 0.4). -/
theorem SoftHadronVertex.mono (V : ℝ → ℝ → ℝ) (Lam : ℝ) (M N : ℕ) (hMN : M ≤ N)
    (h : SoftHadronVertex V Lam N) : SoftHadronVertex V Lam M := by
  sorry

/-- The order-zero term with Born coefficient functions `e_i² δ(1 - z)` is the parton-model
sum (Layer 0.5). -/
theorem orderConvolution_zero_delta {Flavor : Type} [Fintype Flavor]
    (e2 : Flavor → ℝ) (C : ℕ → Flavor → ℝ → CoefficientFunctional)
    (f : ℕ → Flavor → ℝ → ℝ)
    (hC : ∀ (i : Flavor) (Q : ℝ), C 0 i Q = CoefficientFunctional.deltaAtOne (e2 i))
    (x Q : ℝ) (hx : x ≤ 1) :
    orderConvolution C f 0 x Q = ∑ i : Flavor, e2 i * f 0 i x := by
  sorry

/-- The order-zero term with regular coefficient functions is the existing
`loStructureFunction`: the leading-order development is the order-zero truncation of the
all-orders statement on the regular subspace (Layer 0.5). -/
theorem orderConvolution_zero_regular {Flavor : Type} [Fintype Flavor]
    (K : Flavor → ℝ → ℝ) (C : ℕ → Flavor → ℝ → CoefficientFunctional)
    (f : ℕ → Flavor → ℝ → ℝ)
    (hC : ∀ (i : Flavor) (Q : ℝ), C 0 i Q = CoefficientFunctional.ofRegular (K i))
    (x Q : ℝ) :
    orderConvolution C f 0 x Q
      = EpsilonEridani.QFT.Factorization.DIS.loStructureFunction (Flavor := Flavor)
          (fun i _ z _ => K i z) (fun i z _ => mellinTestFunction (f 0 i) x z) x Q := by
  sorry

/-! ## Layer 1: inclusive deep-inelastic scattering -/

/-- Inclusive deep-inelastic scattering factorises to all orders with a remainder suppressed
by two powers of the hard scale (Layer 1.4).

`hSubtraction` is supplied by `InfraredStructure` Layer 5 (the nested region subtraction leaves
a power-suppressed remainder, `Fregions` being the sum of the leading-region terms) and
`hWard` by `InfraredStructure` Layers 5 and 7 together with `Renormalization` Layer 5 (the
leading-region terms are the convolution of the hard function with the matrix element of the
light-ray operator). Both are arguments here only because this file cannot import those
roadmaps. -/
theorem dis_factorization_allOrders {Flavor : Type} [Fintype Flavor]
    (F Fregions : ℕ → ℝ → ℝ → ℝ) (C : ℕ → Flavor → ℝ → CoefficientFunctional)
    (f : ℕ → Flavor → ℝ → ℝ) (V : ℝ → ℝ → ℝ) (Lam : ℝ) (N : ℕ)
    (hHadron : SoftHadronVertex V Lam N)
    (hSubtraction : ∀ (n : ℕ) (x : ℝ), 0 < x → x < 1 →
      PowerSuppressed (fun Q => F n x Q - Fregions n x Q) Lam 2)
    (hWard : ∀ (n : ℕ) (x Q : ℝ), Fregions n x Q = orderConvolution C f n x Q) :
    FactorizesToAllOrders F C f Lam 2 := by
  sorry

/-- Factorisation-scale independence is a consequence of the renormalisation-group equation of
the light-ray operator, not an assumption (Layer 1.5). `hRG` is the compensation identity,
supplied by `Renormalization` Layers 5 and 6; the conclusion is the existing
`IsFactorizationScaleIndependent`. -/
theorem factorizationScaleIndependent_of_renormalizationGroup {Flavor : Type} [Fintype Flavor]
    (C : EpsilonEridani.QFT.Factorization.Scales.TwoScaleHardKernel Flavor)
    (f : EpsilonEridani.Particles.Parton.PDF.Pdf Flavor) (x Q2 muR2 : ℝ)
    (DC DF : Flavor → ℝ → ℝ)
    (hDeriv : EpsilonEridani.QFT.Factorization.Scales.ScaleDerivatives C f x Q2 muR2 DC DF)
    (hRG : ∀ L : ℝ, ∑ i : Flavor, (DC i L + DF i L) = 0) :
    EpsilonEridani.QFT.Factorization.Scales.IsFactorizationScaleIndependent C f x Q2 muR2 := by
  sorry

/-- Moment-space factorisation with remainder power two: the statement the operator product
expansion of `Renormalization` Layer 6 delivers for each moment `n ≥ 2` (Layer 1.2). -/
def MomentFactorized (M Cn : ℕ → ℝ → ℝ) (A : ℕ → ℝ) (Lam : ℝ) : Prop :=
  ∀ n : ℕ, 2 ≤ n → PowerSuppressed (fun Q => M n Q - Cn n Q * A n) Lam 2

/-! ## Layers 3 and 4: transverse-momentum-dependent factorisation and Drell–Yan -/

/-- The direction of the light-like Wilson line in the operator definition of a
transverse-momentum-dependent distribution (Layer 3.2). -/
inductive WilsonLineDirection
  | future
  | past
  deriving DecidableEq, Repr

/-- Reversal of the Wilson-line direction. -/
def WilsonLineDirection.reverse : WilsonLineDirection → WilsonLineDirection
  | .future => .past
  | .past => .future

/-- Reversal is an involution. -/
theorem WilsonLineDirection.reverse_reverse (d : WilsonLineDirection) :
    d.reverse.reverse = d := by
  cases d <;> rfl

/-- The three processes with a transverse-momentum-dependent factorisation theorem in this
roadmap (Layers 3 and 4). -/
inductive TmdProcess
  | sidis
  | annihilation
  | drellYan
  deriving DecidableEq, Repr

/-- The Wilson-line direction of the target distribution that the factorisation proof of each
process forces (Layers 3.2 and 4.4): future-pointing where the coloured partner is in the
final state, past-pointing where it is in the initial state. -/
def TmdProcess.linkDirection : TmdProcess → WilsonLineDirection
  | .sidis => .future
  | .annihilation => .future
  | .drellYan => .past

/-- The Drell–Yan direction is the reverse of the semi-inclusive one (Layer 4.4). -/
theorem linkDirection_drellYan :
    TmdProcess.drellYan.linkDirection = TmdProcess.sidis.linkDirection.reverse :=
  rfl

/-- The sign change (Layer 4.5): a distribution that is odd under reversal of the Wilson-line
direction — the time-reversal statement of `TransverseMomentumDistributions` Layer 1.4 — takes
opposite values in the two processes. -/
theorem tOdd_sign_change (f : WilsonLineDirection → ℝ → ℝ → ℝ)
    (hOdd : ∀ (d : WilsonLineDirection) (x kT : ℝ), f d.reverse x kT = -f d x kT)
    (x kT : ℝ) :
    f TmdProcess.drellYan.linkDirection x kT = -f TmdProcess.sidis.linkDirection x kT := by
  sorry

/-- Transverse-momentum-dependent factorisation for semi-inclusive deep-inelastic scattering at
leading power in the ratio `lam = q_T / Q` (Layer 3.3), in the existing vocabulary
`ApproximatesToOrder`.

`hSubtraction` is supplied by `InfraredStructure` Layers 2, 3, 5 and 6 (classification of
leading regions, deformation out of the Glauber region, power-suppressed remainder of the
nested subtraction); `hWard` by `InfraredStructure` Layers 5 and 7 (the leading-region sum is
the hard factor times the transverse convolution `conv`). -/
theorem sidis_tmd_factorization (W Wregions conv : ℝ → ℝ) (H : ℝ)
    (hSubtraction :
      EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder W Wregions 1)
    (hWard : ∀ lam : ℝ, Wregions lam = H * conv lam) :
    EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder
      W (fun lam => H * conv lam) 1 := by
  sorry

/-- Transverse-momentum-dependent factorisation for the Drell–Yan process (Layer 4.3). The
Glauber region is not removed by contour deformation graph by graph; `hCutSum` is the statement
of `InfraredStructure` Layer 6 and `FeynmanIntegrals` Layer 7 that the Glauber contribution `G`
is power suppressed after the sum over cuts. -/
theorem drellYan_tmd_factorization (W Wdeformed G conv : ℝ → ℝ) (H : ℝ)
    (hSplit : ∀ lam : ℝ, W lam = Wdeformed lam + G lam)
    (hCutSum :
      EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder
        G (fun _ => 0) 1)
    (hSubtraction :
      EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder
        Wdeformed (fun lam => H * conv lam) 1) :
    EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder
      W (fun lam => H * conv lam) 1 := by
  sorry

/-! ## Layer 5: hard exclusive processes -/

/-- An exclusive amplitude equals its factorised form up to a remainder suppressed by the
`p`-th power of the hadronic scale over the hard scale (Layer 5.1). -/
def AmplitudeFactorized (A Aapp : ℝ → ℂ) (Lam : ℝ) (p : ℕ) : Prop :=
  ∃ c Q0 : ℝ, ∀ Q : ℝ, Q0 ≤ Q → ‖A Q - Aapp Q‖ ≤ c * (Lam / Q) ^ p

/-- The polarisation of the virtual photon in hard exclusive meson production (Layer 5.3). -/
inductive PhotonPolarization
  | longitudinal
  | transverse
  deriving DecidableEq, Repr

/-- The endpoint obstruction for transversely polarised photons (Layer 5.4): with the
asymptotic meson amplitude `z (1 - z)`, the leading-order hard kernel of the transverse
amplitude behaves as `1 / z²` at the endpoint and the convolution integral diverges. -/
theorem transverse_endpoint_not_integrable :
    ¬ MeasureTheory.IntegrableOn (fun z : ℝ => z * (1 - z) / z ^ 2) (Set.Ioc (0 : ℝ) 1) := by
  sorry

/-- The corresponding longitudinal integrand `z (1 - z) / z` is integrable (Layer 5.3). -/
theorem longitudinal_endpoint_integrable :
    MeasureTheory.IntegrableOn (fun z : ℝ => z * (1 - z) / z) (Set.Ioc (0 : ℝ) 1) := by
  sorry

/-! ## Layer 6: diffractive deep-inelastic scattering -/

/-- Diffractive collinear factorisation (Layer 6.1): at each fixed `(ξ, t)` the diffractive
structure function factorises with the *inclusive* coefficient functionals `C`, which do not
depend on `ξ` or `t`. The hypotheses are the diffractive counterparts of those of
`dis_factorization_allOrders`, supplied by the same layers of `InfraredStructure`. -/
theorem diffractive_dis_factorization {Flavor : Type} [Fintype Flavor]
    (FD FDregions : ℝ → ℝ → ℕ → ℝ → ℝ → ℝ) (C : ℕ → Flavor → ℝ → CoefficientFunctional)
    (fD : ℝ → ℝ → ℕ → Flavor → ℝ → ℝ) (Lam : ℝ)
    (hSubtraction : ∀ (xi t : ℝ) (n : ℕ) (b : ℝ), 0 < b → b < 1 →
      PowerSuppressed (fun Q => FD xi t n b Q - FDregions xi t n b Q) Lam 2)
    (hWard : ∀ (xi t : ℝ) (n : ℕ) (b Q : ℝ),
      FDregions xi t n b Q = orderConvolution C (fD xi t) n b Q) :
    ∀ xi t : ℝ, FactorizesToAllOrders (FD xi t) C (fD xi t) Lam 2 := by
  sorry

/-! ## Layer 7: failures, and the hypothesis ledger -/

/-- The algebraic core of the colour-entanglement counter-model (Layer 7.2): a kernel with two
independent channels is not a product of a function of each argument. -/
theorem entangled_not_product :
    ¬ ∃ a b : ℝ → ℝ, ∀ x y : ℝ, 1 + x * y = a x * b y := by
  sorry

/-- The possible statuses of a factorisation hypothesis in the collection (Layer 7.3). -/
inductive LedgerStatus
  /-- Proved in this roadmap to all orders in perturbation theory, with no hadronic input. -/
  | provedPerturbatively
  /-- Proved in this roadmap to all orders, with `SoftHadronVertex` as the only hypothesis. -/
  | provedGivenHadronHypothesis
  /-- Proved in this roadmap at a stated finite order only; no all-orders proof exists. -/
  | provedAtFixedOrder
  /-- Remains a hypothesis: no all-orders proof exists in the literature. -/
  | noAllOrdersProof
  /-- A model assumption, not a statement derivable from QCD perturbation theory. -/
  | modelAssumption
  /-- A QED statement proved in `RadiativeCorrections` or `Photoproduction`. -/
  | qedAnalogue
  /-- The statement fails, and the failure is a theorem of this roadmap. -/
  | provedToFail
  deriving DecidableEq, Repr

/-- The factorisation hypotheses of the other roadmaps, one constructor per proposition in the
ledger of Layer 7.3. Two rows of the ledger that state the same proposition in two roadmaps
share a constructor. -/
inductive LedgerEntry
  | inclusiveOpeScaleIndependence
  | inclusiveTwistSumConvergence
  | collinearEvolutionFactorisationHypothesis
  | nuclearTargetIndependence
  | polarizedLeadingPower
  | tmdRegionCompleteness
  | tmdGlauberCancellation
  | tmdEikonalAndPowerCounting
  | tmdSignChange
  | tmdCollinearMatching
  | hadronizationCollinearSidis
  | hadronizationFractureFunctions
  | hadronizationTmdFragmentation
  | collinsFunctionUniversality
  | gpdComptonAllOrders
  | gpdMesonProductionLongitudinal
  | gpdMesonProductionTransverse
  | diffractiveDis
  | diffractiveHadronHadron
  | realEmissionSingularLimits
  | dipoleExclusiveAmplitudeEquality
  | electroweakUniversality
  | latticeShortDistance
  | mesonFormFactorHardScattering
  | mesonTransitionFormFactor
  | twistThreeCollinear
  | jetExponentiation
  | nrqcdProduction
  | hybridSmallX
  | thresholdQuarkoniumPhotoproduction
  | generalizedTmdProcesses
  | dipoleCollinearMatching
  | reggeFactorisation
  | sullivanProcess
  | nuclearContact
  | nuclearMediumProduct
  | nucleonConvolution
  | doublePartonPocketFormula
  | meanFieldClosure
  | vectorMesonDominance
  | equivalentPhoton
  | leptonMassSingularity
  deriving DecidableEq, Repr

/-- The status of each ledger entry (Layer 7.3). -/
def LedgerEntry.status : LedgerEntry → LedgerStatus
  | .inclusiveOpeScaleIndependence => .provedPerturbatively
  | .inclusiveTwistSumConvergence => .noAllOrdersProof
  | .polarizedLeadingPower => .provedGivenHadronHypothesis
  | .tmdEikonalAndPowerCounting => .provedPerturbatively
  | .tmdCollinearMatching => .provedGivenHadronHypothesis
  | .hadronizationTmdFragmentation => .provedGivenHadronHypothesis
  | .gpdMesonProductionTransverse => .provedToFail
  | .diffractiveHadronHadron => .provedToFail
  | .realEmissionSingularLimits => .provedPerturbatively
  | .dipoleExclusiveAmplitudeEquality => .noAllOrdersProof
  | .collinearEvolutionFactorisationHypothesis => .provedGivenHadronHypothesis
  | .nuclearTargetIndependence => .provedGivenHadronHypothesis
  | .tmdRegionCompleteness => .provedPerturbatively
  | .tmdGlauberCancellation => .provedPerturbatively
  | .tmdSignChange => .provedGivenHadronHypothesis
  | .hadronizationCollinearSidis => .provedGivenHadronHypothesis
  | .hadronizationFractureFunctions => .provedGivenHadronHypothesis
  | .collinsFunctionUniversality => .provedPerturbatively
  | .gpdComptonAllOrders => .provedGivenHadronHypothesis
  | .gpdMesonProductionLongitudinal => .provedGivenHadronHypothesis
  | .diffractiveDis => .provedGivenHadronHypothesis
  | .electroweakUniversality => .provedGivenHadronHypothesis
  | .latticeShortDistance => .provedPerturbatively
  | .mesonFormFactorHardScattering => .provedGivenHadronHypothesis
  | .mesonTransitionFormFactor => .provedPerturbatively
  | .twistThreeCollinear => .provedAtFixedOrder
  | .jetExponentiation => .provedPerturbatively
  | .nrqcdProduction => .noAllOrdersProof
  | .hybridSmallX => .noAllOrdersProof
  | .thresholdQuarkoniumPhotoproduction => .noAllOrdersProof
  | .generalizedTmdProcesses => .noAllOrdersProof
  | .dipoleCollinearMatching => .noAllOrdersProof
  | .reggeFactorisation => .modelAssumption
  | .sullivanProcess => .modelAssumption
  | .nuclearContact => .modelAssumption
  | .nuclearMediumProduct => .modelAssumption
  | .nucleonConvolution => .modelAssumption
  | .doublePartonPocketFormula => .modelAssumption
  | .meanFieldClosure => .modelAssumption
  | .vectorMesonDominance => .modelAssumption
  | .equivalentPhoton => .qedAnalogue
  | .leptonMassSingularity => .qedAnalogue

/-- A ledger entry is a theorem of this roadmap exactly when its status is one of the two
all-orders statuses (Layer 7.3). -/
def LedgerEntry.IsTheoremHere (e : LedgerEntry) : Prop :=
  e.status = LedgerStatus.provedPerturbatively ∨
    e.status = LedgerStatus.provedGivenHadronHypothesis

/-- The non-relativistic production hypothesis is not a theorem of this roadmap (Layer 7.3). -/
theorem nrqcdProduction_not_theoremHere :
    ¬ LedgerEntry.nrqcdProduction.IsTheoremHere := by
  sorry

end

end EpsilonEridaniRoadmaps.FactorizationTheorems

import EpsilonEridani

/-!
# Jets, event shapes, and the strong coupling: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by the signatures below.

First, a final state is a `Multiset` of momenta in the same abstract `(V, g)` that
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.DisKinematics` uses, so a jet observable and a DIS
kinematic invariant speak about the same objects. A multiset, so that no observable carries an
ordering hypothesis and so that two partons of equal momentum are two partons.

Second, collinear safety is an exact invariance and infrared safety is a limit, and the two are
separate definitions. An observable can satisfy both without being continuous in its argument,
which is exactly the situation for a recombination algorithm's jet multiplicity, so the two are
never conflated into a continuity hypothesis.

Third, a jet algorithm appears here as an inductively defined step relation on multisets, with
its minimality side conditions written out, rather than as a recursive function. Termination,
existence of a terminal state and uniqueness under a separation hypothesis are then three
separate theorems about that relation, and every safety theorem is about the relation rather than
about one implementation of it. The executable `Float`-valued Durham algorithm in
`EpsilonEridani.Generator.Jets` is a refinement target of that relation (README 2.7) and not its
definition; stating the refinement needs `EpsilonEridani.Generator.Jets` imported explicitly,
since the root module does not re-export it.

Fourth, an extracted coupling is a structure carrying a scheme and a scale, never a bare real, so
that a statement comparing two extractions cannot be written without the conversion.

The Kinoshita–Lee–Nauenberg finiteness statement of README 0.5 is deliberately absent. Stating it
requires the soft and collinear factorisation of the real-emission contribution as a hypothesis,
and that hypothesis cannot be expressed against the pinned API; naming it as a `Prop`-valued field
would assert nothing, so it stays in the README until the factorisation itself is stateable.
-/

namespace EpsilonEridaniRoadmaps.JetsAndEventShapes

open EpsilonEridani.QFT.Scattering.DIS.Kinematics

variable {V : Type} [AddCommGroup V] [Module ℝ V]

/-! ## Layer 0: final states, observables, and infrared and collinear safety -/

/-- A hadronic final state: a finite multiset of momenta in the momentum space `V`. -/
structure FinalState (V : Type) [AddCommGroup V] [Module ℝ V] where
  /-- The momenta of the final-state particles, with multiplicity. -/
  momenta : Multiset V

/-- An observable is a real-valued function of a final state. Jet multiplicities, jet momentum
components and event shapes are all of this type. -/
abbrev Observable (V : Type) [AddCommGroup V] [Module ℝ V] := FinalState V → ℝ

/-- The total momentum of a final state. -/
def FinalState.totalMomentum (s : FinalState V) : V := s.momenta.sum

/-- Adding one momentum `p` to a final state. Infrared safety is a statement about the limit of
this operation as `p → 0`. -/
def addSoft (s : FinalState V) (p : V) : FinalState V := ⟨p ::ₘ s.momenta⟩

/-- Replacing one copy of `p` by the collinear pair `z • p` and `(1 - z) • p`. Collinear safety
is exact invariance under this operation for `z ∈ [0, 1]`. -/
def splitCollinear [DecidableEq V] (s : FinalState V) (p : V) (z : ℝ) : FinalState V :=
  ⟨(z • p) ::ₘ (((1 - z) • p) ::ₘ s.momenta.erase p)⟩

/-- Collinear safety: exact invariance under splitting any constituent into a collinear pair. -/
def IsCollinearSafe [DecidableEq V] (O : Observable V) : Prop :=
  ∀ (s : FinalState V), ∀ p ∈ s.momenta, ∀ z : ℝ, 0 ≤ z → z ≤ 1 →
    O (splitCollinear s p z) = O s

/-- Infrared safety: the value on a state with an added momentum tends to the value on the
original state as the added momentum tends to zero. A limit condition, not continuity of `O`. -/
def IsSoftSafe [TopologicalSpace V] (O : Observable V) : Prop :=
  ∀ s : FinalState V, Filter.Tendsto (fun p : V => O (addSoft s p)) (nhds 0) (nhds (O s))

/-- Infrared and collinear safety. This is the hypothesis under which an observable has a finite
fixed-order prediction. -/
structure IsIRCSafe [DecidableEq V] [TopologicalSpace V] (O : Observable V) : Prop where
  /-- Invariance under collinear splitting. -/
  collinear : IsCollinearSafe O
  /-- Vanishing sensitivity to an infinitely soft addition. -/
  soft : IsSoftSafe O

/-- Particle multiplicity: the standard unsafe observable. -/
def multiplicity : Observable V := fun s => (s.momenta.card : ℝ)

/-- Multiplicity is not collinear safe: splitting any nonzero momentum changes it by one. -/
theorem multiplicity_not_collinearSafe [DecidableEq V] (p : V) (hp : p ≠ 0) :
    ¬ IsCollinearSafe (multiplicity (V := V)) := sorry

/-- Multiplicity is not infrared safe: adding any momentum changes it by one, uniformly in the
momentum, so no limit as the momentum tends to zero can return the original value. -/
theorem multiplicity_not_softSafe [TopologicalSpace V] :
    ¬ IsSoftSafe (multiplicity (V := V)) := sorry

/-- Total momentum is collinear safe, the trivial positive example. -/
theorem totalMomentum_invariant [DecidableEq V] (s : FinalState V) (p : V) (hp : p ∈ s.momenta)
    (z : ℝ) : (splitCollinear s p z).totalMomentum = s.totalMomentum := sorry

/-! ## Layer 1: the Breit frame and the hemisphere decomposition -/

/-- A frame is a timelike reference vector. Energies, angles and hemispheres are all relative to
one, and no definition below leaves it implicit. -/
structure Frame (g : Bilin V) where
  /-- The timelike reference vector. -/
  n : V
  /-- The reference vector is timelike in the signature `(+,-,-,-)`. -/
  timelike : 0 < g n n

/-- The energy of a momentum in a frame. -/
noncomputable def Frame.energy {g : Bilin V} (F : Frame g) (p : V) : ℝ :=
  g p F.n / Real.sqrt (g F.n F.n)

/-- The cosine of the angle between two momenta in a frame, as the normalised inner product of
their spatial parts. A roadmap target (README 1.1): the definition needs the spatial projection
and its norm, together with the lemma that for a massless momentum the norm equals the energy. -/
noncomputable def Frame.cosAngle {g : Bilin V} (F : Frame g) (a b : V) : ℝ := sorry

/-- A Breit frame of a deep-inelastic configuration: a frame in which the momentum transfer has
vanishing time component and lies along a spacelike unit axis, with `+axis` the incoming-parton
direction, so the struck quark recoils into the current hemisphere `-axis`. -/
structure BreitFrame (g : Bilin V) (K : DisKinematics V) extends Frame g where
  /-- The spacelike axis along which the momentum transfer points. -/
  axis : V
  /-- The axis is a spacelike unit vector. -/
  axis_unit : g axis axis = -1
  /-- The momentum transfer has no time component in this frame. -/
  q_time_zero : g K.q toFrame.n = 0
  /-- The momentum transfer has spatial magnitude `Q` along the axis. -/
  q_along_axis : K.q = Real.sqrt (DisKinematics.Q2 g K) • axis

/-- A Breit frame exists whenever the momentum transfer is spacelike. -/
theorem exists_breitFrame (g : Bilin V) (K : DisKinematics V) (hQ : 0 < DisKinematics.Q2 g K) :
    Nonempty (BreitFrame g K) := sorry

/-- Any two Breit frames of the same configuration have the same axis, so they differ only by a
rotation about it. -/
theorem breitFrame_axis_unique {g : Bilin V} {K : DisKinematics V} (B B' : BreitFrame g K) :
    B.axis = B'.axis := sorry

/-- The current hemisphere: the constituents on the struck-quark side of the plane transverse to
the Breit axis. -/
noncomputable def currentHemisphere {g : Bilin V} {K : DisKinematics V} (B : BreitFrame g K)
    (s : FinalState V) : FinalState V :=
  ⟨@Multiset.filter _ (fun p => g p B.axis < 0) (Classical.decPred _) s.momenta⟩

/-- The current-hemisphere restriction of a safe observable is safe. -/
theorem currentHemisphere_ircSafe [DecidableEq V] [TopologicalSpace V] {g : Bilin V}
    {K : DisKinematics V} (B : BreitFrame g K) {O : Observable V} (hO : IsIRCSafe O) :
    IsIRCSafe (fun s => O (currentHemisphere B s)) := sorry

/-! ## Layer 2: jet algorithms -/

/-- The data of a sequential-recombination algorithm: a pair distance, a beam distance, and a
recombination scheme. Symmetry and nonnegativity of the pair distance are carried as fields
because every safety proof consumes them.

The pair distance is an ordered function with symmetry as a field, rather than a function on
`Sym2 V`. The unordered formulation would make symmetry hold by construction, but every distance
this roadmap instantiates — `durhamDist`, `genKtDist`, `flavourKtDist` — is written on ordered
arguments, and the flavour variant of Layer 4 branches on a property of the pair that is
naturally stated that way. The field is the price of that uniformity and is discharged once per
algorithm. -/
structure ClusteringMeasure (V : Type) [AddCommGroup V] [Module ℝ V] where
  /-- Distance between two pseudojets. -/
  pairDist : V → V → ℝ
  /-- Distance of a pseudojet from the beam. -/
  beamDist : V → ℝ
  /-- How two pseudojets are merged. -/
  recombine : V → V → V
  /-- The pair distance does not depend on the order of the pair. -/
  pairDist_symm : ∀ a b, pairDist a b = pairDist b a
  /-- The pair distance is nonnegative. -/
  pairDist_nonneg : ∀ a b, 0 ≤ pairDist a b

/-- The Durham distance `2 min(E_a², E_b²)(1 - cos θ_ab)/Q²`, in the same form as the executable
`EpsilonEridani.Generator.Jets.durhamY` but over `ℝ`. -/
noncomputable def durhamDist {g : Bilin V} (F : Frame g) (Q2 : ℝ) (_hQ2 : 0 < Q2) (a b : V) : ℝ :=
  2 * min (F.energy a ^ 2) (F.energy b ^ 2) * (1 - F.cosAngle a b) / Q2

/-- The generalised distance with exponent `p` and radius `R`: `p = 1` is `k_T`, `p = 0` is
Cambridge–Aachen, `p = -1` is anti-`k_T`. -/
noncomputable def genKtDist {g : Bilin V} (F : Frame g) (p R : ℝ) (_hR : 0 < R) (a b : V) : ℝ :=
  min (F.energy a ^ (2 * p)) (F.energy b ^ (2 * p)) *
    (2 * (1 - F.cosAngle a b)) / R ^ 2

/-- One step of the algorithm: either merge the pair realising the minimal pair distance, when
that distance is below every beam distance and below the cut, or declare the pseudojet realising
the minimal beam distance to be a completed jet and remove it. The minimality conditions quantify
over pairs of distinct positions by asking for a decomposition of the same multiset. -/
inductive ClusterStep (m : ClusteringMeasure V) (yCut : ℝ) : Multiset V → Multiset V → Prop
  /-- Merge the closest pair. -/
  | merge (rest : Multiset V) (a b : V)
      (hpair : ∀ (c d : V) (rest' : Multiset V),
        c ::ₘ (d ::ₘ rest') = a ::ₘ (b ::ₘ rest) → m.pairDist a b ≤ m.pairDist c d)
      (hbeam : ∀ c ∈ a ::ₘ (b ::ₘ rest), m.pairDist a b ≤ m.beamDist c)
      (hcut : m.pairDist a b < yCut) :
      ClusterStep m yCut (a ::ₘ (b ::ₘ rest)) (m.recombine a b ::ₘ rest)
  /-- Complete a jet against the beam. -/
  | beam (rest : Multiset V) (a : V)
      (hbeam : ∀ c ∈ a ::ₘ rest, m.beamDist a ≤ m.beamDist c)
      (hpair : ∀ (c d : V) (rest' : Multiset V),
        c ::ₘ (d ::ₘ rest') = a ::ₘ rest → m.beamDist a ≤ m.pairDist c d) :
      ClusterStep m yCut (a ::ₘ rest) rest

/-- Every step strictly decreases the number of pseudojets. This is the measure the termination
argument uses, in place of the explicit fuel argument that the executable algorithm carries. -/
theorem ClusterStep.card_lt {m : ClusteringMeasure V} {yCut : ℝ} {s t : Multiset V}
    (h : ClusterStep m yCut s t) : t.card < s.card := sorry

/-- A multiset on which no step applies: the output of the algorithm. -/
def IsTerminal (m : ClusteringMeasure V) (yCut : ℝ) (s : Multiset V) : Prop :=
  ∀ t, ¬ ClusterStep m yCut s t

/-- Termination and existence of an output: every input reaches a terminal multiset in finitely
many steps. -/
theorem exists_terminal (m : ClusteringMeasure V) (yCut : ℝ) (s : Multiset V) :
    ∃ t, Relation.ReflTransGen (ClusterStep m yCut) s t ∧ IsTerminal m yCut t := sorry

/-- Uniqueness of the output under a separation hypothesis on the distance measure. The
hypothesis cannot be dropped: with a tie in the pair distances the terminal multiset genuinely
depends on which minimising pair is taken, which is also the source of the discontinuity of jet
multiplicity in the input momenta. -/
theorem terminal_unique {m : ClusteringMeasure V} {yCut : ℝ} {s t₁ t₂ : Multiset V}
    (hsep : ∀ a b c d : V, m.pairDist a b = m.pairDist c d → (a = c ∧ b = d) ∨ (a = d ∧ b = c))
    (h₁ : Relation.ReflTransGen (ClusterStep m yCut) s t₁) (ht₁ : IsTerminal m yCut t₁)
    (h₂ : Relation.ReflTransGen (ClusterStep m yCut) s t₂) (ht₂ : IsTerminal m yCut t₂) :
    t₁ = t₂ := sorry

/-- In the `E` scheme a merge conserves total momentum. The statement for a whole history, and
the corresponding defect for the `p` scheme, are README 2.3. -/
theorem merge_sum (m : ClusteringMeasure V) (a b : V) (rest : Multiset V)
    (hE : ∀ x y : V, m.recombine x y = x + y) :
    (m.recombine a b ::ₘ rest).sum = (a ::ₘ (b ::ₘ rest)).sum := sorry

/-! ## Layer 3: event shapes -/

/-- Thrust: the supremum over spatial directions of the projected momentum fraction. A roadmap
target (README 3.1); the definition needs the spatial sphere of the frame, and the existence of a
maximising thrust axis is the accompanying theorem. -/
noncomputable def thrust {g : Bilin V} (F : Frame g) (s : FinalState V) : ℝ := sorry

/-- The thrust variable, normalised so that the two-jet configuration sits at zero. -/
noncomputable def tau {g : Bilin V} (F : Frame g) (s : FinalState V) : ℝ := 1 - thrust F s

/-- The angularity family with exponent `a`, normalised so that the two-jet configuration sits at
zero. A roadmap target (README 3.2). -/
noncomputable def angularity {g : Bilin V} (F : Frame g) (a : ℝ) (s : FinalState V) : ℝ := sorry

/-- The angularity at exponent zero is the thrust variable. -/
theorem angularity_zero {g : Bilin V} (F : Frame g) : angularity F 0 = tau F := sorry

/-- Angularities are infrared and collinear safe for exponents below two. -/
theorem angularity_ircSafe [DecidableEq V] [TopologicalSpace V] {g : Bilin V} (F : Frame g)
    {a : ℝ} (ha : a < 2) : IsIRCSafe (angularity F a) := sorry

/-- Collinear safety fails at exponent two, which is why the hypothesis above is not cosmetic. -/
theorem angularity_two_not_collinearSafe [DecidableEq V] {g : Bilin V} (F : Frame g) :
    ¬ IsCollinearSafe (angularity F 2) := sorry

/-- The two-jet endpoint is at zero and the observable is nonnegative. -/
theorem angularity_nonneg {g : Bilin V} (F : Frame g) {a : ℝ} (ha : a < 2) (s : FinalState V) :
    0 ≤ angularity F a s := sorry

/-! ## Layer 4: resummation -/

/-- The leading-logarithmic radiator kernel of an event shape, with colour factor `C` and
coupling `alphaS`, as a function of the logarithm of the inverse observable. -/
noncomputable def radiatorKernel (C alphaS : ℝ) : ℝ → ℝ :=
  fun l => 2 * C * alphaS / Real.pi * l

/-- The resummed cumulative distribution, defined as an instance of the library's Sudakov form
factor rather than as a fresh exponential, so that its positivity and boundary values are
inherited from `EpsilonEridani.QFT.Shower.sudakov_pos`, `sudakov_self` and `sudakov_le_one`. -/
noncomputable def resummedCumulant (C alphaS v : ℝ) : ℝ :=
  EpsilonEridani.QFT.Shower.sudakov (radiatorKernel C alphaS) 0 (Real.log (1 / v))

/-- Positivity of the resummed distribution. Immediate from
`EpsilonEridani.QFT.Shower.sudakov_pos`, and recorded here to fix the intended route. -/
theorem resummedCumulant_pos (C alphaS v : ℝ) : 0 < resummedCumulant C alphaS v := sorry

/-- The radiator diverges at the two-jet endpoint, so the resummed cumulant vanishes there. -/
theorem resummedCumulant_tendsto_zero (C alphaS : ℝ) (hC : 0 < C) (hA : 0 < alphaS) :
    Filter.Tendsto (fun v => resummedCumulant C alphaS v) (nhdsWithin 0 (Set.Ioi 0)) (nhds 0) :=
  sorry

/-! ## Layer 5: extraction of the strong coupling -/

/-- A renormalisation scheme tag. An extracted coupling is meaningless without one. -/
inductive Scheme
  /-- The modified minimal-subtraction scheme. -/
  | msbar
  /-- A momentum-subtraction scheme. -/
  | mom

/-- An extracted coupling: a value, a scheme and a scale. Never a bare real, so that a comparison
between two extractions cannot be written without the conversion map. -/
structure ExtractedCoupling where
  /-- The numerical value. -/
  value : ℝ
  /-- The renormalisation scheme it is defined in. -/
  scheme : Scheme
  /-- The renormalisation scale it is quoted at. -/
  scale : ℝ

/-- The data of an extraction: a prediction as a function of the coupling and the observable
value, on a fit range. -/
structure ExtractionSetup where
  /-- The cumulative prediction, as a function of the coupling and the observable value. -/
  prediction : ℝ → ℝ → ℝ
  /-- Lower end of the fit range. -/
  fitLo : ℝ
  /-- Upper end of the fit range. -/
  fitHi : ℝ
  /-- The fit range is nonempty. -/
  fit_lt : fitLo < fitHi

/-- Local well-posedness of the extraction at a single observable value: where the prediction's
derivative in the coupling is nonzero, the prediction is locally injective and the coupling is
recovered from the measured value. -/
theorem extraction_locally_injective (S : ExtractionSetup) (a₀ v : ℝ)
    (hv : v ∈ Set.Ioo S.fitLo S.fitHi) (hderiv : deriv (fun a => S.prediction a v) a₀ ≠ 0) :
    ∃ u : Set ℝ, IsOpen u ∧ a₀ ∈ u ∧ Set.InjOn (fun a => S.prediction a v) u := sorry

/-! ## Layer 6: flavoured and heavy-quark jets -/

/-- A flavoured final state. The flavour type is an additive group, so that the antiparticle is
negation and the net flavour of a submultiset is a sum; the intended instance is the flavour type
of `EpsilonEridani.Particles.Parton.Basic`, and giving it that group structure is a roadmap
target. -/
structure FlavouredFinalState (Fl V : Type) [AddCommGroup Fl] [AddCommGroup V] [Module ℝ V] where
  /-- The flavoured constituents. -/
  constituents : Multiset (Fl × V)

/-- The net flavour of a flavoured final state. -/
def netFlavour {Fl : Type} [AddCommGroup Fl] (s : FlavouredFinalState Fl V) : Fl :=
  (s.constituents.map Prod.fst).sum

/-- Net flavour is unchanged by adding a flavour-neutral momentum. -/
theorem netFlavour_addSoft {Fl : Type} [AddCommGroup Fl] (s : FlavouredFinalState Fl V) (p : V) :
    netFlavour (⟨(0, p) ::ₘ s.constituents⟩ : FlavouredFinalState Fl V) = netFlavour s := sorry

/-- The flavour-`k_T` pair distance: the generalised distance, with the minimum of the energies
replaced by the maximum when exactly one member of the pair carries flavour. That replacement is
the whole mechanism by which the algorithm becomes flavour safe. -/
noncomputable def flavourKtDist {Fl : Type} [AddCommGroup Fl] {g : Bilin V} (F : Frame g)
    (p R : ℝ) (hR : 0 < R) (a b : Fl × V) : ℝ :=
  if (a.1 = 0) = (b.1 = 0) then genKtDist F p R hR a.2 b.2
  else max (F.energy a.2 ^ (2 * p)) (F.energy b.2 ^ (2 * p)) *
    (2 * (1 - F.cosAngle a.2 b.2)) / R ^ 2

/-- The massless quark-to-quark-gluon splitting function at energy fraction `z` and angle
`theta`. Taken as data from `CollinearEvolution`; a roadmap target here. -/
noncomputable def masslessSplitting (z theta : ℝ) : ℝ := sorry

/-- The same splitting function for a quark of mass `m` and energy `E`. -/
noncomputable def massiveSplitting (m E z theta : ℝ) : ℝ := sorry

/-- The dead cone: below the angle `m / E` the massive splitting function is suppressed relative
to the massless one by the square of the angle in units of that scale. This is the fixed-order
statement; whether the suppression survives for the resummed angular emission spectrum is an open
question and is not stated here as a theorem. -/
theorem deadCone_bound (m E z theta : ℝ) (hm : 0 < m) (hE : m < E) (hTheta : 0 < theta)
    (hlt : theta < m / E) :
    massiveSplitting m E z theta ≤ (theta * E / m) ^ 2 * masslessSplitting z theta := sorry

end EpsilonEridaniRoadmaps.JetsAndEventShapes

# Roadmap: diffraction, rapidity gaps, and the Pomeron

Diffractive deep-inelastic scattering: events with a large rapidity gap, in which the target either
stays intact or dissociates into a low-mass system. The mathematical content is a second
factorisation theorem, with its own set of distributions, and the Regge language in which the
gap-producing exchange is described.

The development runs in one direction. First the kinematics of an event with an identified surviving
target, where the relevant identities — the relation `x = ξ β` among the three momentum fractions,
and the relation between the diffractive mass and the parton fraction — are exact and are proved as
such. Then the structure functions built from that cross section, and the precise sense in which a
`t`-integrated measurement fails to determine a `t`-differential prediction. Then diffractive parton
distributions and the collinear factorisation theorem for diffractive deep-inelastic scattering,
whose substance is that the coefficient functions are the *same* objects as in the inclusive case,
together with the statement that the corresponding theorem for diffractive hadron-hadron scattering
does not hold. Then Regge factorisation, which is a further hypothesis imposed on top of the
theorem and not a consequence of it, with the Pomeron trajectory and flux and the normalisation
ambiguity they carry. Then the analyticity and unitarity input — the optical theorem and dispersion
relations — that connects the trajectory to the energy dependence of cross sections. Finally nuclear
diffraction, where coherent and incoherent channels are separated by an exact identity about
averaging over target configurations, and the dipole description is matched to the collinear one in
the region where both apply.

Both inclusive diffraction off a proton and coherent diffraction off a nucleus are here, because
they share the factorisation statement. Exclusive production of a specific final state through
photon exchange is `Photoproduction`; deeply virtual exclusive production is
`GeneralizedPartonDistributions`.

The application the roadmap is built towards is a formal statement of diffractive collinear
factorisation whose every hypothesis is either discharged here, cited from another roadmap, or named
in prose as a gap; a proved Good–Walker identity, so that a nuclear-suppression claim rests on a
theorem about a configuration measure rather than on a picture; and a proved `x = ξ β`, so that no
downstream extraction of diffractive densities conflates the three momentum fractions. Diffraction
is the part of the EIC programme where the temptation to state a folklore relation as a theorem is
strongest, because the Regge vocabulary is old and its hypotheses are usually left implicit. This
roadmap makes each of them an explicit argument.

## Scope

Included:

- Diffractive kinematics: `ξ`, `β`, `t`, `M_X`, the exact identities `x = ξ β` and
  `β = Q² / (Q² + M_X² − t)`, and the physical region with its boundary in `t`.
- The rapidity gap in a named frame, and the gap-`ξ` relation as a two-sided bound with explicit
  error terms rather than an equality.
- The separation of target-elastic from target-dissociative diffraction, with the dissociation mass
  bound as explicit data and additivity under that partition.
- The four-fold diffractive cross section, the reduced cross section, the structure functions
  `F₂^{D(4)}` and `F_L^{D(4)}`, their `t`-integrated counterparts, and the non-uniqueness of the
  `t`-dependence given `t`-integrated data as a statement about the kernel of a linear map.
- Diffractive parton distributions: their operator definition with the final-state restriction as
  explicit data, their support, their positivity in a stated scheme, and the conditional-density
  theorem.
- Diffractive collinear factorisation, whose substance is that its coefficient functions are the
  inclusive ones; the DGLAP evolution of the distributions at fixed `ξ` and `t`, with those
  variables proved to be spectators; and the failure of the corresponding hadron-hadron statement,
  with its mechanism, so that no later result assumes universality where it does not hold.
- Regge factorisation as a hypothesis: flux in `(ξ, t)` times a distribution in `(β, μ²)`, the
  Pomeron trajectory, the multiplicative normalisation ambiguity, the sub-leading Reggeon, and the
  theorem that the factorised form is preserved by the evolution above.
- The forward elastic amplitude, the optical theorem with unitarity as an explicit hypothesis, the
  dispersion relation with its subtraction constants as data, and the resulting relation between the
  Pomeron intercept and the energy dependence of the total cross section.
- Coherent and incoherent nuclear diffraction, the Good–Walker identity relating them to the mean,
  the mean square and the variance of the amplitude over target configurations, and the theorem that
  incoherent diffraction vanishes exactly when the amplitude is configuration-independent.
- The impact-parameter transform of an azimuthally symmetric amplitude, built here, and the forward
  `t`-slope as the second moment of the impact-parameter profile.
- The leading-order matching of the dipole description to the collinear one at small `ξ` with its
  region of validity stated, nuclear suppression of coherent diffraction in the black-disc limit,
  and the diffractive-to-total ratio as a geometric consequence of full absorption.

Not included. The dipole amplitude itself, its rapidity evolution, and the saturation scale are
`SmallXAndSaturation`; this roadmap consumes a dipole amplitude as data and proves statements about
its consequences for diffraction. The inclusive structure functions, the hadronic tensor
decomposition into transverse and longitudinal parts, and the inclusive variables `x`, `y`, `Q²` are
`InclusiveStructureFunctions`; the diffractive structure functions are defined by the same
decomposition, which is imported and not restated. Splitting kernels, the running coupling, Mellin
moments and the general theory of collinear evolution are `CollinearEvolution`; this roadmap states
which equation the diffractive densities satisfy and proves that the diffractive variables do not
enter it. Nuclear ground-state densities and nuclear parton distributions are
`NuclearPartonDistributions`; the configuration measure of Layer 5 is taken from there as data.
Exclusive vector-meson and real-photon production off a nucleus, coherent or not, is
`Photoproduction`; deeply virtual exclusive production and the generalised parton distributions it
measures are `GeneralizedPartonDistributions`, including the case where the final state is a single
identified meson or photon rather than a mass-selected system. Jet algorithms, including those used
to tag a diffractive dijet system, are `JetsAndEventShapes`. Target fragmentation, that is the
hadron spectrum of a dissociated target, is `Hadronization`. QED radiative corrections relating a
measured diffractive cross section to a Born-level one are `RadiativeCorrections`. Double parton
distributions, despite the similar name, are `MultiPartonCorrelations`; nothing in this roadmap is
about two partons from the same hadron entering a hard process. Finally, the derivation of a Regge
pole from a partial-wave expansion continued in complex angular momentum — the Watson–Sommerfeld
transform — is not in scope: the trajectory enters this roadmap as an assumed analytic form supplied
as data, and Layer 4 says so explicitly rather than gesturing at a derivation it does not contain.

The material belongs in `EpsilonEridani/QFT/Scattering/DIS/Diffractive/`, alongside the existing
`EpsilonEridani/QFT/Scattering/DIS/Exclusive/`, with the diffractive distributions themselves in
`EpsilonEridani/Particles/Parton/Diffractive/`, mirroring the existing
`EpsilonEridani/Particles/Parton/GPD/` and `.../TMD/`, and the statement of the factorisation
theorem in `EpsilonEridani/QFT/Factorization/Diffractive/`, alongside
`EpsilonEridani/QFT/Factorization/DIS/`. The Regge and Good–Walker material, which is not specific
to deep-inelastic scattering, belongs in `EpsilonEridani/QFT/Scattering/Regge/` and
`EpsilonEridani/QFT/Scattering/Diffractive/GoodWalker/` respectively.

## Conventions and coordination with upstream

1. The momentum fraction lost by the target is `ξ` and the parton's fraction of the exchange is `β`;
   the inclusive Bjorken variable keeps the symbol `x` it has in `InclusiveStructureFunctions`, and
   `x = ξ β` is a proved identity, not a definition. Lean names are `xi`, `beta`, `x`. The symbol
   `xPom` is not used. The trap this avoids is a file in which two different momentum fractions are
   both called `x` and a lemma about one is applied to the other.
2. `t` is the invariant momentum transfer to the target, is non-positive throughout, and its sign is
   fixed once at the definition. The positive quantity `|t|` has its own definition `absT` with a
   lemma `absT = -t`, and every exponential or power law in the momentum transfer is written in terms
   of `absT`. The trap this avoids is a `t`-slope with the wrong sign, which is invisible in prose
   and fatal in a proof.
3. The superscripts `(4)` and `(3)` are a binding part of the name: a `D4` object is differential in
   `t`, a `D3` object is integrated over `t` across a range that is explicit data of the definition.
   The relation between them is a lemma carrying that range. The trap this avoids is comparing a
   `t`-integrated measurement with a `t`-differential prediction, or integrating twice.
4. A set of diffractive parton distributions is explicit data: a function of flavour, `β`, `μ²`, `ξ`
   and `t` with a stated support, packaged as a structure. It is never a typeclass. The factorisation
   theorem is a `Prop` relating a given structure function, a given set of distributions and a given
   set of coefficient functions. The trap this avoids is a typeclass whose instance can be produced
   for any candidate object, which turns the theorem into a tautology.
5. Regge factorisation is a `Prop` supplied as an explicit hypothesis argument to every result that
   uses it. It is never an instance, never a default, and never a field of the diffractive
   distribution structure. The trap this avoids is a downstream theorem that silently inherits the
   hypothesis and is then quoted as a consequence of QCD.
6. The Pomeron flux carries an explicit normalisation convention, fixed by its value at a stated
   reference point supplied as data. Only the product of flux and Pomeron distribution is physical,
   and this is a theorem of Layer 3. Any statement about the flux alone, or about the Pomeron
   distribution alone, carries the normalisation as an argument. The trap this avoids is comparing
   two "Pomeron parton distributions" extracted under different flux normalisations.
7. Rapidity, and hence the gap, are defined with respect to a named frame and a named axis: the
   hadronic centre-of-mass frame of the virtual photon and target, with the incoming target direction
   as positive rapidity. The frame is an argument to the definition, not a comment. The trap this
   avoids is a rapidity that changes sign between the laboratory and hadronic frames halfway through
   a development.
8. "Coherent" always means that the target nucleus remains in its ground state. It is never used to
   mean small `t`, never used to mean the absence of a measured neutron, and never used as a synonym
   for elastic. Where the intended meaning is "no nucleon was knocked out but the nucleus may be
   excited", that is a different predicate and gets a different name.
9. A configuration average is an expectation against a probability measure on a configuration space
   supplied as data, in the vocabulary of Mathlib's measure theory. Coherent, total diffractive and
   incoherent cross sections are the squared mean, the mean square and the variance of the *same*
   measurable amplitude against the *same* measure. The trap this avoids is writing the incoherent
   cross section as a difference of two separately computed and separately normalised quantities,
   which loses the identity and with it the proof.
10. No numerical value for the Pomeron intercept, the slope `α'`, the Reggeon intercept, the
    dissociation mass bound or the saturation scale is asserted anywhere in the roadmap. They are
    parameters, carrying only the inequalities a theorem actually needs, and those inequalities are
    stated as hypotheses. The trap this avoids is a theorem that is true only for one global fit.
11. The photon virtuality `Q²` and the factorisation scale `μ²` are distinct arguments. The evolution
    statement is in `μ²` at fixed `β`, `ξ` and `t`; the choice `μ² = Q²` is a substitution made at
    the point of use and is never built into a definition. The trap this avoids is an evolution
    equation that is silently also changing the kinematics of the event.
12. Anything not proved is either a `sorry`-ed theorem in `Suggested.lean` or named as a gap in this
    document's prose. It is never a `Prop`-valued structure field carrying a placeholder witness:
    such a field asserts nothing while looking like a hypothesis, and this repository has found that
    pattern hiding obligations elsewhere.
13. Target-dissociative contributions carry the dissociation mass bound `M_Y ≤ M_Y^max` as explicit
    data of the cross-section definition, and the target-elastic case is the instance with the bound
    equal to the target mass. The trap this avoids is a quantity described as "proton-elastic"
    whose definition silently admits dissociation up to several GeV, which is exactly how the
    measured and predicted normalisations come to disagree by a factor nobody can locate.
14. Where this roadmap needs an object that is absent upstream, it builds it in the shape the
    upstream library would want and says so in Layer 5. It does not wait for an upstream change, and
    it does not make any milestone contingent on one.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `QFT.Scattering.DIS.Kinematics.Basic` and `.Kinematics.Bounds` for the inclusive variables and
  their physical region, on which the diffractive region of Layer 0 is a further restriction; and
  `QFT.Scattering.DIS.Exclusive.Kinematics.Basic` for the kinematics of a final state with an
  identified hadron and hence a momentum transfer `t`, which diffraction reuses rather than
  re-deriving. `Numerics.FourMom` supplies the four-momentum arithmetic.
- `QFT.Scattering.DIS.Basic`, `.CrossSection`, `.Tensors.Basic` and `.Tensors.Longitudinal` for the
  leptonic and hadronic tensors and the transverse-longitudinal decomposition that defines what
  `F₂` and `F_L` mean. The diffractive structure functions are the same decomposition applied to a
  differently restricted final state.
- `QFT.Factorization.Basic`, `.Convolution.Basic`, `.Convolution.Collinear` and
  `.Convolution.Properties` for the collinear convolution and its algebraic properties: the
  diffractive factorisation formula is a convolution of this existing kind in the variable `β`.
  `.Convolution.Mellin` supplies the moment transform of the moment-space evolution equation.
- `QFT.Factorization.DIS.HardKernel` and `QFT.Factorization.DIS.LO` for the inclusive coefficient
  functions. These are used, not copied: the content of the diffractive factorisation theorem is an
  equation in which *these* objects appear.
- `QFT.Factorization.Evolution.Basic`, `.CollinearForm` and `.Solutions` for the form of a collinear
  evolution equation and its solution theory, and `QFT.Factorization.Scales.Basic` for the
  separation of the hard scale from the factorisation scale required by Convention 11.
- `Particles.Parton.PDF.Basic`, `.Positivity` and `.MsbarPositivity` for the shape a parton density
  has and for the scheme-dependence of positivity. Diffractive densities are built in that shape,
  and the positivity statement of Layer 2 obeys the same scheme discipline.
- `QFT.Scattering.DIS.Inference.Identifiability` for the vocabulary in which "the data does not
  determine this function" is a theorem rather than a complaint. Layer 1 uses it for the
  `t`-integration kernel.

From TauCeti:

- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.CauchyProblem.Basic` and
  `.CauchyProblem.Uniqueness`. The evolution of the diffractive densities in the factorisation scale
  is posed as a one-parameter semigroup with a generator and an abstract Cauchy problem; existence
  and uniqueness are cited and not reproved. This is also why the roadmap never reaches for the
  `TauCeti.Analysis.PDE.DirichletProblem` subtree, which is elliptic theory and does not apply to an
  evolution equation.
- `TauCeti.Analysis.Contour.PerWindow.CPV` for the Cauchy principal value in the dispersion relation
  of Layer 4; and `TauCeti.Analysis.Complex.Herglotz`,
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Nevanlinna` and `.Stieltjes.Laplace` for the
  spectral representation of a function holomorphic in a half-plane with positive imaginary part.
  That representation is the right home for the forward amplitude under the positivity hypotheses of
  Layer 4, and it replaces an appeal to an unstated "Regge behaviour".
- `TauCeti.Analysis.PositiveDefinite.AddGroup` for the positive-definiteness of the impact-parameter
  profile, which makes the second-moment expansion of Layer 5 an inequality rather than an
  assumption.
- `TauCeti.Probability.Moments.Basic` and `.Covariance` for the moment vocabulary in which the
  Good–Walker identity is the variance decomposition.
- `TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank` and `.CompactPerturbation` for the
  `t`-integration map of Layer 1: a non-uniqueness statement is a statement about the kernel of a
  Fredholm operator.
- `TauCeti.Analysis.SpecialFunctions.Beta` for the normalisation integrals of the `β`-dependence
  parametrisations used in the Examples of Layer 3.

From Mathlib: `Analysis.SpecialFunctions.Pow.Real` and `Analysis.SpecialFunctions.Log.Basic` for the
power laws in `1/ξ` and the logarithmic gap size; `Analysis.SpecialFunctions.Complex.Log` for the
signature factor of the Regge amplitude; `Analysis.SpecialFunctions.Gamma.Basic` for the residue
functions of Layer 3; `Analysis.Complex.CauchyIntegral` for the contour-integral input to the
dispersion relation; `Analysis.Calculus.Deriv.Basic` for the forward slope as a derivative at
`t = 0`; and `MeasureTheory.Integral.SetIntegral` with `MeasureTheory.Measure.WithDensity` for the
`t`-integration and the configuration measure of Layer 5.

Genuine absences, each with what the roadmap does instead:

- ⚠ Bessel functions are absent from both Mathlib and TauCeti, and the impact-parameter transform of
  Layer 5 needs the radial kernel conventionally called `J₀`. The roadmap defines that kernel by its
  integral representation as an average of a cosine over the azimuthal angle, proves the four
  properties it actually uses — boundedness by one, value one at the origin, smoothness in the
  transferred momentum, and the second-order Taylor expansion at zero — and records in the file that
  this object is `J₀` and that its natural home is upstream. Nothing here is contingent on that.
- ⚠ Legendre functions of complex degree, and any machinery for continuing a partial-wave expansion
  in angular momentum, are absent from TauCeti and are not available in Mathlib at the pinned
  revision. The Watson–Sommerfeld derivation of a Regge pole is therefore not reachable, and the
  roadmap does not pretend otherwise: the trajectory is supplied as data with the analytic form
  assumed, as stated under Scope and again in Layer 4.
- ⚠ TauCeti has no notion of ill-posedness and no regularisation theory. The non-uniqueness of the
  `t`-dependence in Layer 1 is therefore stated in the only fully rigorous form available: the
  `t`-integration map has non-trivial kernel, exhibited by an explicit element. No statement about
  conditioning or stability is made.
- ⚠ Nothing named "diffractive", "Regge", "Pomeron" or "dipole" exists anywhere in EpsilonEridani at
  the pinned revision. Every definition in this roadmap is new; the upstream material above supplies
  the surrounding vocabulary, not the subject.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the invariant
  product, `Physlib.Relativity.Tensors.MetricTensor` and
  `Physlib.Relativity.Tensors.Contraction.Basic` for index contraction, and
  `Physlib.Relativity.LorentzGroup.Basic` for the covariance group, with
  `Physlib.Relativity.Tensors.RealTensor.Vector.Causality.LightLike` for the rapidity-gap
  kinematics.

## Layer 0: diffractive kinematics and the rapidity gap

References: EIC Yellow Report §7.1.6 and §7.3.2; Wolf, *Rept. Prog. Phys.* **73** (2010) 116202,
§2; Barone and Predazzi, *High-Energy Particle Diffraction*, ch. 1–2.

### 0.1 The diffractive final state and its variables

An event is the data of the incoming lepton momentum `k`, the outgoing lepton momentum `k'`, the
incoming target momentum `P`, and a distinguished outgoing target-like momentum `P'`, together with
the remaining system `X`. Write `q = k - k'` and `Δ = P - P'`. Define

- `Q² = -q²`, `x = Q² / (2 P·q)`, `y = P·q / P·k`, from `InclusiveStructureFunctions`;
- `t = Δ²`;
- `ξ = Δ·q / P·q`;
- `β = Q² / (2 Δ·q)`;
- `M_X² = (q + Δ)²` and `M_Y² = P'²`.

Theorems to prove, all exact and with no mass or high-energy approximation:

- `x = ξ β`. The proof is a two-line cancellation and it is the single most important identity in
  the layer, because it is the reason `β` deserves to be called a momentum fraction of the exchange.
- `β = Q² / (Q² + M_X² - t)`. Equivalently `M_X² = Q²(1/β - 1) + t`.
- `ξ = (Q² + M_X² - t) / (Q² + W² - M²)` where `W² = (q + P)²` and `M² = P²`, so that `ξ` is
  determined by the measured mass of the diffractive system and the event kinematics.
- The `y`-independence of `ξ`, `β` and `t`: they are functions of `q`, `P`, `P'` alone.

### 0.2 The physical region and its boundary

Define the diffractive region as the subset of parameter space on which an event with the above
variables exists with `P'` on shell and `X` of non-negative invariant mass squared.

- Prove `0 < β ≤ 1` and `x ≤ ξ ≤ 1`, and that `β = 1` holds exactly when `M_X² = t`, which in the
  physical region forces `M_X² = t = 0`; hence `β = 1` is the exclusive edge and is excluded from
  the diffractive region proper by a stated open condition.
- Prove `t ≤ 0` on the region, so that Convention 2 is a theorem and not a stipulation.
- Compute the boundary of the `t` range at fixed `ξ` and `M_Y`: the accessible momentum transfers
  satisfy `|t| ≥ t_min(ξ, M, M_Y)`, with `t_min` obtained from the two-body threshold condition, and
  prove that in the target-elastic case `M_Y = M` this reduces to `t_min = ξ² M² / (1 - ξ)`.
- Prove the region is non-empty for every `Q² > 0` and every sufficiently small `ξ`, by exhibiting a
  configuration. A roadmap that defines a region and never shows it inhabited has defined nothing.
- Prove the `ξ → x` limit sends `β → 1`, and that the map `(x, Q², ξ, t) ↦ (β, Q², ξ, t)` is a
  bijection of the region onto its image, so that either variable set may be used and the change of
  variables has a computed Jacobian.

### 0.3 Rapidity and the gap

Fix the frame and axis of Convention 7.

- Define the rapidity of a four-momentum with respect to that axis, and prove it is additive under
  boosts along the axis.
- Define the rapidity gap of an event as the length of the largest interval of rapidity containing
  no final-state particle, and prove it is well defined for a finite final state.
- Prove the two-sided bound relating the gap `Δη` to `ξ`: there are explicit functions `c₁` and `c₂`
  of `M_X`, `M_Y`, `W` and the transverse momenta such that `ln(1/ξ) - c₁ ≤ Δη ≤ ln(1/ξ) + c₂`.
  The statement is a bound and not the equality `Δη = ln(1/ξ)`; the error terms are computed and
  named, and any later use of the gap-`ξ` relation carries them.
- Prove that at fixed `W` the gap is monotonically decreasing in `M_X`, which is the precise content
  of the informal claim that a large gap selects a low-mass diffractive system.

### 0.4 Target-elastic and target-dissociative contributions

- Define the target final state as either the on-shell target itself or a system of invariant mass
  `M_Y > M`, and partition the diffractive region accordingly.
- Define the diffractive cross section with dissociation bound `M_Y^max` as explicit data, per
  Convention 13.
- Prove additivity: the cross section with bound `M_Y^max` equals the target-elastic cross section
  plus the dissociative cross section restricted to `M < M_Y ≤ M_Y^max`, for any measurable
  partition of the target-side phase space by `M_Y`.
- Prove monotonicity in `M_Y^max`, and state as a definition the "elastic fraction" that any
  comparison between an elastic prediction and a mass-bounded measurement must supply.

### Examples

- The exactly target-elastic event: `M_Y = M`, with `t_min = ξ² M² / (1 - ξ)` verified from 0.2 and
  the limit `t_min → 0` as `ξ → 0` proved.
- The massless-target limit: `M = 0` gives `t_min = 0` and `ξ = (Q² + M_X²)/(Q² + W²)`, which is the
  form used in most textbook presentations; proved as a special case, not assumed.
- A gap of two units of rapidity: derive from 0.3 the resulting interval of `ξ` at fixed `W` and
  `M_X`, as an inequality with the error terms retained.
- The exclusive edge: `M_X = 0`, `β = 1`, showing where the region of this roadmap abuts the region
  of `GeneralizedPartonDistributions`, and proving that the two do not overlap on the interior.

### Dependencies

`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`,
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds`,
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic`,
`EpsilonEridani.Numerics.FourMom`, `Mathlib.Analysis.SpecialFunctions.Log.Basic`. From
`InclusiveStructureFunctions`: the definitions of `x`, `y`, `Q²`, `W²` and the inclusive physical
region.

---

## Layer 1: the diffractive cross section and the diffractive structure functions

References: EIC Yellow Report §7.1.6; H1 Collaboration, *Eur. Phys. J. C* **48** (2006) 715, §2–3;
ZEUS Collaboration, *Nucl. Phys. B* **816** (2009) 1; Wolf, *Rept. Prog. Phys.* **73** (2010)
116202, §3.

### 1.1 The four-fold cross section and the reduced cross section

- Define the cross section differential in `β`, `Q²`, `ξ` and `t` for a stated dissociation bound.
- Decompose it into transverse and longitudinal parts using the tensor decomposition of
  `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` and
  `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal` applied to the final state restricted as
  in Layer 0. This defines `F₂^{D(4)}(β, Q², ξ, t)` and `F_L^{D(4)}(β, Q², ξ, t)`.
- Define the reduced cross section `σ_r^{D(4)} = F₂^{D(4)} - (y² / (1 + (1-y)²)) F_L^{D(4)}` and
  prove the identity expressing the differential cross section as the standard kinematic prefactor
  times `σ_r^{D(4)}`. Fix the prefactor convention once, and prove the two common forms of it agree.
- Prove that `σ_r^{D(4)} = F₂^{D(4)}` exactly when `y = 0`, and state the bound on their difference
  in terms of `y` and the ratio `F_L^{D(4)} / F₂^{D(4)}`, so that a measurement quoted as `F₂^{D}`
  at non-zero `y` carries a controlled error rather than an implicit assumption.

### 1.2 `t`-integration and what it destroys

- Define `F₂^{D(3)}(β, Q², ξ) = ∫ F₂^{D(4)}(β, Q², ξ, t) dt` over an explicit range `[t_lo, t_hi]`
  supplied as data, per Convention 3, and prove the elementary linearity and monotonicity
  properties.
- Define the `t`-integration map as a bounded linear map on a suitable function space and prove it
  is bounded, with norm computed from the range.
- Prove the map has non-trivial kernel by exhibiting an explicit non-zero element: a function of `t`
  integrating to zero on the range, for instance a difference of two normalised exponentials with
  different slopes. The conclusion is the theorem that `F₂^{D(3)}` does not determine `F₂^{D(4)}`.
- Situate this in the Fredholm vocabulary: the map factors through a finite-rank map on the
  `t`-direction, so it is not injective, and the statement of non-uniqueness is a statement about
  that kernel. Use `TauCeti.Analysis.Fredholm.FiniteRank` and
  `TauCeti.Analysis.Fredholm.Criteria`; do not state anything about conditioning, which is not
  available upstream and is not claimed.
- Prove the converse direction that *is* available: under the hypothesis that the `t`-dependence is a
  single exponential with unknown slope `B`, the `t`-integrated quantity together with the slope
  determines the differential one, and the slope is determined by the ratio of two integrals over
  sub-ranges. This is the precise sense in which a slope measurement restores what integration lost.

### 1.3 The longitudinal part

- Prove the positivity constraints `F₂^{D(4)} ≥ 0` and `0 ≤ F_L^{D(4)} ≤ F₂^{D(4)}` from the
  positivity of the diagonal photon-helicity cross sections, with the hypothesis — positivity of
  the restricted hadronic tensor contracted with physical polarisation vectors — stated explicitly
  and traced back to `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`.
- Define the ratio `R^D = F_L^{D} / (F₂^{D} - F_L^{D})` where the denominator is non-zero, and prove
  the bounds on `R^D` implied by the previous item.
- Prove the separation statement: at fixed `β`, `Q²`, `ξ`, `t`, measurements at two values of `y`
  determine `F₂^{D(4)}` and `F_L^{D(4)}` uniquely, with the determinant of the two-by-two system
  computed and its non-vanishing condition stated.

### 1.4 Gap-based and mass-based selection are different functionals

- Define two selection functionals on the space of events: the mass selection, which accepts an
  event when `M_Y ≤ M_Y^max`, and the gap selection, which accepts an event when `Δη ≥ Δη^min`.
- Prove they agree on the region where Layer 0.3's bound is tight enough to decide, stating that
  region explicitly in terms of `M_Y^max`, `Δη^min` and the error terms `c₁`, `c₂`.
- Prove they differ in general, by the two-sided statement: the difference of the two induced
  measures is bounded above by the dissociative contribution with `M_Y` in the disputed band, and
  that bound is attained. The content is that the two selections are not interchangeable and that
  their difference is a specific, nameable physical contribution rather than an uncertainty.
- Define the "gap survival" of a selection as the ratio of the gap-selected to the mass-selected
  cross section at the same kinematics. This is a definition only; it acquires no properties here,
  and Layer 2.6 relies on it having none.

### Examples

- A single-exponential `t`-dependence: compute `F₂^{D(3)}` in closed form from `F₂^{D(4)}` and
  invert for the slope from two sub-range integrals, discharging 1.2's converse concretely.
- The explicit kernel element: two normalised exponentials with different slopes, whose difference
  integrates to zero over the stated range, certifying 1.2's non-uniqueness theorem with a witness.
- `y → 0`: `σ_r^{D(4)} = F₂^{D(4)}`, with the bound on the difference at `y = 0.5` retained
  symbolically.
- A mass-selected and a gap-selected cross section that differ: construct a target-side
  configuration passing one and failing the other, certifying 1.4.

### Dependencies

Layer 0. `EpsilonEridani.QFT.Scattering.DIS.CrossSection`,
`EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`,
`EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal`,
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`,
`TauCeti.Analysis.Fredholm.FiniteRank`, `TauCeti.Analysis.Fredholm.Criteria`,
`Mathlib.MeasureTheory.Integral.Bochner.Set`. From `InclusiveStructureFunctions`: the transverse and
longitudinal decomposition and the definition of the inclusive `F₂` and `F_L` that the diffractive
ones parallel.

---

## Layer 2: diffractive parton distributions and collinear factorisation

References: Collins, *Phys. Rev. D* **57** (1998) 3051, erratum *Phys. Rev. D* **61** (2000)
019902; Berera and Soper, *Phys. Rev. D* **53** (1996) 6162; Trentadue and Veneziano, *Phys. Lett.
B* **323** (1994) 201; Collins, *Foundations of Perturbative QCD*, ch. 10 and 14; EIC Yellow Report
§7.1.6; CDF Collaboration, *Phys. Rev. Lett.* **84** (2000) 5043; Kaidalov, Khoze, Martin and
Ryskin, *Eur. Phys. J. C* **21** (2001) 521.

### 2.1 The operator definition

- Define a diffractive parton distribution for a parton flavour as a light-cone operator matrix
  element in which the sum over hadronic final states is restricted to those containing the
  specified target-like system with momentum `P'`. The restriction is explicit data of the
  definition: a measurable set of final states, together with the `(ξ, t)` at which it is evaluated.
- Package the flavour-indexed family as a structure `DiffractivePartonDistributions`, carrying the
  function, the support conditions, and the scheme in which it is defined, in the shape of
  `EpsilonEridani.Particles.Parton.PDF.Basic`.
- Prove the support statement: the distribution vanishes unless `0 < β ≤ 1` and `x ≤ ξ ≤ 1`, which
  is the operator-level counterpart of Layer 0.2.
- Prove the reduction statement: summing the restriction over a complete set of target-side final
  states recovers the inclusive parton distribution of
  `EpsilonEridani.Particles.Parton.PDF.Basic`, under the hypothesis that the restriction sets
  partition the final-state space. This is the statement that makes "conditional density" more than
  a word.

### 2.2 The conditional-density theorem

- Define the target-survival probability density in `(ξ, t)` from the same matrix elements.
- Prove that the ratio of the diffractive distribution to that density is a probability density in
  `β` at fixed `(ξ, t)`, under the hypotheses of 2.1's reduction statement together with positivity.
  This is the theorem that licenses reading a diffractive distribution as "the density of a parton
  given that the target survived with this momentum loss and this momentum transfer".
- State honestly what this theorem does and does not give. It is proved at leading order in the
  scheme of `EpsilonEridani.Particles.Parton.PDF.Positivity`. Beyond leading order, positivity of a
  parton density is scheme-dependent — this is already recorded in
  `EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` — so the conditional-density reading is
  stated with the scheme as an explicit hypothesis and is *not* claimed for an arbitrary scheme.
  A roadmap that asserted probabilistic positivity of an MS-bar distribution would be asserting
  something false.

### 2.3 The factorisation theorem for diffractive deep-inelastic scattering

- State the theorem: for each `(ξ, t)` in the diffractive region, and up to corrections suppressed
  by the stated power of the hard scale,

      F₂^{D(4)}(β, Q², ξ, t) = Σ_a ∫ C_{2,a}(β/z, Q², μ²) D_a(z, μ², ξ, t) dz / z

  where `C_{2,a}` are the coefficient functions of
  `EpsilonEridani.QFT.Factorization.DIS.HardKernel` — *the same objects* appearing in the inclusive
  factorisation formula of `EpsilonEridani.QFT.Factorization.DIS.LO` — and the convolution is the
  collinear convolution of `EpsilonEridani.QFT.Factorization.Convolution.Collinear`.
- Make the substance explicit as a separate statement: the coefficient functions are independent of
  `ξ`, `t` and of the target-side restriction entirely. That independence, not the existence of some
  convolution representation, is the theorem. A formula with `ξ`-dependent coefficient functions
  would be vacuous, since any function factors that way.
- Enumerate the hypotheses as explicit arguments, each named: the hard scale is large compared with
  the transverse scales; `ξ` is small compared with one; the diffractive final state is defined by
  the identified target-like system rather than by a rapidity veto on the hadronic system; the
  distributions are those of 2.1 in the stated scheme.
- Prove the leading-order instance in full: with the leading-order coefficient functions, the formula
  reduces to `F₂^{D(4)} = Σ_a e_a² β D_a(β, Q², ξ, t)` summed over quarks and antiquarks. This is the
  instance a contributor can discharge, and it is what makes the general statement checkable.
- Record the general theorem as a `sorry`-ed target with its hypotheses. Its proof is an
  all-orders argument about the cancellation of final-state interactions between the struck quark
  and the target remnant, and this roadmap states it, names its source, and does not claim to have
  reproved it.

### 2.4 Positivity and the inclusive bound

- Prove positivity of the diffractive distributions in the scheme of 2.2.
- State the inclusive bound: the `ξ`- and `t`-integral of the diffractive distribution is bounded by
  the inclusive distribution at the same `x = ξ β`. Prove it in the parton model, where it follows
  from 2.1's reduction statement plus positivity of the complementary contributions.
- Label it correctly: beyond the parton model this is not a theorem of QCD, because the
  complementary contributions are not separately positive in a general scheme. It is stated here as
  a parton-model inequality with its hypotheses, and any downstream use carries them. This is a
  place where the literature routinely quotes the bound without them.

### 2.5 Evolution in the factorisation scale

- State the evolution equation: at fixed `ξ` and `t`, the diffractive distributions satisfy the same
  DGLAP equation in `μ²` as the inclusive distributions, with the splitting kernels of
  `CollinearEvolution` and the convolution in `β`.
- Prove that `ξ` and `t` are spectators: the generator of the evolution does not act on them, so
  the equation is a family of independent equations indexed by `(ξ, t)`. This is the formal content
  of "diffractive distributions evolve like ordinary ones".
- Pose the equation as an abstract Cauchy problem and obtain existence and uniqueness from
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and
  `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`, with the generator supplied via
  `TauCeti.Analysis.Semigroups.Generator`. Do not reprove either.
- Prove the moment-space form using `EpsilonEridani.QFT.Factorization.Convolution.Mellin`: the
  moments in `β` at fixed `(ξ, t)` satisfy a decoupled linear system with the same anomalous
  dimensions as the inclusive case.
- Prove that positivity in the scheme of 2.2 is preserved by the leading-order evolution, or, if the
  standard counterexample structure applies, state precisely the condition on the initial condition
  under which it is preserved. Whichever holds, it is proved and not assumed.

### 2.6 The failure of collinear factorisation for diffractive hadron-hadron scattering

This subsection is a negative result and is structured as one.

- Define what universality *would* mean: a single family `D_a` such that the diffractive
  deep-inelastic structure function is given by 2.3 *and* the diffractive hard cross section in
  hadron-hadron collisions is given by the corresponding convolution with the hadron-hadron
  coefficient functions and the ordinary parton distributions of the other hadron.
- State that no such family exists, and state the mechanism: in a hadron-hadron collision the
  spectator partons of the two hadrons interact, and those interactions can produce particles in the
  rapidity interval that the gap selection requires to be empty. The suppression is therefore a
  property of the pair of hadrons and of the selection, not of either hadron alone, so it cannot be
  absorbed into a distribution attached to one hadron.
- Label the status exactly. This is not a theorem proved in this roadmap and it is not a milestone
  that can be discharged: it is the assertion that the factorisation argument of 2.3 has no
  hadron-hadron analogue, supported by the absence of a proof and by the measured deficit relative
  to the factorisation prediction (CDF, *Phys. Rev. Lett.* **84** (2000) 5043). The roadmap records
  it as a boundary on the scope of 2.3.
- Enforce it structurally. Any hadron-hadron diffractive statement in EpsilonEridani takes a gap
  survival factor as an explicit datum — a function of the collision energy, the kinematics and the
  selection — with *no* assumed properties beyond membership in `[0, 1]`. In particular it is not
  assumed to be universal, not assumed to factorise, and not assumed to be independent of the hard
  process. The theorem to prove here is the consistency statement: with such a factor supplied, the
  hadron-hadron formula is a definition of that factor and carries no predictive content, which is
  precisely why the roadmap does not present it as a result.

### Examples

- The leading-order instance of 2.3 in full, `F₂^{D(4)} = Σ_a e_a² β D_a`, with the charge weights
  computed for three and four active flavours.
- A single-flavour toy model: `D_q(β, μ₀², ξ, t)` a product of a power of `β` and a power of
  `(1-β)`, normalised using `TauCeti.Analysis.SpecialFunctions.Beta`, evolved one step in the
  moment-space form of 2.5 with the leading-order non-singlet anomalous dimension, exhibiting that
  `ξ` and `t` are untouched.
- The reduction statement of 2.1 discharged on a two-element partition of the target-side final-state
  space.
- A pair of distributions satisfying 2.3 with `ξ`-dependent coefficient functions, showing that
  without the independence statement of 2.3 the formula constrains nothing. This is a
  counterexample-shaped example and it is what justifies the emphasis.

### Dependencies

Layers 0 and 1. `EpsilonEridani.QFT.Factorization.Basic`,
`EpsilonEridani.QFT.Factorization.Convolution.Basic`,
`EpsilonEridani.QFT.Factorization.Convolution.Collinear`,
`EpsilonEridani.QFT.Factorization.Convolution.Properties`,
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`,
`EpsilonEridani.QFT.Factorization.DIS.HardKernel`, `EpsilonEridani.QFT.Factorization.DIS.LO`,
`EpsilonEridani.QFT.Factorization.Evolution.Basic`,
`EpsilonEridani.QFT.Factorization.Evolution.CollinearForm`,
`EpsilonEridani.QFT.Factorization.Evolution.Solutions`,
`EpsilonEridani.QFT.Factorization.Scales.Basic`,
`EpsilonEridani.Particles.Parton.PDF.Basic`, `EpsilonEridani.Particles.Parton.PDF.Positivity`,
`EpsilonEridani.Particles.Parton.PDF.MsbarPositivity`,
`TauCeti.Analysis.Semigroups.Defs`, `TauCeti.Analysis.Semigroups.Generator`,
`TauCeti.Analysis.Semigroups.CauchyProblem.Basic`,
`TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`,
`TauCeti.Analysis.SpecialFunctions.Beta`. From `CollinearEvolution`: the splitting kernels, their
anomalous dimensions, and the running coupling. From `InclusiveStructureFunctions`: the inclusive
factorisation formula that 2.3 parallels and whose coefficient functions it reuses.

---

## Layer 3: Regge factorisation, the Pomeron trajectory and the flux

References: Ingelman and Schlein, *Phys. Lett. B* **152** (1985) 256; Donnachie and Landshoff,
*Phys. Lett. B* **296** (1992) 227; Collins, *An Introduction to Regge Theory and High Energy
Physics*, ch. 2 and 8; H1 Collaboration, *Eur. Phys. J. C* **48** (2006) 715, §5–6; EIC Yellow
Report §7.1.6.

### 3.1 Regge factorisation as a hypothesis

- Define a `ReggeFactorisedForm` as the data of a flux `f : ℝ → ℝ → ℝ` in `(ξ, t)` and a family of
  distributions `d_a` in `(β, μ²)` only.
- Define the `Prop` that a given set of diffractive distributions is Regge-factorised with respect
  to that data: `D_a(β, μ², ξ, t) = f(ξ, t) · d_a(β, μ²)` for all arguments in the region.
- Prove the elementary consequences: the ratio `D_a / D_b` is independent of `(ξ, t)`, and the
  `β`-shape at fixed `μ²` is independent of `(ξ, t)`. These are the statements a measurement tests,
  and each is an equality between measurable ratios rather than a statement about an unobservable
  flux.
- State the status. This is a hypothesis, per Convention 5. No instance is constructed, nothing in
  Layers 0–2 implies it, and it is known to fail at large `ξ` where 3.4's second term is required.
  Every result below that uses it takes it as an argument.

### 3.2 The trajectory, the flux and the energy dependence

- Define a linear trajectory `α(t) = α₀ + α' t` with `α₀` and `α'` parameters, per Convention 10.
- Define the flux as `f(ξ, t) = N · R(t) · ξ^{1 - 2α(t)}`, where `R` is a residue function supplied
  as data — the Examples use a squared dipole form factor and an exponential — and `N` is fixed by
  the normalisation convention of Convention 6.
- Prove positivity of the flux for positive `N` and positive `R`.
- Prove the monotonicity statement: at fixed `t`, `f` is increasing in `1/ξ` exactly when
  `2α(t) > 1`, and compute the exponent.
- Prove the shrinkage statement: the logarithmic `t`-slope of the flux at fixed `ξ` is
  `B(ξ) = B_R + 2α' ln(1/ξ)` where `B_R` is the slope of `R`, so the slope grows logarithmically as
  `ξ` decreases. This is the formal content of "shrinkage of the diffractive peak", and it is an
  identity given the linear trajectory, not a separate assumption.
- Derive the energy dependence: under 3.1 and the definitions above, the `ξ`-dependence of
  `F₂^{D(3)}` at fixed `β` and `Q²` is a power of `1/ξ` with exponent computed from `α₀`, `α'` and
  the `t`-range of the integration. The `t`-integration is where `α'` enters the exponent, and the
  theorem records that the effective exponent of a `t`-integrated quantity is *not* `2α₀ - 1`.

### 3.3 The normalisation ambiguity

- Prove the invariance theorem: for any non-zero constant `c`, the pairs `(f, d)` and
  `(c f, c⁻¹ d)` define the same diffractive distributions. Hence the factorised form determines
  only the product, and neither factor separately.
- Conclude the corollary that a "Pomeron parton distribution" is not an observable, and that any
  statement about one carries the normalisation convention as an argument.
- Prove the quotient statement: the map from pairs to distributions descends to an injection on the
  quotient by that scaling action, under the hypothesis that `d` is not identically zero. This makes
  precise that the *only* ambiguity is the overall constant.
- Fix the convention: `N` is determined by requiring a stated value of the `t`-integrated flux at a
  reference `ξ`, supplied as data.

### 3.4 The sub-leading Reggeon

- Define a two-component form: the diffractive distributions as a sum of a Pomeron term and a
  Reggeon term, each Regge-factorised with its own flux, trajectory and distributions.
- Prove the relative-growth theorem: under the hypothesis `α₀^{IP} > α₀^{IR}`, the ratio of the
  Reggeon to the Pomeron contribution at fixed `t` is a positive power of `ξ`, hence increases with
  `ξ`. The exponent is computed. This is the precise statement of why a second term is needed at
  larger `ξ` and not at small `ξ`.
- Prove that the two-component form is not Regge-factorised in the sense of 3.1 unless the two
  distribution families are proportional. The two-component model is therefore a *weakening* of the
  hypothesis, and the roadmap records which theorems survive the weakening: everything in 3.2 holds
  term by term, while the ratio statements of 3.1 do not.
- State the interference question honestly: whether a Pomeron-Reggeon interference term is present is
  not settled by the framework above, and this roadmap does not assert its absence. The
  two-component form is a definition, and the statement that it is complete is a hypothesis
  carried explicitly wherever it is used.

### 3.5 Compatibility of Regge factorisation with evolution

- Prove the preservation theorem: if the diffractive distributions are Regge-factorised at an initial
  scale `μ₀²` with flux `f` and distributions `d_a(β)`, then, because the generator of Layer 2.5
  acts only on `(β, μ²)` and is independent of `(ξ, t)`, the solution is Regge-factorised at every
  `μ²` with the *same* flux `f` and with `d_a` evolved. The proof is that the semigroup commutes with
  multiplication by a function of the spectator variables.
- State the corollary and its limit: the hypothesis of 3.1 is stable under evolution, so it may be
  imposed at one scale and used at another. This is a consistency property of the hypothesis and is
  not evidence for it; a false hypothesis can be perfectly stable. The roadmap states this because
  the stability result is frequently presented as support for the hypothesis.

### Examples

- The squared dipole residue `R(t) = (1 - t/m₀²)^{-4}` with `m₀²` supplied as data: compute the
  `t`-integrated flux in closed form and verify 3.3's normalisation condition.
- The exponential residue `R(t) = exp(B_R t)`: compute the `t`-integrated flux, verify 3.2's
  shrinkage identity, and compute the effective `ξ` exponent of 3.2 exactly.
- A Pomeron distribution of the form `β^a (1-β)^b` normalised with
  `TauCeti.Analysis.SpecialFunctions.Beta`, showing 3.3's rescaling invariance concretely by
  exhibiting two pairs giving identical distributions.
- A two-component instance with `α₀^{IP} = 1.1` and `α₀^{IR} = 0.6` treated symbolically — the
  numbers appear only as instantiations in an example, never in a theorem statement, per
  Convention 10 — verifying the growth exponent of 3.4.

### Dependencies

Layers 0–2. `Mathlib.Analysis.SpecialFunctions.Pow.Real`,
`Mathlib.Analysis.SpecialFunctions.Gamma.Basic`, `Mathlib.MeasureTheory.Integral.Bochner.Set`,
`TauCeti.Analysis.SpecialFunctions.Beta`, `TauCeti.Analysis.Semigroups.Generator`.

---

## Layer 4: analyticity, unitarity and the forward amplitude

References: Eden, Landshoff, Olive and Polkinghorne, *The Analytic S-Matrix*, ch. 1–2; Barone and
Predazzi, *High-Energy Particle Diffraction*, ch. 3–5; Gribov, *The Theory of Complex Angular
Momenta*, ch. 1; Froissart, *Phys. Rev.* **123** (1961) 1053; Martin, *Phys. Rev.* **129** (1963)
1432; Donnachie and Landshoff, *Phys. Lett. B* **296** (1992) 227; EIC Yellow Report §7.3.2.

### 4.1 The forward amplitude, analyticity and crossing

- Define the elastic amplitude `A(s, t)` as data, with the normalisation fixed once and stated.
- Define, as explicit named `Prop`s, the two hypotheses this layer needs: that for fixed `t ≤ 0` the
  amplitude is the boundary value of a function holomorphic in the upper half `s`-plane off a stated
  cut, and that it satisfies a stated crossing relation exchanging `s` and the crossed channel
  variable.
- Prove the consequences of holomorphy alone: the real and imaginary parts on the cut are related by
  the Cauchy integral formula of `Mathlib.Analysis.Complex.CauchyIntegral`, and the amplitude is
  determined on the upper half-plane by its boundary values.
- State the status plainly. These hypotheses are not proved here and are not provable from anything
  in EpsilonEridani at the pinned revision: they are axioms of analytic S-matrix theory. They are
  supplied as arguments, they are named, and they are cited. The roadmap does not present them as
  results.

### 4.2 The optical theorem

- State the unitarity relation for the two-body amplitude as an explicit hypothesis: the
  anti-Hermitian part of the transition operator equals the appropriate sum over intermediate
  states.
- Prove the optical theorem from it in the forward direction: `Im A(s, 0)` equals the total cross
  section times the stated flux factor. Fix the flux factor once, and prove that the two
  normalisation conventions in common use differ by the factor computed here, so that a cross
  section quoted in one convention is never silently used in the other.
- Prove the positivity corollary: `Im A(s, 0) ≥ 0` for all physical `s`, which is what makes the
  representation theory of 4.3 applicable.
- Prove the elastic-unitarity inequality: the elastic cross section is bounded by the total cross
  section, with the hypothesis that the intermediate-state sum is over a superset of the elastic
  channel.

### 4.3 The dispersion relation and the spectral representation

- Prove the once-subtracted dispersion relation: the real part of the forward amplitude is given by
  a Cauchy principal-value integral of its imaginary part plus a subtraction constant supplied as
  data. Use `TauCeti.Analysis.Contour.PerWindow.CPV`. State the growth hypothesis under which the
  contour at infinity is discarded, and do not suppress it.
- Prove the number of subtractions needed as a function of the assumed asymptotic growth, so that
  "once-subtracted" is a consequence of a stated bound rather than a choice.
- Identify the forward amplitude, divided by the appropriate power of `s`, as a Herglotz function
  under the positivity of 4.2 and the holomorphy of 4.1, and obtain its Nevanlinna–Stieltjes
  representation from `TauCeti.Analysis.Complex.Herglotz` and
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Nevanlinna`. The representing measure is the
  spectral content of the amplitude, and the representation is where the "Regge behaviour" of the
  next subsection becomes a statement about that measure rather than an assumed power law.

### 4.4 The Regge form and the energy dependence of cross sections

- Define the single-pole Regge form of the amplitude as explicit data: `A(s, t)` proportional to a
  residue times `s^{α(t)}` times the signature factor, with the trajectory of Layer 3.2 and the
  signature factor written using `Mathlib.Analysis.SpecialFunctions.Complex.Log`.
- Prove that this form is consistent with the crossing relation of 4.1 exactly when the signature
  factor takes the stated value, so that the signature factor is determined and not chosen.
- Prove the total cross section statement: from 4.2 and the Regge form, `σ_tot` is proportional to
  `s^{α₀ - 1}`, with the constant computed.
- Prove the elastic slope statement: the forward logarithmic `t`-slope of the elastic cross section
  is `B(s) = B_0 + 2α' ln s`, matching Layer 3.2's shrinkage identity, and prove the two are the
  same statement in the two variables.
- Prove the ratio statement: the ratio of the real to the imaginary part of the forward amplitude is
  determined by `α₀` alone in the single-pole form, giving a relation between that ratio and the
  exponent of the cross section that is independent of the residue. This is a genuine prediction of
  the form and is a good acceptance example.

### 4.5 The unitarity bound and the domain of the single-pole form

- State the Froissart–Martin bound as a cited external result: under Mandelstam analyticity and
  polynomial boundedness, the total cross section grows no faster than a squared logarithm of `s`.
  Its proof requires analyticity in a domain that is not available in this development. ⚠ It is a
  named gap, and it is cited, not proved.
- Prove the consequence that *is* available: the single-pole form with `α₀ > 1` gives a power-law
  growth that violates that bound for sufficiently large `s`, so the single-pole form with a
  supercritical intercept cannot hold for all `s`. The theorem is an implication with the bound as
  hypothesis; its content is a computed upper limit on the `s` range over which the form can be
  used.
- Define, as data, the domain of validity of a Regge form: a range of `s` and `t` on which it is
  asserted. Every result in 4.4 carries it. The trap avoided is quoting a supercritical intercept as
  though it described asymptotics.
- Prove the shadowing inequality used by Layer 6: with a purely imaginary forward amplitude and an
  impact-parameter profile bounded by one — the unitarity limit — the total cross section is bounded
  by twice the geometric area of the profile's support.

### Examples

- The single-pole form with a linear trajectory: verify the signature relation, compute `σ_tot`,
  compute the slope, and compute the real-to-imaginary ratio, discharging 4.4 end to end.
- Two poles with different intercepts: prove the cross section is asymptotically governed by the
  larger intercept, and compute the `s` at which the two contributions are equal.
- A sharp-edged fully absorptive profile: compute the total and elastic cross sections and verify
  the bound of 4.5.
- The subtraction count: an amplitude bounded by `s` requires one subtraction; an amplitude bounded
  by `s²` requires two. Proved from 4.3's growth criterion, not asserted.

### Dependencies

Layer 3 for the trajectory. `TauCeti.Analysis.Contour.PerWindow.CPV`,
`TauCeti.Analysis.Complex.Herglotz`,
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Nevanlinna`,
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`,
`Mathlib.Analysis.Complex.CauchyIntegral`, `Mathlib.Analysis.SpecialFunctions.Complex.Log`,
`Mathlib.Analysis.Calculus.Deriv.Basic`,
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.CrossingSymmetry` for the crossing relation's
diagrammatic counterpart.

---

## Layer 5: coherent and incoherent nuclear diffraction, and Good–Walker

References: Good and Walker, *Phys. Rev.* **120** (1960) 1857; Miettinen and Pumplin, *Phys. Rev. D*
**18** (1978) 1696; Frankfurt, Guzey and Strikman, *Phys. Rept.* **512** (2012) 255; EIC Yellow
Report §7.3.2; Kowalski, Motyka and Watt, *Phys. Rev. D* **74** (2006) 074016, §2.

### 5.1 The configuration space

- Define a target configuration space as a measurable space with a probability measure supplied as
  data, per Convention 9. For a nucleus, the configurations are the positions of the nucleons and
  their internal states; the measure is the ground-state distribution, taken from
  `NuclearPartonDistributions` as data and not constructed here.
- Define the diffractive amplitude as a measurable function of the configuration, the impact
  parameter and the kinematics, with integrability hypotheses stated: integrable for the mean and
  square-integrable for the mean square.
- Prove that the space of square-integrable amplitudes with the given measure is the natural home
  for the identities below, and that both the mean and the mean square are finite under the stated
  hypotheses. A variance identity with an undefined second moment is not an identity.

### 5.2 The Good–Walker identity

- Define the coherent cross section as proportional to the squared modulus of the configuration
  *average* of the amplitude, the total diffractive cross section as proportional to the average of
  the squared modulus, and the incoherent cross section as their difference.
- Prove the identity: the incoherent cross section equals the variance of the amplitude with respect
  to the configuration measure. Use `TauCeti.Probability.Moments.Basic` and
  `TauCeti.Probability.Moments.Covariance`. The proof needs nothing but square-integrability, and
  this is the point: the separation of coherent from incoherent diffraction is a theorem about a
  measure, not a modelling assumption.
- Prove non-negativity of the incoherent cross section as a corollary, with equality characterised
  in 5.5.
- Prove the additivity statement: coherent plus incoherent equals total diffractive, exactly, with
  all three defined against the same measure. Convention 9 exists so that this is provable.

### 5.3 From the ground state to the configuration average

- Define the coherent channel physically: the final state in which the target nucleus is in its
  ground state, as the matrix element of the amplitude operator between ground states.
- State, as an explicit named hypothesis, the condition under which that matrix element equals the
  configuration average of 5.2: the configuration variables are frozen on the interaction time
  scale, and the configuration measure is the ground-state probability density in those variables.
- Prove the equality under that hypothesis, and prove the corresponding statement for the total
  diffractive cross section by completeness of the target states.
- ⚠ Label the status: the frozen-configuration hypothesis is an approximation, not a theorem, and it
  is what connects the exact identity of 5.2 to the physical channels. This roadmap proves the
  identity, states the hypothesis, and does not claim to derive the hypothesis. A presentation that
  slid between the two would be asserting that Good–Walker is exact, which it is not.

### 5.4 The impact-parameter transform and the forward slope

- Define the two-dimensional Fourier transform of an amplitude in impact parameter, and prove that
  for an azimuthally symmetric amplitude it reduces to a radial integral against the kernel
  `K(Δ, b) = (1/2π) ∫₀^{2π} cos(Δ b cos φ) dφ`.
- ⚠ This kernel is the Bessel function `J₀`, which is absent from both Mathlib and TauCeti. The
  roadmap defines it by the integral above and proves exactly the four properties it uses: `|K| ≤ 1`,
  `K(0, b) = 1`, smoothness in `Δ`, and the expansion `K(Δ, b) = 1 - (Δ b)²/4 + O(Δ⁴ b⁴)`. The file
  records that this is `J₀` and that it belongs upstream in the shape Mathlib's special-function
  library would want. Nothing here waits for that.
- Prove the slope theorem: for a non-negative azimuthally symmetric profile, the logarithmic
  `t`-slope of the coherent cross section at `t = 0` equals one quarter of the normalised second
  moment of the profile in impact parameter, with the normalisation stated. The proof is the
  expansion above plus differentiation under the integral sign, with the domination hypothesis
  stated.
- Prove the corollary that the coherent slope is governed by the nuclear size and the incoherent
  slope by the nucleon size, as the statement that the two profiles have second moments differing by
  the stated ratio. The physical claim is thereby reduced to a computable property of two measures.
- Prove positive-definiteness of the transform of a non-negative profile using
  `TauCeti.Analysis.PositiveDefinite.AddGroup`, and deduce that the coherent cross section is
  maximal at `t = 0`.

### 5.5 Incoherent diffraction measures fluctuations

- Prove the vanishing theorem: the incoherent cross section is zero exactly when the amplitude is
  almost everywhere equal to a constant with respect to the configuration measure. Hence incoherent
  diffraction at a given kinematics is non-zero precisely when the amplitude fluctuates over
  configurations.
- Prove the monotonicity statement: if one configuration measure is a pushforward-refinement of
  another in the stated sense, the incoherent cross section does not decrease. This makes "more
  fluctuation gives more incoherent diffraction" a theorem with a hypothesis rather than an
  intuition.
- Prove the independent-scatterer instance: for an amplitude built from `A` independent identically
  distributed nucleon contributions in the stated eikonal form, compute the coherent and incoherent
  cross sections in closed form and verify their `A`-scaling — the coherent part scaling as `A²` in
  the dilute limit and the incoherent part as `A`. The dilute limit is a stated hypothesis and the
  deviation from it is what Layer 6 quantifies.

### Examples

- A two-configuration target with amplitudes `A₁` and `A₂` and weights `p` and `1-p`: all three
  cross sections in closed form, and the variance identity verified by direct computation. This is
  the smallest complete check of 5.2 and it should exist in the file.
- A configuration-independent amplitude: incoherent cross section zero, certifying 5.5.
- A Gaussian impact-parameter profile: the transform computed and the slope theorem of 5.4 verified
  against the exact result, with the kernel `K` used and `J₀` never named as an upstream object.
- The independent-scatterer nucleus of 5.5 with `A` nucleons, verifying the `A²` and `A` scalings.

### Dependencies

Layers 0–4. `TauCeti.Probability.Moments.Basic`, `TauCeti.Probability.Moments.Covariance`,
`TauCeti.Analysis.PositiveDefinite.AddGroup`, `Mathlib.MeasureTheory.Measure.WithDensity`,
`Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.Analysis.Calculus.Deriv.Basic`. From
`NuclearPartonDistributions`: the nuclear ground-state configuration measure, supplied as data.
From `LightNuclei`: nothing is taken; the light-nucleus configuration measures live there and this
layer is stated for an arbitrary configuration measure so that it applies to them without
modification.

---

## Layer 6: the dipole correspondence and nuclear suppression

References: EIC Yellow Report §7.3.1 and §7.3.2; Kowalski, Motyka and Watt, *Phys. Rev. D* **74**
(2006) 074016; Frankfurt, Guzey and Strikman, *Phys. Rept.* **512** (2012) 255; Wolf, *Rept. Prog.
Phys.* **73** (2010) 116202, §7.

### 6.1 The matching statement

- Take a dipole amplitude as data from `SmallXAndSaturation`: a function of dipole size, impact
  parameter and rapidity, with the properties proved there, in particular the unitarity bound
  `0 ≤ N ≤ 1`.
- Define the dipole expression for the diffractive structure function at small `ξ`: the sum of the
  quark-antiquark and quark-antiquark-gluon contributions, each an integral over dipole size and
  the photon light-cone wave function, with the wave function supplied as data.
- State the matching theorem with its hypotheses named: at small `ξ`, fixed `Q²`, and to leading
  order and leading logarithmic accuracy, the dipole expression equals the collinear expression of
  Layer 2.3 with diffractive distributions given by the stated integrals of the dipole amplitude.
- Label the status. This is a leading-order, leading-logarithm matching statement on a stated
  kinematic region, not an equivalence of the two frameworks. ⚠ Beyond that accuracy the two
  organisations of the calculation are not known to agree, and this roadmap does not assert that
  they do. The theorem is stated with its accuracy as part of the statement.

### 6.2 Diffractive distributions from the dipole amplitude

- Define the gluon diffractive distribution in the matching region by the explicit integral of the
  squared dipole amplitude over impact parameter and dipole size, with the region of validity as
  data.
- Prove the properties inherited from the dipole amplitude: non-negativity, and boundedness by the
  value obtained at the unitarity limit.
- Prove the consistency theorem: the so-defined distribution satisfies the evolution equation of
  Layer 2.5 to leading logarithmic accuracy, under the stated hypothesis relating the rapidity
  evolution of the dipole amplitude to the `μ²` evolution of the distribution. Where that hypothesis
  is what is at issue, the theorem is stated as an implication and the hypothesis is named. It is
  not silently discharged.
- Prove the small-`β` statement: in the matching region the quark-antiquark-gluon contribution
  dominates at small `β` and the quark-antiquark contribution at large `β`, as an inequality between
  the two integrals with the crossover located in terms of the stated parameters.

### 6.3 Nuclear suppression of coherent diffraction

- Define the impulse approximation for a nucleus: the coherent cross section obtained by replacing
  the nuclear dipole amplitude with `A` times the nucleon one, and prove it is the dilute limit of
  Layer 5.5's independent-scatterer instance.
- Define the suppression factor as the ratio of the true coherent cross section to the impulse
  approximation.
- Prove the suppression theorem: with the eikonal form of the nuclear amplitude and the unitarity
  bound `N ≤ 1`, the suppression factor is at most one, and in the black-disc limit, where the
  amplitude saturates at one over a region, the coherent cross section is bounded by the squared
  geometric area of that region and hence scales as `A^{4/3}` rather than `A²` under the stated
  assumption on the nuclear radius. The `A`-scaling is proved from the radius scaling as an explicit
  hypothesis, not quoted.
- Prove the saturation-scale statement: the suppression factor deviates from one once the dipole
  size exceeds the inverse saturation scale of `SmallXAndSaturation`, with the deviation bounded
  below by an expression in the saturation scale. This is the formal content of "coherent diffraction
  is sensitive to saturation", and it is an inequality rather than a slogan.

### 6.4 The diffractive-to-total ratio in the black-disc limit

- Define the ratio of the coherent diffractive to the total cross section at fixed kinematics,
  using the total cross section of Layer 4.2 and the coherent cross section of Layer 5.2.
- Prove the black-disc theorem: for an amplitude that is purely imaginary, azimuthally symmetric,
  equal to one on a disc of radius `R` and zero outside, the total cross section is `2πR²`, the
  coherent cross section is `πR²`, and the ratio is exactly one half. Each hypothesis is required
  and the proof exhibits where.
- Prove the perturbation statement: for a profile within `ε` of the black disc in the stated norm,
  the ratio is within a computed multiple of `ε` of one half. This turns the exact statement into a
  usable one.
- Prove the real-part correction: with a non-zero real part of the forward amplitude, the ratio
  exceeds one half by a term computed from the real-to-imaginary ratio of Layer 4.4. The clean
  one-half is therefore a limit with two named hypotheses, and this roadmap states both.

### Examples

- The black disc: all three quantities of 6.4 in closed form, the ratio exactly one half, and each
  hypothesis shown to be used.
- A Gaussian profile: the ratio computed exactly and shown to differ from one half, certifying that
  6.4's sharp-edge hypothesis is not decorative.
- The dilute nucleus: suppression factor one, recovering the impulse approximation from 6.3 and
  linking to Layer 5.5's `A²` scaling.
- The saturated nucleus: suppression factor computed in the black-disc limit and the `A^{4/3}`
  scaling verified from the radius hypothesis.

### Dependencies

Layers 2, 4 and 5. From `SmallXAndSaturation`: the dipole amplitude, its unitarity bound, its
rapidity evolution, and the saturation scale — all as data with the properties proved there. From
`NuclearPartonDistributions`: the nuclear radius and configuration measure. From
`Photoproduction`: nothing; the exclusive vector-meson channels that share the dipole amplitude are
developed there and this layer uses only the mass-selected inclusive diffractive channel.
`Mathlib.MeasureTheory.Integral.Bochner.Set`, `Mathlib.Analysis.SpecialFunctions.Pow.Real`.

## Dependency graph

```
    InclusiveStructureFunctions        CollinearEvolution
                |                              |
                v                              |
  Layer 0  diffractive kinematics, rapidity gap|
                |                              |
                v                              |
  Layer 1  cross section, F2^D, FL^D, t-integration
                |                              |
                v                              v
  Layer 2  diffractive PDFs, collinear factorisation, evolution,
           and the failure of hadron-hadron factorisation
                |
                v
  Layer 3  Regge factorisation (hypothesis), trajectory, flux, Reggeon
                |
                v
  Layer 4  analyticity, optical theorem, dispersion relation, Regge form
                |
                +------------------------------+
                v                              v
  Layer 5  Good-Walker, coherent/incoherent  Layer 6  dipole matching,
           nuclear diffraction  ------------>         nuclear suppression
                ^                                          ^
                |                                          |
  NuclearPartonDistributions                    SmallXAndSaturation
```

Layers 0 and 1 are self-contained given `InclusiveStructureFunctions`. Layer 2 additionally needs
`CollinearEvolution`. Layer 3 needs Layer 2 only for the object it makes a hypothesis about. Layer 4
is independent of Layers 0–2 except for the trajectory of Layer 3, and could be read first. Layer 5
needs Layer 4 for the total cross section and `NuclearPartonDistributions` for the configuration
measure. Layer 6 is the only layer that needs `SmallXAndSaturation`.

## Acceptance examples

The roadmap is complete when the following are statements in EpsilonEridani with proofs, or, where
marked, with explicitly named hypotheses:

1. `x = ξ β` and `β = Q² / (Q² + M_X² - t)`, both exact, both proved from the definitions in
   Layer 0.1 with no approximation.
2. `t_min = ξ² M² / (1 - ξ)` in the target-elastic case, proved from the two-body threshold
   condition, together with a proof that the diffractive region is non-empty.
3. The two-sided bound `ln(1/ξ) - c₁ ≤ Δη ≤ ln(1/ξ) + c₂` with `c₁` and `c₂` computed, and a proof
   that no equality of the form `Δη = ln(1/ξ)` holds on the region.
4. An explicit non-zero function of `t` integrating to zero over the stated range, certifying that
   `F₂^{D(3)}` does not determine `F₂^{D(4)}`, together with the recovery theorem under the
   single-exponential hypothesis.
5. `F₂^{D(4)} = Σ_a e_a² β D_a(β, Q², ξ, t)` proved at leading order from the factorisation formula,
   and the general formula stated with its hypotheses, its coefficient functions *being* those of
   `EpsilonEridani.QFT.Factorization.DIS.HardKernel`, and their independence of `ξ` and `t` stated
   as the substance of the theorem.
6. A proof that the evolution generator of Layer 2.5 annihilates `ξ` and `t`, so that the
   diffractive evolution is the inclusive one at fixed diffractive variables, with existence and
   uniqueness obtained from `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`.
7. A hadron-hadron diffractive cross-section definition carrying a gap survival factor as explicit
   data with no assumed properties, together with the theorem that the resulting formula defines
   that factor rather than predicting it — the formal counterpart of Layer 2.6.
8. The rescaling invariance `(f, d) ↦ (c f, c⁻¹ d)` proved, together with the injectivity of the
   induced map on the quotient, certifying that only the flux-times-distribution product is
   determined.
9. The shrinkage identity `B(ξ) = B_R + 2α' ln(1/ξ)` proved from the linear trajectory, and the
   theorem that a Regge-factorised initial condition stays Regge-factorised under the evolution of
   Layer 2.5 with the same flux.
10. The optical theorem proved from the stated unitarity hypothesis with the flux factor fixed, and
    the once-subtracted dispersion relation proved with its growth hypothesis named, using
    `TauCeti.Analysis.Contour.PerWindow.CPV`.
11. The Good–Walker identity proved as a variance decomposition, with the two-configuration example
    computed in closed form and the vanishing theorem characterising when incoherent diffraction is
    zero.
12. The forward slope theorem relating the coherent `t`-slope at `t = 0` to one quarter of the
    second moment of the impact-parameter profile, proved using the locally defined radial kernel and
    its Taylor expansion, with the kernel's four properties proved and its identity with `J₀`
    recorded in a comment.
13. The black-disc theorem: total `2πR²`, coherent `πR²`, ratio exactly one half, with the
    sharp-edge and purely-imaginary hypotheses shown to be used, and the Gaussian counterexample
    showing the ratio is not one half without them.
14. The nuclear suppression theorem: the suppression factor is at most one under the unitarity bound
    `N ≤ 1`, with the `A^{4/3}` scaling in the black-disc limit proved from an explicit hypothesis
    on the nuclear radius.

## References

- R. Abdul Khalek et al., *Science Requirements and Detector Concepts for the Electron-Ion Collider:
  EIC Yellow Report*, Nucl. Phys. A **1026** (2022) 122447, arXiv:2103.05419. Chapter 7, §7.1.6
  "Inclusive and hard diffraction" and §7.3.2 "Diffraction".
- J. C. Collins, *Proof of factorization for diffractive hard scattering*, Phys. Rev. D **57** (1998)
  3051; erratum Phys. Rev. D **61** (2000) 019902. The factorisation theorem of Layer 2.3 and the
  hadron-hadron statement of Layer 2.6.
- J. C. Collins, *Foundations of Perturbative QCD*, Cambridge University Press, 2011. Chapters 10 and
  14 for the operator definitions and the structure of a factorisation proof.
- A. Berera and D. E. Soper, *Behavior of diffractive parton distribution functions*, Phys. Rev. D
  **53** (1996) 6162. The conditional-density reading of Layer 2.2.
- L. Trentadue and G. Veneziano, *Fracture functions: an improved description of inclusive hard
  processes in QCD*, Phys. Lett. B **323** (1994) 201. The semi-inclusive distributions of which the
  diffractive ones are a special case.
- G. Ingelman and P. E. Schlein, *Jet structure in high mass diffractive scattering*, Phys. Lett. B
  **152** (1985) 256. The origin of the flux-times-distribution form of Layer 3.1.
- A. Donnachie and P. V. Landshoff, *Total cross sections*, Phys. Lett. B **296** (1992) 227. The
  two-component trajectory picture of Layers 3.4 and 4.4.
- P. D. B. Collins, *An Introduction to Regge Theory and High Energy Physics*, Cambridge University
  Press, 1977. Chapters 2 and 8.
- V. N. Gribov, *The Theory of Complex Angular Momenta*, Cambridge University Press, 2003.
  Chapter 1, for the complex-angular-momentum derivation that this roadmap cites and does not
  reproduce.
- R. J. Eden, P. V. Landshoff, D. I. Olive and J. C. Polkinghorne, *The Analytic S-Matrix*,
  Cambridge University Press, 1966. Chapters 1 and 2 for the analyticity and crossing hypotheses of
  Layer 4.1.
- V. Barone and E. Predazzi, *High-Energy Particle Diffraction*, Springer, 2002. Chapters 1–5.
- M. Froissart, *Asymptotic behavior and subtractions in the Mandelstam representation*, Phys. Rev.
  **123** (1961) 1053; A. Martin, *Unitarity and high-energy behavior of scattering amplitudes*,
  Phys. Rev. **129** (1963) 1432. The bound cited in Layer 4.5.
- M. L. Good and W. D. Walker, *Diffraction dissociation of beam particles*, Phys. Rev. **120** (1960)
  1857. The identity of Layer 5.2.
- H. I. Miettinen and J. Pumplin, *Diffraction scattering and the parton structure of hadrons*,
  Phys. Rev. D **18** (1978) 1696. The fluctuation reading of Layer 5.5.
- L. Frankfurt, V. Guzey and M. Strikman, *Leading twist nuclear shadowing phenomena in hard
  processes with nuclei*, Phys. Rept. **512** (2012) 255. Nuclear diffraction and the suppression of
  Layer 6.3.
- H. Kowalski, L. Motyka and G. Watt, *Exclusive diffractive processes at HERA within the dipole
  picture*, Phys. Rev. D **74** (2006) 074016. The impact-parameter dipole formulation used in
  Layers 5.4 and 6.1.
- H1 Collaboration (A. Aktas et al.), *Measurement and QCD analysis of the diffractive
  deep-inelastic scattering cross section at HERA*, Eur. Phys. J. C **48** (2006) 715. The
  measurement conventions of Layer 1, including the reduced cross section and the two-component fit.
- ZEUS Collaboration (S. Chekanov et al.), *Deep inelastic scattering with leading protons or large
  rapidity gaps*, Nucl. Phys. B **816** (2009) 1. The gap-based and proton-tagged selections
  compared in Layer 1.4.
- CDF Collaboration (T. Affolder et al.), *Diffractive dijets with a leading antiproton in p̄p
  collisions at √s = 1800 GeV*, Phys. Rev. Lett. **84** (2000) 5043. The measured deficit cited in
  Layer 2.6.
- A. B. Kaidalov, V. A. Khoze, A. D. Martin and M. G. Ryskin, *Probabilities of rapidity gaps in
  high energy interactions*, Eur. Phys. J. C **21** (2001) 521. The gap survival factor of
  Layer 2.6.
- G. Wolf, *Review of high energy diffraction in real and virtual photon proton scattering at
  HERA*, Rept. Prog. Phys. **73** (2010) 116202. A survey covering Layers 0, 1 and 6.

# Roadmap: QED radiative corrections

The corrections to a lepton-nucleon cross section from real and virtual photon emission by the
charged particles. These are not a small refinement: at the kinematics of a lepton-nucleon
collider, radiation shifts the reconstructed invariants away from the true ones, so that a
measured cross section is a convolution rather than a value. This roadmap treats the corrections
as the mathematical object they are — a kernel relating a Born cross section to an observed one —
and the unfolding of that convolution as an inverse problem.

The development has four distinct mathematical characters, and the layers are organised by them.
First, a finiteness statement: the separately divergent virtual and real contributions are
regularised, their sum is proved regulator-independent, and the regulator is removed. Second, a
kinematic statement: a radiated photon makes the invariants reconstructed from a measurement
differ from the invariants of the hard scattering, and the difference depends on which
reconstruction method is used, so that the shift is a family of maps rather than a single one.
Third, an operator statement: the observed cross section is the image of the Born cross section
under an integral operator with a positive kernel, and the QED lepton density that generates that
kernel solves an evolution equation. Fourth, an inverse-problem statement: recovering the Born
cross section is an operator inversion, the iteration universally used to perform it is a
fixed-point iteration, and its convergence has hypotheses that can be stated and proved.

The final application is that every extracted structure function, asymmetry and exclusive
observable in the library carries a correction of this kind, and that the correction is applied by
a procedure whose validity is a theorem rather than a habit. In particular the roadmap delivers
the statement of when a radiative correction may be written as a multiplicative factor, a bound on
the error made when it is written that way anyway, and a convergence criterion for the iterative
extraction that is used in practice without being stated.

The roadmap is deliberately conservative about what QED can be asked to deliver. Every quantity is
kept at finite lepton mass, every regulator is explicit data, and every limit in which a mass or a
cutoff is removed is a theorem with hypotheses. Where a standard approximation is used — the
peaking approximation, the leading-logarithmic radiator, a multiplicative correction factor — the
approximation is a named hypothesis and the result that depends on it says so.

## Scope

Included:

- The classification of the first-order corrections to inclusive lepton-nucleon scattering:
  vacuum polarisation of the exchanged photon, the lepton vertex correction, lepton self-energy on
  the external legs, real emission from the lepton line, real emission from the hadronic side, and
  the lepton-hadron emission interference, each tied to the amplitudes it comes from.
- Infrared regularisation and the cancellation of infrared divergences between the virtual and
  real contributions, as a theorem that the sum has a finite limit as the regulator is removed and
  that the limit does not depend on which regulator was used.
- The Kinoshita-Lee-Nauenberg statement for this process: which mass singularities cancel for an
  observable that is insensitive to collinear splitting, and which survive as collinear logarithms
  absorbed into a lepton density.
- Soft-photon exponentiation in the Yennie-Frautschi-Suura form: the eikonal current, the
  factorisation of the soft real and soft virtual factors, the exponentiated infrared form, and an
  explicit statement of what the eikonal approximation drops.
- The reconstruction of the invariants from a measurement, defined covariantly, for the electron,
  hadronic, double-angle, mixed and Sigma methods; the shift between true and reconstructed
  invariants induced by a radiated photon for each method; and the theorem that the shift vanishes
  for exactly collinear initial-state radiation for some of these methods and not for others.
- The radiative tail: the observed cross section at fixed reconstructed invariants as an integral
  over true invariants, with the support of the integration explicitly described, including the
  elastic and quasi-elastic tails and their finite-rank character in the inelasticity variable.
- The peaking approximation as a named hypothesis, defined by the approximant it replaces the
  photon angular distribution with, together with the statement of the error it makes.
- The failure of multiplicativity: the criterion for the correction operator to act as
  multiplication by a function, and a lower bound on the error of the best multiplicative
  approximation in terms of the oscillation of the Born cross section across the tail support.
- The radiator kernel as a bounded integral operator, its positivity, its normalisation, and the
  dependence of that normalisation on the soft cutoff convention.
- The structure-function method: the QED lepton densities, their coupled evolution in the QED
  logarithm as a one-parameter semigroup, the leading-logarithmic resummation as the solution of
  that evolution, and its moment-space diagonalisation.
- The unfolding problem: the inversion of the correction operator, posed with domain and codomain
  stated; the Neumann-series inverse and its validity criterion; the finite-rank obstruction
  contributed by the elastic tail; and the ill-posedness of the discretised problem as a statement
  about the singular values of a compact operator.
- Regularised inversion: the regularised inverse of the correction operator, its existence, and
  the error bound under a smoothness hypothesis on the Born cross section.
- The iterative correction-and-re-extraction scheme, its convergence as a fixed-point result with
  an explicit contraction constant, and the statement that the bin-by-bin variant converges to a
  different limit unless the multiplicativity criterion holds.
- Second-order corrections in the leading-logarithmic approximation as the second term of the
  resummed radiator, with the statement of the accuracy that resummation achieves.
- Two-photon exchange as a contribution that is not part of the radiator because it is not the
  phase-space integral of a single-photon emission; its amplitude, the observables sensitive to it,
  and the decomposition of the charge-odd cross section into two-photon exchange interference and
  the charge-odd bremsstrahlung interference which accompanies it.
- Lepton-mass effects, the collinear logarithm the mass cuts off, and the massless limit stated as
  a limit with the class of observables for which it exists identified.
- One-loop weak corrections to the neutral-current process, the separation of the QED corrections
  from the weak remainder, the scheme dependence of that separation, and the theorem that the sum
  is scheme-independent while neither part is.

Not included. The Born cross section itself, the structure functions appearing in it, and their
extraction from corrected data belong to `InclusiveStructureFunctions`; this roadmap takes the
Born cross section as a function on the kinematic domain and says nothing about its parton
content. The convolution algebra, the plus distributions, the harmonic sums and the dilogarithm
belong to `CollinearEvolution`, which builds them for the QCD splitting kernels; the QED kernels
here are instances of that vocabulary, and this roadmap does not rebuild it. The electroweak
couplings, the effective weak mixing angle and its running, and the sensitivity of precision
asymmetries to physics beyond the Standard Model belong to `ElectroweakAndBSM`; this roadmap
supplies only the separation theorem and the scheme dependence that a precision asymmetry needs in
order to quote a QED-corrected number. Polarised observables and their spin-dependent Born cross
sections belong to `SpinStructure`, and the corrections developed here apply to them unchanged
because nothing in the layers below uses unpolarisedness. Semi-inclusive and exclusive
kinematics — the additional shift of the hadronic variables when a photon is radiated in
semi-inclusive deep inelastic scattering, and the shift of the exclusive invariants in deeply
virtual Compton scattering — belong to `TransverseMomentumDistributions` and
`GeneralizedPartonDistributions` respectively, which import the correction operator from here and
state their own shift maps. The photon-hadron cross section, and the equivalent-photon description
of quasi-real photon exchange as it is used for it, belong to `Photoproduction`; the photon density
in the lepton is constructed here as one component of the coupled QED evolution, and this roadmap
says nothing about what the photon then does to the hadron. Parton-shower implementation, the
matching of QED radiation to a shower, and hadron-level final-state radiation belong to
`Hadronization` and `JetsAndEventShapes`. Nuclear targets add a coherent elastic tail with a
nuclear form factor and a Coulomb distortion of the lepton wave function; both belong to
`NuclearMedium`, which takes the kernel from here and supplies the nuclear input.

The material belongs in `EpsilonEridani/QFT/Scattering/DIS/Corrections/`, extending the existing
`EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic`. The reconstruction maps and the shift maps
belong beside the existing kinematics in `EpsilonEridani/QFT/Scattering/DIS/Kinematics/`, since
they are statements about invariants and not about corrections. The operator-inversion material
belongs in `EpsilonEridani/QFT/Scattering/DIS/Corrections/Unfolding/`, kept separate from
`EpsilonEridani.QFT.Scattering.DIS.Inference.Unfolding`, which is about inferring parton
distributions from cross sections and not about inverting a radiative kernel.

## Conventions and coordination with upstream

1. **True and reconstructed invariants are different types, not different notations.** The
   invariants of the hard scattering and the invariants computed from a measurement are carried by
   two distinct structures, so that a proof cannot silently identify them; passing from one to the
   other is always an explicit map. This avoids the trap that has cost the most in the literature:
   a correction derived at fixed true invariants and applied at fixed reconstructed ones.

2. **Invariants are defined covariantly from four-momenta; laboratory formulae are lemmas.** Each
   reconstruction method is defined by a contraction of measured momenta, and the familiar
   expressions in beam energies and polar angles are proved as its specialisation in the collider
   frame. The double-angle method is genuinely frame-dependent, so it carries the beam
   configuration as explicit data rather than hiding a frame choice. This avoids definitions that
   silently fail to transform.

3. **The emission classification is a property of amplitudes, not of momenta.** Initial-state and
   final-state radiation are labels on diagrams; a photon four-momentum does not carry them. The
   classification is therefore defined on the contributions to the amplitude, and any statement
   that separates initial from final state radiation says at which order and in which gauge the
   separation is meaningful. This avoids treating an interference term as if it belonged to one of
   the two classes.

4. **The infrared regulator is explicit data and its removal is a theorem.** Every first-order
   quantity is a function of a regulator — a photon mass, or the dimensional parameter of
   `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` — and finiteness of the
   sum is the statement that a limit exists, proved, not assumed. Nothing in the roadmap writes
   down a finite expression and asserts that the divergences cancelled.

5. **Corrections are operators; a correction factor is a licensed special case.** The relation
   between Born and observed cross sections is stated as the action of an integral operator. A
   multiplicative factor appears only where the criterion of Layer 1 is discharged, and results
   that use one carry that criterion as a hypothesis. This avoids the standard confusion in which
   a correction factor computed in one kinematic region is reported as if it were a property of
   the cross section.

6. **The soft cutoff is explicit and predictions are proved independent of it.** The split between
   soft photons included in the virtual-plus-soft factor and hard photons integrated in the
   radiator depends on a cutoff; the cutoff is a parameter of every definition that involves it,
   and the observable is proved not to depend on it. This avoids a normalisation that looks
   canonical but encodes an arbitrary choice.

7. **The radiator kernel is normalised so that its zeroth moment is one at zeroth order.** With
   the cutoff convention of item 6 fixed, the kernel integrates to unity plus a correction of
   order alpha, and that statement is a theorem about probability conservation rather than a
   choice. This avoids a kernel whose normalisation absorbs part of the correction.

8. **The fine-structure constant is the Thomson-limit value and the running is explicit.** Vacuum
   polarisation appears as a factor evaluated at the photon virtuality, never as an implicit
   replacement of the coupling. This avoids double counting the vacuum-polarisation correction
   once in the coupling and once in the diagram list.

9. **The lepton mass is kept nonzero throughout.** Every kernel, every phase-space integral and
   every logarithm is defined at finite mass; the massless limit is a theorem with hypotheses on
   the observable. This avoids the failure mode of setting the mass to zero and then taking its
   logarithm.

10. **Metric signature is `(+,-,-,-)` and `Q² = -q² > 0` for spacelike momentum transfer**, with
    the inelasticity `y` and the Bjorken variable `x` defined from contractions with the target
    momentum. The scaling variable of the radiator convolution is a momentum fraction in `(0,1]`
    and is never conflated with `x`. This avoids the collision of two unrelated uses of the same
    letter, which is the commonest source of sign errors in this subject.

11. **No `Prop`-valued structure field carries an unproved obligation.** Hypotheses are explicit
    arguments of the theorems that need them, with names, so that a theorem whose hypothesis has
    not been discharged anywhere is visible as such. Where something is unproved, this document
    names it in prose as a gap.

## Existing upstream material used by the roadmap

In EpsilonEridani:

- `EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic` is the base the roadmap extends. It is the
  home of the correction operator and of the classification of Layer 0.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.AccessMethods` and
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` carry the invariants, the reconstruction
  of the invariants from measured momenta, and the kinematic boundaries. The shift maps of Layer 1
  are stated against these, and the support of the radiative tail is described using the bounds.
- `EpsilonEridani.QFT.Scattering.DIS.CrossSection` and
  `EpsilonEridani.QFT.Scattering.DIS.Basic` carry the Born cross section the operator acts on.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` and
  `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal` carry the hadronic tensor
  decomposition used to state which contributions the hadronic-side emission can be written
  against.
- `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`,
  `.OneLoopScalars` and `.TensorReduction` regularise the virtual integrals and reduce the vertex
  correction to scalar integrals.
- `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation` and
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.CrossingSymmetry` supply the one-loop
  amplitude machinery and the crossing relations used for the box contributions of Layer 4.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic`,
  `EpsilonEridani.QFT.Factorization.Convolution.Properties` and
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin` supply the convolution product and its
  Mellin transform, in which the radiator evolution diagonalises.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`,
  `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` and
  `EpsilonEridani.QFT.Factorization.Evolution.Solutions` supply the shape of an evolution equation
  and of its solution; the QED evolution of Layer 2 is an instance of that shape with QED kernels.
- `EpsilonEridani.QFT.Shower.Sudakov` carries a Sudakov exponent; the soft-photon exponentiation
  of Layer 0 has the same structure and is stated so that the two agree where they overlap.
- `EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.NeutralCurrent` and
  `EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.Parameters` carry the neutral-current
  amplitude and the electroweak parameters that Layer 4 corrects.
- `EpsilonEridani.QFT.Scattering.DIS.PVES.Interference.Basic` carries the photon-Z interference
  structure that the weak box corrections modify.
- `EpsilonEridani.Numerics.FourMom` and `EpsilonEridani.Generator.Kinematics` carry four-momentum
  arithmetic and event kinematics; the radiative event of Layer 1 is built from them.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` carries the vocabulary in which a
  non-uniqueness statement about an extraction is phrased; Layer 3 reuses that vocabulary for the
  non-uniqueness contributed by the elastic tail.

In TauCeti:

- `TauCeti.Analysis.Fredholm.Basic`, `TauCeti.Analysis.Fredholm.Criteria`,
  `TauCeti.Analysis.Fredholm.FiniteRank`, `TauCeti.Analysis.Fredholm.CompactPerturbation`,
  `TauCeti.Analysis.Fredholm.ClosedRange`, `TauCeti.Analysis.Fredholm.Adjoint` and
  `TauCeti.Analysis.Fredholm.Estimate` are the home of the inverse problem of Layer 3. The
  correction operator is the identity plus a compact perturbation, so it is Fredholm; the
  non-uniqueness contributed by the elastic tail is a statement about a finite-rank summand; the
  closed-range and estimate results give the stability bound.
- `TauCeti.Analysis.Semigroups.Defs`, `TauCeti.Analysis.Semigroups.Generator`,
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and
  `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness` are the home of the QED evolution of
  Layer 2. The evolution in the QED logarithm is a one-parameter semigroup with a generator, and
  the roadmap does not reprove existence or uniqueness for it.
- `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` and
  `TauCeti.Analysis.Contour.PerWindow.CPV` supply Cauchy principal values, used for the
  dispersive representation of the two-photon exchange amplitude in Layer 4.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, `TauCeti.Analysis.Sobolev.W1p.Basic` and
  `TauCeti.Analysis.Sobolev.Embedding` supply the smoothness classes in which the source condition
  of the regularised inversion is stated, and `TauCeti.Analysis.Sobolev.RellichKondrachov` supplies
  the compactness that makes the discretised problem ill-conditioned.
- `TauCeti.Analysis.Sobolev.Mollification` supplies the mollifiers used to define the smoothed
  approximants of the peaking hypothesis.
- `TauCeti.Analysis.SpecialFunctions.Beta` and `TauCeti.Analysis.SpecialFunctions.IncompleteBeta`
  supply the Beta function, which is the closed form of the soft-photon phase-space integral and
  of the moments of the exponentiated radiator.
- `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` and
  `TauCeti.Analysis.Distribution.DuBoisReymond` supply the test-function vocabulary in which the
  kernel is a distribution on the kinematic domain rather than a function.
- `TauCeti.Probability.Moments.Basic` and `TauCeti.Probability.Moments.Covariance` supply moments
  and covariance, used for the moment conditions on the radiator and for the propagation of
  uncertainty through the regularised inverse.
- `TauCeti.Analysis.Matrix.Spectrum` supplies the spectral decomposition of the discretised
  correction matrix.

In Mathlib: `Mathlib.Analysis.SpecialFunctions.Log.Basic` and
`Mathlib.Analysis.SpecialFunctions.Gamma.Basic` for the QED logarithm and for the Gamma function
in the exponentiated radiator; `Mathlib.Analysis.SpecialFunctions.Pow.Real` for the fractional
power in it; `Mathlib.Topology.MetricSpace.Contracting` for the contraction mapping principle,
which is exactly the convergence statement the iterative scheme of Layer 3 needs;
`Mathlib.MeasureTheory.Integral.IntervalIntegral` and `Mathlib.Analysis.Convolution` for the
kernel integrals; `Mathlib.Analysis.Distribution.SchwartzSpace` for the distributional kernels;
`Mathlib.Analysis.InnerProductSpace.Adjoint` for the adjoint in the regularised inverse.

Genuine absences, and what the roadmap does about them:

- ⚠ The dilogarithm and the harmonic sums are absent from both Mathlib and TauCeti. They are
  needed for the closed form of the one-loop vertex correction and of the second-order radiator.
  `CollinearEvolution` builds them for the QCD splitting kernels; this roadmap cites that
  construction and does not duplicate it. Nothing in Layers 0 to 3 is blocked on the closed forms:
  the finiteness, cancellation and operator statements are proved from the integral
  representations, and the closed forms are needed only for the explicit evaluations in Layer 4.
- ⚠ Plus distributions are absent from Mathlib. The QED splitting kernel is a plus distribution
  plus a delta term. `CollinearEvolution` builds the plus prescription and its convolution
  algebra; the QED kernels here are instances of it.
- ⚠ There is no Mellin transform in TauCeti. `EpsilonEridani.QFT.Factorization.Convolution.Mellin`
  has one, and the moment-space treatment of the radiator uses that rather than an upstream
  transform.
- ⚠ Tikhonov regularisation, and any notion of a well-posed or ill-posed problem, are absent from
  TauCeti. Layer 3 therefore builds the regularised inverse here, in the shape TauCeti's Fredholm
  theory would want: a bounded operator on a Hilbert space defined from the adjoint and a positive
  parameter, with its existence proved from positivity, and with the convergence rate stated as a
  theorem under a source condition. This roadmap does not wait for an upstream regularisation
  theory and does not push the construction upstream.
- ⚠ Bessel functions are absent from both libraries. Nothing in this roadmap needs them; the
  angular integrals of the radiative phase space are done in closed form in terms of logarithms
  and the Beta function.
- ⚠ No roadmap in this collection owns the elastic electromagnetic form factors of the nucleon,
  which the elastic radiative tail of Layer 1 needs. They therefore enter here as explicit data: a
  pair of real-valued functions of `Q²` with no dynamics assumed, constrained only by their
  normalisation at `Q² = 0`. Any statement about the elastic tail is stated for arbitrary such
  data, so the layer is complete without a form-factor theory, and a later roadmap supplying one
  specialises rather than repairs the results here.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.QFT.QED.AnomalyCancellation.Basic` for the QED content,
  `Physlib.Mathematics.Distribution.Basic` for the soft-photon distributions, and
  `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the frame dependence of the radiative tail.

## Layer 0: first-order corrections and the infrared cancellation

References: Bloch and Nordsieck (1937); Yennie, Frautschi and Suura (1961); Kinoshita (1962);
Lee and Nauenberg (1964); Mo and Tsai (1969); Akushevich and Shumeiko (1994).

### 0.1 The process, the Born cross section, and the kinematic domain

The process is `e(k) + N(P) → e(k') + X`, at one-photon exchange, with `q = k - k'`,
`Q² = -q²`, `x = Q²/(2 P·q)`, `y = (P·q)/(P·k)` and `W² = (P+q)²`. The kinematic domain is the
set of `(x, Q²)` with `0 < x ≤ 1`, `Q² > 0`, `W² ≥ M²` and `y ≤ 1`, taken from
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds`.

- **Definition.** `BornCrossSection` is a nonnegative function on the interior of the kinematic
  domain, locally integrable with respect to the measure `dx dQ²`. It is *data* for this roadmap:
  no parton content is assumed. `InclusiveStructureFunctions` supplies the instance in which it is
  built from `F₂` and `F_L`.
- **Lemma.** The domain is the image of the physical region under the invariant map, and it is
  open in the interior and has the elastic line `x = 1` as part of its boundary. The elastic line
  is where the tail of Layer 1 accumulates, so it is named and not merely excluded.

The regularity that the later layers require of the Born cross section is stated once, here, as a
hypothesis class: `BornRegular s` asserts membership in the Sobolev class of order `s` on compact
subsets of the interior, in the sense of `TauCeti.Analysis.Sobolev.W1p.Basic`. Layers 1 and 3 quote
`BornRegular` explicitly rather than assuming smoothness silently.

### 0.2 Classification of the first-order corrections

- **Definition.** A `FirstOrderContribution` is one of: `vacuumPolarisation`, the self-energy
  insertion on the exchanged photon propagator; `leptonVertex`, the one-loop correction to the
  lepton-photon vertex; `leptonSelfEnergy`, the self-energy on the incoming and outgoing lepton
  legs together with the associated wave-function and mass renormalisation; `leptonEmission`, real
  emission of one photon from the lepton line; `hadronEmission`, real emission of one photon from
  the hadronic side; and `emissionInterference`, the interference between the two real-emission
  amplitudes.
- **Theorem** (`vacuumPolarisation_multiplicative`). The vacuum-polarisation contribution acts on
  the one-photon-exchange amplitude as multiplication by a function of the photon virtuality
  alone. Hypothesis: one-photon exchange. This is what licenses treating it separately from the
  radiator, and Layer 2 states precisely how far that separation commutes with the convolution.
- **Theorem** (`vertex_ir_structure`). The one-loop vertex correction decomposes into a Dirac and
  a Pauli form factor of the lepton; the Dirac form factor carries the infrared divergence and the
  Pauli form factor is infrared finite. Proved by reduction to the scalar integrals of
  `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.OneLoopScalars`.
- **Theorem** (`leptonic_set_gauge_invariant`). The set consisting of `leptonVertex`,
  `leptonSelfEnergy` and `leptonEmission` is gauge invariant at first order, by the Ward identity
  and conservation of the hadronic current. Consequence: the commonly used split into "leptonic"
  and "hadronic" radiative corrections is meaningful at this order.
- **Statement of the limitation** (`emissionInterference_not_classifiable`). The interference
  contribution belongs to neither set: it is charge-odd in the lepton charge and survives in the
  sum. It is defined as its own contribution and Layer 4 shows that it is exactly the term which
  contaminates a charge asymmetry intended to isolate two-photon exchange.

The classification is exhaustive at first order in the sense of a theorem
(`firstOrder_classification_complete`) that the first-order term of the cross section is the sum of
these six contributions and nothing else. Hypothesis: the diagram enumeration of
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions` at one loop and one extra
external photon.

### 0.3 Infrared regularisation and the cancellation theorem

- **Definition.** A `SoftRegulator` is a positive real photon mass `λ`, with the convention that
  every first-order quantity is a function of it. The alternative dimensional regulator of
  `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic` is introduced as a
  second instance, and the two are related by a theorem, not by an assertion.
- **Definition.** The `softCutoff` `ω₀` splits real emission into the soft region `ω ≤ ω₀` and the
  hard region `ω > ω₀`, where `ω` is the photon energy in a frame fixed by convention 2. Both
  `λ` and `ω₀` are explicit parameters.
- **Theorem** (`virtual_ir_divergence`). The virtual correction `δ_V(λ)` has the form
  `A ln(λ²/Q²) + B(Q², m²) + O(λ²)` with `A` a rational multiple of the eikonal coefficient of
  0.5 and `B` finite. Proved from 0.2.
- **Theorem** (`soft_real_ir_divergence`). The soft real-emission contribution
  `δ_S(λ, ω₀)` has the form `-A ln(λ²/Q²) + C(Q², m², ω₀) + O(λ²)` with the *same* `A`.
- **Theorem** (`ir_cancellation`). The sum `δ_V(λ) + δ_S(λ, ω₀)` has a finite limit as `λ → 0⁺`.
  Hypotheses: the observable is inclusive over photons of energy below `ω₀`, and the total charge
  flowing in the eikonal current is conserved. This is the finiteness theorem the roadmap is
  organised around, and it is stated as the existence of a limit, not as an algebraic
  cancellation of symbols.
- **Theorem** (`ir_cancellation_regulator_independent`). The limit of `ir_cancellation` agrees with
  the corresponding limit taken with the dimensional regulator. This is what makes the finite
  answer a property of the process rather than of the bookkeeping.
- **Theorem** (`cutoff_independence`). The sum of the soft contribution and the hard-emission
  integral is independent of `ω₀` within the region where the soft approximation is valid, with
  the residual dependence bounded by the error term of 0.5.

### 0.4 Mass singularities and the Kinoshita-Lee-Nauenberg statement

- **Definition.** An observable is `CollinearSafe` if its measurement function is invariant under
  replacing a lepton and a photon exactly collinear with it by their sum. This is a condition on
  the observable, given as explicit data, not a property assumed of all observables.
- **Theorem** (`kln_final_state`). For a `CollinearSafe` observable, the collinear logarithm
  `ln(Q²/m²)` cancels between the final-state real emission and the virtual correction. Hypothesis:
  `CollinearSafe`, and the infrared cancellation of 0.3.
- **Theorem** (`kln_initial_state_survives`). The collinear logarithm associated with
  initial-state emission does not cancel for any observable that fixes the reconstructed
  invariants, because the initial-state configuration is not summed over. Consequently it must be
  absorbed, and the object that absorbs it is the lepton density of Layer 2. This is stated as a
  non-cancellation result with an explicit witness observable, so that the necessity of the
  structure-function method is proved rather than asserted.
- **Theorem** (`mass_singularity_factorisation`). The surviving collinear logarithm appears only
  in the combination `(α/2π) ln(Q²/m²)` multiplying the leading QED splitting kernel. Hypothesis:
  first order. This is the statement that the collinear divergence factorises, and it is the
  foundation of Layer 2.

### 0.5 Soft-photon exponentiation

- **Definition.** The `eikonalCurrent` of a set of charged external legs with charges `Qᵢ`,
  incoming/outgoing signs `ηᵢ` and momenta `pᵢ` is `J^μ(ℓ) = Σᵢ ηᵢ Qᵢ pᵢ^μ/(pᵢ·ℓ)`.
- **Lemma** (`eikonalCurrent_conserved`). `ℓ·J(ℓ) = Σᵢ ηᵢ Qᵢ`, which vanishes by charge
  conservation. This is the gauge invariance of the eikonal approximation and the reason the
  coefficient `A` of 0.3 is the same in the virtual and real terms.
- **Definition.** The `yfsFactor` is the exponential of the infrared exponent built from
  `|J|²` integrated over the soft region, with the virtual and real parts written separately as
  `B(λ)` and `B̃(λ, ω₀)`.
- **Theorem** (`yfs_exponentiation`). The sum over any number of soft photons of the
  soft-approximated amplitudes squared equals `exp(2α(B + B̃))` times an infrared-finite residual,
  as an identity of formal power series in `α` at each order. Hypotheses: the soft approximation
  at 0.5's stated accuracy, and the factorisation of the emission amplitudes in that
  approximation.
- **Theorem** (`yfs_ir_finite`). The exponent `2α(B + B̃)` is independent of `λ`, so the
  exponentiated form is infrared finite before the residual is computed. This is the all-orders
  version of `ir_cancellation`.
- **Statement of what is dropped** (`eikonal_error`). The soft approximation drops terms of
  relative order `ω/E`, all spin-flip contributions, and the non-eikonal part of the emission
  vertex. The error is bounded, not neglected: a theorem states the bound on the difference between
  the exact and eikonal one-photon emission amplitudes on the soft region, linear in `ω₀/E`. The
  constant in that bound is a gap: it is stated as an existential and the roadmap does not claim a
  numerical value for it.

### Examples

- The eikonal current for elastic lepton-proton scattering with four charged legs, with the
  explicit infrared exponent, and the check that `eikonalCurrent_conserved` holds for it.
- The one-loop vertex correction at `Q² ≫ m²`, with the leading double logarithm identified, and
  the verification that its coefficient matches `A` of 0.3.
- The infrared cancellation for the fully inclusive first-order cross section, worked with the
  photon-mass regulator and again dimensionally, as an instance of
  `ir_cancellation_regulator_independent`.
- A `CollinearSafe` observable (the cross section inclusive over all photons within a fixed cone
  around the scattered lepton) and an observable that is not (the cross section at fixed measured
  lepton energy), exhibiting both sides of 0.4.

### Dependencies

Existing EpsilonEridani material for the amplitudes, the regularisation and the Born cross
section; `CollinearEvolution` for the plus prescription in which the splitting kernel of 0.4 is
written; `InclusiveStructureFunctions` for the instance of `BornCrossSection`;
`TauCeti.Analysis.SpecialFunctions.Beta` for the soft phase-space integral; Mathlib's logarithm.

---

## Layer 1: shifted kinematics and the radiative tail

References: Jacquet and Blondel (1979); Bentvelsen, Engelen and Kooijman (1992);
Bassler and Bernardi (1995); Blümlein (1995); Kwiatkowski, Spiesberger and Möhring (1992);
Mo and Tsai (1969) for the tail and the peaking approximation.

This layer is the practically decisive content of the roadmap. It rests on Layer 0 only for the
classification of which photon is radiated; the rest is exact kinematics.

### 1.1 The radiative event and the true invariants

- **Definition.** A `RadiativeEvent` consists of the beam momenta `k`, `P`, the scattered lepton
  momentum `k'`, the photon momentum `ℓ`, and the hadronic final-state momentum `p_X`, subject to
  momentum conservation `k + P = k' + ℓ + p_X` and the mass-shell conditions. Constructed from
  `EpsilonEridani.Numerics.FourMom`.
- **Definition.** The `trueMomentumTransfer` of a radiative event is the momentum actually
  delivered to the hadronic system, `q_true = p_X - P`, and the true invariants are
  `Q²_true = -q_true²`, `x_true = Q²_true/(2 P·q_true)`, `y_true = (P·q_true)/(P·k_eff)` where
  `k_eff` is the lepton momentum entering the hard vertex. For initial-state emission
  `k_eff = k - ℓ`; for final-state emission `k_eff = k`.
- **Lemma** (`trueInvariants_born_limit`). At `ℓ = 0` the true invariants coincide with the Born
  invariants of `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`.
- **Lemma** (`trueInvariants_frame_invariant`). The true invariants are invariant under the
  restricted Lorentz group, using
  `EpsilonEridani.Relativity.LorentzGroup.Restricted.FromBoostRotationExtensions`.

### 1.2 The reconstruction methods, defined covariantly

Each method is a map from the measured content of an event to a pair of invariants. What is
measured differs by method, and that is part of the definition.

- **Definition** (`electronMethod`). From `k`, `P` and `k'`: `q_e = k - k'`, `Q²_e = -q_e²`,
  `y_e = (P·q_e)/(P·k)`, `x_e = Q²_e/(2 P·q_e)`.
- **Definition** (`hadronicMethod`). From `k`, `P` and `p_X`: `Q²_h = -(p_X - P)²`,
  `y_h = (P·(p_X - P))/(P·k)`, `x_h = Q²_h/(2 P·(p_X - P))`.
- **Definition** (`mixedMethod`). `Q²` from the electron method and `y` from the hadronic method,
  with `x` reconstructed from the two.
- **Definition** (`sigmaMethod`). `Q²` from the electron method and, writing `q_h = p_X - P`,
  `y_Σ = (P·q_h)/((P·q_h) + (P·k'))`, with `x_Σ = Q²_e/(2 (P·k) y_Σ)`. The denominator is the sum
  of the hadronic and the scattered-lepton contributions to the same light-cone projection, so the
  incoming lepton momentum cancels between numerator and denominator; the defining property is
  that the incident beam energy does not appear.
- **Definition** (`doubleAngleMethod`). From the lepton polar angle and the inclusive hadronic
  angle alone, together with an explicit `BeamConfiguration` datum giving the beam axis and
  energies. This is the one method that is not a contraction of measured momenta with `P` and `k`
  only, and it carries its frame dependence as data by convention 2.

- **Theorem** (`hadronicMethod_lab_formula`). In the collider frame with massless kinematics,
  `y_h` reduces to the Jacquet-Blondel expression `Σ_h (E_h - p_{z,h}) / (2 E_e)`. Proved by
  direct computation; this is the lemma that connects the covariant definition to the expression
  used in practice.
- **Theorem** (`electronMethod_lab_formula`) and (`sigmaMethod_lab_formula`). The corresponding
  reductions. The trap these lemmas avoid is a definition that is only correct in one frame.
- **Theorem** (`methods_agree_at_born`). All five methods give the Born invariants when `ℓ = 0`.
  Hypothesis: exact measurement. This is the statement that the methods differ only through
  radiation and resolution, and resolution is out of scope.

### 1.3 The shift maps

- **Definition.** For a method `m`, the `shift` is the map
  `δ_m : RadiativeEvent → ℝ × ℝ`, `δ_m(e) = m(e) - trueInvariants(e)`, taken componentwise in
  `(x, Q²)` or in `(x, y)` as stated.
- **Theorem** (`shift_electron_collinearISR`). For an exactly collinear initial-state photon of
  energy fraction `z` of the incoming lepton, the electron method gives `Q²_e = Q²_true/z` and
  `x_e` differing from `x_true` at order one; explicitly `x_e = x_true z (…)` with the factor
  written out. Consequence: the electron method's shift does not vanish in the collinear limit, so
  the electron-method cross section needs the full convolution.
- **Theorem** (`shift_sigma_collinearISR`). For an exactly collinear initial-state photon, the
  Sigma method's invariants equal the true invariants exactly. Hypothesis: exact collinearity and
  full hadronic acceptance.
- **Theorem** (`shift_doubleAngle_collinearISR`). The same statement for the double-angle method,
  under the same hypotheses together with the `BeamConfiguration` being the one used in the
  reconstruction.
- **Theorem** (`shift_hadronic_collinearFSR`). For an exactly collinear final-state photon, the
  hadronic method is unaffected while the electron method shifts by the photon energy fraction.
- **Theorem** (`shift_first_order`). For each method, the first-order expansion of the shift in the
  photon energy, with the coefficient given explicitly. This is what makes the tail of 1.4
  computable.

These five theorems are the content that determines which reconstruction method a measurement
should use, and their statements are the reason the roadmap keeps true and reconstructed invariants
in different types.

### 1.4 The radiative tail

- **Definition.** The `observedCrossSection` of a method `m` at reconstructed invariants `(x_r,
  Q²_r)` is the integral of the Born cross section against the radiative phase space restricted to
  events whose reconstruction is `(x_r, Q²_r)`, plus the virtual-plus-soft factor of Layer 0 times
  the Born cross section at `(x_r, Q²_r)`.
- **Definition.** The `tailSupport` of a method at `(x_r, Q²_r)` is the set of true invariants that
  contribute, that is the image under `trueInvariants` of the events with that reconstruction.
- **Theorem** (`tailSupport_explicit`). For each method, `tailSupport` is described explicitly as a
  region in the `(x, Q²)` plane bounded by the kinematic boundaries of
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` and by the vanishing of the photon energy.
  Its closure contains `(x_r, Q²_r)`, and it degenerates to that point as the photon energy bound
  goes to zero.
- **Theorem** (`tailSupport_reaches_elastic`). For the electron method the tail support reaches the
  elastic line `x = 1` whenever `y_r` exceeds an explicitly given threshold. This is the statement
  that at large inelasticity the observed cross section receives a contribution from elastic
  scattering with a radiated photon, which is not a small correction to a deep-inelastic cross
  section but a different process appearing in the same bin.
- **Definition.** The `elasticTail` is the contribution supported on `x = 1`, defined against a
  pair of elastic form factors `G_E, G_M : ℝ → ℝ` supplied as data with `G_E(0) = 1`, by the
  absence noted above.
- **Theorem** (`elasticTail_finiteRank`). As an operator contribution, the elastic tail is of rank
  one in the `x` direction, being a tensor product of a distribution supported on `x = 1` with a
  function of `Q²_r`. Stated using `TauCeti.Analysis.Fredholm.FiniteRank`. Layer 3 uses this to
  locate exactly where the inversion loses uniqueness.
- **Theorem** (`quasiElasticTail_bound`). The contribution from the resonance region `M² ≤ W² ≤
  W₀²` is bounded by the sup-norm of the Born cross section there times an explicitly computed
  phase-space volume. The resonance cross section itself is not modelled here; the bound holds for
  any nonnegative locally integrable input.

### 1.5 The peaking approximation

- **Definition.** The `peakingApproximant` of the photon angular distribution replaces it by two
  collinear contributions, one along the incoming and one along the outgoing lepton, with weights
  fixed by matching the total emission probability. It is a definition, given explicitly, not a
  hypothesis: the object exists unconditionally.
- **Definition.** The `PeakingValid ε` predicate on a kinematic region states that the difference
  between the exact and the peaking-approximated observed cross section is bounded by `ε` times
  the observed cross section there. It is an explicit hypothesis of every result that uses the
  approximation, and it is never a structure field.
- **Theorem** (`peaking_exact_in_collinear_limit`). In the limit of vanishing lepton mass at fixed
  photon energy, the exact angular distribution converges to the peaking approximant in the sense
  of distributions against test functions from
  `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff`. This identifies what the approximation is
  an approximation to.
- **Gap, named.** A quantitative bound on the peaking error in terms of `m²/Q²` and the local
  smoothness of the Born cross section is *not* proved by this roadmap. It is stated as a
  conjecture (`peaking_error_conjecture`) with its precise form, and every result that needs a
  quantitative bound takes `PeakingValid ε` as a hypothesis instead. This is an open problem, not a
  milestone.

### 1.6 When a correction factor is meaningless

- **Definition.** The `MultiplicativeValid ε` predicate states the existence of a function `δ` such
  that the observed cross section equals `(1 + δ)` times the Born cross section pointwise with
  relative error at most `ε` on a region.
- **Theorem** (`multiplicative_iff_diagonal`). `MultiplicativeValid 0` holds on a region if and
  only if the correction operator restricted there acts as multiplication, that is its kernel is
  supported on the diagonal.
- **Theorem** (`multiplicative_sufficient`). If the oscillation of the Born cross section over
  `tailSupport` is at most `η` relative to its value at the reconstruction point, then
  `MultiplicativeValid ε` holds with `ε` bounded by an explicit function of `η` and the kernel
  norm. This is the criterion that convention 5 refers to.
- **Theorem** (`multiplicative_necessary`). Conversely, for any `δ`, the relative error of the
  multiplicative form is bounded *below* by a constant times the oscillation of the Born cross
  section across `tailSupport`, weighted by the kernel. Consequence: in the region where
  `tailSupport_reaches_elastic` applies, no multiplicative correction factor reproduces the
  observed cross section to better than a stated accuracy, whatever `δ` is chosen. This negative
  result is the mathematical content of the statement that the correction "is not multiplicative"
  in the radiative-tail region.

### Examples

- The electron, Sigma and double-angle reconstructions of a single explicit radiative event with a
  collinear initial-state photon of energy fraction one half, with the three shifts computed, two
  of them zero.
- The tail support for the electron method at `y_r = 0.8` and moderate `Q²_r`, exhibited as an
  explicit region, together with the verification that it meets `x = 1`.
- The elastic tail for a dipole form factor, as an instance of the `G_E, G_M` data, with its
  rank-one structure exhibited.
- A region at moderate `y` where `multiplicative_sufficient` applies with `ε` of order a percent,
  and a region at large `y` where `multiplicative_necessary` forbids any such `ε`.

### Dependencies

Layer 0 for the classification and the virtual-plus-soft factor; existing EpsilonEridani
kinematics and four-momentum material; `TauCeti.Analysis.Fredholm.FiniteRank` for
`elasticTail_finiteRank`; `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` and
`TauCeti.Analysis.Sobolev.Mollification` for 1.5.

---

## Layer 2: the radiator kernel and the structure-function method

References: Kuraev and Fadin (1985); Nicrosini and Trentadue (1987); Berends, Burgers and van
Neerven (1988); Blümlein (1991, 1995); Spiesberger (1995); Arbuzov, Bardin, Blümlein,
Kalinovskaya and Riemann (1996).

### 2.1 The correction as an integral operator

- **Definition.** A `RadiatorKernel` is a nonnegative measurable function `K` on pairs of points of
  the kinematic domain, together with the specification of its support. The `correctionOperator`
  `R` sends a Born cross section `σ` to `(Rσ)(x_r, Q²_r) = ∫ K(x_r, Q²_r; x, Q²) σ(x, Q²) dx dQ²`.
  The kernel is a distribution and not a function: it contains a term supported on the diagonal
  coming from the virtual-plus-soft factor, and a term supported on `x = 1` coming from the elastic
  tail.
- **Theorem** (`kernel_support`). `K(x_r, Q²_r; ·)` is supported on `tailSupport(x_r, Q²_r)` as
  defined in 1.4, so the support statement of the operator is exactly the kinematic statement of
  Layer 1 and is not re-derived.
- **Theorem** (`kernel_decomposition`). `K = δ_diag·(1 + δ_VS) + K_hard + K_elastic` where `δ_VS`
  is the virtual-plus-soft factor of Layer 0, `K_hard` is a nonnegative function, and `K_elastic`
  is the rank-one contribution of 1.4. Each term carries the soft cutoff `ω₀`, and the sum does
  not, by `cutoff_independence`.
- **Theorem** (`R_bounded_L1`). `R` is a bounded operator on the space of integrable functions on
  compact subsets of the kinematic domain, with norm bounded by `1 + c α` for an explicit `c`.
  Proved from nonnegativity of `K_hard` and the normalisation of 2.2.
- **Theorem** (`R_identity_plus_small`). `R = I + C` with `‖C‖ ≤ c α (1 + L)` where
  `L = ln(Q²/m²)` evaluated at the reconstruction point, on any compact region avoiding the
  elastic line. This is the estimate that Layer 3 inverts, and the exclusion of the elastic line
  is essential: `tailSupport_reaches_elastic` says the estimate degrades exactly where the elastic
  tail enters.
- **Theorem** (`kernel_zeroth_moment`). `∫ K(x_r, Q²_r; x, Q²) dx dQ² = 1 + O(α)` with the order-`α`
  term given explicitly. Together with nonnegativity this says `K` is a sub-probability kernel up
  to order `α`, which is convention 7 discharged as a theorem, and is the precise form of
  probability conservation for the radiative process.

### 2.2 The QED lepton densities and their evolution

- **Definition.** `leptonDensity D_ee(z, L)` and `photonDensity D_γe(z, L)` are the densities of a
  lepton and of a photon carrying momentum fraction `z` of a parent lepton, at QED evolution
  variable `L = (α/2π) ln(Q²/m²)`.
- **Definition.** The QED splitting kernels are `P_ee(z) = ((1+z²)/(1-z))_+ + (3/2) δ(1-z)`,
  `P_γe(z) = (1 + (1-z)²)/z`, `P_eγ(z) = z² + (1-z)²` and `P_γγ`, the plus prescription and the
  delta term taken from `CollinearEvolution`.
- **Definition.** The `qedEvolutionGenerator` is the operator `A` sending a pair of densities to
  the convolution of the kernel matrix with them, using
  `EpsilonEridani.QFT.Factorization.Convolution.Collinear`.
- **Theorem** (`qedEvolution_semigroup`). `A` generates a one-parameter semigroup on the weighted
  space `L¹((0,1], (1-z)^{-1+β} dz)` for small `β > 0`, in the sense of
  `TauCeti.Analysis.Semigroups.Defs` and `TauCeti.Analysis.Semigroups.Generator`, and the evolution
  equation `∂_L D = A D` with `D(·, 0) = δ(1-·)` is the abstract Cauchy problem of
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic`. Existence and uniqueness are cited from
  `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness` and are not reproved. The weighted space
  is chosen precisely because the plus prescription is not bounded on the unweighted space; that
  choice is part of the theorem.
- **Theorem** (`qedEvolution_positivity`). The semigroup preserves nonnegativity, so a density
  stays a density.
- **Theorem** (`qedEvolution_momentum_conservation`). The combination
  `∫ z (D_ee + D_γe) dz` is constant in `L`. Proved from the vanishing of the first moment of the
  kernel matrix. This is the statement that the evolution conserves momentum, and it is the check
  that the delta term in `P_ee` has the right coefficient.
- **Lemma** (`qedEvolution_firstOrder`). The order-`L` term of the solution reproduces the
  factorised collinear logarithm of `mass_singularity_factorisation` in Layer 0. This is the
  consistency condition between the resummed and the fixed-order treatments.

### 2.3 The structure-function method

- **Definition.** The `structureFunctionForm` of the observed cross section is
  `σ_obs(x_r, Q²_r) = ∫∫ D_ee(z₁, L) D_ee(z₂, L) σ_Born(Φ(x_r, Q²_r, z₁, z₂)) J(z₁, z₂) dz₁ dz₂`,
  with `Φ` the shifted-invariant map of Layer 1 for the chosen reconstruction method and `J` its
  Jacobian, both taken from 1.3 and not redefined.
- **Theorem** (`structureFunction_equals_operator`). The `structureFunctionForm` is the action of a
  `RadiatorKernel` in the sense of 2.1, with the kernel given explicitly in terms of `D_ee` and
  `Φ`. Hypothesis: the collinear factorisation of Layer 0.4, which restricts the equality to
  leading power in `m²/Q²`.
- **Theorem** (`structureFunction_leadingLog_accuracy`). The `structureFunctionForm` reproduces all
  terms of the form `α^n L^n` and does not reproduce the terms `α^n L^{n-1}` for `n ≥ 1` beyond the
  first order. This is an accuracy statement with an explicit class of terms named, and it is the
  honest version of the claim that the method "resums the leading logarithms".
- **Theorem** (`structureFunction_matches_firstOrder`). At first order in `α` the
  `structureFunctionForm` agrees with the fixed-order calculation of Layer 0 together with the
  hard-emission integral of Layer 1, on the region where both are defined.

### 2.4 The exponentiated radiator and the soft-photon endpoint

- **Definition.** The `exponentiatedRadiator` is the closed-form approximant to `D_ee` near `z = 1`
  given by `β (1-z)^{β-1} exp(...)/Γ(1+β)` with `β = 2α(L-1)/π`, using
  `Mathlib.Analysis.SpecialFunctions.Gamma.Basic` and `Mathlib.Analysis.SpecialFunctions.Pow.Real`.
- **Theorem** (`exponentiatedRadiator_moments`). Its Mellin moments are ratios of Gamma functions,
  computed in closed form; the zeroth moment is one.
- **Theorem** (`exponentiatedRadiator_agrees_soft`). Its expansion in `α` reproduces the YFS factor
  of Layer 0.5 at every order in the soft region. This is the statement that the radiator and the
  exponentiation are the same object seen from two directions, and it is the reason the roadmap
  does not need both as independent inputs.
- **Theorem** (`exponentiatedRadiator_error`). The difference between `D_ee` and the
  exponentiated approximant is bounded on `(1-δ, 1]` by an explicit function of `δ` and `β`,
  vanishing as `δ → 0`. The non-soft remainder is given by the fixed-order terms.

### 2.5 Moment space

- **Theorem** (`qedEvolution_mellin_diagonal`). Under the Mellin transform of
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin`, the generator `A` becomes multiplication
  by the anomalous-dimension matrix `γ(N)`, and the solution is the matrix exponential
  `exp(L γ(N))`, as in `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace`.
- **Theorem** (`gamma_ee_explicit`). The diagonal QED anomalous dimension is
  `γ_ee(N) = (3/2) - 2(ψ(N+1) + γ_E) + ...` written in terms of the digamma function, with the
  pole structure at `N = 1` identified. The digamma function is available through Mathlib's Gamma
  file; the harmonic-sum representation of the same object is the one `CollinearEvolution` builds,
  and this theorem states their equality on the positive integers.
- **Theorem** (`mellin_inversion_wellDefined`). The inverse Mellin transform of
  `exp(L γ(N))` exists in the weighted space of 2.2, so the moment-space solution and the
  `z`-space solution agree.

### 2.6 Vacuum polarisation and the radiator do not commute

- **Theorem** (`vacuumPolarisation_radiator_commutator`). The vacuum-polarisation factor of
  `vacuumPolarisation_multiplicative` is evaluated at the *true* photon virtuality, while a
  multiplicative factor applied to the observed cross section would evaluate it at the
  reconstructed one. The commutator of the two operations is bounded by the product of the
  derivative of the running coupling and the shift of 1.3, and this bound is given explicitly.
  Consequence, stated as a corollary: applying the running coupling at the reconstructed
  virtuality and the radiator separately is a controlled approximation, with an error that is not
  of higher order in `α` but of order `α` times the tail width.

### Examples

- `D_ee` to first order in `L`, exhibited as the explicit plus-distribution expression, with the
  zeroth-moment check.
- The radiator kernel for the electron method at fixed `Q²_r`, with its diagonal, hard and elastic
  pieces separated as in `kernel_decomposition`.
- The exponentiated radiator at `β = 0.05`, with its first three Mellin moments computed in closed
  form from the Gamma function.
- The photon density `D_γe` at first order, and the statement that its convolution with a
  photon-hadron cross section is what `Photoproduction` uses; this roadmap stops at the density.

### Dependencies

Layers 0 and 1; `CollinearEvolution` for the plus prescription, the convolution algebra and the
harmonic sums; TauCeti semigroup theory for the evolution; Mathlib's Gamma, power and logarithm
files; `EpsilonEridani.QFT.Factorization.Convolution.Mellin` and
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` for moment space.

---

## Layer 3: the unfolding inverse problem

References: Tikhonov and Arsenin (1977); Engl, Hanke and Neubauer (1996); Blobel (1985);
D'Agostini (1995); Cowan (1998); Blümlein (1995) for the iterative radiative-correction scheme as
it is used in deep-inelastic analyses.

This layer is where the roadmap contributes something the literature applies without stating: the
extraction of a Born cross section from a measured one is an operator inversion, and the iteration
that performs it converges under a hypothesis that can be written down.

### 3.1 The inverse problem, posed

- **Definition.** The `unfoldingProblem` for a region `Ω` compactly contained in the interior of
  the kinematic domain is: given `σ_obs` in `L²(Ω)`, find `σ_Born` in `L²(Ω)` with
  `R σ_Born = σ_obs`, where `R` is the correction operator of 2.1 restricted to `Ω`.
- **Remark on the choice of space, stated as part of the definition.** `L²` is chosen because the
  regularised inverse of 3.3 needs an adjoint, and `L¹` is chosen in 2.1 because the kernel is a
  sub-probability kernel. The two statements are related by a theorem
  (`R_bounded_L2`) that `R` is also bounded on `L²(Ω)` for `Ω` compactly contained in the interior,
  with a norm bound that degenerates as `Ω` approaches the elastic line.
- **Theorem** (`R_fredholm`). On such an `Ω`, `R = I + C` with `C` compact, so `R` is Fredholm of
  index zero. Proved by exhibiting `C` as a Hilbert-Schmidt operator plus a finite-rank operator,
  using `TauCeti.Analysis.Fredholm.CompactPerturbation` for the compact perturbation and
  `TauCeti.Analysis.Fredholm.FiniteRank` for the elastic piece, and concluding with
  `TauCeti.Analysis.Fredholm.Criteria`.
- **Corollary** (`unfolding_solvable_iff`). The problem is solvable if and only if `σ_obs` is
  orthogonal to the kernel of the adjoint `R*`, which is finite-dimensional; and the solution is
  unique up to the kernel of `R`, also finite-dimensional. Stated with
  `TauCeti.Analysis.Fredholm.Adjoint` and `TauCeti.Analysis.Fredholm.ClosedRange`.

### 3.2 Where the inversion is well posed and where it is not

The honest picture has two parts, and the roadmap states both rather than choosing the more
dramatic one.

- **Theorem** (`neumann_inverse`). If `‖C‖ < 1` then `R` is invertible with
  `R⁻¹ = Σ_{n≥0} (-C)^n`, convergent in operator norm, and `‖R⁻¹‖ ≤ (1 - ‖C‖)⁻¹`. Combined with
  `R_identity_plus_small`, this gives an explicit region — bounded away from the elastic line, with
  `c α (1+L) < 1` — on which the unfolding problem is well posed with a computable stability
  constant. On that region the inverse problem is *not* ill posed, and saying otherwise would be
  false.
- **Theorem** (`elasticTail_nonuniqueness`). Where the elastic tail contributes, the rank-one piece
  `K_elastic` maps a one-dimensional space of inputs supported near `x = 1` to a single function of
  `Q²_r`. Consequently the restriction of `R` to a region including the elastic line has a
  nontrivial finite-dimensional obstruction: the inelastic Born cross section near `x = 1` and the
  elastic form-factor contribution are not separately determined by `σ_obs`. This is the precise
  form of a non-uniqueness statement, and it reuses the vocabulary of
  `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`.
- **Theorem** (`discretised_ill_conditioned`). Let `R_h` be the finite-rank discretisation obtained
  by projecting onto bin-averaged functions with bin width `h`. Then the smoothing part of the
  kernel has singular values tending to zero, so the condition number of `R_h` restricted to the
  tail-dominated region is unbounded as `h → 0`. Proved from compactness, via the
  Rellich-Kondrachov compactness of `TauCeti.Analysis.Sobolev.RellichKondrachov` and the spectral
  decomposition of `TauCeti.Analysis.Matrix.Spectrum`. This is the ill-posedness statement: it is a
  statement about the discretised problem in the tail-dominated region, not about the full operator
  on a region where `neumann_inverse` applies, and the roadmap keeps the two apart.

### 3.3 Regularised inversion

Tikhonov regularisation is absent from Mathlib and TauCeti, so it is built here, in the shape
TauCeti's Fredholm theory uses.

- **Definition.** For `μ > 0`, the `regularisedInverse` `R_μ⁻¹ = (R* R + μ I)⁻¹ R*`.
- **Theorem** (`regularisedInverse_exists`). `R* R + μ I` is bounded below by `μ`, hence invertible,
  so `R_μ⁻¹` is a bounded operator with `‖R_μ⁻¹‖ ≤ (2√μ)⁻¹`. Proved from positivity of `R* R`; needs
  only the adjoint and a lower bound, both available.
- **Theorem** (`regularisedInverse_consistent`). For `σ_obs` in the range of `R`,
  `R_μ⁻¹ σ_obs → R⁻¹σ_obs` as `μ → 0⁺`.
- **Definition.** The `SourceCondition s` on a Born cross section states that it lies in the
  Sobolev class of order `s` on `Ω`, in the sense of `TauCeti.Analysis.Sobolev.W1p.Basic` and
  `TauCeti.Analysis.Sobolev.Embedding`.
- **Theorem** (`regularisedInverse_rate`). Under `SourceCondition s` with `s > 0` and with the
  observed cross section known to accuracy `η` in `L²(Ω)`, the choice `μ ∼ η^{2/(s+1)}` gives
  `‖R_μ⁻¹ σ_obs^η - σ_Born‖ ≤ c η^{s/(s+1)}` with `c` depending only on `s` and the Sobolev norm.
  This is the error bound the draft asks for, and the smoothness hypothesis is exactly
  `SourceCondition`. Hypothesis: `R_fredholm` and the discretisation being fine enough that
  `R_h` approximates `R` to accuracy `η`.
- **Theorem** (`regularisedInverse_covariance`). The regularised inverse is linear, so a covariance
  on `σ_obs` propagates to `R_μ⁻¹ Σ (R_μ⁻¹)*` on the estimate, using
  `TauCeti.Probability.Moments.Covariance`; and the estimate has bias `(R_μ⁻¹R - I)σ_Born`, giving
  the bias-variance decomposition explicitly. The trade-off between the two as `μ` varies is the
  content of the rate theorem, and it is stated rather than left to practice.

### 3.4 The iterative scheme and its convergence

The scheme used universally in practice is: correct the data with a kernel computed from a current
estimate of the Born cross section, re-extract, repeat.

- **Definition.** The `additiveIteration` is `σ^{(n+1)} = σ_obs - C σ^{(n)}` with `σ^{(0)} = σ_obs`,
  where `C = R - I`.
- **Theorem** (`additiveIteration_contracting`). If `‖C‖ < 1`, the map `σ ↦ σ_obs - Cσ` is a
  contraction with constant `‖C‖` in the sense of `Mathlib.Topology.MetricSpace.Contracting`;
  hence it has a unique fixed point, the iteration converges to it from any starting point, and
  `‖σ^{(n)} - σ_Born‖ ≤ ‖C‖^n (1-‖C‖)⁻¹ ‖σ_obs‖`. This is the convergence result the roadmap
  exists to supply, and its hypothesis is exactly the estimate of `R_identity_plus_small`.
- **Corollary** (`additiveIteration_fixedPoint_is_inverse`). The fixed point equals `R⁻¹σ_obs`, so
  the iteration computes the inverse and not merely something stable.
- **Theorem** (`additiveIteration_alpha_criterion`). Substituting the bound of
  `R_identity_plus_small`, the iteration converges on any region where `c α (1 + L) < 1` and which
  is bounded away from the elastic line, with the stated geometric rate. This turns the abstract
  hypothesis into a kinematic criterion that a measurement can check.
- **Definition.** The `binByBinIteration` is the multiplicative variant in which the correction is
  applied as a factor computed bin by bin from the current estimate.
- **Theorem** (`binByBin_fixedPoint_biased`). The bin-by-bin iteration converges under the same
  norm condition, but its fixed point differs from `R⁻¹σ_obs` unless `MultiplicativeValid 0` holds
  on the region; the difference is bounded below by the quantity of `multiplicative_necessary` in
  Layer 1. Consequence: the bin-by-bin scheme converges to the wrong answer in the radiative-tail
  region, and the size of the error is the oscillation of the Born cross section across the tail
  support. This is a negative result about a widely used procedure and it is stated as a theorem.
- **Theorem** (`iteration_with_regularisation`). Replacing the exact inversion step by the
  regularised one of 3.3 gives a scheme that converges to the regularised solution, with the rate
  of `regularisedInverse_rate` and the contraction constant of
  `additiveIteration_contracting` composed. Hypotheses: both of those.

### 3.5 What the inversion cannot recover

- **Theorem** (`inversion_loses_elastic_split`). Restated from `elasticTail_nonuniqueness` as a
  statement about the extraction: any procedure that determines the inelastic Born cross section
  near `x = 1` from `σ_obs` alone must supply the elastic form factors as external data. There is
  no choice of regularisation that removes this: it is a kernel of the forward operator, not an
  instability.
- **Named gap.** A sharp characterisation of the kernel of `R` on a region that includes the
  elastic line — its exact dimension, as a function of the region — is not proved here. The
  roadmap proves that the kernel is finite-dimensional and exhibits a one-dimensional subspace of
  it. The exact dimension is an open question (`elastic_kernel_dimension_question`), and no result
  in the roadmap depends on the answer.

### Examples

- The Neumann inverse to second order for a kernel with a Gaussian hard piece, with the stability
  constant evaluated.
- An explicit region at `Q² = 10 GeV²` and moderate `y` on which
  `additiveIteration_alpha_criterion` holds, together with the number of iterations needed for a
  given accuracy.
- A bin-by-bin iteration applied to a Born cross section with a steep rise at small `x`, with the
  bias of `binByBin_fixedPoint_biased` computed and shown to exceed the statistical uncertainty.
- The regularised inverse with `SourceCondition 1`, exhibiting the `η^{1/2}` rate.

### Dependencies

Layers 1 and 2; TauCeti Fredholm theory, Sobolev theory and `Probability.Moments.Covariance`;
Mathlib's contraction mapping principle and inner-product adjoint;
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` for the vocabulary of 3.2.

---

## Layer 4: beyond first order and beyond QED

References: Blümlein (1995) for the second-order leading logarithms; Blunden, Melnitchouk and Tjon
(2003); Afanasev, Blunden, Melnitchouk and Tjon (2017); Carlson and Vanderhaeghen (2007) for
two-photon exchange; Bardin, Hollik and Passarino (1995); Böhm and Spiesberger (1987);
Spiesberger (1995) for the electroweak corrections.

### 4.1 Second order in the leading-logarithmic approximation

- **Definition.** The `secondOrderLL` contribution is the order-`α²L²` term of the expansion of the
  `structureFunctionForm` of 2.3.
- **Theorem** (`secondOrderLL_explicit`). It equals the convolution of the first-order splitting
  kernel with itself, convolved with the Born cross section at doubly shifted invariants, with the
  coefficient given explicitly. Proved from `qedEvolution_semigroup` by expanding the semigroup,
  not by a separate two-photon calculation.
- **Theorem** (`secondOrderLL_matches_direct`). The same term computed directly from the
  two-photon-emission phase space in the collinear approximation agrees. This is the consistency
  check that certifies the resummation, and it is the only place in the roadmap where a
  two-photon phase-space integral is done.
- **Accuracy statement** (`secondOrder_nll_absent`). The order-`α²L` terms are not reproduced by
  the leading-logarithmic radiator. They are a named gap: the roadmap states which terms are
  missing and their expected size, and does not claim next-to-leading-logarithmic accuracy.
  Nothing in the roadmap depends on them.

### 4.2 Two-photon exchange

- **Definition.** The `twoPhotonExchange` amplitude is the box and crossed-box contribution with
  two photons attached to both the lepton and the hadron, defined from
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation` and
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.CrossingSymmetry`.
- **Theorem** (`twoPhoton_not_radiator`). The two-photon exchange interference is not the
  phase-space integral of any single-photon emission, hence cannot be written as the action of a
  `RadiatorKernel`. Proved by exhibiting its analytic structure: it has an imaginary part above the
  hadronic threshold, which no positive kernel acting on a real Born cross section can produce.
  This is why it is a separate contribution and not a correction to the kernel.
- **Definition.** The `dispersiveRepresentation` of the two-photon exchange amplitude writes its
  real part as a Cauchy principal-value integral of its imaginary part, using
  `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` and
  `TauCeti.Analysis.Contour.PerWindow.CPV`.
- **Theorem** (`twoPhoton_chargeOdd`). The interference of one-photon and two-photon exchange is
  odd under reversing the lepton charge, while the one-photon-exchange cross section is even.
- **Theorem** (`chargeOdd_decomposition`). The charge-odd part of the observed cross section is the
  sum of the two-photon exchange interference and the lepton-hadron bremsstrahlung interference of
  `emissionInterference_not_classifiable` in Layer 0, and of nothing else at this order. Each term
  is defined separately and both are given explicitly. Consequence, stated as a corollary: a
  measured lepton-charge asymmetry does not isolate two-photon exchange, and the bremsstrahlung
  interference must be subtracted using the kernel of Layer 2 first. This is the practical content
  of the layer.
- **Theorem** (`beamNormalAsymmetry_imaginary`). The single-spin asymmetry for a lepton polarised
  normal to the scattering plane is proportional to the imaginary part of the two-photon exchange
  amplitude, hence vanishes at one-photon exchange. This gives an observable that is free of the
  bremsstrahlung contamination of `chargeOdd_decomposition`, because the bremsstrahlung
  interference is real at this order.

### 4.3 Lepton-mass effects and the massless limit

- **Theorem** (`kernel_mass_dependence`). The hard part of the kernel depends on the lepton mass
  only through `ln(Q²/m²)` and terms suppressed by `m²/Q²`, with the suppressed terms bounded
  explicitly.
- **Theorem** (`massless_limit_collinearSafe`). For a `CollinearSafe` observable in the sense of
  0.4, the `m → 0` limit of the corrected cross section exists after the collinear logarithm is
  absorbed into the lepton density. Hypotheses: `CollinearSafe` and `mass_singularity_factorisation`.
- **Theorem** (`massless_limit_fails`). For an observable that fixes the reconstructed invariants by
  the electron method, the `m → 0` limit does not exist: the coefficient of `ln m²` is nonzero, with
  the coefficient given. The region where the mass matters is characterised: photon emission angles
  below `m/E` relative to the lepton direction, where the mass regulates the collinear
  singularity. Consequence: the electron-method cross section cannot be computed in the massless
  approximation, and the Sigma and double-angle methods can, by `shift_sigma_collinearISR`.

### 4.4 One-loop weak corrections and the separation of QED from weak

- **Definition.** The `weakCorrection` at one loop to the neutral-current process consists of the
  gauge-boson self-energies, the vertex corrections with `W` and `Z` exchange, and the `γZ` and
  `ZZ` box contributions, stated against
  `EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.NeutralCurrent` and
  `EpsilonEridani.QFT.Scattering.DIS.PVES.Interference.Basic`.
- **Definition.** A `SeparationScheme` is explicit data fixing how the `γZ` box is split between
  the QED and the weak contributions, together with the renormalisation scheme for the electroweak
  parameters of `EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.Parameters`.
- **Theorem** (`qed_set_ir_complete`). The QED set defined by a `SeparationScheme` is infrared
  divergent and its divergence is cancelled by real emission exactly as in `ir_cancellation`; the
  weak remainder is infrared finite. This is the statement that the split does not disturb Layer 0.
- **Theorem** (`separation_scheme_dependent`). The QED part and the weak part each depend on the
  `SeparationScheme`, by terms of order `α Q²/M_Z²` at small `Q²` and of order `α ln(Q²/M_Z²)` at
  large `Q²`, given explicitly.
- **Theorem** (`total_scheme_independent`). Their sum does not depend on the `SeparationScheme`.
  This pair of theorems is the whole content of the separation: it is meaningful, it is not
  canonical, and a quoted "QED-corrected" cross section is incomplete without the scheme.
- **Corollary** (`asymmetry_scheme_sensitivity`). For a parity-violating asymmetry, the scheme
  dependence of the QED part does not cancel in the ratio, and its size is given by
  `separation_scheme_dependent`. `ElectroweakAndBSM` takes this bound as the systematic floor on
  an extracted weak mixing angle; this roadmap supplies the bound and does not interpret it.

### Examples

- The second-order leading logarithm at `L = 10`, with the size of the term relative to the first
  order, and the size of the missing next-to-leading term as estimated by
  `secondOrder_nll_absent`.
- The charge-odd cross section at fixed `x` and `Q²` decomposed into its two terms as in
  `chargeOdd_decomposition`, showing that the bremsstrahlung interference is not small.
- The `m → 0` limit taken for the Sigma-method cross section and shown to exist, and the same limit
  attempted for the electron method and shown to diverge, as the two sides of 4.3.
- Two `SeparationScheme` instances differing in the treatment of the `γZ` box, with the QED parts
  differing and the total agreeing, as an instance of the pair 4.4.

### Dependencies

Layers 0 through 3; `ElectroweakAndBSM` for the electroweak parameters and their interpretation;
`CollinearEvolution` for the dilogarithm and the harmonic sums used in the explicit second-order
expressions; TauCeti principal values for the dispersive representation; existing EpsilonEridani
one-loop and crossing material.

---

## Dependency graph

```
                      EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic
                      EpsilonEridani.QFT.Scattering.DIS.Kinematics.*
                                        |
                                        v
   Layer 0: first-order corrections and the infrared cancellation
     classification -> IR regularisation -> ir_cancellation -> KLN -> YFS exponentiation
                                        |
                                        v
   Layer 1: shifted kinematics and the radiative tail
     radiative event -> reconstruction methods -> shift maps -> tail support
                     -> elastic tail (rank one) -> peaking approximant
                     -> multiplicativity criterion (positive and negative)
                                        |
                                        v
   Layer 2: the radiator kernel and the structure-function method
     correction operator (support from Layer 1) -> R = I + C estimate
     QED densities -> semigroup evolution (TauCeti) -> structure-function form
                   -> exponentiated radiator -> moment space
                                        |
                                        v
   Layer 3: the unfolding inverse problem
     Fredholm structure (TauCeti) -> Neumann inverse where ||C|| < 1
                                  -> finite-rank obstruction from the elastic tail
                                  -> ill-conditioning of the discretisation
     regularised inverse + source condition -> rate
     additive iteration -> contraction (Mathlib) -> convergence criterion in alpha and L
     bin-by-bin iteration -> biased fixed point (uses Layer 1 negative result)
                                        |
                                        v
   Layer 4: beyond first order and beyond QED
     second-order LL from the Layer 2 semigroup
     two-photon exchange (not a kernel) -> charge-odd decomposition (uses Layer 0)
     massless limit (uses Layer 1 shifts)
     weak corrections -> separation scheme -> scheme dependence and its cancellation
```

Sideways dependencies, each used and not restated: `InclusiveStructureFunctions` supplies the Born
cross section; `CollinearEvolution` supplies the plus prescription, the convolution algebra, the
harmonic sums and the dilogarithm; `ElectroweakAndBSM` supplies the electroweak parameters and
consumes the scheme-dependence bound; `Photoproduction` consumes the photon density of Layer 2;
`TransverseMomentumDistributions` and `GeneralizedPartonDistributions` consume the correction
operator and supply their own shift maps; `NuclearMedium` consumes the kernel and supplies nuclear
form factors and Coulomb distortion; `SpinStructure` consumes the whole construction unchanged.

## Acceptance examples

The roadmap is certified by the following statements. Each is a single checkable assertion, and
together they exercise every layer.

1. For the fully inclusive first-order cross section, the limit as the photon mass tends to zero
   of the sum of the virtual and soft-real contributions exists, and equals the limit computed with
   the dimensional regulator.
2. The eikonal current of elastic lepton-proton scattering satisfies `ℓ·J(ℓ) = 0`, and the
   coefficient of the infrared logarithm it produces equals the coefficient appearing in the
   one-loop vertex correction.
3. For an exactly collinear initial-state photon of any energy fraction, the Sigma-method
   invariants equal the true invariants, and the electron-method Bjorken variable does not.
4. The tail support for the electron method at `y_r > 0.7` intersects the elastic line `x = 1`.
5. The elastic tail contribution to the correction operator has rank one.
6. The radiator kernel is nonnegative and its zeroth moment is one plus an explicitly given term
   of order `α`, on any region bounded away from the elastic line.
7. The QED evolution generator generates a one-parameter semigroup on the stated weighted space,
   and the first moment of the density pair is constant along it.
8. The order-`L` term of the evolved lepton density equals the factorised collinear logarithm of
   Layer 0.
9. The Mellin moments of the exponentiated radiator are the stated ratios of Gamma functions, and
   the zeroth moment is one.
10. On a region where `c α (1 + L) < 1` and which is bounded away from the elastic line, the
    correction operator is invertible, the Neumann series converges, and the additive iteration is
    a contraction with the stated constant whose fixed point is the inverse image of the observed
    cross section.
11. The bin-by-bin iteration has a fixed point that differs from that inverse image by at least
    the oscillation bound of Layer 1, exhibited on an explicit Born cross section with a steep
    small-`x` rise.
12. The regularised inverse exists for every positive regularisation parameter, is consistent as
    the parameter tends to zero, and achieves the stated rate under the source condition of order
    one.
13. The charge-odd part of the observed cross section equals the sum of the two-photon exchange
    interference and the bremsstrahlung interference, with neither term zero.
14. The massless limit of the Sigma-method corrected cross section exists and the massless limit of
    the electron-method one does not.
15. Two separation schemes differing in the treatment of the `γZ` box give different QED and weak
    parts and the same total.

## References

- Bloch, F. and Nordsieck, A., "Note on the radiation field of the electron", Phys. Rev. 52 (1937)
  54.
- Yennie, D. R., Frautschi, S. C. and Suura, H., "The infrared divergence phenomena and high-energy
  processes", Ann. Phys. 13 (1961) 379.
- Kinoshita, T., "Mass singularities of Feynman amplitudes", J. Math. Phys. 3 (1962) 650.
- Lee, T. D. and Nauenberg, M., "Degenerate systems and mass singularities", Phys. Rev. 133 (1964)
  B1549.
- Mo, L. W. and Tsai, Y. S., "Radiative corrections to elastic and inelastic ep and mu-p
  scattering", Rev. Mod. Phys. 41 (1969) 205.
- Tsai, Y. S., "Radiative corrections to electron scatterings", SLAC-PUB-848 (1971).
- Jacquet, F. and Blondel, A., in Proceedings of the study of an ep facility for Europe,
  DESY 79-48 (1979) 391.
- Kuraev, E. A. and Fadin, V. S., "On radiative corrections to e+e- single photon annihilation at
  high energy", Sov. J. Nucl. Phys. 41 (1985) 466.
- Blobel, V., "Unfolding methods in high-energy physics experiments", CERN 85-09 (1985) 88.
- Böhm, M. and Spiesberger, H., "Radiative corrections to neutral current deep inelastic
  lepton-nucleon scattering at HERA energies", Nucl. Phys. B 294 (1987) 1081.
- Nicrosini, O. and Trentadue, L., "Soft photons and second order radiative corrections to
  e+e- -> Z0", Phys. Lett. B 196 (1987) 551.
- Berends, F. A., Burgers, G. J. H. and van Neerven, W. L., "Higher order radiative corrections at
  LEP energies", Nucl. Phys. B 297 (1988) 429.
- Blümlein, J., "Leading log radiative corrections to deep inelastic neutral and charged current
  scattering at HERA", Phys. Lett. B 271 (1991) 267.
- Bentvelsen, S., Engelen, J. and Kooijman, P., "Reconstruction of (x, Q²) and extraction of
  structure functions in neutral current scattering at HERA", in Proceedings of the Workshop on
  Physics at HERA, DESY (1992) 23.
- Kwiatkowski, A., Spiesberger, H. and Möhring, H.-J., "HERACLES: an event generator for ep
  interactions at HERA energies including radiative processes", Comput. Phys. Commun. 69 (1992)
  155.
- Akushevich, I. and Shumeiko, N. M., "Radiative effects in deep inelastic scattering of polarized
  leptons by polarized light nuclei", J. Phys. G 20 (1994) 513.
- Bassler, U. and Bernardi, G., "On the kinematic reconstruction of deep inelastic scattering at
  HERA: the Sigma method", Nucl. Instrum. Meth. A 361 (1995) 197.
- Blümlein, J., "Leading log radiative corrections to deep inelastic scattering at HERA",
  Z. Phys. C 65 (1995) 293.
- Spiesberger, H., "QED radiative corrections for parton distributions", Phys. Rev. D 52 (1995)
  4936.
- D'Agostini, G., "A multidimensional unfolding method based on Bayes' theorem", Nucl. Instrum.
  Meth. A 362 (1995) 487.
- Bardin, D., Hollik, W. and Passarino, G. (eds.), "Reports of the working group on precision
  calculations for the Z resonance", CERN 95-03 (1995).
- Arbuzov, A., Bardin, D., Blümlein, J., Kalinovskaya, L. and Riemann, T., "HECTOR 1.00: a program
  for the calculation of QED, QCD and electroweak corrections to ep and lN deep inelastic neutral
  and charged current scattering", Comput. Phys. Commun. 94 (1996) 128.
- Engl, H. W., Hanke, M. and Neubauer, A., "Regularization of Inverse Problems", Kluwer (1996).
- Tikhonov, A. N. and Arsenin, V. Y., "Solutions of Ill-Posed Problems", Wiley (1977).
- Cowan, G., "Statistical Data Analysis", Oxford University Press (1998), chapter 11.
- Blunden, P. G., Melnitchouk, W. and Tjon, J. A., "Two-photon exchange and elastic electron-proton
  scattering", Phys. Rev. Lett. 91 (2003) 142304.
- Carlson, C. E. and Vanderhaeghen, M., "Two-photon physics in hadronic processes", Ann. Rev. Nucl.
  Part. Sci. 57 (2007) 171.
- Afanasev, A., Blunden, P. G., Melnitchouk, W. and Tjon, J. A., "Two-photon exchange in elastic
  electron-proton scattering", Prog. Part. Nucl. Phys. 95 (2017) 245.
- Abdul Khalek, R. et al., "Science requirements and detector concepts for the Electron-Ion
  Collider: EIC Yellow Report", Nucl. Phys. A 1026 (2022) 122447, arXiv:2103.05419, Volume II,
  Section 7.6.2.

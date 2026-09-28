# Roadmap: hadronization and fragmentation functions

How a struck parton becomes hadrons: the fragmentation functions that describe it, their
factorisation and evolution, the transverse-momentum-dependent and spin-dependent members of the
family, and the fragmentation of the target remnant. The subject is the final-state analogue of
the parton densities, and the mathematical content is largely the same machinery run in the
timelike direction, with the differences stated rather than assumed away.

The roadmap develops the complete basic theory of single-hadron and di-hadron fragmentation as it
enters semi-inclusive deep-inelastic scattering. It starts from the collinear fragmentation
function as a light-cone matrix element with a sum over unobserved final states, establishes the
constraints that such an object satisfies — support, positivity, charge-conjugation and isospin
relations, the momentum sum rule — and then runs the whole structure through the three
generalisations the electron-ion collider programme needs: evolution in the timelike direction,
dependence on transverse momentum and spin, and extension from the current region to the target
region.

Two things distinguish the timelike theory from the spacelike one, and both are formalised rather
than glossed. The first is that the timelike and spacelike anomalous dimensions are two coordinate
readings of a single Regge trajectory, so that their equality — the Gribov-Lipatov relation — holds
to a stated order and fails beyond it in a quantitatively controlled way. The second is that the
final-state gauge link points in the opposite light-cone direction from the initial-state one,
which is why the Collins function is universal where the Sivers function is not. Both are stated as
theorems with hypotheses, and no milestone in this roadmap uses either beyond its range of
validity.

The final application is a certified statement of the factorisation formulae for identified-hadron
production in deep-inelastic scattering: the collinear formula at large hadron transverse momentum,
the transverse-momentum-dependent formula at small hadron transverse momentum, the azimuthal
asymmetries that isolate the individual fragmentation functions, and the extended formula that
includes hadrons produced in the target region. Alongside these sits one deliberately unclosed
statement: the relation between the hadronization power corrections of the event-shape literature
and the fragmentation functions of the factorisation literature. Both describe the same physics; no
proved identity connects them. This roadmap's contribution there is to narrow the gap to a precise
statement, not to close it.

## Scope

- The collinear fragmentation function `D_h^i(z, Q²)` as a light-cone correlator with a sum over
  final states containing the observed hadron `h`, its support in `z`, its positivity, and the
  operator definition from which the sum rules follow.
- The momentum sum rule `∑_h ∫₀¹ dz z D_h^i(z, Q²) = 1`, stated together with the completeness
  hypothesis on the hadron sum that it requires, and the multiplicity interpretation of the zeroth
  moment where that moment exists.
- Charge-conjugation and isospin relations among the fragmentation functions of a hadron
  multiplet, and the favoured and unfavoured combinations as defined objects rather than as
  informal shorthand.
- Collinear factorisation of single-hadron production in deep-inelastic scattering at large hadron
  transverse momentum: the convolution of a parton density, a fragmentation function and a
  coefficient function, at leading order and with the next-to-leading-order coefficient function.
- The timelike splitting kernels, the evolution equation they generate, and the precise sense in
  which they differ from the spacelike kernels beyond leading order.
- The Gribov-Lipatov relation, derived from reciprocity, with the order to which it holds and an
  explicit statement of its failure beyond that order.
- Conservation of the momentum sum rule under timelike evolution, proved from the moments of the
  kernels rather than asserted.
- The large-`z` limit: the double-logarithmic structure of the kernels at the endpoint and the
  resummation that makes evolution stable there.
- The small-`z` limit: the modified-leading-logarithm description of the inclusive hadron
  multiplicity and the resulting distribution in `ln(1/z)`.
- Transverse-momentum-dependent fragmentation functions: the complete leading-twist set for an
  unpolarised and for a polarised produced hadron, with the gauge link and its direction explicit
  in the definition.
- The Collins function as the time-reversal-odd member of that set, and its universality, proved
  from the structure of the final-state link rather than asserted by analogy.
- The convolution structure of the Collins asymmetry and of the Boer-Mulders-type asymmetries in
  semi-inclusive deep-inelastic scattering.
- Di-hadron fragmentation functions and the interference fragmentation function, including the
  statement that the latter gives collinear access to transversity with no transverse-momentum
  convolution.
- Polarising fragmentation functions: the transverse polarisation of a produced hyperon from an
  unpolarised parton.
- Target fragmentation: fracture functions as the joint density of a struck parton and an observed
  target-region hadron, the extended factorisation statement in which they appear, and their
  inhomogeneous evolution.
- Non-perturbative power corrections to event-shape means in the dispersive formulation: the
  dispersive coupling, the Milan factor, the shape function, and the universality of the leading
  correction across observables, stated as a hypothesis with its evidence delimited.
- The relation between those power corrections and the fragmentation functions, stated as the open
  question it is.

Not included. Hadronization inside a nucleus — the medium-modified fragmentation functions, the
transport coefficients, and the hadron-formation-time question — is `NuclearMedium`. Quarkonium and
exotic-hadron production, which is not described by a single-parton fragmentation function and
requires either non-relativistic effective theory or a coalescence mechanism, is
`QuarkoniaAndExotics`. The spacelike splitting kernels, the convolution algebra in which both
directions of evolution are written, and the Mellin transform that diagonalises it are
`CollinearEvolution`; this roadmap uses them and states only what is specific to the timelike
direction. The transverse-momentum-dependent factorisation theorem itself — the operator
definitions of the soft factor, the rapidity divergences, the Collins-Soper kernel and the
azimuthal decomposition of the semi-inclusive cross section — is
`TransverseMomentumDistributions`; this roadmap supplies the fragmentation-side objects that enter
that theorem and does not restate the theorem. The transversity distribution against which the
Collins and interference fragmentation functions are measured is `SpinStructure`. Jet definitions,
the event-shape observables themselves, and their perturbative expansions are `JetsAndEventShapes`;
this roadmap supplies the non-perturbative corrections to their means. The algorithmic content of
string and cluster hadronization models, and their Monte-Carlo implementation, is not a roadmap
subject at all: it belongs with the generator code in `EpsilonEridani.Generator.Shower` and
`EpsilonEridani.Generator.Splitting`, and the only statement this roadmap makes about such a model
is that it is a mechanism whose predictions must reproduce the sum rules and the evolution of
Layers 0 and 2.

Material developed by this roadmap belongs under `EpsilonEridani/Particles/Fragmentation/`, which
currently holds a single interface module. The factorisation and evolution statements that combine
a fragmentation function with a hard kernel belong under `EpsilonEridani/QFT/Factorization/`
alongside the existing collinear machinery, and the semi-inclusive observables and their azimuthal
projections belong under `EpsilonEridani/QFT/Scattering/DIS/SIDIS/`, extending the modules already
there. The dispersive power corrections of Layer 6 belong under
`EpsilonEridani/QFT/Factorization/` as well, next to the transverse-momentum power-correction
machinery, because they are statements about the same expansion parameter.

## Conventions and coordination with upstream

1. **Two momentum fractions, two symbols, never interchanged.** `x` is the light-cone momentum
   fraction of the struck parton in the target; `z` is the light-cone momentum fraction of the
   observed hadron in the fragmenting parton. A convolution in either variable runs over the ratio,
   and the direction of that ratio differs between the two: the density is convolved as `f(x/y)`
   and the fragmentation function as `D(z/y)`. The trap this avoids is the silent transposition of
   a coefficient function between the two convolutions, which is invisible at leading order — where
   both kernels are delta functions — and wrong at every order above it.

2. **The hadron species is an explicit type parameter, not a typeclass.** A fragmentation function
   has type `Hadron → Flavor → ℝ → ℝ → ℝ`, following the existing
   `EpsilonEridani.Particles.Fragmentation.Frag`. Sum rules quantify over the species, so the
   species type must be a first-class argument that can carry a `Fintype` instance; a typeclass
   `[HadronSpecies H]` would hide exactly the finiteness and completeness assumptions that the
   momentum sum rule needs, and the sum rule would then read as a theorem while resting on an
   invisible hypothesis.

3. **Every kernel and every anomalous dimension names its direction.** The words `timelike` and
   `spacelike` appear in the name of every splitting kernel, anomalous dimension and coefficient
   function in this area, matching the existing
   `EpsilonEridani.QFT.Factorization.Evolution.ReggeTrajectory` fields `spacelikeAnomalousDim` and
   `timelikeAnomalousDim`. The trap is the use of a one-loop identification at two loops: the two
   kernels agree at leading order and differ at next-to-leading order, so an unlabelled kernel is a
   correctness hazard exactly where the theory becomes interesting.

4. **Momentum-fraction density, with the momentum weight written out.** `D_h^i(z, Q²)` is a number
   density in `z`: the multiplicity of `h` is `∫₀¹ dz D_h^i(z, Q²)` and the momentum fraction
   carried is `∫₀¹ dz z D_h^i(z, Q²)`. The momentum weight is never absorbed into the definition.
   The trap is that the zeroth moment need not converge — the small-`z` behaviour of the evolved
   fragmentation function makes the multiplicity integral divergent in perturbation theory — so
   `zMoment D 0` is a quantity whose existence is a hypothesis, while `zMoment D 1` is not.

5. **Support is a hypothesis carried in the bundle, not a side condition in prose.** A
   fragmentation function vanishes for `z < 0` and `z > 1`, as recorded by
   `EpsilonEridani.Particles.Fragmentation.Assumptions.support`, and every new fragmentation-type
   object in this roadmap carries the corresponding field. The trap is an integral over
   `Set.Icc 0 1` that silently assumes support it never states, so that a lemma about the integral
   transfers to an object for which it is false.

6. **The gauge link points to the future.** The Wilson line in a fragmentation correlator runs from
   the field operator to light-cone infinity in the direction conjugate to the observed hadron's
   large momentum component, and its direction is an explicit argument of the definition, not a
   convention fixed once in a comment. The trap is the transfer of the initial-state
   process-dependence argument to the final state: the sign flip that makes the Sivers function
   process-dependent does not apply to the Collins function, and the reason is exactly this
   direction. A definition that suppresses the link direction cannot state the difference, let
   alone prove it.

7. **Transverse momentum of the hadron is measured with respect to the fragmenting parton.** The
   second argument of a transverse-momentum-dependent fragmentation function is the hadron's
   transverse momentum in the frame in which the fragmenting parton has no transverse momentum,
   written `k_T`; the experimentally accessible variable is the hadron's transverse momentum with
   respect to the virtual-photon axis, written `P_hT`, and the two are related by a Jacobian and a
   `z` rescaling that is stated wherever a measured asymmetry is written. The trap is a factor `z`
   in the Collins asymmetry, which changes its normalisation without changing its sign or shape and
   is therefore hard to detect numerically.

8. **Sign conventions are the Trento ones.** The azimuthal angles, the sign of the transverse
   polarisation vector, and the signs of the time-reversal-odd functions follow the Trento
   conventions. The trap is a global sign on the Collins function, which propagates into the
   relative sign between the Collins and Sivers asymmetries and so into any joint extraction.

9. **A fracture function's two arguments are `x` and `ζ`, and `ζ` is not `z`.** The fracture
   function `M_{h/H}^i(x, ζ, Q²)` depends on the struck parton's fraction `x` and on the fraction
   `ζ` of the target momentum carried by the observed target-region hadron, with support
   `0 ≤ x ≤ 1 - ζ`. It is not a fragmentation function of a second variable, and the support
   coupling between its two arguments is part of its definition. The trap is the use of a
   product-form ansatz `f(x) D(ζ)`, which violates that support constraint and would make the
   inhomogeneous evolution equation inconsistent.

10. **Mellin indices follow the existing `mellinDis` convention.** The Mellin transform used
    throughout is `EpsilonEridani.QFT.Factorization.Convolution.mellinDis`, in which the momentum
    sum rule sits at index `N = 2`. The trap is an off-by-one in the index that shifts every
    anomalous dimension by one unit of spin and silently relabels the momentum sum rule as a number
    sum rule.

11. **An unproved hypothesis is named in prose, never encoded as a field.** No structure in this
    area carries a `Prop`-valued field discharged by a placeholder, and no `def _ : Prop := sorry`
    stands in for a condition that cannot yet be stated. Both assert nothing while looking like
    hypotheses. Where a condition cannot be stated against the current API, it is omitted from the
    structure and named in the prose of the layer that needs it.

12. **Universality claims carry their quantifier.** "Universal" is never written bare. A
    universality statement in this area names the set of processes over which the object is the
    same, and the statement is a theorem with that set as a hypothesis, or it is labelled a
    hypothesis with its evidence delimited. The trap is the transfer of a universality result
    proved for single-hadron semi-inclusive production to di-hadron production or to the target
    region, where it is a separate statement.

## Existing upstream material used by the roadmap

- `EpsilonEridani.Particles.Fragmentation.Basic` is the base of the whole area. It supplies the
  family type `Frag Hadron Flavor`, the structural bundle `Assumptions` with its `support` and
  `nonneg` fields, the moment `zMoment`, and the support consequence
  `eq_zero_of_not_mem_unitInterval`. Layer 0 extends this module rather than replacing it.
- `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic` supplies the leading-order semi-inclusive
  structure function as a flavour sum, `sidisChannel` and `sidisStructureFunction`, together with
  `inclusive_limit_of_unit_fragmentation`, which is the consistency check that the semi-inclusive
  cross section reduces to the inclusive one when the fragmentation functions are trivial. Layer 1
  builds the next-to-leading-order statement on top of this interface.
- `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Basic` supplies `SpinStructureFunctions`,
  `collinsAsymmetry`, `siversAsymmetry` and their angular observables, and the lemmas that identify
  an asymmetry with a projected ratio under stated projection hypotheses.
  `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics` supplies the azimuthal projectors
  and, in `not_harmonicOrthogonality_normalizedAngularProjector`, a proved negative result: the
  naive normalised angular projector does not separate harmonics. Layer 3 uses the quadrature
  projector that does.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic` and `.Collinear` supply the convolution
  vocabulary: `Kernel`, `convolveAt`, `collinearKernel` with its `z⁻¹` Jacobian and its support
  restriction, and `IsCollinearKernel` as the predicate form. Every convolution in this roadmap is
  written with these, including the fragmentation-side ones.
- `EpsilonEridani.QFT.Factorization.Convolution.Mellin` supplies `mellinDis`,
  `MellinDisConvergent`, and the convolution theorem `mellinDis_convolveAt` with its explicit
  convergence hypotheses. `EpsilonEridani.QFT.Factorization.Convolution.Properties` supplies the
  algebraic properties of the convolution.
- `EpsilonEridani.QFT.Factorization.Evolution.Reciprocity` is the single most important upstream
  result for this area. It supplies `ReggeTrajectory`, the geometric definition
  `IsTimelikeAnomalousDim`, its equivalence with the implicit equation `γ = γ_S(N - γ)`, the
  well-posedness statement `timelikeAnomalousDim_existsUnique` proved by the Banach fixed-point
  theorem, the reciprocity relation `reciprocity`, the quantitative Gribov-Lipatov bound
  `norm_timelike_sub_spacelike_le`, the degenerate case
  `timelikeAnomalousDim_eq_spacelikeAnomalousDim_of_lip_eq_zero`, and the solvable family
  `affineTrajectory` that shows the hypotheses are consistent and the difference non-zero. Layer 2
  uses these as they stand and does not reprove them.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic` supplies `SplittingKernel`, `dglapOperator`,
  `RunningCoupling`, `dglapRhsLogScale` and `IsDGLAPLogScaleEquation`. The type of a timelike
  kernel is the same type; what differs is which kernel inhabits it, so Layer 2 reuses the operator
  and states its own kernels.
- `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` supplies `DglapMomentSystem`,
  `moment_exists_unique`, and — directly relevant to Layer 2 — `sumRule_conserved` with its
  specialisations `momentum_sumRule_conserved` and `valence_sumRule_conserved`, together with the
  index constants `momentumMomentIndex` and `valenceMomentIndex`. The conservation of the
  fragmentation momentum sum rule under evolution is an instance of this machinery, not a new
  proof.
- `EpsilonEridani.QFT.Factorization.Evolution.Solutions`, `.CollinearForm`, `.Consistency` and
  `.QCDCore` supply the solution theory and the QCD content of the spacelike kernels.
  `EpsilonEridani.QFT.Factorization.Evolution.SmallX` supplies the rapidity-evolution machinery
  and, in `exists_no_global_bkSolution`, a proved obstruction; Layer 2 cites its treatment of
  unbounded growth as the pattern to follow for the small-`z` limit, and takes the small-`x`
  physics itself from `SmallXAndSaturation`.
- `EpsilonEridani.Particles.Parton.TMD.Basic` supplies `Tmd`, the split of `Assumptions` into
  `IsTmdDensity` and `Regularity`, `integrateKT`, and `integrateTransverse` with the `2π k_T`
  Jacobian made explicit. Layer 3 mirrors this design on the fragmentation side, including the
  physical/analytic split.
- `EpsilonEridani.Particles.Parton.TMD.Reduction` supplies `collinearFromTmd` and
  `tmd_to_pdf_reduction`, the statement that integrating a transverse-momentum-dependent object
  against the transverse measure returns the collinear one. Layer 3 states and proves the
  fragmentation analogue.
- `EpsilonEridani.Particles.Parton.TMD.CollinsSoper` supplies `TmdRgSystem`, `SatisfiesMuRg`,
  `SatisfiesZetaRg`, `CuspConsistent` and `csKernel_eq_of_cuspConsistent`: the Collins-Soper kernel
  is determined by the cusp anomalous dimension up to the stated freedom. The fragmentation-side
  rapidity evolution is governed by the same kernel, which is why Layer 3 states that as a sharing
  statement rather than introducing a second kernel.
- `EpsilonEridani.Particles.Parton.TMD.PowerCorrections` supplies `powerRatio`,
  `ApproximatesToOrder`, the uniqueness lemmas `coeff_unique` and
  `coeff_unique_of_leadingPower_zero`, the negative statement
  `not_approximatesToOrder_succ_of_coeff_ne_zero`, and the bundle `Kpc`. Layer 6 uses this as the
  meaning of "a power correction of order `n`", so that the dispersive corrections are statements
  in an already-proved asymptotic vocabulary.
- `EpsilonEridani.QFT.Shower.Sudakov` supplies `sudakov`, `sudakov_veto_eq` and the veto-algorithm
  identities. Layer 2 uses the Sudakov exponent as the object in which the large-`z` resummation is
  expressed.
- `EpsilonEridani.QFT.Factorization.Scales.Basic` supplies the scale bookkeeping, and
  `EpsilonEridani.QFT.QCD.OneLoopBeta`, `.Renormalization` and `.Basic` the running coupling and
  its one-loop beta function.
- `EpsilonEridani.Mathematics.Distribution.BasicExtensions` and
  `EpsilonEridani.Mathematics.OrderedSimplexIntegral` supply the distributional and
  iterated-integral tools that the plus prescription and the multi-hadron phase-space integrals
  need.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` and
  `TauCeti.Analysis.Matrix.Spectrum` supply the positive-semidefiniteness vocabulary in which the
  positivity bounds among the leading-twist fragmentation functions of Layer 3 are stated: the
  bounds are the statement that a spin-density matrix is positive semidefinite.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.CauchyProblem.Basic` and
  `.CauchyProblem.Uniqueness` are the home of the timelike evolution equation. Timelike DGLAP
  evolution is a one-parameter semigroup with a generator, and Layer 2 obtains existence and
  uniqueness from that theory instead of reproving them.
- `TauCeti.Analysis.SpecialFunctions.Beta` supplies the Euler beta function, which is what the
  Mellin moments of the endpoint-behaved kernels `z^a (1-z)^b` evaluate to; Layer 2's moment
  computations are beta-function identities.
- `TauCeti.Analysis.Contour.PerWindow.CPV` supplies the Cauchy principal value, which is what the
  dispersive integral of Layer 6 is.
- `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` supplies the Stieltjes and Laplace
  representations used in Layer 6 to say what kind of function the dispersive coupling is.
- `TauCeti.Probability.Moments.Basic` supplies the moment vocabulary for the multiplicity
  distribution of Layer 2, and `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` the weak-derivative
  vocabulary in which an evolution equation for a non-smooth initial condition is stated.
- Mathlib: `Mathlib.Analysis.MellinTransform` and `Mathlib.Analysis.MellinInversion` for the Mellin
  transform and its inversion, `Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic` for the
  convolution integrals, `Mathlib.Topology.MetricSpace.Contracting` for the fixed-point argument
  already used by the reciprocity module, `Mathlib.Analysis.SpecialFunctions.Gamma.Basic` and
  `Mathlib.Analysis.SpecialFunctions.Gamma.Digamma` for the gamma and digamma functions,
  `Mathlib.Analysis.SpecialFunctions.Log.Basic` for the logarithmic variables of the small-`z`
  description, and `Mathlib.Analysis.Asymptotics.Defs` for the asymptotic statements.

⚠ **Harmonic sums are absent from both Mathlib and TauCeti.** The Mellin moments of the splitting
kernels are polynomials in the harmonic sums `S_k(N)`, and no library upstream of this one has
them. The roadmap defines them here — the finite sum, its analytic continuation in `N` built from
the digamma function of `Mathlib.Analysis.SpecialFunctions.Gamma.Digamma`, and the shift and
reflection identities needed to evaluate a moment — in the shape a general-purpose library would
want, namely as functions of a complex index with the finite-sum case proved as a special case, and
does not make any milestone contingent on an upstream addition.

⚠ **Polylogarithms are absent from both Mathlib and TauCeti.** The next-to-leading-order
coefficient functions of Layer 1 contain the dilogarithm. The roadmap defines it here, by its
integral representation on the relevant interval, together with the functional equations it needs,
and states the coefficient functions against that definition.

⚠ **Bessel functions are absent from both Mathlib and TauCeti.** The modified-leading-logarithm
solution for the small-`z` multiplicity distribution is conventionally written in terms of Bessel
functions of imaginary order. The roadmap therefore states the small-`z` result in the form that
does not need them — the Gaussian-in-`ln(1/z)` limit and its first two moments, obtained from the
evolution equation directly — and introduces the closed-form Bessel-type representation here by its
own integral representation, not as an upstream citation.

⚠ **There is no upstream treatment of an inverse problem for this area, and this roadmap does not
need one.** Extracting fragmentation functions from data is an inverse problem, and the machinery
for such statements exists in `TauCeti.Analysis.Fredholm.Criteria` and in
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`, but the extraction question belongs
to `InclusiveStructureFunctions` and its semi-inclusive counterpart there. This roadmap states
forward relations only: given the functions, what the cross section is, and what constraints the
functions satisfy.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Mathematics.Distribution.Basic` for the distributional objects the timelike
  splitting kernels are, and `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the
  current-fragmentation frame of Convention 1.

## Layer 0: the collinear fragmentation function and its constraints

References: Collins, *Foundations of Perturbative QCD*, chapter 12; Metz and Vossen,
*Parton fragmentation functions*; Collins and Soper, *Back-to-back jets in QCD*.

### 0.1 The operator definition

Define the unpolarised quark fragmentation function as a light-cone correlator with a final-state
sum. For a quark of flavour `i` fragmenting into a hadron `h` of momentum `P_h`, the definition
carries: a light-cone direction, the field operators separated along that direction, a gauge link
between them in the direction fixed by Convention 6, a sum over unobserved final states, and the
`z`-dependence produced by the Fourier conjugate of the separation.

The targets are the following.

- A structure `FragCorrelator` recording the data of the definition: the light-cone direction, the
  link direction, the hadron species, the parton flavour, and the renormalisation scale. The
  structure carries no `Prop`-valued field whose witness is a placeholder; the analytic properties
  the correlator must have are separate named hypotheses.
- The theorem that the correlator is supported in `0 ≤ z ≤ 1`, from the spectral condition on the
  unobserved state: the unobserved remainder has non-negative invariant mass.
- The theorem that the unpolarised fragmentation function is non-negative on its support, from the
  positivity of the final-state sum. This is the field-theoretic origin of
  `EpsilonEridani.Particles.Fragmentation.Assumptions.nonneg`, which Layer 0 exhibits as a
  consequence rather than an assumption.
- A reduction theorem: the correlator, integrated over the transverse separation, gives a function
  of `z` and the scale satisfying `EpsilonEridani.Particles.Fragmentation.Assumptions`. This is the
  bridge from the operator definition to the interface the rest of the library already uses.

### 0.2 The gluon fragmentation function and the flavour-space object

The gluon fragmentation function is defined from the field-strength correlator with the same
final-state sum. Its normalisation relative to the quark case is fixed once, by requiring that the
gluon enters the momentum sum rule with unit weight.

- A definition of the flavour-space fragmentation vector: the family indexed by a flavour type
  including the gluon, so that the evolution of Layer 2 is a system rather than a collection of
  scalar equations. The existing `SplittingKernel Flavor` type already has this shape.
- The singlet and non-singlet decomposition of that vector, and the theorem that the non-singlet
  combinations are eigenvectors of the flavour structure of the kernel: the quark-gluon mixing acts
  only on the singlet.

### 0.3 The momentum sum rule

The momentum sum rule states that the fragmenting parton's momentum is distributed among the
hadrons produced:

`∑_h ∫₀¹ dz z D_h^i(z, Q²) = 1` for every flavour `i` and every scale `Q²`.

This is where the completeness hypothesis on the hadron sum must be explicit. The sum rule is a
statement about a sum over *all* hadron species; a finite species type with a `Fintype` instance
gives a sum that can be written, but the identity holds only if that type is complete in the sense
that every state of the final-state sum is counted exactly once.

- A definition `MomentumSumRule` taking the species type, the fragmentation family, and the
  flavour, and asserting the displayed identity, with `Fintype Hadron` as an instance argument and
  the first moment written as `zMoment D 1`.
- A definition of the completeness hypothesis on the hadron sum, as a named hypothesis on the
  correlator of 0.1: the unobserved-state sum decomposes into the observed-species sum with no
  remainder.
- The theorem that completeness implies the momentum sum rule, derived from the light-cone momentum
  conservation of the final-state sum.
- The theorem that the momentum sum rule bounds the first moment of each individual species:
  `zMoment D 1 h i Q² ≤ 1`, from non-negativity of the other terms. This is the usable consequence
  for a phenomenological fit, and it needs no completeness hypothesis beyond non-negativity.
- The statement, proved, that no corresponding sum rule holds for the zeroth moment: the total
  multiplicity is not fixed by the definition, and the zeroth moment of an individual species need
  not converge. The theorem takes the form of an explicit family of fragmentation functions
  satisfying `EpsilonEridani.Particles.Fragmentation.Assumptions` and the momentum sum rule for
  which `∫₀¹ dz D_h^i(z, Q²)` diverges.

### 0.4 Charge conjugation, isospin, and the favoured and unfavoured combinations

The relations among the fragmentation functions of one hadron multiplet follow from the discrete
symmetries of the correlator.

- The charge-conjugation relation between the fragmentation of a quark into a hadron and that of
  the conjugate antiquark into the conjugate hadron, from the action of charge conjugation on the
  correlator, stated with the species-conjugation and flavour-conjugation maps as explicit data
  (involutions on `Hadron` and on `Flavor`).
- The isospin relations within a multiplet, for the pion and the kaon multiplets, obtained from the
  isospin action on both indices; these are the relations that reduce the number of independent
  light-hadron fragmentation functions.
- The definitions of the favoured and the unfavoured combination for a hadron and a flavour: the
  favoured combination is the fragmentation of a parton whose flavour is a valence constituent of
  the hadron, the unfavoured combination is the fragmentation of one that is not. Both are defined
  as functions of the hadron species and the flavour via the valence-content relation, which is
  explicit data on `Hadron`, not a convention in a comment.
- The theorem that the favoured and unfavoured combinations are exchanged by the composite of
  species and flavour conjugation, and the theorem that their difference is the non-singlet
  combination that evolves without gluon mixing.

### 0.5 Positivity bounds

The unpolarised fragmentation function is non-negative. The polarised ones are bounded by it, and
those bounds are the positive-semidefiniteness of a spin-density matrix.

- The definition of the fragmentation spin-density matrix for a spin-half produced hadron, as a
  matrix over the hadron helicity indices whose entries are the collinear fragmentation functions.
- The theorem that non-negativity of the final-state sum makes this matrix positive semidefinite,
  stated with `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`.
- The resulting bounds: the modulus of each off-diagonal fragmentation function is bounded by the
  unpolarised one, proved from positive semidefiniteness rather than asserted from the physical
  interpretation.

### Examples

- The fragmentation function `D(z) = (n+1) z^n` on the unit interval, extended by zero, as an
  explicit inhabitant of `EpsilonEridani.Particles.Fragmentation.Assumptions` satisfying a
  one-species momentum sum rule; a worked instance for every statement in 0.3.
- A two-species family with `D_1(z) = 2z` and `D_2(z) = 2(1-z)`, which satisfies the momentum sum
  rule as a pair and neither term of which satisfies it alone: the example that shows the sum rule
  is not a per-species statement.
- The family `D(z) = c / z` cut off at the endpoints, as the explicit divergent-multiplicity
  witness required by the last target of 0.3.
- The pion triplet with its isospin relations written out, as an instance of 0.4 with a concrete
  three-element species type and a concrete valence-content relation.

### Dependencies

`EpsilonEridani.Particles.Fragmentation.Basic` for the family type, the assumption bundle and the
moment; `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` and
`TauCeti.Analysis.Matrix.Spectrum` for 0.5;
`Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic` for the moments. The light-cone correlator
vocabulary — light-cone coordinates, Wilson lines, the Dirac projections — is taken from
`TransverseMomentumDistributions`, which builds it for the initial-state case; Layer 0 uses it with
the link direction of Convention 6 and states nothing about it that is not specific to the final
state.

---

## Layer 1: collinear factorisation of single-hadron production

References: Altarelli, Ellis, Martinelli and Pi, *Processes involving fragmentation functions
beyond the leading order in QCD*; Collins, *Foundations of Perturbative QCD*, chapter 13; the
Yellow Report, Volume II, Section 7.4.3.

### 1.1 The factorisation formula at large hadron transverse momentum

At hadron transverse momentum of the order of the hard scale, the semi-inclusive cross section
factorises into a convolution of a parton density, a fragmentation function and a coefficient
function, with all three at the same renormalisation scale.

- A definition of the double convolution: the coefficient function convolved against the density in
  one variable and the fragmentation function in the other, written with
  `EpsilonEridani.QFT.Factorization.Convolution.convolveAt` in each variable and with the two
  directions of the ratio as fixed by Convention 1.
- The theorem that the double convolution is symmetric under simultaneous exchange of the two
  convolution variables and transposition of the coefficient function — the precise statement that
  the transposition trap of Convention 1 is a real distinction, since the two convolutions do not
  commute with an untransposed kernel.
- The leading-order statement: with the coefficient function a product of delta functions, the
  double convolution reduces to `sidisStructureFunction` of
  `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`. This is the compatibility theorem between this
  layer and the existing module.

### 1.2 The next-to-leading-order coefficient function

- Definitions of the next-to-leading-order semi-inclusive coefficient functions for the
  quark-to-quark, quark-to-gluon and gluon-to-quark channels, as explicit functions on the product
  of two unit intervals containing logarithms, plus distributions in each variable, and the
  dilogarithm defined by the second warning above.
- The definition of the plus prescription as a distribution on test functions on the unit interval,
  built on `EpsilonEridani.Mathematics.Distribution.BasicExtensions`, and the theorem that the
  convolution of a plus distribution with a function continuous at the endpoint is finite.
- The theorem that the coefficient functions have the correct soft and collinear limits: the
  coefficient of each logarithm is the corresponding splitting kernel, timelike on the
  fragmentation side and spacelike on the density side. This is the statement that ties Layer 1 to
  Layer 2 and is the sharpest available check on the coefficient functions themselves.
- The theorem that the scale dependence of the coefficient function cancels, to the order
  considered, against the scale dependence of the density and the fragmentation function — the
  factorisation-scale independence of the cross section at next-to-leading order.

### 1.3 Kinematics and the boundaries of the region

- Definitions of the semi-inclusive variables — the two momentum fractions, the inelasticity, the
  hadron transverse momentum, and the azimuthal angles — as functions of the invariants, connecting
  to `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`.
- The theorem giving the physical region as a set of inequalities in those variables, and the
  theorem that the region is non-empty exactly under the stated bound on the hadron transverse
  momentum.
- The statement of the two boundaries of validity of this layer's formula, each as an explicit
  asymptotic statement in the vocabulary of
  `EpsilonEridani.Particles.Parton.TMD.PowerCorrections.ApproximatesToOrder`: the formula fails at
  small hadron transverse momentum, where the description of Layer 3 applies, and it fails in the
  target region, where the description of Layer 5 applies. Each boundary is stated as the power
  counting that makes the neglected term unsuppressed, so that a contributor can tell from the
  statement which formula to use.

### Examples

- The leading-order cross section for charged-pion production off a proton with a three-flavour
  density and the favoured and unfavoured combinations of 0.4, evaluated at one kinematic point,
  with the flavour sum written out.
- The next-to-leading-order quark-to-quark coefficient function evaluated against the example
  fragmentation function `(n+1) z^n` of Layer 0, exhibiting a finite convolution with a plus
  distribution.
- A point in the physical region and a point outside it, with the inequality that separates them.

### Dependencies

Layer 0 for the fragmentation functions and their flavour structure; `CollinearEvolution` for the
spacelike kernels appearing in the logarithms of 1.2 and for the parton densities;
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic` for the leading-order interface;
`EpsilonEridani.QFT.Factorization.Convolution.Basic` and `.Collinear` for the convolutions;
`EpsilonEridani.QFT.Factorization.Scales.Basic` for the scale bookkeeping;
`InclusiveStructureFunctions` for the inclusive structure functions that 1.1 reduces to when the
fragmentation functions are trivial.

---

## Layer 2: timelike evolution, reciprocity, and the two endpoints

References: Gribov and Lipatov; Curci, Furmanski and Petronzio, *Evolution of parton densities
beyond leading order: the non-singlet case*; Mitov, Moch and Vogt on timelike splitting functions;
Dokshitzer, Marchesini and Salam, *Revisiting parton evolution and the large-x limit*; Lee, Moult
and Zhang, `arXiv:2409.19045`; Dokshitzer, Khoze, Mueller and Troyan, *Basics of Perturbative QCD*;
Fong and Webber on the shape of the small-`z` distribution.

### 2.1 The timelike kernels and the evolution equation

- Definitions of the leading-order timelike splitting kernels for the quark and gluon channels, as
  inhabitants of `EpsilonEridani.QFT.Factorization.Evolution.SplittingKernel`, and the theorem that
  they coincide with the spacelike kernels at this order.
- The definition of the timelike evolution equation, as an instance of
  `EpsilonEridani.QFT.Factorization.Evolution.IsDGLAPLogScaleEquation` with the timelike kernels
  and a fragmentation family in place of a density. The reuse is deliberate: the equation is the
  same equation, and the difference between the two directions lives entirely in the kernel.
- The theorem that the evolution preserves the support and the non-negativity of Layer 0 — that is,
  that `EpsilonEridani.Particles.Fragmentation.Assumptions` is preserved along the flow, under the
  stated positivity hypothesis on the kernel off the endpoint.
- The existence and uniqueness of the solution, obtained from
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.Uniqueness` by exhibiting the evolution
  operator as the generator of a one-parameter semigroup on the space of fragmentation functions
  with the norm in which the first moment is continuous. The semigroup property itself — that
  evolving from one scale to a second and then to a third agrees with evolving directly — is the
  statement proved here.

### 2.2 The difference between timelike and spacelike beyond leading order

- The definition of the next-to-leading-order timelike kernel as the spacelike kernel plus a named
  difference term, with the difference an explicit function, so that the two are never conflated
  and the difference is a citable object.
- The theorem that the difference vanishes at leading order and the statement of its form at
  next-to-leading order, including its endpoint behaviour.
- The theorem that the timelike kernel is not obtained from the spacelike one by any analytic
  continuation in the momentum fraction alone: the analytic-continuation prescription that works at
  one loop fails at two, and the failure is exhibited on the explicit difference term. This is
  stated as a theorem because it is the precise content of the folklore that "timelike is not the
  continuation of spacelike".

### 2.3 Reciprocity and the Gribov-Lipatov relation

This subsection consumes `EpsilonEridani.QFT.Factorization.Evolution.Reciprocity` and does not
reprove it.

- The construction of a `ReggeTrajectory` from the moments of the twist-two spacelike kernel of
  `CollinearEvolution`: the trajectory's `spacelikeAnomalousDim` field is the moment-space anomalous
  dimension, and the hypothesis `lip_lt_one` is discharged at weak coupling by an explicit bound on
  the derivative of the anomalous dimension with respect to the spin. Discharging that hypothesis
  from the perturbative kernel is the work of this subsection; the consequences then follow from
  the upstream module.
- The Gribov-Lipatov relation as the specialisation of
  `ReggeTrajectory.norm_timelike_sub_spacelike_le` to that trajectory: the timelike and spacelike
  anomalous dimensions agree at first order in the coupling, and their difference is bounded by
  `lip` times the anomalous dimension, hence second order.
- An explicit statement, with the `affineTrajectory` witness of the upstream module, that the
  relation *fails* beyond that order: there is a trajectory satisfying every hypothesis for which
  the two anomalous dimensions differ. No milestone of this roadmap uses the Gribov-Lipatov
  relation beyond first order, and this theorem is what makes that discipline checkable rather than
  a matter of care.
- The relation between the moment-space statement and the momentum-fraction-space one: the
  inverse Mellin transform of the reciprocity relation, stated with the convergence hypotheses of
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin` and `Mathlib.Analysis.MellinInversion`.

### 2.4 Conservation of the momentum sum rule under evolution

- The theorem that the momentum sum rule of 0.3 is preserved by the timelike evolution of 2.1,
  obtained as an instance of
  `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace.momentum_sumRule_conserved`. The
  hypothesis that instance requires is a vanishing condition on the kernel moments at the momentum
  index, and proving that condition for the timelike kernels is the content of this subsection.
- The computation of the required kernel moments, as beta-function identities via
  `TauCeti.Analysis.SpecialFunctions.Beta`, and their expression in terms of the harmonic sums
  defined in this roadmap.
- The theorem that the non-singlet combinations of 0.2 evolve independently and that their first
  moments are *not* conserved, with the explicit anomalous dimension that governs them: the
  contrast that shows the conservation statement is about the singlet sum and not about each
  combination.

### 2.5 The large-momentum-fraction limit

- The theorem that the timelike kernel has a double-logarithmic endpoint structure as the momentum
  fraction approaches one: the coefficient of the squared endpoint logarithm at the relevant order,
  isolated as a named quantity.
- The definition of the threshold-resummed fragmentation function as a Sudakov exponential, using
  `EpsilonEridani.QFT.Shower.Sudakov.sudakov` with the endpoint kernel as its integrand, and the
  theorem that its expansion reproduces the double logarithms of the fixed-order kernel to the
  order computed.
- The theorem that the resummed form is finite at the endpoint where the fixed-order form is not,
  and the statement of the range in which the two agree to a stated accuracy, in the vocabulary of
  `ApproximatesToOrder`.
- The theorem that the resummation does not disturb the momentum sum rule: the first moment of the
  resummed fragmentation function agrees with the fixed-order one up to terms of the order stated,
  with the order made explicit.

### 2.6 The small-momentum-fraction limit and the multiplicity distribution

- The definition of the logarithmic variable `ξ = ln(1/z)` and the transport of the evolution
  equation of 2.1 to it, with the Jacobian written out; in this variable the small-`z` region is
  the bulk and the equation has constant coefficients at the relevant accuracy.
- The definition of the modified-leading-logarithm evolution equation for the hadron multiplicity
  distribution in `ξ`, as a second-order equation in the two logarithmic variables, and its
  existence and uniqueness from the semigroup theory of `TauCeti.Analysis.Semigroups.Generator`.
- The theorem that the distribution in `ξ` has a maximum at an interior point that moves with the
  hard scale, with the explicit leading-order position of the maximum. The hump-backed shape is a
  theorem about the solution, not an input.
- The first two moments of the distribution in `ξ`, computed from the evolution equation via
  `TauCeti.Probability.Moments.Basic`, and the theorem that the mean grows linearly and the
  variance sublinearly in the logarithm of the hard scale.
- The definition of the Gaussian-in-`ξ` approximation from those two moments, and the theorem that
  it approximates the solution to the stated order near the maximum. The closed-form Bessel-type
  solution is defined here by its integral representation, as stated in the third warning above,
  and the theorem that the Gaussian is its expansion about the maximum is stated against that
  definition.
- The theorem that the total multiplicity — the integral of the distribution — grows faster than
  any power of the logarithm of the hard scale, which is the precise statement of why the zeroth
  moment of 0.3 has no sum rule.

### Examples

- The non-singlet timelike evolution of the example fragmentation function `(n+1) z^n` in moment
  space, in closed form, as an instance of 2.1 and 2.4 together.
- An `affineTrajectory` instance with a numerically explicit `lip`, exhibiting the Gribov-Lipatov
  difference of 2.3 as a non-zero number.
- The leading-order position of the maximum of the `ξ` distribution at two hard scales, exhibiting
  the motion of 2.6.
- A worked kernel moment: the first moment of the leading-order quark-to-quark timelike kernel, as
  a beta-function expression and as a harmonic-sum expression, with the two shown equal.

### Dependencies

Layer 0 for the objects being evolved and the sum rule being conserved; `CollinearEvolution` for
the spacelike kernels, the convolution algebra and the Mellin diagonalisation, all of which this
layer uses without restating; `EpsilonEridani.QFT.Factorization.Evolution.Reciprocity` for 2.3;
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` for 2.4;
`EpsilonEridani.QFT.Shower.Sudakov` for 2.5; `TauCeti.Analysis.Semigroups.Defs`, `.Generator` and
`.CauchyProblem.Basic` for the well-posedness of both evolution equations;
`TauCeti.Analysis.SpecialFunctions.Beta` and the harmonic sums defined here for the moment
computations; `SmallXAndSaturation` for the small-`x` physics of the initial state, which is a
different limit from the small-`z` limit of 2.6 and is not used here.

---

## Layer 3: transverse-momentum-dependent fragmentation and the Collins function

References: Mulders and Tangerman, *The complete tree-level result up to order 1/Q for polarized
deep-inelastic leptoproduction*; Collins, *Fragmentation of transversely polarized quarks probed in
transverse momentum distributions*; Metz, *Gluon-exchange in spin-dependent fragmentation*; Collins
and Metz, *Universality of soft and collinear factors in hard-scattering factorization*; Meissner
and Metz; Bacchetta, Diehl, Goeke, Metz, Mulders and Schlegel, *Semi-inclusive deep inelastic
scattering at small transverse momentum*.

### 3.1 The leading-twist set

- A definition of the transverse-momentum-dependent fragmentation correlator, extending the
  correlator of 0.1 by keeping the transverse separation unintegrated, with the link direction as an
  explicit argument as required by Convention 6.
- Definitions of the complete leading-twist set obtained by projecting that correlator on the Dirac
  structures: for an unpolarised produced hadron, the unpolarised function and the Collins function;
  for a spin-half produced hadron, the additional functions of the longitudinally and transversely
  polarised cases. Each is a definition whose argument list follows
  `EpsilonEridani.Particles.Parton.TMD.Tmd`, and each carries the support and measurability fields
  in the physical/analytic split of `EpsilonEridani.Particles.Parton.TMD.Basic`.
- The theorem that the set is complete at leading twist: any projection of the correlator on a Dirac
  structure at leading power is a linear combination of the listed functions. Completeness is the
  content of "the complete leading-twist set" and is proved from the enumeration of the available
  structures, not asserted by listing.
- The theorem that only the unpolarised and the Collins function survive when the produced hadron is
  spinless or its polarisation is not observed.

### 3.2 Reduction to the collinear functions

- The definition of the collinear fragmentation function obtained by integrating a
  transverse-momentum-dependent one against the transverse measure, mirroring
  `EpsilonEridani.Particles.Parton.TMD.Reduction.collinearFromTmd`, with the `2π k_T` Jacobian
  explicit as in the upstream design.
- The theorem that the reduction of the unpolarised function satisfies
  `EpsilonEridani.Particles.Fragmentation.Assumptions` and agrees with the collinear function of
  Layer 0.
- The theorem that the reduction of the Collins function vanishes: its unweighted transverse
  integral is zero, and the object with a collinear meaning is the first transverse-momentum-weighted
  moment. The weighted moment is defined here, and the theorem states which weight is needed and why
  the unweighted one is not available.
- The positivity bounds among the members of the set, as the positive-semidefiniteness of the
  transverse-momentum-dependent spin-density matrix, in the vocabulary of 0.5.

### 3.3 Rapidity evolution shared with the distributions

- The statement that the rapidity evolution of a transverse-momentum-dependent fragmentation
  function is governed by the same Collins-Soper kernel as that of a distribution: the instance of
  `EpsilonEridani.Particles.Parton.TMD.CollinsSoper.TmdRgSystem` for the fragmentation side has the
  same kernel field as the one for the distribution side.
- The theorem that this sharing is forced, not chosen: by `csKernel_eq_of_cuspConsistent`, two
  systems consistent with the same cusp anomalous dimension have the same kernel up to the stated
  freedom, and the fragmentation and distribution systems are both consistent with it. Stating the
  sharing as a consequence of that upstream theorem, rather than as a definitional choice, is what
  this subsection contributes.
- The theorem that the collinear reduction of 3.2 intertwines the rapidity evolution with the
  timelike collinear evolution of Layer 2 in the region where both apply.

### 3.4 Universality of the Collins function

The Collins function is time-reversal odd. For the initial-state Sivers function, time-reversal
oddness together with the past-pointing link produces a sign reversal between deep-inelastic
scattering and the Drell-Yan process. The corresponding statement for the Collins function is that
there is no such reversal, and the reason is the final-state link direction of Convention 6 together
with the final-state sum of 0.1.

- The theorem that the Collins function defined with a future-pointing link equals the one defined
  with a past-pointing link. This is the universality statement, and it is the theorem on which the
  contrast with the Sivers function rests.
- The theorem that the Sivers-type initial-state analogue instead satisfies a sign reversal under
  the same exchange, stated here only to the extent needed to make 3.4 a comparison with a proved
  statement; the Sivers function itself and its process dependence are
  `TransverseMomentumDistributions`.
- The corollary that the Collins function extracted from semi-inclusive deep-inelastic scattering is
  the same function as the one appearing in back-to-back hadron production in electron-positron
  annihilation, with the set of processes named as Convention 12 requires.
- The statement of what is *not* covered by this theorem: universality across di-hadron
  fragmentation and across the target region are separate statements, treated in Layers 4 and 5
  respectively, and the theorem of this subsection does not imply them.

### 3.5 The asymmetries

- The definition of the Collins asymmetry as a convolution: the transversity distribution of
  `SpinStructure` against the Collins function, with the transverse-momentum convolution weight
  written out and the relation between the parton-frame and photon-frame transverse momenta as fixed
  by Convention 7.
- The theorem that this convolution, projected on the appropriate azimuthal harmonic with the
  quadrature projector of
  `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics.harmonicQuadratureProjector`, gives
  `collinsAsymmetry` of `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Basic` under that
  module's projection hypotheses. This is the theorem that connects the field-theoretic objects of
  this layer to the observable interface already in the library.
- The definition of the Boer-Mulders-type asymmetry on the fragmentation side and the statement of
  which function it pairs with, with the same projector discipline.
- The theorem that the naive normalised angular projector does not isolate the Collins harmonic,
  cited from `not_harmonicOrthogonality_normalizedAngularProjector`: an asymmetry defined with that
  projector is a mixture of harmonics, and the theorem identifies the contaminating term.

### Examples

- A Gaussian-in-`k_T` model of the unpolarised function with a `z`-dependent width, as an inhabitant
  of the support and measurability fields, whose transverse reduction is the Layer 0 example
  `(n+1) z^n`.
- A Collins function model of the form `k_T` times a Gaussian, exhibiting the vanishing of the
  unweighted reduction and a non-zero first weighted moment, as the worked instance of 3.2.
- The Collins asymmetry for the model pair of the two previous examples at one kinematic point,
  computed from the convolution and from the projected ratio, shown equal.

### Dependencies

Layer 0 for the correlator, the species labelling and the positivity vocabulary; Layer 2 for the
collinear evolution that 3.3 intertwines with; `TransverseMomentumDistributions` for the
factorisation theorem in which these functions appear, for the soft factor and rapidity
regularisation, and for the Sivers-side comparison of 3.4; `SpinStructure` for the transversity
distribution of 3.5; `EpsilonEridani.Particles.Parton.TMD.Basic`, `.Reduction` and `.CollinsSoper`
for the design being mirrored and the kernel being shared;
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Basic` and `.Harmonics` for the observables.

---

## Layer 4: di-hadron and polarising fragmentation

References: Jaffe, Jin and Tang, *Interference fragmentation functions and the nucleon's
transversity*; Radici, Jakob and Bianconi, *Accessing transversity with interference fragmentation
functions*; Bacchetta and Radici, *Partial-wave analysis of two-hadron fragmentation functions*;
Mulders and Tangerman for the polarising function; work on transverse hyperon polarisation from
unpolarised collisions.

### 4.1 Di-hadron fragmentation functions

- A definition of the di-hadron fragmentation correlator: the same final-state sum as 0.1 with two
  observed hadrons, depending on the total momentum fraction, the invariant mass of the pair, the
  relative momentum fraction, and the angles of the pair relative to the fragmentation axis.
- Definitions of the leading-twist di-hadron functions obtained by projecting that correlator: the
  unpolarised one, and the interference function, which is the one odd under the exchange of the two
  hadrons in the relative-momentum variable.
- The theorem that the single-hadron functions of Layer 0 are recovered by integrating the di-hadron
  functions over the second hadron's variables, with the species sum of Convention 2 and the
  completeness hypothesis of 0.3 appearing again in exactly the same role.
- The partial-wave decomposition in the polar angle of the pair, and the theorem that the
  interference function is the coefficient of the interference between the `s`-wave and `p`-wave
  components: this is the statement that gives the object its name and the reason its sign changes
  across a resonance in the invariant-mass variable.

### 4.2 Collinear access to transversity

- The definition of the di-hadron asymmetry as a *collinear* convolution: a product of the
  transversity distribution and the interference function in the momentum fractions, with no
  transverse-momentum convolution.
- The theorem that this asymmetry is not a special case of the Collins asymmetry of 3.5: the two
  differ in their convolution structure — one is a collinear product in the momentum fractions, the
  other a transverse-momentum convolution — and no choice of weight in the Collins asymmetry
  reproduces it. This theorem is what justifies treating the interference function as a distinct
  object rather than a projection of the Collins function, and it is the reason 4.2 is a separate
  milestone.
- The collinear evolution of the interference function: a timelike evolution equation of the Layer 2
  form in the total momentum fraction, with the invariant mass and the relative fraction as
  spectators, and the theorem that the invariant-mass dependence does not evolve at this order.
- The statement of universality for the interference function, as a hypothesis with its quantifier
  written out as Convention 12 requires: the theorem of 3.4 is proved for the single-hadron Collins
  function and does not extend to the interference function by the argument given there. What is
  available is the weaker statement, proved here, that the interference function is independent of
  the link direction at the order at which the final-state interactions are those of 3.4; whether
  that persists at higher orders is open.

### 4.3 Polarising fragmentation

- The definition of the polarising fragmentation function: the transverse polarisation of a
  spin-half produced hadron from an unpolarised parton, as a member of the Layer 3 set for a
  polarised produced hadron, with the sign conventions of Convention 8.
- The theorem that it is time-reversal odd and that it is therefore subject to the same
  link-direction analysis as the Collins function, with the universality statement following from
  3.4 applied to this member of the set.
- The definition of the observable hyperon polarisation as the convolution of an unpolarised
  distribution with this function, and the theorem that it requires no polarised beam and no
  polarised target: the asymmetry is non-zero for entirely unpolarised initial states, which is what
  distinguishes this observable from those of Layer 3.
- The theorem that the transverse-momentum integral of the polarising function vanishes, with the
  first weighted moment as the collinear object, exactly as in 3.2.

### Examples

- A two-pion di-hadron model with an explicit `s`-wave plus `p`-wave invariant-mass profile, whose
  interference function changes sign at the resonance mass: the worked instance of 4.1.
- The di-hadron asymmetry for that model against a model transversity distribution, at one kinematic
  point, exhibiting the collinear convolution of 4.2.
- A polarising-fragmentation model for a hyperon whose unweighted reduction vanishes and whose first
  weighted moment is non-zero, with the resulting hyperon polarisation at one kinematic point.

### Dependencies

Layer 0 for the correlator and the species labelling; Layer 2 for the evolution equation reused in
4.2; Layer 3 for the leading-twist set, the weighted moments, and the universality theorem applied
in 4.3; `SpinStructure` for the transversity distribution that both asymmetries pair with;
`EpsilonEridani.Mathematics.OrderedSimplexIntegral` for the two-hadron phase-space integrals of 4.1.

---

## Layer 5: target fragmentation and fracture functions

References: Trentadue and Veneziano, *Fracture functions: an improved description of target
fragmentation in hard processes*; Graudenz on one-particle inclusive deep-inelastic processes;
Grazzini, Trentadue and Veneziano, *Fracture functions from cut vertices*; the Yellow Report,
Volume II, Section 7.4.7.

### 5.1 Fracture functions

- A definition of the fracture function as a joint density: the light-cone correlator of the target
  giving simultaneously a parton of fraction `x` to the hard process and an observed hadron of
  target-momentum fraction `ζ` in the target region.
- The support theorem `0 ≤ x ≤ 1 - ζ` with `0 ≤ ζ ≤ 1`, from the light-cone momentum conservation of
  the target state, as required by Convention 9. The coupled support is proved, not assumed, and the
  proof is the reason a product ansatz is inadmissible.
- The theorem that the fracture function reduces to the parton density when integrated over `ζ` with
  the species sum of Convention 2, under the completeness hypothesis of 0.3: the target-region
  hadrons account for the whole target remnant.
- The theorem that the fracture function is non-negative on its support, and the bound by the parton
  density at the same `x` for each species, which is the usable consequence.

### 5.2 The extended factorisation statement

- The definition of the target-region semi-inclusive cross section as a single convolution: the hard
  coefficient function of Layer 1 convolved against the fracture function in `x` only, with `ζ` a
  spectator. The observed hadron is not produced by the fragmentation of the struck parton, so there
  is no second convolution, and that structural difference from Layer 1 is the content of the
  definition.
- The theorem that the sum of the current-region formula of Layer 1 and the target-region formula of
  this subsection double counts, and the explicit statement of the region separation that makes the
  sum well defined: the two formulae are asymptotic statements in different regions of the same
  cross section, each in the vocabulary of `ApproximatesToOrder`, and this theorem states which
  variable separates them and at what accuracy.
- The theorem that the extended formula reduces to the Layer 1 formula when the observed hadron's
  rapidity is in the current region, to the stated order.

### 5.3 Inhomogeneous evolution

- The definition of the evolution equation for the fracture function: the homogeneous term is the
  spacelike DGLAP operator acting on the `x` dependence, and there is in addition an inhomogeneous
  source term which is a convolution of a parton density with a fragmentation function of Layer 0.
- The theorem that the source term is exactly that convolution, with the convolution variables and
  the direction of each ratio explicit as Convention 1 requires. This structure — a parton density
  times a fragmentation function feeding the evolution of a joint density — is the content of the
  statement, and stating it correctly is the milestone.
- Existence and uniqueness of the solution, obtained from the semigroup theory of
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.Uniqueness` by the standard reduction of
  an inhomogeneous Cauchy problem to a homogeneous one plus a Duhamel term, with the Duhamel formula
  stated as a theorem in this area.
- The theorem that the inhomogeneous term is what makes the `ζ`-integrated reduction of 5.1
  consistent with the evolution of the parton density: if the source term were absent, the reduction
  would not be preserved by evolution. The consistency theorem is the sharpest available check that
  the source term is correct.
- The statement of the boundary between this layer and `Diffraction`: the diffractive structure
  functions are the fracture-function description specialised to a target-region final state with a
  rapidity gap, and their evolution is the same inhomogeneous equation with the source term
  suppressed in the gap region. `Diffraction` owns the diffractive statements; this layer owns the
  general fracture function and its evolution, and states the specialisation only as the boundary.

### Examples

- A fracture-function model in which the parton density is evaluated at the rescaled fraction
  `x / (1 - ζ)` with a normalised profile in `ζ` — the simplest form respecting the coupled support
  of 5.1 — exhibiting that the support constraint forces the rescaling and that a plain product
  violates it.
- The `ζ` integral of that model, shown to reproduce the parton density for a normalised profile.
- The source term of 5.3 for that model with the Layer 0 example fragmentation function, evaluated
  at one kinematic point.

### Dependencies

Layer 0 for the fragmentation function in the source term; Layer 1 for the hard coefficient function
and the region vocabulary; `CollinearEvolution` for the spacelike DGLAP operator that provides the
homogeneous term; `InclusiveStructureFunctions` for the parton densities and the inclusive formula
that 5.1 reduces to; `Diffraction` for the diffractive specialisation, which this layer does not
develop; `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.Uniqueness` for the well-posedness
of the inhomogeneous equation.

---

## Layer 6: dispersive power corrections and the gap to fragmentation

References: Dokshitzer and Webber, *Calculation of power corrections to hadronic event shapes*;
Dokshitzer, Marchesini and Webber, *Dispersive approach to power-behaved contributions in QCD hard
processes*; Dokshitzer, Lucenti, Marchesini and Salam, *On the universality of the Milan factor for
1/Q power corrections to jet shapes*; Korchemsky and Sterman, *Power corrections to event shapes and
factorization*; the Yellow Report, Volume II, Section 7.4.1.

### 6.1 The dispersive coupling

- The definition of the dispersive, or effective, coupling as the spectral density of the
  perturbative coupling: an object defined by a dispersion relation in the gluon virtuality, written
  as a Cauchy principal value with `TauCeti.Analysis.Contour.PerWindow.CPV`.
- The theorem that the dispersive coupling reproduces the perturbative coupling in the
  large-virtuality region to the stated order, and the definition of its infrared moment — the
  integral of the coupling over the virtuality — whose finiteness is a hypothesis on the coupling,
  named as such.
- The characterisation of which functions can be dispersive couplings, in terms of the Stieltjes and
  Laplace representations of `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`: a
  completely-monotone spectral density gives a coupling with the analyticity the dispersion relation
  needs. Reconstructing a coupling from its moments is not attempted, and the roadmap needs only the
  first two moments.

### 6.2 The Milan factor and the universal leading correction

- The definition of the leading power correction to the mean of an event shape, as a `Kpc` bundle of
  `EpsilonEridani.Particles.Parton.TMD.PowerCorrections` at order one in the inverse hard scale, so
  that "the leading correction linear in the inverse hard scale" means exactly what
  `ApproximatesToOrder` says and the uniqueness of the coefficient is the already-proved
  `coeff_unique`.
- The definition of the observable-dependent coefficient of that correction, computed from the
  single-gluon-emission characteristic function of the observable, and the definition of the Milan
  factor as the ratio of the two-gluon to the single-gluon coefficient.
- The theorem that the Milan factor is independent of the observable, within the class of observables
  whose characteristic function satisfies the stated additivity and scaling properties. The class is
  named in the hypothesis, as Convention 12 requires; the theorem is the universality statement, and
  its hypothesis is exactly the delimitation of the evidence.
- The statement, as a hypothesis rather than a milestone, that the universality extends beyond that
  class: for observables violating the additivity hypothesis no proof is available, the numerical
  evidence from fits is consistent with universality, and the roadmap records the hypothesis with
  that evidence and does not discharge it.

### 6.3 The shape function

- The definition of the shape function as the non-perturbative distribution whose convolution with
  the perturbative event-shape distribution gives the hadron-level distribution, with the
  convolution written in the shift variable and the support of the shape function stated.
- The theorem that the first moment of the shape function is the coefficient of 6.2, so that the
  correction to the mean determined there fixes the leading behaviour of the distribution: the
  relation between the two descriptions, proved.
- The theorem that the shape function's second moment controls the correction to the variance, with
  the order of that correction stated, and the statement that the moments beyond the second are not
  determined by the dispersive analysis.
- The scaling theorem: the shape function for a given observable at different hard scales is a
  rescaling of one function, with the explicit scaling variable, under the stated hypothesis on the
  observable's characteristic function.

### 6.4 The gap between hadronization corrections and fragmentation functions

Both Layer 0 and this layer describe the conversion of partons into hadrons, and both produce
predictions for the same final states. No proved identity relates them. Layer 0's fragmentation
functions are matrix elements with an operator definition, a factorisation theorem and an evolution
equation; this layer's shape function and dispersive coupling are defined through an asymptotic
expansion of an inclusive observable and have neither an operator definition nor an evolution
equation. Naming that gap precisely is this subsection's milestone, and closing it is not attempted
here.

- The statement of the two descriptions as they apply to a single observable — the mean of an event
  shape in semi-inclusive deep-inelastic scattering — written so that the two predictions are
  expressions in the same variables: the Layer 0 description as a convolution of fragmentation
  functions with the observable's weight, and this layer's description as a `Kpc` bundle.
- The theorem that the two expressions have the same leading power behaviour in the hard scale. This
  is provable and is the precise sense in which the two descriptions are compatible.
- The statement, labelled as an open question, that no relation is known between the coefficient of
  6.2 and any moment of the fragmentation functions of Layer 0; the converse statement, that the
  first moment of the shape function is *not* determined by the fragmentation functions at any order
  available, is likewise open. The roadmap records the two candidate relations that would close the
  gap and states that neither is proved.
- The statement of what a proof would require, as a precise list: an operator definition of the shape
  function; an evolution equation for it; and a matching of the two expansions in a region where both
  are valid. Each item is a statement about objects that exist, so a contributor can tell what is
  being asked; none is offered as a milestone to be discharged by this roadmap.

### Examples

- A one-loop dispersive coupling with an explicit infrared regulator, exhibiting a finite infrared
  moment and the large-virtuality match of 6.1.
- The coefficient of the leading power correction for a thrust-like observable in the model of the
  previous example, as a `Kpc` instance whose `coeff` is a number, with the Milan factor applied.
- An exponential shape function whose first moment is that coefficient, with the resulting shift of
  the perturbative distribution computed at one point.
- The two expressions of 6.4 evaluated for the Layer 0 example fragmentation function and the shape
  function of the previous example, exhibiting the same leading power and different coefficients:
  the worked instance of the gap.

### Dependencies

Layer 0 for the fragmentation functions appearing in the comparison of 6.4; Layer 2 for the
large-`z` structure that the power corrections coexist with;
`EpsilonEridani.Particles.Parton.TMD.PowerCorrections` for the meaning of a power correction and the
uniqueness of its coefficient; `JetsAndEventShapes` for the event-shape observables themselves,
their characteristic functions and their perturbative expansions, all of which this layer takes as
given; `EpsilonEridani.QFT.QCD.OneLoopBeta` and `.Renormalization` for the perturbative coupling;
`TauCeti.Analysis.Contour.PerWindow.CPV` for the dispersion relation;
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` for 6.1.

---

## Dependency graph

```
              Layer 0: collinear fragmentation functions
              (correlator, sum rules, flavour relations, positivity)
                      |                        |
        +-------------+                        +-------------+
        |                                                    |
  Layer 1: collinear factorisation              Layer 2: timelike evolution
  (double convolution, NLO coefficient          (kernels, reciprocity,
   functions, region boundaries)                 sum-rule conservation,
        |                                        large z, small z)
        |                                                    |
        |                                        Layer 3: TMD fragmentation
        |                                        (leading-twist set, reduction,
        |                                         shared CS kernel, Collins
        |                                         universality, asymmetries)
        |                                                    |
        |                                        Layer 4: di-hadron, interference
        |                                         and polarising fragmentation
        |
  Layer 5: target fragmentation  <- Layer 0 (source term), Layer 1 (hard kernel)
  (fracture functions, extended factorisation, inhomogeneous evolution)

  Layer 6: dispersive power corrections  <- Layer 0, Layer 2
  (dispersive coupling, Milan factor, shape function, the named gap)
```

Layer 0 is the base, and nothing else depends on material outside it and the upstream modules listed
above. Layers 1 and 2 are independent of each other and both rest on Layer 0; the endpoint results
of 2.5 and 2.6 use the kernels of 2.1 and nothing from Layer 1. Layer 3 rests on Layers 0 and 2,
Layer 4 on Layer 3, Layer 5 on Layers 0 and 1, and Layer 6 on Layers 0 and 2. Outside this roadmap
the strictly required dependencies are `CollinearEvolution` (spacelike kernels, convolution algebra,
Mellin diagonalisation), `TransverseMomentumDistributions` (the light-cone correlator vocabulary and
the transverse-momentum-dependent factorisation theorem), `SpinStructure` (transversity),
`InclusiveStructureFunctions` (parton densities and the inclusive reduction), `JetsAndEventShapes`
(the event-shape observables) and `Diffraction` (the diffractive specialisation of Layer 5).

## Acceptance examples

The roadmap is certified by the following statements, each of which is checkable and none of which
can be satisfied by a weaker substitute.

1. For the explicit two-species family `D_1(z) = 2z`, `D_2(z) = 2(1-z)`, the momentum sum rule of
   0.3 holds for the pair and fails for each member, both proved.
2. There is a family satisfying `EpsilonEridani.Particles.Fragmentation.Assumptions` and the momentum
   sum rule whose zeroth moment diverges — the proved statement that no multiplicity sum rule follows
   from the definition.
3. The pion-triplet isospin relations of 0.4 are derived from the isospin action on a concrete
   three-element species type, and the favoured and unfavoured combinations for the two light quark
   flavours fragmenting to the same pion are exhibited as the two sides of that relation.
4. The double convolution of 1.1 with delta-function coefficient functions is equal to
   `EpsilonEridani.QFT.Scattering.DIS.SIDIS.sidisStructureFunction`.
5. A `ReggeTrajectory` is constructed from the moments of the one-loop non-singlet kernel, its
   `lip_lt_one` field is discharged from an explicit weak-coupling bound, and
   `ReggeTrajectory.reciprocity` is instantiated at it.
6. For that trajectory, the timelike and spacelike anomalous dimensions agree at first order in the
   coupling; and for `affineTrajectory` with a numerically explicit non-zero `lip`, they differ. Both
   statements proved, so that the range of validity of the Gribov-Lipatov relation is a theorem and
   not a caution.
7. The momentum sum rule of 0.3 is preserved along the timelike evolution of 2.1, proved as an
   instance of `momentum_sumRule_conserved` with its kernel-moment hypothesis discharged by a
   beta-function computation.
8. The distribution in `ξ = ln(1/z)` of 2.6 has an interior maximum whose leading-order position is
   computed, and the mean of the distribution grows linearly in the logarithm of the hard scale.
9. The unweighted transverse reduction of the Collins function vanishes and its first weighted moment
   does not, for the explicit model of the Layer 3 examples.
10. The Collins function with a future-pointing link equals the one with a past-pointing link — the
    universality theorem of 3.4 — and the Sivers-type analogue satisfies the opposite sign relation
    under the same exchange.
11. The Collins asymmetry computed as the convolution of 3.5 equals `collinsAsymmetry` of
    `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Basic` under that module's projection
    hypotheses and with the quadrature projector.
12. The di-hadron asymmetry of 4.2 is exhibited as a collinear product with no transverse-momentum
    convolution, together with the theorem that no weight in the Collins convolution of 3.5
    reproduces it.
13. The fracture-function support `0 ≤ x ≤ 1 - ζ` is proved, and the plain product of a density in
    `x` with a profile in `ζ` is exhibited as violating it.
14. The inhomogeneous evolution of 5.3 preserves the `ζ`-integrated reduction of 5.1, and the same
    statement fails for the equation with the source term removed.
15. The Milan factor of 6.2 is independent of the observable within the class named in its
    hypothesis, with two members of that class exhibited and the ratio shown equal.
16. The two descriptions of 6.4 have the same leading power in the hard scale, for the explicit model
    pair of the Layer 6 examples, with their coefficients exhibited as different numbers and the
    relation between them recorded as an open question.

## References

- Yellow Report, *Electron-Ion Collider: The Next QCD Frontier — Understanding the glue that binds
  us all*, `arXiv:2103.05419`, Volume II, Section 7.4 (hadronization in the vacuum, particle
  production for identified hadron species, target fragmentation).
- J. C. Collins, *Foundations of Perturbative QCD*, Cambridge University Press (2011), chapters
  12-13.
- J. C. Collins and D. E. Soper, *Back-to-back jets in QCD*, Nucl. Phys. B193 (1981) 381; *Back-to-back
  jets: Fourier transform from b to k_T*, Nucl. Phys. B197 (1982) 446.
- V. N. Gribov and L. N. Lipatov, *Deep inelastic ep scattering in perturbation theory*, Sov. J.
  Nucl. Phys. 15 (1972) 438; *e+e- pair annihilation and deep inelastic ep scattering in perturbation
  theory*, Sov. J. Nucl. Phys. 15 (1972) 675.
- S. D. Drell, D. J. Levy and T.-M. Yan, *Theory of deep-inelastic lepton-nucleon scattering and
  lepton-pair annihilation processes*, Phys. Rev. 187 (1969) 2159.
- G. Curci, W. Furmanski and R. Petronzio, *Evolution of parton densities beyond leading order: the
  non-singlet case*, Nucl. Phys. B175 (1980) 27.
- G. Altarelli, R. K. Ellis, G. Martinelli and S.-Y. Pi, *Processes involving fragmentation functions
  beyond the leading order in QCD*, Nucl. Phys. B160 (1979) 301.
- A. Mitov, S. Moch and A. Vogt, *Next-to-next-to-leading order evolution of non-singlet
  fragmentation functions*, Phys. Lett. B638 (2006) 61; S. Moch and A. Vogt, *On third-order timelike
  splitting functions and top-mediated Higgs decay into hadrons*, Phys. Lett. B659 (2008) 290.
- Yu. L. Dokshitzer, G. Marchesini and G. P. Salam, *Revisiting parton evolution and the large-x
  limit*, Phys. Lett. B634 (2006) 504.
- K. Lee, I. Moult and X. Zhang, *Revisiting single inclusive jet production: timelike factorization
  and reciprocity*, `arXiv:2409.19045` — the geometric formulation of reciprocity used by
  `EpsilonEridani.QFT.Factorization.Evolution.Reciprocity`.
- Yu. L. Dokshitzer, V. A. Khoze, A. H. Mueller and S. I. Troyan, *Basics of Perturbative QCD*,
  Editions Frontieres (1991) — the modified-leading-logarithm approximation and the hump-backed
  plateau.
- C. P. Fong and B. R. Webber, *One- and two-particle distributions at small x in QCD jets*, Nucl.
  Phys. B355 (1991) 54.
- P. J. Mulders and R. D. Tangerman, *The complete tree-level result up to order 1/Q for polarized
  deep-inelastic leptoproduction*, Nucl. Phys. B461 (1996) 197.
- J. C. Collins, *Fragmentation of transversely polarized quarks probed in transverse momentum
  distributions*, Nucl. Phys. B396 (1993) 161.
- A. Metz, *Gluon-exchange in spin-dependent fragmentation*, Phys. Lett. B549 (2002) 139.
- J. C. Collins and A. Metz, *Universality of soft and collinear factors in hard-scattering
  factorization*, Phys. Rev. Lett. 93 (2004) 252001.
- S. Meissner and A. Metz, *Partonic description of the transverse target single-spin asymmetry in
  inclusive deep-inelastic scattering*, Phys. Rev. Lett. 102 (2009) 172003.
- A. Bacchetta, M. Diehl, K. Goeke, A. Metz, P. J. Mulders and M. Schlegel, *Semi-inclusive deep
  inelastic scattering at small transverse momentum*, JHEP 0702 (2007) 093.
- R. L. Jaffe, X. Jin and J. Tang, *Interference fragmentation functions and the nucleon's
  transversity*, Phys. Rev. Lett. 80 (1998) 1166.
- M. Radici, R. Jakob and A. Bianconi, *Accessing transversity with interference fragmentation
  functions*, Phys. Rev. D65 (2002) 074031.
- A. Bacchetta and M. Radici, *Partial-wave analysis of two-hadron fragmentation functions*, Phys.
  Rev. D67 (2003) 094002.
- A. Metz and A. Vossen, *Parton fragmentation functions*, Prog. Part. Nucl. Phys. 91 (2016) 136 —
  the review used for the classification of the leading-twist set and the phenomenological status.
- L. Trentadue and G. Veneziano, *Fracture functions: an improved description of target fragmentation
  in hard processes*, Phys. Lett. B323 (1994) 201.
- D. Graudenz, *One-particle inclusive processes in deeply inelastic lepton-nucleon scattering*,
  Nucl. Phys. B432 (1994) 351.
- M. Grazzini, L. Trentadue and G. Veneziano, *Fracture functions from cut vertices*, Nucl. Phys.
  B519 (1998) 394.
- Yu. L. Dokshitzer and B. R. Webber, *Calculation of power corrections to hadronic event shapes*,
  Phys. Lett. B352 (1995) 451.
- Yu. L. Dokshitzer, G. Marchesini and B. R. Webber, *Dispersive approach to power-behaved
  contributions in QCD hard processes*, Nucl. Phys. B469 (1996) 93.
- Yu. L. Dokshitzer, A. Lucenti, G. Marchesini and G. P. Salam, *On the universality of the Milan
  factor for 1/Q power corrections to jet shapes*, JHEP 9805 (1998) 003.
- G. P. Korchemsky and G. Sterman, *Power corrections to event shapes and factorization*, Nucl. Phys.
  B555 (1999) 335.

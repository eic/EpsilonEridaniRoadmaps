# Roadmap: Monte Carlo event generation as stochastic processes

The probability-space semantics of event generation: what it means, as a theorem rather than as
a description of an algorithm, for a program that draws random numbers to produce events
distributed according to a cross section. The roadmap builds the objects a generator is made of
— the Lorentz-invariant phase-space measure and its factorisations, the sampling constructions
that turn uniform variates into draws from a density, the veto algorithm as a Markov chain on
scales, the parton shower as a continuous-time Markov process whose generator is the splitting
kernel, hadronisation models as probability measures on final states, and the matching
prescriptions that combine fixed-order and resummed descriptions without double counting — and
proves, for each, that the construction has the law it is claimed to have.

`EpsilonEridani` already contains an executable generator: a hard-process sampler, a
virtuality-ordered shower with the veto algorithm, Durham clustering, and HepMC3 output. It also
contains a proved theorem, `vetoSeries_eq_exp_neg`, that the series the veto algorithm's
rejections generate sums exactly to the Sudakov factor, together with a statement in the same
module of what that theorem does not say: no probability space appears in it, so the claim that
the *algorithm's law* is that series "remains arithmetic done on paper". This roadmap is the
development that turns that arithmetic into a statement about a random variable. Its subject is
precisely the gap the code names about itself.

Two principles organise the whole development, and both are consequences of where it sits.

First, **the executable code is never the specification**. The theorems below are what the
generator must satisfy; the `Float`-valued functions in `EpsilonEridani.Generator` are an
implementation whose agreement with those theorems is an empirical claim, tested by running it.
A theorem about the reals does not execute, and floating-point code does not prove anything, so
no definition in `EpsilonEridani.Generator` is ever called verified on the grounds that a
corresponding real-valued theorem exists. The roadmap states the correspondence as a hypothesis
in Layer 6 and says what evidence would support it.

Second, **every random construction is a pushforward measure**. A sampler is a measurable map
from a space of uniform variates to a space of events, and "the sampler produces events with
density `f`" is the statement that the pushforward of the product Lebesgue measure under that map
is `f` times the phase-space measure. Acceptance–rejection, importance sampling, the veto
algorithm and the shower are all instances of this one shape, and stating them that way is what
lets a single upstream theory — Mathlib's measure theory and TauCeti's kernels and Markov
chains — carry all of them, instead of each being an argument of its own.

The shower is posed as a continuous-time Markov process on the space of parton configurations,
with the splitting kernel as its generator, and the evolution in scale as a one-parameter
semigroup in the sense of `TauCeti.Analysis.Semigroups`. This is the same structural choice the
collection makes for every other evolution equation, and it is made here for the same reason: the
no-emission probability, the composition law in the scale, the uniqueness of the law given the
generator, and the theorem that the shower reproduces leading-logarithmic DGLAP evolution are
then facts about an object with known properties rather than four separate arguments about a
particular algorithm.

## Scope

Included:

- The probability space of a generator: a product of uniform variates on `[0,1]`, the generator
  as a measurable map from it, and the law of the generated events as the pushforward. The
  pseudo-random sequence is replaced by this idealisation, and the roadmap states exactly what
  that replacement assumes.
- Lorentz-invariant phase space: the measure on `n`-body final states, its invariance under the
  Lorentz group, its recursive factorisation into two-body steps, the Dalitz measure for three
  bodies, and the theorem that the RAMBO construction is flat with respect to it.
- Sampling: the inverse-transform method, acceptance–rejection and its acceptance probability,
  importance sampling, the weighted estimator and its variance, the effective sample size,
  unweighting against a bound, the cost of a wrong bound, and the price of negative weights —
  each stated as a theorem about a pushforward measure or an integral.
- The cross-section estimator: the sample mean of weights as an unbiased estimator of the
  integrated cross section, its convergence by the strong law, and its fluctuations by the
  central limit theorem, with the variance that the weight distribution determines.
- The Sudakov process: the veto algorithm as a Markov chain on scales, the theorem that its law
  is the Sudakov density of the true kernel irrespective of the overestimate, the identification
  of the rejection series with an ordered multi-fold integral, and the measure-theoretic content
  of the existing `vetoSeries_eq_exp_neg`.
- The parton shower as a continuous-time pure-jump Markov process: its generator, the semigroup
  it generates, the no-emission probability as the survival function, the branching structure,
  and the conditions under which the cascade terminates almost surely.
- The shower and evolution: the theorem that the single-inclusive distribution of the shower
  solves the leading-logarithmic DGLAP equation of `CollinearEvolution`; unitarity as the
  statement that the virtual term is fixed by probability conservation; angular ordering as a
  theorem about the azimuthal average of the soft eikonal factor; recoil and momentum
  conservation as constraints on the splitting map.
- Hadronisation models as probability measures: the Lund string, its area law and the derivation
  of the symmetric fragmentation function from left–right symmetry; the cluster model as a
  Markov decay chain with a decidable termination condition.
- Matching and merging: the double-counting subtraction, the unitarity condition that holds the
  inclusive cross section fixed, Sudakov reweighting of multi-jet samples, and the merging scale
  as a parameter whose dependence is a stated residual.
- The specification–implementation boundary: the correspondence between the real-valued theorems
  and the `Float`-valued functions of `EpsilonEridani.Generator` as an explicit hypothesis, the
  event record as a measurable encoding, and the statistical test that constitutes evidence for
  the hypothesis.

Not included. This roadmap does not define any cross section, structure function or splitting
kernel: the hard-process cross section is `InclusiveStructureFunctions`' and
`EpsilonEridani.QFT.Scattering.DIS.CrossSection`'s, the kernels and their evolution are
`CollinearEvolution`'s, and the roadmap consumes them as given. It does not develop
fragmentation functions, their evolution, or their sum rules — those are `Hadronization`'s —
and the hadronisation *models* of Layer 4 are built here only as measures whose single-hadron
marginals are candidates for the objects `Hadronization` defines, with the identification stated
as a target in that direction. It does not define jets or event shapes; the Durham algorithm is
`JetsAndEventShapes`', and the executable `EpsilonEridani.Generator.Jets` is used in Layer 6 only
as an observable to test the shower against. It does not treat detector response, unfolding or
statistical inference: the hypothesis test of Layer 6.4 is stated in the vocabulary a
`StatisticalInference` roadmap would own, with the construction of that vocabulary left to it.
It does not treat radiative corrections or their Monte Carlo implementation, which remain
`RadiativeCorrections`'. And it says nothing about the physics of nuclear targets: a shower in a
medium is `NuclearMedium`'s, and the shower here is in vacuum.

This area owns no subsection of the Yellow Report's Chapter 7 — like `CollinearEvolution`, it is
machinery the measurements are interpreted with rather than a measurement. The subsections whose
content it touches are owned elsewhere and stay there: 7.4.1 and 7.4.3 by `Hadronization`, which
Layer 4 supplies candidate marginals to; 7.1.7 and 7.3.6 by `JetsAndEventShapes`, which Layers
2, 3 and 5 supply the shower and matching to; and 7.4.2 by `NuclearMedium`, which this roadmap
supplies nothing to directly because the shower here is in vacuum.

One boundary this roadmap *moves*. `Hadronization`'s scope statement says that the algorithmic
content of string and cluster hadronisation models, and their Monte Carlo implementation, is not
a roadmap subject. Adopting this roadmap amends that sentence to point here: the algorithmic
content is a roadmap subject, and it is this one's. That amendment is a one-line change to
another area's README and is filed separately from this roadmap, which touches only its own
directory.

## Conventions and coordination with upstream

Each convention names the trap it avoids.

1. **A generator is a measurable map, and its law is a pushforward.** The space of variates is
   `Ω = [0,1]^ℕ` with the product of Lebesgue measures, or a finite product `[0,1]^k` where the
   number of draws is bounded, and every random construction in this roadmap is a measurable
   function on `Ω`. The trap avoided is the informal "draw `r` uniformly and set `x = F⁻¹(r)`",
   which says nothing checkable; `Measure.map` of the uniform measure under `F⁻¹` is the
   statement, and it is a theorem in `Mathlib.MeasureTheory.Measure.Map`.

2. **The pseudo-random generator is idealised, and the idealisation is named.** Every theorem
   quantifies over `Ω` with its product measure. The replacement of a deterministic
   pseudo-random sequence by that measure is a hypothesis stated once, in Layer 0.1, not an
   assumption smuggled into each theorem. Nothing in this roadmap proves anything about
   `StdGen` or any other concrete generator; the trap is pretending otherwise.

3. **Phase space is a measure, and cross sections are densities against it.** The
   Lorentz-invariant phase-space measure `dΦ_n` is defined once, in Layer 0.3, as a measure on
   the space of `n`-tuples of four-momenta, and a differential cross section is a function whose
   integral against `dΦ_n` is the cross section. Writing `dσ/dΦ` as a function and never as a
   "differential" avoids the trap of a Jacobian that appears or disappears depending on which
   variables one happened to write — the `x`–`y`–`Q²` Jacobian omission found during the
   executable generator's validation was exactly that trap.

4. **Weights are real, may be negative, and are never silently normalised.** A weighted sample
   is a finite family of `(event, weight)` pairs; the estimator of a cross section is the sum of
   weights divided by the number of *trials*, including rejected ones. Dividing by accepted
   events instead changes the estimand, and the convention names that trap because it is the
   commonest error in a generator's normalisation.

5. **The veto algorithm is stated for a measurable overestimate, with the inequality as a
   hypothesis.** The correctness theorem of Layer 2.2 takes `K ≤ G` as an explicit hypothesis
   on the true and overestimating kernels and produces the law of the accepted scale; it does
   not take the overestimate's *form*. The trap is a theorem about one particular overestimate
   that silently fails when the implementation changes it, which the executable code has done
   twice.

6. **The Sudakov factor is a probability, and the development says of what.** `sudakov K t T` in
   `EpsilonEridani.QFT.Shower.Sudakov` is a real number, `exp(−∫ K)`. This roadmap proves it
   equals the probability of the event "no emission in `(t, T]`" under the measure of Layer
   2.1, and uses the word "probability" only after that theorem. Before it, the arithmetic
   identities of the existing module are identities between reals.

7. **The shower is a process on configurations, indexed by a scale, with the scale decreasing.**
   The state space is the space of finite parton configurations of Layer 0.4; the index is the
   evolution variable `t`, which *decreases* from the hard scale toward the cutoff; a step is a
   splitting. The semigroup of Layer 2.4 is indexed by the non-negative *decrement* in `t`.
   Writing the semigroup in the decrement rather than in `t` is what makes it a semigroup at all,
   and the trap is a "semigroup" in a parameter that runs the wrong way.

8. **Evolution equations are semigroups, consistent with the rest of the collection.** The
   shower's law in the scale is a one-parameter semigroup in the sense of
   `TauCeti.Analysis.Semigroups.Defs`, with the splitting kernel as its generator, and the
   theorem that it reproduces leading-logarithmic DGLAP is a statement that two semigroups with
   the same generator agree, through `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`.
   The trap is proving the DGLAP correspondence by manipulating the integro-differential
   equation directly, which reproves uniqueness in an argument that upstream already owns.

9. **The splitting kernels are those of `CollinearEvolution`, as reals, and the `Float`
   functions are not them.** Layer 2 and 3 use real-valued kernels `P_qq`, `P_gq`, `P_qg`,
   `P_gg` taken from `EpsilonEridani.QFT.Factorization.Evolution` and `CollinearEvolution`. The
   `Float`-valued `pQQ`, `pGQ`, `pQG`, `pGG` in `EpsilonEridani.Generator.Splitting` are the
   implementation's transcriptions of them, related by the correspondence hypothesis of Layer
   6.1 and nothing stronger. Conflating the two is the trap this whole roadmap is built to avoid.

10. **The resolvable region is part of the kernel's definition, not a cut applied afterwards.**
    A splitting at scale `t` with momentum fraction `z` is resolvable when `z (1 − z) t > t_cut`,
    and the kernel of the shower process is the true kernel times the indicator of that region.
    The trap is an unregulated kernel whose integrated branching probability does not fall with
    the scale, which makes the cascade a supercritical branching process that does not
    terminate — the behaviour the first executable cascade exhibited, and the measurement that
    diagnosed it is recorded in `EpsilonEridani.Generator.Shower`'s module docstring.

11. **Hadronisation models are measures on hadron configurations, and nothing is claimed about
    their relation to QCD.** The Lund string and the cluster model are probability measures
    constructed in Layer 4 from stated assumptions — the area law, left–right symmetry, the
    cluster mass distribution — and their single-hadron marginals are *candidates* for the
    fragmentation functions of `Hadronization`. Whether either model is what QCD does is not a
    theorem anyone has, and the convention names the trap of writing one as though it were.

12. **Matching is unitary or it is not matching.** A matched prediction that changes the
    inclusive cross section has introduced a term that is not in either of the descriptions
    being matched. Layer 5 states unitarity as the defining property and derives the
    double-counting subtraction from it, rather than defining the subtraction and checking
    unitarity afterwards.

13. **The code is an object of hypotheses, not of theorems.** The correspondence between
    `EpsilonEridani.Generator` and the real-valued development is a single explicit structure in
    Layer 6.1 whose fields are the claims one would need, and the evidence for it is the
    statistical test of Layer 6.4. No declaration in this roadmap's `Suggested.lean` mentions a
    `Float`. The trap is a `theorem` whose statement contains `Float`, which can be true only by
    accident of the representation.

14. **Upstream absences are built in the upstream shape, and are not waited for.** Neither
    Mathlib nor TauCeti has the Lorentz-invariant phase-space measure, acceptance–rejection
    sampling, or a Poisson process; TauCeti has Markov chains in discrete time but no
    continuous-time pure-jump process. Each is built here as a target in the form the upstream
    library would want, so that it can move there without being rewritten, and nothing in this
    roadmap waits for that to happen.

## Existing upstream material used by the roadmap

The roadmap uses the following material, all of which exists at the pinned revisions.

- `EpsilonEridani.QFT.Shower.Sudakov`: `sudakov`, with `sudakov_pos`, `sudakov_self` and
  `sudakov_le_one`; `vetoWeight` with `vetoWeight_zero`, `vetoWeight_nonneg` and
  `vetoWeight_summable`; the theorems `vetoSeries_eq_exp_neg`, `sudakov_veto_eq` and
  `vetoDensity_eq`; and the ordered forms `vetoWeight_eq_ordered` and `sudakov_veto_ordered`,
  which hold for continuous kernels. Layer 2 proves that these real identities are statements
  about the law of a random variable; it does not reprove any of them. The module's own
  docstring records the two gaps — the Fubini identification of the ordered integral and the
  absence of a probability space — and this roadmap is organised around closing them.
- `EpsilonEridani.Mathematics.OrderedSimplexIntegral`: `orderedProdIntegral` with
  `orderedProdIntegral_zero`, `orderedProdIntegral_succ` and the identity
  `orderedProdIntegral_eq`, which evaluates the iterated integral over an ordered region of a
  symmetric integrand as a power over a factorial. Layer 2.3 identifies this iterated integral
  with the integral over the ordered subset of `ℝⁿ` against product Lebesgue measure, which is
  the Fubini step the Sudakov module names as unformalized.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`: `dglapOperator` and
  `dglapOperator_eq_sum_integral`, `dglapRhsLogScale`, `IsDGLAPLogScaleEquation` with
  `differentiable_of_isDGLAPLogScaleEquation` and `deriv_of_isDGLAPLogScaleEquation`, and
  `qcdRunningCoupling`. Layer 3.1's theorem is that the shower's single-inclusive density
  satisfies `IsDGLAPLogScaleEquation` for the leading-order kernels.
- `EpsilonEridani.QFT.Factorization.Evolution.QCDCore`: `IsQCDDGLAPLogScaleEquation` and the
  coupling data `qcdRunningCouplingFromRepresentation`, which fixes the colour factors the
  real-valued kernels carry.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic` and `.Collinear`: the Mellin convolution
  on the momentum-fraction interval, which the single-inclusive evolution of Layer 3.1 is
  stated in.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`: `DisKinematics`, `Q2`, `xBj`, `yInel`,
  `W2`, and `W2_eq_with_Q2`. The hard-process phase space of Layer 0.5 is parametrised by these.
- `EpsilonEridani.QFT.Scattering.DIS.CrossSection`: the differential cross section that the
  hard-process sampler of Layer 1.5 is required to reproduce.
- `EpsilonEridani.Generator.Sampler`: `HardPoint`, `Region`, `Region.xMin`, `weight`,
  `weightBound`, `SampleStats`, `sampleHardPoint`. `EpsilonEridani.Generator.CrossSection`:
  `dSigmaDxDQ2`, `f2Toy`, `yFactor`. `EpsilonEridani.Generator.Kinematics`: `q2`, `xBj`,
  `yInel`, `w2`, `q2OfXY`, `yOfXQ2`, `q2Max`. These are the implementation of the hard-process
  stage, consumed in Layer 6 as the object the correspondence hypothesis is about.
- `EpsilonEridani.Generator.Splitting`: `pQQ`, `pGQ`, `pQG`, `pGG`; the overestimates `pQQOver`,
  `pGGOver`, `pQGOver` with their closed-form integrals `pQQOverIntegral`, `pGGOverIntegral`,
  `pQGOverIntegral` and inverse samplers `pQQOverSample`, `pGGOverSample`; the acceptance
  ratios `pQQAccept`, `pGGAccept`, `pQGAccept`; `alphaS`, `lambdaQCD`, `beta0`. Layer 6.2
  states the correspondence between each of these and the real-valued object of Layers 2–3.
- `EpsilonEridani.Generator.Shower`: `ShowerConfig`, `ShowerParton`, `ShowerResult`,
  `splitOnce`, `resolvable`, `nextScale`, `pickFlavour`, `cascade`, `evolveQuark`. The
  implementation of the Sudakov process and the cascade, consumed in Layer 6.
- `EpsilonEridani.Generator.Jets`: `durhamY`, `closestPair`, `mergeScales`, `durhamJets`,
  `jetMultiplicity`. The observable used in Layer 6.4 to test the shower, with the caveat
  Layer 6.4 records about its own validation history.
- `EpsilonEridani.Generator.DISEvent`, `.Event` and `.Config`: `RunConfig`, `BeamSpec`,
  `loEventOfPoint`, `showeredEventOfPoint`, `loRun`, `showerRun`. The event-assembly stage.
- `EpsilonEridani.HepMC3.Basic`, `.Format`, `.Ascii`, `.Graph`: the event record and its
  serialisation, which Layer 6.3 treats as a measurable encoding of a final state.
- `EpsilonEridani.QFT.QCD.SU3Generators` and `.RepresentationColor`: the proved colour factors
  `C_F = 4/3`, `C_A = 3`, `T_R = 1/2` for su(3), which the real-valued kernels of Layer 3 carry.
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of
  its modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the
  invariant product in which the phase-space measure of Layer 0.3 is defined;
  `Physlib.Relativity.Tensors.RealTensor.Vector.Causality.TimeLike` and `.LightLike` for the
  mass-shell and masslessness conditions; `Physlib.Relativity.LorentzGroup.Basic`,
  `Physlib.Relativity.LorentzGroup.Boosts.Basic` and `Physlib.Relativity.LorentzGroup.Rotations`
  for the invariance statement of Layer 0.3 and the frame changes of the two-body factorisation;
  `Physlib.Mathematics.Distribution.Basic` for the distributional form of the regulated kernel
  in Layer 3.2; and `Physlib.Mathematics.Calculus.ParametricIntegration` for differentiating
  the Sudakov exponent in its limits.
- `TauCeti.Analysis.Semigroups.Defs`, `.BoundedGenerator.Basic`, `.CauchyProblem.Basic` and
  `.CauchyProblem.Uniqueness`: the one-parameter semigroup, its generator, and the abstract Cauchy
  problem with uniqueness, which Layer 2.4 poses the shower in and Layer 3.1 uses to identify the
  shower's semigroup with DGLAP's. `TauCeti.Analysis.Semigroups.Generation.BoundedPerturbation` for
  the splitting kernel as a bounded perturbation of the identity on the configuration space with a
  resolvable cut, and `TauCeti.Analysis.Semigroups.Generation.HilleYosida.Generation` for the case
  without it, where the generator is unbounded.
- `TauCeti.Probability.Kernel.ProbabilityMeasure`, `.Kernel.Composition.MeasureCompProd`,
  `.Kernel.Invariant` and `.Kernel.Randomization`: Markov kernels, their composition with a
  measure, invariant measures, and the representation of a kernel as a measurable function of
  a uniform variate — the last being exactly the statement that a kernel can be *sampled*, which
  Layer 1.1 rests on.
- `TauCeti.Probability.Process.MarkovChain`: discrete-time Markov chains, which the veto chain
  of Layer 2.2 and the cluster decay chain of Layer 4.3 are instances of.
- `TauCeti.Probability.Process.EmpiricalMeasure` and `TauCeti.Probability.Martingale.Convergence`
  for the convergence of the weighted empirical measure of Layer 1.4.
- Mathlib: `Mathlib.MeasureTheory.Measure.Map` and `Mathlib.MeasureTheory.Measure.Prod` for
  pushforwards and product measures; `Mathlib.Probability.ProductMeasure` for the countable product
  `[0,1]^ℕ` of Layer 0.1, and `Mathlib.Probability.Kernel.IonescuTulcea.Traj` for the trajectory
  measure of a chain built from a sequence of kernels, which is exactly how the veto chain of Layer
  2.2 and the jump chain of Layer 2.4 are constructed; `Mathlib.MeasureTheory.Measure.WithDensity`
  for a density against phase space; `Mathlib.MeasureTheory.Measure.GiryMonad` and
  `Mathlib.MeasureTheory.Measure.Dirac.Basic` for the composition of random constructions and the
  deterministic case; `Mathlib.MeasureTheory.Constructions.Pi` for `[0,1]^k`;
  `Mathlib.MeasureTheory.Integral.Prod` for Fubini; `Mathlib.MeasureTheory.Function.Jacobian` for
  the change of variables that the two-body factorisation and the RAMBO flatness theorem are;
  `Mathlib.Probability.Kernel.Basic`, `.Kernel.Composition.MeasureCompProd`,
  `.Kernel.MeasurableIntegral` and `.Kernel.Invariance` for Markov kernels;
  `Mathlib.Probability.Distributions.Uniform`, `.Distributions.Exponential` and
  `.Distributions.Poisson.Basic` for the three laws that appear;
  `Mathlib.Probability.ProbabilityMassFunction.Basic` and `.Monad` for the discrete flavour choice;
  `Mathlib.Probability.Process.Filtration` and `.Process.Stopping` for the stopping time at which
  the cascade terminates; `Mathlib.Probability.Independence.Basic`,
  `Mathlib.Probability.IdentDistrib`, `Mathlib.Probability.StrongLaw` and
  `Mathlib.Probability.Moments.Variance` for the cross-section estimator of Layer 1.4;
  `Mathlib.Probability.Notation` throughout.
- Absent from Mathlib, TauCeti and Physlib alike, and therefore built here in the shape the
  upstream library would want: the Lorentz-invariant phase-space measure and its two-body
  factorisation; acceptance–rejection and importance sampling as theorems; the Poisson process
  and the continuous-time pure-jump Markov process (TauCeti's `Process.MarkovChain` is
  discrete-time); and the branching-process termination criterion. Each is a Layer 0, 1 or 2
  target, and each is stated generically enough to move upstream.

## Layer 0: probability spaces, phase space, and configurations

References: Byckling and Kajantie, *Particle Kinematics*, for the phase-space measure and its
recursive factorisation; Kleiss, Stirling and Ellis, Comput. Phys. Commun. 40 (1986) 359, for
RAMBO; Kallenberg, *Foundations of Modern Probability*, for the measure-theoretic vocabulary,
which is what Mathlib's `MeasureTheory` and `Probability` namespaces develop.

### 0.1 The variate space and the generator idealisation

- The variate space `Ω_k = [0,1]^k` with the product of the uniform measures, built through
  `Mathlib.MeasureTheory.Constructions.Pi` on `Mathlib.Probability.Distributions.Uniform`, and
  its countable version `Ω = [0,1]^ℕ` through `Mathlib.Probability.ProductMeasure`, which is
  what an algorithm with an unbounded number of draws needs.
- A *generator* is a measurable function `g : Ω → E` into a measurable space of events; its
  *law* is `Measure.map g μ_Ω`. Every construction in this roadmap is a generator in this sense,
  and every correctness theorem has the form "the law of `g` is the measure `ν`".
- The idealisation hypothesis, stated once: a pseudo-random sequence is modelled by a point of
  `Ω` drawn from `μ_Ω`. The theorem that is *not* available, and is stated as such: no finite
  computation certifies that a given deterministic sequence behaves as such a draw. This is the
  one place where the development's hypotheses are empirical, and Convention 2 is the statement
  that the roadmap says so here and nowhere else.
- Composition: a generator that calls another is the Giry-monad bind of
  `Mathlib.MeasureTheory.Measure.GiryMonad`, and the law of a sequential construction is the
  composition of kernels in `Mathlib.Probability.Kernel.Composition.MeasureCompProd`. The
  theorem: the law of "sample a hard point, then shower it, then hadronise" is the composite
  kernel applied to the hard-process measure, which is what makes the stages of Layers 1, 2 and
  4 independently provable.

### 0.2 Final states and configurations

- A *parton configuration* is a finite indexed family of four-momenta together with flavour and
  colour labels, as a type `Config`, with the four-momenta valued in the `Vector 3` of
  `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`. The invariant mass of a
  configuration and its total four-momentum.
- The on-shell condition for each parton through
  `Physlib.Relativity.Tensors.RealTensor.Vector.Causality.TimeLike` (massive) and `.LightLike`
  (massless), and the theorem that the struck quark of the leading-order hard process is exactly
  massless, which the recoil scheme of Layer 3.4 depends on.
- The measurable structure on `Config`: the Borel σ-algebra on each four-momentum, the discrete
  one on the labels, and the disjoint union over the number of partons. A *hadron configuration*
  is the same with hadron labels, for Layer 4.

### 0.3 The Lorentz-invariant phase-space measure

- The one-body measure `d³p / (2E)` on the mass shell of mass `m`, as the pushforward of
  Lebesgue measure on `ℝ³` under the on-shell embedding with the density `1/(2E)`, through
  `Mathlib.MeasureTheory.Measure.WithDensity`. The theorem: this measure is invariant under the
  restricted Lorentz group of `Physlib.Relativity.LorentzGroup.Basic`, proved by the
  change-of-variables formula of `Mathlib.MeasureTheory.Function.Jacobian` for boosts along an
  axis (`Physlib.Relativity.LorentzGroup.Boosts.Basic`) and rotations
  (`Physlib.Relativity.LorentzGroup.Rotations`), and extended to the whole group by the
  decomposition of `Physlib.Relativity.LorentzGroup.Restricted.FromBoostRotation`.
- The `n`-body measure `dΦ_n(P; p₁, …, p_n)` as the product of one-body measures restricted by
  the momentum-conservation delta, defined as a measure on the hyperplane `Σ p_i = P` rather
  than through a delta function: the pushforward of the `(n−1)`-fold product under the map that
  determines `p_n`. The theorem: it is a measure, it is Lorentz invariant, and its total mass is
  finite for `P` timelike with `P² > (Σ m_i)²`.
- The recursive factorisation: `dΦ_n(P) = dΦ_{n−1}(P; p₁, …, p_{n−2}, q) · (dq²/2π) · dΦ_2(q;
  p_{n−1}, p_n)`, proved as a change of variables, with the integration range of the
  intermediate invariant mass `q²` stated. This is what every sequential phase-space generator
  implements, and the theorem is the statement that the sequence has the right law.
- The two-body measure in the rest frame of `P`: `dΦ_2 = (|p⃗| / (16π² √P²)) dΩ`, with the
  solid-angle measure, proved from the one-body definition. The three-body Dalitz form
  `dΦ_3 ∝ dm²₁₂ dm²₂₃` over the Dalitz region, with the region's boundary as a theorem about the
  kinematic limits.
- The RAMBO construction: `n` massless momenta from `4n` uniform variates, rescaled and boosted
  to total momentum `P`. The theorem: the law of the construction is `dΦ_n` normalised by its
  total mass — the construction is *flat*. The proof is the Jacobian of the rescaling-and-boost
  map, which is a nontrivial computation and the main target of this layer; its massive
  extension by a second rescaling is stated with the theorem that flatness is lost and the
  compensating weight is given.

### 0.4 The hard-process phase space in deep-inelastic kinematics

- The leading-order final state of lepton–hadron scattering: the scattered lepton and the struck
  quark, with the configuration parametrised by `(x, Q², φ)` through `DisKinematics` of
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`. The theorem: the map
  `(x, Q², φ) ↦ (k', p')` is a measurable bijection onto the kinematically allowed region, and
  the two-body phase-space measure pulls back to `dx dQ² dφ / (…)` with the Jacobian stated
  explicitly as a function of `x`, `Q²` and `s`.
- The allowed region as a measurable set: `0 < x ≤ 1`, `0 < y ≤ 1`, `Q² = x y s`, with the
  boundaries from `W2_eq_with_Q2`. The theorem that `Region` in `EpsilonEridani.Generator.Sampler`,
  with `Region.xMin`, describes this set in its own coordinates is Layer 6.2's.
- The differential cross section as a density against this measure, consumed from
  `EpsilonEridani.QFT.Scattering.DIS.CrossSection` and `InclusiveStructureFunctions`; this
  roadmap's statement is only that it *is* a density against `dΦ_2`, which is what Layer 1.5
  needs.

### 0.5 Observables and their pushforwards

- An *observable* is a measurable function `O : Config → ℝ`, and its distribution under a
  generator `g` is `Measure.map (O ∘ g) μ_Ω`. The theorem: the expectation of `O` under the
  generator's law equals its integral against the cross-section density, which is the statement
  that a generator computes integrals.
- Infrared and collinear safety is consumed from `JetsAndEventShapes` as a property of `O`;
  this roadmap uses it only to state which observables the shower's law is expected to agree
  with fixed order on, in Layer 5.

### Examples

- The one-body measure for a massless particle, invariant under a boost along the `z` axis,
  computed explicitly: the Jacobian of `(E, p_z) ↦ (γ(E − β p_z), γ(p_z − β E))` restricted to
  the light cone is `1`, after the `1/(2E)` factor.
- The two-body phase space of a massless pair at `√s`: total mass `1/(8π)`, from the two-body
  formula.
- RAMBO for `n = 2`: two uniform draws for the direction, the construction reproduces the solid
  angle measure, as a check of the general theorem in the only case that is elementary.
- The leading-order deep-inelastic Jacobian: `dΦ_2 ∝ dx dQ² dφ / (x s)` up to constants — the
  factor the executable generator's first sampler omitted, found by comparing generated events
  against a numerically integrated cross section rather than by inspection.

### Dependencies

- `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`, `.Causality.TimeLike`,
  `.Causality.LightLike`; `Physlib.Relativity.LorentzGroup.Basic`, `.Boosts.Basic`,
  `.Rotations`, `.Restricted.FromBoostRotation`.
- `Mathlib.MeasureTheory.Measure.Map`, `.Measure.Prod`, `.Measure.WithDensity`,
  `.Measure.GiryMonad`, `.Constructions.Pi`, `.Function.Jacobian`.
- `Mathlib.Probability.Distributions.Uniform`, `Mathlib.Probability.Kernel.Basic`,
  `.Kernel.Composition.MeasureCompProd`.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.CrossSection`.
- `InclusiveStructureFunctions` for the cross section as a density; `JetsAndEventShapes` for
  infrared and collinear safety.

## Layer 1: sampling theorems and the cross-section estimator

References: Devroye, *Non-Uniform Random Variate Generation*, for the sampling constructions;
Lepage, J. Comput. Phys. 27 (1978) 192, for importance sampling in this setting; Kleiss and
Pittau, Comput. Phys. Commun. 83 (1994) 141, for multi-channel sampling; Kallenberg for the
limit theorems.

### 1.1 Inverse transform and the representation of kernels

- The inverse-transform theorem: for a distribution function `F` on `ℝ`, the law of
  `F⁻¹(U)` with `U` uniform is the measure with distribution function `F`, where `F⁻¹` is the
  generalised inverse. Proved from `Measure.map` and the monotonicity of `F⁻¹`.
- Its kernel form, from `TauCeti.Probability.Kernel.Randomization`: a Markov kernel from a
  standard Borel space to another is the pushforward of the uniform measure under a jointly
  measurable function of the state and one variate. This is the theorem that every kernel in
  Layers 2 and 4 can be *sampled* from one uniform draw per step, and it is why the variate
  space of Layer 0.1 is a product of unit intervals and nothing more.
- The scale-sampling instance: for a positive kernel `G` with primitive `Γ`, the law of
  `Γ⁻¹(Γ(T) + log U)` is the density `G(t) exp(−∫_t^T G)` on `(−∞, T]`. This is the step
  `nextScale` implements, and the theorem is stated for real `G`, not for the `Float` function.

### 1.2 Acceptance–rejection

- The construction: draw `x` from a density `g`, accept with probability `f(x) / (c g(x))`
  where `f ≤ c g`. The theorem: the law of the accepted `x` is `f / ∫ f`, and the acceptance
  probability is `∫ f / c`. Proved as a pushforward of the product measure on `(x, u)` under
  the restriction to `{u ≤ f(x) / (c g(x))}`, with the hypothesis `f ≤ c g` *everywhere*, not
  almost everywhere — a violation on a null set is harmless to the law but is exactly what an
  implementation cannot detect, so the theorem is stated for the hypothesis the implementation
  checks.
- The conditional form: the number of trials to acceptance is geometric with parameter
  `∫ f / c`, so the expected cost is `c / ∫ f`; the theorem that a looser bound costs
  proportionally more trials and changes nothing else.
- The failure mode, stated as a theorem rather than a warning: if `f > c g` on a set of positive
  measure, the law of the accepted `x` is the normalised `min(f, c g)`, which is *not* `f`.
  This is the bias a wrong bound produces, and it is silent — every accepted event is
  individually valid.
- The bound-estimation step as a separate object: `weightBound` in the implementation scans a
  grid and multiplies by a safety factor; the theorem of this subsection is about an arbitrary
  bound and does not know how it was obtained, which is why the correspondence of Layer 6.2 has
  to say what the scan guarantees.

### 1.3 Importance sampling and weighted samples

- The weighted estimator: draw `x` from `g`, weight by `f(x) / g(x)`. The theorem: the weighted
  pushforward — the measure `(f/g) · Measure.map` — equals `f`, and the expectation of `w · O`
  under `g` equals `∫ O f`. Hypotheses: `g > 0` wherever `f ≠ 0`.
- The variance of the weighted estimator for an observable `O`, as an explicit integral, through
  `Mathlib.Probability.Moments.Variance`; the theorem that it is minimised over `g` by
  `g ∝ |O| f`, with the minimum stated, which is the statement that importance sampling has an
  optimum and says what it is.
- The effective sample size `(Σ w)² / Σ w²` and the theorem bounding the variance of the
  self-normalised estimator in terms of it, which is the quantity a generator reports and the
  reason it reports it.
- Negative weights: the theorem that the variance of an estimator with weights of both signs is
  bounded below by a function of the negative-weight fraction, so that a sample with fraction
  `ε` of negative weights needs a factor `(1 − 2ε)⁻²` more events for the same precision. This
  is the price named in Convention 4, as a theorem.
- Multi-channel sampling: `g = Σ α_i g_i` with `Σ α_i = 1`, the weight `f / g`, and the theorem
  that the estimator is unbiased for any `α` in the simplex, with the variance as a function of
  `α` whose minimisation is the adaptive step.

### 1.4 The cross-section estimator and its limit theorems

- The estimator `σ̂_N = (1/N) Σ_{i ≤ N} w_i` over `N` *trials*, where a rejected trial carries
  weight zero (Convention 4). The theorem: `𝔼 σ̂_N = σ` for every `N`, from Layer 1.3.
- The strong law, from `Mathlib.Probability.StrongLaw` with the independence of the trials from
  `Mathlib.Probability.Independence.Basic` and their identical distribution from
  `Mathlib.Probability.IdentDistrib`: `σ̂_N → σ` almost surely.
- The central limit theorem for `√N (σ̂_N − σ)`, with the variance from Layer 1.3, giving the
  statistical uncertainty a generator quotes. Mathlib's central limit theorem is consumed where
  it exists at the pin; where the needed form is absent, this roadmap states the Lindeberg
  condition it needs and the target, and does not wait.
- The weighted empirical measure `(1/N) Σ w_i δ_{x_i}` and its convergence to the
  cross-section measure, through `TauCeti.Probability.Process.EmpiricalMeasure`; the theorem
  that for every bounded measurable `O`, the sample mean of `w · O` converges to `∫ O dσ`. This
  is the statement that a generator computes *all* observables at once, and it is the content of
  "a generator is a sample from the cross section".

### 1.5 The hard-process sampler

- The specification: a generator on `Ω_3` whose law is the leading-order cross section of
  Layer 0.4 as a density against `dΦ_2`, in the coordinates `(x, Q², φ)`. The theorem that
  acceptance–rejection in `(log x, log Q²)` against a bound, with the Jacobian of Layer 0.4
  included in the weight, has this law — an instance of Layer 1.2 with the bound hypothesis.
- The flat azimuth: `φ` uniform on `[0, 2π)` independent of `(x, Q²)`, by the azimuthal symmetry
  of the unpolarised cross section, with the theorem that the pushforward factorises.
- The stated correspondence to `sampleHardPoint` and `weight` is Layer 6.2's; this subsection
  owns only the real-valued specification.

### Examples

- Inverse transform for the exponential law: `−log U / λ` has law `Exp(λ)`, from
  `Mathlib.Probability.Distributions.Exponential`, as the elementary case of 1.1 and the one
  the scale-sampling instance reduces to for constant `G`.
- Acceptance–rejection for `f(z) = (1 + z²)/2` against the constant bound `1` on `[0, 1]`:
  acceptance probability `2/3`, and the accepted law is `f` normalised. This is `pQQAccept`'s
  real counterpart, in the only case where everything is a rational number.
- The silent bias: `f(x) = 2x` on `[0,1]` sampled against the bound `c g = 1.5`; the accepted
  law is `min(2x, 1.5)` normalised, and its mean is `0.6111…` rather than `2/3`.
- Negative weights at fraction `ε = 0.1`: a factor `1.5625` more events for the same precision.

### Dependencies

- Layer 0.1 (variate space, pushforward), 0.4 (hard-process phase space).
- `Mathlib.MeasureTheory.Measure.Map`, `.Measure.WithDensity`, `.Integral.Prod`;
  `Mathlib.Probability.Distributions.Exponential`, `.Distributions.Uniform`,
  `.Independence.Basic`, `.IdentDistrib`, `.StrongLaw`, `.Moments.Variance`.
- `TauCeti.Probability.Kernel.Randomization`, `TauCeti.Probability.Process.EmpiricalMeasure`.
- `EpsilonEridani.QFT.Scattering.DIS.CrossSection` for the density being sampled.

## Layer 2: the Sudakov process and the shower as a Markov process

References: Sjöstrand, Phys. Lett. B 157 (1985) 321, for the veto algorithm; Buckley et al.,
Phys. Rep. 504 (2011) 145, §3, for the shower as a Markov process; Platzer and Sjödahl, Eur.
Phys. J. Plus 127 (2012) 26, for the Sudakov veto algorithm's proof in generality; Engel and
Nagel, *One-Parameter Semigroups for Linear Evolution Equations*, for the semigroup framing
that `TauCeti.Analysis.Semigroups` develops; Norris, *Markov Chains*, for the pure-jump process.

### 2.1 The Sudakov factor as a survival probability

- The emission intensity: a measurable `K : ℝ → ℝ` with `K ≥ 0`, locally integrable, as the
  rate of emission per unit scale. `sudakov K t T = exp(−∫_t^T K)` from
  `EpsilonEridani.QFT.Shower.Sudakov` is consumed as a real number with its three proved
  properties.
- The *emission process* at intensity `K`: the inhomogeneous Poisson process on `(−∞, T]` with
  intensity `K`, run from `T` downward, built here because neither Mathlib nor TauCeti has it.
  Defined as a random measure through its finite-dimensional laws — the count in a measurable
  set `A` is Poisson with mean `∫_A K`, counts in disjoint sets independent — using
  `Mathlib.Probability.Distributions.Poisson.Basic` and `Mathlib.Probability.Independence.Basic`,
  with the Kolmogorov consistency of `Mathlib.Probability.Process.Kolmogorov` for existence.
- **The theorem that gives Convention 6 its licence.** The first emission scale `τ = sup{t ≤
  T : N((t, T]) ≥ 1}` satisfies `ℙ(τ < t) = sudakov K t T` for `t ≤ T`. That is: the Sudakov
  factor is the probability of no emission in `(t, T]`, and its derivative in `t` — the
  *Sudakov density* `K(t) sudakov K t T` — is the density of the first emission scale. After
  this theorem, and not before, `sudakov` is a probability.
- Its one-step kernel form: the map `T ↦ law of τ` is a Markov kernel from scales to scales in
  the sense of `Mathlib.Probability.Kernel.Basic`, which is the object Layer 2.4 builds the
  process from.

### 2.2 The veto algorithm as a Markov chain, and its law

- The chain. Given the true intensity `K` and an overestimate `G` with `K ≤ G` (Convention 5),
  both measurable with `G` admitting an explicit primitive: from the current scale `t_i`, draw
  the next proposal `t_{i+1}` by the scale-sampling kernel of Layer 1.1 at intensity `G`, and
  accept it with probability `K(t_{i+1}) / G(t_{i+1})`. The sequence of proposals is a Markov
  chain on scales in the sense of `TauCeti.Probability.Process.MarkovChain`, with the
  acceptance indicator adjoined, and its trajectory measure is the Ionescu-Tulcea construction
  of `Mathlib.Probability.Kernel.IonescuTulcea.Traj` from the one-step kernel; the *accepted
  scale* is the chain's value at the first acceptance, a stopping time in the sense of
  `Mathlib.Probability.Process.Stopping`.
- **The main theorem of this layer.** The law of the accepted scale is the Sudakov density of
  `K`, `K(t) sudakov K t T`, *for every* overestimate `G ≥ K`. Proof structure: condition on
  the number `n` of rejections; the probability of exactly `n` rejections at scales
  `t_1 > ⋯ > t_n > t` followed by acceptance at `t` is the ordered integral of
  `Π (G − K)(t_i) · K(t) · exp(−∫_t^T G)`; summing over `n` gives, by `vetoSeries_eq_exp_neg`,
  `K(t) exp(−∫_t^T G) exp(∫_t^T (G − K)) = K(t) sudakov K t T`. The arithmetic is the existing
  theorem; what this subsection adds is that each term *is* the probability of the event it
  is claimed to be, which is the content the Sudakov module's docstring says is missing.
- The theorem that the number of rejections is almost surely finite when `∫_{−∞}^T G < ∞`, and
  the expected number is `∫ (G − K)`, so that a loose overestimate costs proportionally more
  proposals and changes the law not at all — the same dichotomy as Layer 1.2, and the reason an
  implementation may choose its overestimate for invertibility alone.
- The competing-channels form: for intensities `K_1, …, K_m` with overestimates `G_j`, propose
  from each and take the largest proposal; the theorem that the accepted scale has the Sudakov
  density of `Σ K_j` and the winning channel has probability `K_j / Σ K_j` at that scale. This
  is what a gluon with two decay channels does, and it is the real counterpart of `cascade`'s
  per-channel proposal.

### 2.3 The ordered integral, Fubini, and the identification with `orderedProdIntegral`

- The ordered region `Δ_n(t, T) = {t < t_n < ⋯ < t_1 < T} ⊂ ℝⁿ` and the integral of a function
  over it against product Lebesgue measure, through `Mathlib.MeasureTheory.Measure.Prod` and
  `Mathlib.MeasureTheory.Integral.Prod`.
- **The Fubini identification.** For continuous `f`, the integral of `Π f(t_i)` over
  `Δ_n(t, T)` equals the iterated integral `orderedProdIntegral f T n t` of
  `EpsilonEridani.Mathematics.OrderedSimplexIntegral`, and therefore, by `orderedProdIntegral_eq`,
  equals `(∫_t^T f)ⁿ / n!`. This is the step the Sudakov module names as "a Fubini argument that
  is not formalized", and it is the second of the two gaps this roadmap closes. The content is
  the measurability of `Δ_n` and the iterated application of Tonelli for non-negative `f`,
  extended to signed `f` by integrability.
- The consequence for Layer 2.2: the probability of the rejection pattern with `n` rejections is
  the ordered integral of a symmetric integrand, hence `(∫ (G − K))ⁿ / n!` times the common
  factor — which is `vetoWeight` with the real arguments, and the sum over `n` is the existing
  `vetoWeight_summable` series. The ordered-form theorems `vetoWeight_eq_ordered` and
  `sudakov_veto_ordered` already in the module are the real identities; this subsection supplies
  the measure they are identities about.
- The theorem that the ordering is a set of measure zero's worth of ambiguity: the `n!`
  permuted regions cover `(t, T)ⁿ` up to a null set and are pairwise almost disjoint, which is
  the alternative proof route the lemma's author deliberately did not take, recorded here so
  that nobody retakes it thinking it is simpler.

### 2.4 The shower as a continuous-time pure-jump Markov process

- The state space: `Config` of Layer 0.2, with the evolution variable `t` running *downward*
  from a hard scale `T` (Convention 7). A *splitting kernel on configurations* is a Markov
  kernel `Q : Config → Measure Config` that, from a configuration, picks a parton, a channel, a
  momentum fraction `z` and an azimuth, and replaces the parton by two, through the splitting
  map of Layer 3.4. Its total rate from configuration `c` at scale `t` is
  `λ(c, t) = Σ_{partons} ∫ P_{resolvable}(z, t) dz`, with the regulated kernel of Layer 3.2.
- The pure-jump process: wait a Sudakov-distributed decrement in `t` at rate `λ(c, ·)`, then
  jump by `Q`. Built here as the continuous-time pure-jump Markov process on `Config` indexed by
  the decrement `s = T − t`, through its jump chain and holding times, because TauCeti's
  `Process.MarkovChain` is discrete-time; the embedded jump chain *is* an instance of it.
- Its transition semigroup `U(s)` on bounded measurable functions of the configuration, and the
  theorem that it is a one-parameter semigroup in the sense of
  `TauCeti.Analysis.Semigroups.Defs`. With the resolvable cut, `λ` is bounded on configurations
  of bounded multiplicity, and the generator `A f (c) = λ(c) (∫ f dQ(c) − f(c))` is a bounded
  perturbation of zero, so `TauCeti.Analysis.Semigroups.Generation.BoundedPerturbation`
  applies and `U(s) = exp(sA)` with no analytic difficulty. Without the cut, `λ` is unbounded
  and the generator's domain is a genuine question; the roadmap states that case through
  `TauCeti.Analysis.Semigroups.Generation.HilleYosida.Generation` as a target and records that
  it is where the shower's well-posedness is not settled.
- The backward equation `∂_s U(s) f = A U(s) f`, as the abstract Cauchy problem of
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic`, with uniqueness from
  `.CauchyProblem.Uniqueness`. This is the object Layer 3.1 compares to DGLAP.
- The no-emission probability as the semigroup applied to the indicator of "same multiplicity":
  `U(s) 𝟙_{|c'| = |c|} (c) = exp(−∫ λ(c, ·))`, which for a single parton is `sudakov` of its
  total regulated kernel. This is the theorem that connects Layer 2.1's survival probability to
  the process, and it is what the executable generator's validation measured.

### 2.5 Termination and the branching structure

- The cascade as a branching process: each parton's offspring count is `0` (no resolvable
  emission before the cutoff) or `2`, so the multiplicity is a Galton–Watson process indexed by
  generation, with the theorem that the total number of splittings is almost surely finite if
  and only if the mean offspring number is at most one — the branching-process criterion, built
  here as a target with the generating-function proof.
- **The theorem that explains the first executable cascade.** With an *unregulated* kernel and a
  fixed `z`-window `[z₀, 1 − z₀]`, the integrated gluon branching probability down to the
  cutoff `∫_{t_cut}^T ∫ (P_gg + P_qg)(z) dz · α_s(t) dt / t` exceeds `1` for every `t_cut > 0`
  below a stated scale, so the process is supercritical and does not terminate. With the
  resolvable cut `z (1 − z) t > t_cut` (Convention 10), the window shrinks as `t` falls and
  closes at `t = 4 t_cut`, the integrated probability is finite, and the process terminates
  almost surely. The measurement that found this is recorded in
  `EpsilonEridani.Generator.Shower`; the theorem is its explanation.
- The termination scale as a stopping time in the sense of
  `Mathlib.Probability.Process.Stopping`, with the filtration of
  `Mathlib.Probability.Process.Filtration` generated by the jump chain; the final configuration
  as the process stopped there.
- The fuel budget of the implementation is *not* a mathematical object: the theorem of this
  subsection is almost-sure termination, and the correspondence of Layer 6.2 has to say what an
  exhausted budget means for the sample.

### Examples

- Constant intensity `K = λ`: the emission process is the homogeneous Poisson process, the first
  emission scale is exponential with rate `λ`, and `sudakov` is `exp(−λ (T − t))` — the case
  where 2.1 is `Mathlib.Probability.Distributions.Exponential`.
- The veto algorithm with `K = λ` and `G = 2λ`: the expected number of rejections is
  `λ (T − t)`, the accepted-scale law is `Exp(λ)` by the main theorem, and the computation can
  be done by hand as a check of the general proof.
- `n = 2` in the Fubini identification: `∫∫_{t<t₂<t₁<T} f(t₁) f(t₂) = (∫_t^T f)² / 2`, the
  elementary case, as a sanity check of the measurability argument.
- A single quark at `T = 25 GeV²` with `t_cut = 1 GeV²` and the leading-order `P_qq` with the
  resolvable cut: the no-emission probability, integrated numerically, is the value the
  executable generator's validation compared against — `0.75` for χ²/dof over seven `Q²` bins
  is what *agreement* looked like, and the real theorem is what that agreement is evidence for.

### Dependencies

- Layer 0.1, 0.2; Layer 1.1 (scale sampling), 1.2 (acceptance).
- `EpsilonEridani.QFT.Shower.Sudakov` (all declarations listed above);
  `EpsilonEridani.Mathematics.OrderedSimplexIntegral`.
- `Mathlib.Probability.Distributions.Poisson.Basic`, `.Distributions.Exponential`,
  `.Independence.Basic`, `.Process.Kolmogorov`, `.Process.Filtration`, `.Process.Stopping`,
  `.Kernel.Basic`, `.Kernel.IonescuTulcea.Traj`; `Mathlib.MeasureTheory.Measure.Prod`,
  `.Integral.Prod`.
- `TauCeti.Probability.Process.MarkovChain`; `TauCeti.Analysis.Semigroups.Defs`,
  `.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness`, `.Generation.BoundedPerturbation`,
  `.Generation.HilleYosida.Generation`.
- Layer 3.2 (the regulated kernel) and 3.4 (the splitting map), which this layer's process is
  parametrised by; the circularity is only apparent, since Layer 3 defines the ingredients and
  Layer 2 the process built from them.

## Layer 3: the shower and evolution

References: Marchesini and Webber, Nucl. Phys. B 238 (1984) 1, and Webber, Ann. Rev. Nucl.
Part. Sci. 36 (1986) 253, for coherence and angular ordering; Ellis, Stirling and Webber, *QCD
and Collider Physics*, ch. 5; Nagy and Soper, JHEP 09 (2007) 114, for the shower as an
evolution operator; `CollinearEvolution` for the DGLAP system itself.

### 3.1 The single-inclusive distribution solves leading-logarithmic DGLAP

- The single-inclusive density of the shower: for a configuration-valued process started from
  one parton of flavour `i` with momentum fraction `1` at scale `T`, the expected number of
  partons of flavour `j` with momentum fraction in `dx` at scale `t`, as a function
  `D_{j/i}(x, t; T)`. Defined as the intensity measure of the process's point configuration,
  through `Mathlib.MeasureTheory.Measure.WithDensity`.
- **The theorem.** `D_{j/i}(·, t; T)` satisfies `IsDGLAPLogScaleEquation` of
  `EpsilonEridani.QFT.Factorization.Evolution.Basic` with the leading-order kernels and the
  one-loop coupling, i.e. it solves the DGLAP system in the variable `log t`, with initial
  condition `δ_{ij} δ(1 − x)` at `t = T`. Proof: the backward equation of Layer 2.4 applied to
  the single-inclusive observable, with the real-virtual cancellation of 3.2 producing the plus
  prescription; the identification with DGLAP's semigroup is then uniqueness in
  `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`, as Convention 8 prescribes.
- The precise sense of "leading logarithmic": the theorem holds for the shower whose splitting
  probabilities are the leading-order kernels times `α_s(t)/(2π) · dt/t`, with the coupling
  evaluated at the virtuality. With the coupling evaluated at the transverse momentum instead,
  the shower resums a class of next-to-leading logarithms as well, and the roadmap states which
  — the Catani–Marchesini–Webber argument — as a target with its hypothesis on the soft limit of
  the kernels.
- The consequence Convention 8 is for: `CollinearEvolution` and this roadmap now have *one*
  semigroup, not two developments that agree numerically.

### 3.2 Unitarity, the plus prescription, and the regulated kernel

- Probability conservation: the total rate `λ(c, t)` and the no-emission probability sum to a
  normalised law, which is a theorem about the process and not a choice. The consequence for the
  single-inclusive equation: the *virtual* term — the coefficient of `δ(1 − x)` in the evolution
  kernel — is `−∫ P(z) dz` over the resolvable region, exactly what makes the integrated
  kernel a plus distribution. This is the theorem that a shower *derives* the plus prescription
  of `CollinearEvolution` Layer 0.2 from unitarity rather than imposing it.
- The regulated kernel `P^{res}(z, t) = P(z) 𝟙[z(1 − z)t > t_cut]`, as a distribution in the
  sense of `Physlib.Mathematics.Distribution.Basic`, and the theorem that as `t_cut → 0` its
  plus-regulated form converges to the plus distribution of the unregulated kernel, with the
  rate of convergence in the cutoff stated. This is the statement that the cutoff is a
  regulator and not a model parameter, and it is what licenses comparing a cut-off shower to
  cut-off-free evolution.
- The theorem that the four leading-order kernels consumed from `CollinearEvolution`, with the
  colour factors proved in `EpsilonEridani.QFT.QCD.SU3Generators` and `.RepresentationColor`,
  satisfy the momentum sum rule `Σ_j ∫ z P_{ji}(z) dz = 0` in plus-regulated form; the
  consequence that the shower conserves the expected total momentum fraction, which is the
  unitarity statement in the variable the physics cares about.

### 3.3 Coherence and angular ordering

- The soft eikonal factor for emission of a soft gluon from a colour dipole `(i, j)`:
  `W_{ij} = (p_i · p_j) / ((p_i · k)(p_j · k))`, with the four-momenta in
  `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`. Its decomposition into two
  terms `W_{ij} = W^{[i]}_{ij} + W^{[j]}_{ij}`, each collinear-singular along one leg only.
- **The angular-ordering theorem.** The azimuthal average of `W^{[i]}_{ij}` around the direction
  of `p_i` equals the collinear factor `1/(E_k² (1 − cos θ_{ik}))` when `θ_{ik} < θ_{ij}` and
  vanishes when `θ_{ik} > θ_{ij}`. Proved as an elementary integral, and it is the single
  theorem from which the angular-ordered shower's correctness in the soft limit follows: a
  shower that emits only inside the cone of the parent dipole reproduces the azimuthally
  averaged soft matrix element exactly.
- The consequence for the evolution variable: an angular-ordered shower and a
  virtuality-ordered one have different single-inclusive distributions beyond leading
  logarithm, and the theorem that they agree at leading logarithm is 3.1 applied to both. The
  roadmap states the angular-ordered process as a second instance of Layer 2.4 with a different
  ordering variable, not as a separate development.
- Colour coherence beyond the dipole: the large-`N_c` limit in which emission is a sum over
  dipoles, stated as a hypothesis with its `1/N_c²` error, and the consequence that the colour
  labels of `Config` are dipole indices in this limit.

### 3.4 Recoil and momentum conservation

- The splitting map: from a massless parton of momentum `p`, a momentum fraction `z`, a
  virtuality `t` and an azimuth `φ`, produce two daughters. The theorem that two massless
  daughters at a relative angle carry *more* energy than their massless parent at fixed
  three-momentum, so no map conserves both the parent's four-momentum and the daughters'
  masslessness; the choice is which to give up.
- The three standard choices as three definitions — conserve energy and let the spectator absorb
  the three-momentum imbalance, conserve three-momentum and give the parent a mass, or take the
  recoil from a dipole partner with a global boost — each with its theorem about what it
  conserves exactly and what it does not. The executable generator's `splitOnce` makes the first
  choice; the theorem of this subsection is why a four-momentum check on its output cannot
  detect a kinematics bug, and why the generator writes the imbalance into the event record
  instead.
- The dipole recoil scheme in full: the theorem that it conserves the total four-momentum of the
  dipole exactly, keeps all three partons massless, and is Lorentz covariant, through
  `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the boost that restores the frame.
- The theorem that the single-inclusive distribution of Layer 3.1 is independent of the recoil
  scheme at leading logarithm and dependent on it beyond, so that the choice of scheme is a
  subleading-logarithmic modelling decision and is to be stated as one.

### Examples

- The quark single-inclusive distribution at first order in `α_s`: one step of the backward
  equation gives `δ(1 − x) + (α_s/2π) log(T/t) P_qq^+(x) + O(α_s²)`, which is the first-order
  DGLAP solution, as a check of 3.1's theorem in the one case it can be done by hand.
- The virtual term for `P_qq` on the window `[z₀, 1 − z₀]`: `−C_F ∫ (1 + z²)/(1 − z) dz`, in
  closed form, equal to minus the real integrated probability, as 3.2 states.
- Angular ordering for a back-to-back dipole (`θ_{ij} = π`): the azimuthal average is the full
  collinear factor for every emission angle, so the cone is the whole hemisphere — the limiting
  case of the theorem.
- The energy-conserving recoil for a `z = 1/2` splitting at opening angle `θ`: the
  three-momentum imbalance is `|p| (1 − cos(θ/2))`, worked through, as the quantity the
  executable record stores under `showerImbalance`.

### Dependencies

- Layer 2.4 (the process), 2.5 (termination).
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.QCDCore`;
  `EpsilonEridani.QFT.Factorization.Convolution.Basic`, `.Collinear`;
  `EpsilonEridani.QFT.QCD.SU3Generators`, `.RepresentationColor`.
- `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`,
  `Physlib.Relativity.LorentzGroup.Boosts.Basic`, `Physlib.Mathematics.Distribution.Basic`.
- `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`.
- `CollinearEvolution` for the kernels, the plus prescription and the DGLAP semigroup;
  `JetsAndEventShapes` for the dead cone, which is the massive-quark modification of 3.3 and
  belongs there.

## Layer 4: hadronisation models as probability measures

References: Andersson, Gustafson, Ingelman and Sjöstrand, Phys. Rep. 97 (1983) 31, for the
string model; Andersson, *The Lund Model*, for the area law and the symmetric fragmentation
function; Webber, Nucl. Phys. B 238 (1984) 492, and Winter, Krauss and Soff, Eur. Phys. J. C
36 (2004) 381, for the cluster model; `Hadronization` for the fragmentation functions these
models' marginals are compared to.

### 4.1 The string and the area law

- The massless relativistic string between a quark and an antiquark in `1+1` dimensions: its
  world sheet, the string tension `κ`, and the area of the sheet between two breakup points as a
  Lorentz-invariant quantity, with the four-momenta in
  `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`.
- The area law as a hypothesis: the probability of a breakup configuration is proportional to
  `exp(−b A)` with `A` the total area and `b` a parameter. Stated as a hypothesis on a measure
  on breakup configurations, not derived — Convention 11.
- **The theorem that defines the model.** Left–right symmetry — the law of the hadrons is the
  same whether the string is fragmented from the quark end or the antiquark end — together
  with the area law determines the single-step fragmentation function up to two parameters:
  `f(z) ∝ z^{−1} (1 − z)^a exp(−b m_⊥² / z)`. This is the Lund symmetric fragmentation function,
  and the theorem is that it is the *unique* solution of the symmetry constraint under the area
  law. Proved as a functional equation.
- The string measure: the probability measure on hadron configurations obtained by iterating
  the single-step function from one end until the remaining invariant mass falls below a
  threshold, as a Markov chain on `(remaining string, hadrons so far)` in the sense of
  `TauCeti.Probability.Process.MarkovChain`, with the theorem that it terminates almost surely
  because the remaining mass is a supermartingale bounded below, through
  `Mathlib.Probability.Martingale.Basic`.

### 4.2 Single-hadron marginals and the handoff to `Hadronization`

- The single-hadron marginal of the string measure: the expected number of hadrons of species
  `h` with momentum fraction in `dz`, as a density. The theorem: it is a candidate for the
  fragmentation function `D_h(z)` of `Hadronization` at the hadronisation scale, in the sense
  that it is non-negative and satisfies the momentum sum rule `Σ_h ∫ z D_h(z) dz = 1` exactly,
  by the construction's conservation of the string's momentum.
- What is *not* claimed: that this marginal is the fragmentation function QCD defines. The
  identification is stated as a target in `Hadronization`'s direction — a hypothesis of the
  form "the model's marginal at the hadronisation scale, evolved by `CollinearEvolution`'s
  timelike kernels, is the measured fragmentation function" — and Convention 11 is the reason
  it is a hypothesis.
- The theorem that the marginal's small-`z` behaviour is determined by the `z^{−1}` factor and
  its large-`z` behaviour by `(1 − z)^a`, which are the two limits `Hadronization` states as
  constraints on any fragmentation function and which the model therefore satisfies by
  construction.

### 4.3 The cluster model as a Markov decay chain

- Colour-singlet clusters from the partons of a shower's final configuration in the large-`N_c`
  limit of Layer 3.3, after non-perturbative gluon splitting into quark–antiquark pairs: the
  theorem that in that limit every parton has exactly one colour partner, so the clustering is
  a perfect matching and is unique.
- The cluster mass distribution as a theorem about the shower: the invariant mass of a cluster
  is set by the shower's cutoff and is independent of the hard scale at leading logarithm, which
  is the *preconfinement* statement. Stated as a target with the hypotheses of Layer 3.1.
- The decay chain: a cluster above a mass threshold splits into two clusters along its
  quark–antiquark axis; one below it decays isotropically into two hadrons by phase space,
  through the two-body measure of Layer 0.3. The chain on `(clusters, hadrons)` is a Markov
  chain in the sense of `TauCeti.Probability.Process.MarkovChain`, and the theorem that it
  terminates in finitely many steps is a *decidable* statement — each step reduces the total
  cluster mass by at least the lightest hadron mass — not a probabilistic one, which is the
  structural difference from the string model's termination.
- The single-hadron marginal and the same handoff as 4.2, with the theorem that the cluster
  marginal has no `z^{−1}` factor — its small-`z` behaviour is set by the isotropic two-body
  decay — so the two models differ in a stated and testable way.

### Examples

- The symmetric fragmentation function at `a = 0`: `f(z) ∝ z^{−1} exp(−b m_⊥² / z)`, and the
  check that left–right symmetry holds for it by direct substitution into the functional
  equation.
- A string of invariant mass `W` fragmented into exactly two hadrons: the two-hadron law from
  the area law alone, as the case where the Markov chain has one step.
- A cluster of mass `2 GeV` decaying to two pions: the two-body phase space of Layer 0.3 gives
  the isotropic law, and the hadron momenta are `|p| = √(1 − m_π²)` in the cluster frame.
- Termination of the cluster chain for a configuration of total mass `M`: at most
  `⌊M / m_π⌋` steps, as the decidable bound.

### Dependencies

- Layer 0.2 (hadron configurations), 0.3 (two-body phase space), 3.3 (large-`N_c` colour flow).
- `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct`.
- `TauCeti.Probability.Process.MarkovChain`; `Mathlib.Probability.Martingale.Basic`.
- `Hadronization` for the fragmentation functions and their constraints; `CollinearEvolution`
  for the timelike kernels the handoff statement evolves with.

## Layer 5: matching and merging

References: Catani, Krauss, Kuhn and Webber, JHEP 11 (2001) 063, for CKKW merging; Frixione
and Webber, JHEP 06 (2002) 029, for MC@NLO; Nason, JHEP 11 (2004) 040, for POWHEG; Lönnblad
and Prestel, JHEP 03 (2013) 166, for unitarised merging; Buckley et al., Phys. Rep. 504 (2011)
145, §4.

### 5.1 Unitarity as the defining property

- A *matched* generator for a process with Born configuration space `B` and real-emission space
  `R`: a generator whose law, restricted to observables that are inclusive over the emission,
  equals the fixed-order cross section to the stated order, and whose law on exclusive
  observables is the shower's. The theorem: these two requirements determine the matched law on
  the first emission uniquely, given the shower's Sudakov factor.
- **Unitarity.** The integrated cross section of a matched generator equals the fixed-order
  integrated cross section exactly, not up to higher orders, and this is stated as the
  *definition* of matching being correct (Convention 12). The double-counting subtraction of
  5.2 is derived from it, as the unique correction that restores it.

### 5.2 The first-emission matching

- The shower's first-emission density from Layer 2.1: `K(t) sudakov K t T` in the shower
  approximation `K` to the real-emission matrix element `R/B`. The fixed-order real emission
  density `R`. The theorem that the sum of the shower's first emission and the fixed-order real
  emission double-counts the region where `K ≈ R/B`, with the double-counted integral stated.
- The subtraction: replace the fixed-order real term by `R − B K` and the shower's first
  emission by its usual form. The theorem that the resulting generator is unitary, has the
  fixed-order law on inclusive observables, and has negative weights wherever `R < B K`, with
  the negative-weight fraction as the integral of `(B K − R)⁺` — connecting to Layer 1.3's price.
- The alternative: generate the first emission with the *exact* density `R/B · exp(−∫ R/B)`
  instead of the shower approximation, and shower below it. The theorem that this is unitary by
  construction, positive-weighted, and that it exponentiates the real-emission matrix element,
  which is a different resummation from the shower's — so that "matched to the same fixed
  order" admits two inequivalent generators, and the roadmap says which differs from which by
  what.

### 5.3 Merging of multi-jet samples

- Samples at fixed jet multiplicities `0, 1, …, n`, each with a jet-resolution cut `Q_cut` in
  the Durham measure of `JetsAndEventShapes`, and the Sudakov reweighting of each by the
  no-emission probabilities of the shower history reconstructed by clustering. The theorem that
  the reweighted sum is, to leading logarithm, the shower's law on observables above `Q_cut`
  and the fixed-order law below it.
- The merging scale dependence as a residual: the theorem bounding the dependence of an
  inclusive observable on `Q_cut` by a stated power of `α_s` times a logarithm of `Q_cut`, which
  is what makes the scale a controllable parameter rather than a free one.
- Unitarised merging: the modification that subtracts from the `k`-jet sample what the
  `(k+1)`-jet sample adds inclusively, with the theorem that the inclusive cross section is
  then independent of `Q_cut` *exactly*, at the cost of negative weights whose fraction is
  stated. Convention 12 is the reason this variant is the roadmap's default.

### Examples

- Matching at first order with a shower whose `K = R/B` exactly: the subtraction vanishes, the
  two generators of 5.2 coincide, and unitarity is trivial — the limiting case.
- A `K` that overestimates `R/B` by a factor `2` on half the emission region: negative weights
  on that half, fraction computed, and the variance penalty of Layer 1.3 applied.
- Two-sample merging (`0` and `1` jets) at `Q_cut`: the Sudakov weight on the one-jet sample is
  `sudakov` evaluated between the hard scale and the jet's resolution, which is the quantity
  the reconstructed shower history supplies.

### Dependencies

- Layer 1.3 (weights), 2.1 (first-emission density), 2.4 (the shower).
- `JetsAndEventShapes` for the Durham measure and infrared and collinear safety;
  `RadiativeCorrections` for the real-emission matrix elements in the deep-inelastic case,
  consumed as data.

## Layer 6: the specification–implementation boundary

References: the module docstrings of `EpsilonEridani.Generator.Shower`,
`EpsilonEridani.Generator.Sampler` and `EpsilonEridani.QFT.Shower.Sudakov`, which record the
validation history this layer formalises the shape of; Goldberg, ACM Comput. Surv. 23 (1991) 5,
for what floating-point arithmetic is and is not.

### 6.1 The correspondence hypothesis

- A single structure, `ImplementationCorrespondence`, whose fields are the claims that would
  make the `Float`-valued generator an implementation of the real-valued development: that each
  `Float` function agrees with its real counterpart to a stated tolerance on a stated domain;
  that the pseudo-random generator satisfies the idealisation of Layer 0.1 to the extent the
  tests of 6.4 can detect; that the fuel budget is never exhausted on the sample in question.
  It is a *hypothesis*, carried as data (Convention 13), and no theorem in this roadmap has it
  as a conclusion.
- The theorem that follows *from* the hypothesis: under `ImplementationCorrespondence`, the
  observable distributions of the executable generator agree with the real-valued law to a
  tolerance that is a stated function of the field tolerances and the sample size. This is the
  only theorem that mentions the implementation, and its form — "if the code is faithful then
  its output is right" — is the honest shape of what a specification can say about code.
- What the development does *not* claim and never will: that the hypothesis is true. The
  evidence for it is 6.4.

### 6.2 The correspondence, field by field

- The hard-process stage: `Region` and `Region.xMin` describe the allowed set of Layer 0.4;
  `weight` is the real density of Layer 1.5 times the Jacobian of Layer 0.4, in log coordinates;
  `weightBound` is a bound in the sense of Layer 1.2 *if* the grid scan's maximum times the
  safety factor dominates the true supremum — a claim the scan does not prove, stated as the
  field it is. `sampleHardPoint` is the acceptance–rejection of Layer 1.2.
- The kernels: `pQQ`, `pGQ`, `pQG`, `pGG` are the leading-order kernels with the proved colour
  factors; `pQQOver`, `pGGOver`, `pQGOver` are overestimates in the sense of Convention 5, and
  the real theorem that they dominate — `(1 + z²) ≤ 2`, `z/(1−z) + (1−z)/z + z(1−z) ≤ 1/z +
  1/(1−z)`, `z² + (1−z)² ≤ 1` on `(0, 1)` — is stated and proved here, as the real fact the
  `Float` acceptance ratios `pQQAccept`, `pGGAccept`, `pQGAccept` transcribe. `alphaS` is the
  one-loop coupling with `lambdaQCD` derived from the measured coupling at the `Z` mass, and the
  real theorem that the derivation reproduces that value exactly at one loop is here.
- The Sudakov process: `nextScale` is the scale-sampling kernel of Layer 1.1; `resolvable` is
  the indicator of Convention 10; `cascade` with its per-channel proposals is the
  competing-channels veto of Layer 2.2; `pickFlavour` is the uniform choice over `n_f` flavours
  that the `g → qq̄` channel's flavour-independence at leading order licenses. `evolveQuark` is
  the process of Layer 2.4 started from one quark.
- The kinematics: `splitOnce` is the energy-conserving recoil of Layer 3.4, and the theorem of
  that subsection is the statement that its momentum imbalance, written to the event record as
  `showerImbalance`, is the quantity Layer 3.4 computes.
- The fuel budget: `ShowerConfig`'s budget and `ShowerResult`'s trial count. The correspondence
  field is that no event in the sample exhausted it; an exhausted budget is a truncation of the
  process at a non-stopping time, and the theorem that it biases the multiplicity distribution
  downward is stated so that the field's necessity is a theorem.

### 6.3 The event record as a measurable encoding

- The HepMC3 record of `EpsilonEridani.HepMC3.Basic` and `.Graph` as a function from `Config`
  to a finite graph with four-momenta, flavour codes and status labels, and the theorem that it
  is injective on the configurations the generator produces and measurable, so that a
  distribution over records *is* a distribution over configurations and nothing is lost in
  writing it out.
- The serialisation of `.Ascii` and `.Format` as a function on records, with the theorem that
  the decimal formatting of a `Float` at the precision the writer uses is injective on the
  `Float`s that occur — a theorem about the formatter, not about the physics, recorded because
  its failure produced two spurious generator defects during validation when a default
  formatter emitted too few digits.
- Attributes as observables: the per-event attributes the record carries — `Q2`, `xBj`,
  `yInel`, `nEmissions`, `nJets`, `y23`, `showerImbalance` — are observables in the sense of
  Layer 0.5, and the theorem that each is the measurable function it is named for is a
  correspondence field of 6.1.

### 6.4 Validation as a hypothesis test

- The shape of the evidence for `ImplementationCorrespondence`: a sample of `N` events, an
  observable `O`, the real-valued law's prediction for the distribution of `O` from Layers 0–5,
  and a test statistic comparing the empirical distribution to it. This roadmap states the
  construction and consumes the test itself — its null distribution, its power, its coverage —
  from the `StatisticalInference` roadmap that owns them; what is stated here is only which
  observable tests which theorem.
- The decisive observable for the Sudakov process: the fraction of events with no resolvable
  emission as a function of the hard scale, against `sudakov` of the regulated true kernel. The
  theorem it tests is Layer 2.2's — that the veto algorithm's law is independent of the
  overestimate — and the roadmap records that the executable generator's measurement of this
  quantity over seven bins of `Q²` spanning a factor of `24` agreed with the numerical integral
  of the real theorem at `χ²/dof = 0.75`, as evidence for the correspondence hypothesis and
  nothing more.
- The decisive observable for the cascade: the multiplicity distribution against the
  Galton–Watson law of Layer 2.5, which is what distinguishes a terminating process from a
  truncated one.
- **A recorded failure of validation by reimplementation.** The jet-resolution observable `y₂₃`
  was once validated against an independent reimplementation that agreed to zero deviation,
  while both read the wrong entry of the merge-scale array — the final two-to-one merge rather
  than the three-to-two one the name denotes. The theorem this records is that agreement
  between two implementations tests their *shared* reading of a specification, not the
  specification; the independent check was the function's own docstring, which neither
  implementation had been compared against. The roadmap states the correctness of
  `mergeScales` and the `y₂₃` attribute as a correspondence field with the specification written
  out, so that the comparison has a third thing to be made against.

### Examples

- The domination inequality for `pQQ`: `(1 + z²)/(1 − z) ≤ 2/(1 − z)` on `(0, 1)`, which is
  `z² ≤ 1`, as the one-line real proof behind the `Float` ratio `pQQAccept`.
- The one-loop coupling: `Λ = m_Z exp(−1/(2 β₀ α_s(m_Z)))` gives `α_s(m_Z²) = 0.118` by
  substitution, as the theorem 6.2 states; the earlier tabulated value did not, and its docstring
  claimed it did.
- The fuel-exhaustion bias: a process truncated after `k` splittings has multiplicity at most
  `k + 1`, so its multiplicity distribution is stochastically below the untruncated one.
- The `y₂₃` specification: with `n` final-state partons, `mergeScales` has `n − 1` entries and
  `y₂₃` is the entry at index `n − 3`, which is the second-to-last — written out as the
  statement the two agreeing implementations had both misread.

### Dependencies

- Every earlier layer, as the real-valued development the correspondence is to.
- `EpsilonEridani.Generator.Sampler`, `.CrossSection`, `.Kinematics`, `.Splitting`, `.Shower`,
  `.Jets`, `.DISEvent`, `.Event`, `.Config`; `EpsilonEridani.HepMC3.Basic`, `.Format`,
  `.Ascii`, `.Graph`.
- `StatisticalInference`, a proposed roadmap not yet in the collection, for the hypothesis
  test's null distribution and power; until it exists, 6.4 states the test's construction and
  names what it consumes.
- `JetsAndEventShapes` for the Durham measure's definition.

## Dependency graph

```
Layer 0  probability spaces, phase space, configurations
  │   ├── 0.1 variate space, idealisation, Giry composition
  │   ├── 0.2 configurations                         ← Physlib MinkowskiProduct, Causality
  │   ├── 0.3 Lorentz-invariant phase space, RAMBO   ← Physlib LorentzGroup; Mathlib Jacobian
  │   ├── 0.4 hard-process phase space               ← EpsilonEridani DIS.Kinematics, CrossSection
  │   └── 0.5 observables
  ▼
Layer 1  sampling theorems and the cross-section estimator
  │   ├── 1.1 inverse transform, kernel randomisation ← TauCeti Kernel.Randomization
  │   ├── 1.2 acceptance–rejection
  │   ├── 1.3 importance sampling, weights, negative weights
  │   ├── 1.4 strong law, CLT, empirical measure      ← Mathlib StrongLaw; TauCeti EmpiricalMeasure
  │   └── 1.5 the hard-process sampler (specification)
  ▼
Layer 2  the Sudakov process and the shower as a Markov process
  │   ├── 2.1 Poisson emission process; sudakov is a probability
  │   ├── 2.2 veto algorithm as a Markov chain; law = Sudakov density   ← vetoSeries_eq_exp_neg
  │   ├── 2.3 Fubini identification                    ← orderedProdIntegral_eq
  │   ├── 2.4 pure-jump process, semigroup, generator  ← TauCeti Semigroups
  │   └── 2.5 termination, branching criterion
  ▼                                        ◄────────── Layer 3.2, 3.4 (kernel, splitting map)
Layer 3  the shower and evolution
  │   ├── 3.1 single-inclusive solves DGLAP           ← IsDGLAPLogScaleEquation; Uniqueness
  │   ├── 3.2 unitarity, plus prescription, regulated kernel
  │   ├── 3.3 coherence, angular ordering
  │   └── 3.4 recoil
  ▼
Layer 4  hadronisation models as measures          → Hadronization (marginals as candidates)
  │   ├── 4.1 string, area law, symmetric fragmentation function
  │   ├── 4.2 single-hadron marginals, handoff
  │   └── 4.3 cluster model as decay chain
  ▼
Layer 5  matching and merging                      ← JetsAndEventShapes (Durham, IRC safety)
  │   ├── 5.1 unitarity as definition
  │   ├── 5.2 first-emission matching
  │   └── 5.3 multi-jet merging
  ▼
Layer 6  specification–implementation boundary     ← EpsilonEridani.Generator.*, HepMC3.*
      ├── 6.1 the correspondence hypothesis
      ├── 6.2 field by field
      ├── 6.3 event record as encoding
      └── 6.4 validation as a hypothesis test         → StatisticalInference (proposed)
```

External: `CollinearEvolution` (kernels, plus prescription, DGLAP semigroup; Layers 3, 4),
`InclusiveStructureFunctions` (the cross section as a density; Layer 0.4), `JetsAndEventShapes`
(Durham measure, infrared and collinear safety, dead cone; Layers 0.5, 5, 6),
`Hadronization` (fragmentation functions; Layer 4), `RadiativeCorrections` (real-emission matrix
elements; Layer 5), `NuclearMedium` (the shower in a medium, not here). The proposed
`StatisticalInference` roadmap is consumed by Layer 6.4 and does not yet exist; 6.4 states what
it consumes.

## Acceptance examples

Each is a statement that should be provable from the roadmap's targets once they are
discharged, in the order the layers make available.

1. **A generator is a pushforward.** For `g : Ω → E` measurable, `Measure.map g μ_Ω` is a
   probability measure, and for every bounded measurable `O`, `𝔼[O ∘ g] = ∫ O d(Measure.map g
   μ_Ω)`. (Layer 0.1; Mathlib.)
2. **Two-body phase space is Lorentz invariant.** For `Λ` in the restricted Lorentz group,
   `Measure.map (Λ × Λ) dΦ_2 = dΦ_2`. (Layer 0.3.)
3. **RAMBO is flat.** The law of the RAMBO construction for `n` massless particles at total
   momentum `P` is `dΦ_n(P) / dΦ_n(P)(univ)`. (Layer 0.3.)
4. **Acceptance–rejection has the right law.** With `f ≤ c g` everywhere, the law of the
   accepted variate is `(∫ f)⁻¹ f`, and the acceptance probability is `∫ f / c`. (Layer 1.2.)
5. **The silent bias.** With `f > c g` on a set of positive measure, the law of the accepted
   variate is the normalised `min(f, c g)`, and it differs from `(∫ f)⁻¹ f`. (Layer 1.2.)
6. **The cross-section estimator converges.** `σ̂_N → σ` almost surely, with `σ̂_N` the mean of
   weights over trials. (Layer 1.4.)
7. **`sudakov` is a probability.** For the emission process at intensity `K`, `ℙ(no emission in
   (t, T]) = sudakov K t T`. (Layer 2.1.)
8. **The veto algorithm is correct for every overestimate.** For `K ≤ G` measurable with `G`
   admitting a primitive, the law of the accepted scale is `K(t) sudakov K t T dt`,
   independently of `G`. (Layer 2.2; uses `vetoSeries_eq_exp_neg`.)
9. **The Fubini identification.** For continuous `f`, `∫_{Δ_n(t,T)} Π f(t_i) = orderedProdIntegral
   f T n t = (∫_t^T f)ⁿ / n!`. (Layer 2.3; uses `orderedProdIntegral_eq`.)
10. **The shower is a semigroup.** The transition operators `U(s)` of the pure-jump process with
    the regulated kernel form a one-parameter semigroup with bounded generator `A`, and
    `U(s) = exp(sA)`. (Layer 2.4; TauCeti.)
11. **The regulated cascade terminates.** With the resolvable cut, the number of splittings is
    almost surely finite; without it and with a fixed `z`-window, it is not. (Layer 2.5.)
12. **The shower solves DGLAP.** The single-inclusive density of the shower satisfies
    `IsDGLAPLogScaleEquation` for the leading-order kernels. (Layer 3.1.)
13. **Unitarity gives the plus prescription.** The virtual coefficient of the single-inclusive
    equation equals minus the integrated real kernel over the resolvable region. (Layer 3.2.)
14. **Angular ordering.** The azimuthal average of `W^{[i]}_{ij}` around `p_i` is the collinear
    factor for `θ_{ik} < θ_{ij}` and zero otherwise. (Layer 3.3.)
15. **No recoil scheme conserves everything.** There is no map from a massless parent to two
    massless daughters at positive relative angle that conserves the parent's four-momentum.
    (Layer 3.4.)
16. **The symmetric fragmentation function is unique.** Left–right symmetry under the area law
    determines `f(z)` up to the parameters `a` and `b`. (Layer 4.1.)
17. **The cluster chain terminates decidably.** A configuration of total mass `M` produces at
    most `⌊M / m_min⌋` hadrons. (Layer 4.3.)
18. **Matching is unitary.** The matched generator of 5.2 has integrated cross section exactly
    equal to the fixed-order one. (Layer 5.2.)
19. **Faithful code gives the right law.** Under `ImplementationCorrespondence`, observable
    distributions of the implementation agree with the real-valued law to the stated tolerance.
    (Layer 6.1.)
20. **The overestimates dominate.** `(1 + z²)/(1 − z) ≤ 2/(1 − z)`, `z/(1 − z) + (1 − z)/z +
    z(1 − z) ≤ 1/z + 1/(1 − z)`, and `z² + (1 − z)² ≤ 1` on `(0, 1)`. (Layer 6.2.)

## References

- Andersson, B., *The Lund Model*, Cambridge University Press (1998).
- Andersson, B., Gustafson, G., Ingelman, G. and Sjöstrand, T., "Parton fragmentation and
  string dynamics", Phys. Rep. 97 (1983) 31.
- Buckley, A. et al., "General-purpose event generators for LHC physics", Phys. Rep. 504
  (2011) 145.
- Byckling, E. and Kajantie, K., *Particle Kinematics*, Wiley (1973).
- Catani, S., Krauss, F., Kuhn, R. and Webber, B. R., "QCD matrix elements + parton showers",
  JHEP 11 (2001) 063.
- Devroye, L., *Non-Uniform Random Variate Generation*, Springer (1986).
- Ellis, R. K., Stirling, W. J. and Webber, B. R., *QCD and Collider Physics*, Cambridge
  University Press (1996), ch. 5.
- Engel, K.-J. and Nagel, R., *One-Parameter Semigroups for Linear Evolution Equations*,
  Springer (2000).
- Frixione, S. and Webber, B. R., "Matching NLO QCD computations and parton shower
  simulations", JHEP 06 (2002) 029.
- Goldberg, D., "What every computer scientist should know about floating-point arithmetic",
  ACM Comput. Surv. 23 (1991) 5.
- Kallenberg, O., *Foundations of Modern Probability*, 3rd ed., Springer (2021).
- Kleiss, R. and Pittau, R., "Weight optimization in multichannel Monte Carlo", Comput. Phys.
  Commun. 83 (1994) 141.
- Kleiss, R., Stirling, W. J. and Ellis, S. D., "A new Monte Carlo treatment of multiparticle
  phase space at high energies", Comput. Phys. Commun. 40 (1986) 359.
- Lepage, G. P., "A new algorithm for adaptive multidimensional integration", J. Comput. Phys.
  27 (1978) 192.
- Lönnblad, L. and Prestel, S., "Unitarising matrix element + parton shower merging", JHEP 03
  (2013) 166.
- Marchesini, G. and Webber, B. R., "Simulation of QCD jets including soft gluon
  interference", Nucl. Phys. B 238 (1984) 1.
- Nagy, Z. and Soper, D. E., "Parton showers with quantum interference", JHEP 09 (2007) 114.
- Nason, P., "A new method for combining NLO QCD with shower Monte Carlo algorithms", JHEP 11
  (2004) 040.
- Norris, J. R., *Markov Chains*, Cambridge University Press (1997).
- Plätzer, S. and Sjödahl, M., "The Sudakov veto algorithm reloaded", Eur. Phys. J. Plus 127
  (2012) 26.
- Sjöstrand, T., "A model for initial state parton showers", Phys. Lett. B 157 (1985) 321.
- Webber, B. R., "A QCD model for jet fragmentation including soft gluon interference", Nucl.
  Phys. B 238 (1984) 492.
- Webber, B. R., "Monte Carlo simulation of hard hadronic processes", Ann. Rev. Nucl. Part.
  Sci. 36 (1986) 253.
- Winter, J.-C., Krauss, F. and Soff, G., "A modified cluster-hadronisation model", Eur. Phys.
  J. C 36 (2004) 381.


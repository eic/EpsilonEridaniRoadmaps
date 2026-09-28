# Roadmap: small-x evolution, gluon saturation, and the Color Glass Condensate

The high-energy limit of QCD: the growth of the gluon density towards small momentum fraction, the
unitarity constraint that must eventually tame it, and the non-linear evolution equations that
interpolate. The mathematical content here is a family of evolution equations in rapidity rather
than in the hard scale, and the bounds that distinguish a linear from a saturated regime.

The organising object is the colour dipole amplitude `N Y x y`: the forward scattering amplitude of
a quark-antiquark pair at transverse positions `x` and `y` off a target, at rapidity `Y`. It is a
number in the unit interval, zero for a point-like dipole and one for a completely absorptive
target. Everything in this roadmap is either a property of that object at fixed rapidity, an
equation for its rapidity derivative, or a cross section written as an integral against it. The
linear equation for it — Balitsky-Fadin-Kuraev-Lipatov (BFKL) — predicts exponential growth and
therefore predicts its own failure: the central theorem of Layer 2 is that BFKL evolution drives the
amplitude out of the unit interval in finite rapidity. The non-linear equation that repairs this —
Balitsky-Kovchegov (BK) — preserves the unit interval for all rapidity, and the central theorem of
Layer 3 is exactly that.

The roadmap poses every one of these equations as a one-parameter semigroup in rapidity, acting on a
space of dipole amplitudes, with an unbounded generator. This is not a stylistic choice. The
existing module `EpsilonEridani.QFT.Factorization.Evolution.SmallX` already formalises the abstract
Cauchy problem for `∂N/∂Y = K N - B (N, N)` on a Banach space with `K` a *bounded* operator, and
proves both that the BFKL flow then exists globally and that the quadratic system need not. Its
own documentation names four gaps, and the first two are that the dipole space is not constructed
and that the physical BFKL kernel is not bounded on it. Layers 0 and 1 of this roadmap close those
two, Layer 3 closes the fourth (the missing unitarity bound), and the third — boundedness of the
dipole pairing — is discharged along the way. That module is the base, not a competitor.

The final application is the set of observables in Layer 6: the mass-number dependence of the
saturation scale that makes nuclei the preferred target, the inclusive and diffractive structure
functions written as integrals of the photon light-cone wave function against the dipole amplitude,
and the two-particle correlations that separate the two inequivalent gluon distributions. These are
the quantities the Electron-Ion Collider is built to measure, and they are the point at which this
roadmap's abstract semigroup theory produces a number.

## Scope

Included:

- The transverse plane, dipole coordinates, and the fundamental-representation light-cone Wilson
  line; the dipole operator as a normalised trace of two Wilson lines.
- The dipole amplitude and its elementary properties: vanishing at zero separation (colour
  transparency), boundedness by unitarity, reality, symmetry under exchange of the endpoints, and
  the positive-definiteness of the associated S-matrix kernel.
- The quadrupole and higher Wilson-line correlators, their definitions, and the Gaussian
  approximation relating them to products of dipoles, carried as an explicitly named hypothesis.
- The photon light-cone wave functions for a virtual photon splitting into a quark-antiquark pair,
  transverse and longitudinal, and the resulting dipole factorisation of the deep-inelastic
  structure functions.
- The Banach space of admissible dipole amplitudes; rapidity evolution as a strongly continuous
  one-parameter semigroup with an unbounded generator; invariance of the admissible set.
- BFKL evolution: the kernel in coordinate and momentum space, its conformal symmetry, its
  eigenfunctions, the characteristic function, the hard Pomeron intercept, the resulting power
  growth, and the theorem that this growth violates unitarity in finite rapidity.
- Diffusion in the logarithm of dipole size; the next-to-leading-order eigenvalue function carried
  as data, its collinear instability, and the conditions a resummed kernel must satisfy.
- The Balitsky-Kovchegov equation, the mean-field closure that produces it from the hierarchy,
  global well-posedness on the admissible set, the comparison principle, and monotonicity in
  rapidity.
- The saturation scale defined by a level set, the travelling-wave analysis of its rapidity
  dependence, the saturation exponent, and geometric scaling in the scaling window.
- The Jalilian-Marian-Iancu-McLerran-Weigert-Leonidov-Kovner (JIMWLK) equation as a Markov
  semigroup on observables of a Wilson-line configuration, the Balitsky hierarchy as its correlator
  equations, and the McLerran-Venugopalan initial condition.
- Observables: the mass-number dependence of the saturation scale, dipole-form structure functions,
  the two gluon distributions probed by two-particle correlations, and inclusive production in the
  hybrid formalism.

Not included. Collinear evolution in the hard scale, the splitting functions, and the running
coupling belong to `CollinearEvolution`; this roadmap takes the coupling and the double-logarithmic
overlap region from there and proves agreement in that region (Layer 2.8) without restating any of
it. Diffractive final states, rapidity-gap definitions and diffractive parton densities belong to
`Diffraction`, which consumes the dipole amplitude defined here. Nuclear parton densities and their
collinear modification belong to `NuclearPartonDistributions`, against which the mass-number scaling
of the saturation scale is compared in Layer 6.1. Real-photon and vector-meson light-cone wave
functions, and the photoproduction limit, belong to `Photoproduction`; this roadmap constructs only
the virtual-photon quark-antiquark wave function, because the dipole form of the inclusive structure
functions cannot be stated without it. The operator definitions of the Weizsäcker-Williams and
dipole gluon distributions, and the gluon Wigner distribution they descend from, belong to
`WignerDistributions` and `TransverseMomentumDistributions`; Layer 6.4 states which Wilson-line
correlator each observable measures and cites those areas for the distributions themselves. The
definitions of the inclusive structure functions as Lorentz-tensor decompositions belong to
`InclusiveStructureFunctions`. Multi-parton distributions in the collinear sense, and double parton
scattering, belong to `MultiPartonCorrelations`; the multi-Wilson-line correlators here are a
different object and the boundary is drawn at whether the operator is a product of Wilson lines at
fixed transverse positions. Cold-nuclear-matter energy loss and hadronic transport belong to
`NuclearMedium`; jet reconstruction to `JetsAndEventShapes`; lattice determinations of any of the
above to `LatticeBridge`. Confinement effects on the large-dipole tail, and hence the Froissart
bound, are not in this roadmap and are not in any other: Layer 0.4 states the unitarity bound at
fixed impact parameter, which is what the dipole picture supplies, and says plainly that the
Froissart bound does not follow from it.

The material belongs under `EpsilonEridani/QFT/SmallX/`, in the subdirectories `Dipole/`,
`Evolution/`, `Saturation/`, `CGC/` and `Observables/` matching Layers 0-1, 2-3, 4, 5 and 6. The
existing `EpsilonEridani/QFT/Factorization/Evolution/SmallX.lean` stays where it is and is imported;
relocating an existing module is not this roadmap's business.

## Conventions and coordination with upstream

1. **Rapidity is the evolution variable.** The symbol is `Y`, and it increases towards small
   momentum fraction: `Y = Real.log (x₀ / x)` for a fixed reference `x₀`. The logarithm of the hard
   scale is written `L = Real.log (Q ^ 2 / Q₀ ^ 2)` and never abbreviated to `Y`, `t` or `τ`. Where
   both appear in one statement, both are named in the statement. *Trap:* the collinear literature
   calls `log Q²` the evolution time and the small-x literature calls rapidity the evolution time;
   a development that uses `t` for both will produce a theorem that is true in neither.

2. **Evolution is a semigroup, not a group.** The parameter is `Y - Y₀ ≥ 0`. Backward rapidity
   evolution of BK is ill-posed and no declaration may presuppose it. This is why the target is
   `TauCeti.Analysis.Semigroups.Defs` rather than a flow. *Trap:* writing the solution as
   `exp ((Y - Y₀) • K)` for a two-sided `Y`, which is available for the linear bounded case and
   silently unavailable for everything else.

3. **The amplitude, not the S-matrix.** `N` is the forward dipole scattering amplitude normalised
   so that `N = 0` is complete transparency and `N = 1` is the black disc. The dipole S-matrix is
   `S = 1 - N`. Statements are made about `N`; `S` appears only as the abbreviation. *Trap:* the
   opposite convention is common, and in it colour transparency reads `S → 1`, so a lemma imported
   by eye from the literature will have its inequalities reversed.

4. **Two endpoints, not size and impact parameter.** The amplitude is a function of the two
   transverse positions `x y : EuclideanSpace ℝ (Fin 2)`. The dipole vector `r = x - y` and the
   impact parameter `b = (x + y) / 2` are derived abbreviations with their own simp lemmas. No
   definition may be given in terms of `r` alone. *Trap:* the impact-parameter-independent
   reduction is so common in practice that baking it into the definition looks harmless; it
   destroys the `b`-dependence that `Diffraction` needs and makes the unitarity bound, which is
   local in `b`, unstatable.

5. **Colour is explicit in `N_c`.** The fundamental representation of `SU(N_c)` is taken with the
   generator normalisation of `EpsilonEridani.QFT.QCD.SUNGenerators`. `N_c` is a variable
   throughout; `N_c = 3` appears only in `Examples` sections. The large-`N_c` limit is never a
   default: it enters as an explicit hypothesis on the statement that uses it. *Trap:* a
   development that fixes `N_c = 3` for the colour algebra and then invokes large-`N_c` for the
   mean-field closure is asserting `3 = ∞`.

6. **Wilson lines are unitary matrices, and the ordering is fixed once.** A Wilson-line
   configuration is a function `EuclideanSpace ℝ (Fin 2) → Matrix.unitaryGroup (Fin N_c) ℂ`,
   understood as the light-cone Wilson line at that transverse position with the path ordering and
   sign of the exponent fixed in `Dipole/WilsonLine.lean` and stated in its module docstring.
   Adjoint-representation lines are defined from fundamental ones, never independently. *Trap:* the
   dipole is invariant under a global flip of the ordering convention and the quadrupole is not, so
   an unstated convention is invisible until Layer 5.

7. **Fixed coupling at leading order.** The leading-order kernels carry a fixed `ᾱ_s = α_s N_c / π`
   absorbed into the kernel, matching
   `EpsilonEridani.QFT.Factorization.Evolution.SmallX`. Running-coupling BK is a different,
   rapidity-dependent kernel; wherever it appears it is named `runningCouplingBKKernel` and the
   statement says so. *Trap:* quoting a saturation exponent computed at fixed coupling as though it
   applied to the running-coupling equation, where the growth is no longer exponential in `Y`.

8. **Closures are hypotheses on theorems, never fields of structures.** The Gaussian approximation
   for the quadrupole, the mean-field factorisation of the dipole pair, and the hybrid
   factorisation of Layer 6.5 are each a named `Prop` taking the objects it constrains as
   arguments, supplied as an explicit hypothesis to every theorem that uses it. None of them is a
   field of a structure. *Trap:* a `Prop`-valued field satisfied by a placeholder witness asserts
   nothing while reading like an assumption, and the theorem that consumes it is then vacuous.

9. **The saturation scale carries its level parameter.** `Q_s` is defined by
   `N Y (dipole of size 1 / Q_s) = κ` for a parameter `κ ∈ Set.Ioo 0 1`. Every statement about the
   saturation scale quantifies over `κ`, and the theorems that matter — exponential growth,
   geometric scaling — are proved with `κ` universally quantified so that no result depends on its
   value. *Trap:* fixing `κ = 1/2` early makes the `κ`-independence of the saturation exponent
   unprovable rather than false.

10. **One Fourier convention.** The transverse Fourier transform follows
    `TauCeti.Analysis.Bochner.Fourier.Convention`. The Mellin-type transform in the complex
    anomalous-dimension variable `γ` is defined in Layer 2.3 with its contour and its normalisation
    stated, and is a different transform from the real Mellin moment of
    `EpsilonEridani.QFT.Factorization.Convolution.Mellin`; the two are never given the same name.
    *Trap:* factors of `2 π` migrating between the kernel and the measure, which changes the
    numerical intercept.

11. **Missing special functions are built here, in the shape upstream would want.** The digamma
    function and the modified Bessel functions `K₀`, `K₁` are absent from both Mathlib and TauCeti
    (see the next section). They are defined here by integral representations, in files that depend
    on nothing from this roadmap, with only the properties actually used proved, and with names and
    namespaces chosen so that the files could be moved upstream unchanged. No milestone waits on an
    upstream addition. *Trap:* stating a theorem "modulo the existence of `Real.digamma`", which is
    a milestone nobody can discharge.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `EpsilonEridani.QFT.Factorization.Evolution.SmallX` — the abstract Cauchy problem for
  `∂N/∂Y = K N - B (N, N)` on a Banach space: the system as data, the Lipschitz estimate on a ball
  with the explicit constant, global uniqueness, local existence, global well-posedness of the
  linearised system, the counterexample showing that global existence does *not* follow from the
  abstract structure, and the quantitative dilute-limit estimate. This roadmap's Layers 1 and 3
  supply exactly what that module says it lacks: a concrete dipole space, the physical kernel on it
  (unbounded, hence the semigroup rather than the exponential), and the unitarity bound that
  upgrades local to global existence.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic` and `.QCDCore` — the shape of an evolution
  equation as already realised for the collinear case, and the convention for a running coupling as
  a function on the scale.
- `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` and `.Solutions` — the worked linear
  case in moment space; Layer 2.3 follows its treatment of a transform-space eigenvalue.
- `EpsilonEridani.QFT.Factorization.Convolution.Mellin` — the real Mellin moment, used for the
  double-logarithmic matching of Layer 2.8 and explicitly distinguished from the `γ`-plane
  transform.
- `EpsilonEridani.QFT.QCD.SUNGenerators`, `.SU3Generators`, `.RepresentationColor`,
  `.CasimirDerivation`, and `EpsilonEridani.Mathematics.LieAlgebra.Casimir` — the colour algebra,
  the fundamental and adjoint Casimirs, and the normalisation used in Layer 0.
- `EpsilonEridani.QFT.QCD.OneLoopBeta` — the coupling whose fixed value is absorbed into the
  leading-order kernels, and the scale dependence that the running-coupling kernel of Layer 2.7
  refers to.
- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds` — `x`, `Q²`, `y`, `W²` and the
  physical region, from which rapidity is defined in Layer 0.1.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal` and
  `EpsilonEridani.QFT.Scattering.DIS.CrossSection` — the longitudinal and transverse virtual-photon
  cross sections that Layer 0.7 writes as dipole integrals.
- `EpsilonEridani.Particles.Parton.PDF.Basic` — the gluon density whose small-`x` behaviour Layer
  2.4 and Layer 6.1 compare against.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` — used for the positive-definiteness
  of the S-matrix kernel in Layer 0.5 and of the MV covariance in Layer 5.6.

From TauCeti:

- `TauCeti.Analysis.Semigroups.Defs`, `.Basic`, `.Generator`, `.Generator.Basic`, `.Generator.Closed`
  and `.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness` — the one-parameter semigroup, its
  generator, closedness of the generator, the abstract Cauchy problem and its uniqueness. This is
  the frame for every evolution equation in the roadmap, and nothing here reproves existence or
  uniqueness for an abstract linear equation.
- `TauCeti.Analysis.Semigroups.Generator.Invariance` — invariance of a set under the semigroup, the
  exact shape in which "the amplitude stays in the unit interval" is stated in Layers 1.4 and 3.2.
- `TauCeti.Analysis.Semigroups.Generation.HilleYosida.Generation`,
  `.Generation.LumerPhillips`, `.Dissipative.Basic` and `.Dissipative.Perturbation` — generation
  theorems for an unbounded generator, which is what the physical BFKL operator is.
- `TauCeti.Analysis.Semigroups.GrowthBound` and `.ExponentialShift` — the growth bound of a
  semigroup and its shift, which is the intercept of Layer 2.4 stated abstractly.
- `TauCeti.Analysis.Semigroups.BoundedGenerator.Perturbation` and `.Resolvent.Basic` — bounded
  perturbation, used for the cut-off kernels of Layer 1.5 and for the resolvent estimates of Layer
  2.3.
- `TauCeti.Analysis.ODE.GlobalSolution`, `.Linear`, `.InitialCondition`, `.UniformTime` — the
  finite-dimensional reductions of Layers 3.5 and 4.2, where the equation becomes a genuine ODE.
- `TauCeti.Analysis.Fredholm.Criteria`, `.CompactPerturbation`, `.FiniteRank`, `.SelfAdjoint`,
  `.Index` — the spectral analysis of the kernel in Layer 2.2 and the inverse problem of Layer 6.2,
  where extracting the amplitude from a measured structure function is a Fredholm question.
- `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` and
  `TauCeti.Analysis.Contour.PerWindow.CPV` — principal values on a contour, for the inverse
  transform of Layer 2.3.
- `TauCeti.Analysis.Bochner.Gaussian.Basic`, `.Measure`, and
  `TauCeti.Probability.Distributions.Gaussian.Multivariate`, `.Moments`, `.QuadraticForm` — the
  Gaussian weight of the McLerran-Venugopalan model in Layer 5.6 and the Wick contractions its
  moments give.
- `TauCeti.Analysis.Bochner.Fourier.Convention` — the transverse Fourier convention fixed in
  Convention 10.
- `TauCeti.RepresentationTheory.Compact.Haar`, `TauCeti.Analysis.Matrix.UnitaryGroup`,
  `TauCeti.LinearAlgebra.UnitaryGroup`, `TauCeti.Analysis.Matrix.Spectrum` — the unitary group,
  its Haar measure, and matrix spectra, for the Wilson-line configurations of Layer 5.1 and the
  group averages of Layer 5.6.
- `TauCeti.Analysis.Sobolev.W1p.Basic`, `.Embedding`, `.Mollification`, and
  `TauCeti.Analysis.Holder.Basic` — the regularity of the dipole space in Layer 1.1 and the
  mollified initial data of Layer 3.2.
- `TauCeti.Analysis.SpecialFunctions.Gamma` and `.Beta` — the Gamma function from which the digamma
  of Layer 2.3 is built, and the Beta integrals appearing in the conformal eigenfunction
  normalisation.
- `TauCeti.Analysis.CompletelyMonotone.Basic` — used in Layer 4.5 to state the monotonicity
  structure of the scaling function.
- `TauCeti.Probability.Process.MarkovChain` and `TauCeti.Probability.Martingale.Convergence` — the
  lattice-regularised JIMWLK process of Layer 5.5 and the martingale property of the dipole
  amplitude along it.
- `TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov` and
  `TauCeti.Analysis.PositiveDefinite.AddGroup` — positive-definiteness of the S-matrix kernel in
  Layer 0.5.

From Mathlib: `Mathlib.Analysis.ODE.Gronwall` and `Mathlib.Analysis.ODE.PicardLindelof` for the
finite-dimensional and locally-Lipschitz arguments; `Mathlib.Topology.MetricSpace.Contracting` for
the fixed-point construction of Layer 4.3; `Mathlib.Analysis.SpecialFunctions.Log.Basic` and
`Mathlib.Analysis.SpecialFunctions.Complex.Log` for the rapidity and for the `γ`-plane analysis;
`Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral` for the MV integrals;
`Mathlib.LinearAlgebra.UnitaryGroup` and `Mathlib.Algebra.Star.Unitary` for the Wilson lines;
`Mathlib.Analysis.Matrix.Spectrum` for matrix spectra;
`Mathlib.MeasureTheory.Integral.Bochner.Set` for the transverse integrals.

Genuine absences, and what the roadmap does instead:

- ⚠ **Modified Bessel functions `K₀`, `K₁` are absent from both Mathlib and TauCeti.** They are
  needed for the photon light-cone wave functions (Layer 0.7) and for the momentum-space form of
  the dipole kernel. Layer 0.7 defines them by the integral representation
  `K_ν t = ∫ u in Ioi 0, Real.exp (- t * Real.cosh u) * Real.cosh (ν * u)` and proves only the
  facts used: positivity, strict monotonicity, the small-argument logarithmic divergence of `K₀`,
  the `1 / t` divergence of `K₁`, exponential decay at large argument, and the derivative relation
  `K₀' = - K₁`. These live in a file with no dependence on the rest of the roadmap.
- ⚠ **The digamma function is absent from both.** The BFKL characteristic function is
  `χ γ = 2 * digamma 1 - digamma γ - digamma (1 - γ)`, so Layer 2.3 cannot be stated without it.
  It is defined as the logarithmic derivative of `TauCeti.Analysis.SpecialFunctions.Gamma`, and the
  properties proved are the recurrence, the reflection formula, convexity on the positive reals,
  the value at one, and the series representation — enough for the intercept, for the minimum of
  `χ` at `γ = 1/2`, and for the second derivative there.
- ⚠ **Travelling-wave and reaction-diffusion theory is absent from both.** There is no FKPP
  equation, no front-propagation machinery, no velocity-selection result. Layer 4 builds the
  one-dimensional front theory it needs from scratch: the travelling-wave ansatz as an ODE boundary
  value problem, existence of a monotone front for every speed above the critical one, and
  convergence of the initial-value problem to the critical front for steep initial data. This is
  the largest piece of genuinely new analysis in the roadmap and it is written so as to be usable
  for any FKPP-type equation, not only BK.
- ⚠ **Saddle-point and steepest-descent asymptotics are absent from both.** Layer 2.6 needs the
  Gaussian-window estimate for a contour integral with a quadratic maximum. It is proved there in
  the one form needed — a real integral over a vertical contour with a twice-differentiable
  exponent having a nondegenerate interior maximum — rather than in general.
- ⚠ **Order-preserving semigroups and comparison principles for non-linear evolution equations are
  absent from TauCeti.** Its `TauCeti.Analysis.PDE` subtree is elliptic theory — Dirichlet problem,
  Caccioppoli, energy forms, Fredholm alternative — and does not apply to an equation in rapidity.
  Layer 3.3 proves the comparison principle for BK directly, by a Grönwall argument on the
  difference of two solutions restricted to the admissible set.
- ⚠ **There is no measure on a space of maps into a compact group,** and no functional derivative.
  JIMWLK is conventionally written as a functional Fokker-Planck equation for a weight functional
  on such a space, and that formulation is not available. Layer 5 therefore does not attempt it:
  JIMWLK is posed as a strongly continuous positivity-preserving contraction semigroup on a Banach
  space of bounded observables of a Wilson-line configuration, with the weight functional appearing
  only through the expectation functional it defines. This is the dual formulation, it is
  equivalent where both make sense, and it needs only `TauCeti.Analysis.Semigroups` and Haar
  measure on the finite-dimensional group.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the boost-invariance statement
  underlying geometric scaling, and
  `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the dipole kinematics.

## Layer 0: transverse geometry, Wilson lines, and the dipole amplitude

References: Nikolaev and Zakharov, *Z. Phys.* **C49** (1991) 607; Mueller, *Nucl. Phys.* **B415**
(1994) 373; Kovchegov and Levin, *Quantum Chromodynamics at High Energy*, CUP 2012, chapters 3-4.

### 0.1 The transverse plane and dipole coordinates

Transverse positions are points of `EuclideanSpace ℝ (Fin 2)`. A `Dipole` is a pair of transverse
positions, recorded as a structure with fields `quark` and `antiquark`, together with the derived
`size` (the difference) and `impactParameter` (the midpoint) and the simp lemmas reconstructing the
endpoints from them. Rapidity is defined from the deep-inelastic kinematics of
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` by `Y = Real.log (x₀ / x)` at a fixed reference
`x₀`, with the lemma that `Y` is strictly antitone in `x` on the physical region of
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds`.

To prove: rapidity is strictly antitone in `x`; the map from endpoints to size and impact parameter
is a linear isomorphism; the dipole of zero size is exactly the diagonal.

### 0.2 Light-cone Wilson lines

A `WilsonConfiguration N_c` is a function from the transverse plane to
`Matrix.unitaryGroup (Fin N_c) ℂ`. The physical content — that the matrix at a transverse position
is the path-ordered exponential of the gauge field integrated along a light-cone ray — is recorded
in the module docstring and in a separate definition `ofGaugeField` that produces a configuration
from a field, but the theory of Layers 0-4 is developed for an arbitrary configuration. This is
deliberate: every property used downstream follows from unitarity and from the transformation law,
and nothing follows from the path-ordered exponential that is not already implied by them.

To prove: the configuration takes values in the unitary group, hence every entry is bounded by one
in modulus; a gauge transformation acts by `U x ↦ V x * U x * (V x)⁻¹` for
`V : transverse plane → unitaryGroup` and the dipole operator of 0.3 is invariant under it; the
adjoint-representation line defined from the fundamental one is real orthogonal.

### 0.3 The dipole operator and the dipole amplitude

The dipole operator of a configuration `U` at endpoints `x`, `y` is
`S U x y = (1 / N_c) * (Matrix.trace (U x * (U y)ᴴ)).re`. A *dipole amplitude at rapidity `Y`* is
obtained by averaging `1 - S` over the target: the roadmap treats the average as given, that is, a
dipole amplitude is a function `N : ℝ → EuclideanSpace ℝ (Fin 2) → EuclideanSpace ℝ (Fin 2) → ℝ`
satisfying the admissibility conditions of 0.4 and 0.5, and Layer 5 supplies the expectation
functional that produces one from a configuration ensemble.

To prove: `S U x x = 1` for every configuration; `S U x y = S U y x`; `|S U x y| ≤ 1`, from
unitarity and the Cauchy-Schwarz inequality for the trace inner product; and hence the amplitude
`N = 1 - S` satisfies `N x x = 0` and `N x y ∈ Set.Icc 0 2` before averaging, sharpening to
`Set.Icc 0 1` under the positivity of 0.5.

### 0.4 Colour transparency and the unitarity bound

*Colour transparency* is the statement `N Y x x = 0`, together with the quantitative version: for a
configuration that is Hölder continuous of exponent `α` in the transverse position,
`N Y x y = O (‖x - y‖ ^ (2 * α))` as `y → x`, and for the differentiable case the leading behaviour
is quadratic in the separation. The physical statement — that a small dipole is a colour singlet and
therefore does not interact — is the content of `S U x x = 1`, and the quantitative version is the
first place where the smoothness assumed of the configuration matters.

The *unitarity bound* is `N Y x y ≤ 1` at every fixed impact parameter. It is proved from the
positivity of the averaged S-matrix, not assumed. It is the bound that BFKL violates and BK
respects, and it is stated pointwise in the impact parameter because that is the form both later
statements need.

To prove: `N Y x x = 0`; the Hölder estimate; the unitarity bound from 0.5; and the *black disc*
characterisation, that `N Y x y = 1` for all `x ≠ y` in a region is equivalent to the vanishing of
the averaged S-matrix there.

What is *not* proved: that the unitarity bound at fixed impact parameter implies a bound on the
total cross section growing no faster than `log² s`. That implication requires the large-`b`
behaviour of the amplitude to be controlled by a confinement scale, which the dipole picture does
not supply. The Froissart bound is therefore outside this roadmap and no statement in it may be read
as implying it.

### 0.5 Reality, symmetry, and positive-definiteness

The averaged S-matrix, viewed as a kernel on the transverse plane, is positive semidefinite: for any
finite family of transverse positions the matrix `(S Y xᵢ xⱼ)` is positive semidefinite in the sense
of `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`. This is the statement that the
average is over a genuine ensemble of unitary matrices, and it is the source of `0 ≤ S ≤ 1` and
hence of the unitarity bound. It is stated as a defining property of an *admissible* amplitude, and
Layer 5.6 verifies it for the McLerran-Venugopalan ensemble.

To prove: positive semidefiniteness implies `S Y x y ≤ S Y x x = 1` and `S Y x y ≥ -1`, hence
`N Y x y ∈ Set.Icc 0 2`; the stronger `S ≥ 0` follows for ensembles of the Gaussian type of 5.6 and
is carried as part of admissibility otherwise; the connection to
`TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov`.

### 0.6 Quadrupoles and higher correlators

The quadrupole operator is
`Q U x y z w = (1 / N_c) * (Matrix.trace (U x * (U y)ᴴ * U z * (U w)ᴴ)).re`, and the general
`2n`-point Wilson-line correlator is defined by the same pattern. The *Gaussian approximation* is
the named hypothesis `IsGaussianCorrelated` asserting that the averaged quadrupole is the
combination of averaged dipoles given by the Wick expansion of a Gaussian weight. It is a
hypothesis, it is false in general, and every theorem that uses it takes it as an argument.

To prove: the coincidence limits `Q U x y y w = S U x w` and `Q U x x z w = S U z w`; the unitarity
bound `|Q| ≤ 1`; the large-`N_c` factorisation of the Gaussian expression into a product of two
dipoles, stated with the `N_c → ∞` limit explicit; and that `IsGaussianCorrelated` is preserved by
the JIMWLK evolution of Layer 5 only in the large-`N_c` limit, which is recorded as a *negative*
result — the Gaussian form is not an invariant of the exact evolution.

### 0.7 Photon light-cone wave functions and dipole factorisation

The light-cone wave function of a virtual photon of virtuality `Q²` splitting into a quark of
flavour `f` and longitudinal momentum fraction `z` and an antiquark, at transverse separation `r`,
is defined for transverse and longitudinal polarisation. The squared wave functions, summed over
helicities and colours, are

- transverse: proportional to `α_em N_c e_f² [(z² + (1-z)²) ε² K₁(ε r)² + m_f² K₀(ε r)²]`,
- longitudinal: proportional to `α_em N_c e_f² [4 Q² z² (1-z)² K₀(ε r)²]`,

with `ε² = z (1 - z) Q² + m_f²`. The modified Bessel functions are the ones constructed in this
layer; the overall normalisation is fixed by the convention stated in the file, and the theorems
below are stated so that the normalisation cancels.

The *dipole factorisation* of the virtual-photon cross sections is then
`σ_{T,L} (x, Q²) = ∫ dz ∫ d²r |ψ_{T,L}(z, r; Q²)|² σ_dipole(x, r)` with
`σ_dipole(x, r) = 2 ∫ d²b N Y x y`. This is the bridge from the dipole amplitude to
`EpsilonEridani.QFT.Scattering.DIS.CrossSection`, and Layer 6.2 uses it.

To prove: positivity and integrability of both squared wave functions over `z ∈ (0,1)` and over the
transverse plane at fixed `Q² > 0`; the massless limit exists for the longitudinal wave function and
the transverse one has an integrable logarithmic enhancement at small `r`; the longitudinal wave
function vanishes as `Q² → 0` and the transverse one does not, which is the statement that
`Photoproduction` picks up; and the factorisation formula as a definition-unfolding identity once
the dipole cross section is defined by the displayed integral.

### Examples

- The one-gluon-exchange amplitude `N(r) = c r² log (1 / (r Λ))` for small `r`: admissible in the
  sense of 0.5 after a cut-off at large `r`, colour transparent, and *not* bounded by one without
  the cut-off — the simplest illustration that admissibility is a real restriction.
- The Golec-Biernat-Wüsthoff amplitude `N(r) = 1 - exp (- r² Q_s² / 4)`: admissible, colour
  transparent with the exact quadratic behaviour, saturating at one, and used throughout the
  roadmap as the standard test initial condition.
- The black disc `N ≡ 1` off the diagonal: admissible, and the unique amplitude at which the
  BK right-hand side of Layer 3 vanishes identically away from the diagonal.
- For `N_c = 3` and a configuration taking only the values `1` and a fixed non-central unitary,
  the dipole operator takes exactly two values and the positive-semidefiniteness of 0.5 can be
  checked by hand.

### Dependencies

`EpsilonEridani.QFT.QCD.SUNGenerators`, `.RepresentationColor`, `.CasimirDerivation`;
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, `.Bounds`, `.CrossSection`,
`.Tensors.Longitudinal`; `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`;
`TauCeti.Analysis.Matrix.UnitaryGroup`, `TauCeti.LinearAlgebra.UnitaryGroup`,
`TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov`, `TauCeti.Analysis.Holder.Basic`;
`Mathlib.LinearAlgebra.UnitaryGroup`, `Mathlib.Algebra.Star.Unitary`,
`Mathlib.MeasureTheory.Integral.Bochner.Set`. The Bessel functions are built in this layer.

---

## Layer 1: the dipole space and rapidity evolution as a semigroup

References: Balitsky, *Nucl. Phys.* **B463** (1996) 99; Kovchegov, *Phys. Rev.* **D60** (1999)
034008; Engel and Nagel, *One-Parameter Semigroups for Linear Evolution Equations*, Springer 2000,
chapters I-II.

### 1.1 The space of admissible amplitudes

`DipoleSpace` is the Banach space of bounded uniformly continuous real functions of two transverse
positions, with the supremum norm, restricted to functions vanishing on the diagonal. The
*admissible set* `Admissible` is the subset of functions taking values in `Set.Icc 0 1` and
satisfying the symmetry and positive-semidefiniteness conditions of Layer 0.5. It is a closed,
bounded, convex subset of `DipoleSpace`.

To prove: `DipoleSpace` is a Banach space; `Admissible` is closed, convex and bounded; the diagonal
constraint is preserved under the norm limit; and `Admissible` is *not* a linear subspace, which is
why the semigroup statements of 1.4 are invariance statements rather than boundedness statements.

A design decision, stated here because everything downstream depends on it: the supremum norm is
used, not an `L²` norm. The reason is that the unitarity bound is a pointwise bound and the natural
statement of Layer 3.2 is invariance of a sup-norm ball intersected with a cone. The cost is that
the BFKL operator is not self-adjoint on this space and no spectral theorem is available; the
spectral analysis of Layer 2.2 is therefore carried out on the transform side, not by Hilbert-space
methods.

### 1.2 Rapidity evolution as a semigroup

A *rapidity evolution* is a strongly continuous one-parameter semigroup
`T : ℝ≥0 → DipoleSpace →L[ℝ] DipoleSpace` in the sense of `TauCeti.Analysis.Semigroups.Defs`, or,
for the non-linear equations, a strongly continuous semigroup of maps `Admissible → Admissible` in
the sense made precise in 1.4. The semigroup law `T (Y₁ + Y₂) = T Y₁ ∘ T Y₂` is the statement that
evolution from `Y₀` to `Y₂` through an intermediate rapidity does not depend on the intermediate
rapidity, which is the physical content of rapidity factorisation.

To prove: the semigroup law implies that the amplitude at any rapidity determines it at all larger
rapidities; a strongly continuous semigroup has a closed densely defined generator
(`TauCeti.Analysis.Semigroups.Generator.Closed`); and the generator determines the semigroup
(`.Generator.Uniqueness` in the same subtree).

### 1.3 The generator and its domain

The generator of a rapidity evolution is the object the roadmap calls a *small-x kernel*. For BFKL
it is the linear operator of Layer 2.1; for BK it is that operator minus the quadratic term of Layer
3.1. The domain is the set of amplitudes for which the defining limit exists in the supremum norm,
and characterising it concretely for the physical kernel is part of this layer.

To prove: the LO BFKL operator is well defined on amplitudes that are Hölder continuous with
exponent `α > 0` and vanish at the diagonal at least quadratically; on that domain the individual
terms of the kernel are each divergent and their combination is not, which is the *real-virtual
cancellation* and is the substantive lemma of 2.1; the operator is unbounded on `DipoleSpace`; and
it is closable.

**Open question, stated as one.** Whether the LO BFKL operator on `DipoleSpace` generates a strongly
continuous semigroup is not settled by this roadmap and the roadmap does not claim it. Its
eigenvalues `χ γ` are unbounded as `γ → 0` and `γ → 1`, so no generation theorem applies on the
whole space. The roadmap proceeds in two ways that are both definite work: it constructs the
semigroup on the weighted subspace of 1.5, where the weight suppresses the large- and small-dipole
regions and the generator becomes bounded, and it states the generation question on the unweighted
space as a named open problem with the two candidate routes (a Lumer-Phillips argument for a
dissipative restriction, and a Hille-Yosida argument via explicit resolvent bounds) recorded so that
a contributor knows what would settle it. A contributor may not discharge the open problem by
adding a hypothesis that assumes it.

### 1.4 Invariance of the admissible set

The statement that an evolution preserves unitarity is that `Admissible` is invariant under the
semigroup. For a linear semigroup this is the invariance of a closed convex set, and
`TauCeti.Analysis.Semigroups.Generator.Invariance` gives the criterion in terms of the generator:
invariance holds if and only if the resolvent maps the set into itself for all large real spectral
parameters. This layer states the criterion in the form used in Layers 2.5 and 3.2 and proves the
two elementary consequences.

To prove: invariance of a closed convex set is equivalent to the resolvent condition; invariance of
`Admissible` implies the pointwise bound `0 ≤ N Y x y ≤ 1` for all `Y ≥ Y₀`; and a semigroup whose
growth bound is positive cannot leave a bounded set invariant unless every orbit in it is bounded —
the abstract skeleton of the unitarity-violation theorem of 2.5.

### 1.5 The weighted space, the cut-off kernel, and the link to the existing module

For a weight `w` on dipole sizes that decays at both ends, `WeightedDipoleSpace w` is the space of
amplitudes with `w`-weighted supremum norm. On it the LO kernel is a bounded operator, with an
explicit bound in terms of the weight, and therefore generates a uniformly continuous semigroup by
`TauCeti.Analysis.Semigroups.UniformlyContinuous`. The quadratic term of Layer 3 is a bounded
bilinear map on the same space. This is exactly the data of `SmallXSystem` in
`EpsilonEridani.QFT.Factorization.Evolution.SmallX`, so this layer produces a term of that structure
and thereby imports, rather than reproves, that module's uniqueness, local existence, linear
well-posedness and dilute-limit estimate.

To prove: the weighted norm makes the LO kernel bounded, with the explicit constant; the quadratic
term is bounded bilinear, with the explicit constant, which is the module's third declared gap
discharged; the construction of a `SmallXSystem` from a weight; and the consistency lemma that a
solution on the weighted space which happens to be admissible is a solution in the unweighted sense.

### Examples

- The zero kernel, giving the trivial semigroup and a rapidity-independent amplitude: admissible,
  and the degenerate case of every theorem below.
- Multiplication by a bounded negative function of dipole size: a uniformly continuous semigroup
  that shrinks every amplitude towards zero, illustrating invariance of `Admissible` for a
  non-trivial generator.
- The Gaussian weight `w r = exp (- (log r) ^ 2 / (2 σ²))`: an explicit weight for which the bound
  of 1.5 can be computed, and for which the bound diverges as `σ → ∞`, exhibiting the open question
  of 1.3 concretely.

### Dependencies

Layer 0. `TauCeti.Analysis.Semigroups.Defs`, `.Basic`, `.Generator.Basic`, `.Generator.Closed`,
`.Generator.Invariance`, `.UniformlyContinuous`, `.GrowthBound`, `.CauchyProblem.Basic`,
`.CauchyProblem.Uniqueness`, `.Generation.HilleYosida.Generation`, `.Generation.LumerPhillips`,
`.Dissipative.Basic`; `TauCeti.Analysis.Sobolev.W1p.Basic`, `.Embedding`;
`EpsilonEridani.QFT.Factorization.Evolution.SmallX`.

---

## Layer 2: BFKL, and the theorem that it violates unitarity

References: Fadin, Kuraev and Lipatov, *Phys. Lett.* **B60** (1975) 50; Kuraev, Lipatov and Fadin,
*Sov. Phys. JETP* **45** (1977) 199; Balitsky and Lipatov, *Sov. J. Nucl. Phys.* **28** (1978) 822;
Lipatov, *Sov. Phys. JETP* **63** (1986) 904; Fadin and Lipatov, *Phys. Lett.* **B429** (1998) 127;
Ciafaloni, Colferai and Salam, *Phys. Rev.* **D60** (1999) 114036.

### 2.1 The kernel in coordinate space and the real-virtual cancellation

The leading-order BFKL operator in coordinate space acts on an amplitude by

`(K N) x y = (ᾱ_s / (2 π)) ∫ d²z (‖x - y‖² / (‖x - z‖² ‖z - y‖²)) (N x z + N z y - N x y)`.

The dipole kernel `‖x - y‖² / (‖x - z‖² ‖z - y‖²)` is non-negative and has non-integrable
singularities at `z = x` and `z = y`. The combination in the bracket vanishes at both, and the
substance of this subsection is that the integral converges for amplitudes in the domain of 1.3.
This is the *real-virtual cancellation*: the emission terms `N x z + N z y` and the virtual term
`- N x y` are separately divergent.

To prove: non-negativity of the dipole kernel; its conformal inversion property; the cancellation
lemma, that the bracket is `O (‖z - x‖ ^ α)` as `z → x` for a Hölder amplitude, hence the integrand
is integrable near `z = x` and by symmetry near `z = y`; convergence of the large-`z` region for
bounded amplitudes; and linearity and positivity-preservation of `K` on non-negative amplitudes.

### 2.2 Conformal symmetry and the eigenfunctions

The dipole kernel is invariant under the Möbius group acting on the transverse plane identified with
the complex numbers. The eigenfunctions of `K` are therefore labelled by a conformal spin `n : ℤ`
and an anomalous dimension `γ` on the line `Re γ = 1/2`, and take the standard power form in the
cross-ratio built from the endpoints and two reference points.

To prove: invariance of the dipole kernel under translations, rotations, dilatations and inversion
of the transverse plane; the composite statement that it commutes with the Möbius action; that the
power functions `(‖x - y‖²)^(γ - 1)` are eigenfunctions of the zero-conformal-spin sector for
`γ` in the fundamental strip, with the eigenvalue of 2.3; and the orthogonality and completeness of
the eigenfunctions on the fundamental strip, which is the statement that the `γ` transform of 2.3 is
invertible.

The forward, zero-conformal-spin sector is the only one this roadmap develops in full; the
non-forward and non-zero-spin sectors are defined and their eigenvalues stated, because `Diffraction`
needs the non-forward case, but their completeness is proved only for the forward sector.

### 2.3 The characteristic function

The eigenvalue is `ᾱ_s χ γ` with `χ γ = 2 * digamma 1 - digamma γ - digamma (1 - γ)`. The digamma
function is constructed in this subsection as the logarithmic derivative of the Gamma function of
`TauCeti.Analysis.SpecialFunctions.Gamma`. The `γ`-plane transform of an amplitude is defined by an
integral along the vertical line `Re γ = 1/2`, with the contour and normalisation stated, and the
inverse transform by `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic`.

To prove: the digamma recurrence and reflection formulae, and convexity on the positive reals; from
these, that `χ` is real, symmetric about `γ = 1/2`, strictly convex on the open unit interval, and
has a unique minimum there at `γ = 1/2` with value `χ (1/2) = 4 * Real.log 2`; the second derivative
`χ'' (1/2) = 28 * riemannZeta 3`, which is the diffusion coefficient of 2.6; and that `χ γ → ∞` as
`γ → 0⁺` and `γ → 1⁻`, which is the unboundedness of the generator recorded in 1.3.

### 2.4 The intercept and power growth

The BFKL semigroup on the weighted space of 1.5 has growth bound `ω_P = ᾱ_s χ (1/2) = 4 ᾱ_s log 2`,
the *hard Pomeron intercept*. For an initial amplitude with non-zero overlap against the `γ = 1/2`
eigenfunction, the solution grows like `exp (ω_P Y)` up to a power of `Y`.

To prove: the growth bound of the semigroup equals the supremum of `ᾱ_s χ γ` over the contour, using
`TauCeti.Analysis.Semigroups.GrowthBound`; the lower bound on the growth of a solution with non-zero
overlap; and the corresponding statement for the gluon density of
`EpsilonEridani.Particles.Parton.PDF.Basic`, that its small-`x` behaviour inherits the power
`x^(-ω_P)`.

### 2.5 The unitarity-violation theorem

This is the theorem the rest of the roadmap exists to repair. Let `N₀` be admissible, non-zero, and
with non-zero overlap against the leading eigenfunction. Then there is a rapidity `Y*` such that the
BFKL solution started from `N₀` satisfies `1 < sSup {N Y x y}` for every `Y > Y*`, and `Y*` is
bounded above by `(1 / ω_P) * Real.log (1 / c)` where `c` is the overlap. In particular
`Admissible` is *not* invariant under the BFKL semigroup.

To prove: the statement above; the sharper version giving the dipole size at which the bound is
first violated; and the corollary, from Layer 1.4, that no linear semigroup with positive growth
bound can leave `Admissible` invariant. The last is the structural reason a non-linear term is
necessary and not merely convenient.

### 2.6 Diffusion in the logarithm of dipole size

Expanding `χ` to second order about `γ = 1/2` turns the BFKL solution into a Gaussian in
`log (r² Q₀²)` of width growing like `sqrt (ᾱ_s χ'' (1/2) Y)`. This *diffusion approximation* is
stated as a quantitative estimate with an explicit error, not as a substitution.

To prove: the saddle-point estimate for a contour integral with a nondegenerate interior maximum of
the exponent, in the one-dimensional real form needed (this is the missing steepest-descent
machinery, built here); the resulting Gaussian form of the solution with an error bounded by the
third derivative of `χ` on a neighbourhood of the saddle; and the consequence that the solution
spreads into the infrared, so that the perturbative description of a fixed dipole size fails at
large enough rapidity even before saturation sets in.

### 2.7 Next-to-leading order: the eigenvalue as data, and stability

The next-to-leading-order kernel is not derived here. Its eigenvalue function `χ₁` is carried as
*data*: an `NLOKernelData` structure holding a function on the fundamental strip together with the
properties actually used — symmetry about `γ = 1/2`, the orders of its poles at `γ = 0` and `γ = 1`,
and its value at `γ = 1/2`. Nothing in this roadmap claims to compute `χ₁` from Feynman diagrams,
and no other roadmap in the collection claims it either; it is input.

With that data, three statements are provable and are the content of this subsection. First, the
combination `χ + ᾱ_s χ₁` has a *negative* value at `γ = 1/2` for physical couplings, so the
next-to-leading-order intercept is far below the leading-order one. Second, the triple and double
poles of `χ₁` at the endpoints of the strip make the saddle point of 2.6 leave the real axis above a
computable coupling, after which the solution oscillates in `log r²` and changes sign — the
*collinear instability*, organised in the angular-momentum plane by the Bartels cut from
multi-Reggeon states. Third, a *stability requirement* on any resummed kernel is stated: a kernel is
`IsCollinearlyStable` if its eigenvalue function is real on the strip, has a minimum in the interior,
and reproduces the collinear double-logarithmic poles of the DGLAP anomalous dimension to the order
considered. The theorem is that a collinearly stable kernel has a real saddle point and a positive,
monotone solution, so the pathology of the second statement is absent.

To prove: the three statements above, each with `NLOKernelData` as an explicit hypothesis; and the
consistency check that the leading-order `χ` is itself collinearly stable.

### 2.8 The double-logarithmic region shared with collinear evolution

In the region where both the rapidity and the logarithm of the hard scale are large and their
product is order one, the BFKL and DGLAP evolutions describe the same physics and must agree. The
statement is that the double-logarithmic limit of the BFKL solution and the small-`x`,
large-`log Q²` limit of the gluon DGLAP solution of `CollinearEvolution` coincide, both being
governed by `ᾱ_s χ γ → ᾱ_s / γ` as `γ → 0`.

To prove: the expansion `χ γ = 1 / γ + O(1)` as `γ → 0⁺`; that the `γ`-transform with the `1/γ`
eigenvalue reproduces the double-logarithmic series; and the agreement theorem, stated as equality
of the two asymptotic series to the order at which both are defined. What this roadmap supplies to
`CollinearEvolution` is the first statement; what it takes is the small-`x` limit of the gluon-gluon
splitting function and the resummed anomalous dimension, which are that area's to define.

### Examples

- `N ≡ 0`: fixed point of BFKL, and the degenerate case excluded by the overlap hypothesis of 2.5.
- The single-eigenfunction initial condition `N₀ = (r²)^(γ₀ - 1)` for `γ₀` on the contour: the
  solution is `exp (ᾱ_s χ γ₀ Y)` times the initial condition, and 2.5 becomes an explicit
  computation of `Y*`.
- The Golec-Biernat-Wüsthoff initial condition: numerically the overlap of 2.4 is non-zero, so 2.5
  applies, and the rapidity at which unitarity fails for `ᾱ_s = 0.2` is a specific number the
  roadmap asks for as a worked example.
- `N_c = 3`, `α_s = 0.2`: `ω_P ≈ 0.53`, to be produced as a numeric evaluation against the
  constructed digamma.

### Dependencies

Layers 0 and 1. `TauCeti.Analysis.SpecialFunctions.Gamma`, `.Beta`;
`TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic`, `TauCeti.Analysis.Contour.PerWindow.CPV`;
`TauCeti.Analysis.Fredholm.Criteria`, `.CompactPerturbation`;
`TauCeti.Analysis.Semigroups.GrowthBound`, `.Resolvent.Basic`,
`.BoundedGenerator.Perturbation`; `TauCeti.Analysis.Bochner.Fourier.Convention`;
`Mathlib.Analysis.SpecialFunctions.Complex.Log`;
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`;
`EpsilonEridani.Particles.Parton.PDF.Basic`. From `CollinearEvolution`: the small-`x` limit of the
gluon splitting function and the DGLAP gluon solution, used only in 2.8.

---

## Layer 3: the Balitsky-Kovchegov equation

References: Balitsky, *Nucl. Phys.* **B463** (1996) 99; Kovchegov, *Phys. Rev.* **D60** (1999)
034008 and **D61** (2000) 074018; Braun, *Eur. Phys. J.* **C16** (2000) 337; Levin and Tuchin,
*Nucl. Phys.* **B573** (2000) 833.

### 3.1 The quadratic term and the mean-field closure

The Balitsky-Kovchegov right-hand side is the BFKL operator of 2.1 minus the quadratic term

`(B (N, N)) x y = (ᾱ_s / (2 π)) ∫ d²z (‖x - y‖² / (‖x - z‖² ‖z - y‖²)) N x z * N z y`.

The equation is exact only under the *mean-field closure*: the hypothesis `IsMeanField`, that the
average of the product of two dipole operators equals the product of their averages. It is a
hypothesis, it holds in the large-`N_c` limit for a large nucleus, and Layer 5.4 states exactly which
term of the Balitsky hierarchy it truncates.

To prove: `B` is well defined on `Admissible` and the integral converges, with the explicit bound
`‖B (M, N)‖ ≤ C ‖M‖ ‖N‖` on the weighted space of 1.5, which discharges the third declared gap of
`EpsilonEridani.QFT.Factorization.Evolution.SmallX`; `B` is symmetric and positivity-preserving; and
the sign of the quadratic term is negative in the equation, which is the single fact from which
every boundedness result below follows.

### 3.2 Global well-posedness and invariance of the admissible set

**The central theorem of the roadmap.** For an admissible initial condition, the Balitsky-Kovchegov
Cauchy problem has a unique solution for all rapidity `Y ≥ Y₀`, and the solution is admissible at
every rapidity. In particular `0 ≤ N Y x y ≤ 1` for all `Y`, so unitarity is preserved by the
evolution.

The proof splits into an a priori bound and a continuation argument, in exactly the shape the
existing module says is missing. The a priori bound is that the right-hand side points inwards on
the boundary of `Admissible`: where `N x y = 1`, the emission terms and the quadratic term combine
so that the bracket `N x z + N z y - N x y - N x z N z y = - (1 - N x z)(1 - N z y)` is
non-positive, so the derivative of `N x y` is non-positive there; and where `N x y = 0` with `N ≥ 0`
elsewhere, the same bracket is non-negative. That identity — the factorisation of the BK bracket as
`- (1 - N x z)(1 - N z y)` — is the whole content of the theorem and is the lemma to prove first.
The continuation argument then upgrades the local existence of
`EpsilonEridani.QFT.Factorization.Evolution.SmallX` to global existence, because the a priori bound
confines the solution to a ball on which the right-hand side is Lipschitz with a fixed constant.

To prove: the factorisation identity for the BK bracket; inward-pointing on both faces of the
admissible set; invariance of `Admissible`, via
`TauCeti.Analysis.Semigroups.Generator.Invariance` on the weighted space and directly on the
unweighted space; global existence by continuation; uniqueness, imported from the existing module;
and the statement that the resulting family of solution maps is a strongly continuous semigroup of
non-linear maps on `Admissible`.

### 3.3 The comparison principle

If two admissible initial conditions satisfy `N₀ ≤ M₀` pointwise, then the corresponding solutions
satisfy `N Y ≤ M Y` pointwise for all `Y ≥ Y₀`. This is the order-preservation that TauCeti does not
supply and that this subsection proves directly: the difference `D = M - N` satisfies a linear
equation with a kernel that is non-negative wherever `D` is, and Grönwall's inequality applied to the
negative part of `D` gives the result.

To prove: the comparison principle; the corollary that the black disc `N ≡ 1` off the diagonal
dominates every solution, which is a second route to the unitarity bound; and the corollary that the
BFKL solution dominates the BK solution with the same initial data, which quantifies the statement
that saturation slows the growth.

### 3.4 Monotonicity in rapidity and the approach to the black disc

For an initial condition that is a subsolution — `K N₀ - B (N₀, N₀) ≥ 0` pointwise — the solution is
non-decreasing in rapidity at every pair of endpoints. Combined with the unitarity bound, the
solution then converges pointwise as `Y → ∞`, and the limit is a fixed point of the right-hand side.

To prove: monotonicity from the comparison principle applied to the rapidity-shifted solution;
pointwise convergence from monotone convergence and boundedness; that the limit is a fixed point;
and the characterisation of the fixed points at fixed impact parameter, of which the black disc is
one. Whether the limit is the black disc for every admissible initial condition is **not** claimed:
the large-impact-parameter behaviour is governed by the infrared, which the equation does not
control, and this is recorded as a named open question rather than as a milestone.

### 3.5 The dilute limit

Where the amplitude is small the quadratic term is negligible and the solution tracks the BFKL one.
This is already quantified abstractly in the existing module; this subsection instantiates it: the
difference between the BK and BFKL solutions with the same initial data is bounded by a constant
times the square of the supremum of the BFKL solution over the rapidity interval, and the constant
is explicit.

To prove: the instantiation, using the existing module's `norm_bkRhs_sub_bfkl` on the weighted space
of 1.5, and the resulting rapidity interval on which BFKL is accurate to a given tolerance.

### Examples

- Fixed dipole size, impact-parameter independent, kernel replaced by its value at the saturation
  scale: BK collapses to the logistic ODE `N' = ω N (1 - N)`, whose solution is explicit and whose
  invariance of the unit interval is elementary. This is the model in which every statement of this
  layer should be checked first, and it is a genuine instance because the logistic equation is the
  zero-dimensional reduction, not an analogy.
- The Golec-Biernat-Wüsthoff initial condition under BK: admissible, a subsolution for a stated
  range of the saturation scale, hence monotone in rapidity by 3.4.
- Two initial conditions differing by a constant multiple: 3.3 gives an ordering of the solutions
  that persists for all rapidity, which fails for the logistic-like equation without the sign of the
  quadratic term.

### Dependencies

Layers 0, 1 and 2. `EpsilonEridani.QFT.Factorization.Evolution.SmallX` for uniqueness, local
existence, and the dilute-limit estimate; `TauCeti.Analysis.Semigroups.Generator.Invariance`,
`.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness`, `.Dissipative.Basic`;
`TauCeti.Analysis.ODE.GlobalSolution`, `.InitialCondition`; `Mathlib.Analysis.ODE.Gronwall`,
`Mathlib.Analysis.ODE.PicardLindelof`.

---

## Layer 4: the saturation scale, travelling waves, and geometric scaling

References: Gribov, Levin and Ryskin, *Phys. Rept.* **100** (1983) 1; Mueller and Triantafyllopoulos,
*Nucl. Phys.* **B640** (2002) 331; Munier and Peschanski, *Phys. Rev. Lett.* **91** (2003) 232001 and
*Phys. Rev.* **D69** (2004) 034008; Iancu, Itakura and McLerran, *Nucl. Phys.* **A708** (2002) 327;
Stasto, Golec-Biernat and Kwiecinski, *Phys. Rev. Lett.* **86** (2001) 596; Bramson, *Mem. Amer.
Math. Soc.* **44** (1983) no. 285; van Saarloos, *Phys. Rept.* **386** (2003) 29.

### 4.1 The saturation scale as a level set

Fix `κ ∈ Set.Ioo 0 1`. At impact parameter `b` and rapidity `Y`, the saturation scale `Q_s Y b` is
defined by `N Y (dipole at b of size 1 / Q_s) = κ`. Well-definedness requires the amplitude to be
strictly monotone in dipole size at fixed impact parameter, which is proved for solutions from
monotone admissible initial data.

To prove: strict monotonicity of the solution in dipole size, propagated from the initial condition
by the comparison principle of 3.3; existence and uniqueness of the level set, hence `Q_s` is a
well-defined function of `Y`, `b` and `κ`; continuity of `Q_s` in all three; and that the
`κ`-dependence is a shift in `log Q_s²` that is bounded uniformly in `Y`, which is the precise
statement of Convention 9 and the reason later results are `κ`-independent.

### 4.2 The diffusive reduction and the FKPP form

In the impact-parameter-independent, fixed-coupling case, and after the diffusive expansion of 2.6,
BK reduces to a one-dimensional non-linear diffusion equation in the variable `ρ = log (r² Q₀²)`:
`∂_Y u = ᾱ_s (χ(1/2) + (1/2) χ''(1/2) ∂_ρ² + ...) u - ᾱ_s u²` up to the stated error, which after
rescaling is the Fisher-Kolmogorov-Petrovsky-Piskunov equation. This subsection states the reduction
as an approximation with a controlled error, not as an identity, and the rest of the layer analyses
the reduced equation.

To prove: the reduction with its error term; that the reduced equation has the FKPP structure —
diffusion, linear growth, quadratic saturation, two fixed points of which `u = 0` is unstable and
`u = 1` is stable; and that the reduced equation preserves the unit interval, by the argument of 3.2
specialised.

### 4.3 Travelling waves and velocity selection

A *travelling wave* of speed `v` is a solution of the form `u(Y, ρ) = φ(ρ - v Y)` with `φ`
decreasing from one to zero. This is the machinery TauCeti does not have, and the subsection builds
it: the travelling-wave profile is a heteroclinic orbit of a planar ODE, and its existence for every
`v ≥ v_c` and non-existence below `v_c` is a phase-plane argument, with `v_c` the *critical* or
*selected* speed determined by the linearisation at the leading edge.

For the BK equation the linearised problem is the BFKL one, and the selected speed is
`v_c = ᾱ_s χ(γ_c) / γ_c` where the *critical anomalous dimension* `γ_c ∈ (0,1)` is the unique
solution of `γ_c * deriv χ γ_c = χ γ_c`. This tangency condition is the velocity-selection criterion
and is where the BFKL characteristic function of 2.3 re-enters.

To prove: existence of `γ_c`, uniqueness, and `γ_c ∈ Set.Ioo 0 1`, from the strict convexity of `χ`
on the unit interval proved in 2.3; existence of a monotone travelling-wave profile for every
`v ≥ v_c`, by a fixed-point argument using `Mathlib.Topology.MetricSpace.Contracting`;
non-existence of a non-negative monotone profile for `v < v_c`; and *velocity selection* — that for
initial data decaying faster than `exp (- γ_c ρ)` the solution converges in shape to the critical
front. The last is the hard theorem of the layer; it is proved for the reduced equation of 4.2
following the Bramson argument, and it is *not* claimed for the full BK equation.

### 4.4 The saturation exponent

For the reduced equation, `Real.log (Q_s Y ^ 2) = λ * Y - (3 / (2 * γ_c)) * Real.log Y + O(1)` with
`λ = v_c = ᾱ_s χ(γ_c) / γ_c`, and `λ` is independent of the level parameter `κ`. The logarithmic
correction is the universal Bramson correction of the front position, and its coefficient is
determined by `γ_c` alone.

To prove: the leading term, from velocity selection; `κ`-independence of `λ`, from 4.1; the
logarithmic correction, for the reduced equation; and the numerical evaluation `γ_c ≈ 0.6275`,
`λ ≈ 4.88 ᾱ_s`, as an `Examples` computation against the constructed digamma. For the full BK
equation only the leading term is claimed, with the logarithmic correction recorded as a conjecture
attributed to Mueller and Triantafyllopoulos.

### 4.5 Geometric scaling

*Geometric scaling* is the statement that in the scaling window the amplitude depends on dipole size
and rapidity only through the product `r Q_s(Y)`: `N Y r = Φ (r² Q_s(Y)²)` for a rapidity-independent
scaling function `Φ`. For the reduced equation it is a corollary of velocity selection, because a
front converging in shape is by definition a function of the co-moving coordinate alone.

To prove: geometric scaling in the saturation region `r Q_s ≳ 1`, as a corollary of 4.3, with the
error given by the rate of convergence to the front; the *extended scaling window*
`1 ≲ r Q_s ≲ exp(...)` above the saturation scale in which scaling persists because the diffusion has
not yet had time to destroy it, with the boundary of the window stated in terms of `χ''(1/2)` and
`Y`; and the monotonicity and boundedness of `Φ`, using
`TauCeti.Analysis.CompletelyMonotone.Basic` for the structure of the scaling function on the
saturation side.

Whether the full BK equation — with impact-parameter dependence and the exact non-local kernel, not
the diffusive reduction — exhibits geometric scaling is an **open question**. The roadmap states it
as one. What it proves for the full equation is the weaker statement that the scaling violation is
bounded by the difference between the exact and reduced kernels, quantified by 4.2.

### Examples

- The logistic reduction of 3.5 with diffusion added by hand: the standard FKPP equation, in which
  `γ_c` and `v_c` reduce to the textbook values `γ_c = 1`, `v_c = 2`, and every statement of 4.3 is
  the classical one.
- The Golec-Biernat-Wüsthoff amplitude: geometric scaling holds exactly by construction, with
  `Φ u = 1 - exp (- u / 4)`, so it is the example that separates "scaling holds" from "the scaling
  function is the one BK selects".
- `ᾱ_s = 0.2`: `λ ≈ 0.98`, and the rapidity at which `Q_s` reaches `2 GeV` from a `1 GeV` initial
  condition, as a worked number.

### Dependencies

Layers 2 and 3. `Mathlib.Topology.MetricSpace.Contracting`, `Mathlib.Analysis.ODE.Gronwall`;
`TauCeti.Analysis.ODE.GlobalSolution`, `.Linear`; `TauCeti.Analysis.CompletelyMonotone.Basic`;
`TauCeti.Analysis.SpecialFunctions.Gamma`. The travelling-wave theory is built in this layer.

---

## Layer 5: JIMWLK, the Balitsky hierarchy, and the McLerran-Venugopalan initial condition

References: McLerran and Venugopalan, *Phys. Rev.* **D49** (1994) 2233 and 3352;
Jalilian-Marian, Kovner, Leonidov and Weigert, *Nucl. Phys.* **B504** (1997) 415 and *Phys. Rev.*
**D59** (1998) 014014; Iancu, Leonidov and McLerran, *Nucl. Phys.* **A692** (2001) 583; Ferreiro,
Iancu, Leonidov and McLerran, *Nucl. Phys.* **A703** (2002) 489; Weigert, *Prog. Part. Nucl. Phys.*
**55** (2005) 461; Gelis, Iancu, Jalilian-Marian and Venugopalan, *Ann. Rev. Nucl. Part. Sci.* **60**
(2010) 463.

### 5.1 Configurations and observables

The state of the target is a probability measure on the space of Wilson-line configurations of Layer
0.2. Since no measure theory on that space is available upstream (see the absences above), the
roadmap works with the dual object: `Observable N_c` is the Banach space of bounded continuous real
functions of a configuration restricted to a fixed finite set of transverse positions, with the
supremum norm, and an *ensemble* is a positive normalised continuous linear functional on it. The
dipole and quadrupole of Layer 0 are observables in this sense, and the dipole amplitude of Layer 0.3
is the value of an ensemble on one of them.

To prove: the dipole and quadrupole are observables; an ensemble determines admissible dipole
amplitudes in the sense of Layer 1.1; the Haar measure on `Matrix.unitaryGroup (Fin N_c) ℂ`, via
`TauCeti.RepresentationTheory.Compact.Haar`, defines the *colour-averaged* ensemble, on which every
dipole amplitude equals `1 - 1 / N_c²`; and restriction to a finite set of positions is compatible
with refinement, so the definitions are consistent as the set grows.

### 5.2 The JIMWLK generator

JIMWLK evolution is the strongly continuous semigroup on `Observable N_c` whose generator is the
second-order differential operator built from the left- and right-invariant vector fields on the
unitary group at each transverse position, contracted with the JIMWLK kernel

`K x y z = (‖x - z‖ ⬝ ‖y - z‖ terms)` — precisely, the kernel
`(x - z) ⬝ (y - z) / (‖x - z‖² ‖y - z‖²)` — and with the Wilson line in the adjoint representation
at the emission point.

This layer poses the equation in the dual, observable form rather than as a functional
Fokker-Planck equation for a weight functional, for the reason stated in the absences: there is no
upstream measure theory on the configuration space. The dual form needs only invariant vector fields
on a finite-dimensional compact group and the semigroup theory of TauCeti.

To prove: the invariant vector fields on the unitary group and their commutation relations, from
`EpsilonEridani.Mathematics.LieAlgebra.SpecialUnitary` and
`EpsilonEridani.QFT.QCD.SUNStructureConstants`; that the JIMWLK generator annihilates constants and
satisfies the positive-maximum principle on a lattice regularisation with finitely many transverse
positions; hence, by `TauCeti.Analysis.Semigroups.Generation.HilleYosida.Generation`, that it
generates a positivity-preserving contraction semigroup on the lattice-regularised observable space;
and that the regularised semigroup preserves the set of ensembles.

**Open question, stated as one.** The continuum limit of the lattice-regularised JIMWLK semigroup —
whether the semigroups converge strongly as the transverse lattice is refined, and whether the limit
is independent of the refinement — is not settled here. The roadmap states it, and states what would
settle it (a uniform-in-lattice-spacing resolvent estimate, in the shape of
`TauCeti.Analysis.Semigroups.Generation.LimitSemigroup`). Everything downstream in Layers 5.3-5.6 is
proved at fixed regularisation and is therefore unaffected.

### 5.3 The Balitsky hierarchy

Applying the JIMWLK generator to the dipole observable produces an equation whose right-hand side
involves the quadrupole; applying it to the quadrupole produces one involving the six-point
correlator; and so on. The resulting infinite system is the *Balitsky hierarchy*. It is not a closed
system, and the roadmap says so rather than truncating silently.

To prove: the first equation of the hierarchy, `∂_Y ⟨dipole⟩ = BFKL term - quadrupole term`, as an
identity in the regularised setting; the second equation; that the `n`-th equation involves the
`(n+1)`-st correlator, so no finite truncation is exact; and that the hierarchy is consistent with
the unitarity bound at every level, each correlator being bounded by one in modulus.

### 5.4 The mean-field closure and the recovery of BK

Under the hypothesis `IsMeanField` of Layer 3.1 — that the averaged quadrupole factorises into a
product of averaged dipoles — the first equation of the hierarchy closes and becomes exactly the
Balitsky-Kovchegov equation of Layer 3. The hypothesis is exact in the limit `N_c → ∞` for a target
whose correlations are Gaussian in the sense of Layer 0.6, and the subsection states the error at
finite `N_c` as an explicit `1 / N_c²` bound under that Gaussianity.

To prove: that `IsMeanField` applied to the first hierarchy equation yields the BK right-hand side of
3.1, term by term; that the Gaussian ensemble of 5.6 satisfies `IsMeanField` up to `O(1 / N_c²)`,
with the constant; and, as a negative result, that `IsMeanField` is not preserved by the evolution —
an ensemble satisfying it at one rapidity need not satisfy it at the next, so BK is an approximation
at every rapidity and not merely an approximate initial condition.

### 5.5 The Langevin form and the martingale property

At fixed regularisation the JIMWLK semigroup is the transition semigroup of a Markov process on a
finite product of copies of the unitary group, driven by Gaussian noise. This is the *Langevin form*,
and it is what makes the equation numerically tractable in practice.

To prove: the existence of the Markov process with the given transition semigroup, via
`TauCeti.Probability.Process.MarkovChain` on the time-discretised chain; that the dipole observable
evaluated along the process is a bounded submartingale with respect to the rapidity filtration, and
hence converges almost surely by `TauCeti.Probability.Martingale.Convergence`; and that the
expectation of the process reproduces the semigroup, which is the consistency of the two
formulations.

### 5.6 The McLerran-Venugopalan initial condition

The McLerran-Venugopalan ensemble is the Gaussian ensemble of colour sources with a local covariance
proportional to the colour-charge density `μ²`, and the Wilson lines are the path-ordered
exponentials of the field those sources generate. Its dipole amplitude is computable in closed form:
`S(r) = exp (- (r² Q_{s0}²/ 4) * Real.log (1 / (r² Λ²) + Real.exp 1))` in the standard logarithmic
approximation, with `Q_{s0}² ∝ α_s² N_c μ²`.

To prove: the ensemble is well defined as a positive normalised functional on `Observable N_c`, using
the Gaussian measure theory of `TauCeti.Analysis.Bochner.Gaussian.Measure` and the Wick moments of
`TauCeti.Probability.Distributions.Gaussian.Moments`; the closed form of the dipole amplitude, with
the logarithm arising from the two-dimensional Coulomb propagator and the stated infrared
regularisation; that the resulting amplitude is admissible in the sense of Layer 1.1 — this is the
non-trivial verification that supplies Layer 3.2 with a concrete initial condition; colour
transparency with the quadratic-times-logarithm behaviour of Layer 0.4; and the mass-number scaling
`μ² ∝ A^(1/3)` for a large nucleus, which Layer 6.1 consumes.

### Examples

- `N_c = 1`: the unitary group is the circle, the JIMWLK generator is a Laplacian on a torus, and
  every statement of 5.2 is a computation with Fourier series. This is the example in which the
  positive-maximum principle should be checked first.
- The colour-averaged ensemble of 5.1: a fixed point of the JIMWLK semigroup, and the ensemble at
  which every dipole amplitude equals `1 - 1/N_c²` rather than `1`, so the black disc is approached
  but not reached at finite `N_c`.
- The McLerran-Venugopalan ensemble at `A = 197`: a numeric evaluation of `Q_{s0}` and of the dipole
  size at which the amplitude reaches `1/2`.

### Dependencies

Layers 0 and 1, and Layer 3.1 for `IsMeanField`. `TauCeti.RepresentationTheory.Compact.Haar`,
`TauCeti.Analysis.Matrix.UnitaryGroup`, `TauCeti.Analysis.Matrix.Spectrum`;
`TauCeti.Analysis.Semigroups.Generation.HilleYosida.Generation`, `.Generation.LumerPhillips`,
`.Dissipative.Basic`, `.Generator.Invariance`; `TauCeti.Analysis.Bochner.Gaussian.Basic`,
`.Measure`; `TauCeti.Probability.Distributions.Gaussian.Multivariate`, `.Moments`,
`.QuadraticForm`; `TauCeti.Probability.Process.MarkovChain`,
`TauCeti.Probability.Martingale.Convergence`;
`EpsilonEridani.Mathematics.LieAlgebra.SpecialUnitary`,
`EpsilonEridani.QFT.QCD.SUNStructureConstants`, `.SUNGenerators`;
`Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral`.

---

## Layer 6: observables

References: Kowalski, Motyka and Watt, *Phys. Rev.* **D74** (2006) 074016; Marquet, Xiao and Yuan,
*Phys. Lett.* **B682** (2009) 207; Dominguez, Marquet, Xiao and Yuan, *Phys. Rev.* **D83** (2011)
105005; Dumitru, Hayashigaki and Jalilian-Marian, *Nucl. Phys.* **A765** (2006) 464; Albacete and
Marquet, *Prog. Part. Nucl. Phys.* **76** (2014) 1; Accardi et al., *Eur. Phys. J.* **A52** (2016)
268; Abdul Khalek et al., *Nucl. Phys.* **A1026** (2022) 122447, volume II section 7.3.1.

### 6.1 Mass-number dependence of the saturation scale

From the McLerran-Venugopalan scaling `μ² ∝ A^(1/3)` of Layer 5.6, the initial saturation scale of a
nucleus exceeds that of a proton by `A^(1/3)`: `Q_{s,A}²(Y) = A^(1/3) Q_{s,p}²(Y)` at the initial
rapidity, and the relation is preserved by the evolution of Layer 4.4 up to the logarithmic
correction. Equivalently, a nucleus reaches a given saturation scale at a rapidity smaller by
`ΔY = Real.log (A ^ (1/3 : ℝ)) / λ = Real.log A / (3 * λ)`, with `λ` the saturation exponent of 4.4.
This is the computed factor that makes nuclear targets the setting for this physics.

To prove: the `A^(1/3)` scaling of `Q_{s0}²` from 5.6; the rapidity shift formula, with `λ` from
4.4; that the shift is `κ`-independent; and the numeric value for `A = 197` and `ᾱ_s = 0.2`. The
comparison against the nuclear gluon density is stated by citing `NuclearPartonDistributions` for the
density; this roadmap does not define nuclear parton distributions and does not restate their
evolution.

### 6.2 Inclusive structure functions in the dipole formulation

Using the dipole factorisation of Layer 0.7 and the solutions of Layer 3, the inclusive structure
functions `F₂` and `F_L` are integrals of the photon wave functions against the dipole amplitude.
The subsection states the formulae, proves their elementary properties, and poses the inverse
problem.

To prove: positivity of `F₂` and `F_L` and the Callan-Gross-violating inequality `0 ≤ F_L ≤ F₂`
following from positivity of both squared wave functions and of the dipole cross section;
geometric scaling of `F₂` as a function of `Q² / Q_s²` alone in the scaling window, inherited from
4.5 — this is the observable statement of geometric scaling and the one compared with data; the
large-`Q²` limit recovering the collinear result of `InclusiveStructureFunctions`; and that
recovering `N` from `F₂` at fixed `x` is a Fredholm problem of the first kind with a smooth kernel,
hence ill-posed, with the non-uniqueness characterised as the kernel of the integral operator via
`TauCeti.Analysis.Fredholm.Criteria` and `.CompactPerturbation`. The last is stated here and not
solved; the inference machinery is `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`'s
business.

### 6.3 Diffractive structure functions

The diffractive cross section in the dipole formulation is quadratic in the dipole amplitude, where
the inclusive one is linear, which is why diffraction is the more sensitive probe of saturation. The
subsection states the diffractive dipole formula and the ratio of diffractive to inclusive cross
sections in the black-disc limit.

To prove: the diffractive formula as a definition in terms of the same wave functions and the square
of the amplitude; that the ratio of diffractive to total cross section tends to `1/2` in the
black-disc limit at fixed impact parameter; and that the ratio is monotone in the saturation scale.
What this roadmap supplies to `Diffraction` is the amplitude and these three statements; the
definition of the diffractive final state, the rapidity gap, and diffractive parton distributions
are `Diffraction`'s, and are not restated.

### 6.4 Two-particle correlations and the two gluon distributions

At small `x` there are two inequivalent unintegrated gluon distributions: the
*Weizsäcker-Williams* distribution, the correlator of two adjoint Wilson lines, which counts gluons;
and the *dipole* distribution, the Fourier transform of the dipole amplitude of Layer 0.3, which
appears in single-inclusive production. Different observables measure different ones, and the
subsection states which.

To prove: the two distributions are defined by different Wilson-line correlators and are not equal
at finite `N_c`, with a computed counterexample in the McLerran-Venugopalan ensemble; the dipole
distribution is the transverse Fourier transform of the amplitude, and hence inherits the evolution
of Layer 3; in the back-to-back limit, di-hadron production in deep-inelastic scattering is governed
by the Weizsäcker-Williams distribution and single-inclusive production in proton-nucleus collisions
by the dipole one; and the away-side peak of the di-hadron correlation is suppressed when the
transverse momenta are of order the saturation scale, with the suppression quantified by the width
of the distribution. The operator definitions of the two distributions as transverse-momentum-
dependent objects, and their place in the Wigner-distribution hierarchy, are cited from
`TransverseMomentumDistributions` and `WignerDistributions`; this roadmap states only the
Wilson-line correlator each one is, and the evolution it satisfies.

### 6.5 Inclusive production in the hybrid formalism

For a dilute projectile on a dense target, single-inclusive particle production factorises into a
collinear parton density of the projectile, the dipole distribution of the target, and a
fragmentation function. This *hybrid factorisation* is a hypothesis, named `IsHybridFactorised`, and
carried as an explicit argument to every statement that uses it.

To prove: the production formula under the hypothesis; positivity of the resulting cross section;
the nuclear modification factor as a ratio, and that it is below one at transverse momenta of order
the saturation scale, which follows from the width of the dipole distribution; and the statement of
the region of validity in terms of the projectile and target rapidities. The collinear projectile
density is cited from `CollinearEvolution` and the fragmentation function from `Hadronization`;
neither is defined here.

### Examples

- `A = 197`, `ᾱ_s = 0.2`: the rapidity shift of 6.1, as a number.
- The Golec-Biernat-Wüsthoff amplitude in 6.2: `F₂` and `F_L` in closed form up to the `z` integral,
  and the explicit demonstration of geometric scaling.
- The black-disc limit in 6.3: the diffractive-to-total ratio equals `1/2` exactly.
- The McLerran-Venugopalan ensemble in 6.4: the Weizsäcker-Williams and dipole distributions
  computed and shown to differ at finite `N_c` while agreeing at leading order in `1 / N_c²`.

### Dependencies

Layers 0, 3, 4 and 5. `EpsilonEridani.QFT.Scattering.DIS.CrossSection`,
`.Tensors.Longitudinal`, `.Inference.Identifiability`;
`TauCeti.Analysis.Fredholm.Criteria`, `.CompactPerturbation`, `.FiniteRank`;
`TauCeti.Analysis.Bochner.Fourier.Convention`. From other roadmaps: the nuclear gluon density from
`NuclearPartonDistributions` (6.1); the structure-function definitions from
`InclusiveStructureFunctions` (6.2); the diffractive final state from `Diffraction` (6.3); the
operator definitions of the two gluon distributions from `TransverseMomentumDistributions` and
`WignerDistributions` (6.4); the collinear projectile density from `CollinearEvolution` and the
fragmentation function from `Hadronization` (6.5).

---

## Dependency graph

```
Layer 0  transverse geometry, Wilson lines, dipole amplitude, photon wave functions
   |                                    \
   v                                     \
Layer 1  dipole space, semigroup,         \
         generator, admissible set         \
   |          \                             \
   v           \                             v
Layer 2  BFKL    \                        Layer 5  JIMWLK, Balitsky hierarchy,
         chi, intercept,                          MV initial condition
         unitarity violation                        |
   |                                                |
   v                                                |
Layer 3  BK: closure, global well-posedness  <------+  (5.4 supplies the closure;
         invariance of [0,1], comparison                5.6 supplies the initial data)
   |
   v
Layer 4  saturation scale, travelling waves,
         geometric scaling
   |
   v
Layer 6  observables
```

Layers 0 and 1 are the foundation and nothing else may be attempted first. Layer 2 and Layer 5 are
independent of each other and may be developed in parallel; both are needed for Layer 3, Layer 2 for
the linear part and Layer 5 for the closure and initial condition. Layer 4 needs Layer 3 complete.
Layer 6 needs Layers 3, 4 and 5.

Cross-roadmap edges, all of them incoming except where stated: `CollinearEvolution` into Layers 2.8
and 6.5; `NuclearPartonDistributions` into 6.1; `InclusiveStructureFunctions` into 6.2;
`TransverseMomentumDistributions` and `WignerDistributions` into 6.4; `Hadronization` into 6.5;
`Photoproduction` into 0.7 for the real-photon limit. Outgoing: the dipole amplitude of Layer 0.3 and
the diffractive statements of 6.3 go to `Diffraction`; the dipole gluon distribution of 6.4 goes to
`TransverseMomentumDistributions`; the saturation scale of Layer 4 goes to
`NuclearPartonDistributions` and `NuclearMedium` as the scale at which their descriptions must match.

## Acceptance examples

The roadmap is certified by the following statements, each of which is a specific formal target.

1. `S U x x = 1` and `|S U x y| ≤ 1` for every Wilson configuration `U`, from unitarity alone
   (Layer 0.3).
2. The averaged S-matrix kernel is positive semidefinite, and consequently every admissible dipole
   amplitude satisfies `N Y x y ∈ Set.Icc 0 1` (Layer 0.5).
3. The real-virtual cancellation: the BFKL integrand is integrable near `z = x` and `z = y` for a
   Hölder-continuous amplitude vanishing on the diagonal, although the three terms are separately
   divergent (Layer 2.1).
4. `χ` is strictly convex on the open unit interval with minimum `χ (1/2) = 4 * Real.log 2` and
   `χ'' (1/2) = 28 * riemannZeta 3` (Layer 2.3).
5. For an admissible non-zero initial condition with non-zero overlap against the leading
   eigenfunction, there is a finite rapidity beyond which the BFKL solution exceeds one somewhere;
   equivalently, `Admissible` is not invariant under the BFKL semigroup (Layer 2.5).
6. The BK bracket factorises on the upper face of the admissible set: if `N x y = 1` then
   `N x z + N z y - N x y - N x z * N z y = - (1 - N x z) * (1 - N z y)`, which is non-positive for
   an admissible `N` (Layer 3.2).
7. The Balitsky-Kovchegov Cauchy problem with admissible initial data has a unique global solution
   and `Admissible` is invariant under it, so `0 ≤ N Y x y ≤ 1` for all `Y ≥ Y₀` (Layer 3.2). This
   is the theorem that closes the fourth declared gap of
   `EpsilonEridani.QFT.Factorization.Evolution.SmallX`.
8. The comparison principle: `N₀ ≤ M₀` pointwise implies `N Y ≤ M Y` pointwise for all `Y ≥ Y₀`
   (Layer 3.3).
9. The critical anomalous dimension exists, is unique, and lies in the open unit interval:
   there is a unique `γ_c ∈ Set.Ioo 0 1` with `γ_c * deriv χ γ_c = χ γ_c` (Layer 4.3).
10. Velocity selection for the reduced equation: for initial data decaying faster than
    `exp (- γ_c ρ)`, the solution converges in shape to the critical travelling front, and hence
    `Real.log (Q_s Y ^ 2) / Y → ᾱ_s * χ γ_c / γ_c` (Layers 4.3 and 4.4).
11. Geometric scaling in the scaling window for the reduced equation, with the window boundary
    stated in terms of `χ'' (1/2)` and `Y`, and with `κ`-independence of the scaling function
    (Layer 4.5).
12. The lattice-regularised JIMWLK generator satisfies the positive-maximum principle and generates
    a positivity-preserving contraction semigroup on the observable space (Layer 5.2).
13. The first Balitsky hierarchy equation holds as an identity, and under `IsMeanField` it becomes
    exactly the BK equation of Layer 3.1 (Layers 5.3 and 5.4).
14. The McLerran-Venugopalan ensemble is a well-defined ensemble, its dipole amplitude has the
    stated closed form, and that amplitude is admissible (Layer 5.6).
15. `0 ≤ F_L ≤ F₂` in the dipole formulation, from positivity of the photon wave functions and of
    the dipole cross section (Layer 6.2).
16. The diffractive-to-total ratio equals `1/2` in the black-disc limit at fixed impact parameter
    (Layer 6.3).
17. The Weizsäcker-Williams and dipole gluon distributions differ at finite `N_c` in the
    McLerran-Venugopalan ensemble, with a computed difference (Layer 6.4).

Three statements are deliberately *not* in this list because the roadmap does not claim them:
generation of a strongly continuous BFKL semigroup on the unweighted dipole space (Layer 1.3), the
continuum limit of the JIMWLK semigroup (Layer 5.2), and geometric scaling for the full BK equation
rather than its diffusive reduction (Layer 4.5). Each is stated in its layer as an open question,
with what would settle it.

## References

- V. S. Fadin, E. A. Kuraev and L. N. Lipatov, "On the Pomeranchuk singularity in asymptotically
  free theories", *Phys. Lett.* **B60** (1975) 50.
- E. A. Kuraev, L. N. Lipatov and V. S. Fadin, "The Pomeranchuk singularity in non-Abelian gauge
  theories", *Sov. Phys. JETP* **45** (1977) 199.
- I. I. Balitsky and L. N. Lipatov, "The Pomeranchuk singularity in quantum chromodynamics",
  *Sov. J. Nucl. Phys.* **28** (1978) 822.
- J. Bartels, "High-energy behaviour in a non-Abelian gauge theory (II)", *Nucl. Phys.* **B175**
  (1980) 365.
- L. V. Gribov, E. M. Levin and M. G. Ryskin, "Semihard processes in QCD", *Phys. Rept.* **100**
  (1983) 1.
- L. N. Lipatov, "The bare Pomeron in quantum chromodynamics", *Sov. Phys. JETP* **63** (1986) 904.
- N. N. Nikolaev and B. G. Zakharov, "Colour transparency and scaling properties of nuclear shadowing
  in deep inelastic scattering", *Z. Phys.* **C49** (1991) 607.
- L. McLerran and R. Venugopalan, "Computing quark and gluon distribution functions for very large
  nuclei", *Phys. Rev.* **D49** (1994) 2233; "Gluon distribution functions for very large nuclei at
  small transverse momentum", *Phys. Rev.* **D49** (1994) 3352.
- A. H. Mueller, "Soft gluons in the infinite momentum wave function and the BFKL Pomeron",
  *Nucl. Phys.* **B415** (1994) 373.
- I. Balitsky, "Operator expansion for high-energy scattering", *Nucl. Phys.* **B463** (1996) 99,
  arXiv:hep-ph/9509348.
- J. Jalilian-Marian, A. Kovner, A. Leonidov and H. Weigert, "The BFKL equation from the Wilson
  renormalization group", *Nucl. Phys.* **B504** (1997) 415; "The Wilson renormalization group for
  low-x physics", *Phys. Rev.* **D59** (1998) 014014.
- V. S. Fadin and L. N. Lipatov, "BFKL Pomeron in the next-to-leading approximation",
  *Phys. Lett.* **B429** (1998) 127.
- G. P. Salam, "A resummation of large sub-leading corrections at small x", *JHEP* **9807** (1998)
  019.
- K. Golec-Biernat and M. Wüsthoff, "Saturation effects in deep inelastic scattering at low Q² and
  its implications on diffraction", *Phys. Rev.* **D59** (1998) 014017.
- M. Ciafaloni, D. Colferai and G. P. Salam, "Renormalization group improved small-x equation",
  *Phys. Rev.* **D60** (1999) 114036.
- Yu. V. Kovchegov, "Small-x F₂ structure function of a nucleus including multiple Pomeron
  exchanges", *Phys. Rev.* **D60** (1999) 034008; "Unitarization of the BFKL Pomeron on a nucleus",
  *Phys. Rev.* **D61** (2000) 074018.
- E. Levin and K. Tuchin, "Solution to the evolution equation for high parton density QCD",
  *Nucl. Phys.* **B573** (2000) 833.
- M. A. Braun, "Structure function of the nucleus in the perturbative QCD with N_c → ∞",
  *Eur. Phys. J.* **C16** (2000) 337.
- A. M. Stasto, K. Golec-Biernat and J. Kwiecinski, "Geometric scaling for the total γ*p cross
  section in the low-x region", *Phys. Rev. Lett.* **86** (2001) 596.
- E. Iancu, A. Leonidov and L. McLerran, "Nonlinear gluon evolution in the Color Glass Condensate",
  *Nucl. Phys.* **A692** (2001) 583.
- E. Ferreiro, E. Iancu, A. Leonidov and L. McLerran, "Nonlinear gluon evolution in the Color Glass
  Condensate II", *Nucl. Phys.* **A703** (2002) 489.
- A. H. Mueller and D. N. Triantafyllopoulos, "The energy dependence of the saturation momentum",
  *Nucl. Phys.* **B640** (2002) 331.
- E. Iancu, K. Itakura and L. McLerran, "Geometric scaling above the saturation scale",
  *Nucl. Phys.* **A708** (2002) 327.
- S. Munier and R. Peschanski, "Geometric scaling as traveling waves", *Phys. Rev. Lett.* **91**
  (2003) 232001; "Traveling wave fronts and the transition to saturation", *Phys. Rev.* **D69**
  (2004) 034008.
- W. van Saarloos, "Front propagation into unstable states", *Phys. Rept.* **386** (2003) 29.
- M. Bramson, "Convergence of solutions of the Kolmogorov equation to travelling waves",
  *Mem. Amer. Math. Soc.* **44** (1983) no. 285.
- H. Weigert, "Evolution at small x_bj: the Color Glass Condensate", *Prog. Part. Nucl. Phys.* **55**
  (2005) 461.
- A. Dumitru, A. Hayashigaki and J. Jalilian-Marian, "The color glass condensate and hadron
  production in the forward region", *Nucl. Phys.* **A765** (2006) 464.
- H. Kowalski, L. Motyka and G. Watt, "Exclusive diffractive processes at HERA within the dipole
  picture", *Phys. Rev.* **D74** (2006) 074016.
- C. Marquet, B.-W. Xiao and F. Yuan, "Semi-inclusive deep inelastic scattering at small x",
  *Phys. Lett.* **B682** (2009) 207.
- F. Gelis, E. Iancu, J. Jalilian-Marian and R. Venugopalan, "The Color Glass Condensate",
  *Ann. Rev. Nucl. Part. Sci.* **60** (2010) 463.
- F. Dominguez, C. Marquet, B.-W. Xiao and F. Yuan, "Universality of unintegrated gluon distributions
  at small x", *Phys. Rev.* **D83** (2011) 105005.
- Yu. V. Kovchegov and E. Levin, *Quantum Chromodynamics at High Energy*, Cambridge University Press
  (2012).
- J. L. Albacete and C. Marquet, "Gluon saturation and initial conditions for relativistic heavy ion
  collisions", *Prog. Part. Nucl. Phys.* **76** (2014) 1.
- A. Accardi et al., "Electron-Ion Collider: the next QCD frontier", *Eur. Phys. J.* **A52** (2016)
  268.
- R. Abdul Khalek et al., "Science requirements and detector concepts for the Electron-Ion Collider:
  EIC Yellow Report", *Nucl. Phys.* **A1026** (2022) 122447, arXiv:2103.05419; volume II section
  7.3.1.
- K.-J. Engel and R. Nagel, *One-Parameter Semigroups for Linear Evolution Equations*, Graduate Texts
  in Mathematics 194, Springer (2000).

# Roadmap: factorisation theorems to all orders in perturbation theory

A factorisation theorem states that a cross section or amplitude with a large momentum scale `Q`
equals a convolution of a short-distance coefficient function with matrix elements of definite
operators, up to a remainder suppressed by a power of a hadronic scale over `Q`. Every other
roadmap in the collection that predicts an observable uses a statement of this kind. This roadmap
is where those statements are proved, process by process, to all orders in perturbation theory.

The development runs in one direction. First the framework: what "to all orders" means, what kind
of object a coefficient function is, what a factorisation theorem asserts as a proposition, and the
one hypothesis about the hadron that nothing in the collection proves. Then inclusive
deep-inelastic scattering, by two routes — the operator product expansion and the diagrammatic
region analysis — and the theorem that they give the same coefficient functions and the same
densities. Then single-inclusive annihilation and collinear semi-inclusive scattering, where
fragmentation and fracture functions appear. Then transverse-momentum-dependent factorisation for
semi-inclusive scattering and back-to-back annihilation, where the soft factor and the rapidity
scale appear. Then the Drell–Yan process, the one case here in which the Glauber region is not
removed graph by graph and the cancellation needs the sum over final states. Then hard exclusive
processes. Then diffractive deep-inelastic scattering, twist-three observables and event shapes.
Finally the processes for which factorisation fails, with the failure exhibited, and a ledger that
assigns a status to every factorisation hypothesis carried by another roadmap.

The proofs are not built from nothing here. The integrals are those of `FeynmanIntegrals`; the
operators, their renormalisation, the Ward identities and the operator product expansion are those
of `Renormalization`; pinch surfaces, power counting, the soft and collinear approximations, the
Glauber analysis and the nested subtraction are those of `InfraredStructure`. This roadmap
assembles them into statements about named processes, and it is the only one of the four that
mentions a hadron.

Two limits on what is claimed are fixed at the outset and repeated wherever they matter. A theorem
here is a statement about each order of the perturbative expansion; no convergence of the
expansion is asserted. And the hadron enters through one explicit hypothesis, `SoftHadronVertex`,
which says that the coupling of the hadron to its partons is cut off at a hadronic scale; a
theorem about a hadronic cross section is a theorem given that hypothesis. For several processes
that the collection uses no all-orders proof exists in the literature, and for some the statement
is a model assumption that perturbation theory cannot decide. Those are not targets. Layer 7 lists
them and says which is which.

The application the roadmap is built towards is a collection in which every use of the word
"factorises" resolves to one of three things: a theorem of this roadmap with its remainder power
stated; the hypothesis `SoftHadronVertex`; or a named hypothesis whose status as unproved or as a
model assumption is recorded in one table. The second application is the Sivers sign change
derived, not assumed: the direction of the Wilson line in the Drell–Yan process is forced by the
proof of Layer 4, the direction in semi-inclusive scattering by the proof of Layer 3, and the sign
relation of `TransverseMomentumDistributions` follows from the two.

## Scope

Included:

- The all-orders perturbative setting: a factorisation statement as a family of statements indexed
  by the order in the strong coupling, each with a remainder bound.
- Coefficient functions as functionals on test functions of the momentum fraction, with the delta
  function at the endpoint and the plus distributions as inhabitants, the embedding of regular
  kernels, and the convolution algebra and Mellin moments in that setting.
- The hadron hypothesis `SoftHadronVertex`, its monotonicity in the fall-off power, and the theorem
  that each hadronic statement of this roadmap follows from the partonic one together with it.
- Inclusive deep-inelastic scattering: the operator-product route for moments, the diagrammatic
  route in momentum-fraction space, their equivalence, target independence of the coefficient
  functions, factorisation-scale independence as a consequence of the renormalisation group, and
  the polarised and parity-violating structure functions by the same argument.
- Short-distance factorisation of the space-like bilocal correlator in Ioffe time.
- The total annihilation cross section, single-inclusive annihilation with fragmentation
  functions, collinear semi-inclusive scattering as a double convolution, and the target
  fragmentation region with fracture functions.
- Transverse-momentum-dependent factorisation for semi-inclusive scattering and back-to-back
  annihilation: the soft factor, independence of the rapidity regulator, the Wilson-line direction
  each proof forces, universality of the Collins function, and matching to the collinear formula.
- The Drell–Yan process, collinear and transverse-momentum-dependent: the Glauber obstruction to
  graph-by-graph deformation, its cancellation in the sum over cuts, the past-pointing Wilson
  line, the sign change of the two time-reversal-odd distributions, and the universality of the
  collinear densities between lepton–hadron and hadron–hadron processes.
- Hard exclusive processes: deeply virtual Compton scattering, meson production by longitudinally
  polarised photons, the failure of the leading-power statement for transversely polarised photons
  as an endpoint divergence, the meson electromagnetic form factor and the photon–meson transition
  form factor.
- Diffractive deep-inelastic scattering, with the theorem that its coefficient functions are the
  inclusive ones.
- The twist-three collinear formula at the order to which it is established, and its all-orders
  status.
- Thrust in annihilation and the corresponding hemisphere observable in the Breit frame of
  deep-inelastic scattering, as hard–jet–soft factorisation.
- Two failures, each as a theorem with an explicit graph and counter-model: hard diffraction in
  hadron–hadron collisions, and transverse-momentum-dependent factorisation in hadron production
  from hadron–hadron collisions.
- The hypothesis ledger: every factorisation hypothesis in the other roadmaps, with its status.

Not included. Feynman graphs, parametric representations, dimensional regularisation, the
Feynman rules and the cutting rules are `FeynmanIntegrals`. Subtraction of ultraviolet
divergences, the renormalisation group, composite operators, Slavnov–Taylor identities, Wilson
lines, the light-ray operator and the operator product expansion are `Renormalization`. Landau
equations, pinch surfaces, reduced graphs, infrared power counting, infrared cancellation, the
soft and collinear approximations, the Glauber region, the hard, jet and soft functions and the
Collins–Soper equation are `InfraredStructure`. Splitting kernels, their Mellin moments, the
solution theory of the evolution equations and scheme transformations of the densities are
`CollinearEvolution`; this roadmap proves that the densities obey an evolution equation and
identifies its kernel with the anomalous dimension of `Renormalization` Layer 5, and stops there.
The hadronic tensor, the structure functions, their kinematic domain, target-mass corrections and
the twist expansion as a parametrisation are `InclusiveStructureFunctions`. The decomposition of
the transverse-momentum-dependent correlator, its eight functions, the azimuthal structure
functions and the phenomenology of the non-perturbative transverse dependence are
`TransverseMomentumDistributions`. Fragmentation functions as objects, their sum rules and their
models are `Hadronization`. Generalised parton distributions, Compton form factors and the
exclusive observables are `GeneralizedPartonDistributions`. Diffractive kinematics, diffractive
distributions as objects and Regge factorisation are `Diffraction`. Twist-three correlators and
their evolution are `MultiPartonCorrelations`. Event-shape definitions, safety and resummation
formulae are `JetsAndEventShapes`. Non-relativistic production of quarkonium is
`QuarkoniaAndExotics`; high-energy factorisation in the dipole picture and the hybrid formalism
are `SmallXAndSaturation`; the equivalent-photon approximation is `Photoproduction`; QED mass
singularities are `RadiativeCorrections`. For each of these last four the ledger of Layer 7
records the status of the statement and this roadmap proves nothing about it. Numerical values of
coefficient functions beyond the orders named in the layers are not here: the roadmap proves
that the coefficient functions exist, are unique in a scheme, and satisfy their
renormalisation-group equations, and computes the lowest order of each.

The material belongs in `EpsilonEridani/QFT/Factorization/Theorems/`, with one subdirectory per
layer: `Framework/`, `DIS/`, `Annihilation/`, `TMD/`, `DrellYan/`, `Exclusive/`, `Diffractive/`,
`TwistThree/`, `EventShapes/` and `Failures/`. The coefficient-functional type of Layer 0.2 belongs
in `EpsilonEridani/QFT/Factorization/Convolution/Functional.lean`, beside the existing
`Convolution/Basic.lean`, because every other roadmap that writes a coefficient function needs it.
The ledger of Layer 7.3 belongs in `EpsilonEridani/QFT/Factorization/Theorems/Ledger.lean`.

## Conventions and coordination with upstream

1. "To all orders" means: for every natural number `n`, the coefficient of the `n`-th power of the
   renormalised coupling satisfies the stated identity with the stated remainder. The order is a
   `ℕ`-valued argument, never a three-valued enumeration. No statement asserts that the series in
   the coupling converges or is Borel summable. The trap this avoids is a theorem about a formal
   series being read as a theorem about a function of the coupling.
2. A coefficient function is a functional on test functions of the momentum fraction, of the type
   introduced in Layer 0.2, and a function-valued kernel is the image of the embedding
   `ofRegular`. The existing `DIS.HardKernel` is kept and is related to the functional type by a
   theorem. The trap this avoids is a hard-kernel type that excludes the Born term, so that the
   lowest-order instance of a theorem is not an instance of it.
3. Every factorisation statement carries its remainder as an explicit argument: the hadronic scale
   and the power. The power is two for inclusive deep-inelastic scattering, one for the
   transverse-momentum-dependent statements in the ratio of transverse momentum to hard scale, and
   is stated in each layer for the rest. The trap this avoids is two "leading-power" statements
   with different accuracies being composed as if they had the same one.
4. The hadron hypothesis is a single proposition `SoftHadronVertex`, an explicit argument of every
   theorem about a hadronic observable. It is never a typeclass, never a structure field with a
   witness, and it is the only hypothesis of its kind. Partonic theorems do not take it. The trap
   this avoids is the hadronic input being spread over many differently named assumptions whose
   equivalence nobody has checked.
5. The densities, fragmentation functions, distribution amplitudes and soft factors that appear in
   a theorem are the renormalised matrix elements of the operators of `Renormalization` Layer 5
   and `InfraredStructure` Layer 7, in the scheme named in the statement. A theorem never
   quantifies existentially over the density. The trap this avoids is "there exists a function
   such that the cross section is a convolution", which is true of any function and proves
   nothing.
6. The substance of each theorem is stated separately from the formula: the coefficient function
   depends on the hard process and the scheme and not on the target, the observed hadron, or the
   non-perturbative kinematic variables that are spectators. This is the convention of
   `Diffraction` Layer 2.3 applied throughout. The trap this avoids is a convolution
   representation with target-dependent coefficients, which always exists.
7. Scales are named `muF` for factorisation, `muR` for renormalisation and `zeta` for rapidity,
   and squares are written `muF2`, `muR2` as in `EpsilonEridani.QFT.Factorization.Scales.Basic`.
   The hard scale is `Q`, its square `Q2`. A statement about one scale holds the others fixed and
   says so. The trap this avoids is the single-scale diagonal on which scale independence cannot
   be stated.
8. The Wilson-line direction is a two-valued datum `future` or `past`, an argument of every
   transverse-momentum-dependent distribution, and each factorisation theorem states which value
   its proof produces. The name and its values agree with `LinkPath` of
   `TransverseMomentumDistributions`; the `straight` path of that roadmap does not arise from any
   proof here. The trap this avoids is a sign change asserted about a symbol with no path.
9. A region is one of `hard`, `collinear` to a named direction, `soft` or `glauber`, with the
   scalings of `InfraredStructure` Layer 0. "Leading region" has the meaning of `InfraredStructure`
   Layer 3. This roadmap introduces no region vocabulary of its own. The trap this avoids is two
   power countings with different small parameters.
10. A failure of factorisation is a theorem of the form "no functions of the stated kind satisfy
    the stated identity for the stated amplitude", proved by a counter-model. It is not a remark
    and not a missing proof. A statement for which no proof exists is recorded in the ledger as
    unproved, which is a different status from false. The trap this avoids is conflating "not
    proved" with "violated".
11. Light-cone components, the two light-like vectors of a process and the transverse plane are
    those of `InfraredStructure` Layer 0; the metric and Lorentz vectors are Physlib's. Transverse
    position is `bT`, transverse momentum `kT` or `qT`. The trap this avoids is a second set of
    light-cone conventions with a different factor of `√2`.
12. Where an existing roadmap states a factorisation formula as a definition of its right-hand
    side, the definition is kept there and the theorem here is an equation between that
    right-hand side and the perturbatively defined observable. No object owned by another roadmap
    is redefined. The trap this avoids is two definitions of the same density.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `QFT.Factorization.Convolution.Basic` for `Kernel`, `integrand` and `convolveAt`;
  `.Convolution.Collinear` for `collinearKernel` and `IsCollinearKernel`; `.Convolution.Algebra`
  for `mellinConv` and its commutativity; `.Convolution.Mellin` for `mellinDis` and
  `mellinDis_convolveAt`; `.Convolution.Properties`. Layer 0.2 extends these from function-valued
  kernels to functionals and proves that the extension restricts to them.
- `Mathematics.Distribution.PlusFunctional` for `plusFunctional`, `plusOneMinus`, the convergence
  criterion `intervalIntegrable_plusFunctional_integrand` and the moments `plusOneMinus_pow`. The
  plus distributions of Layer 0.2 are these.
- `QFT.Factorization.DIS.HardKernel` for `HardKernel` and `HardKernelAssumptions`;
  `QFT.Factorization.DIS.LO` for `loChannel`, `loStructureFunction` and `IsLOFactorized`;
  `QFT.Factorization.DIS.DiagrammaticHardKernel` for `TreeLevelQuarkDiagram` and
  `treeLevelAmplitude`; `QFT.Factorization.HigherOrder.Basic` for `PerturbativeOrder` and
  `HardKernelFamily`. `IsLOFactorized` is a proposition relating a given function to a given
  convolution, with `loStructureFunction_isFactorized` its reflexive instance; it contains no
  statement that a cross section defined by Feynman graphs has that form. Layer 1 supplies that
  statement, and Layer 0.5 proves that `IsLOFactorized` is its order-zero truncation on regular
  kernels. `HardKernel` is a function type and has no inhabitant equal to `e² δ(1 - z)`, as its
  own module records; Layer 0.2 is the type that has one. `treeLevelAmplitude` is a product of
  real parameters standing for an amplitude; Layer 1.3 replaces it with the amplitude of
  `FeynmanIntegrals` Layer 6 and proves the Born coefficient function from it.
- `QFT.Factorization.Scales.Basic` for `TwoScaleHardKernel`, `twoScaleStructureFunction`,
  `IsFactorizationScaleIndependent`, `ScaleDerivatives` and
  `isFactorizationScaleIndependent_iff_dglap_compensation`. That module proves scale independence
  equivalent to a compensation identity and takes the identity as a hypothesis. Layer 1.5 proves
  the identity.
- `QFT.Factorization.Evolution.Basic` for `SplittingKernel` and `dglapOperator`;
  `.Evolution.CollinearForm`, `.Evolution.MomentSpace` and `.Evolution.Consistency`. Layer 1.5
  identifies the kernel of `dglapOperator` with an anomalous dimension.
- `Particles.Parton.PDF.Basic` for `Pdf` and `Assumptions`; `Particles.Fragmentation.Basic` for
  `Frag`; `Particles.Parton.TMD.Basic` for `Tmd`; `Particles.Parton.TMD.CollinsSoper` for
  `TmdRgSystem`, `SatisfiesMuRg` and `SatisfiesZetaRg`; `Particles.Parton.TMD.Reduction`;
  `Particles.Parton.GPD.Basic`; `Particles.Parton.Unified.Basic`. These are the shapes the
  operator-defined functions of this roadmap are proved to have.
- `Particles.Parton.TMD.PowerCorrections` for `powerRatio`, `smallRatio`, `ApproximatesToOrder`
  and `ApproximatesToOrder.mono`. The transverse-momentum-dependent theorems of Layers 3 and 4 are
  stated in this vocabulary and not in a new one.
- `QFT.Scattering.DIS.Tensors.Basic` and `.Tensors.Longitudinal` for the hadronic tensor;
  `QFT.Scattering.DIS.Inclusive.CrossSection`; `QFT.Scattering.DIS.Polarized.Basic`;
  `QFT.Scattering.DIS.SIDIS.Basic` for `sidisChannel` and `sidisStructureFunction`;
  `QFT.Scattering.DIS.Exclusive.Convolution.Basic` for `convolveHAt`;
  `QFT.Scattering.DIS.Exclusive.DVCS.Basic` for `CFF` and `IsCFFConvolutionAtScale`;
  `QFT.Scattering.DIS.Exclusive.DVMP.Basic`. Each is the observable side of one layer.

From TauCeti:

- `TauCeti.Probability.Moments.Determinacy` for the passage from all moments to the function in
  the equivalence of the two routes of Layer 1.4.
- `TauCeti.Analysis.Contour.PerWindow.CPV` and
  `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` for the principal-value integrals in the
  dispersion relation of Layer 1.2 and in the hard kernel of Layer 5.2.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator` and `.CauchyProblem.Uniqueness` for uniqueness
  of the solution of the evolution equation in Layer 1.5, by which the density of the theorem is
  identified with the evolved density of `CollinearEvolution`.

From Physlib:

- `Physlib.Mathematics.Distribution.Basic`, which
  `EpsilonEridani.Mathematics.Distribution.BasicExtensions` re-exports, for distributions on
  Schwartz space where a coefficient function is needed in that setting, as for the hard kernel
  of Layer 5.2. The Lorentz vectors and the Minkowski product enter through `InfraredStructure`
  Layer 0 and are not cited again here.

From Mathlib:

- `Mathlib.Analysis.Asymptotics.Defs` for `Asymptotics.IsBigO`, in which every remainder is
  stated; `Mathlib.MeasureTheory.Measure.Dirac` and `Mathlib.MeasureTheory.Measure.WithDensity`
  for the measure-valued coefficient functions of Layer 0.2;
  `Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic` for the interval integrals of the plus
  functional; `Mathlib.Analysis.MellinTransform` for the Mellin transform to which the moments of
  Layer 1.2 are related; `Mathlib.Analysis.Distribution.TemperedDistribution` for the boundary
  values of amplitudes in Layer 5.

Absent upstream and built here: a type of coefficient functions that contains the delta function
and the plus distributions together, with its convolution; a proposition expressing factorisation
with a remainder to all orders; the hadron hypothesis; every theorem of Layers 1 to 7. Absent
upstream and built in the three sibling roadmaps, and consumed from there: Feynman integrals as
functions, renormalised operators, Ward identities, the operator product expansion, pinch
surfaces, the region subtraction and the Glauber analysis.

---

## Layer 0: the framework

References: Collins, Soper and Sterman, *Adv. Ser. Direct. High Energy Phys.* **5** (1989) 1, §1–4;
Collins, *Foundations of Perturbative QCD* (2011), ch. 1, 6 and 8; Curci, Furmanski and Petronzio,
*Nucl. Phys. B* **175** (1980) 27, §2.

### 0.1 The perturbative setting

- Define a *perturbative observable* as a sequence, indexed by the order `n : ℕ`, of functions of
  the kinematic variables and the hard scale, the `n`-th being the sum of the cut graphs of
  `FeynmanIntegrals` Layer 7 at order `n` for the stated process, renormalised by
  `Renormalization` Layer 1 in the minimal-subtraction scheme of `Renormalization` Layer 2.
- Define the *partonic* observable as the same with the hadron replaced by an on-shell massless
  parton, collinear divergences regulated dimensionally by `FeynmanIntegrals` Layer 4, and the
  *hadronic* observable as the same with the hadron entering through the vertex of 0.4.
- Statements to prove: the sum at each order is a finite sum of convergent integrals after
  renormalisation, for non-exceptional kinematics, citing `Renormalization` Layer 1 and
  `FeynmanIntegrals` Layer 3; the perturbative observable is independent of the gauge parameter,
  citing `Renormalization` Layer 4; the truncation of a product of two series at order `n` is the
  finite Cauchy sum over the pairs `(k, l)` with `k + l = n`, with associativity for three
  factors.
- State, as a remark attached to the definition and not as a target, that no property of the sum
  over `n` is asserted.

### 0.2 Coefficient functions as functionals

- Define `CoefficientFunctional` as the type of functionals from test functions `ℝ → ℝ` of the
  momentum fraction to `ℝ`, and the subtype of those that are linear and are continuous for the
  norm `sup |φ| + Lipschitz constant of φ at 1` on the test functions satisfying the one-sided
  Lipschitz condition of `EpsilonEridani.Mathematics.Distribution.PlusFunctional`.
- Define the three generators: `ofRegular K`, integration against an integrable `K` on `[0, 1]`;
  `deltaAtOne c`, which sends `φ` to `c φ(1)`; and `plus K`, which is `plusFunctional K`. Define
  the logarithmic plus distributions `[log^k(1 - z) / (1 - z)]₊` as `plus` of the corresponding
  kernel and prove their convergence from `intervalIntegrable_plusFunctional_integrand`.
- Define the convolution of a functional with a density,
  `(C ⊗ f)(x) = C (z ↦ f(x/z)/z · 1_{z ≥ x})`, and the convolution of two functionals by
  duality.
- Statements to prove:
  - `convolve (deltaAtOne c) f x = c * f x` for `x ≤ 1`.
  - The embedding: `convolve (ofRegular K) f x` equals the existing
    `Convolution.convolveAt` of the kernel `(x', z) ↦ K z` against the same test function, and,
    for a collinear kernel in the sense of `IsCollinearKernel`, equals
    `convolveAt (collinearKernel C) f x`.
  - Non-representability: for `c ≠ 0` there is no integrable `K` with
    `ofRegular K φ = deltaAtOne c φ` for all continuous `φ`. This is the precise sense in which
    the function-valued kernel type omits the Born term.
  - The convolution of functionals is associative and commutative, has `deltaAtOne 1` as its
    unit, and restricts on regular kernels to `mellinConv` of
    `EpsilonEridani.QFT.Factorization.Convolution.Algebra`.
  - Moments: the `n`-th moment of `C ⊗ f` is `C (z ↦ zⁿ)` times the `n`-th moment of `f`, under
    the integrability hypotheses of `mellinDis_convolveAt`; the moments of `deltaAtOne c` are
    `c`, and those of `plus (fun z => (1 - z)⁻¹)` are minus the harmonic numbers, by
    `plusOneMinus_pow`.
  - A measure-valued form: every positive coefficient functional of order zero is integration
    against a finite measure on `(0, 1]`, with `deltaAtOne c` the Dirac measure at `1` scaled by
    `c` and `ofRegular K` the measure with density `K`; plus distributions are not measures, and
    the example that shows it is recorded.

### 0.3 What a factorisation theorem is

- Define `PowerSuppressed R Λ p`: there are a constant and a threshold such that
  `|R Q| ≤ c (Λ/Q)^p` for all `Q` above the threshold. Prove it equivalent to
  `R =O[Filter.atTop] (fun Q => (Λ/Q)^p)` and monotone in `p` for `Λ > 0`.
- Define `FactorizesToAllOrders F C f Λ p` for a perturbative observable `F`, a sequence of
  coefficient functionals `C` and a sequence of densities `f`: at every order `n` and every
  `x ∈ (0, 1)`, the difference between `F n x Q` and the order-`n` Cauchy sum of `C ⊗ f` is
  `PowerSuppressed` with scale `Λ` and power `p`.
- Define the corresponding propositions for a double convolution (density and fragmentation
  function), for a transverse convolution in the vocabulary of `ApproximatesToOrder`, and for an
  exclusive amplitude with complex values.
- Statements to prove: each proposition is stable under a finite scheme change in the sense of
  `Renormalization` Layer 2, with the coefficient functionals and the densities transforming
  inversely; each is stable under replacing `Λ` by a larger scale; and the proposition with the
  densities existentially quantified is true for every `F` whatever, with an explicit witness,
  which is why Convention 5 forbids that form.

### 0.4 The hadron hypothesis

- Define `SoftHadronVertex V Λ N`: the amputated vertex function `V`, by which a hadron of
  momentum `P` couples to a parton of virtuality `k²` and transverse momentum `kT` relative to
  `P` together with a spectator system, satisfies `|V| ≤ c (Λ² / (Λ² + |k²| + kT²))^N` for some
  constant, with `Λ > 0`.
- State exactly what is and is not asserted. Asserted: a bound on one function. Not asserted: that
  such a vertex function follows from QCD, that the hadron is a bound state of any particular
  kind, or any property of confinement. Nothing in this collection proves the hypothesis, and no
  layer of this roadmap or of the three it rests on is contingent on proving it; it is an
  argument of the hadronic theorems.
- Statements to prove: monotonicity in `N`; with `N` large enough that the transverse-momentum
  integral converges — the minimal `N` is computed — the hadronic observable of 0.1 is the
  partonic one integrated against the square of the vertex, up to `PowerSuppressed` terms with
  power two; consequently every partonic theorem of Layers 1 to 6 implies its hadronic
  counterpart with the same coefficient functionals, and the proof of that implication is one
  lemma used by all of them.
- Prove that the hypothesis is not vacuous and not automatic: exhibit a vertex function
  satisfying it, and one — constant in `k²` — that violates it and for which the conclusion of
  the previous item fails, the parton density then having a logarithmic dependence on `Q` that
  no evolution equation of Layer 1.5 reproduces.

### 0.5 The relation to the leading-order development

- Statements to prove: at order zero with coefficient functionals `deltaAtOne (e i ^ 2)`, the
  Cauchy sum of 0.3 is the parton-model sum `∑ i, e i ^ 2 * f i x`; at order zero with regular
  coefficient functionals it is `loStructureFunction` applied to the corresponding
  `HardKernel`; hence `IsLOFactorized F C f` is the order-zero instance of
  `FactorizesToAllOrders` with remainder zero on the regular subspace.
- Prove that `twoScaleStructureFunction` of `Scales.Basic` is the regular-kernel instance of the
  two-scale Cauchy sum, order by order, so that the scale statements of Layer 1.5 are statements
  about that existing object.

### 0.6 Operator-defined functions and uniqueness

- For each kind of function used in Layers 1 to 6 — parton density, fragmentation function,
  fracture function, transverse-momentum-dependent distribution and fragmentation function, soft
  factor, generalised parton distribution, distribution amplitude, diffractive density — name
  the operator of `Renormalization` Layer 5 or `InfraredStructure` Layer 7 whose renormalised
  matrix element it is, and the existing EpsilonEridani type it inhabits.
- Statements to prove: given the scheme, the coefficient functionals of a factorisation theorem
  are unique, because the partonic densities at order zero are `deltaAtOne 1` and the Cauchy
  sum is then triangular in the order; and the densities are unique given the coefficient
  functionals on the set of observables for which the leading-order kernel of
  `QFT.Scattering.DIS.Inference.Identifiability` is injective.

### Examples

- The functional `deltaAtOne 1 + (α/2π) C_F · plus (fun z => (1 + z²)/(1 - z))`, its first four
  moments computed from `plusOneMinus_pow`, and the check that the first vanishes.
- A regular kernel `K z = z` embedded by `ofRegular`, with the convolution computed both ways.
- A vertex function `V = (Λ²/(Λ² + |k²| + kT²))²` with the minimal `N` verified.
- Counterexample-shaped: for an arbitrary `F` with no relation to any field theory, a density
  constructed so that `F` "factorises" with the Born coefficient functional; this is the
  witness required in 0.3.
- Counterexample-shaped: the constant vertex of 0.4.

### Dependencies

`EpsilonEridani.QFT.Factorization.Convolution.Basic`, `.Convolution.Collinear`,
`.Convolution.Algebra`, `.Convolution.Mellin`, `EpsilonEridani.QFT.Factorization.DIS.HardKernel`,
`EpsilonEridani.QFT.Factorization.DIS.LO`, `EpsilonEridani.QFT.Factorization.Scales.Basic`,
`EpsilonEridani.Mathematics.Distribution.PlusFunctional`,
`EpsilonEridani.Particles.Parton.PDF.Basic`,
`EpsilonEridani.Particles.Parton.TMD.PowerCorrections`,
`EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability`, `Mathlib.Analysis.Asymptotics.Defs`,
`Mathlib.MeasureTheory.Measure.Dirac`, `Mathlib.MeasureTheory.Measure.WithDensity`. From
`FeynmanIntegrals`: Layers 3, 4, 6 and 7. From `Renormalization`: Layers 1, 2, 4 and 5. From
`InfraredStructure`: Layer 7 for the operators of 0.6.

---

## Layer 1: inclusive deep-inelastic scattering

References: Gross and Wilczek, *Phys. Rev. D* **8** (1973) 3633 and **9** (1974) 980; Georgi and
Politzer, *Phys. Rev. D* **9** (1974) 416; Zimmermann, *Ann. Phys.* **77** (1973) 570; Bardeen,
Buras, Duke and Muta, *Phys. Rev. D* **18** (1978) 3998; Libby and Sterman, *Phys. Rev. D* **18**
(1978) 3252; Ellis, Georgi, Machacek, Politzer and Ross, *Nucl. Phys. B* **152** (1979) 285;
Collins and Soper, *Nucl. Phys. B* **194** (1982) 445; Collins, *Foundations of Perturbative QCD*,
ch. 8 and 11.

### 1.1 The observable

- Take the hadronic tensor and its decomposition into structure functions from
  `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`, `.Tensors.Longitudinal` and
  `InclusiveStructureFunctions`, and define the perturbative structure functions as the
  perturbative observables of 0.1 obtained from the cut graphs of the forward virtual Compton
  amplitude.
- Statements to prove: current conservation of the perturbative hadronic tensor at each order,
  from the Ward identity of `Renormalization` Layer 4; the relation between the structure
  functions and the discontinuity of the forward amplitude, from `FeynmanIntegrals` Layer 7; the
  support of the perturbative structure functions in `0 < x ≤ 1`.

### 1.2 The operator-product route

- Apply the operator product expansion of `Renormalization` Layer 6 to the product of two
  electromagnetic currents, and select the twist-two operators of `Renormalization` Layer 3.
- Statements to prove:
  - The dispersion relation for the forward amplitude in the variable `1/x` at fixed `Q²`, to
    each order, with its subtraction: the perturbative amplitude at fixed order is polynomially
    bounded, the number of subtractions is computed, and they do not contribute to moments with
    `n ≥ 2`. The principal-value integral is that of `TauCeti.Analysis.Contour.PerWindow.CPV`.
  - Moment factorisation: for each even `n ≥ 2`, the `n`-th moment of `F₂` equals the sum over
    twist-two operators of the Wilson coefficient times the reduced matrix element, with a
    remainder `PowerSuppressed` with power two. This is `MomentFactorized`.
  - The corresponding statements for `F_L`, for `F₃` with odd `n`, and for the polarised
    structure function `g₁` with the axial operators.
  - The Wilson coefficients are independent of the target state: they are defined by the
    operator identity and the state enters only through the matrix element.
  - The renormalisation-group equation of the product: the scale derivative of the Wilson
    coefficient is minus the transposed anomalous-dimension matrix acting on it, and the product
    of coefficient and matrix element is scale independent order by order. This is the statement
    that `InclusiveStructureFunctions` Layer 4.2 carries as a hypothesis on `OPEData`.
- State what this route does not give: a statement at fixed `x`, since finitely many moments do
  not determine a function, and anything about processes with no local operator expansion.

### 1.3 The diagrammatic route

- Apply `InfraredStructure` Layers 2 and 3 to the cut forward amplitude: the leading regions
  have one hard subgraph containing both current vertices, one collinear subgraph in the target
  direction, final-state jets attached to the hard subgraph, and a soft subgraph.
- Statements to prove:
  - Cancellation of the final-state jets and the soft subgraph in the inclusive sum over cuts,
    from `InfraredStructure` Layer 4, leaving a hard subgraph and a target-collinear subgraph.
  - The Glauber region does not obstruct: all soft exchanges with the target-collinear subgraph
    attach to final-state lines, the relevant poles lie on one side, and the contour deformation
    of `InfraredStructure` Layer 6 applies graph by graph.
  - Decoupling: by the Ward identity of `InfraredStructure` Layer 5 the scalar-polarised
    collinear gluons attaching to the hard subgraph sum to a Wilson line, and the
    target-collinear factor is the matrix element of the light-ray operator of `Renormalization`
    Layer 5.
  - The subtraction: the nested region subtraction of `InfraredStructure` Layer 5 has a remainder
    `PowerSuppressed` with power two, and the subtracted hard subgraph is the coefficient
    functional.
  - The Born coefficient functional is `deltaAtOne (e i ^ 2)` for `F₂/x`, computed from the
    tree-level amplitude of `FeynmanIntegrals` Layer 6, and the one-loop coefficient functional
    in minimal subtraction is the stated combination of `deltaAtOne`, `plus` and `ofRegular`
    terms.

### 1.4 The theorem, and the equivalence of the two routes

- **Theorem (inclusive factorisation).** The perturbative structure functions of 1.1 satisfy
  `FactorizesToAllOrders` with remainder power two, with coefficient functionals the subtracted
  hard subgraphs of 1.3 and densities the matrix elements of the light-ray operators. The
  partonic statement takes no hypothesis; the hadronic statement takes `SoftHadronVertex`.
- **Theorem (equivalence of routes).** The `n`-th moment of the coefficient functional of 1.3 is
  the Wilson coefficient of 1.2, and the `n`-th moment of the light-ray matrix element is the
  reduced matrix element of the twist-two operator of spin `n`. The first is a statement about
  the hard subgraph; the second is the expansion of the light-ray operator in local operators,
  from `Renormalization` Layer 5.
- **Theorem (the routes determine each other).** Given the support property of 1.1 and
  determinacy of the moment problem on `[0, 1]` from `TauCeti.Probability.Moments.Determinacy`,
  moment factorisation for all `n` implies factorisation at each `x` in the weak sense — against
  polynomial test functions — and the diagrammatic theorem implies moment factorisation.
  State precisely that the pointwise statement at fixed `x` is the content of 1.3 and does not
  follow from 1.2.
- **Theorem (target independence).** The coefficient functionals are the same for every target,
  including a nucleus. This is the statement `NuclearPartonDistributions` Layer 4.1 uses.

### 1.5 Scale independence and the evolution equation

- Statements to prove:
  - The light-ray matrix element obeys a renormalisation-group equation whose kernel is the
    anomalous dimension of the light-ray operator of `Renormalization` Layer 5, and that kernel
    is a `SplittingKernel` satisfying `IsCollinearSplittingKernel` of
    `EpsilonEridani.QFT.Factorization.Evolution.CollinearForm`. At one loop it is the kernel of
    `CollinearEvolution`.
  - The compensation identity of `Scales.Basic`: the factorisation-scale derivative of the
    coefficient functional and that of the density cancel in the flavour sum, to each order.
  - Therefore `IsFactorizationScaleIndependent` holds for the two-scale structure function at
    each order, up to terms of the next order when the series is truncated; the truncated
    statement is the one `CollinearEvolution` Layer 5.5 proves, and the untruncated statement is
    the "factorisation hypothesis" that layer names.
  - Uniqueness: the density of the theorem at scale `μ` is the solution of the evolution equation
    with initial condition the density at `μ₀`, by
    `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`.
- The relation to the existing code is stated as theorems: `IsLOFactorized` is the order-zero
  truncation (0.5); `IsFactorizationScaleIndependent` is a conclusion and no longer needs the
  compensation as a hypothesis; `HardKernelFamily` indexed by `PerturbativeOrder` is the
  restriction of the `ℕ`-indexed sequence to its first three terms on regular kernels.

### 1.6 Other inclusive structure functions

- Statements to prove: the theorem of 1.4 for `g₁` with the polarised light-ray operators; for
  the parity-violating and charged-current structure functions with the electroweak currents of
  `ElectroweakAndBSM`, the coefficient functionals differing from the electromagnetic ones only
  by couplings at order zero; and that no chiral-odd operator contributes at leading power to any
  inclusive structure function with massless quarks, so that transversity is absent, as
  `SpinStructure` states.
- For `g₂`, prove that the leading-power statement holds for its twist-two part and that the
  remaining part is power-counting-leading only through the twist-three operators of
  `MultiPartonCorrelations`; the status of the all-orders statement for that part is that of
  Layer 6.2.

### 1.7 Short-distance factorisation of the space-like correlator

- Apply the operator product expansion of `Renormalization` Layer 6 to the bilocal quark operator
  at space-like separation `z`, joined by a straight Wilson line and renormalised as in
  `Renormalization` Layer 5.
- Statements to prove: the reduced Ioffe-time distribution of `LatticeBridge` Layer 3 equals the
  convolution of a perturbative kernel with the light-cone Ioffe-time distribution with a
  remainder bounded by a constant times `z² Λ²`, to each order; the kernel's dependence on
  `log(z² μ²)` is fixed by the anomalous dimension of 1.5; the one-loop kernel is the stated one;
  and the momentum-space form, in which the expansion parameter is the inverse hadron momentum,
  follows by Fourier transformation with the order of limits of `LatticeBridge` Layer 2.4 made a
  hypothesis of the statement.

### Examples

- The one-loop quark coefficient functional of `F₂` in minimal subtraction paired with `zⁿ` for
  `n = 0, 1, 2`, and the check that the `n = 0` value is consistent with the Adler sum rule
  receiving no correction.
- The Callan–Gross relation at order zero and its violation at order one: the longitudinal
  coefficient functional is `ofRegular` of an explicit polynomial kernel and has no `deltaAtOne`
  part.
- A scalar-quark model in which the order-zero coefficient functional of `F_L` is non-zero,
  showing that the Born coefficient functionals depend on the spin of the parton.
- Counterexample-shaped: a function with the first `N` moments of a given density and different
  from it, certifying the caveat of 1.2 for every finite `N`.
- Counterexample-shaped: a product of currents at time-like separation, for which the expansion
  of 1.2 is not available, pointing at Layer 2.

### Dependencies

Layer 0. `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`, `.Tensors.Longitudinal`,
`EpsilonEridani.QFT.Scattering.DIS.Inclusive.CrossSection`,
`EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic`,
`EpsilonEridani.QFT.Factorization.Scales.Basic`, `EpsilonEridani.QFT.Factorization.Evolution.Basic`,
`.Evolution.CollinearForm`, `.Evolution.MomentSpace`, `.Evolution.Consistency`,
`EpsilonEridani.QFT.Factorization.HigherOrder.Basic`, `TauCeti.Probability.Moments.Determinacy`,
`TauCeti.Analysis.Contour.PerWindow.CPV`, `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`.
From `FeynmanIntegrals`: Layers 6 and 7. From `Renormalization`: Layers 3, 4, 5 and 6. From
`InfraredStructure`: Layers 2 to 6. From `InclusiveStructureFunctions`: the structure-function
definitions. From `CollinearEvolution`: the one-loop kernels for comparison.

---

## Layer 2: annihilation and collinear semi-inclusive processes

References: Sterman, *Phys. Rev. D* **17** (1978) 2773 and 2789; Mueller, *Phys. Rev. D* **18**
(1978) 3705; Collins and Soper, *Nucl. Phys. B* **194** (1982) 445; Altarelli, Ellis, Martinelli
and Pi, *Nucl. Phys. B* **160** (1979) 301; Trentadue and Veneziano, *Phys. Lett. B* **323** (1994)
201; Grazzini, Trentadue and Veneziano, *Nucl. Phys. B* **519** (1998) 394; Collins, *Foundations
of Perturbative QCD*, ch. 12.

### 2.1 The total annihilation cross section

- Statements to prove: the total cross section for annihilation into hadrons is, to each order,
  a function of `Q` and the coupling with no dependence on any infrared regulator, from
  `InfraredStructure` Layer 4; it equals the discontinuity of the current two-point function,
  whose short-distance expansion is the unit operator plus power-suppressed terms, from
  `Renormalization` Layer 6. This is the factorisation theorem with no non-perturbative function
  and, for massless quarks, no remainder at any order; it is the base case against which the
  others are checked.

### 2.2 Single-inclusive annihilation

- Define the perturbative single-hadron-inclusive cross section and the fragmentation function as
  the matrix element of the final-state light-ray operator of `Renormalization` Layer 5,
  inhabiting `EpsilonEridani.Particles.Fragmentation.Frag`.
- Statements to prove:
  - No operator product expansion is available: the observed hadron is in the final state and
    the product of currents is not expanded at short distance. The proof is the diagrammatic
    one only.
  - The leading regions: one hard subgraph, one collinear subgraph in the direction of the
    observed hadron, unobserved jets and a soft subgraph; the unobserved jets and the soft
    subgraph cancel in the sum over cuts.
  - **Theorem.** The cross section satisfies `FactorizesToAllOrders` in the momentum fraction of
    the hadron with remainder power two, the coefficient functionals being those of the
    time-like hard subgraph. Partonic with no hypothesis; hadronic given the final-state
    counterpart of `SoftHadronVertex`, which is the same proposition applied to the vertex by
    which a parton becomes the observed hadron and a remainder.
  - The evolution kernel of the fragmentation function is the time-like anomalous dimension, and
    at one loop it is the transpose of the space-like kernel in flavour space, the relation
    `Hadronization` Layer 2.3 states.

### 2.3 Collinear semi-inclusive scattering

- For semi-inclusive deep-inelastic scattering with the hadron transverse momentum integrated,
  or of order `Q`, statements to prove:
  - The leading regions have two collinear subgraphs, target and observed hadron, attached to
    one hard subgraph; soft exchanges between them cancel in the sum over cuts or are deformed
    out of the Glauber region as in 1.3.
  - **Theorem.** The cross section is the double convolution of a coefficient functional in two
    variables with a density and a fragmentation function, with remainder power two. The
    density and the fragmentation function are the same objects as in 1.4 and 2.2: this
    universality is the substance.
  - At order zero the coefficient functional is the product of two `deltaAtOne` and the formula
    is `sidisStructureFunction` of `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`.
  - Integrating over the hadron and summing over species with the momentum sum rule of
    `Hadronization` recovers the inclusive theorem of 1.4, coefficient functional by coefficient
    functional.

### 2.4 The two-variable coefficient functionals

- Define coefficient functionals in two momentum fractions as functionals on test functions of
  two variables, with the generators `deltaAtOne ⊗ deltaAtOne`, `deltaAtOne ⊗ plus`,
  `plus ⊗ plus` and regular kernels, and the transposition of Convention 1 of `Hadronization`.
- Statements to prove: the double convolution of `Hadronization` Layer 1.1 is the regular case;
  the one-loop two-variable coefficient functional of collinear semi-inclusive scattering is the
  stated combination; double Mellin moments factorise.

### 2.5 The target fragmentation region

- Define the fracture function as the matrix element of the light-ray operator of 1.4 with an
  identified hadron in the final state, inhabiting the type `Hadronization` Layer 5.1 gives it.
- Statements to prove:
  - **Theorem.** With the observed hadron collinear to the target, the cross section is a single
    convolution of the inclusive coefficient functional of 1.4 with the fracture function, with
    remainder power two. The proof is that of 1.3 with a restriction on the final state of the
    target-collinear subgraph, on which the hard subgraph does not depend.
  - The fracture function obeys the inhomogeneous evolution equation of `Hadronization` Layer
    5.3, the inhomogeneous term arising from the region in which the observed hadron is produced
    by a parton emitted at large transverse momentum, which is a region of 2.3.
  - The sum of the formula of 2.3 and the formula of this subsection is the cross section over
    the whole range of the hadron's rapidity with each region counted once, the overlap being
    removed by the subtraction of `InfraredStructure` Layer 5.

### Examples

- The one-loop coefficient of the total annihilation cross section, `1 + α_s/π`, from the
  cancellation of real and virtual infrared poles.
- The order-zero semi-inclusive formula evaluated for a two-flavour, one-hadron model and shown
  equal to `sidisStructureFunction`.
- The inhomogeneous term of the fracture-function evolution at one loop, as a convolution of a
  density with a real-emission kernel and a fragmentation function.
- Counterexample-shaped: a cross section restricted by a rapidity veto on soft radiation, for
  which the cancellation of the soft subgraph in 2.2 fails and a soft function appears; this is
  the entry to Layers 3 and 6.

### Dependencies

Layers 0 and 1. `EpsilonEridani.Particles.Fragmentation.Basic`,
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`. From `FeynmanIntegrals`: Layers 6 and 7. From
`Renormalization`: Layers 5 and 6. From `InfraredStructure`: Layers 2 to 6. From `Hadronization`:
the fragmentation and fracture functions as objects, their sum rules, and the inhomogeneous
evolution equation.

---

## Layer 3: transverse-momentum-dependent factorisation

References: Collins and Soper, *Nucl. Phys. B* **193** (1981) 381; Collins, Soper and Sterman,
*Nucl. Phys. B* **250** (1985) 199; Ji, Ma and Yuan, *Phys. Rev. D* **71** (2005) 034005; Collins,
*Foundations of Perturbative QCD*, ch. 10 and 13; Aybat and Rogers, *Phys. Rev. D* **83** (2011)
114042; Metz, *Phys. Lett. B* **549** (2002) 139; Collins and Metz, *Phys. Rev. Lett.* **93** (2004)
252001.

### 3.1 The kinematic region and the leading regions

- Take the region `qT ≪ Q` with the power-counting ratio `powerRatio` and the filter `smallRatio`
  of `EpsilonEridani.Particles.Parton.TMD.PowerCorrections`.
- Statements to prove, for semi-inclusive deep-inelastic scattering and for back-to-back
  hadron-pair production in annihilation:
  - **Region completeness.** By `InfraredStructure` Layers 2 and 3, every leading region of the
    cut amplitude consists of a hard subgraph, a collinear subgraph in each of the two hadron
    directions, and a soft subgraph connected to the collinear subgraphs by gluons, with no
    other leading configuration. This is the proposition `TransverseMomentumDistributions`
    Layer 2.1 names as a hypothesis of its factorisation theorem.
  - Unlike 1.3 and 2.2, the soft subgraph does not cancel, because the observed transverse
    momentum constrains soft radiation; the statement is that its contribution is a function of
    transverse position only.
  - **Glauber deformation.** For both processes all Glauber exchanges between a collinear
    subgraph and the rest attach on one side of the cut to lines whose poles lie in one
    half-plane, and the deformation of `InfraredStructure` Layer 6 applies graph by graph. This
    is the proposition `TransverseMomentumDistributions` Layer 2.4 names "cancellation of
    Glauber-region contributions".

### 3.2 The Wilson lines the proof produces

- Statements to prove: after the deformation of 3.1, the soft approximation of
  `InfraredStructure` Layer 5 applied to gluons attaching to the struck quark in semi-inclusive
  scattering produces an eikonal line running to the future; applied to both final-state
  directions in annihilation it produces two future-pointing lines. The direction is determined
  by the half-plane into which the contour was deformed, and that is determined by whether the
  lines carrying the collinear momentum past the hard vertex are in the final or the initial
  state.
- Define `TmdProcess.linkDirection` accordingly and prove that the transverse-momentum-dependent
  distribution appearing in the theorem of 3.3 is the one with the future-pointing staple of
  `TransverseMomentumDistributions` Layer 1.3. This is the derivation that layer's 2.4 calls for.

### 3.3 The theorem for semi-inclusive scattering

- **Theorem.** At leading power in `qT/Q`, the semi-inclusive hadronic tensor in transverse
  position space is a hard factor times the product of a transverse-momentum-dependent
  distribution and a transverse-momentum-dependent fragmentation function, each the matrix
  element of the operator of `InfraredStructure` Layer 7 with the soft factor absorbed as in 3.4,
  at scales `μ` and `ζ`; the remainder satisfies `ApproximatesToOrder` with order one. In
  transverse momentum space the product is the transverse convolution of
  `TransverseMomentumDistributions` Layer 2.2.
- The four hypotheses that `TransverseMomentumDistributions` Layer 2.4 lists — region
  completeness, eikonal validity, Glauber cancellation and power counting — are here,
  respectively: 3.1; the soft approximation with its error bound from `InfraredStructure` Layer
  5; 3.1; and `InfraredStructure` Layer 3. The theorem `sidis_factorization` of that roadmap
  then holds with those four arguments supplied.
- Partonic with no hypothesis; hadronic given `SoftHadronVertex` for the target and its
  final-state counterpart for the observed hadron.
- Prove the statement for each of the eight leading-twist distributions paired with the
  unpolarised or the Collins fragmentation function, the hard factor being the same for all at
  each order because the hard subgraph is chirality- and helicity-conserving for massless
  quarks.

### 3.4 The soft factor and regulator independence

- Statements to prove:
  - The soft subgraph is the vacuum expectation value of a product of Wilson lines, the soft
    function of `InfraredStructure` Layer 7, and it carries rapidity divergences that cancel
    against those of the two collinear factors.
  - The combination in which the square root of the soft function is absorbed into each
    collinear factor is finite and depends on one rapidity scale per factor, with
    `ζ_target · ζ_hadron = Q⁴` in the normalisation of `TransverseMomentumDistributions`.
  - The resulting distribution is independent of the rapidity regulator among the three of
    `TransverseMomentumDistributions` Layer 2.3, the hard factor absorbing a named scheme
    factor.
  - The distribution satisfies `SatisfiesMuRg` and `SatisfiesZetaRg` of
    `EpsilonEridani.Particles.Parton.TMD.CollinsSoper` for a `TmdRgSystem` whose Collins–Soper
    kernel is the one derived in `InfraredStructure` Layer 7, and that kernel is the same for
    the distribution and the fragmentation function. This supplies the boundary condition that
    `csKernel_eq_of_cuspConsistent` requires.

### 3.5 Back-to-back annihilation and the Collins function

- **Theorem.** The cross section for two nearly back-to-back hadrons in annihilation factorises
  as in 3.3 with two fragmentation functions, the same hard-factor structure and the same soft
  function.
- **Theorem (universality of the Collins function).** The transverse-momentum-dependent
  fragmentation functions appearing in 3.3 and in this subsection are equal, including the
  time-reversal-odd Collins function. The proof is that the Wilson line of a fragmentation
  function is in the final state in both processes, and that for a fragmentation function the
  two staple directions give the same matrix element after the sum over the unobserved final
  state, which is `Hadronization` Layer 3.4.

### 3.6 Matching to the collinear formula

- Statements to prove:
  - At small transverse position the distribution has an operator product expansion on the
    collinear density with coefficient functionals of Layer 0.2, from `Renormalization` Layer 6,
    which is `TransverseMomentumDistributions` Layer 4.1.
  - The leading-power formula of 3.3 expanded at `qT` of order `Q` and the collinear formula of
    2.3 expanded at `qT ≪ Q` agree term by term at each order: the asymptotic term.
  - **Theorem.** The sum of the formula of 3.3 and the collinear formula of 2.3, minus the
    asymptotic term, approximates the cross section uniformly in `qT` with a remainder
    suppressed by a power of the hadronic scale over `Q`. The proof is the region subtraction of
    `InfraredStructure` Layer 5 applied with both sets of regions.

### Examples

- The one-loop hard factor of semi-inclusive scattering in the scheme of 3.4.
- The one-loop soft function in transverse position space with each regulator, and the scheme
  factors relating them.
- The order-`α_s` asymptotic term, computed from 3.3 and from 2.3 and shown equal.
- Counterexample-shaped: the unsubtracted single-scale correlator, whose rapidity divergence is
  exhibited at one loop, so that the formula of 3.3 with it in place of the two-scale
  distribution has no finite value.
- Counterexample-shaped: a graph with a Glauber exchange between two initial-state spectators,
  which does not occur in either process of this layer and does occur in Layer 4.

### Dependencies

Layers 0, 1 and 2. `EpsilonEridani.Particles.Parton.TMD.Basic`, `.TMD.CollinsSoper`,
`.TMD.PowerCorrections`, `.TMD.Reduction`, `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`. From
`Renormalization`: Layers 5 and 6. From `InfraredStructure`: Layers 0, 2, 3, 5, 6 and 7. From
`TransverseMomentumDistributions`: the correlator, its decomposition, the staple paths, the
transverse convolution and the regulators. From `Hadronization`: Layer 3.

---

## Layer 4: the Drell–Yan process

References: Bodwin, *Phys. Rev. D* **31** (1985) 2616; Collins, Soper and Sterman, *Nucl. Phys. B*
**261** (1985) 104 and **308** (1988) 833; Collins, Soper and Sterman, *Nucl. Phys. B* **250**
(1985) 199; Ji, Ma and Yuan, *Phys. Lett. B* **597** (2004) 299; Collins, *Phys. Lett. B* **536**
(2002) 43; Brodsky, Hwang and Schmidt, *Phys. Lett. B* **530** (2002) 99; Collins, *Foundations of
Perturbative QCD*, ch. 14.

### 4.1 The observable and the collinear statement

- Define the perturbative cross section for inclusive production of a lepton pair of invariant
  mass `Q` in the collision of two hadrons, differential in `Q²` and rapidity, as the sum of cut
  graphs of `FeynmanIntegrals` Layer 7.
- State the theorem to be proved in 4.3: the cross section is the double convolution of a
  coefficient functional with two parton densities, one per hadron, with remainder power two,
  the densities being those of Layer 1.4.

### 4.2 The Glauber obstruction

- Statements to prove:
  - The leading regions are a hard subgraph, two collinear subgraphs and a soft subgraph, by
    `InfraredStructure` Layers 2 and 3.
  - Each collinear subgraph has spectator lines in the initial state on which a Glauber exchange
    with the other collinear subgraph has poles in both half-planes: the contour is pinched and
    the deformation of `InfraredStructure` Layer 6 is not available graph by graph. Exhibit the
    one-loop spectator–spectator exchange graph and the two poles.
  - For an individual cut of that graph the Glauber region contributes at leading power. This is
    a theorem about one explicit integral.

### 4.3 Cancellation in the sum over cuts, and the theorem

- Statements to prove:
  - For the cross section inclusive over all hadronic final states, the sum over the positions
    of the final-state cut through the spectator interactions, at fixed momenta of the active
    partons, removes the pinch: after the sum, the integrand is analytic in the relevant
    light-cone component in a half-plane, by the unitarity identity of `FeynmanIntegrals` Layer
    7 applied to the spectator subgraphs, and the deformation of `InfraredStructure` Layer 6
    applies to the sum.
  - The deformation is into the half-plane opposite to that of Layer 3.
  - After deformation the soft and collinear approximations, the Ward identities and the nested
    subtraction of `InfraredStructure` Layer 5 apply as in 1.3, and the soft subgraph cancels in
    the collinear statement.
  - **Theorem (collinear Drell–Yan factorisation).** The statement of 4.1 holds to all orders
    with remainder power two. Partonic with no hypothesis; hadronic given `SoftHadronVertex` for
    each hadron.
  - The order-zero coefficient functional is a product of two `deltaAtOne`, and the one-loop
    quark–antiquark coefficient functional in minimal subtraction is the stated combination.
- State the restriction: the cancellation uses inclusiveness over the hadronic final state. A
  cross section with a restriction on that final state at the hadronic scale is outside the
  theorem; Layer 7.1 is the case in point.

### 4.4 The transverse-momentum-dependent statement and the past-pointing line

- Statements to prove:
  - With the pair's transverse momentum `qT ≪ Q` observed, the cancellation of 4.3 still holds:
    the sum over cuts of the spectator subgraphs at fixed `qT` is unrestricted.
  - **Theorem.** The cross section factorises as a hard factor times the product in transverse
    position space of two transverse-momentum-dependent distributions with the soft factor
    absorbed as in 3.4, with `ApproximatesToOrder` of order one in `qT/Q`.
  - The eikonal lines produced by the soft and collinear approximations after the deformation of
    4.3 run from the past: `TmdProcess.drellYan.linkDirection = past`. The hard factor is the
    analytic continuation of that of Layer 3 from space-like to time-like `Q²`, and the relation
    between the two is computed at one loop.

### 4.5 The sign change

- **Theorem.** Let `f d` be a transverse-momentum-dependent distribution as a function of the
  Wilson-line direction `d`. `TransverseMomentumDistributions` Layer 1.4 proves, from parity and
  time-reversal invariance, that the two time-reversal-odd functions satisfy
  `f d.reverse = -f d` and the six time-reversal-even ones `f d.reverse = f d`. Since
  `TmdProcess.drellYan.linkDirection = TmdProcess.sidis.linkDirection.reverse` by 3.2 and 4.4,
  the Sivers and Boer–Mulders functions entering the theorem of 4.4 are minus those entering the
  theorem of 3.3, and the other six are equal.
- State the logical status exactly. The hypotheses are: the theorems of 3.3 and 4.4, which are
  theorems of this roadmap; time-reversal and parity invariance of the strong interaction; and
  `SoftHadronVertex`. Region completeness and Glauber cancellation are no longer hypotheses. A
  measurement inconsistent with the sign change is therefore inconsistent with one of:
  perturbation theory to the order considered, the two discrete symmetries, or the hadron
  hypothesis. This is the statement `TransverseMomentumDistributions` Layer 5.4 and
  `ElectroweakAndBSM` Layer 5.5 use.

### 4.6 Universality of the collinear densities

- **Theorem.** The density appearing in the theorem of 4.3 for a given hadron and flavour is the
  same function as the one appearing in the theorem of 1.4: both are the matrix element of the
  same light-ray operator in the same scheme, the direction of the Wilson line being immaterial
  for the transverse-momentum-integrated operator because the two staples differ by a transverse
  link at light-cone infinity that reduces to the identity after integration. This is the
  theorem `ElectroweakAndBSM` Layer 5.4 states with factorisation of both processes as
  hypotheses.
- Statements to prove: the transverse-momentum integral of the distribution of 4.4 and that of
  3.3 give the same collinear density at each order, with the ultraviolet subtraction of
  `TransverseMomentumDistributions` Layer 4; hence the sign change of 4.5 is invisible in every
  collinear observable.

### Examples

- The one-loop spectator–spectator graph of 4.2 in a scalar-diquark model: its two cuts
  individually, each with a leading Glauber contribution, and their sum, in which it cancels.
- The same model's Sivers function computed with each Wilson-line direction, exhibiting the
  sign.
- The ratio of the time-like to the space-like one-loop hard factor.
- Counterexample-shaped: the model cross section with a veto on spectator transverse momentum,
  for which the sum over cuts is restricted and the Glauber term survives.
- Counterexample-shaped: a time-reversal-even function, for which the two directions agree,
  showing that the sign is not a property of the process alone.

### Dependencies

Layers 0, 1 and 3. `EpsilonEridani.Particles.Parton.TMD.PowerCorrections`,
`EpsilonEridani.Particles.Parton.TMD.CollinsSoper`. From `FeynmanIntegrals`: Layer 7 for the
unitarity identity on the spectator subgraphs. From `Renormalization`: Layer 5. From
`InfraredStructure`: Layers 2, 3, 5, 6 and 7. From `TransverseMomentumDistributions`: Layers 1.3,
1.4 and 4.

---

## Layer 5: hard exclusive processes

References: Collins and Freund, *Phys. Rev. D* **59** (1999) 074009; Collins, Frankfurt and
Strikman, *Phys. Rev. D* **56** (1997) 2982; Lepage and Brodsky, *Phys. Rev. D* **22** (1980) 2157;
Efremov and Radyushkin, *Phys. Lett. B* **94** (1980) 245; Ji and Osborne, *Phys. Rev. D* **58**
(1998) 094018.

### 5.1 Amplitude-level factorisation

- Define `AmplitudeFactorized A Aapp Λ p` for complex amplitudes as functions of the hard scale,
  and the convolution of a hard kernel that is a distribution in the momentum fraction — with an
  `iε` prescription — against a generalised parton distribution or a distribution amplitude,
  over `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Convolution.Basic`.
- Statements to prove: the pairing is well defined when the non-perturbative function is
  continuous at the points where the kernel is singular, with the counterexample when it is
  not; the amplitude-level statement implies the cross-section-level statement with the same
  power; no sum over final states is available, so every cancellation used in Layers 1 to 4
  that relied on one is unavailable and each step is re-proved at amplitude level.

### 5.2 Deeply virtual Compton scattering

- Statements to prove:
  - The leading regions of the amplitude are a hard subgraph with both photon vertices and a
    collinear subgraph in the target direction, with soft exchanges between the hard subgraph's
    external collinear lines; there is no final-state jet at leading power.
  - The soft region is power suppressed for this amplitude after the collinear lines are
    contracted to the hard subgraph, and the contour can be deformed out of the Glauber region
    and out of the region where a collinear line becomes soft at `x = ±ξ`, where the deformation
    is what requires continuity of the distribution there.
  - **Theorem.** The amplitude satisfies `AmplitudeFactorized` with remainder power one in
    `Λ/Q`, with hard kernel the subtracted hard subgraph and non-perturbative function the
    matrix element of the off-forward light-ray operator, the generalised parton distribution
    of `EpsilonEridani.Particles.Parton.GPD.Basic`. Hadronic given `SoftHadronVertex` for the
    incoming and outgoing target. This is the all-orders statement
    `GeneralizedPartonDistributions` Layer 3.2 imports as a hypothesis.
  - The order-zero hard kernel is the one of that layer, with its principal-value and delta
    parts; `IsCFFConvolutionAtScale` of
    `EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVCS.Basic` is the order-zero instance.
  - The evolution kernel of the generalised distribution is the off-forward anomalous dimension
    of the same light-ray operator as in 1.5, reducing to the kernel of 1.5 in the forward limit
    and to the kernel of 5.5 at `ξ = 1`.

### 5.3 Meson production by longitudinal photons

- **Theorem.** For a longitudinally polarised virtual photon, the amplitude for production of a
  meson factorises as a hard kernel convoluted with a generalised parton distribution and with
  the meson's leading-twist distribution amplitude, with remainder power one relative to the
  leading term, which itself falls by one power of `Q` relative to 5.2.
- Statements to prove: the leading regions have a second collinear subgraph in the meson
  direction; the endpoint region, in which a quark of the meson carries a vanishing momentum
  fraction, is power suppressed for longitudinal polarisation given that the distribution
  amplitude vanishes at the endpoints at least linearly, which is a stated hypothesis on the
  amplitude and is proved for its asymptotic form; the convolution integral at order zero
  converges under that hypothesis.

### 5.4 Transversely polarised photons

- **Theorem (failure at leading power).** For a transversely polarised photon the order-zero
  hard kernel behaves as the inverse square of the quark momentum fraction at the endpoint, and
  its convolution with any distribution amplitude vanishing linearly there diverges
  logarithmically. Hence no statement of the form of 5.3 holds for the transverse amplitude with
  leading-twist functions.
- State the consequence without embellishment: the ratio of longitudinal to transverse cross
  sections is not predicted by the theorems of this layer, and treatments of the transverse
  amplitude with a transverse-momentum cut-off or twist-three functions are models whose status
  is recorded in Layer 7.3.

### 5.5 The meson form factor

- **Theorem.** The space-like electromagnetic form factor of a pseudoscalar meson at large
  momentum transfer equals the double convolution of two distribution amplitudes with a hard
  kernel, the leading term falling as `1/Q²`, with a relative remainder suppressed by one power
  of `Λ/Q` up to logarithms. Hypotheses: `SoftHadronVertex` for each meson, and the endpoint
  condition of 5.3 on the distribution amplitude.
- Statements to prove: the leading regions; the suppression of the endpoint region under the
  endpoint condition, with the Sudakov suppression of `InfraredStructure` Layer 7 stated as the
  mechanism that makes the suppression hold beyond the asymptotic amplitude; the order-zero
  kernel; the evolution kernel of the distribution amplitude as the generator of
  `MesonStructure` Layer 2.3. This is the proposition `MesonStructure` Layer 3.4 names.
- State that the theorem says nothing about the momentum transfer at which the leading term
  dominates, which is the question `MesonStructure` treats separately.

### 5.6 The photon–meson transition form factor

- **Theorem.** With one photon at large space-like virtuality and one real, the transition form
  factor times the virtuality equals a single convolution of a hard kernel with the
  distribution amplitude, with remainder power two. The proof is the operator product expansion
  of two currents of `Renormalization` Layer 6 between the vacuum and the meson, and takes no
  endpoint condition at leading order. This is the limit `MesonStructure` Layer 4.3 uses.

### Examples

- The order-zero Compton hard kernel paired with a test distribution continuous at `x = ξ`, and
  the same pairing with a distribution discontinuous there, which diverges.
- The integrals `∫ z(1 - z)/z dz` and `∫ z(1 - z)/z² dz` on `(0, 1]`: the first converges, the
  second does not; these are the longitudinal and transverse endpoint integrands.
- The asymptotic distribution amplitude inserted in 5.6, giving twice the decay constant.
- Counterexample-shaped: a distribution amplitude constant on `[0, 1]`, for which the
  longitudinal integral of 5.3 also diverges, showing that the endpoint hypothesis is used.

### Dependencies

Layers 0 and 1. `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Convolution.Basic`,
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVCS.Basic`,
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Basic`,
`EpsilonEridani.Particles.Parton.GPD.Basic`,
`TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic`,
`Mathlib.Analysis.Distribution.TemperedDistribution`. From `Renormalization`: Layers 5 and 6. From
`InfraredStructure`: Layers 2, 3, 5, 6 and 7. From `GeneralizedPartonDistributions`: the
distributions and Compton form factors. From `MesonStructure`: the distribution amplitudes.

---

## Layer 6: diffractive scattering, twist three, and event shapes

References: Collins, *Phys. Rev. D* **57** (1998) 3051, erratum **61** (2000) 019902; Qiu and
Sterman, *Phys. Rev. Lett.* **67** (1991) 2264, *Nucl. Phys. B* **378** (1992) 52 and *Phys. Rev. D*
**59** (1999) 014004; Vogelsang and Yuan, *Phys. Rev. D* **79** (2009) 094010; Catani, Trentadue,
Turnock and Webber, *Nucl. Phys. B* **407** (1993) 3; Korchemsky and Sterman, *Nucl. Phys. B*
**555** (1999) 335.

### 6.1 Diffractive deep-inelastic scattering

- **Theorem.** For each `(ξ, t)` in the diffractive region, the perturbative diffractive
  structure functions satisfy `FactorizesToAllOrders` in the variable `β` with remainder power
  two, with the coefficient functionals of Layer 1.4 — the same objects, independent of `ξ` and
  `t` — and with densities the matrix elements of the light-ray operator of 1.4 with the
  identified target-like system in the final state. This is the general theorem of
  `Diffraction` Layer 2.3.
- Statements to prove: the proof of 1.3 uses the final state of the target-collinear subgraph
  only through inclusiveness over what is attached to the hard subgraph; a restriction on the
  target-collinear final state commutes with every step; soft exchanges between the hard
  subgraph's final state and the target remnant are deformed out of the Glauber region as in
  1.3 because the final-state lines are the only ones crossing, which is the step that fails in
  Layer 7.1. The relation to 2.5 is that a diffractive density is a fracture function in a
  restricted kinematic range, and this is proved.
- Hadronic given `SoftHadronVertex` applied to the vertex with the identified system detached.

### 6.2 Twist-three collinear factorisation

- State the formula of `MultiPartonCorrelations` Layer 5.2 as a proposition of the kind of 0.3,
  with the twist-three correlators as the non-perturbative functions and remainder one further
  power of `Λ/Q` beyond the twist-three term.
- **Status.** No all-orders proof of this formula exists in the literature. What is established
  is the order-zero formula and, for specific weighted cross sections, the consistency at one
  loop between the collinear divergences of the hard part and the evolution kernel of the
  correlators.
- Statements to prove, and these are the whole of the target for this subsection:
  - The order-zero formula, from the collinear expansion of the hard subgraph to first order in
    the transverse momentum of the parton lines, with the gauge-invariant combination into
    field-strength correlators obtained from the Ward identity of `InfraredStructure` Layer 5.
  - The derivative term and the soft-gluon pole of `MultiPartonCorrelations` Layer 5.3 from the
    same expansion.
  - At one loop, for the transverse-momentum-weighted Drell–Yan cross section, the collinear
    poles of the hard part equal the convolution of the order-zero hard part with the one-loop
    evolution kernel of `MultiPartonCorrelations` Layer 3.2.
  - The region analysis of `InfraredStructure` Layers 2 and 3 for this observable: the leading
    regions at the twist-three level are listed, and the region in which the gluon of the
    three-parton correlator becomes soft is identified as the one on which an all-orders
    argument would have to act.
- The all-orders proposition is entered in the ledger of 7.3 with the status "proved at fixed
  order only", and no theorem of this roadmap takes it as a hypothesis.

### 6.3 Event shapes

- For thrust in annihilation and for the current-hemisphere thrust in the Breit frame of
  `JetsAndEventShapes` Layer 1, in the two-jet limit `τ → 0`:
  - **Theorem.** The distribution in `τ` is, at leading power in `τ`, a hard factor times the
    convolution in `τ` of two jet functions and a soft function in annihilation, and of a jet
    function, a beam function and a soft function in deep-inelastic scattering, the beam
    function being the convolution of a coefficient functional with the density of 1.4. The
    functions are those of `InfraredStructure` Layer 7.
  - Statements to prove: the leading regions; the absence of a Glauber obstruction in both
    processes, as in 1.3; the renormalisation-group equations of the three functions and their
    consistency, the sum of the anomalous dimensions vanishing; and that the solution of those
    equations is the exponentiated form of `JetsAndEventShapes` Layer 4.3 with the radiator
    fixed by the cusp anomalous dimension of `Renormalization` Layer 5.
  - The hypothesis `JetsAndEventShapes` Layer 4.3 names, recursive infrared and collinear
    safety, is proved for thrust there; the statement here is that for thrust the exponentiation
    is a consequence of the factorisation theorem.
- The singular factorisation of real-emission matrix elements in the soft and collinear limits
  that `JetsAndEventShapes` Layer 0.5 takes as data is `InfraredStructure` Layer 5 and is not
  restated here.

### Examples

- The order-zero diffractive formula `F₂^{D(4)} = Σ_a e_a² β D_a`, as the instance of 6.1 with
  `deltaAtOne` coefficient functionals.
- The order-zero twist-three hard part for the weighted Drell–Yan cross section.
- The one-loop thrust jet and soft functions and the check that the anomalous dimensions sum to
  zero.
- Counterexample-shaped: a pair of diffractive densities with `ξ`-dependent coefficient
  functionals reproducing the same structure function, showing as in `Diffraction` Layer 2.3
  that the independence is the content.
- Counterexample-shaped: a non-global observable, energy flow into a patch away from the jets,
  for which the soft function is not a function of one variable and the theorem of 6.3 does not
  apply.

### Dependencies

Layers 0, 1, 2 and 4. From `Renormalization`: Layer 5. From `InfraredStructure`: Layers 2 to 7.
From `Diffraction`: Layers 0 to 2. From `MultiPartonCorrelations`: Layers 2, 3 and 5. From
`JetsAndEventShapes`: Layers 0, 1, 3 and 4.

---

## Layer 7: where factorisation fails, and the hypothesis ledger

References: Collins, Frankfurt and Strikman, *Phys. Lett. B* **307** (1993) 161; Collins and Qiu,
*Phys. Rev. D* **75** (2007) 114014; Rogers and Mulders, *Phys. Rev. D* **81** (2010) 094006;
Nayak, Qiu and Sterman, *Phys. Rev. D* **72** (2005) 114012; Ma and Qiu, *Phys. Rev. Lett.* **120**
(2018) 022003; Izubuchi, Ji, Jin, Stewart and Zhao, *Phys. Rev. D* **98** (2018) 056004.

### 7.1 Hard diffraction in hadron–hadron collisions

- **Theorem.** Consider production of a hard system in the collision of two hadrons with one
  hadron required to survive intact. In the scalar-spectator model of Layer 4, the one-loop
  graph with a Glauber exchange between the spectator of the surviving hadron and the active
  or spectator lines of the other hadron contributes at leading power, and the requirement that
  the hadron survive restricts the sum over cuts so that the cancellation of 4.3 does not occur.
  Consequently there are no diffractive densities, in the sense of 6.1, for which the cross
  section is the convolution with the coefficient functionals of 4.3.
- Statements to prove: the leading-power contribution of the graph, as an explicit integral;
  the non-cancellation, by exhibiting the cut that the survival requirement excludes; and that
  the same graph with the surviving hadron replaced by a lepton has no such exchange, which is
  why 6.1 holds. This is the mechanism `Diffraction` Layer 2.6 describes, as a theorem.
- The gap survival factor of `Diffraction` is then the ratio of the cross section to the
  factorised expression, and the theorem says it is not identically one in the model.

### 7.2 Transverse-momentum-dependent factorisation in hadroproduction of hadrons

- **Theorem.** For production of two nearly back-to-back hadrons or jets in a hadron–hadron
  collision, with their transverse-momentum imbalance observed, consider the graphs in which
  one gluon is exchanged between a spectator of each incoming hadron and the active partons.
  The colour factor of the sum is not the product of the colour factors obtained by attaching
  each gluon to a Wilson line associated with one hadron alone. Consequently there is no
  assignment of a Wilson-line structure to each hadron separately for which the cross section
  is a hard factor times a product of single-hadron transverse-momentum-dependent functions.
- Statements to prove: the colour algebra, with the structure constants and Casimirs of
  `EpsilonEridani.QFT.QCD`; the kinematic statement that the two exchanges are both pinched in
  the Glauber region and neither cancels, because the final state is neither all-colour-singlet
  as in Layer 4 nor free of initial-state spectators as in Layer 3; and the algebraic core: a
  kernel with two independent colour channels is not a product of a function of each hadron's
  variables.
- State the scope of the failure precisely. It concerns the transverse-momentum-dependent
  statement for this class of processes. Collinear factorisation for the same processes with
  the imbalance integrated is the hadron–hadron analogue of 4.3, whose proof goes through with
  final-state jets cancelling as in 1.3, and is stated as a theorem here for single-inclusive
  jet production.

### 7.3 The hypothesis ledger

Each row is a factorisation statement that another roadmap states as a hypothesis, a conditional
theorem, an unproved target or a cited theorem. The status is one of: **all orders** — proved in
the cited layer of this roadmap to all orders in perturbation theory, with no hadronic input;
**all orders + H** — proved in the cited layer to all orders, with `SoftHadronVertex` as the only
hypothesis; **fixed order** — proved in the cited layer at the stated order only, no all-orders
proof existing; **unproved** — remains a hypothesis, no all-orders proof existing in the
literature; **model** — a model assumption, not derivable in QCD perturbation theory; **QED** — a
QED statement owned and proved elsewhere. The ledger is realised as the function
`LedgerEntry.status` on a finite type.

| Roadmap | Layer | Statement as named there | Status | Where |
| --- | --- | --- | --- | --- |
| `InclusiveStructureFunctions` | 4.2 | scale independence of `C · A` in `OPEData` | all orders | 1.2 |
| `InclusiveStructureFunctions` | 4.2 | convergence of the sum over twist | unproved | — |
| `CollinearEvolution` | 5.5 | the factorisation hypothesis | all orders + H | 1.4, 1.5 |
| `NuclearPartonDistributions` | 4.1 | target independence of the kernel | all orders + H | 1.4, 1.5 |
| `NuclearPartonDistributions` | 3.2 | nucleon-convolution representation | model | — |
| `SpinStructure` | 1.2 | leading-power form of `g₁` | all orders + H | 1.6 |
| `TransverseMomentumDistributions` | 2.1, 2.4 | region completeness | all orders | 3.1 |
| `TransverseMomentumDistributions` | 2.4 | Glauber cancellation | all orders | 3.1 |
| `TransverseMomentumDistributions` | 2.4 | eikonal validity; power counting | all orders | 3.3 |
| `TransverseMomentumDistributions` | 5.4 | Sivers and Boer–Mulders sign change | all orders + H | 4.5 |
| `TransverseMomentumDistributions` | 4 | matching to the collinear formula | all orders + H | 3.6 |
| `Hadronization` | 1.1 | collinear semi-inclusive formula | all orders + H | 2.3 |
| `Hadronization` | 5.2 | extended statement with fracture functions | all orders + H | 2.5 |
| `Hadronization` | 3 | transverse-momentum-dependent fragmentation | all orders + H | 3.3, 3.5 |
| `Hadronization` | 3.4 | universality of the Collins function | all orders | 3.5 |
| `GeneralizedPartonDistributions` | 3.2 | all-orders Compton factorisation | all orders + H | 5.2 |
| `GeneralizedPartonDistributions` | 3.7 | meson production, longitudinal photon | all orders + H | 5.3 |
| `GeneralizedPartonDistributions` | 3.7 | meson production, transverse photon | fails at leading power | 5.4 |
| `Diffraction` | 2.3 | general diffractive factorisation theorem | all orders + H | 6.1 |
| `Diffraction` | 2.6 | failure for hadron–hadron diffraction | proved as a failure | 7.1 |
| `Diffraction` | 3.1 | Regge factorisation | model | — |
| `Diffraction` | 6.1 | dipole–collinear matching | unproved | — |
| `ElectroweakAndBSM` | 5.4 | universality between lepton–hadron and hadron–hadron | all orders + H | 4.6 |
| `ElectroweakAndBSM` | 5.5 | transverse-momentum sign reversal | all orders + H | 4.5 |
| `LatticeBridge` | 2.3, 3.3 | matching and short-distance factorisation | all orders | 1.7 |
| `MesonStructure` | 3.4 | hard-scattering factorisation of the form factor | all orders + H | 5.5 |
| `MesonStructure` | 4.3 | large-virtuality transition form factor | all orders | 5.6 |
| `MesonStructure` | 6.3 | Sullivan factorisation | model | — |
| `MultiPartonCorrelations` | 5.2 | twist-three collinear formula | fixed order | 6.2 |
| `MultiPartonCorrelations` | 6.5 | pocket formula's product hypothesis | model | — |
| `JetsAndEventShapes` | 4.3 | exponentiation for thrust | all orders | 6.3 |
| `JetsAndEventShapes` | 0.5 | soft and collinear limits of real emission | all orders | `InfraredStructure` 5 |
| `QuarkoniaAndExotics` | 2.2, 2.3 | colour-singlet and NRQCD production | unproved | — |
| `SmallXAndSaturation` | 6.5 | `IsHybridFactorised` | unproved | — |
| `SmallXAndSaturation` | 3.1, 5.4 | `IsMeanField` | model | — |
| `HadronMassAndEnergyMomentumTensor` | 5.4 | threshold quarkonium photoproduction | unproved | — |
| `WignerDistributions` | 5.5 | processes proposed to measure generalised TMDs | unproved | — |
| `Photoproduction` | 3.3 | dipole amplitude equals deeply virtual amplitude | unproved | — |
| `Photoproduction` | 2.3 | vector-meson dominance | model | — |
| `LightNuclei` | 4.5 | contact factorisation | model | — |
| `NuclearMedium` | 0.4 | `FactorisationHypothesis` (initial × final) | model | — |
| `Photoproduction` | 0.3 | equivalent-photon approximation | QED | `Photoproduction` 0.3 |
| `RadiativeCorrections` | 0.4 | `mass_singularity_factorisation` | QED | `RadiativeCorrections` 0.4 |

Notes that fix the meaning of individual rows:

- *Convergence of the sum over twist.* The operator product expansion of `Renormalization` Layer
  6 is an asymptotic expansion in the inverse hard scale at each order. Nothing here or there
  asserts convergence of the sum over twist for a hadronic matrix element.
- *NRQCD production.* The infrared cancellation between channels has been verified at two loops
  with a gauge-completed definition of the octet matrix elements; an all-orders proof is not
  available. `QuarkoniaAndExotics` carries `ProductionFactorisation` as an explicit proposition
  and continues to.
- *`IsHybridFactorised`.* Verified at one loop in the literature, with a subtraction of the
  rapidity divergence whose kinematic constraint is scheme dependent; no all-orders proof.
- *Threshold quarkonium photoproduction.* Whether the amplitude near threshold is governed by
  the gluon gravitational form factors is contested; neither a proof nor a disproof is
  available, as `HadronMassAndEnergyMomentumTensor` Layer 5.4 records.
- *Generalised transverse-momentum-dependent processes.* The leading-order functionals of
  `WignerDistributions` Layer 5.5 are constructions; that the measured cross sections equal them
  beyond leading order is not established for any of the proposed processes.
- *Model rows.* Regge, Sullivan, contact, nucleon-convolution, product and mean-field statements
  concern non-perturbative or many-body structure and are not consequences of any region
  analysis. Their owning roadmaps treat them as hypotheses and prove what follows from them;
  nothing here changes that.
- *The transverse-photon row* is the only one whose status is a proved negative for a statement
  another roadmap might be read as wanting; `GeneralizedPartonDistributions` restricts its claim
  to longitudinal photons, consistently with 5.4.

### 7.4 What the ledger establishes

- Statements to prove: `LedgerEntry.status` is total; the set of entries with status **all
  orders** or **all orders + H** is exactly the set for which a theorem of Layers 1 to 6 has the
  entry's statement as its conclusion, each such theorem being named in a docstring on the
  constructor; no theorem of Layers 1 to 6 takes as a hypothesis any entry whose status is
  **unproved** or **model**.
- For each **all orders + H** row, the theorem obtained by supplying this roadmap's result to
  the conditional theorem of the owning roadmap is stated: the owning roadmap's conclusion with
  `SoftHadronVertex` in place of its factorisation hypothesis.

### Examples

- The explicit one-loop graph of 7.1 in the scalar-spectator model, with the excluded cut
  marked.
- The colour factors of 7.2 for quark–quark scattering: the two-channel kernel written out and
  the determinant that certifies it is not a product.
- The kernel `1 + x y` on `ℝ²`, proved not to be a product `a(x) b(y)`: the algebraic core of
  7.2 in its simplest instance.
- Counterexample-shaped: a ledger entry moved from **model** to **all orders** without a
  theorem, rejected by the check of 7.4.

### Dependencies

Layers 0 to 6. `EpsilonEridani.QFT.QCD.Basic`, `EpsilonEridani.QFT.QCD.SUNStructureConstants` and
`EpsilonEridani.QFT.QCD.CasimirDerivation` for the colour algebra of 7.2. From `FeynmanIntegrals`:
Layer 7. From `InfraredStructure`: Layer 6. Each roadmap named in the ledger, for the statement of
its row.

---

## Dependency graph

```
 FeynmanIntegrals ---> Renormalization ---> InfraredStructure
        |                     |                     |
        +---------------------+---------------------+
                              |
                              v
  Layer 0  framework: coefficient functionals, the factorisation
           proposition, SoftHadronVertex
                              |
                              v
  Layer 1  inclusive DIS: OPE route, diagrammatic route, equivalence,
           scale independence, Ioffe-time factorisation
                |                             |
                v                             v
  Layer 2  annihilation, collinear       Layer 5  hard exclusive:
           SIDIS, fracture functions              DVCS, meson production,
                |                                 form factors
                v
  Layer 3  TMD factorisation: SIDIS, back-to-back annihilation
                |
                v
  Layer 4  Drell-Yan: Glauber cancellation, past-pointing line,
           sign change, universality
                |
                v
  Layer 6  diffractive DIS, twist three, event shapes
                |
                v
  Layer 7  failures; the hypothesis ledger  <--- every other roadmap
```

Layer 0 needs only the existing convolution modules and the definitions of the three sibling
roadmaps. Layer 1 is the first to use all three. Layers 2 and 5 depend on Layer 1 and not on each
other. Layer 3 needs Layer 2 for the collinear formula it is matched to. Layer 4 needs Layer 3 for
the comparison of Wilson-line directions and Layer 1 for the densities. Layer 6 uses Layer 1 for
its coefficient functionals, Layer 2 for fracture functions and Layer 4 for the weighted
Drell–Yan cross section. Layer 7 depends on all of them, and its ledger refers to every roadmap
that states a factorisation hypothesis.

## Acceptance examples

The roadmap is complete when the following are statements in EpsilonEridani with proofs, or, where
marked, with `SoftHadronVertex` as an explicit hypothesis:

1. `convolve (deltaAtOne c) f x = c * f x`; the embedding theorem relating `ofRegular` to
   `Convolution.convolveAt`; and the theorem that no integrable kernel represents `deltaAtOne c`
   for `c ≠ 0`.
2. The moments of the one-loop quark coefficient functional of `F₂`, computed from
   `plusOneMinus_pow`, and their equality with the one-loop Wilson coefficients.
3. `IsLOFactorized` proved to be the order-zero, regular-kernel instance of
   `FactorizesToAllOrders`.
4. Inclusive deep-inelastic factorisation to all orders with remainder power two, partonic
   without hypothesis and hadronic given `SoftHadronVertex`, with coefficient functionals proved
   independent of the target.
5. The equivalence theorem: moments of the diagrammatic coefficient functionals are the Wilson
   coefficients, and moments of the light-ray matrix element are the twist-two reduced matrix
   elements.
6. `IsFactorizationScaleIndependent` for the two-scale structure function proved with the
   compensation identity derived from the renormalisation-group equation of the light-ray
   operator, not assumed.
7. The explicit vertex function satisfying `SoftHadronVertex` and the constant vertex violating
   it, with the failure of the hadronic theorem for the latter.
8. Collinear semi-inclusive factorisation with the same density as in item 4 and the same
   fragmentation function as in single-inclusive annihilation, reducing at order zero to
   `sidisStructureFunction`.
9. Transverse-momentum-dependent factorisation for semi-inclusive scattering as
   `ApproximatesToOrder` of order one, with region completeness and the Glauber deformation
   proved, and the resulting `sidis_factorization` of `TransverseMomentumDistributions` with its
   four hypothesis arguments supplied.
10. The one-loop spectator–spectator Drell–Yan graph: a leading Glauber contribution in each cut,
    and its cancellation in the sum.
11. Drell–Yan factorisation, collinear and transverse-momentum-dependent, to all orders, with
    `TmdProcess.drellYan.linkDirection = TmdProcess.sidis.linkDirection.reverse`.
12. The sign-change theorem for the Sivers and Boer–Mulders functions with hypotheses exactly:
    time-reversal and parity invariance, and `SoftHadronVertex`.
13. Equality of the collinear density of the Drell–Yan theorem with that of the deep-inelastic
    theorem.
14. Compton-amplitude factorisation to all orders given `SoftHadronVertex`, with
    `IsCFFConvolutionAtScale` its order-zero instance.
15. The endpoint theorem: `z(1 - z)/z` integrable and `z(1 - z)/z²` not integrable on `(0, 1]`,
    and the resulting failure of the leading-power statement for transverse photons.
16. Diffractive factorisation with coefficient functionals definitionally those of item 4.
17. The order-zero twist-three formula and the one-loop pole-matching statement, with the
    all-orders proposition recorded as unproved and used by no theorem.
18. Thrust factorisation in annihilation with the vanishing of the sum of the three anomalous
    dimensions.
19. The two failure theorems of Layer 7, each with its explicit graph and counter-model.
20. `LedgerEntry.status` as a total function, the check of 7.4, and for each **all orders + H**
    row the owning roadmap's conditional theorem with its factorisation hypothesis discharged.

## References

- S. Aybat and T. C. Rogers, "TMD parton distribution and fragmentation functions with QCD
  evolution", *Phys. Rev. D* **83** (2011) 114042.
- G. Altarelli, R. K. Ellis, G. Martinelli and S.-Y. Pi, "Processes involving fragmentation
  functions beyond the leading order in QCD", *Nucl. Phys. B* **160** (1979) 301.
- W. A. Bardeen, A. J. Buras, D. W. Duke and T. Muta, "Deep-inelastic scattering beyond the
  leading order in asymptotically free gauge theories", *Phys. Rev. D* **18** (1978) 3998.
- G. T. Bodwin, "Factorization of the Drell-Yan cross section in perturbation theory", *Phys.
  Rev. D* **31** (1985) 2616; erratum **34** (1986) 3932.
- G. T. Bodwin, E. Braaten and G. P. Lepage, "Rigorous QCD analysis of inclusive annihilation
  and production of heavy quarkonium", *Phys. Rev. D* **51** (1995) 1125.
- S. J. Brodsky, D. S. Hwang and I. Schmidt, "Final-state interactions and single-spin
  asymmetries in semi-inclusive deep inelastic scattering", *Phys. Lett. B* **530** (2002) 99.
- S. Catani, L. Trentadue, G. Turnock and B. R. Webber, "Resummation of large logarithms in
  e⁺e⁻ event shape distributions", *Nucl. Phys. B* **407** (1993) 3.
- J. C. Collins, "Proof of factorization for diffractive hard scattering", *Phys. Rev. D* **57**
  (1998) 3051; erratum **61** (2000) 019902.
- J. C. Collins, "Leading-twist single-transverse-spin asymmetries: Drell-Yan and deep-inelastic
  scattering", *Phys. Lett. B* **536** (2002) 43.
- J. C. Collins, *Foundations of Perturbative QCD*, Cambridge University Press (2011).
- J. C. Collins, L. Frankfurt and M. Strikman, "Diffractive hard scattering with a coherent
  pomeron", *Phys. Lett. B* **307** (1993) 161.
- J. C. Collins, L. Frankfurt and M. Strikman, "Factorization for hard exclusive
  electroproduction of mesons in QCD", *Phys. Rev. D* **56** (1997) 2982.
- J. C. Collins and A. Freund, "Proof of factorization for deeply virtual Compton scattering in
  QCD", *Phys. Rev. D* **59** (1999) 074009.
- J. C. Collins and A. Metz, "Universality of soft and collinear factors in hard-scattering
  factorization", *Phys. Rev. Lett.* **93** (2004) 252001.
- J. C. Collins and J.-W. Qiu, "k_T factorization is violated in production of
  high-transverse-momentum particles in hadron-hadron collisions", *Phys. Rev. D* **75** (2007)
  114014.
- J. C. Collins and D. E. Soper, "Back-to-back jets in QCD", *Nucl. Phys. B* **193** (1981) 381.
- J. C. Collins and D. E. Soper, "Parton distribution and decay functions", *Nucl. Phys. B*
  **194** (1982) 445.
- J. C. Collins, D. E. Soper and G. Sterman, "Transverse momentum distribution in Drell-Yan pair
  and W and Z boson production", *Nucl. Phys. B* **250** (1985) 199.
- J. C. Collins, D. E. Soper and G. Sterman, "Factorization for short distance hadron-hadron
  scattering", *Nucl. Phys. B* **261** (1985) 104.
- J. C. Collins, D. E. Soper and G. Sterman, "Soft gluons and factorization", *Nucl. Phys. B*
  **308** (1988) 833.
- J. C. Collins, D. E. Soper and G. Sterman, "Factorization of hard processes in QCD", *Adv.
  Ser. Direct. High Energy Phys.* **5** (1989) 1, arXiv:hep-ph/0409313.
- G. Curci, W. Furmanski and R. Petronzio, "Evolution of parton densities beyond leading order:
  the non-singlet case", *Nucl. Phys. B* **175** (1980) 27.
- A. V. Efremov and A. V. Radyushkin, "Factorization and asymptotic behaviour of pion form
  factor in QCD", *Phys. Lett. B* **94** (1980) 245.
- R. K. Ellis, H. Georgi, M. Machacek, H. D. Politzer and G. G. Ross, "Perturbation theory and
  the parton model in QCD", *Nucl. Phys. B* **152** (1979) 285.
- H. Georgi and H. D. Politzer, "Electroproduction scaling in an asymptotically free theory of
  strong interactions", *Phys. Rev. D* **9** (1974) 416.
- M. Grazzini, L. Trentadue and G. Veneziano, "Fracture functions from cut vertices", *Nucl.
  Phys. B* **519** (1998) 394.
- D. J. Gross and F. Wilczek, "Asymptotically free gauge theories. I", *Phys. Rev. D* **8**
  (1973) 3633; "II", *Phys. Rev. D* **9** (1974) 980.
- T. Izubuchi, X. Ji, L. Jin, I. W. Stewart and Y. Zhao, "Factorization theorem relating
  Euclidean and light-cone parton distributions", *Phys. Rev. D* **98** (2018) 056004.
- X. Ji, J.-P. Ma and F. Yuan, "QCD factorization for semi-inclusive deep-inelastic scattering
  at low transverse momentum", *Phys. Rev. D* **71** (2005) 034005.
- X. Ji, J.-P. Ma and F. Yuan, "QCD factorization for spin-dependent cross sections in DIS and
  Drell-Yan processes at low transverse momentum", *Phys. Lett. B* **597** (2004) 299.
- X. Ji and J. Osborne, "One-loop corrections and all order factorization in deeply virtual
  Compton scattering", *Phys. Rev. D* **58** (1998) 094018.
- G. P. Korchemsky and G. Sterman, "Power corrections to event shapes and factorization",
  *Nucl. Phys. B* **555** (1999) 335.
- G. P. Lepage and S. J. Brodsky, "Exclusive processes in perturbative quantum chromodynamics",
  *Phys. Rev. D* **22** (1980) 2157.
- S. B. Libby and G. Sterman, "Jet and lepton-pair production in high-energy lepton-hadron and
  hadron-hadron scattering", *Phys. Rev. D* **18** (1978) 3252.
- Y.-Q. Ma and J.-W. Qiu, "Exploring partonic structure of hadrons using ab initio lattice QCD
  calculations", *Phys. Rev. Lett.* **120** (2018) 022003.
- A. Metz, "Gluon-exchange in spin-dependent fragmentation", *Phys. Lett. B* **549** (2002) 139.
- A. H. Mueller, "Cut vertices and their renormalization: a generalization of the Wilson
  expansion", *Phys. Rev. D* **18** (1978) 3705.
- G. C. Nayak, J.-W. Qiu and G. Sterman, "Fragmentation, NRQCD and NNLO factorization analysis
  in heavy quarkonium production", *Phys. Rev. D* **72** (2005) 114012.
- J.-W. Qiu and G. Sterman, "Single transverse spin asymmetries", *Phys. Rev. Lett.* **67**
  (1991) 2264; "Single transverse spin asymmetries in direct photon production", *Nucl. Phys. B*
  **378** (1992) 52; "Single transverse-spin asymmetries in hadronic pion production", *Phys.
  Rev. D* **59** (1999) 014004.
- T. C. Rogers and P. J. Mulders, "No generalized TMD-factorization in hadro-production of high
  transverse momentum hadrons", *Phys. Rev. D* **81** (2010) 094006.
- G. Sterman, "Mass divergences in annihilation processes. I. Origin and nature of divergences
  in cut vacuum polarization diagrams", *Phys. Rev. D* **17** (1978) 2773; "II. Cancellation of
  divergences in cut vacuum polarization diagrams", *Phys. Rev. D* **17** (1978) 2789.
- L. Trentadue and G. Veneziano, "Fracture functions: an improved description of inclusive hard
  processes in QCD", *Phys. Lett. B* **323** (1994) 201.
- W. Vogelsang and F. Yuan, "Next-to-leading order calculation of the single transverse spin
  asymmetry in the Drell-Yan process", *Phys. Rev. D* **79** (2009) 094010.
- W. Zimmermann, "Normal products and the short distance expansion in the perturbation theory
  of renormalizable interactions", *Ann. Phys.* **77** (1973) 570.

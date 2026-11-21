# Roadmap: renormalisation — subtraction of subdivergences, composite operators, gauge identities, and the operator product expansion

Perturbative renormalisation as a body of theorems about Feynman integrals: the combinatorics of
divergent subgraphs, the subtraction that makes every integral finite, the scale dependence that
subtraction introduces, the renormalisation of composite and non-local operators, the identities a
gauge symmetry imposes on all of it, and the short-distance expansion of a product of operators.

The development runs in one direction. First the combinatorial structure: which subgraphs of a
Feynman graph are divergent, how they nest, and the Hopf algebra those nestings generate. Then the
R-operation, which subtracts the divergences of every subgraph before the overall one, and the
theorem of Bogoliubov, Parasiuk, Hepp and Zimmermann that the result is finite and that the
subtractions are local — polynomials in the external momenta, hence counterterms in a Lagrangian.
Then minimal subtraction as one choice of subtraction, the finite transformations that relate any
two choices, and the renormalisation group: the beta function and the anomalous dimensions are read
off the simple poles of the counterterms, and the higher poles are determined by them. Then
composite operators, where renormalisation is a matrix and its structure — triangularity in the
dimension, the separation into gauge-invariant, BRST-exact and equation-of-motion operators, the
non-renormalisation of conserved currents — is what gives the anomalous dimensions of twist-two
operators their meaning. Then gauge theories, where the Slavnov–Taylor identities hold to all
orders and force the relations among renormalisation constants that make a single coupling
possible. Then Wilson lines and the light-ray operators built from them, whose ultraviolet
renormalisation produces the cusp anomalous dimension and the DGLAP kernel. Finally the operator
product expansion of Zimmermann: a product of two operators at short distance is a sum of local
operators with coefficient functions, to every order in the coupling, with a remainder bounded by a
stated power of the distance.

Everything here is perturbative: every theorem is a statement about a Feynman integral, about a
finite sum of them at a fixed order, or about a formal power series in the coupling whose
coefficients are such sums. No statement is made about the convergence of the perturbation series,
and none about a non-perturbatively constructed theory.

The application the roadmap is built towards is threefold. The one-loop beta coefficient, which
the code base at present obtains from a record of pole coefficients satisfying stated contracts, is
obtained instead from an integral that is proved to have that pole. The scale independence of the
product of a Wilson coefficient and a reduced matrix element, which `InclusiveStructureFunctions`
carries as a hypothesis on its `OPEData` record, becomes a theorem. And the statement that a parton
density has an operator definition whose scale dependence *is* the DGLAP equation — used throughout
the collection and proved nowhere — becomes a theorem about the renormalisation of a named
operator. `FactorizationTheorems` consumes all three.

## Scope

Included:

- Superficially divergent subgraphs, renormalisation parts, forests and their maximal elements, the
  contraction of a subgraph, and the overlap relation; the classification of overlapping,
  nested and disjoint pairs.
- The Hopf algebra of Feynman graphs of a renormalisable theory: the commutative algebra on
  one-particle-irreducible graphs, the coproduct over divergent subgraphs, coassociativity, the
  grading by loop number, connectedness, the antipode, the group of characters, and the Lie algebra
  of infinitesimal characters with its insertion pre-Lie product.
- The R-operation in its recursive and forest forms, the subtraction operator as data (Taylor
  subtraction at zero momentum, and pole-part subtraction in dimensional regularisation), and the
  identity of the two forms.
- The BPHZ theorem for Euclidean theories with strictly positive masses: absolute convergence of
  the renormalised integrand at every order; and its dimensionally regularised counterpart: the
  renormalised integral is holomorphic at the physical dimension.
- Locality: the overall counterterm of a graph whose subdivergences have been subtracted is a
  polynomial in external momenta and masses of degree at most the superficial degree of
  divergence; the equivalence of the forest formula, the Birkhoff decomposition of a character, and
  the Feynman rules of a Lagrangian with counterterms.
- The massless and Minkowski extensions with their additional hypotheses stated: infrared power
  counting at non-exceptional momenta, and the Lowenstein–Zimmermann scheme.
- Minimal subtraction and modified minimal subtraction, the scale `μ`, renormalisation schemes as
  characters, finite renormalisations, and the theorem that any two schemes differ by one.
- The renormalisation group: the beta function and anomalous dimensions as formal power series in
  the coupling determined by the residues of the counterterms, the pole equations fixing all higher
  poles, the Callan–Symanzik and renormalisation-group equations for renormalised Green functions,
  and the scheme dependence of the coefficients order by order.
- The derivation, from integrals, of the one-loop coefficients for QCD: the beta coefficient, the
  field anomalous dimensions and the quark-mass anomalous dimension.
- Composite operators: insertion into Green functions, the renormalisation matrix, triangularity
  in the canonical dimension, the anomalous-dimension matrix, non-renormalisation of conserved
  currents and of the total energy-momentum tensor, the three operator classes of a gauge theory and
  the block-triangular mixing among them, twist, and the twist-two operators of spin `n` with their
  anomalous dimensions.
- Gauge theories: the gauge-fixed Lagrangian, the BRST differential and its nilpotency, the
  Slavnov–Taylor identity for the generating functional and its preservation by dimensional
  regularisation and minimal subtraction to all orders, the Ward–Takahashi identities of QED as
  the abelian case, the relations among renormalisation constants, transversality of the vacuum
  polarisation, and gauge-parameter independence of physical quantities.
- Wilson lines: the path-ordered exponential as a formal power series in the coupling, eikonal
  Feynman rules, multiplicative renormalisation of smooth open and closed lines, the cusp anomalous
  dimension and its large-angle asymptotics, and the bilocal light-ray operator defining a parton
  density, with the theorem that its ultraviolet renormalisation kernel is the DGLAP kernel;
  its off-forward, vacuum-to-hadron and final-state matrix elements with their kernels; and the
  short-separation expansion of bilocal operators joined by Wilson lines.
- The operator product expansion in perturbation theory: normal products, the Zimmermann
  identities, Wilson coefficients, the expansion to every order with an explicit remainder bound,
  and the renormalisation-group equation for the coefficients.

Not included. Feynman graphs, the Symanzik polynomials, the parametric representation, the
superficial degree of divergence, Weinberg's convergence theorem, Hepp sectors, and dimensionally
regularised integrals as meromorphic functions of the dimension are `FeynmanIntegrals`, Layers 0 to
4; this roadmap consumes them and does not restate them. The derivation of Feynman rules from Wick's
theorem and the symmetry factors are `FeynmanIntegrals` Layer 6, and cut graphs are its Layer 7.
Infrared and collinear divergences, pinch surfaces, soft and collinear approximations, and the
infrared subtractions that parallel the ultraviolet ones built here are `InfraredStructure`; in
particular rapidity divergences of Wilson-line operators and the regulators that tame them are
`InfraredStructure` Layer 7, and this roadmap treats only the ultraviolet divergences of such
operators. The application of the operator product expansion to deep-inelastic scattering, and every
factorisation theorem for a cross section, is `FactorizationTheorems`; the expansion proved here is
a statement about operators. The splitting kernels in closed form, their Mellin moments in harmonic
sums, the solution theory of the evolution equation, the solution of the renormalisation-group
equation for the coupling and flavour thresholds are `CollinearEvolution`; this roadmap proves that
the anomalous dimension of a named operator *equals* a named object of that roadmap and does not
recompute the object. The energy-momentum tensor as an operator, its quark and gluon parts, their
mixing and the trace anomaly are `HadronMassAndEnergyMomentumTensor`; this roadmap supplies the
general theorems on conserved currents and operator mixing that its Layers 0.5 and 2.1 instantiate.
Evolution of twist-three correlators is `MultiPartonCorrelations`. The evolution kernel of
generalised parton distributions is `GeneralizedPartonDistributions`. The two-scale evolution of
transverse-momentum-dependent distributions is `TransverseMomentumDistributions`, which
characterises the cusp anomalous dimension by a consistency condition; this roadmap defines it from
a Wilson line and the identification of the two is `InfraredStructure` Layer 7. Renormalisation on a
lattice, regularisation-independent momentum schemes as used in lattice calculations, and the
conversion from them are `LatticeBridge`, which takes renormalised Euclidean matrix elements as
data. The flow of electroweak couplings is `ElectroweakAndBSM`, which builds it as a vector field
with stated one-loop coefficients; this roadmap proves nothing electroweak. Traces containing an odd
number of `γ₅` matrices — and with them the flavour-singlet axial current, the axial anomaly and
chiral gauge theories — are not in this roadmap and are owned by no roadmap in the collection:
every gauge theory treated here is vector-like, and `γ₅` appears only on open fermion lines, where
Convention 9 applies. The construction of an interacting quantum field theory, the summability of
the perturbation series, renormalons, and non-perturbative renormalisation are not here and no
theorem of this roadmap depends on them.

The material belongs in `EpsilonEridani/QFT/PerturbationTheory/Renormalization/`, with subtrees
`Forests/`, `HopfAlgebra/`, `BPHZ/`, `Schemes/`, `Group/`, `CompositeOperators/`, `Gauge/`,
`WilsonLines/` and `OPE/`. The algebraic material that is not specific to field theory — connected
graded bialgebras, Rota–Baxter algebras and the Birkhoff decomposition — belongs in
`EpsilonEridani/Mathematics/HopfAlgebra/`, written in the shape of `Mathlib.RingTheory.HopfAlgebra`.
The existing `EpsilonEridani/QFT/QCD/Renormalization.lean` and its one-loop companions stay where
they are; Layer 2 proves that their contracts are satisfied by the integrals built here.

## Conventions and coordination with upstream

1. **The dimension is `d = 4 − 2ε`** and the Lean name of the regulator is `eps`. The existing
   `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.regularizedDimension` is
   `4 − ε`, so the two regulators differ by a factor of two. The conversion is a single lemma in
   Layer 2.6, and it is the only place that factor appears. The trap this avoids is a beta
   coefficient wrong by a factor of two, which no dimensional or symmetry argument detects.
2. **The coupling in every power series is `a₄ = α_s/(4π) = g²/(16π²)`**, the normalisation of
   `CollinearEvolution` Convention 3, in which `β(a₄) = −β₀ a₄² − β₁ a₄³ − ⋯` and
   `β₀ = (11/3) C_A − (4/3) T_F n_f`, the value of `EpsilonEridani.QFT.QCD.beta0`. The trap this
   avoids is an anomalous dimension quoted in one normalisation and compared with a splitting-kernel
   moment in another; the kernel normalisation `α_s/(2π)` of `CollinearEvolution` Convention 2 is
   reached by its proved rescaling lemma and never silently.
3. **The beta function is the derivative with respect to `log μ²`**, `β(a₄) = d a₄ / d log μ²` at
   fixed bare coupling in four dimensions, and `μ` is the modified-minimal-subtraction scale unless
   a scheme argument says otherwise. The trap this avoids is the factor of two between
   `d/d log μ` and `d/d log μ²`, which changes every coefficient.
4. **The anomalous-dimension matrix `γ` of a family of renormalised operators is defined by
   `d [O]_i / d log μ² = Σ_j γ_{ij} [O]_j`**, with the sign such that the anomalous dimension of the
   twist-two operator of spin `n` is *plus* the Mellin moment of the splitting kernel at index `n`.
   The opposite sign, common where the equation is written for coefficient functions, is never
   used. The trap this avoids is a sign error that turns asymptotic freedom of the moments into
   growth.
5. **Spin `n` corresponds to Mellin index `N = n`** in the convention of
   `EpsilonEridani.QFT.Factorization.Convolution.mellinDis`, whose integrand is `x^(N−1) f(x)`, so
   the momentum sum rule is the spin-two operator.
   `EpsilonEridani.Particles.Parton.PDF.mellinMoment`
   uses `x^n f(x)` and is therefore shifted by one; any statement involving it carries the shift
   explicitly. The trap this avoids is identifying the energy-momentum tensor with the wrong moment.
6. **Subscripts on mixing matrices read "row operator expressed in column operators"**, and the
   quark–gluon entries are named so that `γ_{qg}` is the Mellin moment of `P_{qg}` in the
   "daughter inside parent" reading of `CollinearEvolution` Convention 5. The trap this avoids is
   the transposed matrix, which has the same eigenvalues and different eigenvectors.
7. **A subtraction operator is data.** The R-operation, the forest formula and the Hopf-algebraic
   decomposition are stated for an arbitrary subtraction operator satisfying named properties
   (the Rota–Baxter identity; for locality, compatibility with differentiation in external
   momenta), and each theorem lists the properties it uses. Minimal subtraction and zero-momentum
   Taylor subtraction are two instances. The trap this avoids is a finiteness theorem that is
   silently a theorem about one scheme.
8. **A renormalisation scheme is an explicit argument of every renormalised quantity**, and a
   scheme-independent statement is a theorem quantified over schemes. A scheme is never a
   typeclass and never a global default. The trap this avoids is a scheme-dependent number — a
   finite part, a two-loop coefficient — being quoted as a property of the theory.
9. **`γ₅` anticommutes with every `γ^μ` on open fermion lines, and no trace with an odd number of
   `γ₅` is taken anywhere in this roadmap.** The theorem that this prescription is consistent on
   that class of graphs is stated in Layer 4.6. The trap this avoids is importing the algebraic
   inconsistency of an anticommuting `γ₅` with a non-vanishing trace `tr(γ₅ γ^μ γ^ν γ^ρ γ^σ)` in
   `d ≠ 4`, from which any identity can be derived.
10. **Every hypothesis is a `Prop` argument.** Non-exceptional external momenta, strict positivity
    of masses, the Euclidean signature, renormalisability by power counting: each is a named
    proposition taken as an explicit argument by the theorems that use it. None is a typeclass and
    none is a structure field accompanied by a witness. The trap this avoids is a finiteness
    theorem that is quoted for massless Minkowski integrals while proved for massive Euclidean ones.
11. **An all-orders statement is a statement for every loop order `L : ℕ`**, proved by induction on
    `L` or on the number of renormalisation parts; equivalently a statement about every coefficient
    of a formal power series in `a₄`. Formal power series are `PowerSeries`; no analytic meaning is
    attached to their sum. The trap this avoids is reading "to all orders" as a statement about a
    function of the coupling.
12. **Operators are indexed, not constructed.** A local composite operator is an element of the
    free commutative (graded-commutative, for fermions and ghosts) algebra on the fields and their
    derivatives at a point, modulo nothing; equations of motion and total derivatives are imposed by
    named quotients only where a theorem says so. Its meaning is its family of Feynman rules for
    insertion into Green functions. The trap this avoids is treating two operators that differ by an
    equation-of-motion operator as equal inside a Green function at coincident points, where they
    are not.
13. **Wilson lines carry their path and their representation as data**, and a light-like, a
    time-like and a space-like direction are three different arguments with three different
    theorems. The trap this avoids is applying multiplicative renormalisability, which holds for
    smooth non-light-like paths, to a light-like segment, where it fails without a further
    regulator.
14. **Remainders are explicit.** The operator product expansion is stated as an equality with a
    remainder bounded by a named power of the distance times a named power of its logarithm at each
    loop order, in the vocabulary of `Asymptotics.IsBigO`. The symbol `~` and the phrase "up to
    higher twist" are not used in a statement. The trap this avoids is an expansion with no content
    because no bound was claimed.
15. Where this roadmap needs an object that is absent upstream, it builds it in the shape the
    upstream library would want and says where. It does not wait for an upstream change, and no
    milestone is contingent on one.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `QFT.PerturbationTheory.DimensionalRegularization.Basic`: `LaurentExpansionAtZero`, a record of a
  simple-pole coefficient, a finite part and a remainder function, with `poleCoeff`, `eval`,
  `principalPart`, `IsRegular` and `regularOfComplex`; `regularizedDimension`; and the two-valued
  tag `RenormalizationScheme` (`MS`, `MSBar`). The record has no multiplication and admits only a
  simple pole. Layer 2 proves that the Laurent expansion of a one-loop integral of
  `FeynmanIntegrals` Layer 4 is such a record, and builds the ring of Laurent expansions with poles
  of arbitrary order that products of renormalisation constants need.
- `QFT.PerturbationTheory.DimensionalRegularization.OneLoopScalars` and `.TensorReduction`:
  `ScalarMasterIntegral` with `masslessBubble`, `massiveBubble` and `tadpole`, each constructed from
  a supplied coefficient, and the isotropic rank-two reduction. The coefficients are arguments
  there; Layer 2.6 proves which values the integrals give.
- `QFT.QCD.Renormalization`: `RenormalizationConstants` (six Laurent records `zG`, `z3`, `z2`,
  `z1F`, `z1c`, `z3c`); `SlavnovTaylorAssumptions`, the two first-order pole relations
  `z_g = z_1F − z_2 − z_3/2` and `z_g = z_1c − z_3c − z_3/2` as hypotheses;
  `slavnovTaylor_vertexRatio_eq`; `MSLikeRenormalizationData`; `beta0FromCouplingPole`, which is
  `−2` times the coupling pole; and `Beta0RenormalizationAssumptions`, the contract that the pole is
  `−β₀/2`. There is no mass renormalisation constant and no mass anomalous dimension in this
  module. Layer 4.4 proves `SlavnovTaylorAssumptions` from the Slavnov–Taylor identity and Layer 2.6
  proves `Beta0RenormalizationAssumptions` for the constants computed from integrals.
- `QFT.QCD.Basic`: `ColorFactors`, `beta0`, `beta1`, `IsAsymptoticallyFree` and
  `beta0_suNColorFactors`. The coefficient derived in Layer 2.6 is proved equal to `beta0`.
- `QFT.QCD.OneLoopBeta`, `.OneLoopCounterterms`, `.OneLoopBetaFromScalars`,
  `.OneLoopNumeratorContractions` and `.OneLoopDiagrammaticBridge`: the assembly of `β₀` from
  `PrimitivePoles`, a record of four diagram-class pole contributions constrained by
  `PrimitivePoleAssumptions`; `beta0_from_oneLoopPoles`; the classification
  `QCDOneLoopBetaDiagramClass` of the contributing self-energy classes and
  `beta0_fromLoopIntegralData`. These establish that *if* the classes contribute the stated poles
  then `β₀` follows. Layer 2.6 supplies the antecedent.
- `QFT.QCD.CasimirDerivation`, `.SUNDerivation`, `.RepresentationColor` and
  `QFT.PerturbationTheory.FeynmanDiagrams.YangMillsGaugeData` for the colour factors as proved
  quantities, and `QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions` for the propagators and
  the `GaugeFeynmanRules` of the three gauge sectors.
- `QFT.Factorization.Convolution.Mellin`: `mellinDis` and the convolution theorem
  `mellinDis_convolveAt`. `QFT.Factorization.Evolution.Basic` and `.CollinearForm`:
  `SplittingKernel`, `dglapOperator` and `mellinDis_dglapOperator`.
  `QFT.Factorization.Evolution.MomentSpace`: `DglapMomentSystem`, whose field `gamma` is the
  anomalous-dimension matrix as a function of the Mellin index, with `momentSolution_unique` and
  `sumRule_conserved`. Layers 3.6 and 5.5 prove that the matrices derived from operator
  renormalisation are instances of that field.
- `QFT.Factorization.Evolution.Reciprocity`: `ReggeTrajectory`, `freeDimension`, the space-like
  anomalous dimension as a function of spin and the reciprocity relation to the time-like one. The
  twist and scaling dimension of Layer 3.5 are the objects that module's `freeDimension` and
  `dimension` take as input.
- `QFT.Factorization.Scales.Basic`: `IsFactorizationScaleIndependent` and
  `isFactorizationScaleIndependent_iff_dglap_compensation`, the form in which scale independence of
  a convolution is equivalent to a compensation between coefficient and density. Layer 6.5 states
  the renormalisation-group equation of the Wilson coefficients so that it is the moment-space
  instance of that compensation.
- `QFT.QCD.EnergyMomentumTensor.GluonPart`: `gluonPart`, `isSymm_gluonPart` and
  `trace_gluonPart`, the classical gluon tensor with its trace `(D/4 − 1) F²` in `D` dimensions.
  Layer 3.4 uses the `D`-dimensional trace as the example of an evanescent contribution.
- `Particles.Parton.TMD.CollinsSoper`: `TmdRgSystem`, `SatisfiesMuRg`, `SatisfiesZetaRg` and
  `CuspConsistent`, which takes a function `gammaCusp` as an argument. Layer 5.4 defines the
  function that argument is instantiated with.
- `Mathematics.Distribution.PlusFunctional` for the plus distribution in which the kernel of Layer
  5.5 is expressed.

From Mathlib:

- `Mathlib.RingTheory.Coalgebra.Basic`, `Mathlib.RingTheory.Bialgebra.Basic` (including the
  constructor `Bialgebra.mk'`) and `Mathlib.RingTheory.HopfAlgebra.Basic` (`HopfAlgebra`,
  `HopfAlgebra.antipode`, `HopfAlgebra.ofConvInverse`, `HopfAlgebra.ofAlgHom`) for the structures
  the graph algebra of Layer 0 is an instance of.
- `Mathlib.RingTheory.Coalgebra.Convolution`, `Mathlib.RingTheory.Bialgebra.Convolution` and
  `Mathlib.RingTheory.HopfAlgebra.Convolution` for the convolution product on `WithConv` of linear
  and algebra maps, the commutative monoid of algebra maps from a bialgebra into a commutative
  algebra, and the group structure on algebra maps out of a Hopf algebra with the antipode as
  inverse. The group of characters of Layer 0.5 is this group; it is not redefined.
- `Mathlib.RingTheory.Bialgebra.Primitive` and `Mathlib.RingTheory.HopfAlgebra.Primitive` for
  primitive elements, which are the primitive graphs of Layer 0.3.
- `Mathlib.Algebra.MvPolynomial.Basic` for the free commutative algebra on a type of generators,
  and `Mathlib.RingTheory.GradedAlgebra.Basic` for gradings.
- `Mathlib.RingTheory.LaurentSeries` and `Mathlib.RingTheory.HahnSeries.Basic` for formal Laurent
  series, the target algebra of dimensionally regularised characters; and
  `Mathlib.RingTheory.PowerSeries.Basic`, `.Derivative` and `.Order` for formal power series in the
  coupling.
- `Mathlib.Analysis.Meromorphic.Basic` (`MeromorphicAt`, `MeromorphicOn`),
  `Mathlib.Analysis.Meromorphic.Order` (`meromorphicOrderAt`) and
  `Mathlib.Analysis.Meromorphic.NormalForm` for the analytic meaning of a pole in the dimension and
  the passage from a meromorphic function to its Laurent coefficients.
- `Mathlib.Order.Antichain` and `Mathlib.Order.Preorder.Chain` for the order-theoretic vocabulary in
  which a forest is described.
- `Mathlib.Analysis.Asymptotics.Defs` for `IsBigO` in the remainder bounds of Layer 6.

From TauCeti:

- `TauCeti.Algebra.HopfAlgebra.Antipode`: `antipode_comul_antidistrib` and, for a commutative Hopf
  algebra, `antipode_antipode` and `antipodeAlgEquiv`. The graph algebra is commutative, so its
  antipode is an involutive algebra automorphism by these results.
- `TauCeti.Algebra.HopfAlgebra.Basic`: a bialgebra morphism between Hopf algebras preserves the
  antipode (`BialgHomClass.map_antipode`). Used for the morphisms between graph algebras induced by
  restricting the set of vertex types.
- `TauCeti.Algebra.Coalgebra.Convolution`: comultiplication as a convolution product of the two
  tensor inclusions, and the exterior product `LinearMap.mulTensor`. Used in the proof of
  coassociativity-level identities for the R-operation.
- `TauCeti.RingTheory.PowerSeries.Exp`, `.Log`, `.Order` and `.Evaluation` for the exponential and
  logarithm of formal power series, in which the solution of the pole equations and the
  path-ordered exponential are written.
- `TauCeti.Algebra.Lie.Derivation.Basic` for derivations of a Lie algebra, the home of the grading
  derivation on infinitesimal characters.

From Physlib:

- `Physlib.QFT.PerturbationTheory.FieldStatistics.Basic` and `.Koszul.KoszulSign` for the
  bosonic–fermionic grading and the sign of a permutation of graded fields. The BRST differential of
  Layer 4.1 is a graded derivation in that grading.
- `Physlib.QFT.PerturbationTheory.WickAlgebra.WicksTheorem`, reached through `FeynmanIntegrals`
  Layer 6, for the origin of the Feynman rules; this roadmap cites it only there.

What is absent upstream, and therefore built here:

- **No theorem that a connected graded bialgebra is a Hopf algebra.** Mathlib provides
  `HopfAlgebra.ofConvInverse` and the convolution monoid; the recursive construction of the
  antipode for a bialgebra graded by `ℕ` with one-dimensional degree-zero part is Layer 0.4.
- **No Rota–Baxter algebra and no Birkhoff decomposition.** Neither name occurs in Mathlib, TauCeti
  or Physlib in the algebraic sense. Layer 1.5 builds both.
- **No forest, no renormalisation part, no R-operation.** Layers 0 and 1.
- **No ring of Laurent expansions in the regulator with poles of arbitrary order tied to a
  function.** `LaurentExpansionAtZero` is a simple-pole record without multiplication, and
  `LaurentSeries` is formal. Layer 2.1 builds the map from a function meromorphic at `eps = 0` to
  its `LaurentSeries` and proves it a ring homomorphism.
- **No composite operator, no BRST differential, no Wilson line, no operator product expansion.**
  Layers 3 to 6.

---

## Layer 0: divergent subgraphs, forests, and the Hopf algebra of graphs

References: Zimmermann, *Commun. Math. Phys.* **15** (1969) 208, §2; Collins, *Renormalization*,
ch. 5; Kreimer, *Adv. Theor. Math. Phys.* **2** (1998) 303; Connes and Kreimer, *Commun. Math.
Phys.* **210** (2000) 249, §2.

### 0.1 A theory, and its power counting

A *theory datum* is a finite set of field types, each with a canonical dimension as a function of
the space-time dimension, and a finite set of vertex types, each a multiset of field types with a
number of derivatives. Graphs of the theory are the graphs of `FeynmanIntegrals` Layer 0 whose
vertices and edges carry these labels.

Statements to prove:

- The superficial degree of divergence `ω(Γ)` of `FeynmanIntegrals` Layer 3, expressed through the
  labels: `ω(Γ) = d − Σ_{external legs} [field] − Σ_{vertices} [coupling]`, where `[·]` is the
  canonical dimension. The formula is proved from the definition in terms of loop number and
  propagator powers, using Euler's relation for a connected graph.
- The trichotomy by the coupling dimensions in `d = 4`: all non-negative (renormalisable), all zero
  (strictly renormalisable), some negative. In the renormalisable case the set of external-leg
  structures with `ω ≥ 0` is finite and independent of the loop number; this finite set is the set
  of *renormalisation structures* of the theory.
- The three theory data used downstream — scalar `φ⁴`, QED, and QCD with ghosts in a covariant
  gauge — each proved strictly renormalisable, with its renormalisation structures enumerated.

### 0.2 Renormalisation parts and their mutual position

A *renormalisation part* of a graph `Γ` is a one-particle-irreducible subgraph `γ` with
`ω(γ) ≥ 0`. Two subgraphs are *disjoint* if they share no vertex, *nested* if one contains the
other, and *overlapping* otherwise.

Statements to prove:

- The contraction `Γ/γ` of a subgraph to a vertex is a graph of the theory when `γ` is a
  renormalisation part and the theory is renormalisable; its loop number is `L(Γ) − L(γ)`;
  contraction of disjoint subgraphs commutes; and for nested `γ ⊂ δ ⊂ Γ` the identity
  `(Γ/γ)/(δ/γ) = Γ/δ`.
- The degree identity `ω(Γ) = ω(γ) + ω(Γ/γ)` in a strictly renormalisable theory, where the
  contracted vertex of `Γ/γ` carries the dimension of the renormalisation structure of `γ`.
- The union and the intersection of two overlapping one-particle-irreducible subgraphs: the union
  is one-particle-irreducible; the intersection need not be, and its irreducible components are
  identified.
- Decidability of all three relations and of the property of being a renormalisation part, for
  finite graphs.

### 0.3 Forests

A *forest* of `Γ` is a set of renormalisation parts of `Γ`, any two of which are disjoint or
nested. It is *normal* if it does not contain `Γ` itself and *full* if it does.

Statements to prove:

- The set of forests of a finite graph is finite; the empty set is a forest; a subset of a forest
  is a forest.
- A forest is partially ordered by inclusion of subgraphs, and its Hasse diagram is a rooted
  forest in the graph-theoretic sense: every element has at most one immediate successor. This is
  the theorem the name records.
- The bijection between full forests and normal forests, `F ↦ F \ {Γ}`, when `Γ` is itself a
  renormalisation part.
- The maximal elements of a normal forest are pairwise disjoint; the bijection between normal
  forests of `Γ` and pairs consisting of a set `{γ₁, …, γ_k}` of pairwise disjoint proper
  renormalisation parts and a normal forest of each `γ_i`. This bijection is what turns the forest
  sum into the recursion of Layer 1.2.
- A graph with no proper renormalisation part is *primitive*; the primitive graphs of `φ⁴` at one
  and two loops are enumerated.

### 0.4 The bialgebra of graphs and its antipode

Let `H` be the free commutative algebra over `ℚ` on the isomorphism classes of
one-particle-irreducible graphs, of loop number at least one, of a renormalisable theory whose
external-leg structure is a renormalisation structure. A bare vertex is a one-particle-irreducible
graph of loop number zero; it is not a generator and is not a renormalisation part in 0.2, and a
cograph `Γ/γ` that is a bare vertex is identified with the unit. Define the coproduct on a
generator by

`Δ(Γ) = Γ ⊗ 1 + 1 ⊗ Γ + Σ_γ γ ⊗ Γ/γ`,

the sum over non-empty sets `γ` of pairwise disjoint proper renormalisation parts, identified with
the product of their classes, and extend it as an algebra map. The counit sends every generator to
zero.

Statements to prove:

- `Δ` is well defined on isomorphism classes.
- Coassociativity, from the contraction identities of 0.2 and a bijection between the two ways of
  choosing a nested pair of subgraph sets. With the counit axioms this makes `H` an instance of
  `Bialgebra`, constructed through `Bialgebra.mk'`.
- The grading by loop number: `H = ⊕_L H_L`, the product and the coproduct respect it, and `H₀` is
  the base field, which is where the restriction of the generators to positive loop number is
  used. The number of vertices is not a grading for this coproduct: contracting a connected
  subgraph to a point gives `|V(γ)| + |V(Γ/γ)| = |V(Γ)| + 1`, and the roadmap does not use it.
- **Connected graded bialgebras are Hopf algebras.** For any bialgebra over a commutative ring,
  graded by `ℕ`, with degree-zero part the image of the base ring, the recursion
  `S(x) = −x − Σ S(x′) x″` over the reduced coproduct defines a two-sided convolution inverse of
  the identity. Stated and proved in that generality and fed to `HopfAlgebra.ofConvInverse`.
- `H` is therefore a commutative `HopfAlgebra`; its antipode is an involutive algebra automorphism
  by `TauCeti.HopfAlgebra.antipode_antipode`.
- The primitive elements of `H` in degree one are spanned by the one-loop generators; a generator
  is primitive in the sense of `Mathlib.RingTheory.Bialgebra.Primitive` if and only if the graph is
  primitive in the sense of 0.3.

### 0.5 Characters and infinitesimal characters

A *character* of `H` with values in a commutative algebra `A` is an algebra map `H → A`.

Statements to prove:

- Characters form a group under convolution, with inverse `φ ∘ S`. This is the group instance of
  `Mathlib.RingTheory.HopfAlgebra.Convolution` on `WithConv (H →ₐ A)`; the statement here is that
  the Feynman rules of Layer 1 are an element of it.
- An *infinitesimal character* is a linear map `H → A` vanishing on `1` and on products of two
  elements of the augmentation ideal. Infinitesimal characters form a Lie algebra under the
  convolution commutator, and the exponential, defined degree by degree, is a bijection from
  infinitesimal characters to characters.
- The pre-Lie product on the span of generators given by insertion of one graph into another, the
  theorem that its commutator is the Lie bracket dual to the coproduct, and the grading derivation
  `Y` multiplying a homogeneous element by its loop number. `Y` is a derivation of `H` and a
  coderivation.
- The one-parameter group `θ_t = exp(tY)` of automorphisms of `H`, and its action on characters.

### Examples

- The two two-loop one-particle-irreducible self-energy graphs of `φ⁴` in four dimensions, the
  sunset and the double bubble: their renormalisation parts, all their forests, and their
  coproducts written out.
- The two-loop vacuum-polarisation graph of QED with a self-energy insertion and the one with a
  vertex correction: the second has two overlapping vertex subgraphs, its forests are listed, and
  the count shows that no forest contains both.
- A pair of overlapping one-particle-irreducible subgraphs whose intersection is not
  one-particle-irreducible, showing that renormalisation parts are not closed under intersection.
- The antipode of each two-loop generator computed from the recursion and checked against
  `S ⋆ id = η ∘ ε`.
- A bialgebra graded by `ℕ` whose degree-zero part is two-dimensional and which has no antipode,
  showing that connectedness is used.

### Dependencies

`FeynmanIntegrals` Layers 0 and 3. `Mathlib.RingTheory.Coalgebra.Basic`,
`Mathlib.RingTheory.Bialgebra.Basic`, `Mathlib.RingTheory.Bialgebra.Primitive`,
`Mathlib.RingTheory.Bialgebra.Convolution`, `Mathlib.RingTheory.HopfAlgebra.Basic`,
`Mathlib.RingTheory.HopfAlgebra.Convolution`, `Mathlib.Algebra.MvPolynomial.Basic`,
`Mathlib.RingTheory.GradedAlgebra.Basic`, `Mathlib.Order.Antichain`,
`Mathlib.Order.Preorder.Chain`, `TauCeti.Algebra.HopfAlgebra.Antipode`,
`TauCeti.Algebra.HopfAlgebra.Basic`, `TauCeti.Algebra.Coalgebra.Convolution`,
`TauCeti.Algebra.Lie.Derivation.Basic`, `TauCeti.RingTheory.PowerSeries.Exp`.
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions` for the QED and QCD vertex
types.

---

## Layer 1: the R-operation and the BPHZ theorem

References: Bogoliubov and Parasiuk, *Acta Math.* **97** (1957) 227; Hepp, *Commun. Math. Phys.*
**2** (1966) 301; Zimmermann, *Commun. Math. Phys.* **15** (1969) 208; Lowenstein and Zimmermann,
*Commun. Math. Phys.* **44** (1975) 73; Collins, *Renormalization*, ch. 5; Caswell and Kennedy,
*Phys. Rev. D* **25** (1982) 392; Connes and Kreimer, *Commun. Math. Phys.* **210** (2000) 249.

### 1.1 Subtraction operators

A *subtraction operator* on a commutative algebra `A` is a linear map `T : A → A` satisfying the
Rota–Baxter identity of weight `−1`,

`T(x) T(y) + T(x y) = T(T(x) y) + T(x T(y))`.

Statements to prove:

- For such a `T`, both `T(A)` and `(1 − T)(A)` are subalgebras, and `1 − T` is again a subtraction
  operator.
- The pole-part projection on `LaurentSeries` — the map keeping the coefficients of strictly
  negative powers — is an idempotent subtraction operator. Its image is the algebra of pole parts
  and the image of its complement is the power series.
- The Taylor operator `t^ω` taking a smooth function of external momenta to its Taylor polynomial
  of degree `ω` at the origin, as an operator on integrands: its composition and commutation rules
  with multiplication by a function independent of the momenta in question, which replace the
  Rota–Baxter identity in the momentum-space proof.
- A subtraction operator *commutes with differentiation* in a set of variables if
  `∂ ∘ T = T ∘ ∂`; minimal subtraction has this property with respect to external momenta and
  masses, and the Taylor operator at zero momentum has it with the degree lowered by one.

### 1.2 The R-operation, recursively and as a forest sum

Let `U` assign to each graph its unrenormalised value: either the integrand of `FeynmanIntegrals`
Layer 2 or the dimensionally regularised integral of its Layer 4. Define, by recursion on the loop
number,

`R̄(Γ) = U(Γ) + Σ_{γ} C(γ) · U(Γ/γ)`, `C(Γ) = −T(R̄(Γ))`, `R(Γ) = R̄(Γ) + C(Γ)`,

the sum over non-empty sets of pairwise disjoint proper renormalisation parts, with `C` of a set
the product of its values.

Statements to prove:

- The recursion is well founded, and `R̄`, `C`, `R` are well defined on isomorphism classes.
- **The forest formula.** `R(Γ) = Σ_F Π_{γ ∈ F} (−T_γ) U(Γ)`, the sum over all forests of `Γ`,
  the operators applied from the innermost renormalisation part outwards. Proved from the
  bijection of 0.3. The order of application is part of the statement, and the theorem that
  operators attached to disjoint parts commute is proved alongside it.
- For a primitive graph, `R(Γ) = (1 − T) U(Γ)`.
- `R̄(Γ)` for a graph with a single proper renormalisation part `γ` is
  `U(Γ) − T(R̄(γ)) · U(Γ/γ)`; the two-loop cases of the Examples are instances.
- Factorisation: for a one-particle-reducible graph, and for a disjoint union, `R` is the product
  of `R` on the components.

### 1.3 The BPHZ theorem: finiteness

Two forms, each with its setting stated.

**Momentum-space form.** Euclidean signature; every propagator has a strictly positive mass; the
subtraction operator on a renormalisation part `γ` is the Taylor operator `t^{ω(γ)}` in the
external momenta of `γ` at zero. Statement to prove: the forest-subtracted integrand
`R(Γ)` is absolutely integrable over the loop momenta, for every graph `Γ` of a renormalisable
theory and all external momenta, and the integral is a smooth function of the external momenta
and of the masses.

The proof route is fixed, and it is Zimmermann's: with loop momenta routed admissibly with respect
to the forests, the subtracted integrand is shown to have negative degree with respect to every
affine subspace of the loop-momentum space, and convergence then follows from Weinberg's theorem as
proved in `FeynmanIntegrals` Layer 3. The regrouping lemma — for a given subspace, the forests
split into classes on each of which the subtractions combine into remainders of Taylor expansions
whose degree is lowered below zero — is the combinatorial heart and is a named target.

The parametric counterpart is a second target with the same hypotheses: the forest-subtracted
parametric integrand is integrable in each Hepp sector of `FeynmanIntegrals` Layer 3, and the
resulting value equals the momentum-space one.

**Dimensionally regularised form.** The subtraction operator is the pole-part projection, applied
to the Laurent expansion in `eps` of the integral of `FeynmanIntegrals` Layer 4. Statement to prove:
for every graph `Γ` of a renormalisable theory with strictly positive masses, `R(Γ)`, as a function
of `eps`, has `meromorphicOrderAt` at least zero at `eps = 0`; its value there is the renormalised
integral.

The two forms are related by a theorem, not assumed equivalent: their values differ by the action
of a finite renormalisation, which is Layer 2.3.

### 1.4 The BPHZ theorem: locality

Statements to prove:

- **Counterterms are polynomials.** In the dimensionally regularised form, for every
  one-particle-irreducible graph `Γ`, each Laurent coefficient of `C(Γ)` is a polynomial in the
  external momenta and the masses, of degree at most `ω(Γ)`, with coefficients independent of
  `μ`. The proof differentiates `R̄(Γ)` with respect to external momenta `ω(Γ) + 1` times, uses
  commutation of the pole part with differentiation, and applies 1.3 to the differentiated graph,
  whose overall degree is negative while its subdivergences are already subtracted.
- For `ω(Γ) < 0`, `C(Γ) = 0`; the set of graphs with a non-zero counterterm is the set with a
  renormalisation structure as external-leg structure.
- **Counterterms are counterterm vertices.** There is a formal power series in the coupling, for
  each renormalisation structure, with coefficients polynomial in momenta and masses, such that the
  sum over graphs of `R(Γ)` at each order equals the sum over graphs of `U` for the theory datum
  enlarged by vertices with those coefficients. In a strictly renormalisable theory the new
  vertices have the form of the original ones, and the enlarged theory is the original with
  rescaled fields, masses and couplings: this defines the renormalisation constants `Z`.
- The absence of non-local poles: a term such as `(1/eps) log(p²/μ²)` cancels in `R̄(Γ)` between
  `U(Γ)` and the subdivergence subtractions. This is a corollary of polynomiality and is stated
  separately because it is the check a hand calculation uses.

### 1.5 Renormalisation as a Birkhoff decomposition

Statements to prove:

- **Algebraic Birkhoff decomposition.** Let `H` be a connected graded commutative Hopf algebra,
  `A` a commutative unital algebra with an idempotent subtraction operator `T` satisfying the
  Rota–Baxter identity of 1.1 and `T(1) = 0`, and `φ : H → A` a character. The condition on the
  unit is needed: `T = id` is idempotent and Rota–Baxter, and then `(1 − T)(A) = 0` cannot
  contain `φ₊(1) = 1`. The pole part satisfies it. There are unique characters `φ₋` and `φ₊` with
  `φ₊ = φ₋ ⋆ φ`, `φ₋` taking the
  augmentation ideal into `T(A)` and `φ₊` taking `H` into `(1 − T)(A)`. They are given by
  `φ₋(x) = −T(φ(x) + Σ φ₋(x′) φ(x″))` and `φ₊(x) = (1 − T)(φ(x) + Σ φ₋(x′) φ(x″))`. That `φ₋` is
  multiplicative is exactly where the Rota–Baxter identity is used, and the proof says so.
- With `H` the algebra of 0.4, `φ = U` and `T` the pole part: `φ₋ = C` and `φ₊ = R` of 1.2.
- Hence three descriptions of the renormalised value coincide: the forest formula, the Birkhoff
  factor `φ₊`, and the Feynman rules of the Lagrangian with counterterms of 1.4. Each equality is a
  separate theorem.

### 1.6 Massless propagators and Minkowski signature

Statements to prove, each with its additional hypotheses as arguments:

- With some masses zero, Euclidean signature and the pole-part subtraction: the conclusions of 1.3
  and 1.4 hold provided the external momenta are non-exceptional — no proper partial sum of them
  vanishes — so that `FeynmanIntegrals` Layer 3 gives infrared convergence, and provided no
  renormalisation part is a scaleless subgraph. The hypothesis is the `Prop` `NonExceptional`.
- Zero-momentum Taylor subtraction of a massless graph is infrared divergent; the counterexample is
  the one-loop massless self-energy differentiated twice. The Lowenstein–Zimmermann subtraction,
  which subtracts at zero momentum with an auxiliary mass in the subtraction terms, is defined, and
  the theorem that it gives a convergent renormalised integrand for massless renormalisable
  theories at non-exceptional momenta is stated with that scheme as the hypothesis.
- In Minkowski signature with the `iε` prescription, the renormalised integral exists as a
  tempered distribution in the external momenta, the boundary value of `FeynmanIntegrals` Layer 5;
  the counterterms are the same polynomials as in the Euclidean theory. The hypothesis is strictly
  positive masses, or non-exceptional Euclidean-region momenta in the massless case; on-shell
  external momenta in a massless theory are infrared-singular and are `InfraredStructure`.

### Examples

- The one-loop self-energy and four-point function of `φ⁴`: `U`, `C` and `R` in both forms, with
  the counterterms exhibited as a constant and as a polynomial of degree two.
- The two-loop "sunset" and "double-bubble" self-energies of `φ⁴`: `R̄` written out, the
  cancellation of the `(1/eps) log` term shown explicitly, and the double pole of the counterterm
  computed.
- The overlapping two-loop vacuum polarisation of QED: the forest formula with its six forests,
  three of them normal, none containing both vertex subgraphs.
- A non-renormalisable theory datum — `φ⁶` in four dimensions — for which the set of
  renormalisation structures grows with the loop number, so that 1.4 produces counterterm vertices
  not of the original form.
- A linear map on Laurent series that is a projection but not a Rota–Baxter operator, for which
  the map `φ₋` of 1.5 fails to be multiplicative.

### Dependencies

Layer 0. `FeynmanIntegrals` Layers 2, 3, 4 and 5. `Mathlib.RingTheory.LaurentSeries`,
`Mathlib.RingTheory.HahnSeries.Basic`, `Mathlib.Analysis.Meromorphic.Basic`,
`Mathlib.Analysis.Meromorphic.Order`, `Mathlib.RingTheory.HopfAlgebra.Convolution`,
`TauCeti.Algebra.Coalgebra.Convolution`.

---

## Layer 2: minimal subtraction, schemes, and the renormalisation group

References: 't Hooft and Veltman, *Nucl. Phys. B* **44** (1972) 189; 't Hooft, *Nucl. Phys. B*
**61** (1973) 455; Collins, *Nucl. Phys. B* **80** (1974) 341; Callan, *Phys. Rev. D* **2** (1970)
1541; Symanzik, *Commun. Math. Phys.* **18** (1970) 227; Collins, *Renormalization*, ch. 7; Connes
and Kreimer, *Commun. Math. Phys.* **216** (2001) 215.

### 2.1 Laurent expansions of meromorphic functions of the regulator

Statements to prove:

- The map sending a function meromorphic at `eps = 0` to its formal Laurent series is a ring
  homomorphism from germs to `LaurentSeries ℂ`, injective, compatible with differentiation, and it
  sends `meromorphicOrderAt` to the order of the series.
- A `LaurentExpansionAtZero` is the datum of such a germ with order at least `−1` together with a
  choice of remainder; the map from germs of order at least `−1` to records is defined and
  `poleCoeff` is the coefficient of `eps⁻¹`, after the rescaling of Convention 1.
- The pole-part projection on germs agrees with the one on series.

### 2.2 The scale `μ` and minimal subtraction

The bare coupling in `d` dimensions has a mass dimension; write `g₀ = μ^{eps} g Z_g` with `g`
dimensionless. *Minimal subtraction* is the scheme in which every renormalisation constant is `1`
plus a series in the coupling whose coefficients are pure pole parts. *Modified minimal
subtraction* replaces `μ²` by `μ² e^{γ_E}/(4π)`.

Statements to prove:

- Existence and uniqueness of the minimal-subtraction constants at every order, from 1.4.
- The constants are independent of `μ` and of the masses: `Z = 1 + Σ_{k ≥ 1} Z^{(k)}(a₄) / eps^k`
  with each `Z^{(k)}` a formal power series in `a₄` with numerical coefficients, of order at least
  `k` in `a₄`. This mass independence is a theorem; it follows from polynomiality and dimension
  counting, and is the property that makes the renormalisation group of 2.4 autonomous.
- The relation between the two schemes is the rescaling of `μ`, exactly, to all orders.

### 2.3 Schemes and finite renormalisations

A *scheme* is a choice, for each renormalisation structure, of a subtraction satisfying the
properties of Convention 7 and removing the divergence.

Statements to prove:

- **Any two schemes differ by a finite renormalisation.** If `R` and `R′` are the renormalised
  characters of two schemes, there is a character `ζ` with values in functions regular at
  `eps = 0` such that `R′ = ζ ⋆ R`; equivalently, the renormalised Green functions of one scheme
  are those of the other with couplings, masses and fields replaced by formal power series in
  those of the first, with leading terms the identity.
- Finite renormalisations form a group, the group of formal diffeomorphisms of the coupling
  tangent to the identity extended by field and mass rescalings, and the action on Green functions
  is a group action.
- The momentum-subtraction scheme of 1.3 and minimal subtraction are related in this way, with the
  one-loop `ζ` computed for `φ⁴`.

### 2.4 The beta function and anomalous dimensions

Define `β(a₄, eps) = d a₄ / d log μ²` at fixed bare coupling, and `β(a₄) = β(a₄, 0)`; the field and
mass anomalous dimensions `γ_φ = d log Z_φ / d log μ²` and `γ_m = d log m / d log μ²` likewise.

Statements to prove:

- `β(a₄, eps) = −eps · a₄ + β(a₄)`, with `β(a₄)` independent of `eps`, in minimal subtraction.
- **The residue formula.** With `a₀ = μ^{2 eps} a₄ Z_a`, `β(a₄) = a₄² · d Z_a^{(1)} / d a₄`, where
  `Z_a^{(1)}` is the simple-pole coefficient of the coupling renormalisation; and for a quantity
  renormalised as `[O] = Z · O_bare`, `γ = −a₄ · d Z^{(1)} / d a₄`. The beta function and the
  anomalous dimensions are determined by the simple poles alone.
- **The pole equations.** For every `k ≥ 1`, `Z^{(k+1)}` is determined by `Z^{(1)}` and `β`
  through a first-order differential recursion in `a₄`. Consequently the coefficient of
  `a₄ⁿ / epsⁿ` in `Z` is fixed by the one-loop coefficients. The two-loop double pole of the
  Examples of Layer 1 is the first instance.
- In the Hopf-algebraic form: the residue of the counterterm character, composed with the grading
  derivation `Y` of 0.5, is an infinitesimal character `β̂`, and the counterterm character is
  recovered from `β̂` by the pole equations; the renormalised character at scale `μ` is obtained
  from that at `μ₀` by convolution with `exp(log(μ²/μ₀²) β̂)`. The identification of `β̂` on the
  coupling's renormalisation structures with `β(a₄)` is a theorem.
- Finiteness of `β` and `γ` as `eps → 0` is equivalent to the pole equations: the hypothesis that
  bare quantities are `μ`-independent forces the cancellation of the poles.

### 2.5 The renormalisation-group and Callan–Symanzik equations

Statements to prove:

- For a renormalised one-particle-irreducible Green function `Γ⁽ⁿ⁾` with `n` external fields in
  minimal subtraction,
  `[ ∂/∂ log μ² + β ∂/∂ a₄ + 2 γ_m m² ∂/∂ m² − n γ_φ ] Γ⁽ⁿ⁾ = 0`
  as an identity of formal power series in `a₄`, order by order. The factor of two is that of
  `d m² / d log μ² = 2 γ_m m²`, with `γ_m = d log m / d log μ²` as defined in 2.4.
- The solution along the characteristics, using the running coupling of `CollinearEvolution`
  Layer 2.3, and the resulting statement of how a Green function depends on a common rescaling of
  its external momenta.
- The Callan–Symanzik equation in a mass-dependent scheme, with its inhomogeneous term a mass
  insertion whose degree of divergence is lower by two, and the theorem that the inhomogeneous
  term is suppressed by `m²/p²` up to logarithms at each order at non-exceptional momenta.
- Under a finite renormalisation `a₄′ = a₄ + c₁ a₄² + ⋯`, the first two coefficients of `β` are
  unchanged when the scheme is mass-independent, and the third changes by a stated expression. The
  invariance statement is `CollinearEvolution` Layer 2.4; this roadmap proves the transformation
  law of which it is a consequence, and of `γ`: the one-loop coefficient `γ₀` is invariant and the
  two-loop coefficient shifts by `−c₁ γ₀ − β₀ z₁`, with `z₁` the one-loop coefficient of the finite
  rescaling of the renormalised quantity.

### 2.6 The one-loop coefficients of QCD from integrals

Statements to prove, in a general covariant gauge with gauge parameter `ξ`, in minimal subtraction:

- The simple poles of the quark, gluon and ghost self-energies and of the quark–gluon and
  ghost–gluon vertices, each obtained from the corresponding integrals of `FeynmanIntegrals` Layer
  4 with the numerator algebra of its Layer 6. The values are the entries of a
  `RenormalizationConstants` record; the gauge-parameter dependence of each is exhibited.
- The resulting record satisfies `SlavnovTaylorAssumptions`, as a direct check at one loop
  independent of Layer 4.4.
- The four diagram-class contributions satisfy `PrimitivePoleAssumptions`, so that
  `beta0_fromLoopIntegralData` applies with a proved antecedent.
- The coupling pole satisfies `Beta0RenormalizationAssumptions` once the regulator and coupling
  normalisations of that module are matched to Conventions 1 and 2; the matching is a lemma, and it
  is where every factor of two between the two descriptions is located. The coefficient given by
  the residue formula of 2.4 equals `EpsilonEridani.QFT.QCD.beta0`; the gauge parameter cancels.
- The one-loop quark-mass anomalous dimension `γ_m = −3 C_F a₄ + O(a₄²)` in Convention 3, and the
  one-loop quark and gluon field anomalous dimensions with their gauge dependence.
- The same for QED as the abelian specialisation: `β₀ = −(4/3) n_f` for unit charges, positive
  beta function, and `Z₁ = Z₂`.

### Examples

- `φ⁴` with interaction `λ φ⁴/4!`: `β(a) = (3/2) a² + O(a³)` for `a = λ/(16π²)` in Convention 3,
  from the one-loop four-point pole, and the coefficient of `a²/eps²` in the two-loop coupling
  counterterm obtained from the pole equations and compared with the direct calculation of Layer
  1.
- A two-coupling theory datum in which the pole equations couple the two beta functions, showing
  that the recursion is a statement about a vector field.
- A mass-dependent scheme in which the second beta coefficient differs from the minimal-subtraction
  value, showing that the hypothesis of mass independence in 2.5 is used.
- The numerical specialisation of 2.6 to `SU(3)` with `n_f = 3, 4, 5, 6`.

### Dependencies

Layers 0 and 1. `FeynmanIntegrals` Layers 4 and 6. `EpsilonEridani.QFT.QCD.Basic`,
`EpsilonEridani.QFT.QCD.Renormalization`, `EpsilonEridani.QFT.QCD.OneLoopBeta`,
`EpsilonEridani.QFT.QCD.OneLoopCounterterms`, `EpsilonEridani.QFT.QCD.OneLoopBetaFromScalars`,
`EpsilonEridani.QFT.QCD.OneLoopNumeratorContractions`,
`EpsilonEridani.QFT.QCD.OneLoopDiagrammaticBridge`,
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`, `.OneLoopScalars`,
`.TensorReduction`, `Mathlib.Analysis.Meromorphic.NormalForm`,
`Mathlib.RingTheory.PowerSeries.Derivative`, `TauCeti.RingTheory.PowerSeries.Exp`,
`TauCeti.RingTheory.PowerSeries.Log`. From `CollinearEvolution`: Layer 2.1 for the power-series
form of the beta function, Layer 2.3 for the running coupling, Layer 2.4 for the invariance
statement.

---

## Layer 3: composite operators

References: Zimmermann, *Ann. Phys.* **77** (1973) 536; Collins, *Renormalization*, ch. 6 and 12;
Gross and Wilczek, *Phys. Rev. D* **8** (1973) 3633 and **9** (1974) 980; Georgi and Politzer,
*Phys. Rev. D* **9** (1974) 416; Joglekar and Lee, *Ann. Phys.* **97** (1976) 160.

### 3.1 Local operators and their insertion

Per Convention 12, a local operator is a polynomial in the fields and their derivatives at one
point. Its *canonical dimension* is additive, and an operator of dimension `Δ` with a given
field content defines a vertex type.

Statements to prove:

- The Green functions with one insertion of an operator `O` are the sums over graphs of the theory
  datum enlarged by the vertex of `O`, with exactly one such vertex. The superficial degree of
  divergence of a graph with an insertion of `O` and external-leg structure of an operator `O′` is
  `ω = Δ(O) − Δ(O′)`.
- Insertion of a total derivative `∂_μ O` is multiplication of the insertion of `O` by the
  momentum flowing in; insertion at zero momentum of an operator in the Lagrangian is the
  derivative of the Green function with respect to its coupling.
- Multiple insertions, and the additional renormalisation parts that contain two inserted
  vertices; the contact terms these generate are polynomials in the relative momentum.

### 3.2 The renormalisation matrix

Statements to prove:

- **Closure under mixing.** For every operator `O_i` there is a finite set of operators `O_j` with
  `Δ(O_j) ≤ Δ(O_i)` and the same quantum numbers under every symmetry preserved by the
  regularisation, and a matrix `Z_{ij}` of pole-part series, such that
  `[O_i] = Σ_j Z_{ij} O_j` has finite insertions into every Green function at every order. This is
  1.3 and 1.4 for the enlarged theory datum.
- **Triangularity.** In a mass-independent scheme, `Z_{ij}` for `Δ(O_j) < Δ(O_i)` is a polynomial
  in the masses of degree `Δ(O_i) − Δ(O_j)`; in a massless theory operators of different dimension
  do not mix. The matrix is block-triangular in the dimension, and block-diagonal in the massless
  case.
- The anomalous-dimension matrix of Convention 4, `γ = (d Z / d log μ²) Z⁻¹`, is finite and given
  by the simple-pole coefficient of `Z` by the matrix form of the residue formula of 2.4. The
  renormalisation-group equation of 2.5 for Green functions with an insertion acquires the term
  `Σ_j γ_{ij}`.
- Under a change of operator basis `O′ = M O` with `M` a constant invertible matrix,
  `γ′ = M γ M⁻¹`; under a finite renormalisation `[O]′ = (1 + a₄ K + ⋯)[O]`, the one-loop
  matrix is unchanged and the two-loop matrix shifts by `[K, γ₀] − β₀ K`.

### 3.3 Conserved currents

Statements to prove:

- If a regularisation preserves a continuous symmetry, the Noether current `j^μ` of that symmetry
  satisfies a Ward identity for its insertions, and the renormalised current is the bare one:
  `Z_j = 1` to all orders, hence `γ_j = 0`. Proved from the Ward identity and the fact that the
  right-hand side of the identity is finite.
- The vector current of a vector-like gauge theory and the non-singlet axial current under
  Convention 9 are instances.
- A partially conserved current, whose divergence is a soft operator `m O`: `Z_j = 1` and
  `Z_m Z_O = 1`.
- The total symmetric energy-momentum tensor is not renormalised and has vanishing anomalous
  dimension; the proof uses the translation Ward identity. Its quark and gluon parts mix, with a
  mixing matrix whose column sums vanish. `HadronMassAndEnergyMomentumTensor` Layer 0.5 states
  these facts for QCD and derives the one-loop matrix; the general theorem it instantiates is here.

### 3.4 Operator classes in a gauge theory, and evanescent operators

This subsection states the structural theorem; its proof uses Layer 4 and is completed there.

- Three classes of operators of a gauge-fixed theory: *class I*, gauge-invariant operators built
  from the physical fields; *class IIa*, BRST variations `s F` of an operator `F` of ghost number
  minus one; *class IIb*, operators proportional to the equations of motion.
- **Block triangularity.** Class I operators mix under renormalisation with classes I, IIa and
  IIb; class II operators mix only among themselves. The statement is 4.5.
- **Class II operators vanish in physical matrix elements.** Insertions of a class IIa operator
  between physical states vanish by the Slavnov–Taylor identity; insertions of a class IIb operator
  vanish at non-coincident points and produce contact terms otherwise. Consequently the
  anomalous-dimension matrix of class I operators, as it acts on physical matrix elements, is the
  class I block.
- *Evanescent operators*: operators that vanish identically in four dimensions but not in `d`.
  Their insertions are of order `eps` at tree level and can multiply a pole. The theorem: in
  minimal subtraction supplemented by a finite renormalisation, the renormalised evanescent
  operators have vanishing Green functions at `eps = 0`, and the physical operators do not mix
  into them in the anomalous-dimension matrix. The `(D/4 − 1) F²` trace of
  `EpsilonEridani.QFT.QCD.EnergyMomentumTensor.trace_gluonPart` is the instance on which the trace
  anomaly of `HadronMassAndEnergyMomentumTensor` Layer 2.1 rests.

### 3.5 Twist and the twist-two operators

Statements to prove:

- The Lorentz decomposition of a local operator with `n` vector indices into irreducible parts;
  the totally symmetric traceless part has spin `n`. *Twist* is canonical dimension minus spin, the
  `freeDimension` relation of `EpsilonEridani.QFT.Factorization.Evolution.Reciprocity` read in the
  other direction.
- Contraction with `n` copies of a light-like vector `Δ` projects onto the symmetric traceless
  part; the operators are
  `O_q^n = ψ̄ Δ̸ (iΔ·D)^{n−1} ψ` for each flavour and `O_g^n = F^{μα} Δ_μ (iΔ·D)^{n−2} Δ^ν F_{να}`,
  traced over colour, for `n ≥ 2`.
- In QCD the minimum twist of a gauge-invariant operator with non-vanishing forward matrix
  elements is two, and the operators above, with their flavour non-singlet and singlet
  combinations, span the twist-two class I operators of spin `n` modulo total derivatives.
- Lorentz invariance and triangularity: operators of different spin do not mix; twist-two
  operators of spin `n` mix only among themselves and with operators that are total derivatives or
  of class II; in forward matrix elements the total derivatives drop. The forward mixing matrix is
  therefore one-by-one in each non-singlet channel and two-by-two in the singlet channel.
- Charge conjugation selects even or odd `n` for each combination, stated as a theorem about the
  operators.

### 3.6 The twist-two anomalous dimensions are the moments of the splitting kernels

Statements to prove:

- **One loop.** The anomalous dimensions of 3.5, computed from the simple poles of the one-loop
  insertions into quark and gluon two-point functions, are, in Conventions 2, 4, 5 and 6, the
  four functions `γ_qq(N)`, `γ_qg(N)`, `γ_gq(N)`, `γ_gg(N)` of `CollinearEvolution` Layer 1.5 at
  `N = n`, after the rescaling between `a₄` and that roadmap's coupling. This is an equality
  between two independently defined objects — residues of operator insertions here, Mellin
  moments of explicit kernels there — and it is the theorem that makes the kernels the
  renormalisation-group generators of operators.
- The matrices so obtained are an instance of the field `gamma` of
  `DglapMomentSystem` of `EpsilonEridani.QFT.Factorization.Evolution.MomentSpace` at integer
  index, and the renormalisation-group equation of 3.2 for the reduced matrix elements is its
  `IsMomentSolution`.
- **Conservation.** `γ_qq(1) = 0` in the non-singlet channel is the non-renormalisation of the
  vector current of 3.3; the vanishing column sums of the singlet matrix at `n = 2` are the
  non-renormalisation of the energy-momentum tensor. These reproduce the hypotheses of
  `sumRule_conserved` from operator statements.
- **Uniqueness of the continuation.** The anomalous dimensions at integer `n` of fixed parity
  determine the Mellin transform of the kernel at all complex index, by Carlson's theorem under
  the growth bound satisfied by the functions of `CollinearEvolution` Layer 1.5. The growth bound
  is proved for those functions; for the all-orders anomalous dimensions it is the hypothesis
  `HasCarlsonGrowth`.
- At two loops the matrix elements of `γ` are the moments of the kernels that `CollinearEvolution`
  Layer 5.4 states as data; this roadmap proves the structural identities — the conservation
  statements above, the scheme transformation of 3.2 — and does not derive the two-loop values.

### Examples

- `φ²` and `φ⁴` in the `φ⁴` theory: `φ²` renormalises multiplicatively with `Z_{φ²} = Z_m⁻¹` up to
  field renormalisation; `φ⁴` mixes with `m² φ²`, `∂²φ²` and the equation-of-motion operator, with
  the full one-loop matrix.
- The electromagnetic current in QED: `Z_j = 1` at one loop from `Z₁ = Z₂`.
- The spin-two singlet matrix at one loop, its eigenvalues `0` and
  `−((4/3) C_F + (2/3) T_F n_f)` in the kernel normalisation of `CollinearEvolution` Convention 2,
  and the eigenvector of eigenvalue zero identified as the total energy-momentum tensor.
- Two operators differing by an equation-of-motion operator with different Green functions at
  coincident points and equal on-shell matrix elements.
- An operator basis change that makes a triangular one-loop matrix non-triangular, showing that
  triangularity is a property of a basis ordered by dimension.

### Dependencies

Layers 0 to 2, and Layer 4 for the proofs of 3.4. `FeynmanIntegrals` Layers 4 and 6.
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`,
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace`,
`EpsilonEridani.QFT.Factorization.Evolution.Reciprocity`,
`EpsilonEridani.QFT.QCD.EnergyMomentumTensor.GluonPart`, `EpsilonEridani.QFT.QCD.Basic`. From
`CollinearEvolution`: Layer 0.5 for harmonic sums, Layer 1.5 for the moments, Layer 5.4 for the
two-loop data. To `HadronMassAndEnergyMomentumTensor`: Layers 0.5 and 2.1 instantiate 3.3 and 3.4.

---

## Layer 4: gauge theories

References: Becchi, Rouet and Stora, *Commun. Math. Phys.* **42** (1975) 127 and *Ann. Phys.*
**98** (1976) 287; Slavnov, *Theor. Math. Phys.* **10** (1972) 99; Taylor, *Nucl. Phys. B* **33**
(1971) 436; 't Hooft and Veltman, *Nucl. Phys. B* **44** (1972) 189; Breitenlohner and Maison,
*Commun. Math. Phys.* **52** (1977) 11; Joglekar and Lee, *Ann. Phys.* **97** (1976) 160; Collins,
*Renormalization*, ch. 12.

### 4.1 The gauge-fixed theory and the BRST differential

For a compact gauge Lie algebra with the data of
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.YangMillsGaugeData`, matter in a
representation, and a covariant gauge with parameter `ξ`, the field algebra is the
graded-commutative polynomial algebra of Convention 12 on gauge fields, matter fields, ghosts,
antighosts and the auxiliary field.

Statements to prove:

- The BRST operator `s` is defined on generators and extended as a graded derivation of ghost
  number one commuting with space-time derivatives.
- **Nilpotency.** `s² = 0`; on the ghost this is the Jacobi identity, and the proof exhibits it.
- The gauge-fixed Lagrangian is the gauge-invariant one plus `s` of a gauge fermion; hence it is
  `s`-closed. The Feynman rules it produces are those of
  `nonAbelianGaugeRules` of
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`.
- In `d` dimensions the action remains `s`-invariant for a vector-like theory: every step of the
  invariance proof uses only identities valid for arbitrary `d`. This is the statement that
  dimensional regularisation preserves the symmetry, and it is where the restriction to vector-like
  theories enters.
- The cohomology of `s` at ghost number zero on local operators built without antighosts contains
  the gauge-invariant operators; the classes of 3.4 are defined in these terms.

### 4.2 The Slavnov–Taylor identity

Add sources `K` for the BRST variations of the fields. Let `Γ` be the generating functional of
one-particle-irreducible Green functions as a formal power series in the fields, the sources and
the coupling.

Statements to prove:

- **Tree level.** The classical action with sources satisfies the Zinn-Justin equation
  `(Γ, Γ) = 0`, with `(·,·)` the antibracket in fields and sources, together with the ghost
  equation.
- **Regularised theory.** The dimensionally regularised `Γ` satisfies the same equation at every
  order, as an identity among regularised integrals: the proof is the diagrammatic one, using
  shift invariance of dimensionally regularised integrals from `FeynmanIntegrals` Layer 4 and the
  `d`-dimensional invariance of 4.1.
- **Renormalised theory.** In minimal subtraction the renormalised `Γ` satisfies the identity at
  every order. The proof is by induction on the loop order: the divergent part at order `L`, after
  lower-order subtractions, is local by 1.4 and is annihilated by the linearised operator
  `(Γ₀, ·)`; the solutions of that linear equation of the allowed dimension and ghost number are
  parametrised by finitely many constants; and each is a rescaling of a field, the coupling or the
  gauge parameter. The classification of the local solutions is a named target with its own
  proof.
- **On-shell form.** For a connected Green function with one external gluon contracted with
  its own momentum and every other external line amputated, on shell and contracted with a
  physical polarisation or spinor, the identity reduces to the statement that the Green function
  vanishes, at every order. This is the form that `InfraredStructure` Layer 5 consumes; the
  extension to several such gluons, and to a subgraph embedded in a larger graph, is proved
  there by induction from this statement.

### 4.3 The Ward–Takahashi identities of QED

Statements to prove:

- For the abelian theory the ghosts decouple and the identity of 4.2 reduces to the
  Ward–Takahashi identity `q_μ Γ^μ(p + q, p) = S⁻¹(p + q) − S⁻¹(p)` for the vertex and the inverse
  propagator, with its generalisation to `n` photons, at every order.
- Transversality of the vacuum polarisation to all orders, `q_μ Π^{μν}(q) = 0`, and the
  non-renormalisation of the gauge parameter's longitudinal part.
- `Z₁ = Z₂` to all orders, and `Z_e = Z₃^{−1/2}`: the charge renormalisation is determined by the
  photon self-energy alone.
- The graph-by-graph form: the sum over all insertions of a longitudinal photon into a fermion
  line telescopes. This is the identity `InfraredStructure` Layer 5 uses for the decoupling of
  longitudinally polarised gluons, proved there for the non-abelian case with ghosts.

### 4.4 Relations among renormalisation constants

Statements to prove:

- From 4.2, to all orders in a covariant gauge:
  `Z_g = Z_{1F} Z_2⁻¹ Z_3^{−1/2} = Z_{1c} Z_{3c}⁻¹ Z_3^{−1/2} = Z_{1,3g} Z_3^{−3/2}`, with the
  four-gluon vertex constant likewise fixed; the coupling is universal.
- The expansion of the first two equalities to first order in the simple-pole coefficients, at
  leading order in the coupling, is
  `EpsilonEridani.QFT.QCD.Renormalization.SlavnovTaylorAssumptions`; the record of 2.6 therefore
  satisfies it as a corollary of the all-orders identity, independently of the direct check made
  there.
- The gluon self-energy is transverse to all orders and the longitudinal part of the propagator is
  unrenormalised: `Z_ξ = Z_3`.
- The antighost equation, and the resulting relation `Z_{1c} = 1` in Landau gauge.

### 4.5 Gauge-parameter independence and gauge-invariant operators

Statements to prove:

- The derivative of the action with respect to `ξ` is `s`-exact. Consequently the derivative with
  respect to `ξ` of a Green function of gauge-invariant operators at non-coincident points
  vanishes at every order, and so does that of an on-shell amplitude between physical states after
  field renormalisation; the latter is stated for off-shell-regular kinematics, on-shell infrared
  singularities being `InfraredStructure`.
- The beta function in minimal subtraction is independent of `ξ` to all orders; the anomalous
  dimension of a gauge-invariant operator is independent of `ξ`; the quark-mass anomalous
  dimension is independent of `ξ`; the field anomalous dimensions are not.
- **Renormalisation of gauge-invariant operators** (Joglekar–Lee). The block-triangular mixing of
  3.4: the counterterms of a class I operator are a linear combination of class I, class IIa and
  class IIb operators, and those of class II operators are of class II. The proof applies the
  argument of 4.2 to the action extended by a source for the operator.
- The vanishing of class IIa insertions between physical states, and of class IIb insertions up to
  contact terms, completing 3.4.

### 4.6 The consistency of `γ₅` on open lines

Statements to prove:

- On a graph in which every `γ₅` lies on an open fermion line, the algebra generated by the
  `d`-dimensional `γ^μ` and an element `γ₅` anticommuting with all of them and squaring to one is
  a consistent associative algebra, and the value of the graph is well defined: two evaluations
  that differ by moving `γ₅` along the line agree once the sign `(−1)^k` for the `k` matrices
  `γ^μ` it is moved across is included. The value is not invariant under moving the insertion
  without that sign, since `γ₅ γ^μ = −γ^μ γ₅`.
- In that algebra, cyclicity of the trace forces `tr(γ₅ γ^μ γ^ν γ^ρ γ^σ)` to vanish for
  `d ≠ 4`; this is why Convention 9 forbids such traces and it is stated as a theorem so that the
  boundary of the roadmap is a proved obstruction.

### Examples

- The one-loop check of `Z_{1F}/Z_2 = Z_{1c}/Z_{3c}` in a general covariant gauge, with each
  constant's `ξ` dependence shown and the cancellation exhibited.
- The one-loop QED vertex and self-energy: `Z₁ = Z₂` from the integrals.
- The operator `F²` in pure gauge theory: its mixing at one loop with the class IIa and class IIb
  operators of dimension four, written out.
- A regularisation that breaks the symmetry — a momentum cutoff on the one-loop vacuum
  polarisation — producing a non-transverse term, showing that the preservation statement of 4.1
  has content.
- An axial gauge, where ghosts decouple: the Ward identity takes the abelian form, and the price,
  a propagator with an unregulated denominator `1/(n·k)`, is displayed; the regularisation of such
  denominators is `InfraredStructure` Layer 7.

### Dependencies

Layers 0 to 3. `FeynmanIntegrals` Layers 4 and 6.
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.YangMillsGaugeData`,
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.BasicExtensions`,
`EpsilonEridani.QFT.QCD.Renormalization`, `EpsilonEridani.QFT.QCD.SUNStructureConstants`,
`Physlib.QFT.PerturbationTheory.FieldStatistics.Basic`,
`Physlib.QFT.PerturbationTheory.Koszul.KoszulSign`.

---

## Layer 5: Wilson lines and light-ray operators

References: Polyakov, *Nucl. Phys. B* **164** (1980) 171; Dotsenko and Vergeles, *Nucl. Phys. B*
**169** (1980) 527; Brandt, Neri and Sato, *Phys. Rev. D* **24** (1981) 879; Korchemsky and
Radyushkin, *Nucl. Phys. B* **283** (1987) 342; Collins and Soper, *Nucl. Phys. B* **194** (1982)
445; Balitsky and Braun, *Nucl. Phys. B* **311** (1989) 541; Altarelli and Parisi, *Nucl. Phys. B*
**126** (1977) 298.

### 5.1 The Wilson line as a formal power series

For a piecewise smooth path `C` and a representation, the Wilson line is the path-ordered
exponential, defined as a formal power series in the coupling whose `n`-th coefficient is the
ordered `n`-fold integral of the gauge field along the path.

Statements to prove:

- The composition law for concatenated paths, the inverse for the reversed path, and the
  differential equation in the endpoint, each as an identity of formal power series.
- Gauge covariance order by order: under a BRST variation the line transforms by the ghost at its
  two endpoints; a closed line traced over colour and an open line between two matter fields are
  `s`-closed.
- **Eikonal Feynman rules.** For a straight path with direction `n`, in momentum space, the `n`-th
  coefficient is a product of eikonal propagators `1/(n·k + i0)` and vertices `g n^μ T^a`. The sign
  of `i0` is determined by whether the line extends to the future or to the past; this is the fact
  the sign-change theorem of `TransverseMomentumDistributions` Layer 1.4 rests on.
- The eikonal identity: the sum over the orderings of `n` gluons attached to one straight line is
  the product of single-gluon factors, when the colour matrices commute; the non-abelian statement
  with its commutator terms.
- Superficial power counting for graphs with eikonal lines: an eikonal propagator counts as
  dimension one.

### 5.2 Renormalisation of smooth lines

Statements to prove:

- A smooth closed curve, or a smooth open curve with matter fields at its ends, none of whose
  tangents is light-like: the Green functions of the Wilson-line operator are finite after
  coupling and field renormalisation, up to a single multiplicative constant. In dimensional
  regularisation the linear divergence proportional to the length is absent, and the constant is
  that of the endpoints.
- The straight line of finite length between a heavy-quark-like pair: the endpoint anomalous
  dimension at one loop.
- The divergences come only from regions where all gluon attachments on the line approach one
  point; this locality-on-the-line statement is the counterpart of 1.4 and is proved by the same
  differentiation argument, applied to the variation of the path.

### 5.3 Cusps

Statements to prove:

- A path with a cusp of Minkowski angle `χ` between two non-light-like tangents requires one
  further multiplicative constant `Z_cusp(χ)`, depending on the path only through `χ`; its
  anomalous dimension is the *cusp anomalous dimension* `Γ_cusp(χ, a₄)`.
- One loop: `Γ_cusp(χ, a₄) = 4 C_R a₄ (χ coth χ − 1) + O(a₄²)` in Convention 3 normalised to
  `d/d log μ`, with `C_R` the Casimir of the representation; the normalisation to `log μ²` is
  stated alongside. It vanishes at `χ = 0`, where the path is smooth.
- **Large-angle asymptotics.** As `χ → ∞`, `Γ_cusp(χ, a₄) = χ · Γ_cusp(a₄) + O(χ⁰)`, with the
  *light-like cusp anomalous dimension* `Γ_cusp(a₄) = 4 C_R a₄ + O(a₄²)`. The linear growth is
  proved at one loop and stated at all orders as the hypothesis `HasLinearCuspGrowth`, since its
  all-orders proof uses the renormalisation-group structure of light-like lines, which is
  `InfraredStructure` Layer 7.
- Casimir scaling at one and two loops: the ratio of the adjoint and fundamental cusp anomalous
  dimensions is `C_A / C_F`.
- A light-like segment: the ultraviolet anomalous dimension acquires a term linear in
  `log μ²`, the operator is not multiplicatively renormalisable in the sense of 5.2, and there are
  in addition divergences from large rapidity that dimensional regularisation does not regulate.
  The first two statements are proved here; the rapidity divergences and their regulators are
  `InfraredStructure` Layer 7.
- The argument `gammaCusp` of `EpsilonEridani.Particles.Parton.TMD.CuspConsistent` is
  `γ_K = 2 Γ_cusp(a₄)` in the fundamental representation, normalised to `d/d log μ`: at one loop
  `γ_K = 2 α_s C_F / π` while `Γ_cusp = α_s C_F / π`. The factor of two is recorded here because
  both functions are called "the cusp anomalous dimension" in the literature. The theorem
  identifying `−γ_K` with the `μ`-derivative of the Collins–Soper kernel is `InfraredStructure`
  Layer 7.

### 5.4 The light-ray operator of a parton density

For a light-like vector `n`, the bilocal quark operator is
`O_q(z) = ψ̄(z n) n̸ W[z n, 0] ψ(0)` with `W` the straight Wilson line in the fundamental
representation, and the gluon operator `O_g(z)` is the corresponding product of two field
strengths contracted with `n` and joined by an adjoint line.

Statements to prove:

- `O_q(z)` and `O_g(z)` are `s`-closed, and their formal Taylor expansion in `z` is the generating
  function of the twist-two operators of 3.5 with `Δ = n`: the coefficient of `zⁿ⁻¹/(n−1)!`, up
  to the stated factors of `i`, is `O_q^n`. The expansion is formal; no convergence is claimed for
  the bare operator.
- The *unrenormalised density* of a parton in a target state is the Fourier transform in `z` of
  the forward matrix element of the light-ray operator, a function of the momentum fraction `x`.
  Support in `−1 ≤ x ≤ 1` is proved for the matrix element of the operator between states of a
  given momentum from the spectral condition, taken as the hypothesis `HasSpectralSupport`; the
  relation between negative `x` and the antiquark density is proved.
- The matrix element is independent of the path only for the straight line; for the straight
  light-like line between the two fields there is no cusp and no rapidity divergence in the
  forward matrix element — the rapidity divergences of real and virtual graphs cancel. The
  cancellation at one loop is proved here by direct calculation; the all-orders statement is
  `InfraredStructure` Layer 7.

### 5.5 Ultraviolet renormalisation of the light-ray operator: the DGLAP kernel

Statements to prove:

- **Renormalisation by convolution.** The ultraviolet divergences of the light-ray operators are
  removed by a renormalisation that is a Mellin convolution in the momentum fraction:
  `[f_i](x, μ) = Σ_j ∫_x^1 (dξ/ξ) Z_{ij}(x/ξ, a₄, eps) f_j^{bare}(ξ)`, with `Z_{ij}` pure pole
  parts in minimal subtraction whose coefficients are distributions in the normal form of
  `CollinearEvolution` Convention 4. That the counterterm is a convolution, rather than a general
  integral operator, follows from boost invariance along `n` and dimensional analysis, and is a
  theorem.
- **The evolution equation.** The renormalised densities satisfy
  `d [f_i] / d log μ² = Σ_j P_{ij} ⊗ [f_j]`, where `P_{ij}` is the simple-pole coefficient of
  `Z_{ij}` by the residue formula of 2.4, as an identity of formal power series in `a₄`.
- **The kernel is the DGLAP kernel.** At one loop `P_{ij}` is the leading-order splitting kernel
  of `CollinearEvolution` Layer 1.2, in Conventions 2 and 6. The plus distribution and the
  coefficient of `δ(1 − z)` arise from the virtual graphs and are fixed by the calculation, not by
  a sum rule; the sum rules then hold as consequences of 3.3.
- **Consistency with local operators.** The Mellin moment at index `n` of `Z_{ij}` is the
  renormalisation matrix of the twist-two operators of spin `n`, so that the moments of `P_{ij}`
  are the anomalous dimensions of 3.6; this uses
  `mellinDis_convolveAt` of `EpsilonEridani.QFT.Factorization.Convolution.Mellin` and
  `mellinDis_dglapOperator` of `EpsilonEridani.QFT.Factorization.Evolution.CollinearForm`. The
  interchange of the formal expansion in `z` with renormalisation is the content of the theorem:
  it holds for the renormalised operator and fails for the bare one.
- The renormalised density is the object that `FactorizationTheorems` Layer 0 takes as the
  definition of a parton density, and the evolution equation above is the one it cites in its
  Layer 1.
- The non-singlet polarised and the transversity light-ray operators, with `n̸ γ₅` and
  `n̸ γ_⊥ γ₅` on an open quark line under Convention 9, renormalise at one loop by the non-singlet
  polarised kernel of `CollinearEvolution` Layer 4.1 and the transversity kernel of its Layer 4.2.
  The mixing of the polarised quark and gluon operators involves a closed fermion loop with a
  single `γ₅`, or a Levi-Civita tensor in `d` dimensions, already at one loop, and is outside this
  roadmap by Convention 9; `CollinearEvolution` Layer 4.1 states those kernels.

### 5.6 Off-forward, vacuum-to-hadron and final-state matrix elements

The operators `O_q(z)` and `O_g(z)` of 5.4 are renormalised as operators; 5.5 states the result
for forward matrix elements. Three further kinds of matrix element are consumed by
`FactorizationTheorems`, and each is a target here.

Statements to prove:

- **Off-forward matrix elements.** Between states of different momenta the total derivatives of
  the twist-two operators of 3.5 do not vanish, and the renormalisation matrix of spin `n` acts
  on the operators `∂^k O^{n−k}`; it is triangular in `k`, with the forward anomalous dimensions
  of 3.6 on its diagonal. This is a theorem about the operators and uses 3.2 only.
- **The off-forward kernel.** In the variables `(x, ξ)` conjugate to the two light-cone
  positions, with `ξ` the skewness, the counterterm is an integral operator in `x` at fixed `ξ`:
  renormalisation does not change `ξ` or the momentum transfer. Its simple-pole coefficient is
  the generalised kernel that `GeneralizedPartonDistributions` Layer 4.1 poses as a semigroup
  generator. Prove the two limits: at `ξ = 0` the kernel is `P_{ij}` of 5.5, and on the region
  `|x| ≤ ξ`, rescaled to `ξ = 1`, the non-singlet kernel is the kernel of `MesonStructure`
  Layer 2.3. Compute the one-loop non-singlet kernel explicitly.
- **Diagonalisation at one loop.** The one-loop non-singlet off-forward renormalisation matrix
  is diagonal in the basis of operators whose coefficient polynomials are the Gegenbauer
  polynomials of index `3/2` of `EpsilonEridani.Mathematics.SpecialFunctions.Gegenbauer.Basic`,
  with eigenvalues the forward anomalous dimensions of 3.6. This is a one-loop statement; beyond
  one loop the matrix is triangular and not diagonal, and the roadmap proves the triangularity
  and does not assert the diagonal form.
- **Vacuum-to-hadron matrix elements.** The matrix element of `O_q(z)` between the vacuum and a
  one-hadron state, Fourier transformed in `z`, is the unrenormalised leading-twist distribution
  amplitude of `MesonStructure` Layer 2.1; it renormalises by the `ξ = 1` kernel above. Support
  in the momentum fraction is proved under `HasSpectralSupport`.
- **Final-state matrix elements.** The fragmentation operator is not a matrix element of a
  time-ordered product: it is the sum over unobserved final states `X` of
  `⟨0| W ψ(0) |h X⟩ ⟨h X| ψ̄(z n) W† |0⟩`, and its graph expansion is the cut-graph sum of
  `FeynmanIntegrals` Layer 7 with the observed line fixed. Prove that its ultraviolet
  divergences are removed by a Mellin convolution in the momentum fraction, by the argument of
  5.5 applied to cut graphs, and that the simple-pole coefficients are the timelike kernels of
  `Hadronization`. At one loop the quark-to-quark kernel equals the spacelike one of 5.5; state
  and prove the one-loop relation for the off-diagonal entries with the factors the calculation
  gives. Beyond one loop the timelike and spacelike kernels differ, and no relation between
  them is asserted here.

### Examples

- The one-loop cusp anomalous dimension computed from the single-gluon exchange across the cusp,
  with the limits `χ → 0` (quadratic vanishing) and `χ → ∞` (linear growth) exhibited.
- A rectangular Wilson loop with four right-angle Euclidean cusps: the cusp divergences counted.
- The one-loop quark-in-quark density: the three graphs, their poles, the assembly into
  `C_F [(1 + z²)/(1 − z)]₊`, and the cancellation of the rapidity divergence between the real graph
  and the Wilson-line self-energy.
- A light-ray operator with a non-straight link between the same two points, whose forward matrix
  element has an additional cusp divergence, showing that "the Wilson line needed for gauge
  invariance" does not determine the operator.
- The bare light-ray operator's second moment computed two ways — expanding first and
  renormalising, and renormalising first and taking the moment — with the mismatch for the bare
  operator displayed.

### Dependencies

Layers 0 to 4. `FeynmanIntegrals` Layers 4, 5 and 6. `EpsilonEridani.QFT.QCD.Basic`,
`EpsilonEridani.QFT.QCD.CasimirDerivation`,
`EpsilonEridani.QFT.Factorization.Convolution.Mellin`,
`EpsilonEridani.QFT.Factorization.Convolution.Collinear`,
`EpsilonEridani.QFT.Factorization.Evolution.Basic`,
`EpsilonEridani.QFT.Factorization.Evolution.CollinearForm`,
`EpsilonEridani.Mathematics.Distribution.PlusFunctional`,
`EpsilonEridani.Particles.Parton.TMD.CollinsSoper`, `TauCeti.RingTheory.PowerSeries.Exp`. From
`CollinearEvolution`: Layer 0.3 for plus distributions, Layers 1.2, 4.1 and 4.2 for the kernels.
To `InfraredStructure` Layer 7: rapidity divergences and the light-like renormalisation group. To
`FactorizationTheorems` Layers 0 and 1: the operator definition of a density and its evolution;
to its Layers 2 and 5: the final-state, off-forward and vacuum-to-hadron matrix elements of 5.6.
From `GeneralizedPartonDistributions` Layer 4.1, `MesonStructure` Layers 2.1 and 2.3 and
`Hadronization`: the objects whose kernels 5.6 derives.

---

## Layer 6: the operator product expansion in perturbation theory

References: Wilson, *Phys. Rev.* **179** (1969) 1499; Zimmermann, *Ann. Phys.* **77** (1973) 536
and 570; Wilson and Zimmermann, *Commun. Math. Phys.* **24** (1972) 87; Chetyrkin, Tkachov and
Gorishny, *Phys. Lett. B* **119** (1982) 407; Smirnov, *Commun. Math. Phys.* **134** (1990) 109;
Keller and Kopper, *Commun. Math. Phys.* **148** (1992) 445; Hollands and Kopper, *Commun. Math.
Phys.* **313** (2012) 257.

### 6.1 Normal products

For an operator `O` of canonical dimension `Δ` and an integer `δ ≥ Δ`, the *normal product*
`N_δ[O]` is the insertion renormalised by subtracting every renormalisation part containing the
operator vertex as if the operator had dimension `δ`: with the Taylor operator of degree
`δ − Δ(external)` in the momentum-space scheme.

Statements to prove:

- `N_δ[O]` has finite insertions; `N_Δ[O]` is the minimally subtracted operator of that scheme.
- **The Zimmermann identity.** For `δ′ > δ`,
  `N_δ[O] = N_{δ′}[O] + Σ_j r_j N_{δ′}[O_j]`, the sum over the operators `O_j` of dimension at
  most `δ′` with the quantum numbers of `O`, with coefficients `r_j` that are formal power series
  in the coupling starting at first order, given by explicit sums of subtracted graphs. Proved
  from the forest formula by comparing the two sets of subtractions.
- The equations of motion and the action principle hold for normal products with the stated
  degrees; anomalous terms are Zimmermann-identity terms.
- Conversion between normal products and minimally subtracted operators: a finite renormalisation
  in the sense of 3.2.

### 6.2 The expansion

Let `A` and `B` be local operators and consider the Green functions of the time-ordered product
`T A(x) B(0)` with any number of elementary fields at fixed non-exceptional momenta, in a
Euclidean theory with strictly positive masses.

Statements to prove:

- **Existence of the coefficients.** For every `δ` there are functions `C_k^{(δ)}(x)`, one for
  each of the finitely many operators `O_k` of dimension at most `δ` with the quantum numbers of
  the product, each a formal power series in the coupling with coefficients that are smooth for
  `x ≠ 0`, defined as explicit sums of Green functions with subtractions at zero momentum in the
  momenta of the elementary fields.
- **The expansion with remainder.** At each order `L` in the coupling and for each such Green
  function,
  `⟨T A(x) B(0) X⟩ − Σ_{Δ(O_k) ≤ δ} C_k^{(δ)}(x) ⟨N_δ[O_k](0) X⟩ = O(|x|^{δ + 1 − Δ(A) − Δ(B)} · |log |x||^{L})`
  as `x → 0`, in `Asymptotics.IsBigO` along the punctured-neighbourhood filter, uniformly on
  compact sets of the external momenta. The proof route is Zimmermann's: the left side is the
  bilocal product with oversubtraction in the subgraphs containing both `A` and `B`, and the
  subtracted integrand is bounded by the power counting of `FeynmanIntegrals` Layer 3 applied with
  the large momentum conjugate to `x`.
- **The coefficients are short-distance objects.** `C_k^{(δ)}(x)` is independent of the
  elementary fields `X` and of their momenta: the same functions serve every Green function. This
  independence, not the existence of some expansion, is the substance, and it is stated
  separately.
- **Scaling of the coefficients.** In a massless theory at each order,
  `C_k(x) = |x|^{Δ(O_k) − Δ(A) − Δ(B)}` times a polynomial in `log(x² μ²)` of degree at most the
  loop order times a tensor structure; with masses, the same up to terms polynomial in `m² x²`.
- **Momentum-space form.** The Fourier transform in `x` at large Euclidean momentum `q`: the
  expansion is in inverse powers of `q²` with logarithms, the remainder is
  `O((1/q²)^{(δ + 1 − Δ(A) − Δ(B) + d)/2})` up to logarithms, and polynomial terms in `q` —
  contact terms — are not determined by the expansion and are carried as data.
- **Minimal subtraction.** The expansion holds with minimally subtracted operators and
  coefficients related to the normal-product ones by the finite renormalisation of 6.1; in this
  form, in a massless theory, the coefficient functions are computed from massless propagator-type
  integrals and are polynomial in masses when masses are restored.

The setting is stated honestly. The remainder bound is proved for Euclidean separations and
non-exceptional momenta of the elementary fields in a massive theory. For a massless theory the
same statement holds at non-exceptional momenta with the scheme of 1.6, and is a target with that
hypothesis. The expansion for matrix elements between physical on-shell states, and the light-cone
expansion at `x² → 0` with `x` fixed, are consequences drawn in `FactorizationTheorems` Layer 1
under the hypotheses stated there; they are not asserted here. Convergence of the expansion at
finite `x`, known at each order in massive Euclidean theories, is not used by any roadmap in the
collection and is not a target.

### 6.3 The expansion of two currents and the twist-two coefficients

Statements to prove:

- For two vector currents of a vector-like gauge theory, current conservation of 3.3 constrains the
  tensor structure of the coefficients: the expansion of `T j^μ(x) j^ν(0)` is transverse, and the
  operators appearing at leading power in each spin are those of 3.5.
- The leading-order coefficients of the twist-two quark operators of spin `n` are fixed by the
  free-field expansion and equal the squared charge, for even `n` in the charge-conjugation-even
  channel; the gluon operators' coefficients begin at first order in the coupling.
- The organisation by twist: at fixed spin, the contribution of an operator of twist `τ` to the
  coefficient of `(1/q²)` carries the relative power `(1/q²)^{(τ − 2)/2}`, so that the remainder
  after the twist-two terms is suppressed by one power of `1/q²` up to logarithms.

### 6.4 The renormalisation-group equation for the coefficients

Statements to prove:

- `[ ∂/∂ log μ² + β ∂/∂ a₄ − γ_A − γ_B ] C_k + Σ_j C_j γ_{jk} = 0` in a massless scheme, with
  `γ_{jk}` the anomalous-dimension matrix of Convention 4, `d [O_j] / d log μ² = Σ_k γ_{jk} [O_k]`,
  and `γ_A`, `γ_B` defined in the same way, as an identity of formal power series. The signs are
  fixed by differentiating both sides of the expansion: the left side gives `(γ_A + γ_B)` times
  the product, the right side gives the derivative of `C_k` plus `C_j γ_{jk}`.
  It follows from the renormalisation-group equations of 2.5 and 3.2 for both sides of the
  expansion and the linear independence of the insertions `⟨[O_k] X⟩` as `X` varies; that linear
  independence is a lemma with its own proof.
- For conserved currents `γ_A = γ_B = 0`.
- **Scale independence of the product.** For each spin `n`, the sum over the twist-two operators
  `Σ_k C_k^n(Q²/μ², a₄(μ)) · ⟨[O_k^n]⟩(μ)` is independent of `μ`, as an identity of formal power
  series in the coupling at a reference scale.

### 6.5 The theorem behind `OPEData`

`InclusiveStructureFunctions` Layer 4.2 defines the record `OPEData`, carrying a Wilson coefficient
`C(n, τ, Q²/μ²)` and a reduced matrix element `A(n, τ, μ²)` with the moment identity
`M_n(Q²) = Σ_τ C · A / Q^{τ−2}`, and takes the `μ`-independence of `C · A` as a hypothesis.

Statements to prove:

- From 6.2 to 6.4, at each order in perturbation theory, the coefficients and reduced matrix
  elements of the twist-two operators of spin `n` define the `τ = 2` entries of an `OPEData`
  record for which the scale-independence hypothesis holds; in the singlet channel the product is
  the two-component contraction over quark and gluon operators and the record's `C · A` is that
  contraction.
- The renormalisation-group equation of 6.4, combined with 3.6, is the moment-space form of the
  compensation condition of
  `EpsilonEridani.QFT.Factorization.Scales.isFactorizationScaleIndependent_iff_dglap_compensation`.
- What is not supplied by this roadmap is the identification of the moments `M_n(Q²)` of a
  measured structure function with the forward matrix element of the current product: that step
  needs the dispersion relation of `InclusiveStructureFunctions` Layer 4.1 and the passage from
  Green functions to hadronic matrix elements, and is `FactorizationTheorems` Layer 1. The
  convergence of the sum over `τ` in `OPEData` is not a consequence of the perturbative expansion
  and remains the hypothesis it is there.

### 6.6 Bilocal operators at short separation

The expansion of 6.2 is stated for a product of two local operators. Two bilocal operators joined
by Wilson lines are expanded in the same way, and `FactorizationTheorems` Layers 1 and 3 consume
the results.

Statements to prove:

- **The space-like bilocal operator.** For the quark operator `ψ̄(z) Γ W[z, 0] ψ(0)` with `z`
  space-like and `W` the straight line, renormalised by 5.2 with the two endpoint constants, the
  Green functions with elementary fields at fixed non-exceptional momenta have, as `z² → 0` at
  fixed `z · p` for each external momentum `p`, an expansion on the light-ray operators of 5.4
  with coefficient functions that are polynomial in `log(−z² μ²)` at each order, and a remainder
  `O(z² · |log(−z²)|^L)` relative to the leading term at order `L`. The proof is that of 6.2
  with the Wilson line expanded by 5.1; the linear divergence of the line is absent in
  dimensional regularisation by `FeynmanIntegrals` Layer 4 and its treatment in a lattice
  regularisation is `LatticeBridge`'s.
- **The one-loop coefficient.** The coefficient function at first order for the vector
  structure, as an explicit distribution in the momentum fraction, with its logarithm fixed by
  the kernel `P_{qq}` of 5.5. This is the kernel that `LatticeBridge` Layer 3.3 carries.
- **The transversely separated operator.** For the operator with the two fields separated by
  `b_T` at equal light-cone position and joined by a staple-shaped line, with the rapidity
  regulator of `InfraredStructure` Layer 7 in place, the expansion as `b_T → 0` on the
  light-ray operators of 5.4, with coefficient functions depending on `log(b_T² μ²)` and on the
  rapidity scale, and a remainder `O(b_T² · |log b_T|^{2L})`. The expansion is stated for the
  regulated operator; the removal of the regulator is `InfraredStructure` Layer 7's, and the
  resulting statement for distributions is `TransverseMomentumDistributions` Layer 4.1.
- **Renormalisation-group equations.** The coefficient functions of both expansions satisfy the
  equation of 6.4 with the anomalous dimension of the bilocal operator on one side and the
  kernel of 5.5 acting by convolution on the other.

### Examples

- `T φ(x) φ(0)` in `φ⁴` at one loop: the coefficients of `1`, `φ²` and `∂φ ∂φ`, the remainder
  bound verified, and the coefficient of `φ²` shown to be the same in the two-point and four-point
  functions.
- The free-field expansion of two vector currents of free quarks: the tower of twist-two
  operators summed back into the light-ray operator of 5.4 with a free propagator between the
  currents.
- A Green function at exceptional momenta for which the massless coefficient function computed
  naively has an infrared divergence, showing that the non-exceptional hypothesis is used.
- An expansion truncated at dimension `δ` with coefficients chosen to depend on the external
  momenta: it reproduces any function, showing that independence of `X` is the content.
- The one-loop coefficient of the spin-two quark operator and its `μ` dependence, checked against
  6.4 with the anomalous dimension of 3.6.

### Dependencies

Layers 0 to 5. `FeynmanIntegrals` Layers 2 to 5. `Mathlib.Analysis.Asymptotics.Defs`,
`EpsilonEridani.QFT.Factorization.Scales.Basic`,
`EpsilonEridani.QFT.Factorization.Evolution.MomentSpace`. From `InclusiveStructureFunctions`: the
record `OPEData` of Layer 4.2 and the twist-two operators named in its Layer 4.3. From
`CollinearEvolution`: Layer 2.3 for the running coupling. To `FactorizationTheorems` Layer 1: the
expansion, the coefficient functions and their renormalisation-group equation.

---

## Dependency graph

```
                    FeynmanIntegrals (Layers 0-6)
                               |
                               v
  Layer 0  divergent subgraphs, forests, Hopf algebra of graphs
                               |
                               v
  Layer 1  R-operation, BPHZ finiteness and locality, Birkhoff decomposition
                               |
                               v
  Layer 2  minimal subtraction, schemes, beta function,   <----  CollinearEvolution
           anomalous dimensions, one-loop QCD coefficients       (running coupling)
                               |
               +---------------+----------------+
               v                                v
  Layer 3  composite operators,          Layer 4  BRST, Slavnov-Taylor,
           mixing, conserved currents,            Ward identities, relations
           twist-two operators  <--------------   among Z's, gauge-invariant
               |                                  operators
               |                                |
               +---------------+----------------+
                               v
  Layer 5  Wilson lines, cusp anomalous dimension,
           light-ray operator, DGLAP kernel  ---------->  InfraredStructure (Layer 7)
                               |
                               v
  Layer 6  operator product expansion, Wilson coefficients,
           RG equation, the theorem behind OPEData
                               |
                               v
                 FactorizationTheorems (Layers 0, 1)
```

Layers 0 and 1 need only `FeynmanIntegrals`, and Layer 0 is pure combinatorics and algebra that can
be built before any integral exists. Layer 2 needs Layer 1 for the existence of the constants and
is the first layer to touch the existing QCD modules. Layers 3 and 4 are mutually dependent in one
place only: the statements of 3.4 are proved in 4.5; everything else in Layer 3 is independent of
Layer 4, and everything in Layer 4 before 4.5 is independent of Layer 3. Layer 5 needs both. Layer 6
needs Layers 1 to 3 for a scalar theory and Layers 4 and 5 for the gauge-theory statements of 6.3
and 6.5.

## Acceptance examples

The roadmap is complete when the following are statements in EpsilonEridani with proofs, or, where
marked, with explicitly named hypotheses:

1. The graph algebra of a renormalisable theory is an instance of `HopfAlgebra`, obtained from
   coassociativity of the subgraph coproduct and the general theorem that a connected `ℕ`-graded
   bialgebra has an antipode; the coproducts and antipodes of the two-loop `φ⁴` self-energy graphs
   are computed.
2. The forest formula equals the recursive R-operation, for an arbitrary subtraction operator, with
   the bijection between normal forests and sets of disjoint parts with sub-forests as the proof.
3. The BPHZ theorem in the momentum-space form for Euclidean theories with strictly positive
   masses: the forest-subtracted integrand of every graph of `φ⁴`, QED and QCD is absolutely
   integrable; and in the dimensionally regularised form: `R(Γ)` has non-negative
   `meromorphicOrderAt` at `eps = 0`.
4. Every minimal-subtraction counterterm is a polynomial in external momenta and masses of degree
   at most the superficial degree of divergence, with `μ`-independent coefficients; the cancellation
   of the `(1/eps) log(p²/μ²)` term in the two-loop `φ⁴` self-energy is exhibited.
5. The algebraic Birkhoff decomposition for a connected graded commutative Hopf algebra and an
   idempotent Rota–Baxter operator, existence and uniqueness, with `φ₋ = C` and `φ₊ = R` for the
   Feynman-rules character; and the counterexample with a non-Rota–Baxter projection.
6. The residue formula and the pole equations: `β` and `γ` are determined by the simple poles, all
   higher poles are determined by them, and the `a²/eps²` coefficient of the two-loop `φ⁴` coupling
   counterterm obtained both ways agrees.
7. Any two schemes are related by a finite renormalisation; the transformation law of the first
   three beta coefficients and the first two anomalous-dimension coefficients under it.
8. The one-loop QCD renormalisation constants computed from integrals satisfy
   `SlavnovTaylorAssumptions`, `PrimitivePoleAssumptions` and `Beta0RenormalizationAssumptions`,
   and the beta coefficient from the residue formula equals `EpsilonEridani.QFT.QCD.beta0`, with
   the matching between `d = 4 − 2ε` and `regularizedDimension` stated as a lemma.
9. The renormalisation-group equation for one-particle-irreducible Green functions with operator
   insertions, as an identity of formal power series at every order.
10. `Z_j = 1` to all orders for a conserved current under a symmetry-preserving regularisation, and
    non-renormalisation of the total energy-momentum tensor, with the vanishing of `γ_qq(1)` and of
    the column sums of the spin-two singlet matrix as corollaries.
11. The one-loop anomalous-dimension matrix of the twist-two operators of spin `n` equals the
    Mellin moments at `N = n` of the leading-order kernels of `CollinearEvolution` Layer 1.5, as an
    equality between residues of operator insertions and moments of explicit functions.
12. `s² = 0` for the BRST differential; the Slavnov–Taylor identity for the dimensionally
    regularised and for the minimally subtracted generating functional of a vector-like gauge
    theory at every order; and `Z_g = Z_{1F} Z_2⁻¹ Z_3^{−1/2} = Z_{1c} Z_{3c}⁻¹ Z_3^{−1/2}` to all
    orders.
13. `Z₁ = Z₂` and transversality of the vacuum polarisation in QED to all orders, with the
    telescoping identity for longitudinal photon insertions on a fermion line.
14. The beta function and the anomalous dimensions of gauge-invariant operators are independent of
    the gauge parameter; the block-triangular mixing of gauge-invariant, BRST-exact and
    equation-of-motion operators; and the vanishing of the latter two classes in physical matrix
    elements.
15. The one-loop cusp anomalous dimension `4 C_R a₄ (χ coth χ − 1)`, its vanishing at `χ = 0` and
    its linear growth at large `χ`, with the coefficient the light-like cusp anomalous dimension.
16. The light-ray operator of a parton density renormalises by a Mellin convolution, the
    renormalised density satisfies `d[f]/d log μ² = P ⊗ [f]` with `P` the simple-pole coefficient,
    `P` at one loop is the leading-order DGLAP kernel in its normal form with the `δ(1 − z)` term
    derived from the virtual graphs, and the Mellin moments of `P` are the anomalous dimensions of
    item 11.
17. The Zimmermann identity relating normal products of different degree.
18. The operator product expansion of two local operators at every order, with coefficient
    functions independent of the external fields and remainder
    `O(|x|^{δ + 1 − Δ(A) − Δ(B)} |log |x||^L)`, for Euclidean massive theories; the massless
    statement with `NonExceptional` as a hypothesis; and the `φ⁴` one-loop example.
19. The renormalisation-group equation of the Wilson coefficients and the `μ`-independence of
    `Σ_k C_k^n ⟨[O_k^n]⟩` at every order, giving an `OPEData` record's twist-two entries with the
    scale-independence hypothesis of `InclusiveStructureFunctions` Layer 4.2 proved.
20. The obstruction theorem for `γ₅`: an anticommuting `γ₅` with cyclic trace forces
    `tr(γ₅ γ^μ γ^ν γ^ρ γ^σ) = 0` for `d ≠ 4`, together with the consistency theorem on open lines.

## References

- N. N. Bogoliubov and O. S. Parasiuk, "Über die Multiplikation der Kausalfunktionen in der
  Quantentheorie der Felder", *Acta Math.* **97** (1957) 227. The R-operation.
- K. Hepp, "Proof of the Bogoliubov–Parasiuk theorem on renormalization", *Commun. Math. Phys.*
  **2** (1966) 301. Sectors and the convergence proof.
- W. Zimmermann, "Convergence of Bogoliubov's method of renormalization in momentum space",
  *Commun. Math. Phys.* **15** (1969) 208. The forest formula and Layer 1.3.
- S. Weinberg, "High-energy behavior in quantum field theory", *Phys. Rev.* **118** (1960) 838. The
  convergence theorem consumed from `FeynmanIntegrals`.
- J. H. Lowenstein and W. Zimmermann, "The power counting theorem for Feynman integrals with
  massless propagators", *Commun. Math. Phys.* **44** (1975) 73. Layer 1.6.
- E. R. Speer, "Analytic renormalization", *J. Math. Phys.* **9** (1968) 1404.
- G. 't Hooft and M. Veltman, "Regularization and renormalization of gauge fields", *Nucl. Phys.
  B* **44** (1972) 189.
- G. 't Hooft, "Dimensional regularization and the renormalization group", *Nucl. Phys. B* **61**
  (1973) 455. The residue formula and pole equations of Layer 2.4.
- J. C. Collins, "Structure of counterterms in dimensional regularization", *Nucl. Phys. B* **80**
  (1974) 341. Polynomiality and `μ`-independence of minimal-subtraction counterterms.
- P. Breitenlohner and D. Maison, "Dimensional renormalization and the action principle",
  *Commun. Math. Phys.* **52** (1977) 11.
- W. E. Caswell and A. D. Kennedy, "Simple approach to renormalization theory", *Phys. Rev. D*
  **25** (1982) 392. The differentiation proof of locality.
- J. C. Collins, *Renormalization*, Cambridge University Press (1984). Chapters 5 to 7 and 12 are
  the reference for Layers 1 to 4.
- D. Kreimer, "On the Hopf algebra structure of perturbative quantum field theories", *Adv. Theor.
  Math. Phys.* **2** (1998) 303.
- A. Connes and D. Kreimer, "Renormalization in quantum field theory and the Riemann–Hilbert
  problem I: the Hopf algebra structure of graphs and the main theorem", *Commun. Math. Phys.*
  **210** (2000) 249; "II: the β-function, diffeomorphisms and the renormalization group",
  *Commun. Math. Phys.* **216** (2001) 215. Layers 0.4, 0.5, 1.5 and the Hopf-algebraic form of
  2.4.
- C. G. Callan, "Broken scale invariance in scalar field theory", *Phys. Rev. D* **2** (1970) 1541.
- K. Symanzik, "Small distance behaviour in field theory and power counting", *Commun. Math.
  Phys.* **18** (1970) 227.
- D. J. Gross and F. Wilczek, "Asymptotically free gauge theories. I", *Phys. Rev. D* **8** (1973)
  3633; "II", *Phys. Rev. D* **9** (1974) 980. The twist-two anomalous dimensions of Layer 3.6.
- H. Georgi and H. D. Politzer, "Electroproduction scaling in an asymptotically free theory of
  strong interactions", *Phys. Rev. D* **9** (1974) 416.
- G. Altarelli and G. Parisi, "Asymptotic freedom in parton language", *Nucl. Phys. B* **126**
  (1977) 298. The kernels identified in Layer 5.5.
- C. Becchi, A. Rouet and R. Stora, "Renormalization of the abelian Higgs–Kibble model", *Commun.
  Math. Phys.* **42** (1975) 127; "Renormalization of gauge theories", *Ann. Phys.* **98** (1976)
  287.
- A. A. Slavnov, "Ward identities in gauge theories", *Theor. Math. Phys.* **10** (1972) 99.
- J. C. Taylor, "Ward identities and charge renormalization of the Yang–Mills field", *Nucl. Phys.
  B* **33** (1971) 436.
- S. D. Joglekar and B. W. Lee, "General theory of renormalization of gauge invariant operators",
  *Ann. Phys.* **97** (1976) 160. Layers 3.4 and 4.5.
- A. M. Polyakov, "Gauge fields as rings of glue", *Nucl. Phys. B* **164** (1980) 171.
- V. S. Dotsenko and S. N. Vergeles, "Renormalizability of phase factors in non-abelian gauge
  theory", *Nucl. Phys. B* **169** (1980) 527.
- R. A. Brandt, F. Neri and M. Sato, "Renormalization of loop functions for all loops", *Phys.
  Rev. D* **24** (1981) 879.
- G. P. Korchemsky and A. V. Radyushkin, "Renormalization of the Wilson loops beyond the leading
  order", *Nucl. Phys. B* **283** (1987) 342. The cusp anomalous dimension of Layer 5.3.
- J. C. Collins and D. E. Soper, "Parton distribution and decay functions", *Nucl. Phys. B* **194**
  (1982) 445. The operator definition of Layer 5.4.
- I. I. Balitsky and V. M. Braun, "Evolution equations for QCD string operators", *Nucl. Phys. B*
  **311** (1989) 541. Renormalisation of light-ray operators.
- K. G. Wilson, "Non-Lagrangian models of current algebra", *Phys. Rev.* **179** (1969) 1499.
- K. G. Wilson and W. Zimmermann, "Operator product expansions and composite field operators in
  the general framework of quantum field theory", *Commun. Math. Phys.* **24** (1972) 87.
- W. Zimmermann, "Composite operators in the perturbation theory of renormalizable interactions",
  *Ann. Phys.* **77** (1973) 536; "Normal products and the short distance expansion in the
  perturbation theory of renormalizable interactions", *Ann. Phys.* **77** (1973) 570. Layers 6.1
  and 6.2.
- K. G. Chetyrkin, F. V. Tkachov and S. G. Gorishny, "Operator product expansion in the minimal
  subtraction scheme", *Phys. Lett. B* **119** (1982) 407.
- V. A. Smirnov, "Asymptotic expansions in limits of large momenta and masses", *Commun. Math.
  Phys.* **134** (1990) 109.
- G. Keller and C. Kopper, "Perturbative renormalization of composite operators via flow equations
  I", *Commun. Math. Phys.* **148** (1992) 445.
- S. Hollands and C. Kopper, "The operator product expansion converges in perturbative field
  theory", *Commun. Math. Phys.* **313** (2012) 257.

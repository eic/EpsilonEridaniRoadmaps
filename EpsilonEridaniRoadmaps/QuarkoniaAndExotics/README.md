# Roadmap: quarkonium production, exotic hadrons, and spectroscopy

Hadrons containing heavy quarks, and hadrons that do not fit the quark-model classification: the
effective field theory that organises heavy-quarkonium states, the competing factorisation
statements for their production, the exotic multiquark candidates, and the spectroscopy that
classifies them. What distinguishes this area mathematically is a second expansion parameter — the
heavy quark's mass — and the non-relativistic effective theory built on it.

Everywhere else in the collection the expansion is in one hard scale against one hadronic scale.
Here there are three dynamical scales in the same bound state: the heavy quark mass `m`, the
relative momentum `m v`, and the binding energy `m v²`. The velocity `v` is a second small
parameter independent of the coupling, and every statement in this roadmap carries an order in
both. The effective theory that results — non-relativistic QCD, and below it potential NRQCD — is
the only place in this collection where an operator basis is graded by a power counting rather
than by twist, and building that grading honestly is the first layer's real work: the truncation
of a factorisation formula to finitely many terms is a *theorem* about the grading, not a
convention.

The production half of the roadmap ends at a hypothesis that the framework has not settled. NRQCD
factorisation asserts that the cross section is a finite sum of perturbative short-distance
coefficients times long-distance matrix elements, and that those matrix elements are universal —
the same numbers in every process. The roadmap states that assertion as the hypothesis it is,
proves the structural results that do follow (the finiteness of the sum, the cancellation of the
P-wave infrared divergence against the octet S-wave matrix element, the positivity of the diagonal
matrix elements, the falsifiability of universality as an overdetermined linear system), and
identifies the polarisation of the produced state at large transverse momentum as the observable
that discriminates the competing hypotheses. It does not dress universality as a milestone that a
contributor can discharge.

The spectroscopy half is amplitude analysis. A peak in an invariant-mass distribution is not a
state; a state is a pole of an analytically continued partial-wave amplitude on a specified sheet.
The distinction is made precise here, to the point of exhibiting a family of amplitudes with a
threshold cusp and provably no nearby pole, and it is the mathematical content of the whole exotic
hadron programme: the compact-multiquark and hadronic-molecule pictures are two hypotheses about
internal structure, and what the mathematics delivers is not a verdict but a set of conditional
predictions and exclusions.

Single-parton fragmentation is `Hadronization`; a quarkonium is not described by it, and the reason
is part of this roadmap. The photoproduction flux that reaches these states is `Photoproduction`.

## Scope

Included:

- The scale hierarchy `m ≫ m v ≫ m v²` for a heavy quark-antiquark pair, the two expansion
  parameters formed from it, and the two regimes distinguished by where `Λ_QCD` sits relative to
  the binding energy.
- Non-relativistic QCD as an effective Lagrangian: the two-component field content, the operator
  basis graded by velocity scaling, the finiteness of each graded piece, and the matching
  coefficients defined by equality of amplitudes with the full theory at a stated order.
- Potential NRQCD as a second matching step, with the static and velocity-suppressed potentials
  defined as matching coefficients rather than postulated.
- The renormalisation-group flow of the matching coefficients, as a one-parameter semigroup on a
  finite-dimensional coefficient space.
- The quarkonium spectrum: the radial eigenvalue problem for a confining potential, discreteness
  below the open-flavour threshold, the classification of states by radial, orbital, spin and
  total angular momentum, and the parity and charge-conjugation assignments *derived* from the
  quark content rather than tabulated.
- The colour decomposition of a quark-antiquark pair into singlet and octet, with projectors built
  from the proved colour algebra, and the spin decomposition into singlet and triplet.
- Spin-dependent corrections to the spectrum: spin-orbit, tensor and hyperfine operators as
  order-`v²` perturbations, and the resulting splitting pattern.
- The wave function at the origin, and the precise sense in which it is the only bound-state
  property entering the leading colour-singlet production amplitude.
- The colour-singlet model as a production hypothesis, and the theorem that it is the
  velocity-leading singlet-channel truncation of the NRQCD formula.
- NRQCD production factorisation: the sum over colour and spin channels, the definition of the
  long-distance matrix elements, the finiteness of the truncated sum, the scale independence of
  the product, and the infrared cancellation that forbids dropping the colour-octet channels.
- Universality of the long-distance matrix elements, stated as the framework's principal open
  hypothesis, together with what *is* provable about it: which linear combinations a single
  process determines, and the consistency condition that two processes impose.
- Positivity constraints on the matrix elements.
- The fragmentation contribution at large transverse momentum: the quarkonium fragmentation
  function, the leading-power theorem, the matching to the fixed-order calculation, and the
  reconciliation of the fragmentation form with the failure of a single-parton description at
  fixed order.
- The spin-density matrix of a produced vector state, the polarisation coefficients, the physical
  region that positivity of the density matrix carves out, the frame-rotation law and the
  rotation-invariant combination, and the polarisation predictions that discriminate the
  production hypotheses.
- Near-threshold production: the compatibility condition between the velocity expansion and the
  large-momentum-transfer expansion, the two-gluon exchange amplitude, and the explicit list of
  hypotheses needed to relate it to a gluonic matrix element of the proton.
- Partial-wave analysis: the angular basis, the projection of an amplitude onto partial waves,
  unitarity in the form `Im T⁻¹ = −ρ`, the Argand circle, analyticity and the dispersion relation,
  and the threshold behaviour set by the centrifugal barrier.
- The sheet structure of a multichannel amplitude, the definition of a resonance as a pole on a
  named sheet, mass and width as pole properties, the reality of the pole pattern under
  hermitian analyticity, and the factorisation of the residue into channel couplings.
- Coupled-channel unitarity and the K-matrix: the unitarity theorem for a real symmetric K-matrix,
  the discreteness of the set where the inverse fails, and the distinction between a bare K-matrix
  pole and a dressed T-matrix pole.
- What a partial-wave analysis determines and what it leaves ambiguous, as a statement about the
  kernel of a Fredholm operator.
- Threshold cusps: the square-root branch point at a channel opening, and a family of amplitudes
  with a peak at threshold and provably no pole in a stated neighbourhood of either adjacent
  sheet.
- Line shapes: the Breit-Wigner form and its limitations, the Flatté form, the parameter
  degeneracy of the Flatté form in the strong-coupling limit, and pole counting as a criterion.
- Exotic colour singlets: the enumeration of admissible configurations by tensor-product
  decomposition, the multiplicity of the singlet in the four-quark product, and the decidability
  of the exotic-quantum-number predicate.
- The compact multiquark and hadronic molecule hypotheses, the observables that discriminate them,
  and Weinberg's compositeness relation for a shallow bound state together with the statement of
  where it ceases to apply.
- Hybrid configurations with an adjoint gluonic constituent, and the quantum numbers they reach.
- Heavy-quark spin symmetry: the decoupling of the heavy-quark spin at leading order in `1/m`, the
  multiplet structure, the `1/m` splitting pattern, the flavour scaling of the hyperfine splitting,
  and the partner states the symmetry predicts for a molecular assignment.

Not included. Single-parton fragmentation functions for light hadrons, their evolution and their
extraction belong to `Hadronization`; this roadmap re-uses that interface at large transverse
momentum and does not redevelop it. The equivalent-photon flux and the general theory of exclusive
vector-meson production belong to `Photoproduction`, and the gluon generalized parton distribution
that parametrises two-gluon exchange belongs to `GeneralizedPartonDistributions`; this roadmap
takes both as inputs. The gravitational form factors of the proton and the hypothesis relating them
to the mass decomposition belong to `HadronMassAndEnergyMomentumTensor`; this roadmap supplies the
near-threshold production amplitude and the conditions under which it can be read as a probe of
them, and asserts nothing about the extraction. The running coupling, the flavour thresholds at
which a heavy quark becomes an active parton, and variable-flavour-number schemes belong to
`CollinearEvolution`. Open heavy-flavour production — a single heavy quark, hadronising into a
heavy-light meson — is `Hadronization`; this roadmap begins with a pair in a colour and spin
channel. Nuclear modification of quarkonium yields, comover absorption and cold-nuclear-matter
effects belong to `NuclearMedium`. Lattice determinations of the static potential, of the
quarkonium spectrum, and of the long-distance matrix elements belong to `LatticeBridge`; this
roadmap states the matching condition that defines each such quantity and treats its value as an
input. Electromagnetic and weak radiative corrections to the production cross section belong to
`RadiativeCorrections`. Light-meson spectroscopy without heavy quarks is `MesonStructure`: the
amplitude-analysis machinery of Layer 4 is channel-agnostic and `MesonStructure` may use it, but
the light-hadron structure applications are not developed here.

The material belongs under `EpsilonEridani/QFT/Quarkonium/`, with `NRQCD/` for Layers 0 and 1,
`Production/` for Layers 2 and 3, and `Exotics/` for Layer 5. Layer 4 is channel-agnostic and
belongs under `EpsilonEridani/QFT/Scattering/Amplitude/`, a sibling of the existing
`EpsilonEridani/QFT/Scattering/DIS/` tree, so that `MesonStructure` and `Photoproduction` can use
it without importing the quarkonium theory.

## Conventions and coordination with upstream

1. **Two expansion parameters, both explicit.** Every asymptotic statement carries an order in the
   relative velocity `v` *and* an order in the coupling, and where a `1/m` expansion is separately
   meant, an order in `Λ/m` as well. Neither is a typeclass instance and neither is implicit. The
   trap: a statement labelled "leading order" that is leading in the coupling and subleading in
   `v`, or the reverse, and silently compared against one that is not.

2. **Velocity scaling is declared data, not folklore.** The grading of the operator basis is a
   function from operators to integers, supplied as part of the effective-theory data, and the
   truncation of any sum is justified by the finiteness theorem for that grading. The trap: a
   power counting the reader is expected to know, so that dropping a term looks like arithmetic
   when it is an assumption.

3. **Colour structures come from the proved algebra.** Singlet and octet projectors are built from
   `EpsilonEridani.QFT.QCD.SU3Generators` and `EpsilonEridani.QFT.QCD.RepresentationColor`, and
   their idempotency, orthogonality and traces are proved, never written as numerals. The trap:
   factors of `1/N` and `N² − 1` entered by hand with the wrong `N`, which no downstream proof
   will catch.

4. **States are labelled by quantum numbers.** A state is a record of radial, orbital, spin and
   total angular momentum together with parity and charge-conjugation eigenvalues. Discovery names
   appear exactly once, in a dictionary definition that maps a name to a quantum-number record, and
   never in the statement of a theorem. The trap: a theorem that is true of a set of quantum
   numbers being stated about a named particle, and therefore silently asserting an identification
   that is itself in question.

5. **"Exotic" has one meaning.** A set of quantum numbers is exotic when it is not attainable by
   any quark-antiquark pair; a flavour content is exotic when it is not carried by any
   quark-antiquark or three-quark colour singlet. Nothing looser counts — not "unexpected", not
   "above threshold", not "narrow". The trap: a scope that expands to every state that surprised
   someone.

6. **Polarisation carries its frame.** The spin-density matrix and the angular coefficients derived
   from it are defined in the rest frame of the produced state with an explicitly named polar axis,
   and the axis choice — helicity, Collins-Soper, Gottfried-Jackson — is a field of the observable,
   not a remark. Only the rotation-invariant combination may be compared across frames, and the
   invariance is a theorem in Layer 3, not an assertion. The trap: quoting `λ_θ` from two analyses
   that used different axes.

7. **One normalisation for the long-distance matrix elements, fixed once.** The spin and colour
   multiplicity convention is stated in the definition, and every factorisation statement,
   including the colour-singlet model and the relation to the wave function at the origin, quotes
   it. The trap: a factor of `2J + 1` or `2N_c` that differs between the singlet-model expression
   and the NRQCD expression, making the theorem that relates them false as written.

8. **Relativistic and non-relativistic normalisations are distinguished.** Hadronic states carry
   the relativistic normalisation; NRQCD operator matrix elements carry the non-relativistic one;
   the conversion factor appears explicitly wherever the two meet. The trap: a missing factor of
   `2M` between the amplitude and the matrix element.

9. **Sheets are indexed by channels.** The physical sheet is fixed by a stated sign convention for
   each channel momentum, and a sheet label is a function from the channel index to a sign. "The
   second sheet" is used only for a single-channel amplitude; with more than one channel the sheet
   is named by its label. The trap: "the second sheet" in a three-channel analysis, where there
   are eight sheets and three of them touch the physical region in different energy intervals.

10. **A resonance is a pole.** Mass and width are defined from the pole position of the
    analytically continued partial-wave amplitude. Parameters of a Breit-Wigner or Flatté
    parametrisation are model quantities with different names, and any relation between them and
    the pole parameters is a theorem with hypotheses, proved for the family in question. The trap:
    reporting fit parameters as if they were pole parameters, which they are equal to only in a
    limit the fit does not check.

11. **Factorisation statements are named hypotheses.** Each is a `Prop` taking its ingredients as
    arguments — process, state, scales, error bound — and is never an axiom, never a class instance
    conjured by the elaborator, and never a `Prop`-valued structure field carrying a placeholder
    witness. A theorem that assumes factorisation says so in its hypotheses. The trap: an unproved
    factorisation that looks proved because it was encoded as a field.

12. **Errors are bounds, not ellipses.** A statement "up to corrections of order `v²`" is written
    as an explicit remainder function with an explicit bound, in the shape of `Asymptotics.IsBigO`.
    The trap: an "order `v²`" that is never quantified and therefore never checkable.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `EpsilonEridani.QFT.QCD.SU3Generators`, `EpsilonEridani.QFT.QCD.SUNGenerators`,
  `EpsilonEridani.QFT.QCD.SUNStructureConstants`, `EpsilonEridani.QFT.QCD.RepresentationColor` and
  `EpsilonEridani.QFT.QCD.CasimirDerivation` — the colour algebra, the representation data and the
  Casimirs. Layer 1's singlet and octet projectors and Layer 5's multiquark enumeration are built
  from these and from nothing else.
- `EpsilonEridani.Mathematics.LieAlgebra.SpecialUnitary`,
  `EpsilonEridani.Mathematics.LieAlgebra.StructureConstants` and
  `EpsilonEridani.Mathematics.LieAlgebra.Casimir` — the underlying Lie-algebra layer.
- `EpsilonEridani.QFT.QCD.OneLoopBeta`, `EpsilonEridani.QFT.QCD.Renormalization` and
  `EpsilonEridani.QFT.QCD.OneLoopCounterterms` — the running coupling and the renormalisation
  vocabulary in which the anomalous dimensions of the matching coefficients are stated.
- `EpsilonEridani.QFT.Factorization.Basic` and `EpsilonEridani.QFT.Factorization.Scales.Basic` —
  the existing factorisation and scale vocabulary. The NRQCD statement of Layer 2 is a new instance
  of that vocabulary with two expansion parameters instead of one; the roadmap extends the
  vocabulary in place rather than introducing a parallel one.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic`,
  `EpsilonEridani.QFT.Factorization.Convolution.Collinear` and
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin` — the convolution used by the fragmentation
  contribution of Layer 3.
- `EpsilonEridani.Particles.Fragmentation.Basic` — the fragmentation-function interface. Layer 3
  instantiates it for a quarkonium final state and proves the leading-power statement; it does not
  redefine it.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Amplitudes.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Channels` and
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic` — exclusive vector-meson
  production amplitudes and their kinematics, which the near-threshold amplitude of Layer 3.6
  specialises.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness` and
  `EpsilonEridani.Particles.Parton.GPD.Ambiguity` — the pattern this collection uses for a
  non-uniqueness statement. Layer 4.6 states the partial-wave ambiguity in the same shape.
- `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.Basic`,
  `.OneLoopScalars` and `.TensorReduction` — the regularisation used by the matching computations
  of Layer 0.4, and the source of the infrared structure whose cancellation Layer 2.3 proves.
- `EpsilonEridani.Relativity.PauliMatrices.RelationsExtensions`,
  `EpsilonEridani.Relativity.PauliMatrices.AsTensorExtensions` and the
  `EpsilonEridani.Relativity.Fermions.Weyl.*` family — the two-component spinor algebra in which
  the NRQCD bilinears are written.
- `EpsilonEridani.Numerics.FourMom` and `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` —
  four-momenta and the invariants.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` — the positivity carried by the
  spin-density matrix of Layer 3.4 and by the matrix of long-distance matrix elements of Layer 2.5.

From TauCeti:

- `TauCeti.Algebra.Lie.Sl2.ClebschGordan`, `TauCeti.Algebra.Lie.Sl2.Decomposition`,
  `TauCeti.Algebra.Lie.Sl2.Casimir` and `TauCeti.Algebra.Lie.Sl2.Spectrum` — angular-momentum
  coupling. The spin decomposition of Layer 1.3 and the heavy-quark spin multiplets of Layer 5.6
  are instances of the Clebsch-Gordan decomposition and are not recomputed.
- `TauCeti.Algebra.Lie.HighestWeight.Decomposition`, `.Character` and `.Freudenthal` — weight-space
  decomposition of tensor products, used for the multiquark colour enumeration.
- `TauCeti.RepresentationTheory.ClassicalGroups.Decomposition`,
  `TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight` and
  `TauCeti.RepresentationTheory.ClassicalGroups.ExteriorPower` — the classical-group side of the
  same decomposition, used for the singlet multiplicity of Layer 5.1.
- `TauCeti.Analysis.InnerProductSpace.Spectrum`,
  `TauCeti.Analysis.InnerProductSpace.Variational.Rayleigh` and
  `TauCeti.Analysis.InnerProductSpace.Variational.Spectrum` — the spectral theorem and the
  variational characterisation, for the bound-state spectrum of Layer 1.5.
- `TauCeti.Analysis.Normed.Operator.Compact.Basic`,
  `TauCeti.Analysis.Normed.Operator.Compact.RieszTheory` and
  `TauCeti.Analysis.Normed.Operator.Compact.Eigenspace` — discreteness of the spectrum of a
  resolvent-compact operator, which is how Layer 1.5 gets a discrete level scheme below threshold.
- `TauCeti.Analysis.Normed.Operator.Resolvent.Analytic` and
  `TauCeti.Analysis.Normed.Operator.Resolvent.Perturbation` — analytic perturbation of eigenvalues,
  for the `v²` spin-dependent corrections of Layer 1.6.
- `TauCeti.Analysis.Semigroups.Defs`, `TauCeti.Analysis.Semigroups.Basic`,
  `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and
  `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness` — the renormalisation-group flow of the
  matching coefficients in Layer 0.5 is a one-parameter semigroup on a finite-dimensional space.
  Existence and uniqueness for it are taken from here and not reproved.
- `TauCeti.Analysis.Fredholm.Criteria`, `TauCeti.Analysis.Fredholm.FiniteRank`,
  `TauCeti.Analysis.Fredholm.CompactPerturbation` and `TauCeti.Analysis.Fredholm.SelfAdjoint` —
  the coupled-channel integral equation of Layer 4.5 as a Fredholm problem, and the
  non-uniqueness statements of Layers 2.4 and 4.6 as statements about a kernel.
- `TauCeti.Analysis.Contour.Cauchy.IntegralFormula`,
  `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` and
  `TauCeti.Analysis.Contour.PerWindow.CPV` — the dispersion relation of Layer 4.3.
- `TauCeti.Analysis.Contour.Argument.Principle`, `TauCeti.Analysis.Complex.Conformal.Rouche` and
  `TauCeti.Analysis.Contour.MeromorphicLaurent` — counting poles and zeros in a stated region, and
  extracting a residue. Layers 4.8 and 4.9 rest on these.
- `TauCeti.Analysis.Complex.Conformal.Continuation.Basic` and `.Trans` — analytic continuation onto
  an unphysical sheet.
- `TauCeti.Analysis.Complex.Herglotz`,
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Nevanlinna`,
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Pick`,
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Holomorphic`,
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Inversion` and
  `TauCeti.Analysis.CompletelyMonotone.Stieltjes.CompleteBernstein` — the Herglotz/Nevanlinna
  representation, which is the right home for the spectral representation of a coupled-channel
  amplitude and for the inverse-function form of unitarity.
- `TauCeti.Analysis.Matrix.UnitaryGroup`, `TauCeti.Analysis.Matrix.Spectrum` and
  `TauCeti.Analysis.Matrix.HermitianSignature` — the S-matrix as a unitary, the K-matrix as a real
  symmetric matrix, and the signature statements used in the pole-counting argument.
- `TauCeti.Analysis.Asymptotics.Lemmas` — the `v` and `1/m` expansions.
- `TauCeti.Analysis.InnerProductSpace.PositiveDefinite` — the positivity statements of Layers 2.5
  and 3.4.

From Mathlib: `Mathlib.LinearAlgebra.TensorProduct.Basic` for the colour, spin and orbital tensor
decomposition; `Mathlib.Analysis.InnerProductSpace.Spectrum` and `Mathlib.Analysis.Matrix.Spectrum`
for the eigenvalue problems; `Mathlib.Algebra.Star.Unitary` for unitarity; `Matrix.PosSemidef` for
the density matrix; `Mathlib.Analysis.Complex.CauchyIntegral` and `Mathlib.Analysis.Analytic.Basic`
for the contour arguments; `Mathlib.Analysis.SpecialFunctions.Complex.Log` for the branch that
defines the physical sheet; and the `Asymptotics.IsBigO` and `Asymptotics.IsLittleO` vocabulary for
every remainder.

Genuine absences, and what the roadmap does instead:

- ⚠ **There is no scattering theory anywhere upstream.** Neither library contains an S-matrix, a
  partial-wave amplitude, a Jost function, Levinson's theorem, or a bound state in the scattering
  sense. Layer 4 builds the single-channel and coupled-channel amplitude theory here, phrased in
  the operator-theoretic and complex-analytic vocabulary that TauCeti already supplies, so that it
  reads as a specialisation of `TauCeti.Analysis.Fredholm` and `TauCeti.Analysis.Contour` rather
  than as a new subject. The roadmap does not wait for an upstream scattering library.
- ⚠ **Legendre polynomials, spherical harmonics and Wigner rotation matrices are absent from
  TauCeti.** Every occurrence of "Legendre" in the library is the Legendre symbol of number theory.
  Layer 4.1 builds the orthogonal polynomial family it needs on `[-1, 1]` directly from its
  three-term recurrence, in the shape of Mathlib's `Polynomial.Chebyshev`, proves orthogonality and
  completeness in `L²`, and defines the partial-wave projection against it. It builds the angular
  functions the roadmap uses and no more.
- ⚠ **Bessel functions are absent from both Mathlib and TauCeti.** The centrifugal barrier factors
  of Layer 4.7 are therefore defined by their closed rational forms at each finite orbital angular
  momentum, with the threshold behaviour and the recursion in `ℓ` proved directly. The general
  Bessel theory is not built here.
- ⚠ **Polylogarithms and harmonic sums are absent from both libraries.** The closed functional
  forms of the one-loop matching coefficients are therefore not reproduced. Layer 0.4 states the
  matching *condition* and Layer 0.5 the renormalisation-group equation the coefficient satisfies;
  the coefficient is characterised by those, and its explicit transcendental form is outside the
  roadmap.
- ⚠ **There is no notion of an ill-posed inverse problem, and no moment problem, in TauCeti.** The
  ambiguity statements of Layers 2.4 and 4.6 are therefore made as rank and kernel statements about
  an explicitly constructed Fredholm operator, which is both provable and sharper than a qualitative
  ill-posedness claim.
- ⚠ **There is no effective-field-theory framework upstream**: no notion of matching, and no
  operator basis graded by a power counting. Layer 0 builds one. It is built as a general graded
  operator basis with a matching condition, not as a quarkonium-specific construction, so that the
  shape is reusable, but the roadmap claims only the quarkonium instance.
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the threshold
  invariants, and `Physlib.QuantumMechanics.HilbertSpaces.FiniteTarget.Basic` for the finite
  channel space the K-matrix of Layer 3 acts on.

## Layer 0: the heavy-quark scale hierarchy and the velocity expansion

References: Caswell and Lepage, *Phys. Lett.* B167 (1986) 437; Bodwin, Braaten and Lepage,
*Phys. Rev.* D51 (1995) 1125 [hep-ph/9407339], erratum D55 (1997) 5853; Pineda and Soto,
*Nucl. Phys. Proc. Suppl.* 64 (1998) 428 [hep-ph/9707481]; Brambilla, Pineda, Soto and Vairo,
*Rev. Mod. Phys.* 77 (2005) 1423 [hep-ph/0410047]; Brambilla et al., "Heavy quarkonium physics",
CERN-2005-005 [hep-ph/0412158]. Yellow Report subsection 7.4.4.

### 0.1 The scale hierarchy as data

Define `HeavyQuarkScales` as a record carrying the heavy quark mass `m`, the typical relative
momentum `p`, the binding energy `E`, and the hadronic scale `Λ`, with the strict inequalities
`0 < E < p < m` as fields — these are genuine order hypotheses with content, not placeholders. The
velocity is the derived quantity `v = p / m`, and the theorem to prove is `0 < v < 1` together with
`E / m = v² · (E / p²) · m`, i.e. the statement that `E ~ m v²` is an additional assumption and not
a consequence of the definitions. Name that assumption `CoulombicScaling` and carry it explicitly
wherever it is used.

Two regimes are then defined and shown mutually exclusive: the weakly coupled regime `Λ < E` and
the strongly coupled regime `E < Λ < p`. In the first, the potential is perturbatively computable
and the whole tower is an expansion in the coupling at the scale `p`; in the second, the potential
is a non-perturbative matching coefficient. Which regime a physical quarkonium sits in is an
empirical input, not a theorem: the roadmap states both regimes, proves the statements that hold in
each, and records the regime as a hypothesis of every theorem that needs one.

### 0.2 Velocity power counting and the finiteness of each graded piece

An operator basis is a type `Op` together with a grading `deg : Op → ℕ × ℕ` recording the order in
`v` and in `1/m`. Define the graded pieces and prove:

- the grading is additive on products of bilinears, so that `deg` of a composite operator is
  determined by its factors;
- for each bound `n`, the set `{o : Op | (deg o).1 + (deg o).2 ≤ n}` is finite.

The second statement is the substantive one. It is exactly what licenses truncating any NRQCD sum
to finitely many terms, and every later truncation cites it rather than asserting that "higher
orders are dropped". Without it, "the sum over channels is finite" is a wish.

### 0.3 The NRQCD Lagrangian

The field content is a two-component Pauli spinor `ψ` annihilating a heavy quark and a two-component
spinor `χ` creating a heavy antiquark, written in the algebra of
`EpsilonEridani.Relativity.PauliMatrices.RelationsExtensions`. Define the bilinear basis, with each
element's grading:

- the kinetic terms `ψ†(i D_t + D²/2m)ψ` and the corresponding antiquark term, of order `v²`
  relative to the mass term;
- the Darwin and spin-orbit bilinears at order `v⁴`, and the chromomagnetic bilinear
  `ψ†(σ · g B)ψ / 2m`, of order `v⁴` in the Coulombic regime;
- the four-fermion production and annihilation operators, classified by colour channel (singlet or
  octet) and spin channel (singlet or triplet) and by the number of covariant derivatives.

The theorem to prove is that the listed bilinears exhaust the basis at each stated grading, modulo
the equations of motion and field redefinitions. That requires first defining the equivalence: two
operator bases are equivalent when they are related by a field redefinition that is itself graded.
State the exhaustiveness theorem only after that definition exists; it is not an enumeration by
inspection.

### 0.4 Matching

A matching coefficient is defined, not computed, by a condition. Given a finite set of amplitudes
`A`, a set of external momenta and an order in the coupling and in the grading, a coefficient
assignment `c : Op → ℝ → ℝ` (of the operator and the renormalisation scale) satisfies the matching
condition when, for each amplitude in `A`, the full-theory result and the effective-theory result
agree up to a remainder of higher grading, with the remainder bounded in the sense of Convention 12.

Theorems:

- **Uniqueness.** If the amplitudes in `A` separate the operators of the basis at the stated
  grading — a rank condition on an explicitly constructed finite matrix — then the matching
  coefficients are unique. This is a linear-algebra statement and it is provable.
- **Existence is conditional.** The existence of a coefficient assignment satisfying the condition
  at a given order is *not* claimed in general; it is proved for the explicit cases listed under
  Examples, and stated as a hypothesis elsewhere. Naming this honestly matters: the general
  statement is the content of the effective-theory construction, and it is not available from the
  linear algebra alone.
- **Regulator independence.** Given the hypothesis that the full and effective theories have the
  same infrared behaviour at the order worked, the matching coefficients are independent of the
  infrared regulator. The hypothesis is named and carried, because in the colour-singlet P-wave
  channel it *fails* at order `αs`, and the failure is the subject of Layer 2.3.

### 0.5 Renormalisation-group flow of the coefficients

The coefficients at the stated grading form a finite-dimensional real vector space `C`. An
anomalous-dimension matrix `γ : C →ₗ C` defines the flow `d c / d log μ = γ c`. Instantiate
`TauCeti.Analysis.Semigroups.Defs` with the generator `γ` and take existence and uniqueness from
`TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and `.CauchyProblem.Uniqueness`. Theorems:

- the coefficients at one scale determine them at every scale, and the flow map is a one-parameter
  group;
- the mixing pattern is triangular with respect to the grading: an operator can mix only into
  operators of the same or lower grading, which is what makes the finite-dimensional truncation
  consistent under the flow.

Nothing about existence or uniqueness of the flow is reproved here.

### 0.6 Potential NRQCD as a second matching step

Integrating out the scale `p` leaves a theory whose degrees of freedom are the pair's relative
coordinate and ultrasoft gluon fields. Define the static potential and its `1/m` corrections as
matching coefficients of this second step, in the same shape as 0.4: a potential is the coefficient
determined by matching a stated set of amplitudes at the scale `p`.

The limitation is stated as part of the definition. Beyond the order at which the ultrasoft gluons
decouple, the potential is not a potential in the quantum-mechanical sense: the pair's evolution is
not generated by `p²/m + V(r)` alone, and the correction is not a shift of `V`. Layer 1.5 therefore
solves an eigenvalue problem for a definite Hamiltonian and states the order to which its spectrum
is the quarkonium spectrum, rather than claiming that the spectrum of a potential model *is* the
spectrum of QCD.

### Examples

- The order-`v⁴` bilinear basis written out for a colour-singlet spin-singlet pair, with the
  grading of each element checked against 0.2.
- Tree-level matching of the electromagnetic current onto `ψ†σχ`, with the coefficient equal to one
  at that order and the uniqueness theorem of 0.4 discharged for the two-amplitude set.
- The one-loop anomalous dimension of the colour-octet spin-triplet S-wave production operator,
  reduced to a scalar ordinary differential equation and solved via the semigroup of 0.5.
- An explicit finiteness witness: the list of operators of total grading at most four, with the
  finiteness theorem of 0.2 instantiated.

### Dependencies

The colour algebra and Casimirs of `EpsilonEridani.QFT.QCD.*`; the spinor algebra of
`EpsilonEridani.Relativity.*`; the regularisation of
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.*`; the semigroup theory of
`TauCeti.Analysis.Semigroups.*`. From other roadmaps: `CollinearEvolution` for the running coupling
and the flavour thresholds at which a heavy quark becomes active. This layer rests on nothing else
in this roadmap.

---

## Layer 1: the quarkonium spectrum and its colour and spin content

References: Eichten, Gottfried, Kinoshita, Lane and Yan, *Phys. Rev.* D17 (1978) 3090; Godfrey and
Isgur, *Phys. Rev.* D32 (1985) 189; Quigg and Rosner, *Phys. Rept.* 56 (1979) 167; Brambilla et al.,
CERN-2005-005 [hep-ph/0412158], chapter on spectroscopy; Particle Data Group, quark model review.
Yellow Report subsection 7.4.6.

### 1.1 The state space of a heavy pair

Define the pair's state space as `Colour ⊗ Spin ⊗ Orbital` using
`Mathlib.LinearAlgebra.TensorProduct.Basic`, with `Colour` the tensor product of the fundamental
and its dual, `Spin` the tensor product of two two-dimensional spaces, and `Orbital` the relative
wave functions. The decompositions of 1.2 and 1.3 are decompositions of the first two factors and
are independent of the third; state that independence, because every later channel label relies on
it.

### 1.2 Colour decomposition

The projectors onto the singlet and the adjoint in `3 ⊗ 3̄` are built from the generators of
`EpsilonEridani.QFT.QCD.SU3Generators`. Theorems, all proved from the algebra:

- each projector is idempotent;
- the two are orthogonal and sum to the identity;
- their traces are `1` and `N² − 1`, and the singlet projector normalised so that a colour-singlet
  pair has unit norm carries the factor `1/N` — proved, so that Convention 3's trap cannot occur;
- the quadratic Casimir evaluated on each channel gives `0` and `N` respectively, via
  `EpsilonEridani.QFT.QCD.CasimirDerivation`, which is the statement that the singlet channel is
  colour-neutral.

### 1.3 Spin decomposition

`2 ⊗ 2 = 1 ⊕ 3` via `TauCeti.Algebra.Lie.Sl2.ClebschGordan`. Construct the singlet and triplet
projectors, prove idempotency, orthogonality and completeness, and prove that the total-spin
Casimir takes the values `0` and `2` on the two channels. The result is a four-fold channel
classification — colour singlet or octet, spin singlet or triplet — and that classification is the
index set of every sum in Layer 2.

### 1.4 Parity, charge conjugation, and the attainable quantum numbers

For a quark-antiquark pair with orbital angular momentum `L` and total spin `S`, prove from the
transformation of the bilinears — not by tabulation — that

- the parity eigenvalue is `(−1)^(L+1)`,
- the charge-conjugation eigenvalue is `(−1)^(L+S)`,

and that `S ≤ 1` with `|L − S| ≤ J ≤ L + S`. Define `qqbarAttainable` as the predicate asserting the
existence of such `(L, S)` reproducing a given `(J, P, C)`. Theorems:

- `qqbarAttainable` is decidable, by a finite search bounded by `J + 1`;
- the complement is non-empty, and its first few members are `0^{−−}`, `0^{+−}`, `1^{−+}`, `2^{+−}`,
  `3^{−+}` — derived from the predicate, never listed as data.

This is the theorem the whole exotic-quantum-number argument of Layer 5.2 rests on, and it is
elementary enough to prove completely.

### 1.5 The spectrum from the potential

Given a potential `V` that is bounded below and grows without bound, define the radial Hamiltonian
for each `L` as a self-adjoint operator and prove:

- the resolvent is compact, hence by `TauCeti.Analysis.Normed.Operator.Compact.RieszTheory` the
  spectrum is discrete with finite multiplicities and accumulates only at infinity;
- the eigenvalues at fixed `L` are simple and can be ordered, defining the radial quantum number;
- the variational characterisation of `TauCeti.Analysis.InnerProductSpace.Variational.Rayleigh`
  gives an upper bound on the ground-state energy from any trial function, and the bound is
  computable for an explicit trial family;
- eigenvalues increase with `L` at fixed radial quantum number, for a potential whose centrifugal
  term dominates the ordering — state the monotonicity hypothesis on `V` that this needs.

The statement carries the order in `v` at which the eigenvalue is the physical mass, as required by
Layer 0.6. Above the open-flavour threshold the operator is no longer the right object and the
spectrum is not discrete: a state there is a pole, and Layer 4 is where it is defined. Say this
here, so that no later layer silently applies a bound-state statement above threshold.

### 1.6 Spin-dependent corrections

The spin-orbit, tensor and hyperfine operators enter at relative order `v²`. Treat them by analytic
perturbation of the eigenvalues, using `TauCeti.Analysis.Normed.Operator.Resolvent.Perturbation`.
Theorems:

- the first-order shift of an eigenvalue is the expectation value of the perturbation in the
  unperturbed eigenstate, with an explicit second-order remainder bound;
- the spin-weighted centre of gravity of a spin-triplet multiplet with `L > 0` is unshifted by the
  spin-orbit and tensor operators at first order — a sum rule over Clebsch-Gordan coefficients,
  provable from 1.3;
- the hyperfine operator shifts the spin-singlet and spin-triplet S-wave levels in the ratio
  `−3 : 1`, again from 1.3.

These are checkable predictions and they are the ones a contributor can actually close.

### 1.7 The wave function at the origin

Define the radial wave function at the origin and, for `L > 0`, its `L`-th derivative. Prove that in
the Coulombic regime the leading colour-singlet production amplitude depends on the bound state only
through this quantity, and state the relation to the leading colour-singlet long-distance matrix
element with the normalisation of Convention 7 written into the statement. This is the bridge to
Layer 2: it is what makes the colour-singlet model a one-parameter statement, and the relation is a
theorem with a stated order in `v`, not a definition.

### Examples

- The level ordering `1S < 1P < 2S` for a linear-plus-Coulomb potential, established from 1.5 with
  an explicit trial family.
- The spin-singlet and spin-triplet `1S` states exhibited as the two members of one spin multiplet,
  with the hyperfine ratio of 1.6 discharged.
- The `L = 1` spin-triplet triad with its centre of gravity, and the sum rule of 1.6 verified.
- `1^{−+}` shown not to satisfy `qqbarAttainable`, by the decision procedure of 1.4.
- The relation of 1.7 instantiated for an S-wave state and for a P-wave state, with the derivative
  appearing in the latter.

### Dependencies

Layer 0, for the potential as a matching coefficient and for the order at which the eigenvalue
problem represents the spectrum; the colour algebra upstream; the `sl₂` representation theory of
TauCeti. From other roadmaps: `LatticeBridge` for the non-perturbative determination of the static
potential, which this roadmap defines by its matching condition and takes as an input.

---

## Layer 2: production, and the two factorisation hypotheses

References: Chang, *Nucl. Phys.* B172 (1980) 425; Berger and Jones, *Phys. Rev.* D23 (1981) 1521;
Baier and Rückl, *Z. Phys.* C19 (1983) 251; Bodwin, Braaten and Lepage, *Phys. Rev.* D51 (1995)
1125; Nayak, Qiu and Sterman, *Phys. Rev.* D72 (2005) 114012 [hep-ph/0509021]; Lansberg,
*Phys. Rept.* 889 (2020) 1 [arXiv:1903.09185]. Yellow Report subsections 7.4.4 and 7.4.5.

### 2.1 What a production factorisation statement is

Define `ProductionFactorisation` as a `Prop` taking: a process (initial state, final state, and the
kinematic point), a produced quarkonium state, a factorisation scale, a finite channel index set, a
short-distance coefficient function, a long-distance matrix element function, and a remainder bound.
The proposition asserts that the cross section equals the sum over the index set of coefficient
times matrix element, up to the remainder. Nothing about it is an axiom, and by Convention 11 it is
never a structure field.

Every theorem in this layer and the next either proves a consequence of this proposition or proves
something about the proposition itself. No theorem assumes it silently.

### 2.2 The colour-singlet model

State the colour-singlet hypothesis: the pair is produced at short distance in a colour singlet with
the spin and orbital quantum numbers of the observed state, and the cross section is the product of
a perturbative coefficient and the quantity of Layer 1.7.

The theorem to prove is that this is not an independent framework: the colour-singlet expression is
exactly the restriction of the NRQCD sum of 2.3 to the colour-singlet channel at leading order in
`v`, with the normalisation of Convention 7. Proving the implication is what keeps the two
hypotheses comparable; treating them as rival frameworks by fiat is what makes the polarisation
discussion of Layer 3.5 incoherent.

### 2.3 NRQCD production factorisation

Define the long-distance matrix element for a channel as the vacuum expectation value of the
corresponding four-fermion operator with the projection onto the observed state inserted, at the
stated normalisation. State the factorisation proposition with the channel index set taken to be
the channels of grading at most `n` in the sense of Layer 0.2. Theorems:

- **Finiteness.** For each `n` the channel index set is finite. Immediate from 0.2, and cited rather
  than reasserted.
- **Scale independence of the product.** Given the anomalous-dimension matrix of Layer 0.5, the sum
  is independent of the factorisation scale to the order worked. The proof is a cancellation between
  the scale derivative of the coefficients and that of the matrix elements, and it needs the
  triangularity of the mixing proved in 0.5.
- **The infrared cancellation.** At order `αs`, the colour-singlet P-wave short-distance coefficient
  has an infrared divergence whose coefficient equals, up to the stated colour and normalisation
  factors, the ultraviolet anomalous dimension of the colour-octet S-wave matrix element. Therefore
  the sum is infrared finite while neither term is. State the hypothesis under which this is proved
  — that the divergence has the stated soft-gluon form — and prove the cancellation given it.

The last theorem is the reason the colour-octet channels cannot be dropped, and it is a structural
result, independent of universality. It is the strongest thing this layer proves and it should be
stated as such.

There is a further structural question which this roadmap states and does not settle: whether the
matrix elements defined as above are gauge invariant and infrared safe to all orders, which requires
Wilson lines in the operator definition. Include the Wilson-line-completed definition as the
operative one, cite the order to which the equivalence with the naive definition is established, and
name the all-orders statement as an open problem rather than a milestone.

### 2.4 Universality

The universality hypothesis is that the long-distance matrix elements are functions of the state and
the channel only, not of the process. It is the framework's principal open question. The roadmap
states it as a `Prop` over a process type and proves nothing about its truth. What it does prove:

- **What one process determines.** For a fixed process and a finite set of kinematic points, the
  measured cross sections determine a linear functional of the matrix element vector. Construct the
  design matrix explicitly and prove that its rank bounds the number of independent combinations
  determined; the unresolved directions are its kernel, in the sense of
  `TauCeti.Analysis.Fredholm.FiniteRank`. This is the same shape of statement as
  `EpsilonEridani.Particles.Parton.GPD.Ambiguity` makes for the deconvolution problem, and the
  roadmap uses that vocabulary rather than inventing a second one.
- **Falsifiability.** Two processes give an overdetermined linear system in the same matrix element
  vector. Define the consistency predicate for that system and prove that universality implies it.
  The contrapositive — inconsistency refutes universality at the stated order — is then available
  as a corollary, and it is the precise sense in which the hypothesis is testable.

No theorem in the roadmap may assume universality without listing it as a hypothesis.

### 2.5 Positivity

For a diagonal channel the long-distance matrix element is the expectation value of a positive
operator. Prove:

- each diagonal matrix element is non-negative;
- the matrix of matrix elements in a channel basis is positive semidefinite, via
  `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`, which bounds the off-diagonal
  elements by the geometric mean of the diagonal ones.

These are model-independent, provable, and directly usable as constraints in any extraction. They
are among the few unconditional statements this layer can offer, and they should be prominent.

### 2.6 Why a quarkonium is not a fragmenting parton

Prove the precise statement: at fixed order in the coupling the NRQCD expression is not of the
single-parton fragmentation form, because the long-distance factor is indexed by the colour and spin
channel of the pair rather than by a single parton flavour, and the short-distance coefficient
depends on the channel in a way that does not factor through a parton density. State it as a
non-existence theorem for a fragmentation representation with the stated properties at fixed order.

This is not in tension with Layer 3.1, which proves a fragmentation representation in an asymptotic
limit. Stating both, and stating the relation between them, is the content: `Hadronization` supplies
the fragmentation-function interface, and this roadmap says exactly when a quarkonium may and may
not be described by it.

### Examples

- Gluon-gluon fusion into a colour-octet spin-triplet S-wave pair at lowest order, with the channel
  index set and the grading of each channel exhibited.
- Photoproduction of a spin-triplet S-wave state in the colour-singlet model at order `αs`, with the
  Layer 1.7 relation used to express the answer in terms of the wave function at the origin.
- The P-wave infrared cancellation of 2.3 written out for the colour-singlet spin-triplet P-wave
  channel against the colour-octet spin-triplet S-wave channel, with the colour factors taken from
  Layer 1.2.
- The design matrix of 2.4 for two kinematic points and three channels, with its rank computed and
  the kernel exhibited.
- The positive-semidefiniteness of 2.5 instantiated for a two-channel basis, giving the explicit
  inequality among three numbers.

### Dependencies

Layers 0 and 1. Upstream: the factorisation and convolution vocabulary of
`EpsilonEridani.QFT.Factorization.*`, the regularisation modules, and
`TauCeti.Analysis.Fredholm.FiniteRank`. From other roadmaps: `CollinearEvolution` for the parton
densities and the coupling; `Photoproduction` for the photon flux; `Hadronization` for the
fragmentation vocabulary whose applicability 2.6 delimits; `RadiativeCorrections` for
electromagnetic corrections to the cross section, which are not developed here.

---

## Layer 3: transverse momentum, polarisation, and the threshold region

References: Braaten and Yuan, *Phys. Rev. Lett.* 71 (1993) 1673; Cho and Leibovich, *Phys. Rev.*
D53 (1996) 150 and D53 (1996) 6203; Beneke and Krämer, *Phys. Rev.* D55 (1997) 5269; Kang, Qiu and
Sterman, *Phys. Rev. Lett.* 108 (2012) 102002; Faccioli, Lourenço, Seixas and Wöhri, *Eur. Phys. J.*
C69 (2010) 657 [arXiv:1006.2738]; Butenschoen and Kniehl, *Phys. Rev. Lett.* 108 (2012) 172002;
Kharzeev, Satz, Syamtomov and Zinovjev, *Eur. Phys. J.* C9 (1999) 459 [hep-ph/9901375]; Ali et al.
(GlueX), *Phys. Rev. Lett.* 123 (2019) 072001. Yellow Report subsections 7.4.4 and 7.4.5.

### 3.1 The quarkonium fragmentation function and the leading-power theorem

Define a quarkonium fragmentation function as a light-cone operator matrix element with a quarkonium
final state, instantiating the interface of `EpsilonEridani.Particles.Fragmentation.Basic`. Prove:

- **Leading power.** For transverse momentum `qT` large compared with the pair's mass, the cross
  section equals a single-parton convolution of a parton-level hard cross section with this
  fragmentation function, up to a remainder of relative order `m²/qT²` in the sense of Convention 12.
- **The fragmentation function is itself an NRQCD sum.** Its initial condition at a scale of order
  the pair's mass is a finite sum of perturbative coefficients times the same long-distance matrix
  elements as Layer 2.3, with the same channel index set.

Together these reconcile 2.6 and 3.1: the fragmentation form is an asymptotic statement in `qT`,
derived, not an alternative factorisation postulated alongside NRQCD.

### 3.2 Power counting in transverse momentum, and matching the two regimes

Define the leading-power (single-parton fragmentation) and first subleading-power (double-parton
fragmentation) contributions and their `qT` scaling. Define the matched cross section as an explicit
prescription combining the fixed-order result of Layer 2 with the resummed leading-power result, and
prove that the matched expression reduces to each in its own region up to the remainder of the
other. The prescription is a definition and the reduction is a theorem; neither is left implicit.

### 3.3 Evolution of the fragmentation function

The evolution of the quarkonium fragmentation function in the factorisation scale is governed by the
same evolution operator as any fragmentation function. That operator, and the existence and
uniqueness of its solutions, belong to `CollinearEvolution`. This roadmap takes them from there and
supplies only the initial condition of 3.1. It does not restate the evolution kernels.

### 3.4 The spin-density matrix and the polarisation coefficients

Define the spin-density matrix of a produced spin-one state as a positive semidefinite,
trace-one operator on the three-dimensional spin space, in a frame carrying an explicitly named
polar axis per Convention 6. Define the angular-distribution coefficients `λ_θ`, `λ_φ` and `λ_θφ` as
explicit linear functionals of its entries. Theorems:

- **The physical region.** Positive semidefiniteness of the density matrix is equivalent to an
  explicit closed convex region in the coefficient space; in particular `λ_θ ∈ [−1, 1]` and the
  joint region is the convex hull of the pure-state image. This is a genuine convex-geometry
  statement, fully provable, and it is the constraint an extraction must respect.
- **The frame-rotation law.** A rotation of the polar axis acts on the density matrix by conjugation
  and hence on the coefficients by an explicit transformation. Derive it.
- **The invariant.** The combination `λ̃ = (λ_θ + 3 λ_φ) / (1 − λ_φ)` is invariant under rotations
  about the axis normal to the production plane, wherever the denominator is non-zero. Prove it, and
  state the exceptional locus rather than ignoring it. This is the only quantity Convention 6 permits
  to be compared across frames.

### 3.5 Polarisation as the discriminating prediction

The two hypotheses of Layer 2 make different predictions for the polarisation of the produced state
at large transverse momentum, and the roadmap's deliverable is the pair of predictions together with
what each would exclude.

- Under the colour-singlet hypothesis, at leading order in the coupling and in `v`, the produced
  spin-triplet S-wave state's polarisation is fixed by the short-distance process; derive `λ_θ` for
  the explicit lowest-order processes, and state the sign it predicts at large `qT`.
- Under NRQCD factorisation with the colour-octet spin-triplet S-wave channel dominating at large
  `qT`, the pair inherits the polarisation of the nearly on-shell fragmenting gluon, and heavy-quark
  spin symmetry (Layer 5.6) transmits that polarisation to the physical state up to corrections of
  relative order `v²`. Prove, conditional on heavy-quark spin symmetry and on the dominance
  assumption, that `λ_θ → 1` in the limit of large `qT`, with the remainder bounded.
- State the discrimination: the two predictions differ, the measurement of `λ_θ` at large `qT`
  therefore excludes one of them at the stated order, and neither prediction is a measurement.

The dominance assumption is a hypothesis of the second statement and is carried in it. This
subsection proves conditional statements and labels them as such; it does not adjudicate.

### 3.6 Near threshold

Near the production threshold the produced pair is slow in the target frame and the momentum
transfer to the target is large. Two expansions apply at once, and their compatibility is a
condition, not a given: state the condition relating the pair's velocity, the mass, and the momentum
transfer under which both expansions are simultaneously valid, and carry it as a hypothesis.

Define the amplitude for exclusive quarkonium production near threshold by specialising
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Basic` and `.Kinematics.Basic`. The relation of
that amplitude to a gluonic matrix element of the target requires three separate hypotheses, each
named and each carried:

- **Two-gluon dominance.** The heavy pair couples to the target through exactly two gluons at the
  order worked, higher gluon exchanges being suppressed by the stated power.
- **Wave-function factorisation.** The non-relativistic bound-state factor separates from the
  gluonic matrix element, at leading order in `v`.
- **Form-factor parametrisation.** The relevant gluonic matrix element is expressible in terms of
  the gluon gravitational form factors, at the stated order in the expansion of the operator.

The third hypothesis is where this roadmap meets `HadronMassAndEnergyMomentumTensor`. That roadmap
defines the form factors and states the hypothesis relating them to the proton's mass decomposition.
This roadmap supplies the production amplitude and the conditions listed above, and asserts nothing
about the validity of the extraction. The gluon generalized parton distribution that parametrises
the two-gluon exchange away from the strict threshold limit belongs to
`GeneralizedPartonDistributions` and is taken from there.

### 3.7 The scattering-length relation

The near-threshold amplitude is related, in a vector-meson-dominance picture, to the
quarkonium-nucleon scattering length. State the relation, state that it holds only under the
vector-meson-dominance hypothesis together with a low-energy expansion of the quarkonium-nucleon
amplitude, and prove the relation from those hypotheses. The scattering length so defined is a
parameter of an effective two-body description and is not the same object as the form factors of
3.6; say so, so that the two extractions are not conflated.

### Examples

- `λ_θ` at large `qT` for the colour-octet spin-triplet S-wave fragmentation contribution, with the
  heavy-quark spin symmetry hypothesis of 5.6 discharged as a hypothesis.
- The invariance of `λ̃` of 3.4 verified between two explicitly rotated frames.
- The physical region of 3.4 drawn as an explicit inequality system in `(λ_θ, λ_φ)`.
- The leading-power theorem of 3.1 instantiated for gluon fragmentation, with the remainder bound
  exhibited.
- The near-threshold amplitude of 3.6 written out with all three hypotheses appearing in its
  statement.

### Dependencies

Layers 0, 1 and 2; Layer 5.6 for the heavy-quark spin symmetry used by 3.5, which is a forward
reference within this roadmap and is discharged as a hypothesis wherever it is used before Layer 5.
Upstream: the convolution and fragmentation modules; `Matrix.PosSemidef`. From other roadmaps:
`CollinearEvolution` for the evolution operator; `Hadronization` for the fragmentation-function
interface; `Photoproduction` for the flux and exclusive kinematics;
`HadronMassAndEnergyMomentumTensor` for the gravitational form factors;
`GeneralizedPartonDistributions` for the gluon distribution in two-gluon exchange.

---

## Layer 4: amplitude analysis and spectroscopy

References: Eden, Landshoff, Olive and Polkinghorne, *The Analytic S-Matrix*, Cambridge (1966);
Chew and Mandelstam, *Phys. Rev.* 119 (1960) 467; Dalitz and Tuan, *Ann. Phys.* 10 (1960) 307;
Aitchison, *Nucl. Phys.* A189 (1972) 417; Chung, Brose, Hackmann, Klempt, Spanier and Strassburger,
*Ann. Phys. (Leipzig)* 4 (1995) 404; Barrelet, *Nuovo Cim.* A8 (1972) 331; Mikhasenko et al. (JPAC),
*Phys. Rev.* D98 (2018) 096021 [arXiv:1810.00016]; Guo, Hanhart, Meißner, Wang, Zhao and Zou,
*Rev. Mod. Phys.* 90 (2018) 015004 [arXiv:1705.00141]. Yellow Report subsection 7.4.6.

### 4.1 The angular basis and the partial-wave projection

⚠ Neither Mathlib nor TauCeti has Legendre polynomials or spherical harmonics, so the angular basis
is built here. Define the family on `[−1, 1]` by its three-term recurrence, in the shape of Mathlib's
`Polynomial.Chebyshev`. Prove: the degree, the parity in the argument, the orthogonality relation
with the explicit normalisation, and completeness in `L²([−1, 1])` — the last by density of
polynomials, which Mathlib supplies. Define the partial-wave projection of an amplitude as the
integral against the family, and prove the inversion formula.

State the convergence question honestly: the partial-wave series converges in a domain in the
scattering angle (a Lehmann ellipse) whose size is not determined by the partial waves themselves.
Carry the domain as a hypothesis; prove convergence given it. Do not assert convergence for physical
amplitudes.

### 4.2 Unitarity

For a fixed partial wave and a set of open channels, define the S-matrix and the T-matrix and the
diagonal phase-space matrix `ρ`. Prove:

- `S` unitary — in the sense of `TauCeti.Analysis.Matrix.UnitaryGroup` and Mathlib's
  `Algebra.Star.Unitary` — is equivalent to `Im T⁻¹ = −ρ` on the physical region, wherever `T` is
  invertible. This inverse form is the one every later theorem uses, because it is linear in the
  quantity that carries the dynamics.
- **Single channel.** The elastic amplitude satisfies `|T − i/(2ρ)| = 1/(2ρ)`: it lies on a circle
  of radius `1/(2ρ)`. Hence `|T| ≤ 1/ρ`, the unitarity bound, and the phase shift is well defined
  modulo `π`.
- **Herglotz property.** `T⁻¹ + iρ` is real on the physical region, and under the analyticity of 4.3
  the resulting function is Herglotz in the sense of `TauCeti.Analysis.Complex.Herglotz`, so the
  Nevanlinna representation of `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Nevanlinna` applies.
  This is the structural fact behind the K-matrix of 4.5.

### 4.3 Analyticity and the dispersion relation

Define the physical-sheet domain as the complex energy plane cut along the real axis above the lowest
threshold, with the branch of the channel momentum fixed by Convention 9 using Mathlib's
`Complex.log` branch. State hermitian analyticity as a named hypothesis and derive that the
discontinuity across the cut is given by unitarity. Then prove, using
`TauCeti.Analysis.Contour.Cauchy.IntegralFormula` and the principal-value machinery of
`TauCeti.Analysis.Contour.PerWindow.CPV`:

- a once-subtracted dispersion relation expressing the amplitude as a principal-value integral of
  its discontinuity plus a subtraction constant;
- **the uniqueness statement**: two functions analytic off the cut with the same discontinuity and a
  polynomial bound of degree `n` at infinity differ by a polynomial of degree at most `n`. This is
  the precise content of "analyticity determines the amplitude", and it makes visible that what
  analyticity does *not* determine is exactly the subtraction polynomial.

### 4.4 Sheets, poles, and what a resonance is

With `n` two-body channels, a sheet label is a function from the channel index to a sign, so there
are `2^n` sheets; prove the count. Define continuation across the cut between two thresholds using
`TauCeti.Analysis.Complex.Conformal.Continuation.Basic`, and prove that the continued function on
the adjacent sheet is given by the explicit sign-flipped expression in the channel momenta.

Define a resonance as a simple pole of the continued partial-wave amplitude on a named sheet, and
its mass and width by `√s_pole = M − i Γ/2`. Theorems:

- poles occur in complex-conjugate pairs, from hermitian analyticity;
- no pole lies on the physical sheet off the real axis, given unitarity and the analyticity
  hypothesis — so a resonance is necessarily an unphysical-sheet object, which is why 4.4 and not
  Layer 1.5 is where above-threshold states live;
- the residue of a simple pole factorises into a product of channel couplings, extracted with
  `TauCeti.Analysis.Contour.MeromorphicLaurent`; the couplings are defined up to an overall sign,
  and the sign ambiguity is stated rather than quietly fixed.

### 4.5 Coupled channels and the K-matrix

Define `K` real symmetric and `T = K (1 − i ρ K)⁻¹`. Prove:

- `T` so defined satisfies the unitarity relation of 4.2 at every energy where `1 − i ρ K` is
  invertible — a direct computation, and the reason the parametrisation is used;
- the set where `1 − i ρ K` fails to be invertible is discrete, by the analytic Fredholm alternative
  via `TauCeti.Analysis.Fredholm.Criteria` and `.CompactPerturbation`;
- a real pole of `K` is not in general a pole of `T`: compute the displacement of the pole explicitly
  for a one-pole, two-channel `K`, and prove that the displaced pole lies off the real axis on an
  unphysical sheet. This is the distinction between a bare and a dressed pole, and it is the reason
  a K-matrix pole position is not a mass.
- the underlying coupled-channel integral equation is a Fredholm equation of the second kind; state
  it, and state the conditions on the kernel under which the Fredholm theory of
  `TauCeti.Analysis.Fredholm.*` applies.

### 4.6 What an amplitude analysis determines, and what it does not

- **Discrete ambiguity.** For an intensity distribution expanded in a finite angular basis, the
  partial-wave sets reproducing it are characterised by the zeros of an associated polynomial in the
  cosine of the scattering angle, and complex-conjugating a subset of those zeros gives another
  solution. Prove the characterisation and count the solutions for a basis truncated at a given
  orbital angular momentum.
- **Continuum ambiguity.** Construct the linear map from partial waves to the observable set and
  prove that its kernel is non-trivial when the observable set is smaller than the wave set; state
  the ambiguity as the kernel of that Fredholm operator, using
  `TauCeti.Analysis.Fredholm.FiniteRank`. ⚠ TauCeti has no notion of ill-posedness, so nothing is
  phrased as ill-posedness; a rank-and-kernel statement is both available and sharper. This mirrors
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness`, and the same vocabulary
  is used.

### 4.7 Threshold behaviour and barrier factors

Prove that a partial wave of orbital angular momentum `ℓ` behaves as `q^(2ℓ+1)` as the channel
momentum `q → 0`, from the angular basis of 4.1 and the analyticity of 4.3. ⚠ Bessel functions are
absent upstream, so define the barrier factor at each finite `ℓ` by its explicit rational form in
`q` and a range parameter, prove the `q → 0` and `q → ∞` limits, and prove the recursion in `ℓ`.
Build the finitely many orders the roadmap uses; do not build the general theory.

### 4.8 Threshold cusps

Prove that the two-body phase-space function has a square-root branch point at each channel opening,
so any amplitude with an S-wave channel opening is non-analytic there. Then the theorem that makes
"a peak is not a state" rigorous:

- exhibit an explicit one-parameter family of two-channel amplitudes, given by a K-matrix with no
  pole, whose modulus has a strict local maximum at the threshold;
- prove, by counting the zeros of `det(1 − i ρ K)` in a stated neighbourhood with
  `TauCeti.Analysis.Contour.Argument.Principle` and `TauCeti.Analysis.Complex.Conformal.Rouche`,
  that the family has no pole in that neighbourhood on either adjacent sheet.

A constructed counterexample is what turns the statement from an admonition into mathematics.

### 4.9 Line shapes and pole counting

- **Breit-Wigner.** Define it, prove that its pole position is `M − iΓ/2` exactly in the single-
  channel constant-width case, and prove that with an energy-dependent width and more than one
  channel the parameters are not the pole parameters — exhibit the discrepancy as an explicit
  function of the couplings. This discharges Convention 10 with a theorem rather than a warning.
- **Flatté.** Define the two-channel form. Prove that it satisfies the unitarity relation of 4.2 for
  real couplings, and prove its parameter degeneracy: in the limit of large couplings the amplitude
  depends on fewer combinations of the parameters than there are parameters. Identify exactly which
  combinations survive, and prove that the map from parameters to amplitudes has the corresponding
  positive-dimensional fibres. This is a provable non-identifiability statement, and it is the honest
  form of the folklore that Flatté fits are degenerate.
- **Pole counting.** For an explicitly given two-channel family, prove how many poles lie on the
  sheets adjacent to a threshold as a function of the parameters, and prove that the count
  distinguishes the sub-family in which the pole is generated purely by the channel coupling from
  the sub-family in which a pole is present already at zero coupling. State plainly that this is a
  theorem about the given family and its parametrisation, not a theorem about nature: the criterion
  is as model-dependent as the family it is proved for.

### Examples

- The Argand circle for a single elastic channel, with the unitarity bound discharged.
- An explicit two-channel K-matrix with one bare pole, its two T-matrix poles located, and their
  sheets named.
- The cusp-without-pole family of 4.8, with the zero count verified.
- Barrier factors for `ℓ = 0, 1, 2` with the threshold behaviour of 4.7 proved.
- A Flatté amplitude with two parameter sets proved to give the same amplitude, instantiating the
  degeneracy of 4.9.
- The Barrelet-zero count of 4.6 for an angular basis truncated at `ℓ = 2`.

### Dependencies

Layer 1 for quantum numbers and the channel classification. Upstream: the contour, continuation,
argument-principle, Herglotz, Fredholm and matrix modules listed above; Mathlib's complex analysis.
From other roadmaps: `GeneralizedPartonDistributions` for the inverse-problem vocabulary used by
4.6. This layer is channel-agnostic and is usable by `MesonStructure` and `Photoproduction` without
importing the quarkonium theory.

---

## Layer 5: exotic hadrons and heavy-quark spin symmetry

References: Jaffe, *Phys. Rev.* D15 (1977) 267; Weinberg, *Phys. Rev.* 137 (1965) B672; Weinstein and
Isgur, *Phys. Rev.* D41 (1990) 2236; Isgur and Wise, *Phys. Lett.* B232 (1989) 113; Voloshin,
*Prog. Part. Nucl. Phys.* 61 (2008) 455 [arXiv:0711.4556]; Guo et al., *Rev. Mod. Phys.* 90 (2018)
015004; Brambilla, Eidelman, Hanhart, Nefediev, Shen, Thomas, Vairo and Yuan, *Phys. Rept.* 873
(2020) 1 [arXiv:1907.07583]; Meyer and Swanson, *Prog. Part. Nucl. Phys.* 82 (2015) 21
[arXiv:1502.07276]. Yellow Report subsections 7.4.5 and 7.4.6.

### 5.1 Colour singlets beyond the quark model

Define a configuration as a multiset of colour representations — copies of the fundamental, of its
dual, and of the adjoint for gluonic constituents — and call it admissible when the tensor product
contains the trivial representation. Compute the multiplicities by weight-space decomposition using
`TauCeti.Algebra.Lie.HighestWeight.Decomposition` and
`TauCeti.RepresentationTheory.ClassicalGroups.Decomposition`. Theorems:

- the admissible configurations with at most four quark-type constituents are exactly the
  quark-antiquark, three-quark, four-quark (two quarks and two antiquarks) and quark-antiquark-plus-
  adjoint cases, together with the five-quark (four quarks and one antiquark) case; prove
  admissibility and prove the non-admissibility of the excluded small cases;
- the multiplicity of the trivial representation in the product of two fundamentals and two duals is
  `2`. This number is the mathematical content of the phrase "two colour structures": it is why a
  four-quark configuration admits a diquark-antidiquark basis and a meson-meson basis, and why those
  two bases span the same two-dimensional space rather than describing different states. Prove the
  change of basis between them explicitly.

The second theorem is the one to insist on. It converts a qualitative debate about internal structure
into a statement about a two-dimensional space and a choice of basis in it, and it shows that "compact
versus molecular" is not a statement about colour at all.

### 5.2 Exotic quantum numbers, decidably

Using the predicate of Layer 1.4, define exoticity of a quantum-number assignment as its failure. By
1.4 the predicate is decidable, and the exotic list is derived. Define flavour exoticity separately:
a flavour content is exotic when it is not carried by any quark-antiquark or three-quark colour
singlet. Prove that the two notions are independent — exhibit an assignment exotic in quantum numbers
and not in flavour, and one exotic in flavour and not in quantum numbers. Both kinds occur among the
heavy-quark candidates, and conflating them is a standing source of confusion.

### 5.3 Compact multiquark and hadronic molecule as two hypotheses

State each as a proposition about the state's dominant Fock component and its spatial scale: a
compact configuration is one whose dominant component is a single colour-correlated cluster of size
set by the confinement scale; a molecular configuration is one whose dominant component is two
colour-singlet hadrons of separation set by the inverse of the momentum associated with a small
binding energy. Neither proposition is decided here.

State the discriminating observables, each as a conditional prediction with its hypotheses:

- the proximity of the mass to a two-hadron threshold, and the correlation between binding energy
  and size that a molecular assignment forces;
- the ratio of decay rates into isospin-related final states, which a molecular assignment predicts
  to be governed by the different thresholds of the constituent channels rather than by isospin
  symmetry;
- the production rate in a high-multiplicity environment relative to a compact state of the same
  quantum numbers;
- the compositeness of 5.4.

Each is stated as "if molecular, then ..." or "if compact, then ...". None is stated as a conclusion.

### 5.4 Compositeness

Define the compositeness `X` as the probability of the two-hadron component in the state's
normalisation, a number in `[0, 1]`. For a shallow S-wave bound state below the threshold of a single
channel, prove the low-energy theorem: the scattering length and effective range are determined by
`X`, the reduced mass and the binding momentum, with the explicit relations and an explicit remainder
controlled by the ratio of the interaction range to the inverse binding momentum. Corollaries: a
purely molecular state (`X = 1`) has a scattering length equal to twice the inverse binding momentum
up to the remainder, and a purely elementary state (`X = 0`) has a scattering length that vanishes in
the same limit.

Then the limitation, stated as the open definitional question it is: the derivation uses the
normalisation of a normalisable bound state below threshold. For a pole above threshold there is no
such normalisation, the natural extension of `X` is complex, and no positive-definite probabilistic
interpretation is available. The roadmap states the extension that is used in the literature, states
that its interpretation as a probability is not established, and does not present a compositeness
number for a resonance as a measurement of molecular content.

### 5.5 Hybrid configurations

Treat the gluonic degree of freedom as an adjoint constituent and derive the quantum numbers
accessible to a quark-antiquark pair together with one adjoint excitation, from the coupling of the
pair's quantum numbers of Layer 1.4 to the excitation's. Theorem: the resulting set includes members
of the exotic list of 5.2. State both halves of the consequence: observing an exotic quantum-number
assignment is decisive against a quark-antiquark interpretation, and it does not distinguish a hybrid
from a four-quark configuration, because 5.1 shows the latter reaches the same assignments. Writing
only the first half would overstate what the observation delivers.

### 5.6 Heavy-quark spin symmetry

In the limit of large heavy-quark mass the chromomagnetic bilinear of Layer 0.3 is suppressed by
`1/m`, so the heavy-quark spin decouples and the symmetry group acquires an `SU(2)` factor acting on
it alone. Prove:

- **Multiplet structure.** States organise into multiplets labelled by the total angular momentum
  `j_ℓ` of the light degrees of freedom; for `j_ℓ > 0` a multiplet has two members with total angular
  momentum `j_ℓ ± 1/2`, and for `j_ℓ = 0` one member. Prove via
  `TauCeti.Algebra.Lie.Sl2.ClebschGordan`.
- **The splitting pattern.** The mass splitting within a multiplet is of order `1/m`, with the
  coefficient given by the chromomagnetic matrix element; the splitting therefore scales inversely
  with the heavy-quark mass between two heavy flavours, at the stated order. This is a checkable
  prediction with a stated remainder.
- **Production ratios.** At leading order in `1/m` and in `v` the two members of a multiplet are
  produced in the ratio of their spin multiplicities. This is the statement Layer 3.5 uses.
- **Molecular partners.** If a state is molecular in a channel of two heavy-light hadrons, then
  heavy-quark spin symmetry relates that channel to the channels obtained by recoupling the
  heavy-quark spin, and predicts partner states with the correspondingly recoupled quantum numbers
  near the corresponding thresholds. Prove the recoupling; state the existence of the partners as a
  prediction of the molecular hypothesis, whose failure refutes that hypothesis in that channel at
  the stated order, and not as a milestone.

### 5.7 The decision procedure, and what it cannot decide

Assemble the layers into an explicit sequence of checkable propositions for a candidate peak, with
the statement of what each step can and cannot conclude:

1. Determine the quantum numbers by the partial-wave analysis of Layer 4.1 and 4.6, with the
   ambiguity of 4.6 reported as part of the result.
2. Test exoticity by 5.2, which either excludes a quark-antiquark interpretation or does not.
3. Fit a coupled-channel amplitude of Layer 4.5, and determine whether a pole exists in a stated
   neighbourhood by the counting of 4.8 and 4.9, which either excludes a pure cusp interpretation or
   does not.
4. Locate the pole and read its mass and width from its position, per 4.4 and Convention 10.
5. Test the molecular hypothesis by the compositeness of 5.4 where the state is below threshold, and
   by the heavy-quark spin partners of 5.6.

State plainly what the sequence does not do: no step proves that a state is compact or molecular.
Each step excludes, under stated hypotheses, and the roadmap's product is a precisely narrowed set of
surviving hypotheses. Any claim stronger than that is outside what the mathematics here supports.

### Examples

- The multiplicity-`2` computation of 5.1, with the explicit change of basis between the
  diquark-antidiquark and meson-meson colour bases.
- A quantum-number assignment of `1^{−+}` shown exotic by 5.2, and an isovector charmonium-like
  flavour content shown flavour-exotic but not quantum-number-exotic.
- The compositeness relations of 5.4 evaluated symbolically for `X = 1` and `X = 0`, with the
  remainder exhibited.
- The heavy-quark spin multiplet for `j_ℓ = 1/2` and its two members, with the production ratio of
  5.6 discharged.
- A molecular assignment in a heavy-light two-hadron channel, with its predicted spin partners
  enumerated by the recoupling of 5.6.
- A candidate at a two-hadron threshold analysed by the full sequence of 5.7, ending in a list of
  surviving hypotheses rather than an assignment.

### Dependencies

Layers 0 and 1 for the colour and quantum-number machinery, and Layer 4 in full for the amplitude
statements used by 5.3, 5.4 and 5.7. Upstream: the weight-space and classical-group decomposition
modules, and `TauCeti.Algebra.Lie.Sl2.ClebschGordan`. From other roadmaps: `LatticeBridge` for
lattice determinations of the hybrid and multiquark spectra, which this roadmap takes as inputs;
`NuclearMedium` for the production of these states in a nuclear environment, which is not developed
here.

---

## Dependency graph

```
                  CollinearEvolution (coupling, flavour thresholds)
                            |
        Layer 0 : scale hierarchy, NRQCD, matching, RG flow of coefficients
              |                                        |
              |                                        v
              |                      Layer 1 : spectrum, colour and spin
              |                       decomposition, attainable J^PC
              |                                        |
              +---------------------+------------------+
                                    v
              Layer 2 : colour-singlet model, NRQCD factorisation,
              infrared cancellation, universality as hypothesis, positivity
                                    |
                                    v
              Layer 3 : fragmentation at large qT, polarisation,
              near-threshold amplitude
                 |                          |                     |
                 |                          |                     v
    Hadronization (FF interface)   Photoproduction (flux)   HadronMassAndEMT
                                                             (form factors)

        Layer 1 (quantum numbers) ------> Layer 4 : partial waves, unitarity,
                                          analyticity, sheets and poles,
                                          K-matrix, ambiguities, cusps,
                                          line shapes, pole counting
                                                     |
                                                     v
                                          Layer 5 : colour enumeration,
                                          exoticity, compact vs molecular,
                                          compositeness, hybrids, HQSS,
                                          the decision procedure
```

Layer 4 depends on Layer 1 only, not on Layers 2 and 3, and is written to be usable by
`MesonStructure` and `Photoproduction` without the quarkonium theory. Layer 3.5 uses the
heavy-quark spin symmetry proved in Layer 5.6; wherever it is used before that layer it appears as
an explicit hypothesis of the statement, so the dependency is acyclic at the level of proofs.

## Acceptance examples

These are the specific statements whose presence certifies the roadmap. Each is checkable and none
of them is a headline.

1. The set of NRQCD operators with total grading at most `n` is finite, for every `n`, with the
   grading defined as in Layer 0.2 and instantiated for `n = 4`.
2. The matching coefficients at a given order are unique, given the rank condition on the amplitude
   set constructed in Layer 0.4.
3. The singlet and octet colour projectors are idempotent, orthogonal, complete, and have traces `1`
   and `N² − 1`, all proved from the generators of `EpsilonEridani.QFT.QCD.SU3Generators`.
4. `qqbarAttainable` is decidable, and `1^{−+}` is not attainable.
5. The radial Hamiltonian for a confining potential has compact resolvent and therefore discrete
   spectrum below the open-flavour threshold.
6. The spin-weighted centre of gravity of a spin-triplet `L = 1` multiplet is unshifted at first
   order by the spin-orbit and tensor operators.
7. The colour-singlet model expression equals the colour-singlet channel term of the NRQCD sum at
   leading order in `v`, with the normalisation of Convention 7.
8. The order-`αs` infrared divergence of the colour-singlet P-wave coefficient cancels against the
   ultraviolet anomalous dimension of the colour-octet S-wave matrix element, so that the truncated
   sum is infrared finite while neither term is.
9. The matrix of long-distance matrix elements in a channel basis is positive semidefinite.
10. Universality implies the consistency of the overdetermined linear system formed by two processes;
    the design matrix of a single process has a computed rank and an exhibited kernel.
11. At transverse momentum large compared with the pair's mass, the cross section equals a
    single-parton convolution with a quarkonium fragmentation function, up to a remainder of relative
    order `m²/qT²`.
12. Positive semidefiniteness of the spin-density matrix is equivalent to an explicit convex region
    in `(λ_θ, λ_φ, λ_θφ)`, and `λ̃` is invariant under the frame rotations of Layer 3.4 away from the
    exceptional locus.
13. Unitarity of the S-matrix is equivalent to `Im T⁻¹ = −ρ`, and the single-channel amplitude lies
    on the Argand circle.
14. Two functions analytic off the cut with the same discontinuity and the same polynomial bound
    differ by a polynomial of the stated degree.
15. An `n`-channel amplitude has `2^n` sheets; poles occur in conjugate pairs; no pole lies off the
    real axis on the physical sheet; the residue of a simple pole factorises into channel couplings.
16. `T = K (1 − iρK)⁻¹` with `K` real symmetric satisfies the unitarity relation, and the set where
    `1 − iρK` is not invertible is discrete.
17. There is an explicit two-channel amplitude family with a strict local maximum of `|T|` at a
    threshold and provably no pole in a stated neighbourhood of either adjacent sheet.
18. The Flatté form has a positive-dimensional parameter fibre in the strong-coupling limit, with the
    surviving combinations identified.
19. The multiplicity of the colour singlet in the product of two fundamentals and two duals is `2`,
    with the explicit change of basis between the two natural bases.
20. For a shallow S-wave bound state, the scattering length is determined by the compositeness, the
    reduced mass and the binding momentum, with an explicit remainder; and the extension of the
    compositeness to a pole above threshold is recorded as an open definitional question, not as a
    theorem.
21. Heavy-quark spin multiplets have two members for `j_ℓ > 0` and one for `j_ℓ = 0`; the splitting
    within a multiplet is of order `1/m` with the chromomagnetic coefficient; the two members are
    produced in the ratio of their spin multiplicities at leading order.
22. Conditional on heavy-quark spin symmetry and on colour-octet spin-triplet S-wave dominance,
    `λ_θ → 1` at large transverse momentum, with a bounded remainder — and the corresponding
    colour-singlet prediction is derived alongside it, so that the two can be compared.

## References

- G. T. Bodwin, E. Braaten and G. P. Lepage, "Rigorous QCD analysis of inclusive annihilation and
  production of heavy quarkonium", *Phys. Rev.* D51 (1995) 1125, erratum D55 (1997) 5853
  [hep-ph/9407339].
- W. E. Caswell and G. P. Lepage, "Effective Lagrangians for bound state problems in QED, QCD, and
  other field theories", *Phys. Lett.* B167 (1986) 437.
- N. Brambilla, A. Pineda, J. Soto and A. Vairo, "Effective field theories for heavy quarkonium",
  *Rev. Mod. Phys.* 77 (2005) 1423 [hep-ph/0410047].
- N. Brambilla et al. (Quarkonium Working Group), "Heavy quarkonium physics", CERN-2005-005
  [hep-ph/0412158].
- A. Pineda and J. Soto, "Effective field theory for ultrasoft momenta in NRQCD and NRQED",
  *Nucl. Phys. Proc. Suppl.* 64 (1998) 428 [hep-ph/9707481].
- E. Eichten, K. Gottfried, T. Kinoshita, K. D. Lane and T.-M. Yan, "Charmonium: comparison with
  experiment", *Phys. Rev.* D17 (1978) 3090.
- S. Godfrey and N. Isgur, "Mesons in a relativized quark model with chromodynamics", *Phys. Rev.*
  D32 (1985) 189.
- C. Quigg and J. L. Rosner, "Quantum mechanics with applications to quarkonium", *Phys. Rept.* 56
  (1979) 167.
- C.-H. Chang, "Hadronic production of J/ψ associated with a gluon", *Nucl. Phys.* B172 (1980) 425.
- E. L. Berger and D. L. Jones, "Inelastic photoproduction of J/ψ and Υ by gluons", *Phys. Rev.* D23
  (1981) 1521.
- R. Baier and R. Rückl, "Hadronic production of J/ψ and Υ: transverse momentum distributions",
  *Z. Phys.* C19 (1983) 251.
- G. C. Nayak, J.-W. Qiu and G. Sterman, "Fragmentation, NRQCD and NNLO factorization analysis in
  heavy quarkonium production", *Phys. Rev.* D72 (2005) 114012 [hep-ph/0509021].
- J.-P. Lansberg, "New observables in inclusive production of quarkonia", *Phys. Rept.* 889 (2020) 1
  [arXiv:1903.09185].
- E. Braaten and T. C. Yuan, "Gluon fragmentation into heavy quarkonium", *Phys. Rev. Lett.* 71
  (1993) 1673.
- P. Cho and A. K. Leibovich, "Color-octet quarkonia production", *Phys. Rev.* D53 (1996) 150 and
  D53 (1996) 6203.
- M. Beneke and M. Krämer, "Direct J/ψ and ψ' polarization and cross-sections at the Tevatron",
  *Phys. Rev.* D55 (1997) 5269.
- Z.-B. Kang, J.-W. Qiu and G. Sterman, "Heavy quarkonium production and polarization",
  *Phys. Rev. Lett.* 108 (2012) 102002.
- M. Butenschoen and B. A. Kniehl, "J/ψ polarization at the Tevatron and the LHC: nonrelativistic-QCD
  factorization at the crossroads", *Phys. Rev. Lett.* 108 (2012) 172002.
- P. Faccioli, C. Lourenço, J. Seixas and H. K. Wöhri, "Towards the experimental clarification of
  quarkonium polarization", *Eur. Phys. J.* C69 (2010) 657 [arXiv:1006.2738].
- D. Kharzeev, H. Satz, A. Syamtomov and G. Zinovjev, "J/ψ photoproduction and the gluon structure
  of the nucleon", *Eur. Phys. J.* C9 (1999) 459 [hep-ph/9901375].
- A. Ali et al. (GlueX Collaboration), "First measurement of near-threshold J/ψ exclusive
  photoproduction off the proton", *Phys. Rev. Lett.* 123 (2019) 072001.
- R. J. Eden, P. V. Landshoff, D. I. Olive and J. C. Polkinghorne, *The Analytic S-Matrix*,
  Cambridge University Press (1966).
- G. F. Chew and S. Mandelstam, "Theory of low-energy pion-pion interaction", *Phys. Rev.* 119 (1960)
  467.
- R. H. Dalitz and S. F. Tuan, "The phenomenological description of K-nucleon reaction processes",
  *Ann. Phys.* 10 (1960) 307.
- I. J. R. Aitchison, "The K-matrix formalism for overlapping resonances", *Nucl. Phys.* A189 (1972)
  417.
- S. U. Chung, J. Brose, R. Hackmann, E. Klempt, S. Spanier and C. Strassburger, "Partial wave
  analysis in K-matrix formalism", *Ann. Phys. (Leipzig)* 4 (1995) 404.
- E. Barrelet, "A new point of view in the analysis of two-body reactions", *Nuovo Cim.* A8 (1972)
  331.
- M. Mikhasenko et al. (JPAC Collaboration), "Pole position of the a₁(1260) from a
  three-body-decay analysis", *Phys. Rev.* D98 (2018) 096021 [arXiv:1810.00016].
- S. Weinberg, "Evidence that the deuteron is not an elementary particle", *Phys. Rev.* 137 (1965)
  B672.
- R. L. Jaffe, "Multiquark hadrons. I. Phenomenology of Q²Q̄² mesons", *Phys. Rev.* D15 (1977) 267.
- J. D. Weinstein and N. Isgur, "K K̄ molecules", *Phys. Rev.* D41 (1990) 2236.
- N. Isgur and M. B. Wise, "Weak decays of heavy mesons in the static quark approximation",
  *Phys. Lett.* B232 (1989) 113.
- M. B. Voloshin, "Charmonium", *Prog. Part. Nucl. Phys.* 61 (2008) 455 [arXiv:0711.4556].
- F.-K. Guo, C. Hanhart, U.-G. Meißner, Q. Wang, Q. Zhao and B.-S. Zou, "Hadronic molecules",
  *Rev. Mod. Phys.* 90 (2018) 015004 [arXiv:1705.00141].
- N. Brambilla, S. Eidelman, C. Hanhart, A. Nefediev, C.-P. Shen, C. E. Thomas, A. Vairo and
  C.-Z. Yuan, "The XYZ states: experimental and theoretical status and perspectives", *Phys. Rept.*
  873 (2020) 1 [arXiv:1907.07583].
- C. A. Meyer and E. S. Swanson, "Hybrid mesons", *Prog. Part. Nucl. Phys.* 82 (2015) 21
  [arXiv:1502.07276].
- R. Abdul Khalek et al., "Science requirements and detector concepts for the Electron-Ion Collider:
  EIC Yellow Report", *Nucl. Phys.* A1026 (2022) 122447 [arXiv:2103.05419], Volume II, subsections
  7.4.4, 7.4.5 and 7.4.6.

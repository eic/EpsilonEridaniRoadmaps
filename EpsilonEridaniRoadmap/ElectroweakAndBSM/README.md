# Roadmap: electroweak physics, effective operators, and connections beyond QCD

The electroweak sector as probed by lepton-nucleon scattering. A deep-inelastic event at large
momentum transfer is not only a measurement of hadron structure: the exchanged current is a
mixture of photon and `Z`, the charged-current channel exchanges a `W`, and the couplings of
those currents to quarks and leptons are fixed by the gauge structure of the Standard Model.
This roadmap develops those couplings from the representation content of the gauge group, the
parity-violating and charged-current observables that measure them, the effective operators that
parameterise physics above the collider scale, and the precise sense in which a lepton-nucleon
measurement constrains a neutrino, cosmic-ray or hadron-collider prediction.

The final application is a constraint statement with named hypotheses. A measured asymmetry is a
real number with an error bar; what a formalisation can add is the exact map from a set of
short-distance coefficients to that number, together with a theorem about the map's kernel. The
central results of the roadmap are therefore of two kinds: derivations that the neutral- and
charged-current couplings are what they are, given the gauge representations and the mixing
angle; and rank statements about the linear map from effective-operator coefficients to
observables, which say which combinations a given measurement set determines and which it cannot
see at all. The second kind is what makes the difference between a bound and a claim.

This roadmap owns the electroweak couplings that `InclusiveStructureFunctions` uses, the
effective-operator basis, and the connections to neighbouring fields. Hadronic structure is
elsewhere; here the hadronic input is taken as given and the electroweak structure is the
subject. Concretely, when an asymmetry is written as a ratio of contractions of a leptonic tensor
with a hadronic tensor, this roadmap is responsible for the leptonic tensor, the propagator
factors, the couplings and the flavour bookkeeping, and takes the hadronic tensor and the parton
densities as opaque inputs supplied by their owners.

The material also carries the interface to the wider high-energy-physics programme. Ultra-high-
energy neutrino cross sections, cosmic-ray air-shower development and hadron-hadron predictions
all consume parton densities extracted from lepton-nucleon data, and each consumption step has
hypotheses. Stating those hypotheses, and stating which kinematic region of the densities each
application actually samples, is part of this roadmap and not of the roadmaps that supply the
densities.

## Scope

Included:

- The electroweak gauge structure as it bears on lepton-quark scattering: the representation
  assignments of one fermion generation, the hypercharge normalisation, the mixing of the neutral
  gauge fields, and the derivation of the vector and axial neutral-current couplings of an
  arbitrary fermion as functions of its weak isospin third component and its electric charge.
- The four-fermion effective neutral-current interaction obtained by contracting the `Z`
  propagator at momentum transfer well below the `Z` mass, and the parity-violating coupling
  combinations conventionally called `C_{1q}` and `C_{2q}`, expressed through the fundamental
  couplings rather than tabulated.
- The charged-current interaction: the quark mixing matrix as an element of a unitary group, the
  unitarity relations and their row and column forms, and the flavour-changing structure of the
  charged current.
- The scale dependence of the weak mixing angle in a stated renormalisation scheme, posed as an
  initial-value problem for a coupling flow with a scheme tag carried in the type, and the
  statement that a measurement at one scale constrains the parameter at another scale only
  through that flow.
- Electroweak deep-inelastic cross sections: the neutral-current cross section with photon, `Z`
  and interference terms separated by their propagator and coupling factors; the charged-current
  cross section; and the helicity structure of both, including the vanishing of one beam-helicity
  charged-current cross section proved from the chiral projection rather than asserted.
- Parity-violating asymmetries: the single-spin asymmetry for a polarised beam on an unpolarised
  target, its expression through structure functions and couplings, the flavour combinations each
  asymmetry selects, the deuteron asymmetry and the theorem that its leading hadronic-structure
  dependence cancels for an isoscalar target, and the double-spin asymmetry together with the
  beam-target polarisation combination that isolates the parity-violating piece.
- The effective-field-theory formulation: the Standard Model Lagrangian extended by
  higher-dimension operators suppressed by a scale, the dimension-six operators that contribute
  to lepton-quark scattering, the redundancy of a naive enumeration, and an independent basis
  obtained by applying equations of motion and field redefinitions explicitly, with the quotient
  structure that makes "independent" a precise statement.
- The linear map from operator coefficients to observables, its matrix in a chosen basis, the
  characterisation of blind directions as the kernel of that map for a given observable set, and
  the corresponding rank theorem; the dependence of the kernel on which observables are included.
- Lepton flavour violation: the operators producing a final-state lepton of a different flavour,
  their contribution to the cross section, and the kinematic signature that separates them from
  flavour-conserving backgrounds.
- Flavour non-universality with lepton flavour conserved: the ratio observables that isolate it
  and the cancellation of hadronic structure in those ratios.
- The neutrino, cosmic-ray and hadron-collider connections: high-energy neutrino-nucleon cross
  sections expressed through the same densities, the momentum-fraction and scale region an
  ultra-high-energy cross section depends on, the shower observables of a cosmic-ray cascade and
  the region they sample, and the universality statement under which a density extracted from
  lepton-nucleon scattering may be used in a hadron-hadron prediction.
- The cross-field consistency test between a transverse-momentum-dependent function measured in
  semi-inclusive lepton-nucleon scattering and the same function in annihilation, including the
  sign-reversal statement, stated once here so that the test exists in a single place.

Not included, and where it belongs instead. The unpolarised structure functions themselves,
their parton-model content and the parity-odd structure function's definition belong to
`InclusiveStructureFunctions`; this roadmap consumes them as given functions of the kinematic
invariants and never re-derives their operator definitions. The polarised quark and gluon
densities entering the double-spin asymmetries belong to `SpinStructure`. The splitting kernels,
the moment machinery and the running of the strong coupling belong to `CollinearEvolution`; the
running of the *electroweak* couplings and of the mixing angle is developed here, because no
other area needs it. The one-loop and higher electroweak corrections, the `γ`-`Z` box, the QED
radiative tail and the definition of a radiatively corrected asymmetry belong to
`RadiativeCorrections`; this roadmap states precisely which corrections a precision asymmetry
requires and in what form it will accept them, and does not compute them. The definitions of the
transverse-momentum-dependent functions, their rapidity evolution and their operator structure
belong to `TransverseMomentumDistributions`; only the cross-field sign-reversal test is stated
here. Nuclear corrections to a deuteron target beyond the free isoscalar combination — binding,
Fermi motion, the neutron-to-proton ratio in a bound state — belong to `LightNuclei`, and
nuclear modifications of the densities to `NuclearPartonDistributions`; the deuteron theorem
proved here is a statement about the free isoscalar flavour combination, with the nuclear
correction named as an input from those areas. Heavy-quark mass effects in the charged current
belong to `CollinearEvolution`. Jet observables used in electroweak measurements belong to
`JetsAndEventShapes`. Hadronisation of the struck quark belongs to `Hadronization`. Lattice
determinations of any matrix element appearing here belong to `LatticeBridge`.

Every item in the Included list above is in scope; every item in the previous
paragraph is out of scope and is named with its owner.

Material developed here belongs under `EpsilonEridani/QFT/Scattering/DIS/PVES/`, whose
`Electroweak/` subdirectory already holds the neutral-current couplings and the scheme
parameters. The effective-operator material, which is not specific to parity violation, belongs
in a new `EpsilonEridani/QFT/EFT/` subtree — the operator basis, the equation-of-motion quotient
and the coefficient-to-observable map — with the observable side importing from `PVES`. The
neighbouring-field connections belong under `EpsilonEridani/QFT/Scattering/DIS/PVES/Connections/`
rather than in a separate top-level directory, because every statement they make is a statement
about the same densities and the same cross sections.

## Conventions and coordination with upstream

1. **The weak mixing angle is a scheme-tagged running parameter, never a numeral.** The type
   carrying it records a renormalisation scheme and a scale, and the value at a scale is obtained
   from a flow with an initial condition. There is no definition anywhere in the roadmap whose
   right-hand side is a decimal number. The trap avoided is the one that makes electroweak
   precision statements unfalsifiable: a numerical `sin²θ_W` silently fixes a scheme, and two
   results using different schemes then differ by a real effect that looks like arithmetic.
2. **Couplings are functions of quantum numbers, with fermions as instances.** The neutral-current
   vector and axial couplings are defined for a general fermion given its weak isospin third
   component, its electric charge and the mixing angle; `u`, `d`, `s`, `e` and `ν` are instances
   obtained by supplying quantum numbers. The trap avoided is a tabulated list of eight
   numbers whose internal consistency cannot be stated, let alone proved.
3. **Hypercharge normalisation is fixed once and recorded in the name.** The convention is
   `Q = T³ + Y/2` with the left-handed lepton doublet carrying `Y = -1`. Every hypercharge in the
   roadmap is in this normalisation, and any definition that would be off by a factor of two under
   the alternative convention states the convention in its docstring. The trap avoided is the
   factor-of-two ambiguity that survives all internal consistency checks and fails only against
   the literature.
4. **An asymmetry definition states the polarised particle and the sign of the difference.**
   The single-spin parity-violating asymmetry is
   `A_PV = (σ_R - σ_L) / (σ_R + σ_L)` with `R` and `L` the *beam* helicity states and the target
   unpolarised; the helicity label is an argument of the cross-section function, not a comment.
   Double-spin asymmetries carry two independent polarisation arguments and the definition names
   which one is reversed. The trap avoided is a sign error that propagates into the extracted
   coupling with no internal symptom.
5. **The coupling combinations `C_{1q}` and `C_{2q}` are derived, not primitive.** They are
   defined as the specific bilinear combinations of lepton and quark vector and axial couplings
   that appear in the asymmetry, and the theorem that they take their Standard Model values is
   proved from Layer 0. The trap avoided is defining the thing that is measured in terms of
   itself, which makes the measurement vacuous.
6. **An effective-operator coefficient is meaningless without its basis.** The type of a
   coefficient vector is indexed by an explicit basis object, and a change of basis is a linear
   map between coefficient types, not a re-labelling. The scale at which the coefficients are
   defined is a field. The trap avoided is comparing two coefficient vectors expressed in
   different bases, which is the most common error in the effective-operator literature and is
   invisible once the basis is implicit.
7. **The truncation is explicit data.** The object describing an effective-field-theory
   prediction records the mass-dimension bound, and whether the prediction retains only the
   interference of a higher-dimension operator with the Standard Model amplitude or also its
   square. Two predictions with different truncation records are different objects and are not
   interchangeable. The trap avoided is an apparent disagreement between two bounds that differ
   only in whether the dimension-six squared term was kept.
8. **The suppression scale appears as `1/Λ²` with dimensionless coefficients, and the choice is a
   field.** Whether a coefficient absorbs `1/Λ²` is recorded in the coefficient type, because both
   conventions are in use and the difference is a factor with dimensions. The trap avoided is a
   quoted limit on a "coefficient" that is a limit on a different quantity.
9. **The quark mixing matrix is an element of a unitary group type, not a matrix carrying a
   unitarity field.** Unitarity is a property of the ambient type, established once, and every
   unitarity relation used downstream is a theorem about that type. The trap avoided is the
   placeholder-witness pattern: a `Prop`-valued structure field asserting unitarity, satisfied by
   whatever term closes the goal, asserts nothing while looking like a hypothesis.
10. **No `Prop`-valued field is introduced to stand in for an unproved statement.** Where a result
    is a hypothesis, a conjecture or an open problem it is named as such in this document and
    carries a `sorry` in the Lean file. It is never encoded as a structure field. The trap avoided
    is the one this project's own audit found across the library: obligations hidden in fields
    that are discharged by construction and therefore constrain nothing.
11. **A blind direction is always an element of the kernel of a named linear map on a named
    observable set.** The phrase never appears informally. A statement that a direction is blind
    carries the map and the observable set as arguments, and adding an observable to the set is an
    operation that can only shrink the kernel — a theorem, stated and proved. The trap avoided is
    the claim that a direction is unconstrainable, which is a statement about a particular
    experiment and not about nature.
12. **Frames, metric signature and Dirac-algebra conventions are inherited, never restated.**
    Kinematic invariants come from `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, the metric
    and spinor conventions from `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions`
and `EpsilonEridani.Relativity.CliffordAlgebraExtensions`. This roadmap adds no new
    metric convention and no new gamma-matrix basis. The trap avoided is two incompatible
    signatures inside one library.
13. **Flavour indices are typed, and lepton flavour is distinct from quark flavour.** A
    lepton-flavour-violating operator is one whose lepton flavour indices differ, which is a
    statement about the index type and not about the operator's name. The trap avoided is a
    silent identification of a flavour index with a generation number, which breaks as soon as
    mixing is introduced.
14. **A universality statement is a named hypothesis with a stated domain.** "The same density
    appears" is never written without the factorisation theorem, the scheme and the kinematic
    domain under which it holds. The trap avoided is exporting a density outside the regime where
    its definition applies.

## Existing upstream material used by the roadmap

In EpsilonEridani:

- `EpsilonEridani.QFT.Scattering.DIS.PVES.Basic` — the parity-violating scattering setup this
  roadmap extends. It is the base, not a starting sketch: the asymmetry infrastructure of Layer 2
  is added to it rather than beside it.
- `EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.NeutralCurrent` — the existing
  neutral-current couplings. Layer 0 supplies the derivation of these from the gauge
  representations, so that the existing definitions become theorems about the derived objects
  rather than independent data.
- `EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.Parameters` — the electroweak parameter
  record, which is where the scheme tag and the mixing angle live and where Layer 0's flow deposits
  its result.
- `EpsilonEridani.QFT.Scattering.DIS.PVES.Interference.Basic` — the photon-`Z` interference
  structure, used directly by the neutral-current cross section of Layer 1.
- `EpsilonEridani.QFT.Scattering.DIS.PVES.Processes.EP` and `.Processes.EE` — the electron-proton
  and electron-electron process specifications. The first is the main line of the roadmap; the
  second, together with `EpsilonEridani.QFT.Scattering.DIS.PVES.Examples.Moller`, gives a purely
  leptonic process in which the coupling derivation of Layer 0 can be checked with no hadronic
  input at all, which is why it is used as an acceptance example.
- `EpsilonEridani.QFT.Scattering.DIS.PVES.Examples.Basic` — the worked examples, extended with the
  deuteron case.
- `EpsilonEridani.QFT.Scattering.DIS.Basic`, `.CrossSection`, `.Kinematics.Basic` and
  `.Kinematics.Bounds` — the deep-inelastic kinematics and the cross-section skeleton. The
  electroweak cross sections of Layer 1 are instances of this skeleton with different current
  factors, not a parallel construction.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` and `.Tensors.Longitudinal` — the hadronic
  tensor decomposition. Layer 1 contracts against these and does not redefine them.
- `EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic` — the polarised cross-section structure used
  by the double-spin asymmetry of Layer 2.
- `EpsilonEridani.Particles.StandardModel.Fermions.LeptonDoubletExtensions` and
  `.Fermions.DownSingletExtensions` — the Standard Model fermion representations, reached through
  EpsilonEridani's extensions of the upstream physics library. These carry the gauge quantum
  numbers Layer 0 derives the couplings from, which is why Layer 0 is a derivation and not a
  table.
- `EpsilonEridani.Particles.StandardModel.HiggsBoson.BasicExtensions` — the scalar sector, used for
  the symmetry-breaking pattern that produces the mixing of the neutral gauge fields.
- `EpsilonEridani.Relativity.Fermions.Weyl.LeftHandedExtensions`,
  `.Weyl.RightHandedExtensions` and `.Weyl.ContractionExtensions` — chiral spinors and their
  contractions. The charged-current helicity theorem of Layer 1 is proved from these, which is
  what makes it a proof rather than a restatement.
- `EpsilonEridani.Relativity.CliffordAlgebraExtensions` — the Dirac algebra used in the leptonic
  tensor computation.
- `EpsilonEridani.Mathematics.LieAlgebra.SpecialUnitary` and `.StructureConstants` — the
  `SU(N)` structure used for the weak isospin algebra of Layer 0; `EpsilonEridani.QFT.QCD.SU2Generators`
  supplies an explicit generator set in the two-dimensional case.
- `EpsilonEridani.Particles.Parton.PDF.Basic` — the parton densities, consumed as given.
- `EpsilonEridani.Particles.Parton.TMD.Basic` and `.TMD.CollinsSoper` — the
  transverse-momentum-dependent functions, consumed as given by the sign-reversal statement of
  Layer 5.
- `EpsilonEridani.QFT.Factorization.DIS.LO` and `.DIS.HardKernel` — the leading-order
  factorisation used to give the parton-model content of the parity-odd structure functions, with
  the hadronic input taken from `InclusiveStructureFunctions`.
- `EpsilonEridani.QFT.Factorization.Evolution.QCDCore` and
  `EpsilonEridani.QFT.QCD.Renormalization` — the existing renormalisation-group machinery, whose
  shape the electroweak coupling flow of Layer 0 follows so that the library has one notion of a
  running parameter and not two.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` — the existing identifiability
  statement for density extraction. Layer 4's blind-direction theorem is a different instance of
  the same pattern, in coefficient space rather than density space, and follows its shape
  deliberately.

In TauCeti:

- `TauCeti.RepresentationTheory.ClassicalGroups.Weight.Basic`,
  `.Weight.Decomposition`, `.Torus` and `.Restriction` — weights of a classical group
  representation and restriction to a subgroup. This is the machinery Layer 0 uses to state the
  electroweak representation content and to derive the electric charge as the unbroken generator,
  rather than declaring the charges.
- `TauCeti.RepresentationTheory.ClassicalGroups.Standard` and `.Determinant` — the standard
  representation and the determinant character, used for the doublet and for the hypercharge
  direction.
- `TauCeti.LinearAlgebra.Matrix.UnitaryGroup` — the unitary group of matrices, the ambient type of
  the quark mixing matrix in Convention 9.
- `TauCeti.Analysis.Fredholm.FiniteRank`, `.ClosedRange` and `.Adjoint` — the operator-theoretic
  home of the blind-direction statement of Layer 4. The coefficient-to-observable map is a finite-
  rank map between finite-dimensional spaces in its basic form, and a Fredholm map of index
  determined by the observable count in the continuum-observable form; a blind direction is an
  element of its kernel, and the adjoint gives the constrained combinations as the range of the
  adjoint. Nothing about kernels or closed ranges is reproved here.
- `TauCeti.Analysis.Fredholm.Criteria` and `.Parametric` — used for the dependence of the kernel on
  the observable set, which is a parametric family of Fredholm maps.
- `TauCeti.Analysis.Matrix.Spectrum` — the spectral decomposition used for the singular-value
  characterisation of well- and ill-constrained directions in Layer 4.
- `TauCeti.Analysis.ODE.Linear`, `.GlobalSolution`, `.InitialCondition` and `.SmoothParameter` —
  the right home for the coupling flow of Layer 0. The running of the mixing angle is an
  initial-value problem for a system of ordinary differential equations in the logarithm of the
  scale; existence, uniqueness, global extension and smooth dependence on the initial condition
  come from here and are not reproved. The parametric smoothness matters: the statement that a
  measurement at one scale constrains the parameter at another is a statement about the
  dependence of the solution on its initial condition.
- `TauCeti.LinearAlgebra.Dimension.DirectSum` and `TauCeti.LinearAlgebra.Dual.Lemmas` — dimension
  counting for the operator basis of Layer 3, and the dual-space description of a constraint as a
  linear functional on coefficient space.

In Mathlib:

- `Mathlib.Algebra.Star.Unitary` — unitary elements, underlying the mixing-matrix type.
- `Mathlib.LinearAlgebra.Matrix.Rank` — the rank of the coefficient-to-observable matrix, which is
  the content of the blind-direction theorem in the finite-dimensional case.
- `Mathlib.LinearAlgebra.Matrix.NonsingularInverse` — inversion of the constrained block, used for
  the statement that a subset of coefficients is determined.
- `Mathlib.LinearAlgebra.Matrix.Determinant.Basic` and `Mathlib.LinearAlgebra.Matrix.Trace` — used
  in the mixing-matrix relations and in the leptonic tensor traces.
- `Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic` — the mixing angle and the
  `sin²θ_W`/`cos²θ_W` identities.
- `Mathlib.Analysis.SpecialFunctions.Log.Basic` — the logarithm of the scale ratio, the natural
  variable of the coupling flow.
- `Mathlib.Analysis.Calculus.Deriv.Basic` and `Mathlib.Analysis.ODE.Gronwall` — the derivative in
  the flow equation and the stability estimate for the solution's dependence on its initial
  condition.
- `Mathlib.Algebra.Lie.Basic` and `Mathlib.Algebra.Lie.Classical` — the Lie-algebra vocabulary for
  the electroweak gauge algebra.
- `Mathlib.RepresentationTheory.Basic` — the representation vocabulary the fermion multiplets are
  expressed in.

Genuine absences:

- ⚠ **No electroweak coupling flow exists anywhere upstream.** EpsilonEridani has a QCD beta
  function (`EpsilonEridani.QFT.QCD.OneLoopBeta`) but nothing electroweak, and neither TauCeti nor
  Mathlib has any renormalisation-group content. Layer 0 builds the flow here, in the shape
  `EpsilonEridani.QFT.QCD.Renormalization` established, so that the library has one notion of a
  scheme-tagged running parameter. The roadmap does not wait for an upstream change.
- ⚠ **No effective-operator basis exists anywhere upstream, and no equation-of-motion quotient.**
  There is no notion of a higher-dimension operator, no operator-dimension bookkeeping and no
  field-redefinition machinery in EpsilonEridani, TauCeti or Mathlib. Layer 3 builds all of it
  here. The quotient construction uses Mathlib's module-quotient vocabulary, and the operator
  space is presented as a free module on an explicit index type so that the quotient is a
  statement about submodules and not about a list of names.
- ⚠ **No quark mixing matrix exists in EpsilonEridani.** The unitary-group type it lives in exists
  upstream (`TauCeti.LinearAlgebra.Matrix.UnitaryGroup`, `Mathlib.Algebra.Star.Unitary`); the
  physics object does not. Layer 0 introduces it.
- ⚠ **Polylogarithms and harmonic sums are absent from both Mathlib and TauCeti.** These are the
  functions in which electroweak box corrections and two-loop coefficient functions are expressed.
  This roadmap does not need them, because it specifies the corrections it requires as opaque
  functions with stated properties and takes their values from `RadiativeCorrections`; that area
  owns the absence and builds what it needs. The boundary is stated here so that no reader expects
  a closed-form correction in this subtree.
- ⚠ **No notion of ill-posedness or of regularisation exists in TauCeti.** Layer 4 therefore states
  the poorly-constrained directions through the singular values of an explicit map, using
  `TauCeti.Analysis.Matrix.Spectrum`, and states the ill-conditioning as a quantitative bound on
  the smallest singular value rather than invoking a general theory that is not there. This is a
  restriction of ambition, not a gap in the layer: every statement in Layer 4 is a statement about
  a concrete finite-rank map.
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Particles.FlavorPhysics.CKMMatrix.Basic` and
  `Physlib.Particles.FlavorPhysics.CKMMatrix.Rows` for the mixing matrix and its row-unitarity
  relations, which Layer 2 should consume rather than restate;
  `Physlib.Particles.StandardModel.Representations` for the gauge representations of Layer 0; and
  `Physlib.Particles.StandardModel.AnomalyCancellation.Basic` together with
  `Physlib.QFT.QED.AnomalyCancellation.Basic` for the anomaly conditions any new-physics extension
  of Layer 5 must satisfy. This is the strongest Physlib dependency of any area in the set.

## Layer 0: gauge structure and the electroweak couplings

References: Yellow Report §7.5.1; Particle Data Group review of the electroweak model; Erler,
Kurylov and Ramsey-Musolf (2003) for the running of the mixing angle.

### 0.1 Representation content of one generation

The gauge algebra is the direct sum of an `SU(2)` factor and an abelian factor. One fermion
generation is a list of irreducible representations of this algebra: a left-handed quark doublet,
two right-handed quark singlets, a left-handed lepton doublet, a right-handed charged-lepton
singlet. Each is presented as a weight of the maximal torus in the sense of
`TauCeti.RepresentationTheory.ClassicalGroups.Torus`, with the `SU(2)` weight giving the weak
isospin third component and the abelian weight giving the hypercharge.

The data to define: a type of electroweak multiplet carrying an isospin representation label, a
hypercharge, and a chirality; and the five instances of one generation. The theorem to prove:
the hypercharge assignments of one generation are the unique assignments, up to overall scale,
for which the sum of the cubes and the sum of the hypercharges over a generation both vanish —
the anomaly cancellation conditions stated as a linear and a cubic equation in the assignments.
This is a concrete finite computation and is a strong check that the representation content has
been entered correctly.

### 0.2 Electric charge as the unbroken generator

The scalar sector fixes a direction in the Cartan subalgebra along which the symmetry is
unbroken. The electric charge operator is the generator along that direction. The theorem to
prove: with the hypercharge normalisation of Convention 3, the charge eigenvalue of a state of
weak isospin third component `T³` and hypercharge `Y` is `Q = T³ + Y/2`, and the resulting charges
of the five multiplets of §0.1 are the physical quark and lepton charges. The proof is a weight
computation using `TauCeti.RepresentationTheory.ClassicalGroups.Weight.Decomposition` and the
restriction machinery of `.Restriction`; the scalar direction comes from
`EpsilonEridani.Particles.StandardModel.HiggsBoson.BasicExtensions`.

### 0.3 Neutral-gauge-field mixing and the mixing angle

The two neutral gauge fields of the unbroken and broken directions are related to the gauge-basis
fields by a rotation. The definition: the mixing angle as the parameter of that rotation, with
`sin θ_W` and `cos θ_W` and the identity relating them obtained from
`Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic`. The theorem to prove: the rotation that
diagonalises the neutral gauge boson mass matrix produces exactly one massless combination, and
the mixing angle is expressible through the ratio of the two gauge couplings. Both directions of
that relation are proved, because the literature uses each as the definition and the roadmap must
be usable with either.

### 0.4 The neutral-current couplings

The definition: for a fermion with weak isospin third component `T³` and electric charge `Q`, the
vector and axial neutral-current couplings
`g_V = T³ - 2 Q sin²θ_W` and `g_A = T³`,
in the normalisation stated in the docstring, defined as functions of `(T³, Q, sin²θ_W)`. The
chiral couplings `g_L` and `g_R` are defined as the corresponding combinations, and the theorems
`g_V = g_L + g_R` and `g_A = g_L - g_R` are proved.

The theorem to prove: the couplings of the existing definitions in
`EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.NeutralCurrent` agree with the values these
functions take at the quantum numbers of §0.2. This is the bridge that turns existing data into
derived results, and it is the reason Layer 0 exists rather than being assumed.

A second theorem to prove: the neutrino's electromagnetic coupling vanishes and its
neutral-current coupling does not, as a consequence of the assignments alone.

### 0.5 The four-fermion effective neutral-current interaction

At momentum transfer small compared with the `Z` mass, the `Z` exchange contracts to a
four-fermion interaction. The definition: the effective interaction with its coefficient
expressed through the couplings and the ratio of momentum transfer to the `Z` mass, together with
the error term whose order in that ratio is stated. The definitions of the parity-violating
combinations:
`C_{1q} = 2 g_A^e g_V^q` and `C_{2q} = 2 g_V^e g_A^q`,
with the factor convention stated. The theorem to prove: substituting §0.4 gives the Standard
Model expressions for `C_{1u}`, `C_{1d}`, `C_{2u}`, `C_{2d}` in terms of `sin²θ_W` alone, and the
combination `2 C_{1u} - C_{1d}` has the stated dependence. Convention 5 makes this a theorem and
not a definition.

### 0.6 The charged current and the mixing matrix

The definitions: the charged-current interaction with its chiral projector explicit; the quark
mixing matrix as an element of the unitary group of `3 × 3` complex matrices, using
`TauCeti.LinearAlgebra.Matrix.UnitaryGroup`. The theorems to prove: the row and column unitarity
relations, each as a statement about the matrix's entries derived from unitarity of the ambient
type; the count of physically independent parameters after phase redefinitions of the quark
fields, stated as the dimension of a quotient; and the invariance of the charged-current
interaction under those phase redefinitions combined with a compensating change of the matrix.

### 0.7 The coupling flow and the running mixing angle

The mixing angle is not a constant. The construction: a coupling vector in a stated scheme, and a
vector field on coupling space whose components are the one-loop beta functions of the
electroweak couplings, with the scheme recorded in the type. The flow is the solution of the
initial-value problem in the logarithm of the scale, obtained from `TauCeti.Analysis.ODE.Linear`
and `.GlobalSolution` for the linearised system and from `.InitialCondition` for well-posedness.

The theorems to prove: existence and uniqueness of the flow on an interval on which the couplings
stay in the domain where the one-loop truncation is stated to apply, with that domain an explicit
hypothesis; the derived flow equation for `sin²θ_W` as a function of the scale; smooth dependence
of the value at one scale on the value at another, from `TauCeti.Analysis.ODE.SmoothParameter`;
and a quantitative stability bound, via `Mathlib.Analysis.ODE.Gronwall`, that turns an uncertainty
on the angle at one scale into an uncertainty at another. The last of these is the precise content
of the statement that a measurement at one scale constrains the parameter at another only through
the running.

This layer names one thing honestly: the numerical values of the one-loop coefficients are inputs
to the construction, entered as named constants derived from the representation content of §0.1
by a computation this roadmap performs for the gauge-boson and fermion loops and *states as a
hypothesis* for the scalar loop, whose contribution requires the scalar sector's quartic coupling
that is not developed here. The hypothesis is labelled as such; it is not a milestone.

### Examples

- The Møller process from `EpsilonEridani.QFT.Scattering.DIS.PVES.Examples.Moller`: the
  parity-violating coupling combination for electron-electron scattering, with no hadronic input,
  computed from §0.4 and shown to be proportional to `1 - 4 sin²θ_W`.
- The charge assignments of the five multiplets of one generation, each as a closed computation.
- `C_{1u}` and `C_{1d}` as explicit functions of `sin²θ_W`, with the value of
  `2 C_{1u} - C_{1d}` exhibited.

### Dependencies

`EpsilonEridani.Particles.StandardModel.Fermions.LeptonDoubletExtensions`,
`.Fermions.DownSingletExtensions`, `.HiggsBoson.BasicExtensions`;
`EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.NeutralCurrent` and `.Electroweak.Parameters`;
`EpsilonEridani.Mathematics.LieAlgebra.SpecialUnitary`, `.StructureConstants`;
`EpsilonEridani.QFT.QCD.SU2Generators`; `EpsilonEridani.QFT.QCD.Renormalization` for the shape of
a scheme-tagged running parameter; `TauCeti.RepresentationTheory.ClassicalGroups.Torus`,
`.Weight.Basic`, `.Weight.Decomposition`, `.Restriction`, `.Standard`, `.Determinant`;
`TauCeti.LinearAlgebra.Matrix.UnitaryGroup`; `TauCeti.Analysis.ODE.Linear`, `.GlobalSolution`,
`.InitialCondition`, `.SmoothParameter`; `Mathlib.Algebra.Star.Unitary`,
`Mathlib.Algebra.Lie.Basic`, `Mathlib.Algebra.Lie.Classical`, `Mathlib.RepresentationTheory.Basic`,
`Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic`,
`Mathlib.Analysis.SpecialFunctions.Log.Basic`, `Mathlib.Analysis.Calculus.Deriv.Basic`,
`Mathlib.Analysis.ODE.Gronwall`, `Mathlib.LinearAlgebra.Matrix.Determinant.Basic`.

---

## Layer 1: electroweak deep-inelastic cross sections and their helicity structure

References: Yellow Report §7.5.1; Gonderinger and Ramsey-Musolf (2010) for the electroweak
deep-inelastic observables at a lepton-ion collider.

### 1.1 The neutral-current cross section with three terms

The construction: the neutral-current cross section for lepton-nucleon scattering as a sum of a
pure-photon term, a photon-`Z` interference term and a pure-`Z` term, each written as a product of
a propagator factor, a coupling factor from Layer 0, and a contraction of the leptonic tensor with
the hadronic tensor of `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`. The separation is by
propagator and coupling structure, not by size.

The theorems to prove: the three terms are the only ones, given the two exchanged currents; the
pure-photon term reproduces the existing electromagnetic cross section of
`EpsilonEridani.QFT.Scattering.DIS.CrossSection` exactly, with no residual factor; and the
interference term is odd under reversal of the beam helicity while the pure-photon term is even.
The last is the structural origin of the parity-violating asymmetry and is proved here rather than
in Layer 2, because it is a statement about the cross section and not about the asymmetry.

### 1.2 Structure-function content of the electroweak terms

Each of the three terms contracts the leptonic tensor with a hadronic tensor whose decomposition
is supplied by `InclusiveStructureFunctions`. The definitions: the coefficients with which the
transverse, longitudinal and parity-odd structure functions enter each term, as explicit functions
of the inelasticity and the kinematic invariants, obtained from the leptonic tensor traces using
`EpsilonEridani.Relativity.CliffordAlgebraExtensions`.

The theorem to prove: the parity-odd structure function enters with a coefficient proportional to
the axial coupling and therefore appears only in the interference and pure-`Z` terms. This makes
precise the claim that one structure function is produced by electroweak exchange alone; the
function's definition and its parton content are `InclusiveStructureFunctions`'s.

### 1.3 The charged-current cross section

The definition: the charged-current cross section with the `W` propagator factor, the mixing-matrix
elements of §0.6 and the chiral projector explicit. The theorems to prove: the cross section
depends on the mixing matrix only through the moduli of its entries at this order, stated exactly;
and the flavour selection rule, that a given beam charge and a given final-state lepton charge
select a specific set of initial-state quark flavours, stated as an equality of index sets rather
than as a description.

### 1.4 The charged-current helicity theorem

The result: for a massless left-handed charged current, the cross section for one beam helicity
vanishes identically. The proof is from the chiral projection: the projector annihilates the
opposite-chirality spinor, using
`EpsilonEridani.Relativity.Fermions.Weyl.LeftHandedExtensions`,
`.Weyl.RightHandedExtensions` and `.Weyl.ContractionExtensions`. The hypotheses are named: the
lepton mass is neglected, and the current is purely left-handed, which is the Standard Model
structure and is *not* true once the dimension-six operators of Layer 3 are switched on. The
corresponding statement with a right-handed admixture is proved in Layer 4 and is one of the
sharpest signatures there.

### 1.5 Helicity decomposition of the neutral current

The definition: the neutral-current cross section as a sum over the four combinations of lepton
and quark chirality, with the coefficient of each given by the chiral couplings of §0.4. The
theorem to prove: the sum over chiralities reproduces §1.1, and the helicity-odd part is exactly
the interference plus pure-`Z` odd piece of §1.1. This gives two independent routes to the same
cross section, which is the check that the coupling bookkeeping is right.

### Examples

- The electromagnetic limit: setting the `Z` coupling to zero recovers the existing
  one-photon-exchange cross section, as an equality of functions.
- The charged-current cross section for a positron beam and for an electron beam, with the two
  flavour index sets exhibited and shown to be disjoint in the relevant channel.
- The vanishing charged-current beam-helicity combination, exhibited as a closed statement.

### Dependencies

Layer 0. `EpsilonEridani.QFT.Scattering.DIS.Basic`, `.CrossSection`, `.Kinematics.Basic`,
`.Kinematics.Bounds`, `.Tensors.Basic`, `.Tensors.Longitudinal`;
`EpsilonEridani.QFT.Scattering.DIS.PVES.Interference.Basic`, `.PVES.Processes.EP`;
`EpsilonEridani.Relativity.CliffordAlgebraExtensions`,
`EpsilonEridani.Relativity.Fermions.Weyl.LeftHandedExtensions`, `.Weyl.RightHandedExtensions`,
`.Weyl.ContractionExtensions`; `Mathlib.LinearAlgebra.Matrix.Trace`. The structure-function
decomposition is `InclusiveStructureFunctions`; the parity-odd function's parton content is taken
from there and is not restated.

---

## Layer 2: parity-violating asymmetries

References: Yellow Report §7.5.1; Prescott et al. (1978) for the original measurement; Cahn and
Gilman (1978) for the deuteron asymmetry; the Jefferson Lab parity-violating deep-inelastic
measurement (2014); Boughezal, Petriello and Wiegand (2020) for the collider case.

### 2.1 The single-spin parity-violating asymmetry

The definition: with the sign convention of Convention 4, the asymmetry as the ratio of the
beam-helicity difference to the sum of the cross sections of Layer 1. The theorems to prove: the
pure-photon term cancels from the numerator exactly, by §1.1; the asymmetry is therefore
proportional to the ratio of the momentum transfer to the `Z` mass squared at leading order in
that ratio, with the proportionality function given explicitly; and the asymmetry is independent
of the overall luminosity normalisation, which is the reason it is the observable of choice and is
a theorem about the definition.

### 2.2 The asymmetry in terms of structure functions and couplings

The result: the asymmetry written as a ratio whose numerator and denominator are each linear
combinations of structure functions with coefficients built from the couplings of Layer 0 and the
kinematic factors of §1.2. Two forms are proved equal: the structure-function form, valid without
a parton-model assumption, and the parton-model form obtained by substituting the leading-order
factorisation of `EpsilonEridani.QFT.Factorization.DIS.LO`. Keeping both, and proving they agree
under the stated factorisation hypothesis, is what makes the parton-model form usable without
smuggling in its assumptions.

### 2.3 Flavour combinations selected by each asymmetry

The definition: for each asymmetry — proton target, deuteron target, and the charged-current
asymmetries — the linear functional on the space of quark density combinations that its numerator
computes. The theorem to prove: these functionals are linearly independent as functionals on the
four-dimensional space spanned by the up and down quark and antiquark combinations, with the rank
computed via `Mathlib.LinearAlgebra.Matrix.Rank`. This is the statement that the asymmetry set
carries independent flavour information, and it is the Layer 2 instance of the rank reasoning that
Layer 4 uses for coefficient space.

### 2.4 The deuteron asymmetry and its reduced structure dependence

The central result of the layer. For a target whose quark content is the isoscalar combination of
a free proton and a free neutron, the asymmetry reduces to a form in which the leading dependence
on the parton densities cancels between numerator and denominator, leaving a function of the
kinematics and the couplings alone, plus a correction whose size is controlled by an explicitly
named ratio of density combinations.

The statement to prove, with hypotheses named: assuming isospin symmetry of the free-nucleon
densities, neglecting strange and heavier quark contributions, and treating the deuteron as a free
isoscalar target, the deuteron asymmetry equals a stated function of the inelasticity and the
couplings `C_{1u}`, `C_{1d}`, `C_{2u}`, `C_{2d}`, times the momentum transfer, plus a remainder
term expressed through the ratio of the sea-quark and strange combinations to the valence
combination. The remainder is exhibited, not dropped: the theorem gives the exact asymmetry with
the remainder as a named quantity, and the reduced form is the statement that the remainder
vanishes when the named ratios do.

Three hypotheses are separated deliberately. Isospin symmetry of the densities is a property of
`InclusiveStructureFunctions`'s objects, imported as a hypothesis. Neglect of heavier flavours is
a truncation, with the neglected term exhibited. Treatment of the deuteron as free is a nuclear
approximation whose correction belongs to `LightNuclei`; this roadmap states it as a hypothesis
with a named correction slot and does not estimate it. This is what makes the deuteron the target
of choice for a coupling measurement: not that the hadronic structure is absent, but that its
residual dependence is isolated in terms whose smallness is a separate, checkable statement.

### 2.5 Double-spin asymmetries

The definitions: the cross sections with both beam and target polarised, from
`EpsilonEridani.QFT.Scattering.DIS.Polarized.Basic`; the four polarisation-state cross sections;
and the two independent asymmetries obtained from them. The theorem to prove: the combination of
the four cross sections that is odd under beam-helicity reversal and even under target-spin
reversal isolates the parity-violating piece, and the complementary combination is
parity-conserving. Both combinations are exhibited explicitly, and the theorem is an equality of
functions, not an argument about which terms are small.

The polarised densities entering these asymmetries are `SpinStructure`'s; this layer states which
of them appear and with which coupling factors.

### 2.6 Charged-current asymmetries and the beam-charge combination

The definitions: the charged-current cross-section asymmetries formed from beam helicity and from
beam charge. The theorem to prove: the beam-charge asymmetry in the charged current isolates a
flavour combination distinct from all the neutral-current functionals of §2.3, which extends the
rank statement there by one.

### Examples

- The proton asymmetry at leading order in the valence-only approximation, exhibited as a closed
  function of the inelasticity and `sin²θ_W`.
- The deuteron asymmetry in the same approximation, with the density-dependence cancellation
  exhibited term by term and the remainder displayed.
- The rank of the functional matrix of §2.3, computed.
- The four-cross-section combination of §2.5, exhibited.

### Dependencies

Layers 0 and 1. `EpsilonEridani.QFT.Scattering.DIS.PVES.Basic`, `.PVES.Examples.Basic`,
`.Polarized.Basic`; `EpsilonEridani.QFT.Factorization.DIS.LO`, `.DIS.HardKernel`;
`EpsilonEridani.Particles.Parton.PDF.Basic`; `Mathlib.LinearAlgebra.Matrix.Rank`. Structure
functions from `InclusiveStructureFunctions`; polarised densities from `SpinStructure`; density
evolution and the running strong coupling from `CollinearEvolution`; the nuclear correction slot
of §2.4 from `LightNuclei`; the radiative corrections the asymmetry requires from
`RadiativeCorrections`, specified in Layer 5.

---

## Layer 3: the dimension-six operator basis

References: Yellow Report §7.5.1 and §7.5.7; Weinberg (1979) for the effective-Lagrangian logic;
Buchmüller and Wyler (1986); Politzer (1980) and Arzt (1995) for equation-of-motion redundancy;
Grzadkowski, Iskrzyński, Misiak and Rosiek (2010) for the independent dimension-six basis.

### 3.1 The effective Lagrangian and its grading

The construction: an operator space graded by mass dimension, presented as a free module over the
reals on an explicit index type of local operators built from the Standard Model fields, with the
dimension a function on the index type. The effective Lagrangian is the Standard Model Lagrangian
plus a sum over operators of dimension greater than four, each with a coefficient and a power of
the suppression scale fixed by its dimension, in the normalisation of Convention 8.

The theorem to prove: with a dimension bound, the set of operators of dimension at most that bound
is finite, and its cardinality is computed for the sector relevant here. A finiteness statement
that can be proved is worth more than a list that cannot be checked.

### 3.2 The operators contributing to lepton-quark scattering

The definition: the subset of dimension-six operators whose insertion into a two-lepton
two-quark amplitude is non-zero at tree level. This comprises the four-fermion operators with two
lepton and two quark fields in each chirality assignment, and the operators that modify the
fermion-gauge-boson vertices. Both classes are enumerated explicitly on the index type, with the
chirality structure of each recorded as data.

The theorem to prove: the enumeration is exhaustive, in the sense that any dimension-six operator
outside it contributes zero to the tree-level two-lepton two-quark amplitude. The proof is a
field-content argument on the index type, and it is the statement that makes the basis usable: a
bound derived from an enumeration that might be incomplete is not a bound.

### 3.3 Redundancy: equations of motion and field redefinitions

The problem: the enumeration of §3.2 is not independent. Some operators are equal, on shell, to
combinations of others plus terms of higher dimension, because the free equations of motion relate
a derivative-of-field-strength structure to a fermion bilinear. Others are removable by a field
redefinition that shifts a field by a higher-dimension local expression.

The construction: the submodule of the operator space generated by the equation-of-motion
relations, each written explicitly as an element of the operator module; the quotient of the
operator space by that submodule; and the theorem that a field redefinition induces a map on the
operator space whose effect modulo the submodule is the identity, so that the quotient is the
correct invariant object. The redundancy relations are applied explicitly: the roadmap asks for
each relation as a proved identity in the operator module, not for a citation.

The theorems to prove: the quotient's dimension, computed via
`TauCeti.LinearAlgebra.Dimension.DirectSum`; that a stated list of operators is a basis of the
quotient, by exhibiting the change-of-basis matrix from the naive enumeration and computing its
rank with `Mathlib.LinearAlgebra.Matrix.Rank`; and that two operators in the naive enumeration
that differ by an equation-of-motion relation give the same contribution to every observable of
Layer 2, which is the physical content of the redundancy and is the statement that a reader can
check.

### 3.4 Basis independence as a functoriality statement

The result: a change of basis of the quotient is an invertible linear map on coefficient space,
and every observable of Layer 2 is a linear functional on the quotient that is therefore
basis-independent as a functional while its coordinate expression is not. Stated with
`TauCeti.LinearAlgebra.Dual.Lemmas`. Convention 6's trap is closed by this theorem: a coefficient
vector is a set of coordinates, and only the functional is physical.

### 3.5 Running of the coefficients

The coefficients depend on the scale. The construction: the anomalous-dimension matrix on the
quotient as a linear map, and the coefficient flow as the solution of the resulting linear
initial-value problem, from `TauCeti.Analysis.ODE.Linear` and `.GlobalSolution`.

The theorems to prove: the flow is well-posed and global on the interval where the couplings stay
in the stated domain; the flow commutes with a change of basis, so that the anomalous-dimension
matrix transforms by conjugation; and the composition of the coefficient flow with the observable
functional gives the scale at which a measured bound applies, stated exactly.

The matrix elements of the anomalous-dimension matrix are inputs. The roadmap asks for the
QCD-induced entries, which follow from the strong coupling and the colour factors of
`EpsilonEridani.QFT.QCD.RepresentationColor`, to be derived; the electroweak-induced entries are
named as a hypothesis, entered as constants with their source stated, because deriving them
requires the full one-loop electroweak renormalisation that this roadmap does not build. This is
labelled a hypothesis and is not a milestone.

### Examples

- The count of independent four-fermion lepton-quark operators for one lepton and one quark
  generation, computed from the quotient.
- One explicit equation-of-motion relation, written as an element of the operator module, together
  with the proof that the two operators it relates give equal contributions to the proton
  asymmetry of Layer 2.
- The change-of-basis matrix between the naive enumeration of §3.2 and the basis of §3.3, with its
  rank exhibited.

### Dependencies

Layers 0 and 2. `EpsilonEridani.Particles.StandardModel.Fermions.LeptonDoubletExtensions`,
`.Fermions.DownSingletExtensions`, `.HiggsBoson.BasicExtensions`;
`EpsilonEridani.QFT.QCD.RepresentationColor`;
`TauCeti.LinearAlgebra.Dimension.DirectSum`, `TauCeti.LinearAlgebra.Dual.Lemmas`;
`TauCeti.Analysis.ODE.Linear`, `.GlobalSolution`; `Mathlib.LinearAlgebra.Matrix.Rank`,
`Mathlib.LinearAlgebra.Matrix.NonsingularInverse`. The operator space and the quotient are built
here; the absence of any upstream operator-basis machinery is recorded above.

---

## Layer 4: constraint geometry, blind directions, and flavour

References: Yellow Report §7.5.1; Boughezal, Petriello and Wiegand (2020); Boughezal, Huang and
Petriello (2022) for lepton flavour violation at a lepton-ion collider; Erler and Ramsey-Musolf
(2005) for the weak charge constraints.

### 4.1 The coefficient-to-observable map

The construction: for a finite set of observables from Layer 2, each evaluated at a specified
kinematic point, the linear map from the coefficient quotient of Layer 3 to the vector of
first-order shifts in those observables. Linearity is a consequence of the interference-only
truncation of Convention 7 and is proved, not assumed; the quadratic case is a separate
construction in §4.4.

The definition of the map's matrix in a chosen basis of the quotient and a chosen ordering of the
observables, with the entries given by the Layer 2 formulae differentiated with respect to the
coefficients.

### 4.2 Blind directions as a kernel

The definition: a blind direction for an observable set is a non-zero element of the kernel of the
map of §4.1. Per Convention 11, the observable set is an argument.

The theorems to prove: the kernel's dimension equals the quotient's dimension minus the map's
rank, with the rank computed via `Mathlib.LinearAlgebra.Matrix.Rank` in the finite case and the
statement recast through `TauCeti.Analysis.Fredholm.FiniteRank` and `.ClosedRange` in the form
that survives an observable set indexed by a continuum of kinematic points; the constrained
combinations are exactly the range of the adjoint map, from `TauCeti.Analysis.Fredholm.Adjoint`;
and monotonicity, that enlarging the observable set can only shrink the kernel, with the inclusion
proved. Monotonicity is what makes a blindness statement an honest statement about an experiment
rather than a claim about nature.

A further theorem: for a one-parameter family of observable sets — for instance, adding kinematic
points along a line in the plane of momentum transfer and momentum fraction — the kernel dimension
is upper semicontinuous in the parameter, stated through
`TauCeti.Analysis.Fredholm.Parametric` and `.Criteria`. This is the precise form of the statement
that a blind direction can be lifted by widening the kinematic coverage, and it identifies the
coverage at which the lifting happens.

### 4.3 Conditioning of the constrained directions

Not every non-blind direction is usefully constrained. The construction: the singular-value
decomposition of the map's matrix, from `TauCeti.Analysis.Matrix.Spectrum`, and the definition of a
direction's conditioning as its component along the singular vectors.

The theorems to prove: a lower bound on the smallest singular value in terms of the kinematic
coverage, for the explicit observable sets of the examples; and the statement that a direction
whose singular value is below a stated threshold is constrained only at a correspondingly degraded
level, given as a quantitative inequality relating the observable uncertainty to the coefficient
uncertainty. As recorded above, TauCeti has no theory of ill-posedness or of regularisation, so
every statement here is about the concrete finite matrix and its singular values, which is
sufficient and is all that is claimed.

### 4.4 The quadratic truncation

The construction: the second-order map, a quadratic form on coefficient space, for the truncation
that retains the square of a dimension-six insertion. The theorem to prove: the first-order map's
kernel need not be a blind direction of the quadratic prediction, and the condition under which it
is — namely that the direction also lies in the radical of the quadratic form — is stated and
proved. This is the formal content of Convention 7's insistence that two truncations are different
objects.

### 4.5 Lepton flavour violation

The definitions: the subset of Layer 3's operators whose lepton flavour indices differ; the
resulting cross section with a final-state lepton of a flavour different from the beam. The
theorems to prove: such operators do not interfere with the Standard Model amplitude, because the
final states differ, so their leading contribution is quadratic in the coefficient — a theorem
about the amplitude's flavour structure, and the reason the flavour-violating constraint scales
differently with the coefficient than every other constraint in this layer; and the kinematic
signature, namely that the final-state lepton's transverse momentum and the reconstructed momentum
transfer satisfy a relation distinct from that of the flavour-conserving channel with a misidentified
lepton, stated as an inequality on the reconstructed invariants using
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.AccessMethods` and `.Kinematics.Bounds`.

### 4.6 Flavour non-universality with flavour conserved

The definitions: the ratio observables formed from asymmetries with different beam lepton flavours
on the same target. The theorems to prove: the hadronic structure functions cancel from such a
ratio at leading order in the same sense as in §2.4, with the remainder exhibited; and the map from
the flavour-non-universal coefficient combinations to the ratio observables, with its kernel
computed, which is the §4.2 analysis restricted to the flavour-non-universal subspace.

### 4.7 The right-handed charged current

The result: a dimension-six operator with a right-handed quark current lifts the vanishing of the
charged-current beam-helicity combination proved in §1.4. The theorem to prove: the previously
vanishing cross section is, to first order in the coefficient, proportional to that coefficient
with an explicitly computed proportionality function, so that the observable is a null test whose
Standard Model prediction is exactly zero within the hypotheses of §1.4. Stating which hypotheses
of §1.4 must hold for the null test to be a null test — in particular the neglect of the lepton
mass — is part of the theorem.

### Examples

- For the observable set consisting of the proton and deuteron single-spin asymmetries at a single
  kinematic point, the map's matrix and its kernel, computed.
- The same with charged-current asymmetries added, exhibiting a strictly smaller kernel and
  thereby instantiating the monotonicity theorem.
- A direction in the kernel of the first-order map that is not in the radical of the quadratic
  form, exhibited, instantiating §4.4.
- The null-test observable of §4.7, with its Standard Model value exhibited as zero and its
  first-order coefficient dependence exhibited.

### Dependencies

Layers 1, 2 and 3. `EpsilonEridani.QFT.Scattering.DIS.Kinematics.AccessMethods`,
`.Kinematics.Bounds`; `EpsilonEridani.QFT.Scattering.DIS.Inference.Identifiability` for the shape
of the rank statement; `TauCeti.Analysis.Fredholm.FiniteRank`, `.ClosedRange`, `.Adjoint`,
`.Criteria`, `.Parametric`; `TauCeti.Analysis.Matrix.Spectrum`;
`Mathlib.LinearAlgebra.Matrix.Rank`, `Mathlib.LinearAlgebra.Matrix.NonsingularInverse`.

---

## Layer 5: connections to neutrino, cosmic-ray and hadron-collider physics

References: Yellow Report §7.5.2, §7.5.3, §7.5.4 and §7.5.7; Gandhi, Quigg, Reno and Sarcevic
(1998) for neutrino-nucleon cross sections; Cooper-Sarkar, Mertsch and Sarkar (2011) for the
ultra-high-energy extrapolation; Engel, Heck and Pierog (2011) for air-shower development; Collins
(2002) for the sign reversal.

### 5.1 Neutrino-nucleon cross sections from the same densities

The construction: the charged- and neutral-current neutrino-nucleon cross sections, obtained from
Layer 1 by replacing the beam lepton with a neutrino, which changes the couplings of Layer 0 and
nothing else. The theorem to prove: the neutrino cross section is the Layer 1 cross section
evaluated at the neutrino's quantum numbers, an equality of functions rather than an analogy.

### 5.2 The kinematic region an ultra-high-energy cross section samples

The result that makes the connection quantitative. The construction: the cross section as an
integral over momentum fraction and momentum transfer with an explicit weight, and the definition
of the region that carries a stated fraction of the integral, as a sublevel set of the weight.

The theorems to prove: an upper bound on the contribution from outside a stated region, so that
the sensitivity claim is a bound and not a plot; and the scaling of the dominant momentum fraction
with the neutrino energy, derived from the propagator factor and the kinematic limits of
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds`. The consequence to state precisely: a
lepton-nucleon measurement covering a given region of momentum fraction and scale constrains the
neutrino cross section at energies for which the dominant region lies inside it, and constrains it
at higher energies only through the evolution supplied by `CollinearEvolution` and, where the
momentum fraction is small enough, the small-`x` behaviour that is `SmallXAndSaturation`'s. The
extrapolation is named as an extrapolation with its ingredient identified; it is not presented as
a measurement.

### 5.3 Cosmic-ray air showers

The construction: the shower observables that a cascade's development depends on — the
inelastic cross section, the multiplicity of the first interactions, and the inelasticity
distribution — each as a functional of the same densities and cross sections. The theorems to
prove: each functional's dependence is on a stated region of momentum fraction and scale, with
the bound of §5.2's form; and the region for the shower observables is disjoint from, or overlaps
in a stated way with, the region probed directly by lepton-nucleon scattering. Where the region is
outside the measured range, that is stated, and the extrapolation's ingredient is named.

The hadronic interaction models used in shower simulation are not formalised here and are not in
scope for any roadmap in this collection; what is in scope is the statement of which
field-theoretic input they consume and over which region.

### 5.4 Universality and the hadron-collider connection

The result: the precise sense in which a density extracted from lepton-nucleon scattering is
usable in a hadron-hadron prediction. The construction: the statement that the same density
appears in the factorisation formula for both processes, as a hypothesis with named ingredients —
the factorisation theorem for each process, the scheme in which the density is defined, the scale
range, and the order in the strong coupling to which the statement is made.

The theorem to prove: given factorisation for both processes in a common scheme, the density
appearing in each is the same object, so that a hadron-hadron cross section is a functional of the
density extracted from lepton-nucleon data, with the functional exhibited. The hypotheses are the
content: each is an explicit argument, and the roadmap states which of them is a theorem of
`CollinearEvolution` and `InclusiveStructureFunctions` and which is a hypothesis of this layer.
Universality is a hypothesis with a domain, per Convention 14, and it is not dressed as a
milestone that can be discharged by this roadmap alone.

A second theorem: a change of scheme acts on the density and on the hard function in compensating
ways, so that the hadron-hadron prediction is scheme-independent to the stated order. The
compensation is exhibited; the residual scheme dependence at higher order is named.

### 5.5 The transverse-momentum sign-reversal test

The statement, placed here so that the cross-field test exists in one place. The
transverse-momentum-dependent function whose definition involves a gauge link enters
semi-inclusive lepton-nucleon scattering with a link of one orientation and the annihilation
process with a link of the opposite orientation.

The theorem to prove: under the factorisation hypotheses for the two processes, and with the
functions as defined in `EpsilonEridani.Particles.Parton.TMD.Basic`, the function appearing in one
process equals minus the function appearing in the other. The hypotheses are named:
factorisation for each process, the same scheme for the link, and the rapidity scale matched using
`EpsilonEridani.Particles.Parton.TMD.CollinsSoper`. The definitions of the functions and their
rapidity evolution are `TransverseMomentumDistributions`'s; what is proved here is the relation
between the two processes and the consequent experimental test, stated as a falsifiable equality
between two measured quantities.

### 5.6 The specification of required electroweak and radiative corrections

The construction: the record of corrections a precision asymmetry requires, as a structure whose
fields name each correction, its order, and the observable it corrects — the `γ`-`Z` box
contribution to the effective couplings, the QED radiative tail in the reconstructed kinematics,
and the electroweak vertex and propagator corrections that define the scheme of Layer 0's angle.

This layer specifies the interface and proves the consistency conditions the corrections must
satisfy to be usable: that the scheme in which a correction is computed matches the scheme tag of
the parameters it corrects, stated as an equality of scheme tags that is a hypothesis of every
theorem consuming a correction. The corrections themselves are `RadiativeCorrections`'s, and this
roadmap computes none of them. Making the scheme match a proof obligation rather than an editorial
convention is the point of the section.

### Examples

- The neutrino-nucleon charged-current cross section exhibited as the Layer 1 function at the
  neutrino's quantum numbers.
- For a stated neutrino energy, the momentum-fraction region carrying a stated fraction of the
  cross-section integral, computed with its bound.
- The hadron-hadron functional of §5.4 for one specific process, with every hypothesis of the
  universality statement listed as an explicit argument.
- The sign-reversal equality, stated as a relation between two observables.

### Dependencies

Layers 0, 1, 2 and 4. `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds`,
`.Kinematics.AccessMethods`; `EpsilonEridani.Particles.Parton.PDF.Basic`,
`.Parton.PDF.Positivity`; `EpsilonEridani.Particles.Parton.TMD.Basic`, `.TMD.CollinsSoper`;
`EpsilonEridani.QFT.Factorization.Basic`, `.Factorization.DIS.LO`,
`.Factorization.Evolution.QCDCore`; `EpsilonEridani.QFT.Scattering.DIS.Corrections.Basic` as the
interface point for the correction record. Density evolution from `CollinearEvolution`; small-`x`
behaviour from `SmallXAndSaturation`; the transverse-momentum-dependent function definitions from
`TransverseMomentumDistributions`; the corrections themselves from `RadiativeCorrections`; nuclear
targets from `NuclearPartonDistributions`.

---

## Dependency graph

```
                    Layer 0: gauge structure, couplings, running angle
                        |                                  |
                        v                                  |
        Layer 1: electroweak cross sections,                |
                 helicity structure                         |
                        |                                  |
                        v                                  |
             Layer 2: parity-violating asymmetries  <-------+
                        |
            +-----------+-----------+
            |                       |
            v                       v
  Layer 3: dimension-six    Layer 5: neutrino, cosmic-ray,
           operator basis            hadron-collider connections
            |                        (also uses Layer 4)
            v                                 ^
  Layer 4: constraint geometry,               |
           blind directions, flavour ---------+
```

Layer 0 is the root and depends only on upstream material. Layer 1 rests on Layer 0. Layer 2 rests
on Layers 0 and 1 and additionally consumes Layer 0's running angle directly, because the
asymmetry is quoted at a scale. Layer 3 rests on Layer 0 for the Standard Model fields and on
Layer 2 for the observables its operators must be tested against. Layer 4 rests on Layers 2 and 3.
Layer 5 rests on Layers 1 and 2 for the cross sections and on Layer 4 for the constraint language,
and is the interface layer to the rest of the collection.

External dependencies, in the order in which they are first needed: `InclusiveStructureFunctions`
(Layer 1, structure-function decomposition and the parity-odd function), `SpinStructure` (Layer 2,
polarised densities), `CollinearEvolution` (Layer 2, density evolution and the running strong
coupling), `LightNuclei` (Layer 2, the deuteron nuclear correction slot), `RadiativeCorrections`
(Layer 5, the corrections specified in §5.6), `TransverseMomentumDistributions` (Layer 5, the
function definitions for §5.5), `SmallXAndSaturation` (Layer 5, small-`x` behaviour for the
extrapolation of §5.2), `NuclearPartonDistributions` (Layer 5, nuclear targets).

## Acceptance examples

The roadmap is complete when each of the following is a proved statement in the library, with no
`sorry` and with its hypotheses explicit.

1. The hypercharge assignments of one fermion generation are the unique solution, up to overall
   scale, of the anomaly-cancellation equations, and with them `Q = T³ + Y/2` gives the physical
   charges of all five multiplets.
2. The neutral-current couplings defined in
   `EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.NeutralCurrent` equal the values of the
   general coupling function of §0.4 at the quantum numbers derived in §0.2 — the existing data
   becomes a theorem.
3. The Møller parity-violating combination is proportional to `1 - 4 sin²θ_W`, computed from the
   general couplings with no hadronic input.
4. `C_{1u}`, `C_{1d}`, `C_{2u}` and `C_{2d}` have their Standard Model expressions in `sin²θ_W`,
   proved from Layer 0 rather than defined.
5. The electroweak neutral-current cross section has exactly three terms, its pure-photon term is
   equal as a function to the existing one-photon-exchange cross section, and its interference
   term is odd under beam-helicity reversal.
6. The parity-odd structure function's coefficient is proportional to the axial coupling and
   therefore vanishes in the pure-photon term.
7. For a massless purely left-handed charged current, one beam-helicity cross section is
   identically zero, proved from the chiral projection.
8. The proton, deuteron and charged-current asymmetry functionals are linearly independent on the
   space of light-quark density combinations, with the rank computed.
9. The deuteron asymmetry equals the stated function of the inelasticity and the `C` coefficients
   plus an exhibited remainder, and the remainder vanishes under the three named hypotheses.
10. The four-cross-section combination of §2.5 isolates the parity-violating piece, as an equality
    of functions.
11. The set of dimension-six operators contributing to the tree-level two-lepton two-quark
    amplitude is finite, its cardinality is computed, and any dimension-six operator outside it
    contributes zero.
12. A stated list of operators is a basis of the quotient of the operator space by the
    equation-of-motion submodule, proved by exhibiting the change-of-basis matrix and computing its
    rank; and two operators differing by an equation-of-motion relation give equal contributions to
    the proton asymmetry.
13. Every Layer 2 observable is a basis-independent linear functional on that quotient.
14. For the observable set of proton and deuteron asymmetries at one kinematic point, the kernel of
    the coefficient-to-observable map is computed; adding the charged-current asymmetries yields a
    strictly smaller kernel, instantiating the monotonicity theorem.
15. The constrained combinations are exactly the range of the adjoint map.
16. A direction in the kernel of the first-order map that is not in the radical of the quadratic
    form is exhibited, showing that the two truncations have different blind directions.
17. Lepton-flavour-violating operators do not interfere with the Standard Model amplitude, so their
    leading contribution is quadratic in the coefficient, proved from the flavour structure of the
    final state.
18. A right-handed quark current makes the §1.4 null observable non-zero at first order in its
    coefficient, with the proportionality function computed.
19. The neutrino-nucleon cross section equals the Layer 1 cross section at the neutrino's quantum
    numbers, as an equality of functions.
20. For a stated neutrino energy, the contribution to the cross section from outside a stated
    momentum-fraction and scale region is bounded by a computed quantity.
21. Given factorisation for both processes in a common scheme, the density in a hadron-hadron
    prediction is the same object as the one extracted from lepton-nucleon data, with every
    hypothesis an explicit argument and the hadron-hadron functional exhibited.
22. The transverse-momentum sign-reversal relation holds under its named hypotheses, stated as an
    equality between two measured quantities.
23. Every theorem consuming a radiative correction carries the scheme-tag equality of §5.6 as a
    hypothesis, so that a scheme mismatch is a type-level failure rather than a numerical one.

Two statements in this roadmap are labelled hypotheses and are deliberately *not* acceptance
criteria: the scalar-loop contribution to the electroweak beta functions in §0.7, and the
electroweak-induced entries of the anomalous-dimension matrix in §3.5. Each is entered as a named
constant with its source stated, and each theorem that uses it carries it as an explicit
hypothesis. They are open with respect to this roadmap; discharging them requires the one-loop
electroweak renormalisation programme, which no area in this collection owns.

## References

- A. Accardi et al., *Science Requirements and Detector Concepts for the Electron-Ion Collider:
  EIC Yellow Report*, Nucl. Phys. A 1026 (2022) 122447, arXiv:2103.05419. Volume II, Chapter 7,
  §7.5.1 (electroweak and BSM physics), §7.5.2 (neutrino physics), §7.5.3 (cosmic-ray and
  astroparticle physics), §7.5.4 (connections to p+p, p+A, A+A), §7.5.7 (interface to high-energy
  physics efforts).
- Particle Data Group, *Review of Particle Physics*, review article "Electroweak model and
  constraints on new physics". The source for the scheme definitions of the mixing angle and for
  the coupling conventions of §0.4 and §0.5.
- S. Weinberg, *Phenomenological Lagrangians*, Physica A 96 (1979) 327. The effective-Lagrangian
  logic of §3.1.
- W. Buchmüller and D. Wyler, *Effective Lagrangian analysis of new interactions and flavour
  conservation*, Nucl. Phys. B 268 (1986) 621. The first systematic dimension-six analysis.
- H. D. Politzer, *Power corrections at short distances*, Nucl. Phys. B 172 (1980) 349. Operator
  redundancy through the equations of motion.
- C. Arzt, *Reduced effective Lagrangians*, Phys. Lett. B 342 (1995) 189, arXiv:hep-ph/9304230.
  Field redefinitions versus equations of motion; the basis for §3.3's functoriality statement.
- B. Grzadkowski, M. Iskrzyński, M. Misiak and J. Rosiek, *Dimension-six terms in the Standard
  Model Lagrangian*, JHEP 10 (2010) 085, arXiv:1008.4884. The independent dimension-six basis of
  §3.3.
- R. N. Cahn and F. J. Gilman, *Polarized-electron-nucleon scattering in gauge theories of weak and
  electromagnetic interactions*, Phys. Rev. D 17 (1978) 1313. The deuteron asymmetry of §2.4.
- C. Y. Prescott et al., *Parity non-conservation in inelastic electron scattering*, Phys. Lett. B
  77 (1978) 347. The first measurement of the asymmetry of §2.1.
- D. Wang et al., *Measurement of parity violation in electron-quark scattering*, Nature 506 (2014)
  67. The precision deuteron measurement.
- J. Erler, A. Kurylov and M. J. Ramsey-Musolf, *Weak charge of the proton and new physics*, Phys.
  Rev. D 68 (2003) 016006, arXiv:hep-ph/0302149. The running of the mixing angle of §0.7.
- J. Erler and M. J. Ramsey-Musolf, *The weak mixing angle at low energies*, Phys. Rev. D 72 (2005)
  073003, arXiv:hep-ph/0409169.
- M. Gonderinger and M. J. Ramsey-Musolf, *Electron-to-tau lepton flavor violation at the
  electron-ion collider*, JHEP 11 (2010) 045, arXiv:1006.5063. Electroweak and
  flavour-violating observables in lepton-ion scattering.
- R. Boughezal, F. Petriello and D. Wiegand, *Removing flat directions in Standard Model effective
  field theory fits: how polarized electron-ion collider data can complement the LHC*, Phys. Rev. D
  101 (2020) 116002, arXiv:2004.00748. The blind-direction analysis of §4.2.
- R. Boughezal, H. Huang and F. Petriello, *Exploring the SMEFT at dimension eight with Drell-Yan
  transverse momentum measurements*, and the companion lepton-ion collider analyses,
  arXiv:2207.01703. Truncation order and flavour structure, §4.4 and §4.5.
- R. Gandhi, C. Quigg, M. H. Reno and I. Sarcevic, *Neutrino interactions at ultrahigh energies*,
  Phys. Rev. D 58 (1998) 093009, arXiv:hep-ph/9807264. The cross sections of §5.1.
- A. Cooper-Sarkar, P. Mertsch and S. Sarkar, *The high energy neutrino cross-section in the
  Standard Model and its uncertainty*, JHEP 08 (2011) 042, arXiv:1106.3723. The extrapolation
  region of §5.2.
- R. Engel, D. Heck and T. Pierog, *Extensive air showers and hadronic interactions at high
  energy*, Ann. Rev. Nucl. Part. Sci. 61 (2011) 467. The shower observables of §5.3.
- J. C. Collins, D. E. Soper and G. Sterman, *Factorization of hard processes in QCD*, Adv. Ser.
  Direct. High Energy Phys. 5 (1989) 1, arXiv:hep-ph/0409313. The factorisation hypotheses named in
  §5.4.
- J. C. Collins, *Leading-twist single-transverse-spin asymmetries: Drell-Yan and deep-inelastic
  scattering*, Phys. Lett. B 536 (2002) 43, arXiv:hep-ph/0204004. The sign reversal of §5.5.

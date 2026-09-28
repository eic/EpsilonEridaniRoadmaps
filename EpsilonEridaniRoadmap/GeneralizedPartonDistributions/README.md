# Roadmap: generalized parton distributions and spatial imaging

Generalized parton distributions and the exclusive processes that measure them. These are the
objects that carry both a momentum fraction and a momentum transfer, so that their Fourier
transform in the transverse momentum transfer is a spatial density of partons at a given momentum
fraction — the sense in which the nucleon is imaged. The roadmap covers the distributions, their
formal properties, the amplitudes of the processes, and the inverse problem of recovering
distributions from amplitudes.

The forward parton densities are functions of one variable and integrate to charges. An off-forward
matrix element depends in addition on the momentum transfer, and that second dependence carries
position information: at vanishing skewness the two-dimensional Fourier transform of a distribution
in the transverse momentum transfer is a probability density in transverse position at fixed
momentum fraction. That is a theorem with hypotheses — support, reality, positivity, integrability —
and those hypotheses are exactly the formal constraints of the first two layers. Everything this
roadmap calls *imaging* is that one transform.

The final application is an honest account of what an exclusive measurement determines about the
distributions, in three separated parts. The forward part: the zeroth moments are the elastic form
factors and their slopes are the radii, so an exclusive programme subsumes elastic scattering. The
imaging part: at zero skewness, under stated hypotheses, the transverse density and its
momentum-fraction-dependent width are determined. The negative part: at fixed order the map from
distributions to measurable Compton form factors has non-trivial kernel, so distributions differing
by a kernel element are indistinguishable. Those elements are the shadow distributions, and posing
the recovery problem as a Fredholm problem is what turns "the inversion is ambiguous" into a
statement with a proof.

Elastic form factors are here, as the zeroth moments. Their energy-momentum-tensor counterparts are
`HadronMassAndEnergyMomentumTensor`. The phase-space distributions that reduce to these are
`WignerDistributions`.

## Scope

Included:

- The off-forward quark and gluon light-cone correlators for a spin-half target, and the
  decomposition of each into invariant functions of momentum fraction, skewness and momentum
  transfer: the four chiral-even quark distributions, the four chiral-odd (transversity) quark
  distributions, the gluon chiral-even pair, the gluon transversity distributions, and the reduced
  set for a spin-zero target.
- Support in momentum fraction and skewness, the boundary between the two kinematic regions, and
  the physical reading of each region.
- The forward limits, including the theorem that two of the chiral-even distributions have no
  forward limit at all, with the consequences of that asymmetry for what inclusive data constrain.
- Discrete symmetries: behaviour under reversal of the skewness, hermiticity, time reversal, and
  the charge-conjugation relation between negative and positive momentum fraction.
- Polynomiality of the Mellin moments in the skewness with the degree bound fixed by Lorentz
  invariance, extended from the existing proof to the full distribution set, together with the
  determinacy question in the converse direction.
- Positivity bounds in the region where they hold, with the hypotheses that produce them.
- The double-distribution representation, the D-term, and the identification of the D-term as the
  piece invisible to the forward limit.
- Zeroth moments as the Dirac, Pauli, axial and pseudoscalar elastic form factors; the Sachs basis;
  the charge and magnetic radii as slopes; the pion and kaon electromagnetic form factors and
  mesonic charge radius as the spin-zero case.
- Second moments as the gravitational form factors, cited rather than developed, and the Ji sum rule
  as the corollary giving quark total angular momentum.
- Impact-parameter densities: the zero-skewness transverse Fourier transform, the proof that the
  result is a real and non-negative density, and the transverse radius as a function of momentum
  fraction.
- Deeply virtual Compton scattering: kinematics, factorisation at leading order and with the
  next-to-leading-order hard kernel, and the Compton form factors as the resulting convolutions.
- The Bethe–Heitler process, its interference with the Compton amplitude, the azimuthal harmonic
  structure of the interference, which Compton form factor each harmonic isolates, and the
  beam-spin, target-spin and beam-charge asymmetries in those harmonics.
- Deeply virtual meson production, the extra convolution with the meson distribution amplitude, and
  the flavour selectivity that makes different final-state mesons probe different flavour
  combinations.
- Timelike Compton scattering and the relation of its amplitude to the spacelike case.
- The two-variable generalisation of the evolution kernel, the moment-space diagonalisation, and the
  consistency of the amplitude's scale independence with the evolution of the distributions.
- Dispersion relations for the Compton form factors: analyticity at fixed momentum transfer, the
  principal-value relation between real and imaginary parts, and the identification of the
  subtraction constant with the D-term.
- The deconvolution problem posed as a Fredholm problem: the forward operator with its domain and
  codomain, compactness, the kernel at leading order, shadow distributions as kernel elements, what
  changes at next-to-leading order, the identifiability that knowledge over a range of scales
  restores, and the ill-posedness and regularisation of inversion from bounded data.

Not included. The forward densities themselves — definitions, fits, sum rules — are
`InclusiveStructureFunctions`; this roadmap takes them as given and states limits *onto* them. The
splitting kernels, the Mellin moment machinery and the running coupling are `CollinearEvolution`;
the generalised kernel here is a two-variable extension of objects built there. The
energy-momentum-tensor form factors, the mass decomposition and the pressure and shear
distributions are `HadronMassAndEnergyMomentumTensor`; only the second-moment relation connecting
them to the distributions here is stated, as a citation. The decomposition of the nucleon spin and
the distinction between the Ji and Jaffe–Manohar decompositions are `SpinStructure`; this roadmap
proves the Ji sum rule as a moment identity and does not adjudicate the decomposition. Phase-space
distributions in both position and transverse momentum are `WignerDistributions`.
Transverse-momentum-dependent distributions, their rapidity evolution and their soft factors are
`TransverseMomentumDistributions`. Diffractive vector-meson production, the dipole amplitude and
saturation — including the small-skewness limit in which a distribution is replaced by a dipole
cross section — are `Diffraction` and `SmallXAndSaturation`. Nuclear and light-nuclear off-forward
distributions are `NuclearPartonDistributions` and `LightNuclei`, and nuclear-medium modification is
`NuclearMedium`. Real-photon initial states are `Photoproduction`; exclusive quarkonium channels are
`QuarkoniaAndExotics`; electroweak and beyond-Standard-Model exclusive channels are
`ElectroweakAndBSM`. Photon radiation from the lepton lines and the QED corrections dressing the
measured cross section are `RadiativeCorrections`; the Bethe–Heitler amplitude here is the Born-level
process, treated as signal rather than correction. Lattice determinations of moments and
quasi-distributions are `LatticeBridge`. Meson parton densities and meson distribution amplitudes
are `MesonStructure`; a distribution amplitude enters here as a convolution input and nothing is
proved about it. Higher-twist and multi-parton correlators beyond the twist-two correlators used
here are `MultiPartonCorrelations`. Final-state fragmentation is `Hadronization` and jet observables
are `JetsAndEventShapes`.

The distributions and their formal properties belong under `EpsilonEridani/Particles/Parton/GPD/`.
The amplitudes, the harmonic decomposition and the deconvolution operator belong under
`EpsilonEridani/QFT/Scattering/DIS/Exclusive/`. Statements about what data determine, including the
identifiability theorems of Layer 5, belong under `EpsilonEridani/QFT/Scattering/DIS/Inference/`.

## Conventions and coordination with upstream

1. **Symmetric variables.** The momentum fraction `x` and skewness `ξ` refer to the average momentum
   `P = (p + p')/2`, with `ξ = -Δ⁺/(2P⁺)` and `Δ = p' - p`. *Trap:* polynomiality is a statement in
   these variables; feeding an asymmetric-convention distribution into a symmetric-variable moment
   integral yields non-polynomial moments and no error message.
2. **Sign of the skewness.** With that definition `ξ ≥ 0` in the spacelike physical region. Every
   distribution's behaviour under `ξ ↦ -ξ` is proved, not assumed. *Trap:* the chiral-even quartet
   is even in `ξ` and the chiral-odd set is not uniformly so, so a blanket evenness assumption
   silently symmetrises a distribution with an odd part.
3. **Momentum transfer.** `t = Δ²` is non-positive throughout the spacelike region; where a positive
   quantity is wanted, `-t` is written. *Trap:* radii are slopes in `t` at `t = 0`, and a sign error
   flips a radius squared without making anything ill-typed.
4. **Distributions are data.** A distribution is a function carried as an explicit structure field,
   never a typeclass parameter; typeclasses carry only structural hypotheses such as a target's spin
   representation or a flavour index set. *Trap:* as a typeclass field it invites instance
   resolution to supply an unintended one, and makes "there exist two distributions with the same
   forward limit" unstateable.
5. **No propositional fields with placeholder witnesses.** Structures carry data; support,
   polynomiality, positivity and reality are separate predicates, each either proved or named in
   prose as a gap. *Trap:* a `Prop`-valued field satisfied by a trivial witness looks like a
   hypothesis and asserts nothing. This project's own audit found the pattern hiding obligations
   across the library, and it is prohibited here.
6. **Naming.** Chiral-even: `gpdH`, `gpdE`, `gpdHtilde`, `gpdEtilde`. Chiral-odd: `gpdHT`, `gpdET`,
   `gpdHTtilde`, `gpdETtilde`. Gluon distributions carry a `gluon` prefix; Compton form factors are
   `cffH`, `cffE`, `cffHtilde`, `cffEtilde`. *Trap:* single-letter names collide with everything,
   and `H` in particular with Hamiltonians, Hilbert spaces and hadronic tensors.
7. **Flavour is explicit.** Every quark distribution carries a flavour index from the library's
   flavour type; there is no implicit sum, and the charge-conjugation-even and -odd combinations are
   defined once as named operations on the indexed family. *Trap:* the singlet combination mixes with
   the gluon under evolution and the non-singlet does not, so an implicit sum makes the mixing
   pattern unstateable.
8. **Gluon normalisation.** The gluon chiral-even distributions carry the explicit factor of the
   momentum fraction, so their forward limit is `x g(x)`; the alternative is named at the definition.
   *Trap:* the polynomiality degree bound differs by one between the two conventions.
9. **Correlator and gauge link.** The light-cone correlator is defined with an explicit straight
   Wilson line along the light-like direction; light-cone gauge is a separate named reduction in
   which the line becomes the identity. Staple-shaped links belong to
   `TransverseMomentumDistributions`. *Trap:* defining the correlator in light-cone gauge only makes
   every later statement gauge-dependent, invisibly, because the link never appears.
10. **Fourier convention.** The impact-parameter transform uses Mathlib's `fourierIntegral`
    convention, matching `TauCeti.Analysis.Bochner.Fourier.Convention`; the transverse transfer is
    `Δ⊥` with `t = -Δ⊥²`. *Trap:* the density normalisation and the inversion theorem both depend on
    it, and a mismatch surfaces as a factor of `2π` in a radius.
11. **Compton form factors are complex.** A Compton form factor is a complex-valued function of
    skewness, momentum transfer and hard scale; its imaginary part is proportional to the
    distribution on the diagonal `x = ξ` and its real part is a principal-value integral. The `iε`
    prescription is written explicitly. *Trap:* the "GPD at the diagonal" statement is about the
    imaginary part only, and quoting it for the full form factor is the commonest error in the
    subject.
12. **Imaging means one thing.** "Imaging" is the zero-skewness impact-parameter transform of Layer
    2 and nothing else. *Trap:* at non-zero skewness the transform is not a density, and calling it
    an image asserts a positivity that is false.
13. **Evolution is a semigroup.** Scale evolution is a one-parameter semigroup with a generator,
    against TauCeti's semigroup and abstract Cauchy problem theory; existence and uniqueness are
    instances of the upstream theorems and are not reproved. *Trap:* `TauCeti.Analysis.PDE` is
    elliptic theory only and does not apply to an evolution equation.
14. **The inverse problem is an operator statement.** Every claim about what data determine is a
    statement about a specified operator between specified spaces: its kernel, its range, or the
    continuity of its inverse. *Trap:* non-uniqueness and ill-posedness are different failures — a
    non-trivial kernel and a non-closed range — and one informal word covers both and distinguishes
    neither.

## Existing upstream material used by the roadmap

- `EpsilonEridani.Particles.Parton.GPD.Basic` — the distribution carriers and off-forward variables;
  Layer 0 extends them to the chiral-odd and gluon sets.
- `EpsilonEridani.Particles.Parton.GPD.Moments` — the Mellin moment machinery Layer 2 builds on.
- `EpsilonEridani.Particles.Parton.GPD.Polynomiality` — the existing proof; Layer 1.5 cites it and
  extends the statement rather than reproving the core case.
- `EpsilonEridani.Particles.Parton.GPD.DoubleDistribution` — the double-distribution carrier, to
  which Layer 1.7 adds the D-term and the transform between representations.
- `EpsilonEridani.Particles.Parton.GPD.Ambiguity` — the representation ambiguity, cited by Layers 1.7
  and 5.2; keeping an ambiguity of *representation* apart from a non-uniqueness of *reconstruction*
  is a scope obligation of this roadmap.
- `EpsilonEridani.Particles.Parton.PDF.Basic` — the forward densities appearing as limits.
- `EpsilonEridani.Particles.Parton.PDF.Positivity`, `.PDF.MsbarPositivity` — the forward positivity
  statements and the scheme caveat; Layer 1.6 follows their shape and inherits the caveat.
- `EpsilonEridani.Particles.Parton.Unified.Basic`, `.Unified.Consistency` — the reduction relations
  between distribution families, in which the forward limits of Layer 1.3 are stated so that they
  compose with the reductions `WignerDistributions` states.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic` — exclusive kinematics.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Amplitudes.Basic`, `.Exclusive.Convolution.Basic` —
  the amplitude carriers and the hard-kernel convolution, which is the shape factorisation produces.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVCS.Basic`, `.DVCS.Interference` — the Compton
  amplitude and its interference with the Bethe–Heitler process.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Basic`, `.DVMP.Channels` — meson production and
  the channel decomposition carrying the flavour selectivity.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Basic`, `.Deconvolution.Uniqueness` —
  the deconvolution map and existing uniqueness material, recast in Layer 5 as a Fredholm statement.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Basic`, `.Identifiability`, `.Helicity`,
  `.JointHelicity`, `.ExclusiveJoint`, `.Gluon`, `.Unfolding` — the inference vocabulary in which
  Layer 5's identifiability theorems are stated.
- `EpsilonEridani.QFT.Scattering.DIS.Inference.Conjectures` — the home for the statements this
  roadmap labels conjectures, so they are visibly separated from the theorems.
- `EpsilonEridani.QFT.Factorization.Basic`, `.Convolution.Basic`, `.Convolution.Collinear`,
  `.Convolution.Mellin`, `.Convolution.Properties` — factorisation and convolution infrastructure,
  including the Mellin-space form used in Layer 4.2.
- `EpsilonEridani.QFT.Factorization.DIS.HardKernel`, `.DIS.DiagrammaticHardKernel` — hard-kernel
  carriers, extended in Layer 3.2 to the off-forward kernel with its `iε` prescription.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.CollinearForm`, `.MomentSpace`,
  `.Consistency`, `.QCDCore`, `.Solutions`, and `.Scales.Basic` — the evolution apparatus and scale
  bookkeeping reused in Layer 4.
- `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics` — harmonic-decomposition
  vocabulary, reused for the azimuthal harmonics of Layer 3.5.
- `EpsilonEridani.Mathematics.OrderedSimplexIntegral` — integration over an ordered simplex, exactly
  the domain of the double-distribution representation, so Layer 1.7 builds no domain of its own.
- `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` — positive semidefiniteness, the form
  the positivity bounds of Layer 1.6 take.
- `EpsilonEridani.Mathematics.Distribution.BasicExtensions` — distribution-theoretic extensions for
  the singular hard kernel.
- `EpsilonEridani.Relativity.Fermions.Weyl.*` and
  `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions` — the spinor bilinears and
  metric conventions of the Layer 0 decompositions.
- `TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank`, `.CompactPerturbation`, `.ClosedRange`,
  `.Index`, `.Adjoint` — the whole of Layer 5. Non-uniqueness is a statement about the kernel of a
  Fredholm operator, shadow distributions are its elements, and failure of the range to be closed is
  the ill-posedness.
- `TauCeti.Analysis.Normed.Operator.Compact.Basic`, `.Compact.RieszTheory` — compactness of the
  leading-order convolution operator and the Riesz spectral structure that follows.
- `TauCeti.Analysis.Contour.PerWindow.CPV`,
  `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` — Cauchy principal values, for the real part
  of a Compton form factor and for the dispersion relation of Layer 4.5.
- `TauCeti.Analysis.Contour.Cauchy.IntegralFormula` — the formula from which the dispersion relation
  follows by contour deformation.
- `TauCeti.Analysis.Complex.Herglotz` — boundary behaviour of a function analytic off a cut with
  definite-sign imaginary part, the structural statement behind a once-subtracted representation.
- `TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.CauchyProblem.Basic`,
  `.CauchyProblem.Uniqueness` — evolution as a one-parameter semigroup, with existence and
  uniqueness inherited.
- `TauCeti.Analysis.PositiveDefinite.AddGroup`,
  `TauCeti.Analysis.Bochner.CharFun.PositiveDefinite` — positive-definiteness on an additive group,
  the hypothesis making the Layer 2.5 transform a non-negative density.
- `TauCeti.Analysis.Bochner.Fourier.Convention`, `.Fourier.Nonneg` — the pinned Fourier convention
  and non-negativity of the transform of a positive-definite function.
- `TauCeti.Analysis.Fourier.Decay`, `TauCeti.Analysis.Fourier.RiemannLebesgue` — decay of the
  transform, converting an integrability hypothesis into continuity of the transverse density.
- `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` — the smoothness class of the source condition in
  Layer 5.6.
- `TauCeti.Analysis.Sobolev.Mollification`,
  `TauCeti.MeasureTheory.Function.Lp.MollificationBridge` — the construction of the approximate
  inverse in Layer 5.6.
- `TauCeti.Analysis.InnerProductSpace.Spectrum`, `TauCeti.Analysis.Matrix.Spectrum` — spectral
  decomposition, for the singular-value analysis of the forward operator.
- `TauCeti.Analysis.SpecialFunctions.Beta`, `.SpecialFunctions.Gamma` — the normalisation integrals
  of the double-distribution profile functions and of the Layer 4.2 polynomial family.
- `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`, `.Stieltjes.Inversion`,
  `.Stieltjes.Uniqueness` — moment and spectral representations with their inversion and uniqueness
  statements, used for the determinacy question of Layer 1.5.
- `TauCeti.Probability.Moments.Basic` — moment vocabulary for the transverse density of Layer 2.6.
- `TauCeti.RepresentationTheory.ClassicalGroups.*` — the target spin representations of Layer 0.
- Mathlib: `Analysis.Fourier.FourierTransform` and `Analysis.Fourier.Inversion` for the
  impact-parameter transform and its inversion; `MeasureTheory.Function.L2Space` for the Layer 5
  spaces; `Analysis.InnerProductSpace.Adjoint` for the adjoint of the forward operator;
  `Analysis.Distribution.SchwartzSpace` for the test-function class of the singular kernel;
  `Analysis.SpecialFunctions.Gamma.Basic`; `Algebra.Polynomial.Basic` for the degree statement in
  polynomiality; `Analysis.Convex.Basic` for the double-distribution domain.

Genuine absences, and what the roadmap does instead:

- ⚠ **Bessel functions are absent from both Mathlib and TauCeti.** The usual presentation of the
  impact-parameter transform of an axially symmetric function is a zeroth-order Hankel transform.
  Layer 2.5 uses none: the transform is a genuine two-dimensional Fourier transform via
  `Analysis.Fourier.FourierTransform`, and the axially symmetric reduction is a separate lemma about
  the angular integral, built here in the shape Mathlib would want for a Hankel transform.
- ⚠ **No Hankel or Radon transform exists upstream.** The map from a double distribution to a
  generalized parton distribution is a Radon-type transform along a line in the simplex. Layer 1.7
  defines it directly over `EpsilonEridani.Mathematics.OrderedSimplexIntegral` as a named transform
  with its own inversion statement, rather than invoking a general theory that does not exist.
- ⚠ **Harmonic sums and polylogarithms are absent from both libraries**, so the
  next-to-leading-order hard kernel is not available in closed form. Layer 3.2 carries it as an
  abstract distributional kernel characterised by the properties Layers 4.3 and 5.4 use — support,
  order of the diagonal singularity, renormalisation-group consistency, conformal triangularity —
  and says plainly that no closed form is available here. The leading-order kernel is explicit.
- ⚠ **TauCeti has no notion of ill-posedness and no Tikhonov regularisation.** Layer 5.6 builds the
  statement from what exists: the forward operator is compact and of infinite rank, so its range is
  not closed (`TauCeti.Analysis.Fredholm.ClosedRange`, `.FiniteRank`) and its inverse on the range
  is unbounded. Regularisation is constructed here by mollification, with the error estimate under
  an explicit source condition in a Sobolev class.
- ⚠ **TauCeti has no moment problem.** Layer 1.5 needs the converse of polynomiality: what a
  sequence of polynomial moments determines. The Stieltjes inversion and uniqueness material is the
  closest upstream analogue and is used where it applies; the determinacy statement specific to
  finite support and fixed polynomial degree is built here in that shape.
- ⚠ **EpsilonEridani has no GPD positivity module**, though it has `PDF.Positivity` and
  `PDF.MsbarPositivity`. Layer 1.6 builds the off-forward bounds under
  `EpsilonEridani/Particles/Parton/GPD/`, following those modules and inheriting their caveat: the
  bounds concern a physically defined density and are not preserved verbatim by a
  minimal-subtraction redefinition.
- ⚠ **There is no light-cone wave-function formalism upstream.** Layer 1.6 therefore states the
  positivity bounds in the form that does not need one — positive semidefiniteness of a matrix of
  helicity amplitudes over `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` — and names
  the overlap representation as the physical origin of the bound, not a step in the proof.
- ⚠ **Gegenbauer and Jacobi polynomials are absent from both libraries.** Layer 4.2 needs the
  polynomial family that diagonalises the leading-order off-forward kernel, so it defines that family
  by its three-term recurrence and proves the orthogonality relation directly, in the shape of
  `TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.HilbertBasis`.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the invariant
  product, `Physlib.Relativity.Tensors.MetricTensor` and
  `Physlib.Relativity.Tensors.Contraction.Basic` for index contraction, and
  `Physlib.Relativity.LorentzGroup.Basic` for the covariance group, with
  `Physlib.Relativity.Fermions.Dirac.GammaMatrices` for the vector and tensor Dirac structures
  that separate `H`, `E`, `H̃` and `Ẽ`.

## Layer 0: off-forward correlators and the distribution set

References: Müller, Robaschik, Geyer, Dittes and Hořejši 1994; Ji 1997a; Radyushkin 1997; Diehl
2003, sections 2–3; Belitsky and Radyushkin 2005, section 3.

### 0.1 Off-forward kinematics

The kinematic variables: hadron momenta `p` and `p'`, their average `P`, the transfer `Δ = p' - p`,
the invariant `t = Δ²`, the skewness `ξ`, the momentum fraction `x`, and the hard scale. Define the
carrier structure and prove the identities among them, in particular the minimal momentum transfer
`t₀(ξ)` at fixed skewness with `t ≤ t₀(ξ) ≤ 0`, and prove that the physical domain is non-empty and
is the set the later layers integrate over. The minimal transfer is not a technicality: it is why
the impact-parameter transform is clean only at zero skewness, and Layer 2.5 depends on it.

### 0.2 The light-cone correlator and its gauge link

The bilocal quark operator at light-like separation with an explicit straight Wilson line, and its
matrix element between states of momenta `p` and `p'`. State the light-cone gauge reduction, in
which the line is the identity, as a named lemma with the gauge condition as hypothesis rather than
as the definition. Prove that the matrix element is a function of `(x, ξ, t)` and the hard scale
only, that its dependence on the light-like direction is the normalisation fixed by convention 1,
and that exchanging `p` and `p'` conjugates it.

### 0.3 The chiral-even decomposition

Decompose the vector and axial-vector correlators into `gpdH`, `gpdE`, `gpdHtilde`, `gpdEtilde`,
each defined as the coefficient of its Dirac structure with the target spinor bilinears written out.
Prove: the decomposition exists for every correlator of the stated form; it is unique, the Dirac
structures being linearly independent on the physical spinor space, which needs the mass-shell
conditions as hypotheses; and the invariant functions are real in the region where the matrix
element is a distribution in `x` — stated with that hypothesis, since it fails in the amplitude
region.

### 0.4 The chiral-odd decomposition

The same programme for the tensor correlator, yielding `gpdHT`, `gpdET`, `gpdHTtilde`, `gpdETtilde`
with existence and uniqueness proved the same way. The theorem that distinguishes the set: the
tensor structures do not mix with the vector and axial-vector structures under any Lorentz
transformation, so the chiral-odd set evolves independently — proved here as a decoupling of the
decomposition, and used in Layer 4.1 as a block structure of the generator.

### 0.5 Gluon distributions

The gluon field-strength correlator, its decomposition into the chiral-even pair and the gluon
transversity pair, and the normalisation of convention 8. Prove the symmetry under `x ↦ -x` that
follows from the bosonic nature of the operator, and its consequence for which Mellin moments are
non-zero. Define the mixing pattern with the flavour-singlet quark combination; the kernel itself is
`CollinearEvolution` and its two-variable extension is Layer 4.1.

### 0.6 Spin-zero targets

The reduced set: one chiral-even and one chiral-odd distribution per flavour, obtained by
specialising the decomposition. Prove that the specialisation is the vanishing of the structures
requiring a target spin, so the spin-zero case is a corollary of Layer 0.3 rather than a parallel
development. This is the case in which the pion and kaon form factors of Layer 2.3 live.

### Examples

- A free quark target: every invariant function is a delta function supported at `x = ±ξ` or
  `x = 1`, computed explicitly. This is the smoke test for the sign and normalisation conventions.
- A spin-zero target in a scalar model with a single Yukawa coupling, whose chiral-even distribution
  is an explicit rational function of `x` and `ξ`. It is reused in every later layer: it satisfies
  polynomiality non-trivially, has a computable impact-parameter density, and is the base point for
  the shadow-distribution construction.
- The gluon distribution of that model at lowest non-vanishing order, exhibiting the `x ↦ -x`
  symmetry of Layer 0.5.

### Dependencies

`EpsilonEridani.Particles.Parton.GPD.Basic`, `.Particles.Parton.Basic` for the flavour structure,
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic`,
`EpsilonEridani.Relativity.Fermions.Weyl.*`,
`EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions`,
`TauCeti.RepresentationTheory.ClassicalGroups.*`.

---

## Layer 1: support, symmetry and the formal constraints

References: Diehl 2003, sections 3–4; Ji 1998; Radyushkin 1999; Polyakov and Weiss 1999; Pobylitsa
2002; Diehl and Ivanov 2007.

### 1.1 Support in the momentum fraction and the skewness

Prove that every invariant function of Layer 0 is supported in `|x| ≤ 1` with `|ξ| ≤ 1`. The
hypotheses: on-shell states with positive light-cone momentum, and a bilocal operator at light-like
separation; the proof is a spectral decomposition in the light-cone momentum of the intermediate
states. State it as a statement about the support of a measure, not a pointwise vanishing claim, so
that it survives the distributional definition of the correlator.

### 1.2 The two regions

Partition the support into `|x| > ξ` and `|x| < ξ`. Prove that in the first the correlator factorises
through a single-parton matrix element — the region in which the object is a *distribution*, the
analogue of a density — and in the second through a two-parton amplitude, where no density
interpretation is available. The theorem: the boundary `|x| = ξ` is where the light-cone momentum of
one parton leg changes sign. The physical meaning is stated once, here; later layers refer to this
subsection. It is why Layers 1.6 and 2.5 both carry a zero-skewness or `|x| > ξ` hypothesis.

### 1.3 Forward limits and the non-existence theorem

Prove that at `ξ = 0` and `t = 0`, `gpdH` and `gpdHtilde` equal the unpolarised and helicity
densities flavour by flavour, as identities in the reduction framework of
`EpsilonEridani.Particles.Parton.Unified.Basic`. Then prove the asymmetry: `gpdE` and `gpdEtilde`
multiply spinor structures vanishing in the forward limit, so the forward correlator carries no
information about them. The correct statement is a non-identifiability statement and is proved as
one: there exist two chiral-even quartets with identical forward limits and different `gpdE`. This
is the first appearance of the theme of Layer 5, and proving it here is deliberate. State also the
chiral-odd limits — `gpdHT` reduces to the transversity density, itself
`TransverseMomentumDistributions`' object at zero transverse momentum, taken as given.

### 1.4 Discrete symmetries

Prove for each distribution: behaviour under `ξ ↦ -ξ` from time reversal with hermiticity; reality
where it holds; and the charge-conjugation relation taking a quark distribution at negative momentum
fraction to an antiquark distribution at positive momentum fraction. Define the
charge-conjugation-even and -odd combinations once here, and prove that only the odd combination
enters the Compton form factors of Layer 3.3 at leading twist — a fact Layer 5.2 needs, since it
halves the information the data can carry.

### 1.5 Polynomiality

State polynomiality: the `n`-th Mellin moment in `x` at fixed `ξ` and `t` is a polynomial in `ξ` of
degree at most `n + 1` for `gpdH` and `gpdE` and at most `n` for `gpdHtilde` and `gpdEtilde`, with
parity fixed by Layer 1.4. Cite `EpsilonEridani.Particles.Parton.GPD.Polynomiality` for the existing
proof and extend the statement to the chiral-odd and gluon sets, whose degree bounds differ and must
be computed rather than guessed. The origin of the bound is Lorentz invariance: the moment is a form
factor of a local operator of definite spin, and the count of independent structures at that spin is
the bound. Prove the relation tying the leading `ξ` coefficients of `gpdH` and `gpdE` at each `n`,
which is the moment-space statement of the D-term.

The converse is the determinacy question. Prove that a distribution on `[-1, 1]` with all Mellin
moments known at fixed `ξ` and `t` is determined, in the shape of
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Uniqueness`, and state clearly that determinacy from
*finitely many* moments fails, with the explicit finite-dimensional family of counterexamples.

### 1.6 Positivity

State the bounds: in the region `|x| > ξ` a matrix of helicity amplitudes built from the
distributions is positive semidefinite, and the bounds on individual distributions are its principal
minors. The hypotheses are explicit: the matrix is built from a physically defined density, so the
bounds hold in a scheme where that density is positive, and the caveat of
`EpsilonEridani.Particles.Parton.PDF.MsbarPositivity` applies verbatim. Prove in full the
two-by-two minor bounding `|gpdH(x, ξ, t)|` by a geometric mean of forward densities at shifted
arguments, and the theorem that the bound degenerates as `|x| → ξ`. State that no bound is claimed
in `|x| < ξ`, referring to Layer 1.2 for why.

Carry the bound as positive semidefiniteness over
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` rather than as a list of inequalities:
that is the form in which it composes with Layer 2.5 and in which its degeneracy is visible.

### 1.7 Double distributions and the D-term

Define the double distribution on the ordered simplex over
`EpsilonEridani.Mathematics.OrderedSimplexIntegral`, and the Radon-type transform producing a
generalized parton distribution from it. Prove that the transform of any double distribution
satisfies polynomiality — the structural reason polynomiality holds — and the converse as far as it
goes: a distribution satisfying polynomiality admits a double-distribution representation together
with a D-term, the D-term being a function of one variable supported on `|α| ≤ 1` and entering only
in `|x| < ξ`.

Prove the two facts the rest of the roadmap uses. First, the D-term is invisible to the forward
limit: its contribution vanishes at `ξ = 0`, so no inclusive data constrain it. Second, it carries
the highest `ξ` coefficient of every moment, which is Layer 1.5 seen from the other side. Cite
`EpsilonEridani.Particles.Parton.GPD.Ambiguity` and state the distinction precisely: the double
distribution and D-term are not unique for a given distribution, and that non-uniqueness is a gauge
freedom of the representation with no physical content, whereas the non-uniqueness of Layer 5 is a
failure of the data to determine a physical object. Conflating them is a live error in the
literature; separating them is an obligation of this roadmap.

### Examples

- The scalar model: compute its moments and verify the degree bound, the parity and the highest
  coefficient.
- A factorised ansatz — forward density times a `t`-profile — with the proof that it violates
  polynomiality beyond the first moment unless the profile is constant. This is why polynomiality is
  a constraint and not an identity.
- An explicit D-term-only distribution: zero for `|x| > ξ`, non-zero for `|x| < ξ`, all forward
  limits vanishing, moments non-vanishing. It reappears in Layer 4.5 as the dispersion-relation
  subtraction constant and in Layer 5.3 as the prototype shadow distribution.
- The two-by-two positivity minor on the scalar model, checked to hold and checked to degenerate at
  the region boundary.

### Dependencies

Layer 0. `EpsilonEridani.Particles.Parton.GPD.Polynomiality`, `.GPD.DoubleDistribution`,
`.GPD.Ambiguity`, `.GPD.Moments`, `.PDF.Basic`, `.PDF.Positivity`, `.PDF.MsbarPositivity`,
`.Unified.Basic`; `EpsilonEridani.Mathematics.OrderedSimplexIntegral`,
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`;
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Uniqueness`, `.Stieltjes.Inversion`,
`.Stieltjes.Laplace`; `TauCeti.Analysis.SpecialFunctions.Beta`; Mathlib
`Algebra.Polynomial.Basic`, `Analysis.Convex.Basic`. Forward densities are
`InclusiveStructureFunctions`; the transversity density is `TransverseMomentumDistributions`.

---

## Layer 2: moments, form factors and impact-parameter densities

References: Ji 1997a; Burkardt 2000 and 2003; Diehl 2002; Perdrisat, Punjabi and Vanderhaeghen 2007;
Hyde and de Jager 2004.

### 2.1 Zeroth moments as elastic form factors

Prove from the Layer 0 definition, not by assertion, that the charge-weighted zeroth moment of
`gpdH` is the Dirac form factor `F₁(t)`, of `gpdE` the Pauli form factor `F₂(t)`, of `gpdHtilde` the
axial form factor `G_A(t)`, and of `gpdEtilde` the pseudoscalar form factor `G_P(t)`. The proof has
two steps, both theorems here: the moment converts the bilocal operator into the local current, and
the current matrix element decomposes into form factors — the latter proved for each of the four
currents. Prove the normalisations at `t = 0`: charge, anomalous magnetic moment, axial charge.
These fix the overall normalisation of the distributions and are the first acceptance test.

### 2.2 The Sachs basis and the radii

Define the Sachs electric and magnetic form factors, prove the invertible linear relation to the
Dirac and Pauli basis with its `t`-dependent coefficients, and prove that it degenerates nowhere in
the spacelike region. Define the charge and magnetic radii as slopes at `t = 0` with the sign
convention of convention 3 carried through, and prove each radius equals the second transverse
moment of the corresponding distribution — the bridge to Layer 2.5. State the differentiability
hypothesis at `t = 0`, and note that it is a hypothesis about the distribution, not free.

### 2.3 Meson form factors

Specialise Layers 2.1 and 2.2 to the spin-zero targets of Layer 0.6: the pion and kaon
electromagnetic form factors as zeroth moments of the single chiral-even spin-zero distribution, the
normalisation to the meson charge, and the mesonic charge radius as the slope. Prove what
distinguishes the spin-zero case: there is one electromagnetic form factor, not two, because the
Pauli structure requires a target spin. The meson's collinear densities and its distribution
amplitude are `MesonStructure`; what is proved here is the moment relation and the radius.

### 2.4 Second moments and the Ji sum rule

Prove that the second moments of `gpdH` and `gpdE` are the gravitational form factors `A(t)` and
`B(t)` of the quark energy-momentum tensor, citing `HadronMassAndEnergyMomentumTensor` for the form
factors themselves and for the mass and pressure decomposition. What is proved here is the moment
identity and its corollary, the Ji sum rule: quark total angular momentum is one half of
`A(0) + B(0)`. State it with its hypotheses — existence of the second moments, an integrability
assumption near `x = 0`, and a flavour sum matching the operator. The decomposition into orbital and
spin pieces, and the Ji versus Jaffe–Manohar distinction, are `SpinStructure`.

### 2.5 The impact-parameter transform

Define the transverse density as the two-dimensional Fourier transform of `gpdH(x, 0, -Δ⊥²)` in
`Δ⊥`, in the convention of convention 10, over Mathlib's `Analysis.Fourier.FourierTransform`. Prove
three theorems.

Reality: the density is real, because the zero-skewness distribution is even in `Δ⊥` by Layer 1.4
with transverse rotational invariance.

Non-negativity: if `Δ⊥ ↦ gpdH(x, 0, -Δ⊥²)` is positive definite as a function on the additive group
of the transverse plane, then `TauCeti.Analysis.PositiveDefinite.AddGroup` with
`TauCeti.Analysis.Bochner.Fourier.Nonneg` gives a non-negative transform. This licenses the word
"density", and it is why Layer 1.6 carries the bound in matrix form. The hypothesis is stated
honestly: positive definiteness in `Δ⊥` at fixed `x` is strictly stronger than the Layer 1.6
principal minors, and whether those minors imply it for all `|x| > 0` is a gap. What is proved is
the implication; positive definiteness itself is named as a hypothesis and the theorem is
conditional on it.

Regularity: under an integrability hypothesis in `Δ⊥` the density is continuous and decays, by
`TauCeti.Analysis.Fourier.RiemannLebesgue` and `TauCeti.Analysis.Fourier.Decay`, and the transform
is invertible by Mathlib's `Analysis.Fourier.Inversion`.

Prove the analogues for `gpdHtilde` — a polarised transverse density, real but not non-negative,
being a difference of densities — and for `gpdE`, whose transform is not a density but the
transverse-position distortion induced by target polarisation; prove that the `gpdE` transform
integrates to the anomalous magnetic moment, which is the normalisation check on the distortion.

The requirement `ξ = 0` is not cosmetic: prove that at non-zero skewness the initial and final
states have different light-cone momenta, so no common transverse frame makes the transform a
density. That is the content of convention 12.

### 2.6 The transverse radius as a function of the momentum fraction

Define the mean squared transverse radius at fixed momentum fraction as the second moment of the
Layer 2.5 density, and prove it equals minus four times the logarithmic slope of `gpdH(x, 0, t)` in
`t` at `t = 0`, with the differentiability hypothesis stated. Prove that integrating the density
over `x` with charge weights recovers the Layer 2.2 charge radius: the consistency theorem between
the two notions of size, and the acceptance test for the layer. Define the shrinkage rate as the
logarithmic derivative of the radius in `x`, and prove as a corollary of Layer 4.1 that scale
evolution changes it.

### Examples

- The scalar model: `F₁(t)` from the zeroth moment, the charge normalisation, the charge radius, and
  the transverse density in closed form.
- An exponential `t`-profile, giving a Gaussian transverse density and an explicit radius; used to
  check the factor of four in Layer 2.6 and the `2π` of convention 10.
- The pion as an instance of Layer 2.3, with a monopole profile giving an explicit charge radius.
- A distribution satisfying the Layer 1.6 minors but *not* positive definite in `Δ⊥`, whose
  transverse "density" goes negative. Constructing it is part of the layer, and it is why Layer 2.5's
  second theorem is conditional.

### Dependencies

Layers 0 and 1. `EpsilonEridani.Particles.Parton.GPD.Moments`, `.GPD.Basic`;
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`;
`TauCeti.Analysis.PositiveDefinite.AddGroup`, `TauCeti.Analysis.Bochner.CharFun.PositiveDefinite`,
`TauCeti.Analysis.Bochner.Fourier.Convention`, `.Fourier.Nonneg`,
`TauCeti.Analysis.Fourier.RiemannLebesgue`, `TauCeti.Analysis.Fourier.Decay`,
`TauCeti.Probability.Moments.Basic`; Mathlib `Analysis.Fourier.FourierTransform`,
`Analysis.Fourier.Inversion`. Gravitational form factors are
`HadronMassAndEnergyMomentumTensor`; the spin decomposition is `SpinStructure`; the meson
distribution amplitude is `MesonStructure`.

---

## Layer 3: exclusive amplitudes and their observables

References: Ji 1997b; Radyushkin 1997; Collins and Freund 1999; Collins, Frankfurt and Strikman
1997; Belitsky, Müller and Kirchner 2002; Belitsky and Müller 2010; Diehl, Gousset, Pire and Ralston
1997; Berger, Diehl and Pire 2002.

### 3.1 Kinematics of the exclusive processes

The five-fold differential kinematics of lepton–hadron scattering with a real photon in the final
state: virtuality, inelasticity, momentum transfer, skewness in terms of virtuality and invariant
mass, and the two azimuthal angles. Prove `ξ = x_B / (2 - x_B)` up to power corrections, with the
order of the corrections stated, and prove the Layer 0.1 bound `t ≤ t₀(ξ)` in these variables.
Define the angle between the lepton and hadron planes, fixing its sign, and state which convention
the Layer 3.5 harmonics use.

### 3.2 The factorisation theorem

State factorisation for deeply virtual Compton scattering: at large virtuality and fixed skewness
and momentum transfer, the amplitude is a convolution of a hard kernel with the distributions, up to
corrections of a stated power of the virtuality plus the twist-three and higher correlators, which
are `MultiPartonCorrelations`. State the hypotheses — the hard scale, fixed skewness, and the
treatment of target mass and momentum transfer as power-suppressed — and the order of neglected
terms. All-orders factorisation is a hard theorem: state plainly that what this roadmap proves is
the leading-order statement together with the structural consistency of Layer 4.3, and that
all-orders factorisation is imported as a hypothesis, not a milestone that can be discharged.

Define the leading-order hard kernel explicitly, with its `iε` prescription and the two terms from
the two photon attachments, as a distribution on test functions over
`EpsilonEridani.Mathematics.Distribution.BasicExtensions`, and prove that it is the sum of a
principal-value part and a delta-function part — the decomposition Layer 3.3 uses. Carry the
next-to-leading-order kernel abstractly, characterised by the properties later layers need, for the
reason given under Existing upstream material.

### 3.3 Compton form factors

Define each Compton form factor as the convolution of the hard kernel against the corresponding
charge-conjugation-odd combination of Layer 1.4, over
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Convolution.Basic`. Prove at leading order the two
statements of convention 11: the imaginary part is proportional to the distribution combination on
the diagonal `x = ξ`, and the real part is a principal-value integral over the support. Prove
convergence under a stated integrability hypothesis near the diagonal and near `x = 0`, and give the
counterexample showing the hypothesis is needed.

Prove the helicity decomposition: the amplitude has a photon-helicity-conserving part fed by the
twist-two distributions, power-suppressed helicity-flip parts, and a double-helicity-flip amplitude
fed by the gluon transversity distribution of Layer 0.5 with no quark twist-two counterpart. State
the count of independent Compton form factors at leading twist and prove it equals the count of
chiral-even distributions.

### 3.4 The Bethe–Heitler amplitude and the interference

Define the Bethe–Heitler amplitude — real-photon emission from the lepton lines with the hadron
described by the Layer 2.1 elastic form factors — and prove it is expressible in those form factors
alone, with no distribution dependence. That is what makes it a calculable part of the signal, and
why Layer 2.1 is a dependency of Layer 3.

Prove that the two amplitudes share a final state, so the cross section is the squared sum, and
decompose it into squared Compton, squared Bethe–Heitler and interference. Prove the interference is
linear in the Compton form factors, which is what makes it the useful observable — the squared
Compton term is quadratic and mixes them irreducibly — and prove the charge parity: the interference
is odd under lepton-charge reversal and the other two terms are even.

### 3.5 Azimuthal harmonics and which form factor each isolates

Prove that the interference, as a function of the Layer 3.1 azimuthal angle, is a finite Fourier
series, and compute its harmonic content: the constant, first and second harmonics at leading twist,
with the third appearing only through the gluon transversity amplitude. Prove the corresponding
statement for the squared Compton term, whose harmonic content is different and lower in order, so
that harmonic analysis separates the two. Establish the lepton-propagator factors multiplying the
harmonics and prove they are calculable functions of the Layer 3.1 kinematics.

The correspondence, for an unpolarised target and a longitudinally polarised beam at leading twist:

| harmonic | beam polarisation | Compton form factor combination isolated |
| --- | --- | --- |
| constant | unpolarised | real part of the charge-weighted combination of `cffH` and `cffE` |
| `cos φ` | unpolarised | real part of `cffH`, with an `cffE` admixture fixed by kinematics |
| `sin φ` | longitudinal | imaginary part of `cffH`, with the same admixture |
| `cos 2φ` | unpolarised | the twist-three and gluon-transversity contributions |
| `sin 2φ` | longitudinal | the twist-three contribution |

Each row is a theorem: that harmonic's coefficient equals that combination, with the kinematic
coefficient computed. The admixture coefficients are functions of skewness and momentum transfer and
computing them is part of the layer; saying a harmonic "measures" a form factor without the
admixture is the imprecision this subsection removes.

### 3.6 Asymmetries

Define the beam-spin asymmetry as the normalised difference over beam helicities, the target-spin
asymmetries for longitudinal and transverse polarisation, and the beam-charge asymmetry as the
normalised difference over lepton charge. Prove for each that it equals a ratio of Layer 3.5
harmonic coefficients, with the squared Bethe–Heitler term surviving in the denominator. Prove that
the beam-charge asymmetry isolates the interference exactly, by the Layer 3.4 charge parity, and
that the beam-spin asymmetry at leading twist is proportional to the imaginary part of `cffH`, hence
by Layer 3.3 to the distribution on the diagonal. That chain is the cleanest statement in the
roadmap of what a measurement determines pointwise, and it is the positive counterpart to Layer 5:
the diagonal is determined, and Layer 5.2 proves the diagonal is all that is determined at leading
order. Prove the transverse-target asymmetry statement giving access to `cffE`, which by Layer 1.3
is the only observable here constraining `gpdE`.

### 3.7 Deeply virtual meson production

State factorisation for longitudinally polarised vector-meson and pseudoscalar-meson production: a
double convolution of a hard kernel with a distribution and with the meson distribution amplitude,
the latter cited to `MesonStructure` and taken as given. State the hypotheses, including the
restriction to longitudinal polarisation, and state plainly that factorisation for transverse
polarisation is not available — an open problem, not a gap in this roadmap.

Prove the flavour selectivity: for each channel the flavour combination entering is determined by
the meson's quark content and the charge structure of the hard kernel. Prove the specific statements
— pseudoscalar production selects the axial-type distributions, vector production the vector-type —
and the linear-algebraic consequence that the accessible channels determine a specified subspace of
flavour space, which is the statement `Diffraction` and `NuclearPartonDistributions` refer to and do
not restate. Channel bookkeeping follows
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.DVMP.Channels`.

### 3.8 Timelike Compton scattering

Define the timelike process — real photon in, lepton pair out — its kinematics and its amplitude.
Prove the relation to the spacelike case: at leading order the hard kernels are related by a
specified analytic continuation in the photon virtuality together with complex conjugation, so the
leading-order Compton form factors are related. Prove that the relation *fails* at
next-to-leading order in a specified way, with the failure located in the analytic structure of the
kernel, and state what survives: the imaginary parts agree at leading order in the strong coupling
and the real parts do not. Define the timelike analogue of the interference, with the Bethe–Heitler
process replaced by its timelike counterpart, and the corresponding asymmetries.

### Examples

- The leading-order Compton form factor of the scalar-model distribution in closed form, real and
  imaginary parts separated and the principal value evaluated.
- The Bethe–Heitler cross section for a point-like target, as a check on the Layer 3.4 charge parity.
- The harmonic decomposition of the interference for the scalar model, with the `sin φ` coefficient
  checked against the imaginary part of the form factor, and the beam-spin asymmetry built from it.
- Pseudoscalar and vector channels on the same distribution set, selecting different flavour
  combinations explicitly.

### Dependencies

Layers 0, 1 and 2 — Layer 2.1 because the Bethe–Heitler amplitude needs the elastic form factors.
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Amplitudes.Basic`, `.Exclusive.Convolution.Basic`,
`.Exclusive.DVCS.Basic`, `.Exclusive.DVCS.Interference`, `.Exclusive.DVMP.Basic`,
`.Exclusive.DVMP.Channels`, `.Exclusive.Kinematics.Basic`;
`EpsilonEridani.QFT.Factorization.Basic`, `.DIS.HardKernel`, `.DIS.DiagrammaticHardKernel`,
`.Convolution.Basic`, `.Convolution.Collinear`, `.Convolution.Properties`, `.Scales.Basic`;
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics`;
`EpsilonEridani.Mathematics.Distribution.BasicExtensions`;
`TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic`; Mathlib
`Analysis.Distribution.SchwartzSpace`. The meson distribution amplitude is `MesonStructure`;
twist-three correlators are `MultiPartonCorrelations`; QED corrections to the measured cross section
are `RadiativeCorrections`.

---

## Layer 4: evolution and dispersion relations

References: Müller et al. 1994; Belitsky and Radyushkin 2005, section 4; Teryaev 2001; Anikin and
Teryaev 2003; Diehl and Ivanov 2007; Kumerički, Müller and Passek-Kumerički 2008.

### 4.1 The generalised kernel as a semigroup generator

Define the two-variable evolution kernel generalising the splitting kernel of `CollinearEvolution`,
acting on functions of `x` at fixed `ξ` and `t`. Prove that it reduces to the forward splitting
kernel at `ξ = 0` and to the meson-distribution-amplitude evolution kernel as `ξ → 1`; those two
limits fix its normalisation. Flavour and gluon block structure is inherited from
`CollinearEvolution`; the chiral-odd block decouples by Layer 0.4.

Construct the evolution as a one-parameter semigroup on a stated Banach space of distributions with
the kernel as generator, over `TauCeti.Analysis.Semigroups.Defs` and `.Generator`, and obtain
existence and uniqueness from `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and
`.CauchyProblem.Uniqueness`. Nothing about existence or uniqueness is reproved; the work is
verifying the generator hypotheses — dense definition, closedness, and the resolvent estimate. State
plainly that the resolvent estimate for the off-forward kernel on the chosen space is the
non-trivial step and where the proof effort lies.

Prove that polynomiality and support are preserved by the evolution. Preservation of the Layer 1.6
positivity in `|x| > ξ` is *not* claimed: it is named here as an open question, not a milestone.

### 4.2 Moment-space diagonalisation and the conformal basis

Prove that the Layer 1.5 moments diagonalise the evolution only partially: in the forward limit the
Mellin moments are eigenfunctions, while off-forward the conformal moments — moments against a
Gegenbauer-type polynomial family in `x/ξ` — diagonalise the leading-order kernel and the Mellin
moments do not. Since that family is absent upstream, define it here by its three-term recurrence
and prove the orthogonality relation on the relevant weighted space, using
`TauCeti.Analysis.SpecialFunctions.Beta` for the normalisation and
`TauCeti.Analysis.InnerProductSpace.Spectrum` for the diagonalisation. Prove that diagonalisation
fails at next-to-leading order, with the mixing stated as a property of the abstract kernel of Layer
3.2 — triangular in the conformal index — and prove that triangularity makes the evolution of each
conformal moment a closed finite system, which is what Layer 5.5 uses.

### 4.3 Scale independence of the amplitude

Prove the consistency theorem: the scale derivative of the Compton form factor vanishes to the order
at which hard kernel and evolution kernel are both known, the scale dependence of the kernel
cancelling against the evolution of the distribution. State it as a renormalisation-group statement
over `EpsilonEridani.QFT.Factorization.Evolution.Consistency`, prove it at leading order explicitly,
and state it at next-to-leading order as the defining property of the abstract kernel of Layer 3.2 —
which is where that abstraction earns its place: the higher-order kernel is characterised by
consistency rather than by a closed form.

### 4.4 Analyticity of the Compton form factor

Prove that the leading-order Compton form factor, as a function of `1/ξ` at fixed momentum transfer
and scale, extends to a function analytic off a cut, the cut located by Layer 1.1 and the `iε`
prescription of Layer 3.2. Prove the crossing property following from Layer 1.4, and prove the
asymptotic bound the Layer 4.5 contour argument needs, which requires an explicit integrability
hypothesis. Relate the structure to `TauCeti.Analysis.Complex.Herglotz`: under the positivity of
Layer 1.6 the form factor divided by the appropriate kinematic factor has definite-sign imaginary
part on the cut, which is the structural reason a once-subtracted representation is natural.

### 4.5 The dispersion relation and the subtraction constant

Prove the dispersion relation: the real part of a Compton form factor is the Cauchy principal value
of an integral of its imaginary part over the cut, plus a subtraction constant independent of the
skewness. The proof is contour deformation from
`TauCeti.Analysis.Contour.Cauchy.IntegralFormula` with the principal value from
`TauCeti.Analysis.Contour.PerWindow.CPV`, under the Layer 4.4 hypotheses.

Prove that the subtraction constant equals twice the D-term integral of Layer 1.7, with sign and
factor computed. This identity is the structural centre of the roadmap's account of what is
measurable: the imaginary part gives the distribution on the diagonal (Layer 3.3), the dispersion
relation gives the real part from it, and the only information the real part carries beyond the
imaginary part is one number per momentum transfer. Prove that statement in the form Layer 5 uses:
two distributions with the same diagonal and the same D-term integral have the same leading-order
Compton form factor at that momentum transfer and scale.

State the scope honestly. The relation holds at leading order under the Layer 4.4 hypotheses. At
next-to-leading order it acquires corrections whose form follows from the abstract kernel's analytic
structure; what is proved is the existence of a dispersion relation with a modified kernel, and the
closed form of the correction is named as a gap, unavailable here for the reason in Layer 3.2.

### 4.6 What the dispersion relation does not determine

Prove the negative corollary that sets up Layer 5: from the dispersion relation with Layer 3.3, the
leading-order Compton form factor at fixed momentum transfer and scale is a functional of the
diagonal values of the distribution together with one number. So the leading-order map factors
through a map onto that data, and any distribution difference vanishing on the diagonal with
vanishing D-term integral lies in the kernel. This is the construction principle for shadow
distributions, proved here rather than asserted in Layer 5.

### Examples

- Leading-order evolution of the scalar-model distribution over a finite scale interval in the
  conformal basis, with the `ξ = 0` limit checked against the forward evolution of
  `CollinearEvolution` and the `ξ → 1` limit against the distribution-amplitude kernel.
- The dispersion relation verified on the scalar-model form factor of Layer 3's examples: the
  principal-value integral of the computed imaginary part plus the computed D-term integral equals
  the computed real part.
- The D-term-only distribution: vanishing imaginary part, non-vanishing real part, exhibiting the
  subtraction constant in isolation.

### Dependencies

Layers 0, 1 and 3. `CollinearEvolution` for the forward splitting kernels, the moment machinery and
the running coupling. `EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.CollinearForm`,
`.MomentSpace`, `.Consistency`, `.QCDCore`, `.Solutions`; `TauCeti.Analysis.Semigroups.Defs`,
`.Generator`, `.CauchyProblem.Basic`, `.CauchyProblem.Uniqueness`;
`TauCeti.Analysis.Contour.Cauchy.IntegralFormula`, `TauCeti.Analysis.Contour.PerWindow.CPV`,
`TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic`, `TauCeti.Analysis.Complex.Herglotz`,
`TauCeti.Analysis.SpecialFunctions.Beta`, `TauCeti.Analysis.InnerProductSpace.Spectrum`.

---

## Layer 5: the deconvolution inverse problem

References: Kumerički 2019; Bertone, Dutrieux, Mezrag, Moutarde and Sznajder 2021; Dutrieux et al.
2021; Moutarde, Sznajder and Wagner 2019; Engl, Hanke and Neubauer 1996 for compact-operator
inversion, source conditions and convergence rates.

### 5.1 The forward map as a Fredholm problem

Fix the spaces. The domain is a weighted `L²` space of distributions in `x` on `[-1, 1]` at fixed
momentum transfer and scale, over Mathlib's `MeasureTheory.Function.L2Space`, with the weight
explicit — compactness depends on it — chosen so the Layer 3.3 integrability hypotheses hold on the
whole space. The codomain is an `L²` space of complex-valued functions of the skewness on the
accessible interval, bounded away from `0` and `1` by the kinematic reach: the "known on the
physically accessible set" of the problem statement.

Define the forward operator sending a distribution to its leading-order Compton form factor as a
function of the skewness. Prove it is linear and bounded, that it is compact — exhibiting it as a
norm limit of finite-rank operators over `TauCeti.Analysis.Fredholm.FiniteRank` with
`TauCeti.Analysis.Normed.Operator.Compact.Basic`, the needed estimate being the one making the
principal-value kernel Hilbert–Schmidt on the weighted space, which is the technical core of this
subsection — and that it is of infinite rank.

State the Fredholm structure. Being compact, it makes `1 - λK` Fredholm of index zero for every
scalar `λ`, by `TauCeti.Analysis.Fredholm.CompactPerturbation` and `.Fredholm.Criteria`, and the
Riesz theory of `TauCeti.Analysis.Normed.Operator.Compact.RieszTheory` applies. The operator itself
is *not* Fredholm, precisely because it is compact of infinite rank, and that is the correct
formulation of what goes wrong: `TauCeti.Analysis.Fredholm.ClosedRange` gives that its range is not
closed. Distinguish the two failures as convention 14 requires — a non-trivial kernel is
non-uniqueness, a non-closed range is ill-posedness, and this problem has both.

Define the adjoint over Mathlib's `Analysis.InnerProductSpace.Adjoint` and prove the orthogonal
decomposition of the domain into the kernel and the closure of the range of the adjoint, over
`TauCeti.Analysis.Fredholm.Adjoint`. That decomposition is what makes "the data determine the
component orthogonal to the kernel and nothing about the component in it" a theorem.

### 5.2 The leading-order obstruction

Prove the non-uniqueness theorem: the kernel of the leading-order forward operator is non-trivial.
The proof is the Layer 4.6 corollary made concrete — a distribution vanishing on the diagonal for
every accessible skewness with vanishing D-term integral lies in the kernel — together with the
construction of a non-zero such distribution satisfying Layer 1.1 support and Layer 1.5
polynomiality. Both constraints matter: a kernel element violating polynomiality is not a candidate
distribution and would make the theorem vacuous.

Prove what the data do determine at leading order: the diagonal values of the
charge-conjugation-odd combination on the accessible interval, and the D-term integral. Prove this
is exactly the quotient of the domain by the kernel, i.e. that the induced map on the quotient is
injective. That injectivity is the positive half of the result and is as important as the negative
half; without it the account of what is measured would be incomplete.

Cite `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Uniqueness` and
`EpsilonEridani.Particles.Parton.GPD.Ambiguity`, and prove the two are independent: a representation
ambiguity yields the same distribution and hence trivially the same form factor, whereas a kernel
element is a genuinely different distribution with the same form factor.

### 5.3 Shadow distributions

Define a shadow distribution as a non-zero kernel element of the Layer 5.1 operator satisfying
support, polynomiality and the discrete symmetries. Prove existence of a finite-dimensional space of
them by explicit construction, from the D-term-only distribution of Layer 1's examples and the
diagonal-vanishing family of Layer 5.2; prove the constructed family is linearly independent and
give its dimension as a function of the polynomiality degree truncation used.

State as a **conjecture**, not a theorem, that the kernel is infinite-dimensional: every known
construction yields a family growing without bound as the truncation is raised, but no proof for the
operator on the full weighted `L²` space is available here. File it in
`EpsilonEridani.QFT.Scattering.DIS.Inference.Conjectures`, with the constructed finite-dimensional
lower bound as the theorem beside it. Prove the structural statement that is available: the kernel
is closed and is the orthogonal complement of the closure of the range of the adjoint.

Prove the observable consequence: for each shadow distribution, which Layer 2 quantities it changes.
Specifically, that a shadow distribution can have non-zero zeroth moment, hence non-zero
impact-parameter density, while leaving every leading-order Compton form factor unchanged — so the
obstruction limits *imaging*, not merely reconstruction of an abstract function. Conversely,
identify the sub-family with vanishing zeroth and second moments, which elastic and gravitational
form factor data cannot exclude either.

### 5.4 What changes at next-to-leading order

Prove that the next-to-leading-order forward operator differs from the leading-order one by an
operator with a stated mapping property, so its kernel is a different subspace. The available
theorem: a leading-order shadow distribution generically has non-zero next-to-leading-order Compton
form factor, because the higher-order kernel does not factor through the diagonal. Prove it for the
constructed family of Layer 5.3 using only the abstract properties of Layer 3.2 — diagonal
singularity order and conformal triangularity — so no closed form is needed.

State what this does not buy. It does not restore injectivity: prove that a
next-to-leading-order shadow distribution can be constructed by the same method applied to the
next-to-leading-order operator, as a corollary of compactness and infinite rank. Name as a gap the
quantitative question — how much smaller the next-to-leading-order kernel is, in a stated norm —
which cannot be answered here without the closed form of the kernel.

### 5.5 Evolution and identifiability

Formulate the multi-scale problem: data are the Compton form factor as a function of skewness and
scale over a scale interval, and the forward operator is the composition of the Layer 4.1 evolution
semigroup with the Layer 5.1 map, into an `L²` space over the product of the two intervals.

Prove the identifiability theorem under explicit hypotheses: the distribution lies in the span of
finitely many conformal moments, a truncation as in Layer 5.3; the scale interval has non-empty
interior; and the evolution is the leading-order semigroup, whose conformal diagonalisation is Layer
4.2. The conclusion: the multi-scale operator is injective on that finite-dimensional subspace,
because the conformal moments evolve with distinct anomalous dimensions, so form factors known over
an interval of scales separate them — a Müntz-type argument on the distinct exponents, with the
linear independence of the distinct-exponent functions proved here. Prove sharpness: injectivity
fails when the scale interval is a single point, recovering Layer 5.2.

State clearly that the theorem is conditional on the truncation, and that whether multi-scale data
determine an untruncated distribution is an **open question**, not a milestone; file it in
`EpsilonEridani.QFT.Scattering.DIS.Inference.Conjectures` beside the Layer 5.3 conjecture. The
reason it is open is visible in the proof: the Müntz argument gives injectivity on any
finite-dimensional conformal subspace, but the anomalous dimensions accumulate, so the separation
degrades without bound and no uniform statement follows. That degradation is the subject of Layer
5.6.

Prove the joint-channel statement: adding meson-production data with the flavour selectivity of
Layer 3.7 enlarges the determined subspace by a specified amount, stated as an intersection of
kernels over channels, in `EpsilonEridani.QFT.Scattering.DIS.Inference.ExclusiveJoint`; and the
corresponding statement for the gluon-sensitive channels, in
`EpsilonEridani.QFT.Scattering.DIS.Inference.Gluon`.

### 5.6 Ill-posedness and regularisation

Prove ill-posedness. The Layer 5.1 operator is compact of infinite rank, so its range is not closed
and its inverse on the range is unbounded: there is a sequence of data perturbations tending to zero
in the codomain norm whose preimages do not. Prove it in that quantified form, exhibiting the
sequence from the singular-value decomposition given by
`TauCeti.Analysis.InnerProductSpace.Spectrum` applied to the self-adjoint operator `K*K`, and prove
the singular values tend to zero — which is where compactness is used. TauCeti has no notion of
ill-posedness, so the statement is built here as unboundedness of a specified operator, which needs
no new notion.

Construct a regularised inverse with its error estimate. Use mollification, over
`TauCeti.Analysis.Sobolev.Mollification` and
`TauCeti.MeasureTheory.Function.Lp.MollificationBridge`, defining a family of bounded approximate
inverses indexed by a regularisation parameter. Prove both halves of the estimate: the approximation
error tends to zero with the parameter, for data in the range; and the amplification of the data
error grows at a stated rate. Prove the convergence-rate theorem under a source condition — if the
true distribution lies in a Sobolev class of stated order, over
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, the parameter choice balancing the two halves gives an
error bound of a stated power of the noise level — and the negative companion: without a source
condition no rate is possible, stated as non-existence of a uniform modulus of continuity for the
inverse on the whole domain.

Prove finally the statement tying the layer to a measurement: data on a bounded region only — the
skewness interval of Layer 5.1, the scale interval of Layer 5.5 and a bounded momentum-transfer
interval — determine the distribution within an error controlled by the source-condition order and
the noise level, on the quotient by the kernel of Layer 5.2, and determine nothing about the kernel
component. A rate on the quotient and nothing on the kernel is the complete answer to the question
the roadmap opened with.

### Examples

- The leading-order operator restricted to the polynomial subspace of degree at most four, as an
  explicit finite matrix with its rank, kernel and singular values computed over
  `TauCeti.Analysis.Matrix.Spectrum`. This is the finite-dimensional model in which every statement
  of the layer is checkable by linear algebra, and the singular-value decay is the ill-posedness in
  miniature.
- An explicit shadow distribution in that subspace, with its Compton form factor verified to vanish
  identically on the accessible interval and its zeroth moment verified not to.
- The multi-scale operator on the same subspace over a two-point and then an interval scale set,
  exhibiting the failure and then the success of Layer 5.5 injectivity.
- The regularised inverse applied to noisy data generated from the scalar-model distribution, with
  the error compared to the Layer 5.6 rate.

### Dependencies

All earlier layers, and Layer 4 essentially: the dispersion relation of Layer 4.5 supplies the
structure making the kernel describable. `TauCeti.Analysis.Fredholm.Criteria`, `.FiniteRank`,
`.CompactPerturbation`, `.ClosedRange`, `.Index`, `.Adjoint`;
`TauCeti.Analysis.Normed.Operator.Compact.Basic`, `.Compact.RieszTheory`;
`TauCeti.Analysis.InnerProductSpace.Spectrum`, `TauCeti.Analysis.Matrix.Spectrum`;
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, `TauCeti.Analysis.Sobolev.Mollification`,
`TauCeti.MeasureTheory.Function.Lp.MollificationBridge`; Mathlib
`MeasureTheory.Function.L2Space`, `Analysis.InnerProductSpace.Adjoint`;
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Deconvolution.Basic`, `.Deconvolution.Uniqueness`;
`EpsilonEridani.QFT.Scattering.DIS.Inference.Basic`, `.Identifiability`, `.Helicity`,
`.JointHelicity`, `.ExclusiveJoint`, `.Gluon`, `.Unfolding`, `.Conjectures`.

---

## Dependency graph

```
Layer 0  off-forward correlators; chiral-even, chiral-odd and gluon decompositions;
         spin-zero targets
   |
   v
Layer 1  support, the two regions, forward limits, discrete symmetries, polynomiality,
         positivity, double distributions and the D-term
   |                                   |
   v                                   v
Layer 2  moments: elastic and         Layer 3  DVCS factorisation, Compton form factors,
         mesonic form factors,   -->           Bethe-Heitler interference, azimuthal
         radii, Ji sum rule,                   harmonics, asymmetries, DVMP, TCS
         impact-parameter                        |
         densities, x-dependent                  v
         transverse radius              Layer 4  generalised evolution as a semigroup,
                                                 conformal diagonalisation, scale
                                                 independence, analyticity, dispersion
                                                 relation and the D-term subtraction
                                                   |
                                                   v
                                        Layer 5  the Fredholm forward map, leading-order
                                                 non-uniqueness, shadow distributions,
                                                 next-to-leading order, multi-scale
                                                 identifiability, ill-posedness and
                                                 regularisation
```

Layer 3 depends on Layer 2.1 for the Bethe–Heitler amplitude as well as on Layers 0 and 1; Layer 4
depends on Layer 3 for the amplitude whose analyticity it establishes; Layer 5 depends on Layers 4.5
and 4.6 for the structure of the kernel and on Layers 4.1 and 4.2 for the multi-scale statement.

External dependencies enter at four places only. `CollinearEvolution` supplies the forward splitting
kernels, the Mellin moment apparatus and the running coupling, used at Layer 4.1.
`InclusiveStructureFunctions` supplies the forward densities appearing as limits at Layer 1.3 and as
bounds at Layer 1.6. `MesonStructure` supplies the meson distribution amplitude used as a
convolution input at Layer 3.7. `HadronMassAndEnergyMomentumTensor` supplies the gravitational form
factors cited at Layer 2.4, and `SpinStructure` receives the Ji sum rule proved there.

## Acceptance examples

The roadmap is certified by these statements. Each is checkable, and each fails loudly if a
convention is wrong.

1. For a free quark target, every chiral-even distribution computed from the Layer 0.2 correlator is
   a delta function supported where Layer 1.1 predicts, normalised by convention 1.
2. For the scalar model, the `n`-th Mellin moment of `gpdH` is a polynomial in `ξ` of degree exactly
   `n + 1` for odd `n`, with highest coefficient equal to the corresponding D-term moment.
3. The factorised ansatz violates polynomiality at the second moment, with the violation exhibited.
4. The zeroth moment of `gpdH` for the scalar model equals the model's Dirac form factor computed
   independently from the local current matrix element, and equals the target charge at `t = 0`.
5. The pion example has exactly one electromagnetic form factor, the Pauli-type moment vanishing
   identically.
6. For the exponential-profile example, the Layer 2.5 transverse density is the predicted Gaussian,
   is non-negative, integrates to the zeroth moment, and has second moment equal to minus four times
   the logarithmic `t`-slope.
7. The charge-weighted `x`-integral of the Layer 2.6 transverse radius equals the Layer 2.2 charge
   radius.
8. The counterexample of Layer 2's fourth example satisfies the Layer 1.6 minors and has a negative
   transverse transform, certifying that the Layer 2.5 non-negativity theorem is correctly stated as
   conditional.
9. The Ji sum rule holds for the scalar model: one half the second moment of `gpdH + gpdE` at
   `t = 0` equals the model's quark total angular momentum computed independently.
10. The leading-order Compton form factor of the scalar model has imaginary part equal to the
    distribution on the diagonal, with the factor of `π` from the delta-function part correct.
11. The Bethe–Heitler contribution is odd under lepton-charge reversal in its interference with the
    Compton amplitude and even in its square.
12. The `sin φ` harmonic coefficient of the interference for the scalar model equals the Layer 3.5
    table entry, with the kinematic admixture coefficient computed and non-zero.
13. Pseudoscalar and vector meson channels on the same distribution set select linearly independent
    flavour combinations, certifying Layer 3.7's selectivity claim.
14. The generalised evolution kernel reduces at `ξ = 0` to the forward splitting kernel of
    `CollinearEvolution`, and as `ξ → 1` to the distribution-amplitude kernel.
15. The conformal moments defined by the Layer 4.2 recurrence are eigenfunctions of the
    leading-order kernel with the stated anomalous dimensions, and the Mellin moments are not.
16. The Layer 4.5 dispersion relation is satisfied by the scalar-model form factor: principal value
    of the imaginary part plus the D-term integral equals the real part.
17. The D-term-only distribution has vanishing imaginary part and non-vanishing real part at every
    accessible skewness.
18. The degree-four model of Layer 5's first example has a forward-operator matrix of rank strictly
    less than its dimension, and the explicit shadow distribution lies in the computed kernel.
19. That shadow distribution has non-zero zeroth moment, certifying Layer 5.3's claim that shadow
    distributions limit imaging and not only abstract reconstruction.
20. The multi-scale operator on the degree-four model is injective for an interval of scales and not
    injective at a single scale, certifying Layer 5.5.
21. The singular values of the degree-four matrix decay, and the regularised inverse applied to
    noisy scalar-model data satisfies the Layer 5.6 rate for the stated source-condition order.

## References

- D. Müller, D. Robaschik, B. Geyer, F.-M. Dittes and J. Hořejši, "Wave functions, evolution
  equations and evolution kernels from light-ray operators of QCD", *Fortschr. Phys.* 42 (1994) 101.
- X. Ji, "Gauge-invariant decomposition of nucleon spin", *Phys. Rev. Lett.* 78 (1997) 610 [1997a];
  "Deeply virtual Compton scattering", *Phys. Rev.* D55 (1997) 7114 [1997b]; "Off-forward parton
  distributions", *J. Phys.* G24 (1998) 1181.
- A. V. Radyushkin, "Nonforward parton distributions", *Phys. Rev.* D56 (1997) 5524; "Double
  distributions and evolution equations", *Phys. Rev.* D59 (1999) 014030.
- J. C. Collins and A. Freund, "Proof of factorization for deeply virtual Compton scattering in
  QCD", *Phys. Rev.* D59 (1999) 074009.
- J. C. Collins, L. Frankfurt and M. Strikman, "Factorization for hard exclusive electroproduction
  of mesons in QCD", *Phys. Rev.* D56 (1997) 2982.
- M. Diehl, "Generalized parton distributions", *Phys. Rept.* 388 (2003) 41.
- A. V. Belitsky and A. V. Radyushkin, "Unraveling hadron structure with generalized parton
  distributions", *Phys. Rept.* 418 (2005) 1.
- A. V. Belitsky, D. Müller and A. Kirchner, "Theory of deeply virtual Compton scattering on the
  nucleon", *Nucl. Phys.* B629 (2002) 323.
- A. V. Belitsky and D. Müller, "Exclusive electroproduction revisited: treating kinematical
  effects", *Phys. Rev.* D82 (2010) 074010.
- M. Diehl, T. Gousset, B. Pire and J. P. Ralston, "Testing the handbag contribution to exclusive
  virtual Compton scattering", *Phys. Lett.* B411 (1997) 193.
- M. Burkardt, "Impact parameter dependent parton distributions and off-forward parton distributions
  for `ζ → 0`", *Phys. Rev.* D62 (2000) 071503; "Impact parameter space interpretation for
  generalized parton distributions", *Int. J. Mod. Phys.* A18 (2003) 173.
- M. Diehl, "Generalized parton distributions in impact parameter space", *Eur. Phys. J.* C25 (2002)
  223.
- P. V. Pobylitsa, "Disentangling positivity constraints for generalized parton distributions",
  *Phys. Rev.* D65 (2002) 114015.
- M. V. Polyakov and C. Weiss, "Skewed and double distributions in the pion and the nucleon",
  *Phys. Rev.* D60 (1999) 114017.
- M. Diehl and D. Yu. Ivanov, "Dispersion representations for hard exclusive processes: beyond the
  Born approximation", *Eur. Phys. J.* C52 (2007) 919.
- O. V. Teryaev, "Analytic properties of hard exclusive amplitudes", *Phys. Lett.* B510 (2001) 125;
  I. V. Anikin and O. V. Teryaev, "Dispersion relations and QCD factorization in hard reactions",
  *Phys. Lett.* B554 (2003) 51.
- E. R. Berger, M. Diehl and B. Pire, "Time-like Compton scattering: exclusive photoproduction of
  lepton pairs", *Eur. Phys. J.* C23 (2002) 675.
- K. Kumerički, D. Müller and K. Passek-Kumerički, "Towards a fitting procedure for deeply virtual
  Compton scattering at next-to-leading order and beyond", *Nucl. Phys.* B794 (2008) 244.
- K. Kumerički, "Measurability of pressure inside the proton", *Nature* 570 (2019) E1.
- V. Bertone, H. Dutrieux, C. Mezrag, H. Moutarde and P. Sznajder, "Deconvolution problem of deeply
  virtual Compton scattering", *Phys. Rev.* D103 (2021) 114019.
- H. Dutrieux, C. Lorcé, H. Moutarde, P. Sznajder, A. Trawiński and J. Wagner, "Phenomenological
  assessment of proton mechanical properties from deeply virtual Compton scattering",
  *Eur. Phys. J.* C81 (2021) 300.
- H. Moutarde, P. Sznajder and J. Wagner, "Unbiased determination of DVCS Compton form factors",
  *Eur. Phys. J.* C79 (2019) 614.
- C. F. Perdrisat, V. Punjabi and M. Vanderhaeghen, "Nucleon electromagnetic form factors",
  *Prog. Part. Nucl. Phys.* 59 (2007) 694; C. E. Hyde and K. de Jager, "Electromagnetic form factors
  of the nucleon and Compton scattering", *Ann. Rev. Nucl. Part. Sci.* 54 (2004) 217.
- R. Abdul Khalek et al., "Science requirements and detector concepts for the Electron-Ion
  Collider: EIC Yellow Report", arXiv:2103.05419, Volume II, sections 7.2.1 and 7.2.2.
- H. W. Engl, M. Hanke and A. Neubauer, *Regularization of Inverse Problems*, Kluwer, 1996.
- F. Riesz and B. Sz.-Nagy, *Functional Analysis*, Dover, 1990 — Riesz theory of compact operators
  in the form Layer 5.1 uses it.

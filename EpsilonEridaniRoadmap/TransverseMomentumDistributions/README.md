# Roadmap: transverse-momentum-dependent distributions and azimuthal asymmetries

Distributions resolving a parton's transverse momentum as well as its longitudinal momentum
fraction, the factorisation theorem that gives them meaning, their evolution, and the azimuthal and
single-spin asymmetries that measure them. The characteristic feature of this area is that the
definitions require a gauge link whose path depends on the process, so universality is a theorem
with a sign, not an assumption.

The object at the centre of the roadmap is the quark-quark correlator of a spin-half hadron at fixed
light-cone momentum fraction `x` and fixed transverse momentum `k_T`, together with its gluonic
counterpart. Unlike a collinear parton density, this correlator is not a matrix element of a local
operator: the two field operators sit at light-like separation in the transverse plane as well as
along the light cone, and gauge invariance is restored by a Wilson line whose path runs out to
light-cone infinity and back. That path is not a convention. It is determined by the colour flow of
the process in which the distribution appears, and the two paths relevant to the electron-ion
collider physics programme — future-pointing for semi-inclusive deep-inelastic scattering,
past-pointing for the Drell-Yan annihilation process — give distributions that are equal for six of
the eight leading-twist functions and opposite in sign for the other two. The roadmap is organised
so that this sign is a proved corollary of a time-reversal argument, not an axiom, because it is the
sharpest falsifiable statement the framework makes.

The second organising fact is that the naive definitions do not exist. Integrating the correlator
over all transverse momentum diverges, and the light-cone limit introduces rapidity divergences
which no ordinary dimensional regularisation removes. A transverse-momentum-dependent distribution
is therefore a two-scale object, depending on a renormalisation scale `mu` and a rapidity scale
`zeta`, and its definition is inseparable from the soft factor that cancels those divergences. The
roadmap fixes one scheme, proves the alternatives equal to it, and derives the pair of evolution
equations — Collins-Soper in `zeta`, renormalisation group in `mu` — whose consistency condition is
a single anomalous dimension. In impact-parameter space, conjugate to transverse momentum, that
evolution is multiplicative, which is what makes it solvable.

The final application is the complete azimuthal decomposition of the semi-inclusive deep-inelastic
cross section: eighteen structure functions for a polarised beam and a polarised target, each
attached to one azimuthal modulation, each identified with one convolution of a distribution
against a fragmentation function. The Sivers, Collins and Boer-Mulders asymmetries appear as three
named entries in that list, and the sign change of the Sivers function between the two processes
appears as a corollary of Layer 1. A contributor who finishes this roadmap can state, and has the
machinery to prove, which measured modulation determines which distribution and under exactly which
hypotheses.

## Scope

Included:

- The quark-quark correlator at fixed `x` and `k_T` for a hadron of spin zero and spin one half,
  its Dirac decomposition, and the completeness of the resulting list of structures.
- The eight leading-twist quark transverse-momentum-dependent distributions: `f_1`, `g_1L`, `h_1`,
  `f_1T^perp`, `h_1^perp`, `g_1T`, `h_1L^perp`, `h_1T^perp`, with a proof that they exhaust the
  available tensor structures at leading power.
- The eight leading-twist gluon transverse-momentum-dependent distributions, including the linearly
  polarised gluon distribution `h_1^{perp g}`, at momentum fractions where the correlator is a
  single-gluon matrix element.
- The staple-shaped gauge link with its path as explicit data, the two path choices realised in
  deep-inelastic scattering and in the annihilation process, and the transverse gauge link at
  light-cone infinity that makes the light-cone-gauge definition agree with the covariant one.
- The time-reversal classification into T-even and T-odd distributions, and the theorem that the
  T-odd ones change sign between the two link directions.
- Transverse moments: the weighted `k_T` integrals, which collinear function each distribution
  reduces to, and the divergence structure of the unweighted integral.
- Positivity: the positive-semidefiniteness of the correlator regarded as a matrix in parton-spin
  and hadron-spin space, and the bounds among the eight functions that are its minors.
- The transverse-momentum-dependent factorisation theorem for semi-inclusive deep-inelastic
  scattering at small transverse momentum of the produced hadron, including the soft factor and the
  hard factor.
- Rapidity divergences, the regulators that expose them, the scheme that cancels them, and the
  proved equalities relating the scheme fixed here to the alternatives.
- Collins-Soper evolution in the rapidity scale, the renormalisation-group equation in the
  renormalisation scale, their consistency condition, and the exponentiated solution in
  impact-parameter space.
- The perturbative small-distance expansion of the Collins-Soper kernel, and the statement that its
  large-distance behaviour is a function to be determined from data rather than derived.
- Matching to collinear factorisation: the small-distance operator-product expansion of the
  distribution onto collinear densities with a matching coefficient, the fixed-order description at
  large transverse momentum, the intermediate region where both hold, and the subtraction that
  avoids double counting.
- The eighteen azimuthal structure functions of the semi-inclusive cross section at leading and
  subleading twist, each with its modulation and its convolution.
- The Sivers, Collins and Boer-Mulders asymmetries, and the Sivers sign change as a corollary.
- Wandzura-Wilczek-type relations, stated as named hypotheses and kept out of the exact results.

Not included. The collinear helicity and transversity densities themselves, their evolution and
their sum rules belong to `SpinStructure`; this roadmap takes them as the targets of its transverse
moments and does not restate their properties. The collinear splitting kernels, the moment
machinery and the running coupling belong to `CollinearEvolution`; the matching coefficients of
Layer 4 are convolved against densities evolved there. The twist-three collinear correlators —
the Qiu-Sterman function and its relatives — belong to `MultiPartonCorrelations`; this roadmap
proves that particular transverse moments equal them and then stops. The
transverse-momentum-dependent fragmentation functions, including the Collins function, belong to
`Hadronization`; every convolution in Layer 5 has one of them as its second argument, taken as
given. Impact-parameter densities obtained by Fourier transforming in the momentum transfer to the
hadron, and the whole apparatus of generalised parton distributions, belong to
`GeneralizedPartonDistributions`; the impact-parameter variable of Layer 3 is a different variable
and Convention 4 exists to keep them apart. The Wigner distribution of which a
transverse-momentum-dependent distribution is a marginal belongs to `WignerDistributions`, which
cites this roadmap for the marginal and not the reverse. The small-`x` limit, where the gluon
correlator ceases to be a single-gluon matrix element and the Weizsacker-Williams and dipole
distributions separate, belongs to `SmallXAndSaturation`; Layer 1 states the boundary as a
condition on `x` and hands over. Transverse-momentum broadening and the modification of these
distributions in a nuclear target belong to `NuclearMedium`. Transverse momentum inside a
reconstructed jet, and jet-based access to the Collins effect, belong to `JetsAndEventShapes`.
Photon radiation from the lepton line, which produces azimuthal modulations of its own and must be
removed before any asymmetry in Layer 5 is a measurement of a distribution, belongs to
`RadiativeCorrections`. The transverse-momentum-integrated inclusive structure functions belong to
`InclusiveStructureFunctions`. Bessel functions, which this roadmap needs for the radial transform
of Layer 3, are built by `LightNuclei` and used here.

Material developed by this roadmap belongs under `EpsilonEridani/Particles/Parton/TMD/` for the
distributions, their links, their moments and their evolution, and under
`EpsilonEridani/QFT/Scattering/DIS/SIDIS/` for the factorisation theorem, the structure functions
and the asymmetries.

## Conventions and coordination with upstream

1. **Two transverse momenta, never one symbol.** The transverse momentum of the parton with
   respect to the parent hadron is written `k_T` and the transverse momentum of the produced hadron
   with respect to the virtual photon is written `P_hT`; the fragmenting parton's transverse
   momentum relative to the produced hadron is `K_T`. No declaration takes an argument named `pT`
   or `qT` without a type or a name that says which of the three it is. The trap is that the
   factorisation theorem of Layer 2 relates them by a two-dimensional delta function with a factor
   `1/z`, and a derivation that silently identifies `P_hT` with `-z k_T` produces the correct
   leading term and the wrong convolution weight for every asymmetry beyond `f_1 D_1`.

2. **The gauge link path is data, not a parameter with a default.** A distribution is a function of
   `x`, `k_T` and a link path, and the path is an explicit argument of every definition. A
   distribution symbol written without a path in prose means the future-pointing,
   deep-inelastic-scattering link. The trap is a theorem stated for "the Sivers function" that is
   true for one path and false by a sign for the other; making the path an argument turns that into
   a type error rather than a wrong sign.

3. **Two scales, always both.** Every properly defined distribution carries a renormalisation scale
   and a rapidity scale, and no definition in this roadmap produces an object with fewer. Where a
   single-scale object is wanted for comparison with the literature, it is obtained by specifying
   both scales explicitly at a named point. The trap is the pre-factorisation "naive" correlator,
   which is a perfectly definable integral that is divergent and therefore not a distribution; it
   appears in Layer 2 as a named auxiliary object whose divergence is the content of a theorem, and
   is never used as the subject of a physics statement.

4. **Impact-parameter space means conjugate to `k_T`.** The variable `b_T` of Layer 3 is the
   two-dimensional Fourier conjugate of the parton transverse momentum, at fixed hadron momentum.
   The impact parameter of `GeneralizedPartonDistributions` is the conjugate of the transverse
   momentum transfer to the hadron. They have the same units, the same name in the literature and
   entirely different physics. Every declaration in this roadmap that uses the transverse position
   variable names it `bT` and says in its docstring that it is conjugate to `k_T`. The trap is a
   cross-roadmap lemma that typechecks because both variables are elements of the same space.

5. **Trento sign conventions for azimuthal angles, fixed once.** Azimuthal angles are measured
   about the virtual-photon direction in the frame where the lepton plane is the reference plane,
   with `phi_h` the angle of the produced hadron and `phi_S` the angle of the target transverse
   spin, both with the Trento sign. The convention is recorded in one place as an explicit frame
   datum and every structure function refers to it. The trap is that half the literature and most
   experimental papers differ from the other half by the sign of `phi_S`, which flips the sign of
   every single-transverse-spin asymmetry; a roadmap that does not name its convention cannot state
   the Sivers sign change as a falsifiable prediction at all.

6. **Naming follows the Mulders-Tangerman-Boer amplitude names.** The eight leading-twist
   quark functions are `f_1`, `g_1L`, `h_1`, `f_1T^perp`, `h_1^perp`, `g_1T`, `h_1L^perp`,
   `h_1T^perp`, and the corresponding Lean identifiers are `f1`, `g1L`, `h1`, `f1Tperp`, `h1perp`,
   `g1T`, `h1Lperp`, `h1Tperp`. Physics nicknames — Sivers, Collins, Boer-Mulders, pretzelosity,
   worm-gear — appear in docstrings and in the asymmetry names of Layer 5, never as the name of a
   distribution. The trap is that "the Collins asymmetry" involves a fragmentation function and not
   a distribution at all, and "worm-gear" names two different functions in different papers.

7. **Transverse moments carry their weight in their name.** The `n`-th transverse moment of a
   distribution is the integral weighted by `(k_T^2 / 2 M^2)^n` with the target mass `M` supplying
   every power of dimension, and is written with a superscript `(n)`. The trap is that the
   literature uses at least three weights differing by factors of `2` and by whether `M` or `|k_T|`
   is used, so a sum rule that is exact in one weight is wrong by a factor in another.

8. **T-even and T-odd are properties of a function, recorded as such.** Each of the eight
   distributions is tagged by its behaviour under the time-reversal argument of Layer 1, and the
   sign-change theorem is stated once, quantified over the T-odd ones, rather than twice for two
   named functions. The trap is proving the Sivers sign change and the Boer-Mulders sign change as
   unrelated results and then being unable to state what would falsify the mechanism.

9. **The soft factor belongs to the definition, and the scheme is named.** The scheme fixed in
   Layer 2 is the one in which the distribution absorbs the square root of the soft factor. Objects
   defined with a different rapidity regulator carry the regulator's name and are related to the
   fixed scheme by a proved equality. The trap is a library in which two modules define "the"
   distribution with different subtractions, and a lemma proved in one is applied in the other.

10. **Evolution is a semigroup, and is not reproved.** The Collins-Soper evolution in the rapidity
    scale and the renormalisation-group evolution in `mu` are stated as one-parameter semigroups on
    a Banach space of functions of `b_T`, using
    `TauCeti.Analysis.Semigroups.Defs`, `TauCeti.Analysis.Semigroups.Generator` and
    `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` for the abstract Cauchy problem and
    `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness` for its uniqueness. Existence and
    uniqueness of the solution are never reproved here. The trap is treating a rapidity evolution
    equation as a partial differential equation and reaching for elliptic theory: the
    `TauCeti.Analysis.PDE` hierarchy is elliptic theory only — Dirichlet problem, Harnack,
    Caccioppoli, maximum principle, fundamental solutions — and does not apply to an evolution
    equation.

11. **Positivity is a matrix statement.** All pointwise inequalities among the eight distributions
    are corollaries of the positive semidefiniteness of one matrix, proved once, using
    `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` for the matrix property and
    `TauCeti.Analysis.PositiveDefinite.AddGroup` for the positive-definiteness of the correlator as
    a function on the translation group. The trap is a collection of separately conjectured bounds,
    some of which are false at subleading order in the `1/M` counting.

12. **Fourier conventions are imported, not chosen.** The two-dimensional transform between `k_T`
    and `b_T` uses the convention fixed in `TauCeti.Analysis.Bochner.Fourier.Convention`, and the
    azimuthal decomposition uses the circle Fourier theory of
    `TauCeti.Analysis.Fourier.AddCircle`. The trap is factors of `2 pi` distributed differently in
    the transform and the inverse, which shifts every matching coefficient by a constant.

## Existing upstream material used by the roadmap

In `EpsilonEridani`, the base of the area is the four existing TMD modules —
`EpsilonEridani.Particles.Parton.TMD.Basic`, `EpsilonEridani.Particles.Parton.TMD.CollinsSoper`,
`EpsilonEridani.Particles.Parton.TMD.Reduction` and
`EpsilonEridani.Particles.Parton.TMD.PowerCorrections` — which supply the distribution objects, the
Collins-Soper structure, the collinear reduction and the power counting. Layers 1 to 4 extend these
four rather than starting a parallel hierarchy. Alongside them:

- `EpsilonEridani.Particles.Parton.Basic` and `EpsilonEridani.Particles.Parton.PDF.Basic` for the
  parton labels, flavour structure and the collinear densities the transverse moments target, and
  `EpsilonEridani.Particles.Parton.PDF.Positivity` for the collinear positivity statements whose
  transverse-momentum-dependent refinement is Layer 1.6.
- `EpsilonEridani.Particles.Parton.Unified.Basic` and
  `EpsilonEridani.Particles.Parton.Unified.Consistency` for the common interface across
  distribution types and its consistency conditions, which the two-scale objects of Layer 2.5 must
  satisfy, and `EpsilonEridani.Particles.Fragmentation.Basic` for the fragmentation-function
  interface whose transverse-momentum-dependent instances come from `Hadronization`.
- `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`,
  `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Basic` and
  `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics` for the semi-inclusive process,
  the asymmetry definitions and the harmonic decomposition that Layer 5 completes;
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and
  `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds` for the invariants and their allowed ranges,
  which fix the phase-space boundary of the convolutions; and
  `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` for the hadronic-tensor decomposition of which
  the azimuthal structure functions are the semi-inclusive analogue.
- `EpsilonEridani.QFT.Factorization.Basic` and `EpsilonEridani.QFT.Factorization.Scales.Basic` for
  the factorisation interface and the scale bookkeeping, extended in Layer 2.4 by the rapidity
  scale, with `EpsilonEridani.QFT.Factorization.DIS.HardKernel` for the hard function of Layer 4.2.
- `EpsilonEridani.QFT.Factorization.Convolution.Basic`,
  `EpsilonEridani.QFT.Factorization.Convolution.Collinear`,
  `EpsilonEridani.QFT.Factorization.Convolution.Mellin` and
  `EpsilonEridani.QFT.Factorization.Convolution.Properties` for the longitudinal convolution and
  its algebra; the transverse convolution of Layer 2.2 is a new operation built to the same
  interface.
- `EpsilonEridani.QFT.Factorization.Evolution.Basic`,
  `EpsilonEridani.QFT.Factorization.Evolution.Consistency` and
  `EpsilonEridani.QFT.Factorization.Evolution.Solutions` for the evolution interface, the pattern
  of a consistency theorem between two evolution equations, and the solution representation.
- `EpsilonEridani.QFT.QCD.Basic` and `EpsilonEridani.QFT.QCD.Renormalization` for the colour
  structure, the coupling and the renormalisation apparatus;
  `EpsilonEridani.QFT.Shower.Sudakov` for the Sudakov exponent that Layer 3.5 identifies with the
  exponentiated evolution kernel in a stated limit.
- `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` for the transverse
  antisymmetric tensor contractions in which every T-odd structure is written, and
  `EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef` for the matrix positivity of
  Layer 1.6.

In `TauCeti`:

- Evolution is a semigroup: `TauCeti.Analysis.Semigroups.Defs`,
  `TauCeti.Analysis.Semigroups.Generator` and `TauCeti.Analysis.Semigroups.Generator.Basic` for the
  generator, `TauCeti.Analysis.Semigroups.CauchyProblem.Basic` and
  `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness` for existence and uniqueness of the
  solution, which are never reproved here. In impact-parameter space the generator is
  multiplication by the Collins-Soper kernel, so Layer 3.3 is an instance of
  `TauCeti.Analysis.Semigroups.Multiplication`; since rapidity evolution is invertible the
  semigroup extends to a group with `TauCeti.Analysis.Semigroups.Group.Basic` and the
  two-parameter flow in `(mu, zeta)` is stated with `TauCeti.Analysis.Semigroups.Group.Flow`.
  `TauCeti.Analysis.Semigroups.GrowthBound` supplies the exponential bound controlling the evolved
  distribution at large `b_T`.
- Fourier analysis: `TauCeti.Analysis.Bochner.Fourier.Convention` for the convention of
  Convention 12; `TauCeti.Analysis.Fourier.Integrable`, `TauCeti.Analysis.Fourier.Decay` and
  `TauCeti.Analysis.Fourier.RiemannLebesgue` for the hypotheses under which the `k_T`-to-`b_T`
  transform and its inverse are defined; and `TauCeti.Analysis.Fourier.AddCircle` for the azimuthal
  harmonic decomposition of Layer 5.1, whose completeness and orthogonality are imported rather
  than reproved.
- Positivity: `TauCeti.Analysis.PositiveDefinite.AddGroup` for Layer 1.6, and
  `TauCeti.Analysis.PositiveDefinite.SemigroupGroup.FourierLaplace.PositiveDefinite` for the
  statement that positivity in `k_T` and positivity in `b_T` are different conditions, which is the
  obstruction to reading a `b_T`-space distribution as a density.
- `TauCeti.Analysis.Holder.Lp` for the boundedness of the transverse convolution operator of
  Layer 2.2; `TauCeti.Analysis.Sobolev.WeakDeriv.Basic` for the weak derivatives in which the
  evolution equations are stated, since the distributions are not assumed smooth;
  `TauCeti.Probability.Moments.Basic` for the moment vocabulary of Layer 1.5.
- `TauCeti.Analysis.Fredholm.Criteria` and `TauCeti.Analysis.Fredholm.CompactPerturbation` for the
  statement in Layer 2.5 that the transverse convolution operator is compact, hence that recovering
  a distribution from a measured structure function is an inverse problem with a kernel.
- `TauCeti.Analysis.SpecialFunctions.Beta` for the Mellin-space integrals appearing in the matching
  coefficients of Layer 4, and `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace` for the
  integral representation characterising the admissible large-`b_T` behaviour of the Collins-Soper
  kernel in Layer 3.4.

In `Mathlib`: `Mathlib.Analysis.Fourier.FourierTransform` for the transform itself,
`Mathlib.Analysis.Distribution.SchwartzSpace` for the test-function class in which the singular
`k_T` behaviour is controlled, Mathlib's Bochner integration API for the vector-valued integrals
in which the Dirac-matrix-valued correlator of Layer 0.4 is defined,
`Mathlib.Analysis.SpecialFunctions.Gamma.Basic` and
`Mathlib.Analysis.SpecialFunctions.Log.Basic` for the functions appearing in the perturbative
expansions, and `Mathlib.Analysis.Calculus.Deriv.Basic` for the scale derivatives.

Genuine absences, and what the roadmap does instead:

- :warning: **Bessel functions are absent from both Mathlib and TauCeti.** The occurrences of the
  name in either library are incidental. The two-dimensional radial transform between `k_T` and
  `b_T` — the Hankel transform of order zero for the unpolarised structures, of order one and two
  for the polarised ones — cannot be written without them. This roadmap uses the Bessel functions
  built by `LightNuclei`, in that shape, and does not duplicate them. Layer 3.2 states which orders
  it needs and which properties of them it uses: the differential equation, the series at small
  argument, the asymptotic form, and the orthogonality relation that inverts the transform.
- :warning: **Polylogarithms and harmonic sums are absent from both libraries.** They appear in the
  matching coefficients of Layer 4 at next-to-leading order and beyond and in the two-loop
  Collins-Soper kernel. Layer 4.4 builds the specific weight-two and weight-three functions needed,
  in the shape Mathlib would want for a special function — a definition, an integral
  representation, a functional equation and the values at the arguments used — and does not make
  the rest of the roadmap contingent on them: every statement in Layers 1, 2, 3 and 5 is
  independent of the explicit form of the coefficients.
- :warning: **There is no Wilson-line or gauge-link object anywhere upstream.** No module in either
  inventory concerns path-ordered exponentials of a gauge field. Layer 1.2 builds one here, with
  the path as explicit data and with only the properties the roadmap uses proved: composition along
  concatenated paths, behaviour under a gauge transformation, and the reversal that exchanges the
  two staple directions. It is built in `EpsilonEridani/Particles/Parton/TMD/` because that is
  where it is used, and its interface is kept narrow so that it can be replaced by a general
  construction later without changing any statement that depends on it.
- :warning: **There is no notion of a rapidity regulator, and no cusp anomalous dimension,
  upstream.** The occurrences of "cusp" in TauCeti are cusps of modular curves. Layer 2.3 defines
  the regulator as a structure with the properties the cancellation argument needs, and Layer 3.4
  defines the cusp anomalous dimension as the object appearing in the consistency condition, which
  is the only characterisation the roadmap uses.
- :warning: **TauCeti has no moment problem and no notion of ill-posedness.** Layer 2.5 therefore
  states the inverse-problem content of the convolution structure as a Fredholm statement about the
  kernel and the compactness of an operator, using `TauCeti.Analysis.Fredholm.Criteria` and
  `TauCeti.Analysis.Fredholm.CompactPerturbation`, and does not use the language of
  regularisation.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Relativity.Tensors.RealTensor.Vector.MinkowskiProduct` for the invariant
  product, `Physlib.Relativity.Tensors.MetricTensor` and
  `Physlib.Relativity.Tensors.Contraction.Basic` for index contraction, and
  `Physlib.Relativity.LorentzGroup.Basic` for the covariance group, with
  `Physlib.Relativity.Fermions.Weyl.LeftHanded`, `.RightHanded` and `.Contraction` for the
  helicity amplitudes the eight leading-twist functions decompose.

## Layer 0: kinematics, frames and the unintegrated correlator

References: Mulders and Tangerman, *Nucl. Phys.* B461 (1996) 197; Boer and Mulders, *Phys. Rev.*
D57 (1998) 5780; Bacchetta, Diehl, Goeke, Metz, Mulders and Schlegel, *JHEP* 02 (2007) 093;
Bacchetta, D'Alesio, Diehl and Miller, *Phys. Rev.* D70 (2004) 117504 (Trento conventions).

### 0.1 Light-cone decomposition and the two light-like directions

Fix a pair of light-like vectors `n_+` and `n_-` with `n_+ . n_- = 1`, and the transverse subspace
as their common orthogonal complement. Define the light-cone components of a four-vector, the
transverse projector, and the transverse antisymmetric tensor obtained by contracting the
Levi-Civita tensor with `n_+` and `n_-`, using
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`.

To prove: the transverse projector is idempotent and of rank two; the transverse antisymmetric
tensor squares to minus the projector; the decomposition of a four-vector into light-cone and
transverse parts is unique. State the residual invariance group: boosts along the `n_+` direction,
rotations in the transverse plane, and the transverse boosts that do not preserve the pair. Prove
that the transverse boosts change `k_T` at order `1/P^+`, which is the statement that `k_T` is
frame-dependent at subleading power and the reason the power counting of Layer 2 is stated in a
named frame class.

### 0.2 Semi-inclusive kinematics and the three transverse momenta

For the process `lepton + hadron -> lepton' + hadron_h + X`, define the invariants from
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`: `Q^2`, `x`, `y`, the hadron momentum
fraction `z`, and the transverse momentum `P_hT` of the produced hadron with respect to the
virtual-photon direction. Prove the allowed ranges using
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Bounds`, including the bound on `|P_hT|` at fixed
`z` and `Q^2`.

Introduce the three transverse momenta of Convention 1 as three distinct definitions and prove the
relation `P_hT = z k_T + K_T` up to corrections suppressed by `|P_hT| / Q`, with the suppression
made explicit as a hypothesis rather than an approximation applied silently. This is the one place
in the roadmap where the three are related; every later statement uses the relation as a cited
lemma.

### 0.3 The azimuthal frame and the Trento convention

Define the reference frame as a structure: the virtual-photon direction, the lepton plane, and an
orientation. Define `phi_h` and `phi_S` as functions of the momenta and the target spin in that
frame. Prove that the pair `(phi_h, phi_S)` is invariant under boosts along the photon direction,
so that the azimuthal decomposition of Layer 5 is a statement about a boost-invariant pair of
angles.

Record the Trento sign convention as the value of the orientation datum, and prove the explicit
relation between the structure functions defined with the two possible orientations: the sine
modulations change sign, the cosine modulations do not. This lemma is what allows a result quoted
in the opposite convention to be used.

### 0.4 The unintegrated quark correlator

Define the correlator

```
Phi(x, k_T ; S ; path) =
  integral over (xi^- , xi_T) of  exp(i k . xi) *
    <P, S | qbar(0) W(0, xi ; path) q(xi) | P, S>   at  xi^+ = 0
```

as a Dirac-matrix-valued function, with `W` the gauge link of Layer 1.2 and the light-cone
component conventions of Layer 0.1. Prove: hermiticity of the correlator under Dirac conjugation;
its behaviour under parity; its support properties in `x`. Prove that the correlator is a
positive-definite function on the transverse translation group in the sense of
`TauCeti.Analysis.PositiveDefinite.AddGroup`, which is the input to Layer 1.6.

Define the gluon correlator analogously, with the field-strength tensor in place of the quark
fields and two links, and prove the corresponding hermiticity and parity statements.

### Examples

- The correlator of a free quark of definite helicity: compute it in closed form and check that
  only `f_1` and `g_1L` are non-zero, with `f_1` a delta function in `x` and a delta function in
  `k_T`.
- A spin-zero target: prove that only `f_1` and `h_1^perp` survive, which is the smallest
  non-trivial check that the T-odd structures are not tied to target polarisation.
- The scalar-diquark spectator model as an explicit correlator: verify that it satisfies the
  hermiticity and parity statements of Layer 0.4, and that it produces a non-zero `f_1T^perp`.

### Dependencies

`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds`;
`EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions`;
`EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`;
`TauCeti.Analysis.PositiveDefinite.AddGroup`. The gauge link used in Layer 0.4 is defined in
Layer 1.2; Layer 0.4 is stated for an arbitrary link satisfying the interface, so the two layers
are not circular.

---

## Layer 1: the eight distributions, the link, and the sign

References: Mulders and Tangerman (1996); Boer and Mulders (1998); Collins, *Phys. Lett.* B536
(2002) 43; Brodsky, Hwang and Schmidt, *Phys. Lett.* B530 (2002) 99; Belitsky, Ji and Yuan,
*Nucl. Phys.* B656 (2003) 165; Bacchetta, Boglione, Henneman and Mulders, *Phys. Rev. Lett.* 85
(2000) 712; Meissner, Metz and Goeke, *Phys. Rev.* D76 (2007) 034002 (gluon distributions);
Mulders and Rodrigues, *Phys. Rev.* D63 (2001) 094021.

### 1.1 The leading-twist decomposition and its completeness

Project the correlator of Layer 0.4 onto the leading-twist Dirac structures `gamma^+`,
`gamma^+ gamma_5` and `i sigma^{i+} gamma_5` and define the eight distributions by

```
Phi^{[gamma^+]}        = f_1  -  (eps_T^{ij} k_Ti S_Tj / M) f_1T^perp
Phi^{[gamma^+ gamma_5]} = S_L g_1L  +  (k_T . S_T / M) g_1T
Phi^{[i sigma^{i+} gamma_5]}
   = S_T^i h_1  +  S_L (k_T^i / M) h_1L^perp
     + ((k_T^i k_T^j - (1/2) k_T^2 delta^{ij}) S_Tj / M^2) h_1T^perp
     + (eps_T^{ij} k_Tj / M) h_1^perp
```

with the target mass `M` supplying every power of dimension, per Convention 7.

The theorem of this subsection is **completeness**: the eight functions exhaust the decomposition.
State it as the assertion that the space of Dirac-and-transverse tensor structures built from
`k_T`, `S_T`, `S_L`, the transverse projector and the transverse antisymmetric tensor, that are
consistent with hermiticity and parity from Layer 0.4 and of leading twist, has dimension eight,
and that the eight displayed structures are a basis. The hypotheses are exactly the hermiticity and
parity statements and the leading-power projection; no appeal to a model or to a diagram is
permitted. Prove the corresponding statement for a spin-zero target (dimension two) and for the
gluon correlator (dimension eight).

### 1.2 The gauge link with its path

Define a path as a piecewise-light-like or transverse curve in Minkowski space and the link
`W(x, y ; path)` as a formal path-ordered exponential, carrying the colour representation from
`EpsilonEridani.QFT.QCD.Basic`. This is new material: no upstream module provides it.

Prove, from the definition and no more: composition under concatenation of paths; the
transformation law under a gauge transformation, namely conjugation by the group elements at the
endpoints; the inverse as the reversed path; and independence of the parametrisation.

Define the two staple paths explicitly. The future-pointing staple runs from the origin along
`n_-` to light-cone infinity, transversely to `xi_T` at infinity, and back to `xi`; the
past-pointing staple is the same with the light-cone direction reversed. Define the transverse link
at light-cone infinity as a separate named piece, and prove that it is not removable: state as a
theorem that in light-cone gauge the transverse link contributes and that omitting it gives a
correlator that differs from the covariant-gauge one. This is the subsection's trap, and it is
proved rather than remarked.

### 1.3 The process dependence of the path

State, as a definition, the assignment of a path to a process: the future-pointing staple for
semi-inclusive deep-inelastic scattering, arising from final-state colour exchange with the
outgoing struck quark; the past-pointing staple for the Drell-Yan annihilation process, arising
from initial-state exchange.

The assignment is a *derived* statement in the factorisation theorem of Layer 2, not an axiom: the
path is whatever the eikonal approximation to the spectator interactions produces. Layer 1.3 states
the assignment, records that its derivation is Layer 2.4, and proves the one thing provable here —
that the two paths are exchanged by reversal, so that a relation between the two distributions can
only be a statement about the reversal operation. Processes with more complicated colour flow, in
which the link is neither of these two staples, are a hypothesis-level statement: Layer 1.3 names
the phenomenon, records that only the two staple cases are in scope, and does not claim a
classification.

### 1.4 Time reversal and the sign-change theorem

Define the anti-unitary time-reversal operation on the correlator and prove its action on the two
pieces of the correlator's definition: it conjugates the matrix element and it reverses the link
path. Define a distribution to be **T-even** if the corresponding structure in Layer 1.1 is
invariant under the combined operation and **T-odd** if it changes sign; prove that the eight
functions split as six T-even (`f_1`, `g_1L`, `h_1`, `g_1T`, `h_1L^perp`, `h_1T^perp`) and two
T-odd (`f_1T^perp`, `h_1^perp`), by inspecting the transformation of the eight tensor structures.

The central theorem:

```
for every T-odd distribution D,
  D(x, k_T ; future staple) = - D(x, k_T ; past staple)
and for every T-even distribution D,
  D(x, k_T ; future staple) = + D(x, k_T ; past staple)
```

with hypotheses: time-reversal invariance of the strong interaction, the hermiticity and parity
properties of Layer 0.4, and the reversal lemma of Layer 1.2. Prove it once, quantified over the
T-odd set, per Convention 8. Prove the corollary that a T-odd distribution defined with a
time-reversal-even link — a straight-line path — vanishes identically, which is the precise sense in
which the link is what allows the T-odd functions to be non-zero.

### 1.5 Transverse moments and reduction to collinear functions

Define the `n`-th transverse moment with the weight of Convention 7, and prove:

- The zeroth moment of `f_1` and of `g_1L` and `h_1` formally equals the collinear `f_1`, `g_1`
  and `h_1` of `SpinStructure`, and the integral is logarithmically divergent in the ultraviolet.
  State the divergence as a theorem: the unregulated integral of the leading large-`k_T` behaviour
  over `|k_T| < Lambda` grows like `log Lambda`. Hence the reduction to a collinear density is not
  an integral but a matching statement, which is Layer 4.1. This subsection proves the obstruction;
  Layer 4 supplies the correct relation. `EpsilonEridani.Particles.Parton.TMD.Reduction` is the
  existing base for the reduction statements and is extended here.
- The first moment of `f_1T^perp` equals, up to a sign and a factor of the target mass fixed by
  Convention 7, the Qiu-Sterman twist-three correlator at the diagonal point; the first moment of
  `h_1^perp` equals the corresponding T-odd twist-three correlator. Both target functions belong to
  `MultiPartonCorrelations` and are taken from there; this roadmap proves the equality and does not
  develop the twist-three sector.
- The first moments of `g_1T` and `h_1L^perp` decompose into a collinear piece — the `g_T` and
  `h_L` structure functions of `SpinStructure` — and a genuine twist-three piece from
  `MultiPartonCorrelations`. Prove the decomposition exactly, with both terms present. The
  approximation that drops the twist-three piece is Layer 5.6 and is a named hypothesis, never used
  here.
- `h_1T^perp` has no first moment that reduces to a collinear function; its second moment is
  finite under the decay hypotheses of Layer 3.2 and is a new quantity. State this as a positive
  result about the second moment rather than as an absence.

Use `TauCeti.Probability.Moments.Basic` for the moment vocabulary and
`TauCeti.Analysis.Fourier.Decay` for the decay hypotheses under which a weighted integral
converges.

### 1.6 Positivity bounds

Assemble the correlator at fixed `x` and `k_T` into a matrix on the tensor product of the quark
spin space and the hadron spin space, using the positive-definiteness of Layer 0.4. Prove that this
matrix is positive semidefinite, with
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`.

Derive, as minors of that one matrix:

- `f_1 >= 0`;
- `|g_1L| <= f_1` and `|h_1| <= f_1`;
- the generalised Soffer bound `2 |h_1| <= f_1 + g_1L`;
- the bounds on the T-odd functions, `(|k_T| / M) |f_1T^perp| <= f_1` and
  `(|k_T| / M) |h_1^perp| <= f_1`, and the sharper two-by-two minors relating each to
  `f_1 - g_1L` and `f_1 + g_1L`;
- the bounds on `g_1T`, `h_1L^perp` and `h_1T^perp`, including the three-by-three minor that
  couples `h_1T^perp` to the other transversity structures.

Prove each as a corollary with the matrix statement as its only hypothesis, per Convention 11.
Prove the relation to the collinear bounds of `EpsilonEridani.Particles.Parton.PDF.Positivity`:
integrating a bound does not give the collinear bound, because of the divergence of Layer 1.5, and
the correct statement is a bound on the moments. State which of the eight bounds survive the
scheme-dependence of Layer 2: the bounds hold for the naive correlator, and whether they hold for
the properly defined two-scale distribution is the open question of this layer, named in Layer 2.6.

### 1.7 Gluon distributions and the small-`x` boundary

Define the gluon correlator's leading-twist decomposition into eight functions, including
`f_1^g`, the gluon helicity distribution, the linearly polarised gluon distribution `h_1^{perp g}`,
and the gluon Sivers function. Prove the completeness statement of Layer 1.1 for the gluon case,
and the time-reversal classification: `h_1^{perp g}` is T-even and the gluon Sivers function is
T-odd, so the sign-change theorem of Layer 1.4 applies to the latter.

State the boundary with `SmallXAndSaturation` as an explicit hypothesis: the decomposition above is
the single-gluon matrix element, and the roadmap's gluon statements carry the hypothesis that `x`
is not small enough for the two link structures of the gluon correlator — the two future-pointing
links of the Weizsacker-Williams form and the future-past combination of the dipole form — to be
resummed into different objects. The classification of gluon link structures and their small-`x`
limits is taken from `SmallXAndSaturation` and not developed here.

### Examples

- The scalar-diquark spectator model: compute all eight quark functions, verify every bound of
  Layer 1.6, and verify the sign change of Layer 1.4 by computing with both paths.
- A model with a straight-line link: verify that `f_1T^perp` and `h_1^perp` vanish, instantiating
  the corollary of Layer 1.4.
- The bag-model relation `h_1T^perp = g_1L - h_1` as a *model* identity: state it, prove it in the
  model, and prove that it is not a consequence of Layer 1.1, so that it cannot be used as a
  constraint.
- A Gaussian ansatz in `k_T`: verify that all moments of Layer 1.5 exist, and exhibit explicitly
  that the zeroth moment of the model `f_1` is finite while the theorem of Layer 1.5 concerns the
  true large-`k_T` tail, so the model does not falsify the divergence.

### Dependencies

Layer 0 in full. `EpsilonEridani.Particles.Parton.TMD.Basic` and `.Reduction`;
`EpsilonEridani.Particles.Parton.PDF.Positivity`; `EpsilonEridani.QFT.QCD.Basic`;
`EpsilonEridani.Mathematics.DataStructures.Matrix.PosSemidef`;
`TauCeti.Analysis.PositiveDefinite.AddGroup`; `TauCeti.Probability.Moments.Basic`.
`SpinStructure` for the collinear `f_1`, `g_1`, `h_1`, `g_T` and `h_L`. `MultiPartonCorrelations`
for the twist-three correlators. `SmallXAndSaturation` for the small-`x` gluon link structures.

---

## Layer 2: factorisation and the definition that exists

References: Collins and Soper, *Nucl. Phys.* B193 (1981) 381; Collins, Soper and Sterman,
*Nucl. Phys.* B250 (1985) 199; Collins, *Foundations of Perturbative QCD*, Cambridge (2011),
chapters 10 and 13; Ji, Ma and Yuan, *Phys. Rev.* D71 (2005) 034005; Becher and Neubert,
*Eur. Phys. J.* C71 (2011) 1665; Echevarria, Idilbi and Scimemi, *JHEP* 07 (2012) 002; Chiu, Jain,
Neill and Rothstein, *JHEP* 05 (2012) 084.

### 2.1 Power counting and the region decomposition

Define the small-transverse-momentum region as the hypothesis `|P_hT| << Q` at fixed `x` and `z`,
made precise as a limit with a named ratio. Using
`EpsilonEridani.Particles.Parton.TMD.PowerCorrections` as the existing base, define the power
counting: leading power, and the two classes of correction, those suppressed by `|P_hT|/Q` and
those suppressed by `Lambda/Q`.

State the region decomposition of the cross section into collinear, anti-collinear, soft and hard
subprocesses as a definition of the factorised form, and prove the statements that are provable
about the decomposition without a diagrammatic argument: that the four regions have disjoint
scalings, and that the leading-power scaling of each is uniquely determined by the external
kinematics. The completeness of the region decomposition — that no other region contributes at
leading power — is a hypothesis of the factorisation theorem, and Layer 2.4 names it as such.

### 2.2 The transverse convolution

Define the transverse convolution of a distribution and a fragmentation function with weight `w`:

```
C[w ; f ; D](x, z, P_hT) =
  x * sum over flavours a of e_a^2 *
    integral d^2 k_T d^2 K_T  delta^2( k_T - K_T/z - P_hT/z )
      * w(k_T, K_T) * f^a(x, k_T^2) * D^a(z, K_T^2)
```

with the fragmentation function taken from `Hadronization` through the interface of
`EpsilonEridani.Particles.Fragmentation.Basic`. Build the operation to the interface of
`EpsilonEridani.QFT.Factorization.Convolution.Basic`, so that the longitudinal convolution algebra
of `EpsilonEridani.QFT.Factorization.Convolution.Collinear` and
`EpsilonEridani.QFT.Factorization.Convolution.Properties` applies to the `x` and `z` dependence.

Prove: bilinearity; the effect of the delta function, namely that the convolution is an ordinary
two-dimensional convolution after rescaling; boundedness on the relevant `L^p` spaces using
`TauCeti.Analysis.Holder.Lp`; and the factorisation of the transform, that the convolution becomes
a pointwise product in `b_T` space. The last of these is the structural reason Layer 3 works in
`b_T` and is proved here rather than assumed there.

### 2.3 Rapidity divergences and regulators

Define the naive unsubtracted correlator — the object of Layer 0.4 with the light-cone limit taken
— and prove that it is divergent: state the divergence as the non-convergence of the `xi^-`
integral at large `xi^-` in the light-cone limit, exhibited on the one-gluon-exchange integrand.
This is the theorem that the naive object of Convention 3 is not a distribution.

Define the soft factor as the vacuum matrix element of two links, and prove that it carries the
same divergence with the opposite sign in the combination that appears in Layer 2.4.

Define a **rapidity regulator** as a structure: a family of deformations of the link definition
indexed by a parameter, with the properties that the regulated correlator is finite for non-zero
parameter, that gauge invariance is preserved, and that the divergence appears as a pole or a
logarithm in the parameter. Instantiate three: the off-light-cone deformation of Collins, the
exponential regulator, and the analytic regulator of the rapidity renormalisation group. This is
new material; no upstream module has a notion of a regulator.

Prove the **cancellation theorem**: in the combination of distribution, fragmentation function and
the square root of the soft factor that Layer 2.4 uses, the regulator dependence cancels, so the
combination has a finite limit as the parameter is removed. Prove it for each of the three
regulators, and prove that the three limits agree, per Convention 9.

### 2.4 The factorisation theorem

State the theorem: at leading power in the region of Layer 2.1, the semi-inclusive structure
functions are, for each azimuthal modulation, a hard factor times a transverse convolution of a
properly defined distribution against a properly defined fragmentation function, both at
renormalisation scale `mu` and rapidity scale `zeta`, with the soft factor absorbed by the scheme
of Layer 2.3. Express it through the interfaces of
`EpsilonEridani.QFT.Factorization.Basic` and
`EpsilonEridani.QFT.Factorization.Scales.Basic`, extending the latter with the rapidity scale.

State every hypothesis explicitly and separately: the region completeness of Layer 2.1; the
validity of the eikonal approximation for spectator interactions; the cancellation of Glauber-region
contributions; and the power counting. Of these, region completeness and Glauber cancellation are
**hypotheses of the theorem, not results of this roadmap**: they are the content of the
diagrammatic all-order arguments in the literature, and the roadmap states them as named
assumptions so that every downstream result is explicitly conditional on them. Layer 2.4 proves
the theorem *given* the hypotheses, and proves the hypotheses at one loop for the one-gluon
exchange contribution, which is a genuine check and is not an all-order proof.

Derive here the path assignment of Layer 1.3: the eikonal approximation to final-state interaction
with the struck quark produces the future-pointing staple, and to initial-state interaction in the
annihilation process the past-pointing staple. This closes the forward reference in Layer 1.3.

### 2.5 The properly defined distribution and the inverse problem

Define the two-scale distribution `F(x, b_T ; mu, zeta)` as the object produced by Layer 2.3, and
prove that it satisfies the common-interface consistency conditions of
`EpsilonEridani.Particles.Parton.Unified.Basic` and
`EpsilonEridani.Particles.Parton.Unified.Consistency`. Prove that it is independent of the
regulator and depends on the scheme only through a named, computable multiplicative factor, and
exhibit that factor for each of the three regulators of Layer 2.3.

State the inverse-problem content of Layer 2.2: the map from a pair (distribution, fragmentation
function) to the set of structure functions factors through the transverse convolution operator,
which is compact on the relevant spaces. Prove compactness using
`TauCeti.Analysis.Fredholm.Criteria` and `TauCeti.Analysis.Fredholm.CompactPerturbation`, and
prove that it therefore has a non-trivial kernel: there are pairs of functions producing identical
structure functions at fixed `x`, `z` and `Q`. This is a theorem about what the measurement
determines, and it is the honest form of the statement that a single asymmetry does not determine a
distribution.

### 2.6 What Layer 2 leaves open

Two statements are recorded as open questions and are not milestones:

- Whether the positivity bounds of Layer 1.6 hold for the properly defined two-scale distribution
  of Layer 2.5. The subtraction and the scheme factor are not positivity-preserving operations, and
  the roadmap does not claim they are. What can be proved and is in scope: the bounds hold for the
  naive correlator; the leading-order scheme factor is positive; and the bounds are violated at
  most at the order of the first non-trivial term in the scheme factor. The general statement is
  open.
- Whether the three regulators of Layer 2.3 exhaust the regulators satisfying the structure's
  axioms. Layer 2.3 proves the three agree; it does not claim that any regulator satisfying the
  axioms gives the same limit, and that universality statement is open.

### Examples

- One-gluon exchange at order `alpha_s`: compute the rapidity divergence explicitly in each of the
  three regulators and verify the cancellation theorem of Layer 2.3 in each.
- The `f_1 D_1` structure function at leading order: verify that the transverse convolution reduces
  to the Gaussian convolution formula when both arguments are Gaussian in transverse momentum, and
  that the widths add.
- Two distinct Gaussian pairs with the same product of widths: exhibit them as an explicit element
  of the kernel of Layer 2.5, so that the non-uniqueness statement has a witness rather than only
  a compactness argument.

### Dependencies

Layers 0 and 1. `EpsilonEridani.Particles.Parton.TMD.PowerCorrections`;
`EpsilonEridani.QFT.Factorization.Basic`, `.Scales.Basic`, `.Convolution.Basic`,
`.Convolution.Collinear`, `.Convolution.Properties`;
`EpsilonEridani.Particles.Fragmentation.Basic`; `EpsilonEridani.Particles.Parton.Unified.Basic`
and `.Consistency`; `EpsilonEridani.QFT.QCD.Renormalization`; `TauCeti.Analysis.Holder.Lp`;
`TauCeti.Analysis.Fredholm.Criteria` and `.CompactPerturbation`. `Hadronization` for the
transverse-momentum-dependent fragmentation functions. `CollinearEvolution` for the running
coupling in which the hard factor is expanded.

---

## Layer 3: evolution in two scales, and locality in impact-parameter space

References: Collins and Soper, *Nucl. Phys.* B193 (1981) 381; Collins, Soper and Sterman (1985);
Collins (2011), chapter 13; Aybat and Rogers, *Phys. Rev.* D83 (2011) 114042; Echevarria, Idilbi,
Schafer and Scimemi, *Eur. Phys. J.* C73 (2013) 2636; Scimemi and Vladimirov, *Eur. Phys. J.* C78
(2018) 89.

### 3.1 The two evolution equations

Define the Collins-Soper equation and the renormalisation-group equation as the pair

```
d log F(x, b_T ; mu, zeta) / d log sqrt(zeta)  =  K(b_T ; mu)
d log F(x, b_T ; mu, zeta) / d log mu          =  gamma_F(mu ; zeta)
```

with `K` the Collins-Soper kernel and `gamma_F` the anomalous dimension of the distribution. State
them as weak-derivative equations using `TauCeti.Analysis.Sobolev.WeakDeriv.Basic`, since the
distributions are not assumed differentiable in `b_T` and the equations are in the scales only.
`EpsilonEridani.Particles.Parton.TMD.CollinsSoper` is the existing base and is extended here.

Prove that `K` is independent of `x` and of `zeta`, and that `gamma_F` depends on `b_T` only
through the combination that the consistency condition of Layer 3.4 fixes. Both are consequences of
the definition in Layer 2.5 together with the multiplicative renormalisation of the link
operators, and both are the statements that make the equations solvable.

### 3.2 The transform to impact-parameter space

Define the two-dimensional transform between the `k_T` and `b_T` representations with the
convention of `TauCeti.Analysis.Bochner.Fourier.Convention` and
`Mathlib.Analysis.Fourier.FourierTransform`. Prove that for a distribution depending on `k_T` only
through `k_T^2` and the fixed transverse structures of Layer 1.1, the transform reduces to a
radial transform: order zero for the structures with no free transverse index, order one for those
linear in `k_T`, order two for `h_1T^perp`. State exactly which Bessel functions are needed and
which of their properties — the differential equation, the small-argument series, the large-argument
asymptotics and the orthogonality relation — and take them from `LightNuclei`, per the absence noted
above.

Prove the inversion theorem under stated hypotheses, using `TauCeti.Analysis.Fourier.Integrable`
for integrability, `TauCeti.Analysis.Fourier.Decay` for the decay needed by the inverse, and
`TauCeti.Analysis.Fourier.RiemannLebesgue` for the vanishing at large `b_T`. State the hypotheses
as conditions on the large-`k_T` tail, and prove that the tail permitted by Layer 1.5 satisfies
them for every transform order except order zero, where the logarithmic divergence of Layer 1.5
reappears as a non-integrable singularity of the transform at `b_T = 0`. The consequence — that the
`b_T -> 0` limit is where matching to collinear factorisation must happen — is Layer 4.

Prove that positivity in `k_T` does not imply positivity in `b_T`, citing
`TauCeti.Analysis.PositiveDefinite.SemigroupGroup.FourierLaplace.PositiveDefinite`. This is the
obstruction to reading the `b_T`-space distribution as a density, and it is the reason every
physical statement in Layer 5 is made in `k_T` space.

### 3.3 Locality and the semigroup

Prove the theorem that in `b_T` space the Collins-Soper evolution is multiplicative: the
right-hand side of the first equation in Layer 3.1 is multiplication by a function of `b_T`, so the
solution operator at fixed `b_T` is a scalar. Hence the evolution in `log sqrt(zeta)` is a
one-parameter semigroup whose generator is multiplication by `K`, an instance of
`TauCeti.Analysis.Semigroups.Multiplication`, with the abstract framework of
`TauCeti.Analysis.Semigroups.Defs` and `TauCeti.Analysis.Semigroups.Generator`. Existence and
uniqueness of the solution to the initial-value problem are `TauCeti.Analysis.Semigroups.CauchyProblem.Basic`
and `.Uniqueness`, not reproved.

Prove that the semigroup extends to a group, using `TauCeti.Analysis.Semigroups.Group.Basic`, since
evolution downward in rapidity is the inverse of evolution upward, and assemble the two equations
of Layer 3.1 into a two-parameter flow on the `(mu, zeta)` plane using
`TauCeti.Analysis.Semigroups.Group.Flow`. Prove the growth bound on the solution operator with
`TauCeti.Analysis.Semigroups.GrowthBound`, and state the resulting bound on the evolved
distribution at large `b_T`.

Write the solution in closed form:

```
F(x, b_T ; mu_f, zeta_f) =
  F(x, b_T ; mu_i, zeta_i)
  * exp( K(b_T ; mu_i) * log( sqrt(zeta_f) / sqrt(zeta_i) ) )
  * exp( integral from mu_i to mu_f of  d mu / mu * gamma_F(mu ; zeta_f) )
```

and prove that it solves both equations, and that it is path-independent in the `(mu, zeta)` plane
if and only if the consistency condition of Layer 3.4 holds.

### 3.4 Consistency, the cusp anomalous dimension, and the perturbative kernel

Prove the **consistency theorem**: the two evolution equations of Layer 3.1 commute, which is the
single equation

```
d K(b_T ; mu) / d log mu  =  - Gamma_cusp(alpha_s(mu))
```

with `Gamma_cusp` independent of `b_T`. Prove it as the equality of the mixed second derivatives of
`log F`, with the hypothesis that `log F` is twice weakly differentiable in the scales, and present
it in the pattern of `EpsilonEridani.QFT.Factorization.Evolution.Consistency`. Define
`Gamma_cusp` as the object appearing in this equation — the only characterisation the roadmap
uses — since no cusp anomalous dimension exists upstream.

Prove that the consistency condition determines the `b_T` dependence of `gamma_F` completely, up to
a `b_T`-independent function of `mu` and `zeta`, and exhibit that function.

Compute the perturbative expansion of `K` at small `b_T` to one loop, and state the two-loop result
with the weight-two functions it requires, built in Layer 4.4. Prove the one-loop result from the
definition of the soft factor in Layer 2.3.

State the large-`b_T` behaviour honestly: `K` at large `b_T` is not calculable in perturbation
theory and is defined here as a function to be determined, subject to the constraints the roadmap
can prove — the consistency condition of this subsection, which fixes its `mu` dependence
completely at every `b_T`, and the growth bound of Layer 3.3. The admissible class is characterised
using the integral representation of `TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`. No
model of the large-`b_T` kernel is adopted, and no statement in the roadmap depends on one.

### 3.5 The relation to the Sudakov exponent

Prove that in the regime where both `mu` and `sqrt(zeta)` are taken to the hard scale and `K` is
replaced by its one-loop perturbative form, the exponential of Layer 3.3 equals the Sudakov
exponent of `EpsilonEridani.QFT.Shower.Sudakov` with the double-logarithmic and single-logarithmic
coefficients identified explicitly. State the identification as a theorem with the regime as a
hypothesis, so that the correspondence between resummed transverse-momentum-dependent evolution and
a parton-shower Sudakov factor is a proved statement in a stated limit and not an analogy.

### Examples

- A Gaussian distribution in `k_T`: transform it, evolve it, transform back, and prove that the
  width grows logarithmically with `zeta` at one loop.
- The one-loop kernel: verify the consistency condition of Layer 3.4 explicitly at order
  `alpha_s`.
- A distribution whose `k_T` tail is exactly the leading large-`k_T` behaviour of Layer 1.5:
  exhibit the non-integrable `b_T -> 0` singularity of Layer 3.2 explicitly, as the concrete form
  of the obstruction that Layer 4 resolves.
- Evolution around a closed loop in the `(mu, zeta)` plane: verify path independence given
  consistency, and exhibit the non-zero holonomy when the consistency condition is violated by
  hand.

### Dependencies

Layers 0, 1 and 2. `EpsilonEridani.Particles.Parton.TMD.CollinsSoper`;
`EpsilonEridani.QFT.Factorization.Evolution.Basic`, `.Consistency` and `.Solutions`;
`EpsilonEridani.QFT.Shower.Sudakov`; `EpsilonEridani.QFT.QCD.Renormalization`;
`TauCeti.Analysis.Semigroups.Defs`, `.Generator`, `.Generator.Basic`, `.CauchyProblem.Basic`,
`.CauchyProblem.Uniqueness`, `.Multiplication`, `.Group.Basic`, `.Group.Flow`, `.GrowthBound`;
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`; `TauCeti.Analysis.Bochner.Fourier.Convention`;
`TauCeti.Analysis.Fourier.Integrable`, `.Decay`, `.RiemannLebesgue`;
`TauCeti.Analysis.PositiveDefinite.SemigroupGroup.FourierLaplace.PositiveDefinite`;
`TauCeti.Analysis.CompletelyMonotone.Stieltjes.Laplace`;
`Mathlib.Analysis.Fourier.FourierTransform`. `LightNuclei` for the Bessel functions.
`CollinearEvolution` for the running coupling.

---

## Layer 4: matching to collinear factorisation

References: Collins, Soper and Sterman (1985), sections 5 and 6; Collins (2011), chapter 13;
Aybat and Rogers (2011); Echevarria, Idilbi, Scimemi, *Phys. Lett.* B726 (2013) 795; Bacchetta,
Bozzi, Lambertsen, Piacenza, Steiglechner and Vogelsang, *Phys. Rev.* D100 (2019) 014018.

### 4.1 The small-distance operator-product expansion

State and prove, at one loop, the expansion

```
F(x, b_T ; mu, zeta)  =  sum over j of  ( C_{ij}(mu, zeta, b_T) convolved in x with f_j(x, mu) )
                         +  corrections of order  b_T^2 Lambda^2
```

with `f_j` the collinear densities of `SpinStructure` and `CollinearEvolution`, the convolution the
longitudinal one of `EpsilonEridani.QFT.Factorization.Convolution.Collinear`, and `C` a matching
coefficient. Prove that this is the correct replacement for the divergent integral of Layer 1.5:
the relation between a transverse-momentum-dependent and a collinear density is a convolution with
a perturbative coefficient, not an integral. Prove the consistency of the expansion with the
evolution of Layer 3 — that evolving the left side and evolving the collinear densities on the
right with the kernels of `CollinearEvolution` are compatible, which determines the `mu` and
`zeta` dependence of `C` completely.

Prove which of the eight distributions admit such an expansion onto a *collinear* density: `f_1`
onto the unpolarised density, `g_1L` onto the helicity density, `h_1` onto transversity, and the
T-odd and higher-structure functions onto twist-three collinear correlators from
`MultiPartonCorrelations` instead. State the last case with its own coefficient and do not conflate
the two.

### 4.2 The large-transverse-momentum description

State the collinear-factorisation formula for the semi-inclusive cross section at
`|P_hT|` of order `Q`, with collinear densities and fragmentation functions and a hard coefficient,
using `EpsilonEridani.QFT.Factorization.DIS.HardKernel` conventions for the hard function through
`EpsilonEridani.QFT.Factorization.Basic`. Prove that in the limit of small `|P_hT|` this formula
develops logarithms of `|P_hT|/Q` to all orders, and identify the coefficient of the leading
logarithm at one loop with the corresponding term in the expansion of the resummed form of
Layer 3.3. This identification is the content of the matching and is proved, not asserted.

### 4.3 The intermediate region and the subtraction

Define the intermediate region by the hypothesis `Lambda << |P_hT| << Q` and prove that both the
description of Layer 2.4 and the description of Layer 4.2 are valid there at leading power in their
respective expansion parameters. Define the combined cross section as

```
dSigma  =  W  +  Y,      Y  =  (fixed order)  -  (asymptotic expansion of W)
```

with `W` the resummed transverse-momentum-dependent term and the subtraction term the expansion of
`W` to the same fixed order. Prove: the sum reduces to `W` up to power corrections at small
`|P_hT|`, and to the fixed-order result up to power corrections at large `|P_hT|`; the double
counting is removed exactly at the order to which the subtraction is computed; and the sum is
continuous across the region.

State the limitation honestly: the subtraction removes double counting order by order, and the
size of the residual mismatch is a power correction whose coefficient this roadmap does not
compute. That coefficient is not a milestone.

### 4.4 The special functions the coefficients need

Build the weight-two and weight-three functions appearing in the matching coefficients at
next-to-leading and next-to-next-to-leading order, and in the two-loop Collins-Soper kernel:
the dilogarithm and the trilogarithm, and the nested harmonic sums of the same weights. Neither
Mathlib nor TauCeti has them.

For each, supply what a special function needs in the shape Mathlib would want: a definition by a
convergent series or an integral, the analytic continuation to the region used, the functional
equations used in simplifying the coefficients, and the values at the specific arguments that
appear. Use `TauCeti.Analysis.SpecialFunctions.Beta` and
`Mathlib.Analysis.SpecialFunctions.Gamma.Basic` for the Mellin-space integrals that produce them,
and `EpsilonEridani.QFT.Factorization.Convolution.Mellin` for the transform in which the
coefficients are most compactly stated.

Every statement in Layers 1, 2, 3 and 5 is independent of the explicit form of these coefficients;
this subsection supplies them so that the matching of Layers 4.1 to 4.3 can be made numerical, and
nothing else in the roadmap waits on it.

### Examples

- The one-loop matching coefficient for `f_1`: compute it, and verify the evolution consistency of
  Layer 4.1 against the one-loop splitting kernels of `CollinearEvolution`.
- The leading logarithm at order `alpha_s`: compute it from Layer 4.2 and from the expansion of
  Layer 3.3, and verify the two agree — the smallest complete instance of the matching.
- A Gaussian model plus the perturbative tail: verify that the subtraction of Layer 4.3 is
  continuous and that removing it produces a visible double-counted logarithm.
- The dilogarithm identity used in the next-to-leading-order coefficient: prove it from the
  functional equations of Layer 4.4.

### Dependencies

Layers 0 to 3. `EpsilonEridani.QFT.Factorization.Basic`, `.Convolution.Collinear`,
`.Convolution.Mellin`; `EpsilonEridani.Particles.Parton.TMD.Reduction` and `.PowerCorrections`;
`TauCeti.Analysis.SpecialFunctions.Beta`; `Mathlib.Analysis.SpecialFunctions.Gamma.Basic`.
`CollinearEvolution` for the splitting kernels, the running coupling and the collinear evolution
against which the matching is checked. `SpinStructure` for the polarised collinear densities.
`MultiPartonCorrelations` for the twist-three targets of the T-odd matching.

---

## Layer 5: the azimuthal structure functions and the asymmetries

References: Bacchetta, Diehl, Goeke, Metz, Mulders and Schlegel, *JHEP* 02 (2007) 093; Boer and
Mulders (1998); Sivers, *Phys. Rev.* D41 (1990) 83; Collins, *Nucl. Phys.* B396 (1993) 161;
Bacchetta, D'Alesio, Diehl and Miller (2004); Diehl and Sapeta, *Eur. Phys. J.* C41 (2005) 515;
Wandzura and Wilczek, *Phys. Lett.* B72 (1977) 195; Avakian, Efremov, Schweitzer and Yuan,
*Phys. Rev.* D83 (2011) 054010.

### 5.1 The cross section as a finite Fourier series

Prove that the semi-inclusive cross section, at fixed `x`, `y`, `z` and `|P_hT|`, is a finite
Fourier series in `phi_h` and `phi_S` with exactly eighteen independent coefficients for a
polarised beam and a polarised target. State it as the theorem that the hadronic tensor of
`EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`, contracted with the leptonic tensor and
decomposed in the frame of Layer 0.3, has that many independent components, with the hypotheses
being hermiticity, parity, and the one-photon-exchange approximation. Use
`TauCeti.Analysis.Fourier.AddCircle` for the harmonic decomposition and its completeness, and
build on `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Asymmetries.Harmonics`.

Name the eighteen structure functions by their beam and target polarisation labels and their
modulation. The unpolarised-beam, unpolarised-target set is `F_UU,T`, `F_UU,L`,
`F_UU^{cos phi_h}` and `F_UU^{cos 2 phi_h}`; the polarised-beam, unpolarised-target set is
`F_LU^{sin phi_h}`; the longitudinal-target sets are `F_UL^{sin phi_h}`, `F_UL^{sin 2 phi_h}`,
`F_LL` and `F_LL^{cos phi_h}`; the transverse-target sets are
`F_UT,T^{sin(phi_h - phi_S)}`, `F_UT,L^{sin(phi_h - phi_S)}`, `F_UT^{sin(phi_h + phi_S)}`,
`F_UT^{sin(3 phi_h - phi_S)}`, `F_UT^{sin phi_S}`, `F_UT^{sin(2 phi_h - phi_S)}`,
`F_LT^{cos(phi_h - phi_S)}`, `F_LT^{cos phi_S}` and `F_LT^{cos(2 phi_h - phi_S)}`. Prove that
these eighteen are independent, by exhibiting eighteen kinematic configurations that separate them.

### 5.2 The eight leading-twist identifications

Prove, from the factorisation theorem of Layer 2.4, that eight of the eighteen structure functions
are leading power and that each equals one transverse convolution of one distribution against one
fragmentation function. The identifications are:

- `F_UU,T = C[1 ; f_1 ; D_1]`.
- `F_LL = C[1 ; g_1L ; D_1]`, with the weight given by the longitudinal polarisations.
- `F_UT,T^{sin(phi_h - phi_S)} = C[w_Siv ; f_1T^perp ; D_1]` — the **Sivers** structure function,
  with `w_Siv` the weight linear in the transverse momentum projected on the direction
  perpendicular to the spin.
- `F_UT^{sin(phi_h + phi_S)} = C[w_Col ; h_1 ; H_1^perp]` — the **Collins** structure function,
  with `H_1^perp` the Collins fragmentation function from `Hadronization`.
- `F_UU^{cos 2 phi_h} = C[w_BM ; h_1^perp ; H_1^perp]` — the **Boer-Mulders** structure function.
- `F_UL^{sin 2 phi_h} = C[w ; h_1L^perp ; H_1^perp]`.
- `F_LT^{cos(phi_h - phi_S)} = C[w ; g_1T ; D_1]`.
- `F_UT^{sin(3 phi_h - phi_S)} = C[w_pretz ; h_1T^perp ; H_1^perp]` — the **pretzelosity**
  structure function, with the weight cubic in transverse momentum.

Prove each weight explicitly from the transverse tensor structures of Layer 1.1 contracted with the
fragmentation structures, so that each weight is derived and not quoted. Prove the completeness
statement: these eight are exactly the leading-power entries, so the remaining ten are suppressed
by one power of `1/Q`, and the pairing between the eight distributions of Layer 1.1 and the eight
leading-power modulations is a bijection.

### 5.3 The measured asymmetries

Define an asymmetry as a ratio of a structure function to `F_UU,T` weighted by the depolarisation
factors, with the factors written out from the leptonic tensor of Layer 5.1. Define the Sivers,
Collins and Boer-Mulders asymmetries as the three named ratios, and prove, for each, the relation
between the asymmetry and the transverse moment of Layer 1.5 in the Gaussian case, stating the
Gaussian ansatz as an explicit hypothesis of that relation and not of the definition.

Define the transverse-momentum-weighted asymmetries as integrals of the structure functions against
powers of `|P_hT|`, and prove the theorem that makes them useful: the weighted asymmetry factorises
into a product of a transverse moment of the distribution and a moment of the fragmentation
function, with no convolution left. Prove the ultraviolet convergence condition for each weight
from Layer 1.5, and identify which weighted asymmetries have convergent defining integrals and
which do not.

### 5.4 The Sivers sign change

State the prediction: with the Trento convention of Layer 0.3 fixed, the Sivers function extracted
from semi-inclusive deep-inelastic scattering and the Sivers function extracted from the Drell-Yan
annihilation process satisfy

```
f_1T^perp (from Drell-Yan)  =  - f_1T^perp (from semi-inclusive DIS)
```

and prove it as a corollary of Layer 1.4 together with the path assignment derived in Layer 2.4.
Prove the corresponding statement for the Boer-Mulders function, which appears in the
`cos 2 phi` modulation of the annihilation process.

Record the epistemic status precisely. The sign change is a theorem of the framework, conditional
on exactly the hypotheses of Layer 2.4 — region completeness and Glauber cancellation — and on
time-reversal invariance. It is therefore the sharpest available test: a measurement inconsistent
with it falsifies one of those named hypotheses, and the roadmap's statement of the theorem makes
clear which ones. Prove the two auxiliary statements needed for the test to be a test: that the
extraction from each process determines the distribution up to the kernel of Layer 2.5, and that
the kernel does not contain a sign flip of the whole function, so the prediction is not vacuous.

### 5.5 The subleading-twist structure functions

Prove that the remaining ten structure functions are suppressed by one power of `1/Q` and express
each, at that order, in terms of twist-three distributions and twist-three fragmentation functions.
The twist-three collinear correlators are taken from `MultiPartonCorrelations`; the twist-three
fragmentation functions from `Hadronization`. Identify which of the ten reduce, on taking a
transverse moment, to a twist-three collinear correlator, and which involve a genuinely
transverse-momentum-dependent twist-three function with no collinear reduction.

State clearly what is and is not proved. Factorisation at subleading power is **not** established
in the literature at the level of Layer 2.4; the expressions of this subsection are the leading
tree-level results in the parton-model-with-gauge-links analysis, and Layer 5.5 states them with
that as an explicit hypothesis. A result derived from them is labelled as depending on the
tree-level subleading analysis. This is an honest-incompleteness statement, not a milestone that
can be discharged by proving a stronger theorem here.

### 5.6 Wandzura-Wilczek-type relations as named hypotheses

Define the Wandzura-Wilczek-type approximation as the hypothesis that the genuine twist-three
"tilde" functions of Layer 1.5 vanish, and derive, conditional on it, the relations expressing the
first moment of `g_1T` as an integral of the collinear helicity density and the first moment of
`h_1L^perp` as an integral of transversity.

Keep these strictly separated from the exact decompositions of Layer 1.5. Concretely: the
approximation is a named hypothesis appearing in the statement of every lemma that uses it, never a
rewriting step, and the exact relation with both terms present is the default. Prove the one exact
statement available in the neighbourhood: the Lorentz-invariance relations among the moments that
hold without the approximation, and the theorem that they are *not* sufficient to derive the
Wandzura-Wilczek-type relations, so the approximation is an independent assumption.

### Examples

- The `F_UU,T` structure function with Gaussian distribution and fragmentation functions: compute
  it in closed form and verify the width addition of Layer 2.2.
- The Sivers asymmetry in the scalar-diquark spectator model with a Gaussian fragmentation
  function: compute the full `sin(phi_h - phi_S)` modulation and verify its sign against the
  Trento convention.
- The pretzelosity weight: verify from Layer 5.2 that it produces exactly the
  `sin(3 phi_h - phi_S)` modulation and no other, which is the check that the bijection of
  Layer 5.2 is correct at the level of the weights.
- The transverse-momentum-weighted Sivers asymmetry: verify that it equals the product of the first
  moment of `f_1T^perp` and the zeroth moment of `D_1`, and that the defining integral converges
  under the tail hypothesis of Layer 1.5.
- A model saturating the Wandzura-Wilczek-type relation and one violating it: exhibit both, which
  is the concrete proof that the relation is an assumption.

### Dependencies

Layers 0 to 4. `EpsilonEridani.QFT.Scattering.DIS.SIDIS.Basic`, `.Asymmetries.Basic`,
`.Asymmetries.Harmonics`; `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic`;
`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds`;
`EpsilonEridani.Particles.Fragmentation.Basic`; `TauCeti.Analysis.Fourier.AddCircle`.
`Hadronization` for `D_1`, `H_1^perp` and the twist-three fragmentation functions.
`MultiPartonCorrelations` for the twist-three collinear correlators. `SpinStructure` for the
collinear densities in Layer 5.6. `RadiativeCorrections` for the photon-radiation corrections that
must be removed before any asymmetry here is compared with data; this roadmap defines the
asymmetries at the level of the one-photon-exchange cross section and says so.

---

## Dependency graph

```
Layer 0  kinematics, frames, correlator
   |          (Layer 0.4 uses the link interface defined in Layer 1.2;
   |           stated for an arbitrary link, so not circular)
   v
Layer 1  eight distributions, gauge link, T-odd sign change, moments, positivity
   |          <- SpinStructure (collinear f_1, g_1, h_1, g_T, h_L)
   |          <- MultiPartonCorrelations (twist-three correlators)
   |          <- SmallXAndSaturation (small-x gluon link structures)
   v
Layer 2  factorisation, rapidity divergences, the two-scale definition
   |          <- Hadronization (TMD fragmentation functions)
   |          (Layer 2.4 closes the forward reference of Layer 1.3)
   v
Layer 3  Collins-Soper and RG evolution, b_T-space locality, the kernel
   |          <- LightNuclei (Bessel functions)
   |          <- CollinearEvolution (running coupling)
   v
Layer 4  matching to collinear factorisation, the Y-term, the special functions
   |          <- CollinearEvolution (splitting kernels)
   v
Layer 5  eighteen structure functions, Sivers / Collins / Boer-Mulders,
         the sign change, subleading twist, WW-type hypotheses
              <- Hadronization (D_1, H_1^perp, twist-three FFs)
              <- RadiativeCorrections (removal of QED modulations)

Consumers: WignerDistributions takes the TMD as a marginal of the Wigner
distribution; GeneralizedPartonDistributions shares no variable with Layer 3
(see Convention 4); NuclearMedium takes Layers 1 to 3 and adds a nuclear target.
```

## Acceptance examples

The roadmap is complete when each of the following is a statement in the library with a proof or,
where marked, an explicitly named hypothesis:

1. `tmd_decomposition_complete`: the space of leading-twist tensor structures for a spin-half
   target consistent with hermiticity and parity has dimension eight, and the eight structures of
   Layer 1.1 are a basis.
2. `gauge_link_transverse_not_removable`: in light-cone gauge, omitting the transverse link at
   light-cone infinity gives a correlator different from the covariant-gauge one.
3. `t_odd_sign_change`: quantified over the T-odd distributions, the future-staple and past-staple
   distributions differ by a sign; and quantified over the T-even ones, they agree.
4. `t_odd_vanishes_straight_link`: a T-odd distribution defined with a straight-line link is
   identically zero.
5. `first_moment_sivers_eq_qiu_sterman`: the first transverse moment of `f_1T^perp` equals the
   Qiu-Sterman function at the diagonal point, with the normalisation of Convention 7.
6. `zeroth_moment_f1_log_divergent`: the integral of the leading large-`k_T` tail of `f_1` over
   `|k_T| < Lambda` grows like `log Lambda`, so the reduction to a collinear density is not an
   integral.
7. `positivity_matrix_psd` and its minors `f1_nonneg`, `abs_g1L_le_f1`, `soffer_tmd`,
   `sivers_bound`, `boer_mulders_bound`, `pretzelosity_bound`: one matrix statement and its
   corollaries.
8. `rapidity_divergence_naive`: the naive light-cone correlator's defining integral diverges.
9. `rapidity_cancellation`: for each of the three regulators of Layer 2.3, the combination of
   distribution, fragmentation function and the square root of the soft factor has a finite limit,
   and the three limits agree.
10. `sidis_factorization`: the leading-power factorisation theorem, with region completeness,
    eikonal validity, Glauber cancellation and the power counting as four separately named
    hypotheses.
11. `link_direction_from_colour_flow`: the eikonal approximation gives the future staple for
    semi-inclusive deep-inelastic scattering and the past staple for the annihilation process.
12. `transverse_convolution_compact` and `transverse_convolution_kernel_nontrivial`: the operator
    is compact and has a non-trivial kernel, with an explicit Gaussian witness.
13. `cs_evolution_multiplicative_in_bT`: in impact-parameter space the Collins-Soper generator is
    multiplication by the kernel, exhibited as an instance of the upstream multiplication semigroup.
14. `cs_solution_closed_form`: the exponentiated solution solves both evolution equations.
15. `evolution_consistency`: the mixed derivatives commute, equivalently the `mu` derivative of the
    Collins-Soper kernel is minus the cusp anomalous dimension, which is `b_T`-independent.
16. `cs_kernel_one_loop`: the one-loop Collins-Soper kernel, derived from the soft factor.
17. `bT_positivity_obstruction`: positivity in `k_T` does not imply positivity in `b_T`.
18. `sudakov_correspondence`: in the stated double-logarithmic regime, the evolution exponential
    equals the upstream Sudakov exponent with identified coefficients.
19. `small_bT_matching`: the operator-product expansion of the distribution onto collinear
    densities with a matching coefficient, and the evolution consistency that fixes the
    coefficient's scale dependence.
20. `w_plus_y_continuity`: the combined cross section reduces to each description in its own limit
    and the double counting cancels to the order computed.
21. `sidis_eighteen_structure_functions`: the cross section is a finite Fourier series with exactly
    eighteen independent coefficients, with eighteen configurations that separate them.
22. `leading_twist_bijection`: exactly eight of the eighteen are leading power, and the map from
    the eight distributions to those eight modulations is a bijection, with every weight derived.
23. `sivers_sign_change`: the Sivers function from the annihilation process is minus the Sivers
    function from semi-inclusive deep-inelastic scattering, as a corollary of item 3 and item 11,
    with the Trento convention fixed and with the non-vacuity statement of Layer 5.4.
24. `weighted_asymmetry_factorizes`: the transverse-momentum-weighted asymmetry equals a product of
    a distribution moment and a fragmentation moment, with the convergence condition.
25. `ww_type_relations_conditional`: the Wandzura-Wilczek-type relations, stated with the vanishing
    of the genuine twist-three functions as an explicit hypothesis, together with the theorem that
    the Lorentz-invariance relations do not imply them.

Two statements are explicitly **not** acceptance criteria, and are recorded in Layer 2.6 as open:
whether the positivity bounds survive the two-scale definition, and whether every regulator
satisfying the axioms of Layer 2.3 yields the same limit.

## References

- D. W. Sivers, "Single-spin production asymmetries from the hard scattering of pointlike
  constituents", *Phys. Rev.* D41 (1990) 83.
- J. C. Collins, "Fragmentation of transversely polarized quarks probed in transverse momentum
  distributions", *Nucl. Phys.* B396 (1993) 161.
- J. C. Collins and D. E. Soper, "Back-to-back jets in QCD", *Nucl. Phys.* B193 (1981) 381.
- J. C. Collins, D. E. Soper and G. Sterman, "Transverse momentum distribution in Drell-Yan pair
  and W and Z boson production", *Nucl. Phys.* B250 (1985) 199.
- P. J. Mulders and R. D. Tangerman, "The complete tree-level result up to order 1/Q for polarized
  deep-inelastic leptoproduction", *Nucl. Phys.* B461 (1996) 197.
- D. Boer and P. J. Mulders, "Time-reversal odd distribution functions in leptoproduction",
  *Phys. Rev.* D57 (1998) 5780.
- S. J. Brodsky, D. S. Hwang and I. Schmidt, "Final-state interactions and single-spin asymmetries
  in semi-inclusive deep inelastic scattering", *Phys. Lett.* B530 (2002) 99.
- J. C. Collins, "Leading-twist single-transverse-spin asymmetries: Drell-Yan and deep-inelastic
  scattering", *Phys. Lett.* B536 (2002) 43.
- A. V. Belitsky, X. Ji and F. Yuan, "Final state interactions and gauge invariant parton
  distributions", *Nucl. Phys.* B656 (2003) 165.
- A. Bacchetta, M. Boglione, A. Henneman and P. J. Mulders, "Bounds on transverse momentum
  dependent distribution and fragmentation functions", *Phys. Rev. Lett.* 85 (2000) 712.
- P. J. Mulders and J. Rodrigues, "Transverse momentum dependence in gluon distribution and
  fragmentation functions", *Phys. Rev.* D63 (2001) 094021.
- S. Meissner, A. Metz and K. Goeke, "Relations between generalized and transverse momentum
  dependent parton distributions", *Phys. Rev.* D76 (2007) 034002.
- A. Bacchetta, U. D'Alesio, M. Diehl and C. A. Miller, "Single-spin asymmetries: the Trento
  conventions", *Phys. Rev.* D70 (2004) 117504.
- A. Bacchetta, M. Diehl, K. Goeke, A. Metz, P. J. Mulders and M. Schlegel, "Semi-inclusive deep
  inelastic scattering at small transverse momentum", *JHEP* 02 (2007) 093.
- M. Diehl and S. Sapeta, "On the analysis of lepton scattering on longitudinally or transversely
  polarized protons", *Eur. Phys. J.* C41 (2005) 515.
- X. Ji, J.-P. Ma and F. Yuan, "Transverse-momentum-dependent parton distributions and
  semi-inclusive deep inelastic scattering", *Phys. Rev.* D71 (2005) 034005.
- J. C. Collins, *Foundations of Perturbative QCD*, Cambridge University Press (2011), chapters 10
  and 13.
- S. M. Aybat and T. C. Rogers, "TMD parton distribution and fragmentation functions with QCD
  evolution", *Phys. Rev.* D83 (2011) 114042.
- T. Becher and M. Neubert, "Drell-Yan production at small qT, transverse parton distributions and
  the collinear anomaly", *Eur. Phys. J.* C71 (2011) 1665.
- M. G. Echevarria, A. Idilbi and I. Scimemi, "Factorization theorem for Drell-Yan at low qT and
  transverse momentum distributions on-the-light-cone", *JHEP* 07 (2012) 002.
- J.-Y. Chiu, A. Jain, D. Neill and I. Z. Rothstein, "A formalism for the systematic treatment of
  rapidity logarithms in quantum field theory", *JHEP* 05 (2012) 084.
- M. G. Echevarria, A. Idilbi, A. Schafer and I. Scimemi, "Model-independent evolution of
  transverse momentum dependent distribution functions (TMDs) at NNLL",
  *Eur. Phys. J.* C73 (2013) 2636.
- M. G. Echevarria, A. Idilbi and I. Scimemi, "Soft and collinear factorization and
  transverse momentum dependent parton distribution functions", *Phys. Lett.* B726 (2013) 795.
- I. Scimemi and A. Vladimirov, "Analysis of vector boson production within TMD factorization",
  *Eur. Phys. J.* C78 (2018) 89.
- A. Bacchetta, G. Bozzi, M. Lambertsen, F. Piacenza, J. Steiglechner and W. Vogelsang,
  "Difficulties in a first-principles determination of the Collins-Soper kernel",
  *Phys. Rev.* D100 (2019) 014018.
- S. Wandzura and F. Wilczek, "Sum rules for spin-dependent electroproduction: test of relativistic
  constituent quarks", *Phys. Lett.* B72 (1977) 195.
- H. Avakian, A. V. Efremov, P. Schweitzer and F. Yuan, "The transverse momentum dependent
  distribution functions in the bag model", *Phys. Rev.* D83 (2011) 054010.
- R. Abdul Khalek et al., "Science requirements and detector concepts for the electron-ion
  collider: EIC Yellow Report", *Nucl. Phys.* A1026 (2022) 122447, arXiv:2103.05419, Volume II
  Chapter 7, subsection 7.2.3.

# Roadmap: photoproduction and ultra-peripheral collisions

Processes in which the exchanged photon is nearly on shell: the equivalent-photon description that
turns a charged beam into a photon beam, photoproduction cross sections off protons and nuclei, and
the coherent and incoherent channels that distinguish a nucleus surviving from a nucleus breaking
up. Ultra-peripheral collisions — collisions at impact parameters too large for hadronic
interaction, where the photon flux of one nucleus probes the other — are the setting in which this
description is used, and they are the subject of this roadmap.

The mathematical content is of three kinds, and the layers are organised by them. The first is a
factorisation of a classical field into a particle flux: the electromagnetic field of a charge in
uniform motion is decomposed into a spectrum of nearly real photons, the decomposition is exact
only in a limit, and the conditions of that limit are hypotheses that must travel with every
statement that uses the flux. The second is Fourier analysis on the transverse plane: nuclear form
factors, the diffractive minima that identify a coherent event, and the transverse profile
extracted from a momentum-transfer distribution are all one transform, and the question of when
that transform is a density rather than merely a function is Bochner's theorem. The third is
interference: a symmetric collision has two indistinguishable photon sources, their amplitudes add
with a definite relative sign, and the resulting structure has no analogue in fixed-target
photoproduction.

The final application is a statement of the coherent and incoherent photoproduction cross sections
off a heavy nucleus — the observables of Yellow Report subsection 7.3.9 — as theorems with every
hypothesis exposed: which step is the equivalent-photon approximation, which step is vector-meson
dominance, which step is the optical limit of Glauber theory, and which step is a genuine
consequence of the dipole amplitude built in `SmallXAndSaturation`. A cross section computed here
should be traceable to the exact list of assumptions that produced it, so that a disagreement with
data can be attributed to one of them.

Deeply virtual exclusive production, where the photon virtuality is the hard scale, is
`GeneralizedPartonDistributions`. The diffractive factorisation statement is `Diffraction`. This
roadmap owns the photon flux, the coherence structure, and the real-photon limit.

## Scope

Included:

- The equivalent-photon (Weizsäcker–Williams) approximation: its derivation from the boosted
  Coulomb field, the integrated flux as a function of photon energy, and the explicit hypotheses
  under which the factorised form holds.
- The coherence condition for emission from an extended charge, derived from the requirement that
  the photon not resolve the source, and the resulting bounds on photon virtuality and energy.
- The impact-parameter differential flux, the hadronic survival factor built from the nuclear
  thickness function, and the precise definition of "ultra-peripheral" that they support.
- The two-photon flux and luminosity for a pair of charged beams, the factorised form, and the
  impact-parameter correlation that the factorised form neglects.
- The photon light-cone wave functions: the splitting of a transverse or longitudinal photon into a
  quark–antiquark dipole, as a function of the dipole size, the longitudinal momentum fraction, the
  quark mass and the virtuality. These are the objects `SmallXAndSaturation` takes from this
  roadmap to convert dipole amplitudes into cross sections.
- The real-photon limit: the behaviour of the transverse and longitudinal structure functions as
  the virtuality vanishes, the relation of the photoproduction cross section to the transverse
  structure function, and the conditions under which the limit exists.
- Vector-meson dominance as a named hypothesis, stated so that predictions made under it are
  labelled and departures from it are attributable.
- Exclusive vector-meson photoproduction in the dipole formulation: the amplitude as an overlap of
  photon and vector-meson light-cone wave functions with the dipole amplitude, its energy
  dependence, and its momentum-transfer dependence.
- The transverse profile of the interaction as the Fourier transform of the momentum-transfer
  amplitude, and the conditions under which that transform is a density.
- Coherent photoproduction off a nucleus: the optical-limit amplitude, the nuclear form factor from
  a stated density profile, the diffractive minima as its zeros, and the corrections beyond the
  optical limit.
- Incoherent photoproduction, obtained by applying — not reproving — the Good–Walker decomposition
  of `Diffraction`, and the nuclear suppression of the coherent channel.
- The two-source interference peculiar to a symmetric collision, and the azimuthal and
  momentum-transfer structure it produces.
- The linear polarisation of the equivalent photons, which is fixed by the direction of the source's
  electric field, and the azimuthal modulations it induces.
- Photon–photon processes: light-by-light scattering, the Breit–Wheeler process, the transverse
  momentum of the produced pair, and their use as calibrations of the flux.

Not included. Deeply virtual Compton scattering, deeply virtual meson production at finite
virtuality, and the generalised parton distributions they access belong to
`GeneralizedPartonDistributions`; this roadmap uses the exclusive-amplitude vocabulary that area
establishes but does not restate its factorisation theorem. Inclusive and hard diffraction, the
diffractive parton distributions, the Regge amplitudes and the Good–Walker decomposition itself are
`Diffraction`. The dipole scattering amplitude, its rapidity evolution and the saturation scale are
`SmallXAndSaturation`; this roadmap supplies the photon wave functions that turn that amplitude
into a cross section and takes the amplitude itself as given. Nuclear parton distributions,
leading-twist shadowing and the mass-number systematics of nuclear modification are
`NuclearPartonDistributions`; the deuteron and the three-nucleon systems, the short-range
correlations, and the spherical Bessel family used in partial-wave expansions are `LightNuclei`.
The non-relativistic effective theory of heavy quarkonium, its production factorisation and its
spectroscopy are `QuarkoniaAndExotics`; that roadmap consumes the photoproduction amplitude
supplied here. The gravitational form factors that near-threshold quarkonium photoproduction is
hypothesised to access are `HadronMassAndEnergyMomentumTensor`. Final states with electroweak
gauge bosons or beyond-Standard-Model content produced in photon–photon collisions are
`ElectroweakAndBSM`; the Standard Model photon–photon processes of Layer 6 are here because they
calibrate the flux. Radiative corrections to the lepton line, and the distinction between a
Weizsäcker–Williams photon and a bremsstrahlung photon in an electron beam, are
`RadiativeCorrections`.

The material of this roadmap belongs in `EpsilonEridani/QFT/Scattering/Photoproduction/`, as a
sibling of the existing `EpsilonEridani/QFT/Scattering/DIS/` subtree, with the shared kinematics
and tensor decompositions imported from there rather than duplicated.

## Conventions and coordination with upstream

1. **Photon virtuality is explicit data, never a default.** Every amplitude, cross section and wave
   function in this roadmap carries the photon virtuality `Q²` as an argument, and the
   photoproduction statement is a theorem about the limit `Q² → 0`, with its own hypotheses. The
   trap this avoids: "photoproduction" silently meaning `Q² = 0` identically, which makes the
   equivalent-photon integral divergent at the lower endpoint and makes the relation between the
   photoproduction cross section and the transverse structure function a definition rather than a
   theorem.

2. **Two impact parameters, two names, never interchanged.** The separation of the two source
   centres in the transverse plane of the collider frame is `bSep`; the transverse position of a
   dipole or a struck parton relative to the target centre is `bTar`. Both are two-dimensional
   vectors in the plane orthogonal to the beam axis. The trap this avoids: the flux is differential
   in the first, the impact-parameter dependence of the dipole amplitude is in the second, and the
   two enter the same cross-section formula; conflating them produces a nuclear-size factor in the
   wrong place.

3. **The flux is a number spectrum per unit photon energy, fixed once.**
   `photonFlux alpha s bmin k` is
   `dN/dk`: dimensionally an inverse energy, positive, and with the `1/k` behaviour explicit in the
   definition rather than absorbed into a logarithm. The impact-parameter form
   `photonFluxImpact alpha s bSep k` is `d³N/(dk d²b)`, and the relation between them is the theorem of
   Layer 1, not a convention. The trap this avoids: the factor `2π` from the azimuthal integration
   and the difference between `dN/dk` and `dN/d ln k` are the two commonest normalisation errors in
   this subject, and fixing the convention once turns them into a provable consistency statement.

4. **Source properties are explicit data, not a typeclass.** A `ChargedSource` carries its charge in
   units of the positron charge, its mass, its charge radius and its Lorentz factor as fields. The
   `Z²` scaling of the flux is then a theorem about the definition, and the proton is the instance
   with charge one. The trap this avoids: a typeclass-resolved "nucleus" silently applying a
   coherent `Z²` enhancement to a source for which the coherence condition of Layer 0 fails.

5. **The survival factor is a probability, and the sharp cutoff is a named approximation.** The
   factor excluding hadronic overlap is defined from the nuclear thickness functions and the
   inelastic nucleon–nucleon cross section, takes values in the unit interval, and appears
   multiplicatively inside the impact-parameter integral. The step function supported on
   `bSep > R₁ + R₂` is a separate definition, labelled as the black-disk approximation, and the
   difference between the two is a quantity this roadmap bounds. The trap this avoids: two
   inequivalent definitions of "ultra-peripheral" circulating under the same name, so that a
   disagreement between two calculations cannot be localised.

6. **Vector-meson dominance is a hypothesis carried as an explicit argument.** It is a `Prop`
   relating the photon–hadron amplitude to a vector-meson–hadron amplitude and a coupling; every
   theorem that uses it takes it as a hypothesis, and no definition presupposes it. It is never
   encoded as a structure field with a placeholder witness, because such a field asserts nothing
   while looking like an assumption. The trap this avoids: a number derived under vector-meson
   dominance being read as a prediction of QCD.

7. **Coherent and incoherent are properties of the final state.** "Coherent" means the target
   nucleus remains in its ground state, matching the usage of `Diffraction`. "Incoherent" means the
   nucleus is excited or breaks up while no nucleon is destroyed. Neither is defined by a range of
   momentum transfer. The trap this avoids: identifying the coherent channel with small `|t|`,
   which is an empirical statement about where each dominates and becomes false beyond the first
   diffractive minimum.

8. **Momentum transfer is negative and distributions are written in its absolute value.** The
   Mandelstam invariant `t` is non-positive in the physical region; every slope, minimum and profile
   in this roadmap is stated in `|t|`, and the sign convention is fixed in the kinematics module
   before any amplitude is defined. The trap this avoids: a sign error in the exponential slope,
   which is invisible in a fit and fatal in a Fourier transform.

9. **One Fourier convention, taken from upstream.** Transforms between transverse position and
   transverse momentum use the convention of `TauCeti.Analysis.Bochner.Fourier.Convention`, and the
   nuclear form factor is the transform of a density normalised to unit integral, so that its value
   at zero momentum transfer is one. The trap this avoids: a convention-dependent factor of `2π` or
   `A` in the form factor, which propagates into the position of the diffractive minima only if the
   argument scaling is also wrong, and so is hard to detect.

10. **The two interfering source amplitudes are combined at amplitude level with an explicit
    relative sign.** For a final state of negative parity such as a vector meson, the two
    contributions enter with opposite sign, and the phase between them is the translation phase
    determined by the source separation. The relative sign is a stated input to the definition, not
    a convention buried in a proof. The trap this avoids: adding intensities instead of amplitudes,
    or getting the sign wrong, which converts the characteristic dip at vanishing transverse
    momentum into a peak.

11. **Bessel functions used here are defined here, in the shape Mathlib would want.** The modified
    functions `K₀` and `K₁` and the cylindrical function `J₀` are defined by their integral
    representations, with the recurrence relations, the monotonicity and the small- and
    large-argument asymptotics proved. They are stated as a family indexed by order so that the
    definitions can move upstream unchanged. The trap this avoids: making the roadmap contingent on
    an upstream addition; nothing here waits for one.

## Existing upstream material used by the roadmap

From EpsilonEridani:

- `EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic`, `.Bounds` and `.AccessMethods` give the
  deep-inelastic variables and the physical region. The real-photon limit of Layer 2 is taken
  inside this kinematics, so photoproduction and deep-inelastic scattering are two regions of one
  variable set rather than two vocabularies.
- `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` and `.Longitudinal` give the hadronic tensor
  decomposition and the transverse–longitudinal separation, against which the vanishing-virtuality
  statements of Layer 2 are proved.
- `EpsilonEridani.QFT.Scattering.DIS.CrossSection` and `EpsilonEridani.QFT.Scattering.DIS.Basic`
  give the cross-section assembly that the equivalent-photon factorisation of Layer 0 refactors.
- `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Amplitudes.Basic` and
  `EpsilonEridani.QFT.Scattering.DIS.Exclusive.Kinematics.Basic` give the exclusive amplitude type
  and kinematics. The photoproduction amplitude of Layer 3 inhabits that same type, which makes the
  boundary with `GeneralizedPartonDistributions` a restriction of one object rather than a pair of
  unrelated ones. `.Exclusive.DVMP.Basic` and `.Exclusive.DVMP.Channels` give the vector-meson
  channel labelling reused for the photoproduced states.
- `EpsilonEridani.Numerics.FourMom` gives four-momenta and their invariants.
- `EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions` and
  `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` give the metric and
  Levi-Civita contractions for the photon polarisation density matrix of Layer 5, whose
  antisymmetric part carries circular and whose traceless symmetric part carries linear
  polarisation.
- `EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.TensorReduction`,
  `.OneLoopScalars` and
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.OneLoopEvaluation` give the one-loop tensor
  reduction and scalar integrals in which the light-by-light box of Layer 6 is expressed, and
  `EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.CrossingSymmetry` relates the
  photon–photon channel to the Compton channel, which is how the Breit–Wheeler amplitude is
  obtained from an amplitude that already exists.
- `EpsilonEridani.Particles.StandardModel.Fermions.LeptonDoubletExtensions` gives the lepton content
  for the Breit–Wheeler final states.

From TauCeti:

- `TauCeti.Analysis.Bochner.Fourier.Convention` fixes the transform convention;
  `TauCeti.Analysis.Fourier.Integrable`, `TauCeti.Analysis.Fourier.Continuous` and
  `TauCeti.Analysis.Fourier.RiemannLebesgue` give the integrability and decay statements the form
  factor needs; `TauCeti.Analysis.Fourier.Decay` relates smoothness of the density to decay of the
  form factor, which is the precise form of the statement that a sharp edge produces slowly
  decaying diffractive oscillations.
- `TauCeti.Analysis.Fourier.ExpNegAbs` gives the transform of an exponential profile in closed form,
  which is the one-dimensional model of the dipole form factor used as a worked example.
- `TauCeti.Analysis.Bochner.BochnerTheorem`, `TauCeti.Analysis.Bochner.Fourier.Nonneg` and
  `TauCeti.Analysis.PositiveDefinite.AddGroup` are the right home for the question of when the
  momentum-transfer transform of Layer 3 is a density: positivity of the transform is equivalent to
  positive-definiteness of the amplitude as a function on the transverse translation group, and this
  roadmap states it that way rather than assuming it.
- `TauCeti.Analysis.Bochner.Gaussian.Basic` gives the Gaussian transform pair used for the
  Gaussian-density example, which has no diffractive minima and so isolates what the minima are
  testing.
- `TauCeti.Analysis.Contour.PerWindow.CPV` and
  `TauCeti.Analysis.Contour.Cauchy.PrincipalValue.Basic` give Cauchy principal values, used for the
  dispersion relation that fixes the real part of the photoproduction amplitude from its imaginary
  part in Layer 2.
- `TauCeti.MeasureTheory.Integral.LayerCake` is used for the impact-parameter integrals of Layer 1,
  where the survival factor is naturally written through its superlevel sets.
- `TauCeti.Probability.Moments.Basic` and `TauCeti.Probability.Moments.Covariance` give the mean and
  variance vocabulary in which the Good–Walker statement imported from `Diffraction` is expressed:
  the coherent cross section is the squared mean amplitude over nuclear configurations and the
  incoherent one is the variance.
- `TauCeti.Analysis.Fredholm.Criteria` and `TauCeti.Analysis.Fredholm.CompactPerturbation` are the
  right home for the inverse problem of Layer 3: recovering a transverse profile from a
  momentum-transfer distribution measured on a bounded interval is the inversion of a compact
  operator, and the non-uniqueness is a statement about its kernel.
- `TauCeti.Analysis.SpecialFunctions.ImproperIntegrals` and
  `TauCeti.Analysis.SpecialFunctions.IncompleteGamma` support the flux integrals and the
  Woods–Saxon moments.
- `TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` supplies the smooth cutoffs used to separate
  the small- and large-impact-parameter regions without introducing a discontinuity into a
  transform.

From Mathlib:

- `Mathlib.Analysis.Fourier.FourierTransform` and `Mathlib.Analysis.Fourier.Inversion` for the
  transform and its inversion.
- `Mathlib.Analysis.SpecialFunctions.PolarCoord` for the azimuthal reduction of a two-dimensional
  transform of a radial function, which is what produces the cylindrical Bessel kernel.
- `Mathlib.Analysis.Calculus.ParametricIntegral` for differentiating the flux and the form factor
  under the integral sign, which is required for every asymptotic statement in Layers 0 and 4.
- `Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic`,
  `Mathlib.Analysis.SpecialFunctions.Exponential` and
  `Mathlib.Analysis.SpecialFunctions.Complex.Log` for the elementary functions.
- `Mathlib.Analysis.SpecialFunctions.Integrals` for the elementary definite integrals appearing in
  the uniform-sphere form factor.

Absences, and what this roadmap does instead:

- ⚠ **Modified Bessel functions are absent from both Mathlib and TauCeti**, verified at the pinned
  revisions; the occurrences of the name in either library are incidental. Both the
  impact-parameter flux and the photon light-cone wave functions are built from `K₀` and `K₁`, so
  this roadmap defines them by their integral representations and proves the recurrence, the
  positivity, the monotonicity and the two asymptotic regimes it uses. It does not wait for an
  upstream addition. `LightNuclei` defines the *spherical* Bessel functions `jₗ` for its
  partial-wave expansion; those are a different family, and the only one this roadmap borrows from
  it is `j₀`, which is the radial kernel of the three-dimensional transform giving the nuclear form
  factor.
- ⚠ **The cylindrical function `J₀` is likewise absent.** It is the kernel of the two-dimensional
  radial transform relating the transverse profile to the momentum-transfer distribution, and is
  defined here alongside `K₀` and `K₁`, in the same indexed-family shape.
- ⚠ **Polylogarithms are absent from both libraries.** The closed form of the light-by-light box in
  terms of dilogarithms is therefore not available. Layer 6 states the amplitude as a
  Feynman-parameter integral obtained from the tensor reduction that does exist in EpsilonEridani,
  proves gauge invariance and the crossing relations from that representation, and derives the
  low-energy Euler–Heisenberg limit, where the result is elementary. No closed form is claimed.
- ⚠ **TauCeti has no notion of ill-posedness and no regularisation theory**, verified at the pinned
  revisions. The inverse problem of Layer 3 is therefore stated through the Fredholm theory that
  does exist — compactness of the forward operator and the kernel of its restriction to a bounded
  momentum-transfer window — rather than through a regularisation scheme.

---
- `Physlib` (pinned in `EpsilonEridani`'s `lake-manifest.json`, and already imported by 24 of its
  modules): `Physlib.Electromagnetism.Kinematics.FieldStrength` and
  `Physlib.Electromagnetism.Kinematics.Boosts` for the boosted Coulomb field the equivalent-photon
  spectrum is derived from — the Weizsäcker-Williams flux of Layer 1 is a statement about exactly
  this object — with `Physlib.Relativity.LorentzGroup.Boosts.Basic` for the boost itself.

## Layer 0: photon kinematics and the equivalent-photon approximation

References: Weizsäcker (1934); Williams (1934); Jackson, *Classical Electrodynamics*, chapter 15;
Budnev, Ginzburg, Meledin and Serbo (1975), sections 2 and 4; Bertulani and Baur (1988).

### 0.1 The emitting source and the photon variables

A `ChargedSource` is explicit data: charge in units of the positron charge, mass, charge radius, and
Lorentz factor in the collider frame. A photon emitted from it is described by its energy in the
collider frame and its virtuality, both explicit. Define the photon energy fraction relative to the
source energy, and prove the elementary relations between the energy fraction, the photon rapidity
and the invariant mass of the photon–target system, so that the three parameterisations used in the
literature are interchangeable by a proved equality rather than by convention.

Prove that the physical region for the pair is the set on which the virtuality lies between the
kinematic minimum set by the source mass and energy fraction and the kinematic maximum set by the
scattering angle, and that this minimum is strictly positive for a massive source. The strict
positivity is the reason the integrated flux converges, and it is the first place where treating
photoproduction as exactly `Q² = 0` fails.

### 0.2 The boosted Coulomb field and its Fourier content

Take the electromagnetic field of a point charge in uniform motion, obtained by boosting the
Coulomb field, and compute its Fourier transform in time at fixed transverse distance. Prove that
the transverse electric field and the magnetic field become equal in magnitude and orthogonal as the
Lorentz factor grows, with an explicit bound on the difference in terms of the inverse squared
Lorentz factor; this is the statement that the field of a fast charge is locally a plane wave, and
it is the content of the approximation.

Define the energy flux through a plane per unit frequency, and define the photon number spectrum as
that energy flux divided by the photon energy. This is the definition of the equivalent-photon
spectrum, and it is a definition about a classical field, prior to any statement about a cross
section.

### 0.3 The factorisation statement and its hypotheses

State the equivalent-photon approximation as a theorem with named hypotheses rather than as a
definition: the cross section for a process initiated by a charged source equals the integral over
photon energy of the flux times the real-photon cross section, up to an error controlled by the
hypotheses. The hypotheses are that the photoproduction cross section varies slowly over the range
of virtualities contributing, that the longitudinal photon contribution is suppressed by the
virtuality, and that the source does not otherwise participate.

Prove the error estimate rather than asserting the approximation: the difference between the exact
cross section and the factorised form is bounded by the variation of the photoproduction cross
section over the virtuality range times the flux, plus the longitudinal contribution. Each term of
the bound is a separately stated quantity, so that a calculation can report which one dominates.

State plainly what is not proved here: the approximation is controlled in the stated bound, and
there is no claim that the bound is optimal, nor that the neglected longitudinal piece is negligible
for a target whose longitudinal response is enhanced. The latter is an open question, and it is
named as one, not discharged.

### 0.4 The coherence condition

For a source of finite radius, the emitted photon must not resolve the internal structure of the
source if the emission is to be coherent over the whole charge. Derive, rather than quote, the two
consequences: the virtuality is bounded above by the inverse squared radius, and in the collider
frame the photon energy is bounded above by the Lorentz factor divided by the radius. Give the
derivation as a statement about the support of the Fourier transform of the charge density: beyond
the bound, the form factor of the source has decayed, and the coherent contribution is suppressed
by its square.

Prove the mass-number scaling that follows. The flux from a coherent source is proportional to the
squared charge, so a heavy ion is a far brighter photon source than a proton, while the maximum
photon energy falls with the radius. State the resulting trade-off as a proposition about the
product of the two, since it is the reason heavy ions and protons probe different regions of the
photon–target invariant mass.

### 0.5 The integrated flux for a point source

Define the integrated flux for a point charge with a minimum impact parameter as

`n(k) = (2 Z² α / π) (1/k) [ ξ K₀(ξ) K₁(ξ) − (ξ²/2) (K₁(ξ)² − K₀(ξ)²) ]`, with `ξ = k b_min / γ`,

and prove: it is positive for positive argument; it behaves as the inverse photon energy times a
logarithm of the ratio of the maximum to the actual photon energy in the small-`ξ` regime; and it is
exponentially suppressed for large `ξ`, with an explicit exponential rate. The exponential
suppression is the precise form of the coherence cutoff of 0.4, obtained here as an asymptotic
theorem rather than as a sharp cutoff.

This subsection requires `K₀` and `K₁`, which are absent upstream. Define them here by

`K₀(x) = ∫₀^∞ exp(−x cosh t) dt` and `K₁(x) = ∫₀^∞ exp(−x cosh t) cosh t dt`,

prove that the integrals converge for positive argument, prove the derivative relation `K₀' = −K₁`,
the positivity and strict decrease of both, the logarithmic divergence of `K₀` and the simple pole
of `K₁` at the origin, and the common exponential asymptotics at infinity. Prove the Wronskian-type
identity relating `K₀`, `K₁` and the corresponding functions of the first kind, stated only to the
extent Layer 1 uses it.

### Examples

- The flux from a gold nucleus and the flux from a proton at the same Lorentz factor: prove that the
  ratio at fixed photon energy well below both coherence bounds is the squared charge ratio, and
  that the two orderings cross above the nuclear coherence bound.
- A source of vanishing radius: prove that the coherence bound recedes to infinity and the flux
  reduces to the point-charge logarithm, so that the electron beam is the degenerate case of the
  same formula.
- The small-`ξ` expansion of the bracket in 0.5, carried to the first two orders, with the
  remainder bounded.

### Dependencies

`EpsilonEridani.QFT.Scattering.DIS.Kinematics.Basic` and `.Bounds` for the variables and the
physical region; `EpsilonEridani.Numerics.FourMom` for the invariants; Mathlib's Fourier transform
and parametric integral calculus; `TauCeti.Analysis.SpecialFunctions.ImproperIntegrals` for the
convergence of the Bessel integrals. Nothing in this layer depends on another roadmap.

---

## Layer 1: the impact-parameter flux, the survival factor, and two-photon luminosity

References: Baltz et al. (2008), sections 2 and 3; Bertulani, Klein and Nystrand (2005);
Vidović, Greiner, Best and Soff (1993); Hencken, Trautmann and Baur (1995); Klein and Nystrand
(1999).

### 1.1 The flux differential in impact parameter

Define the impact-parameter differential flux for a point source,

`dN/(dk d²b) = (Z² α / π²) (1 / (k b²)) ξ² K₁(ξ)²`, with `ξ = k b / γ`,

and prove that it is positive, that it decreases in the impact parameter, and that it is
exponentially suppressed once the impact parameter exceeds the Lorentz factor divided by the photon
energy. The last statement is the impact-parameter form of the coherence bound and should be proved
from the asymptotics of `K₁` established in 0.5, not restated.

Prove the consistency theorem: the integral of the impact-parameter flux over the region beyond a
minimum separation equals the integrated flux of 0.5. This is the statement that fixes the relative
normalisation of the two forms, and it is the reason convention 3 can be a theorem rather than a
stipulation.

### 1.2 Nuclear geometry and the thickness function

Define a nuclear density profile as data, with the Woods–Saxon and the uniform-sphere profiles as
named instances, each normalised to the mass number. Define the thickness function as the integral
of the density along the beam direction at fixed transverse position, and prove that it is
non-negative, radially decreasing for a radially decreasing density, and integrates over the
transverse plane to the mass number.

Prove the closed form of the thickness function for the uniform sphere, and prove that the
Woods–Saxon thickness converges to it as the surface diffuseness vanishes, with an explicit bound in
the diffuseness. This is where the sharp-edge idealisation is quantified rather than assumed.

### 1.3 The survival factor

Define the survival factor for a pair of nuclei at a given separation as the probability of no
inelastic nucleon–nucleon interaction, built from the overlap of the two thickness functions and the
inelastic nucleon–nucleon cross section. Prove that it takes values in the unit interval, that it
increases in the separation, and that it tends to one as the separation grows.

Define the black-disk approximation as the indicator of separations exceeding the sum of the two
radii, and prove a bound on the difference between the two definitions, expressed as an integral of
the overlap over the transition region. State the ultra-peripheral cross section as the
impact-parameter integral of the flux weighted by the survival factor, and prove that the black-disk
version differs from it by the bounded amount. Convention 5 is discharged here.

### 1.4 The two-photon flux and luminosity

Define the two-photon luminosity for a pair of sources as the double integral over the two photon
energies and the separation of the product of the two impact-parameter fluxes weighted by the
survival factor, and prove that it is a positive, symmetric function of the two energies. Change
variables to the photon–photon invariant mass and rapidity, and prove the Jacobian identity, since
every measurement is reported in those variables.

State precisely what the factorised form neglects. Writing the two-photon flux as a product of two
single-photon fluxes at a common separation already imposes a correlation, and integrating each flux
independently over its own separation imposes none; the two differ, and the difference is a defined
quantity here. Prove the inequality between the two constructions that follows from the monotonicity
of 1.1.

Name the open question rather than closing it: the impact-parameter dependent photon flux is not an
observable, because photon energy and transverse position are conjugate variables and the joint
"flux at a given separation and energy" is a semiclassical construct rather than a probability
density derived from the field theory. This roadmap defines it as the classical quantity of 1.1,
proves the statements that follow from that definition, and marks as an open problem the question of
what field-theoretic object it approximates and with what error. It is not a milestone that can be
discharged.

### Examples

- Gold on gold at collider energies: prove that the survival factor at a separation of twice the
  nuclear radius is bounded away from both zero and one, so that neither idealisation is exact.
- A uniform-sphere pair: the overlap integral in closed form, and the resulting survival factor as
  an explicit elementary function of the separation.
- The two-photon luminosity for a point-source pair with a sharp cutoff, showing the characteristic
  double-logarithmic growth in the invariant mass, with the coefficient computed.

### Dependencies

Layer 0 for the flux and the Bessel functions. `LightNuclei` for the light-nucleus densities used as
instances; `NuclearPartonDistributions` for the mass-number systematics of the Woods–Saxon
parameters. `TauCeti.MeasureTheory.Integral.LayerCake` for the impact-parameter integrals;
`TauCeti.Analysis.Distribution.SchwartzSpace.Cutoff` for the smoothed cutoff.

---

## Layer 2: the real-photon limit and photoproduction off the proton

References: Bauer, Spital, Yennie and Pipkin (1978); Sakurai (1960); Gribov (1969); Donnachie and
Landshoff (1992); the Yellow Report, subsection 7.3.9.

### 2.1 The limit of the structure functions

Using the tensor decomposition of `EpsilonEridani.QFT.Scattering.DIS.Tensors.Basic` and the
longitudinal separation of `.Longitudinal`, state the behaviour of the transverse and longitudinal
structure functions as the virtuality vanishes at fixed photon–target invariant mass. Prove that the
photoproduction cross section is the limit of the transverse virtual-photon cross section, that the
longitudinal cross section vanishes at least linearly in the virtuality, and that the transverse
structure function must vanish linearly in the virtuality for the photoproduction cross section to
be finite. The last is a constraint, not an assumption: it is the statement that `F₂` vanishes like
`Q²` at fixed invariant mass, and it is proved from the finiteness of the limit.

State the hypotheses under which the limit exists: continuity of the transverse cross section in the
virtuality at the origin, at fixed invariant mass and uniformly on compact invariant-mass sets. Where
the limit is claimed to exist without this, say so.

### 2.2 The total photoproduction cross section and the optical theorem

Define the forward photon–proton amplitude and state the optical theorem relating its imaginary part
to the total photoproduction cross section, imported from the general statement in `Diffraction`
rather than reproved. Define the energy dependence through the invariant mass of the photon–proton
system.

Prove the dispersion relation fixing the real part of the forward amplitude from the imaginary part,
using the Cauchy principal value of `TauCeti.Analysis.Contour.PerWindow.CPV`. State the subtraction
needed and prove that the subtraction constant is fixed by the Thomson limit, which is the
low-energy theorem for Compton scattering off a charged target. This is the only place in the
roadmap where a low-energy theorem is used, and it is used because it is a theorem.

### 2.3 Vector-meson dominance as a hypothesis

State vector-meson dominance as a `Prop`: that the photon–hadron amplitude equals a sum over
vector-meson states of the photon–vector-meson coupling times the vector-meson–hadron amplitude,
with the couplings determined by the leptonic widths. Prove the consequences that follow *from the
hypothesis*: the photoproduction cross section is a weighted sum of vector-meson–proton cross
sections; the ratio of photoproduction cross sections for different vector mesons is fixed by the
couplings; and the energy dependence is that of a hadronic cross section.

Prove one thing about the hypothesis itself: it is inconsistent with the observed rise of the
exclusive heavy-vector-meson cross section with energy if the vector-meson–proton cross section is
taken to have the soft-Pomeron energy dependence of `Diffraction`. State this as a proposition with
its hypotheses, since it is the precise sense in which vector-meson dominance fails for heavy
quarkonium, and it is what motivates Layer 3.

Nothing else in this roadmap depends on vector-meson dominance. That separation is convention 6, and
it is the point of stating the hypothesis explicitly.

### 2.4 The hadronic structure of the photon

Define the photon's hadronic content as the statement that a real photon has parton distributions,
distinguishing the pointlike (anomalous) component, calculable in perturbation theory from the
splitting of a photon into a quark pair, from the hadronic component, which is not. Prove the
inhomogeneous evolution equation for the photon parton distributions as a statement about the
collinear evolution operator of `CollinearEvolution`, with the inhomogeneous term computed from the
photon-to-quark splitting function. Do not restate the evolution theory; state the inhomogeneity
and cite the operator.

Prove that the pointlike component is fixed at leading order by the inhomogeneous term alone up to a
boundary condition, and state the boundary condition as an input, since it is one.

### Examples

- The Thomson limit as the low-energy value of the forward Compton amplitude for a point charge,
  computed.
- The ratio of rho, omega and phi photoproduction cross sections predicted by vector-meson dominance
  from the leptonic widths, stated as a corollary of the hypothesis and labelled as such.
- The vanishing of the longitudinal cross section at the real-photon point, proved from the tensor
  decomposition, exhibited as the reason a real photon has only two polarisation states.

### Dependencies

Layer 0 for the virtuality convention and the real-photon limit. `Diffraction` for the optical
theorem and the soft-Pomeron energy dependence used in 2.3; `CollinearEvolution` for the evolution
operator of 2.4; `InclusiveStructureFunctions` for the structure functions whose limit is taken.
`TauCeti.Analysis.Contour.PerWindow.CPV` for the dispersion relation.

---

## Layer 3: exclusive photoproduction in the dipole formulation

References: Nikolaev and Zakharov (1991); Ryskin (1993); Brodsky, Frankfurt, Gunion, Mueller and
Strikman (1994); Kowalski, Motyka and Watt (2006); Munier, Staśto and Mueller (2001); Kowalski and
Teaney (2003).

### 3.1 The photon light-cone wave functions

Define the light-cone wave function for a photon of given virtuality and polarisation splitting into
a quark–antiquark pair of given flavour, as a function of the transverse dipole size and the
longitudinal momentum fraction. The transverse and longitudinal wave functions are

`|ψ_T|² ∝ [ (z² + (1−z)²) ε² K₁(ε r)² + m_f² K₀(ε r)² ]` and `|ψ_L|² ∝ z²(1−z)² Q² K₀(ε r)²`,

with `ε² = z(1−z) Q² + m_f²`. Derive these from the photon-to-quark-pair splitting, with the
polarisation vectors taken from the tensor material already in EpsilonEridani, rather than quoting
them. Prove that the longitudinal wave function vanishes at zero virtuality, which is the wave-function
form of the statement proved in 2.1.

Prove the normalisation and the support properties: the squared wave functions are non-negative,
integrable in the dipole size for positive `ε`, and exponentially suppressed for dipole sizes beyond
the inverse of `ε`. The last is the precise statement that a large virtuality or a heavy quark
selects a small dipole.

These wave functions are what `SmallXAndSaturation` takes from this roadmap; that roadmap supplies
the dipole amplitude and this one supplies the projectile.

### 3.2 The infrared sensitivity of the real-photon limit

At vanishing virtuality the transverse wave function is controlled by the quark mass alone, and for a
light quark the dipole size distribution extends to the non-perturbative region. State this
plainly as a limitation of the dipole formulation for light-vector-meson photoproduction rather
than obscuring it: the real-photon transverse wave function is not perturbatively controlled for
light flavours, and the standard remedies — an effective quark mass, or a soft contribution modelled
after vector-meson dominance — are model inputs.

Prove what can be proved: a bound on the fraction of the dipole-size integral coming from dipoles
larger than a given scale, in terms of the quark mass, exhibiting the divergence of that fraction as
the mass tends to zero. This turns a qualitative caveat into an inequality, and it is the honest
content of the caveat. The choice of remedy is an open question and is named as one; it is not a
milestone.

### 3.3 The exclusive amplitude

Define the exclusive photoproduction amplitude for a vector meson as the integral over dipole size
and longitudinal momentum fraction of the overlap of the photon wave function of 3.1 with the
vector-meson light-cone wave function, weighted by the dipole–target scattering amplitude at the
relevant transverse position, with the momentum-transfer phase included. The vector-meson wave
function is data, with a named boosted-Gaussian instance; the dipole amplitude is taken from
`SmallXAndSaturation`.

Prove that the amplitude is an inhabitant of the exclusive-amplitude type of
`EpsilonEridani.QFT.Scattering.DIS.Exclusive.Amplitudes.Basic`, and that at finite virtuality it
agrees with the deeply virtual meson production amplitude of `GeneralizedPartonDistributions` in the
overlap region where both descriptions are stated to apply. Where agreement requires an assumption,
state the assumption; this equality is a hypothesis relating two factorisation statements, not a
theorem of either, and it is labelled as such.

Prove the energy dependence that follows from the energy dependence of the dipole amplitude: if the
dipole amplitude grows as a power of the energy at fixed dipole size, the exclusive cross section
grows as twice that power, with the coefficient given by the wave-function overlap. This is a
theorem about the definition, and it is the statement that exclusive production is a more sensitive
probe of the gluon density than an inclusive one.

Prove the flavour statement the draft asks for as a theorem rather than as a slogan: the mean dipole
size weighted by the overlap decreases with the vector-meson mass, monotonically, with the bound
following from the exponential suppression of 3.1. A heavier state therefore probes a smaller
dipole and a more perturbative regime, and this is a proposition about the overlap integral.

### 3.4 The corrections to the amplitude

Three corrections are stated as defined quantities with their own hypotheses, not as fudge factors.
The skewedness correction accounts for the unequal momentum fractions of the two gluons and is
defined from the logarithmic derivative of the amplitude in the energy. The real-part correction is
fixed by the dispersion relation of 2.2 applied at fixed momentum transfer. The correction from the
finite longitudinal momentum transfer is defined from the expansion in the ratio of the vector-meson
mass to the photon–target invariant mass. Prove that each vanishes in the stated limit and prove an
error bound for each at first order.

### 3.5 The transverse profile

Define the transverse profile as the two-dimensional Fourier transform of the momentum-transfer
amplitude, with the radial reduction to the `J₀` kernel proved from
`Mathlib.Analysis.SpecialFunctions.PolarCoord`. Prove that for an amplitude falling exponentially in
the momentum transfer the profile is Gaussian, with the width fixed by the slope.

State and prove the condition under which the profile is a density: non-negativity of the transform
is equivalent to positive-definiteness of the amplitude as a function on the transverse translation
group, by `TauCeti.Analysis.Bochner.BochnerTheorem`. Exhibit an amplitude with the correct
qualitative shape whose transform changes sign, so that the condition is seen to have content. The
trap this closes is the routine description of the transform as "the gluon density in impact
parameter" when nothing has been checked.

State the inverse problem precisely. The map from a transverse profile to a momentum-transfer
distribution restricted to a bounded window is a compact operator; its inverse is unbounded, and the
set of profiles compatible with a given measured distribution is a coset of the kernel of the
restriction. Characterise that kernel through `TauCeti.Analysis.Fredholm.Criteria`. TauCeti has no
regularisation theory, so no regularised inverse is constructed and none is claimed; what is proved
is the non-uniqueness statement and its explicit description.

### Examples

- An exponential momentum-transfer dependence with a measured slope: the Gaussian profile, its
  width, and the verification that it is positive.
- A profile that is the difference of two Gaussians of different widths and comparable weight: its
  transform has a zero, and the reconstructed "density" is negative in a region, so the
  positive-definiteness hypothesis fails.
- The mean dipole size for the rho, the J/psi and the Upsilon at the real-photon point, ordered, as
  an instance of the monotonicity theorem of 3.3.

### Dependencies

Layers 0 and 2. `SmallXAndSaturation` for the dipole amplitude and its energy dependence, which this
layer consumes and does not derive; `GeneralizedPartonDistributions` for the finite-virtuality
exclusive amplitude that 3.3 compares against; `QuarkoniaAndExotics` for the quarkonium states and
their wave functions; `Diffraction` for the optical theorem. TauCeti's Bochner and Fredholm theory.

---

## Layer 4: nuclear targets — coherent and incoherent photoproduction

References: Glauber (1959); Glauber and Matthiae (1970); Good and Walker (1960); Klein and Nystrand
(1999); Frankfurt, Guzey and Strikman (2012); Guzey, Strikman and Zhalov (2014); Mäntysaari and
Schenke (2016); Toll and Ullrich (2013).

### 4.1 The nuclear form factor

Define the nuclear form factor as the three-dimensional Fourier transform of the charge or matter
density, normalised so that its value at zero momentum transfer is one. Prove the radial reduction
to the `j₀` kernel borrowed from `LightNuclei`, and prove the closed form for the uniform sphere:

`F(q) = 3 [ sin(qR) − qR cos(qR) ] / (qR)³`.

Prove that its zeros are exactly the non-zero solutions of `tan(qR) = qR`, that they are simple, and
that they interlace the zeros of the sine. Prove that the Gaussian density has a form factor with no
zeros, using `TauCeti.Analysis.Bochner.Gaussian.Basic`. Prove that the Woods–Saxon form factor has
zeros that approach those of the uniform sphere as the diffuseness vanishes, with the displacement
bounded in the diffuseness, and that the depth of the minima is finite for non-zero diffuseness.

The physical content is stated as a corollary: the positions of the diffractive minima measure the
nuclear radius and their depth measures the surface diffuseness, and the existence of minima at all
is what distinguishes a coherent from an incoherent event experimentally.

### 4.2 Coherent photoproduction in the optical limit

Define the coherent amplitude in the optical limit as the nucleon-level amplitude times the nuclear
form factor times the mass number, and prove that the resulting cross section is proportional to the
squared mass number times the squared form factor. Prove that the optical limit is the leading term
of the expansion of the Glauber amplitude in the nucleon-level amplitude, and define the next term
explicitly, so that the correction is a named quantity rather than an unexplained discrepancy.

Prove the two statements that distinguish coherent from incoherent kinematically without defining
them that way: the coherent momentum-transfer distribution has support concentrated below the
inverse nuclear radius and exhibits the minima of 4.1, whereas the incoherent one falls with the
nucleon slope and has no nuclear minima. Both are consequences of the definitions of 4.2 and 4.3 and
convention 7, not additional stipulations.

### 4.3 Incoherent photoproduction

Import the Good–Walker decomposition from `Diffraction`: given a family of nuclear configurations
with a probability measure, the coherent cross section is the squared expectation of the amplitude
and the incoherent cross section is its variance. Do not reprove it. Apply it here by supplying the
configuration space and computing both moments with `TauCeti.Probability.Moments.Basic` and
`.Covariance`. Two configuration spaces are in scope and both are built: nucleon positions
distributed according to the density of 1.2 with the nucleon profile fixed, and the same with the
nucleon profile itself fluctuating. The second is what distinguishes nucleonic from sub-nucleonic
structure in the incoherent channel, and the difference between the two variances is a defined
quantity here.

Prove the two consequences: the incoherent cross section vanishes identically when the amplitude is
configuration-independent, so that it is a direct measure of fluctuation; and the ratio of
incoherent to coherent at large momentum transfer is controlled by the shortest correlation length
in the configuration distribution. State the applicability hypothesis carried over from
`Diffraction` — that the eikonal approximation holds, so that the amplitude is a function of the
configuration rather than an operator between nuclear states — and label it as the hypothesis it is.

### 4.4 Nuclear suppression

Define the nuclear suppression factor as the ratio of the coherent cross section to the mass-number
scaled nucleon cross section in the optical limit. Prove that it is at most one whenever the dipole
amplitude satisfies the unitarity bound established in `SmallXAndSaturation`, and prove that it
decreases as the target becomes blacker, with the monotonicity following from the same bound.

State the relation to leading-twist shadowing as a hypothesis, not as a theorem: the suppression
computed here from the unitarisation of the dipole amplitude and the suppression computed in
`NuclearPartonDistributions` from the shadowing of the nuclear gluon distribution are two
descriptions of the same measurement, and their agreement is a conjecture about the equivalence of
two approximation schemes. Prove what is provable — that the two agree at leading order in the
nucleon-level amplitude, where both reduce to the double-scattering term — and mark the rest as
open.

### Examples

- Lead at a radius of about seven femtometres: the first diffractive minimum at a momentum transfer
  fixed by the first non-zero solution of `tan x = x`, computed numerically from that equation and
  converted to the momentum-transfer variable.
- A configuration distribution with no fluctuation: the incoherent cross section is exactly zero, by
  the theorem of 4.3.
- A nucleus modelled as a black disk: the coherent cross section is computed in closed form from the
  disk form factor, and the suppression factor attains its bound.

### Dependencies

Layers 1 and 3. `Diffraction` for the Good–Walker decomposition, applied and not reproved;
`SmallXAndSaturation` for the unitarity bound on the dipole amplitude;
`NuclearPartonDistributions` for the shadowing description compared against in 4.4 and for the
Woods–Saxon systematics; `LightNuclei` for `j₀` and for the light-nucleus densities. TauCeti's
moment theory and Gaussian transform.

---

## Layer 5: two-source interference and photon polarisation

References: Klein and Nystrand (2000); Krauss, Greiner and Soff (1997); Li, Zhou and Zhou (2019);
STAR Collaboration (2021); Baltz et al. (2008), section 5.

### 5.1 Two indistinguishable sources

In a symmetric collision either nucleus can emit the photon and the other be the target, and the two
final states are identical. Define the total amplitude as the sum of the two contributions, each
evaluated at its own photon energy, with the translation phase `exp(i Δ·b)` relating them, where
`Δ` is the transverse momentum of the produced system and `b` is the source separation. Fix the
relative sign from the parity of the produced state: for a vector meson the two contributions enter
with opposite sign, because the photon is odd under parity and the two emission configurations are
related by the spatial inversion that exchanges the nuclei.

Prove the resulting cross section: the incoherent sum of the two squared amplitudes multiplied by
`2(1 − cos(Δ·b))` in the vector-meson case, and by `2(1 + cos(Δ·b))` for a state of the opposite
parity. Prove that the vector-meson interference term vanishes identically at zero transverse
momentum for every separation, which is the characteristic dip, and prove that it is a strict dip
rather than a zero of the total cross section only after the integration over separation of 5.2.

### 5.2 Integration over the unobserved separation

The source separation is not measured, so the cross section is the integral over separation of the
interference-weighted flux, with the survival factor of 1.3 included. Prove that this integration
does not wash the interference out, because the weight is bounded and the flux is concentrated at
separations comparable to the nuclear size, and give the explicit oscillation scale: structure
appears at transverse momenta of order the inverse mean separation. Prove that the visibility of the
interference — defined as the relative depth of the first minimum in the integrated distribution —
is a decreasing function of the spread of the separation distribution, and compute it for the
survival-weighted flux of Layer 1.

Prove the statement that distinguishes this from any fixed-target process: the two contributions
differ in photon energy, since a photon of energy `k` from one direction and a photon of energy
`W²/(4E k)` from the other produce the same invariant mass, so the interference is between
amplitudes at two different points of the flux. State the consequence, that the interference pattern
carries information about the flux at both energies, and prove the symmetry of the pattern under the
exchange of the two.

### 5.3 The polarisation of the equivalent photons

The electric field of a relativistic charge at a given transverse position points along the
separation vector, so the equivalent photon is linearly polarised in that direction. Define the
photon polarisation density matrix from the field of 0.2, prove that it is a rank-one projector onto
the radial direction at fixed separation, and prove that the azimuthal average over separations is
unpolarised while the correlation with the separation direction survives in any observable that is
differential in an azimuthal angle.

Prove the azimuthal modulations that follow. For a two-photon final state whose amplitude depends on
the angle between the two photon polarisations, the cross section acquires a `cos(2φ)` and a
`cos(4φ)` modulation, where `φ` is the azimuthal angle between the pair transverse momentum and one
of the final-state momenta; derive the coefficients from the polarisation density matrix and the
amplitude rather than fitting them. For a vector meson, prove the corresponding spin-density-matrix
statement: the produced meson inherits the linear polarisation, and the resulting decay angular
distribution is derived.

### Examples

- The interference weight at exactly zero transverse momentum: zero for the vector meson, maximal
  for a scalar, proved directly from the definition of 5.1.
- A separation distribution concentrated at a single value: the integrated distribution retains full
  visibility, and the first minimum sits at the inverse of that separation.
- The `cos(2φ)` coefficient for the Breit–Wheeler pair in the limit of massless leptons, computed
  from the polarisation density matrix.

### Dependencies

Layers 1, 3 and 4. `QuarkoniaAndExotics` for the vector-meson decay angular distributions used in
5.3; `EpsilonEridani.Relativity.Tensors.LeviCivita.ContractionsExtensions` and
`EpsilonEridani.Relativity.Tensors.RealTensor.Metrics.BasicExtensions` for the polarisation tensor
algebra.

---

## Layer 6: photon-photon processes

References: Breit and Wheeler (1934); Euler and Heisenberg (1936); Karplus and Neuman (1951);
Budnev, Ginzburg, Meledin and Serbo (1975); d'Enterria and Silveira (2013); ATLAS Collaboration
(2017); STAR Collaboration (2021).

### 6.1 The Breit–Wheeler process

Define the tree-level amplitude for two photons producing a lepton pair, obtained from the Compton
amplitude by the crossing relation of
`EpsilonEridani.QFT.PerturbationTheory.FeynmanDiagrams.CrossingSymmetry`. Prove gauge invariance by
the Ward identity, and derive the total cross section as a function of the photon–photon invariant
mass and the lepton mass. The closed form is to be derived from the amplitude, not quoted; what is
stated in advance are the two limits that any correct derivation must reproduce, and they are the
first check on it: the cross section vanishes at threshold proportionally to the lepton velocity,
and at high invariant mass it falls as the inverse squared invariant mass times the logarithm of the
ratio of invariant mass to lepton mass.

Prove that the cross section vanishes identically below threshold, and prove that it attains a
maximum at an invariant mass of order the lepton mass, locating the maximum as the solution of a
stated equation.

Combine with the two-photon luminosity of 1.4 to obtain the ultra-peripheral dilepton cross section,
and prove the statement that makes it a calibration: the rate is fixed by the flux and by quantum
electrodynamics alone, with no hadronic input beyond the nuclear form factor entering the flux, so a
measured rate determines the flux normalisation. State exactly what it determines and what it does
not: it constrains the product of the flux and the survival factor integrated over the accepted
region, not either separately.

### 6.2 Light-by-light scattering

Define the one-loop photon–photon amplitude through the fermion box, using the tensor reduction of
`EpsilonEridani.QFT.PerturbationTheory.DimensionalRegularization.TensorReduction` and the scalar
integrals of `.OneLoopScalars`. Prove that the amplitude is finite — the apparent logarithmic
divergence cancels between the six box orderings — and prove gauge invariance, both from the
Feynman-parameter representation.

State plainly that no closed form is given. The standard closed form is written in dilogarithms,
which are absent from both Mathlib and TauCeti; the amplitude here is the Feynman-parameter
integral, and the results proved about it are those that follow from that representation: finiteness,
gauge invariance, crossing symmetry, the helicity decomposition, and the low-energy limit.

Prove the low-energy limit, where the result is elementary: for photon energies well below the
fermion mass the amplitude reduces to the Euler–Heisenberg effective interaction, with the two
quartic invariants and their coefficients derived, and the cross section growing as the sixth power
of the energy. Prove the high-energy behaviour that the effective theory does not capture, stated as
the failure of the sixth-power growth above the fermion mass threshold, with the scale of the
failure identified.

Combine with the luminosity of 1.4 for the ultra-peripheral light-by-light cross section, and prove
the fourth-power dependence on the nuclear charge that makes heavy ions the setting where the
process is observable.

### 6.3 The transverse momentum of the produced pair

Define the transverse momentum distribution of a photon–photon produced pair, and prove that in the
factorised treatment of 1.4 it is the convolution of the two photons' transverse momentum
distributions, each fixed by the source form factor. Prove the resulting characteristic scale: the
pair transverse momentum is of order the inverse nuclear radius, far below any hadronic scale, which
is what makes the process identifiable.

Prove the statement the draft asks for as a comparison of two defined quantities: the distribution
predicted by the impact-parameter correlated flux differs from the one predicted by the factorised
flux, and the difference is concentrated at pair transverse momenta of order the inverse impact
parameter. Give the difference as an explicit integral and bound it. Note, as in 1.4, that the
correlated construction is semiclassical, so this comparison is between two models rather than
between a model and a theorem; the honest statement is the size of their difference, and that is
what is proved.

### 6.4 Azimuthal structure and the polarisation connection

Apply the polarisation density matrix of 5.3 to the Breit–Wheeler and light-by-light final states,
and prove the `cos(2φ)` and `cos(4φ)` modulation coefficients. Prove that the modulations survive
the integration over the source separation, unlike some interference effects, because they depend on
the direction of the separation and not on its magnitude, and prove the resulting relation between
the modulation amplitude and the pair transverse momentum.

### Examples

- The Breit–Wheeler cross section for electrons at an invariant mass of a few times the electron
  mass, evaluated from the derived closed form, and its threshold and asymptotic limits checked
  against the two statements of 6.1.
- The Euler–Heisenberg cross section for photon–photon scattering at an invariant mass one tenth of
  the electron mass, with the sixth-power scaling exhibited.
- The pair transverse momentum scale for lead, compared with the inverse nuclear radius, showing the
  two agree to within the diffuseness correction of 4.1.

### Dependencies

Layers 1 and 5. `ElectroweakAndBSM` for photon–photon final states containing electroweak gauge
bosons, which are excluded here; `RadiativeCorrections` for the higher-order corrections to the
lepton pair. EpsilonEridani's dimensional regularisation, tensor reduction and crossing-symmetry
material.

## Dependency graph

```
                Layer 0  photon kinematics, boosted Coulomb field,
                         coherence condition, integrated flux, K0 and K1
                    |
        +-----------+-----------+
        |                       |
        v                       v
Layer 1  impact-parameter    Layer 2  real-photon limit, optical theorem,
         flux, survival               dispersion relation, vector-meson
         factor, two-photon           dominance (hypothesis), photon structure
         luminosity                |
        |                          v
        |                  Layer 3  photon light-cone wave functions,
        |                           exclusive dipole amplitude,
        |                           transverse profile
        |                          |
        |                          v
        |                  Layer 4  nuclear form factor and its minima,
        |                           coherent and incoherent channels,
        |                           nuclear suppression
        |                          |
        +-----------+--------------+
                    v
                Layer 5  two-source interference, photon polarisation
                    |
                    v
                Layer 6  Breit-Wheeler, light-by-light, pair transverse
                         momentum, azimuthal structure
```

External inputs, entering at the layer shown: `SmallXAndSaturation` supplies the dipole amplitude
and its unitarity bound to Layers 3 and 4, and consumes the photon wave functions of Layer 3.
`Diffraction` supplies the optical theorem to Layer 2 and the Good–Walker decomposition to Layer 4.
`NuclearPartonDistributions` supplies the nuclear densities to Layer 1 and the shadowing description
compared against in Layer 4. `LightNuclei` supplies `j₀` and the light-nucleus densities to Layers 1
and 4. `QuarkoniaAndExotics` supplies the vector-meson states to Layers 3 and 5.
`GeneralizedPartonDistributions` supplies the finite-virtuality exclusive amplitude compared against
in Layer 3. `CollinearEvolution` supplies the evolution operator to Layer 2.

## Acceptance examples

The roadmap is complete when the following can be stated and proved against the library.

1. **Flux consistency.** The integral of the impact-parameter flux of 1.1 over separations exceeding
   a given minimum equals the integrated flux of 0.5, for every positive photon energy, Lorentz
   factor and minimum separation.
2. **Coherence cutoff as an asymptotic theorem.** The integrated flux decays exponentially in the
   product of photon energy and minimum separation divided by the Lorentz factor, with the rate
   equal to two, proved from the asymptotics of `K₀` and `K₁` defined in 0.5.
3. **Survival bounds.** The survival factor lies in the unit interval, is monotone in the
   separation, and differs from the black-disk indicator by an amount bounded by the overlap
   integral over the transition region, for the Woods–Saxon profile with any positive diffuseness.
4. **The longitudinal photon decouples.** The longitudinal photoproduction cross section vanishes at
   the real-photon point, proved from the tensor decomposition of
   `EpsilonEridani.QFT.Scattering.DIS.Tensors.Longitudinal` and not assumed.
5. **Vector-meson dominance is isolated.** Every theorem in the library whose statement depends on
   vector-meson dominance carries it as an explicit hypothesis, and the library contains no
   definition that presupposes it. This is checkable by inspection of the hypothesis lists.
6. **The heavier meson probes the smaller dipole.** The mean dipole size weighted by the
   photon–meson overlap is strictly decreasing in the vector-meson mass, for the boosted-Gaussian
   wave-function family, at the real-photon point.
7. **The uniform-sphere minima.** The form factor of a uniform sphere of radius `R` vanishes exactly
   at the non-zero solutions of `tan(qR) = qR`, these are simple zeros, and the first lies strictly
   between `π/R` and `3π/(2R)`.
8. **Gaussian densities have no minima.** The form factor of a Gaussian density is strictly
   positive, so a coherent distribution with diffractive minima is evidence of an edge.
9. **Zero fluctuation implies zero incoherent cross section.** If the amplitude is constant on the
   configuration space, the incoherent cross section obtained from the Good–Walker decomposition
   vanishes identically.
10. **Suppression obeys the unitarity bound.** The nuclear suppression factor of 4.4 is at most one
    whenever the dipole amplitude satisfies the unitarity bound of `SmallXAndSaturation`, and is
    monotone decreasing in the target opacity.
11. **The interference dip.** For a vector-meson final state, the two-source interference weight
    vanishes identically at zero pair transverse momentum, for every source separation; and the
    integrated cross section has a strict local minimum there whenever the separation distribution
    has bounded support.
12. **The profile is not automatically a density.** There exists an amplitude, monotone and positive
    in the momentum transfer, whose transverse transform takes a negative value; and the transform
    is non-negative if and only if the amplitude is positive-definite on the transverse translation
    group.
13. **Breit–Wheeler limits.** The derived cross section vanishes below threshold, vanishes at
    threshold proportionally to the lepton velocity, and falls as the inverse squared invariant mass
    times a logarithm at high invariant mass.
14. **Light-by-light is finite and gauge invariant.** The one-loop photon–photon amplitude, in the
    Feynman-parameter representation of 6.2, is finite and satisfies the Ward identity, and reduces
    to the Euler–Heisenberg form below the fermion mass with the cross section scaling as the sixth
    power of the energy.

## References

- C. F. von Weizsäcker, *Ausstrahlung bei Stössen sehr schneller Elektronen*, Z. Phys. **88** (1934)
  612.
- E. J. Williams, *Nature of the high energy particles of penetrating radiation and status of
  ionization and radiation formulae*, Phys. Rev. **45** (1934) 729.
- J. D. Jackson, *Classical Electrodynamics*, 3rd edition, Wiley (1998), chapter 15.
- V. M. Budnev, I. F. Ginzburg, G. V. Meledin and V. G. Serbo, *The two-photon particle production
  mechanism. Physical problems, applications, equivalent photon approximation*, Phys. Rept. **15**
  (1975) 181.
- C. A. Bertulani and G. Baur, *Electromagnetic processes in relativistic heavy ion collisions*,
  Phys. Rept. **163** (1988) 299.
- A. J. Baltz et al., *The physics of ultraperipheral collisions at the LHC*, Phys. Rept. **458**
  (2008) 1, arXiv:0706.3356.
- C. A. Bertulani, S. R. Klein and J. Nystrand, *Physics of ultra-peripheral nuclear collisions*,
  Ann. Rev. Nucl. Part. Sci. **55** (2005) 271, arXiv:nucl-ex/0502005.
- M. Vidović, M. Greiner, C. Best and G. Soff, *Impact parameter dependence of the electromagnetic
  particle production in ultrarelativistic heavy ion collisions*, Phys. Rev. C **47** (1993) 2308.
- K. Hencken, D. Trautmann and G. Baur, *Impact parameter dependence of the total probability for
  electromagnetic electron-positron pair production in relativistic heavy ion collisions*, Phys.
  Rev. A **51** (1995) 1874.
- S. R. Klein and J. Nystrand, *Exclusive vector meson production in relativistic heavy ion
  collisions*, Phys. Rev. C **60** (1999) 014903, arXiv:hep-ph/9902259.
- S. R. Klein and J. Nystrand, *Interference in exclusive vector meson production in heavy ion
  collisions*, Phys. Rev. Lett. **84** (2000) 2330, arXiv:hep-ph/9909237.
- F. Krauss, M. Greiner and G. Soff, *Photon and gluon induced processes in relativistic heavy ion
  collisions*, Prog. Part. Nucl. Phys. **39** (1997) 503.
- J. J. Sakurai, *Theory of strong interactions*, Ann. Phys. **11** (1960) 1.
- T. H. Bauer, R. D. Spital, D. R. Yennie and F. M. Pipkin, *The hadronic properties of the photon
  in high-energy interactions*, Rev. Mod. Phys. **50** (1978) 261.
- V. N. Gribov, *Interaction of gamma quanta and electrons with nuclei at high energies*, Sov. Phys.
  JETP **30** (1970) 709.
- A. Donnachie and P. V. Landshoff, *Total cross-sections*, Phys. Lett. B **296** (1992) 227,
  arXiv:hep-ph/9209205.
- N. N. Nikolaev and B. G. Zakharov, *Colour transparency and scaling properties of nuclear shadowing
  in deep inelastic scattering*, Z. Phys. C **49** (1991) 607.
- M. G. Ryskin, *Diffractive J/psi electroproduction in LLA QCD*, Z. Phys. C **57** (1993) 89.
- S. J. Brodsky, L. Frankfurt, J. F. Gunion, A. H. Mueller and M. Strikman, *Diffractive
  leptoproduction of vector mesons in QCD*, Phys. Rev. D **50** (1994) 3134,
  arXiv:hep-ph/9402283.
- H. Kowalski, L. Motyka and G. Watt, *Exclusive diffractive processes at HERA within the dipole
  picture*, Phys. Rev. D **74** (2006) 074016, arXiv:hep-ph/0606272.
- H. Kowalski and D. Teaney, *An impact parameter dipole saturation model*, Phys. Rev. D **68**
  (2003) 114005, arXiv:hep-ph/0304189.
- S. Munier, A. M. Staśto and A. H. Mueller, *Impact parameter dependent S-matrix for dipole proton
  scattering from diffractive meson electroproduction*, Nucl. Phys. B **603** (2001) 427,
  arXiv:hep-ph/0102291.
- M. L. Good and W. D. Walker, *Diffraction dissociation of beam particles*, Phys. Rev. **120**
  (1960) 1857.
- R. J. Glauber, *Lectures in Theoretical Physics*, volume 1, Interscience (1959), page 315.
- R. J. Glauber and G. Matthiae, *High-energy scattering of protons by nuclei*, Nucl. Phys. B **21**
  (1970) 135.
- R. D. Woods and D. S. Saxon, *Diffuse surface optical model for nucleon-nuclei scattering*, Phys.
  Rev. **95** (1954) 577.
- L. Frankfurt, V. Guzey and M. Strikman, *Leading twist nuclear shadowing phenomena in hard
  processes with nuclei*, Phys. Rept. **512** (2012) 255, arXiv:1106.2091.
- V. Guzey, M. Strikman and M. Zhalov, *Accessing transverse nucleon and gluon distributions in heavy
  nuclei using coherent vector meson photoproduction at high energies in ion ultraperipheral
  collisions*, Phys. Rev. C **95** (2017) 025204, arXiv:1611.05471.
- H. Mäntysaari and B. Schenke, *Evidence of strong proton shape fluctuations from incoherent
  diffraction*, Phys. Rev. Lett. **117** (2016) 052301, arXiv:1603.04349.
- T. Toll and T. Ullrich, *The dipole model Monte Carlo generator Sartre 1*, Comput. Phys. Commun.
  **185** (2014) 1835, arXiv:1307.8059.
- G. Breit and J. A. Wheeler, *Collision of two light quanta*, Phys. Rev. **46** (1934) 1087.
- H. Euler and W. Heisenberg, *Folgerungen aus der Diracschen Theorie des Positrons*, Z. Phys.
  **98** (1936) 714.
- R. Karplus and M. Neuman, *The scattering of light by light*, Phys. Rev. **83** (1951) 776.
- D. d'Enterria and G. G. da Silveira, *Observing light-by-light scattering at the Large Hadron
  Collider*, Phys. Rev. Lett. **111** (2013) 080405, arXiv:1305.7142.
- ATLAS Collaboration, *Evidence for light-by-light scattering in heavy-ion collisions with the
  ATLAS detector at the LHC*, Nature Phys. **13** (2017) 852, arXiv:1702.01625.
- C. Li, J. Zhou and Y.-J. Zhou, *Probing the linear polarization of photons in ultraperipheral heavy
  ion collisions*, Phys. Lett. B **795** (2019) 576, arXiv:1903.10084.
- STAR Collaboration, *Measurement of e⁺e⁻ momentum and angular distributions from linearly
  polarized photon collisions*, Phys. Rev. Lett. **127** (2021) 052302, arXiv:1910.12400.
- R. Abdul Khalek et al., *Science requirements and detector concepts for the Electron-Ion Collider:
  EIC Yellow Report*, Nucl. Phys. A **1026** (2022) 122447, arXiv:2103.05419, Volume II,
  subsection 7.3.9.

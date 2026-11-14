<!--epsiloneridani-status:v1 {"roadmap":"ElectroweakAndBSM","to_sha":"f8d9db760d4639c3753a44e20ecdb794fd745b3c","ts":"2026-11-02T21:25:52+00:00"}-->
<!--epsiloneridani-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"general g_V/g_A and NeutralCurrent bridge, C_1q/C_2q and Moller, the quark mixing matrix, the running mixing angle, explicit multiplet charges","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"7645b0e768537ca6665adc7a637e4b55faccb858c8a954ca4592d720423176bf","roadmap":"ElectroweakAndBSM","to_sha":"f8d9db760d4639c3753a44e20ecdb794fd745b3c"}-->
# Status: ElectroweakAndBSM

This file documents the status of the ElectroweakAndBSM roadmap up until `f8d9db7` (2026-11-02T21:25:52+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/eic/EpsilonEridaniProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is partly done. Anomaly cancellation (§0.1), the charge as the unbroken generator (§0.2) and neutral-gauge mixing (§0.3) are proved. The derived neutral-current couplings, `C_{1q}`/`C_{2q}`, the quark mixing matrix and the running mixing angle (§0.4 to §0.7) have not started. Nothing has landed for Layers 1 to 5.

### Named results

- **The classification of anomaly-free hypercharges** — for one generation, the four anomaly coefficients vanish exactly on rescalings of the Standard Model assignment, on the same rescalings with the two right-handed quark singlets swapped, and on the degenerate family `(0, t, -t, 0, 0)` ([`isAnomalyFree_iff_exists_eq_smul_standardModel_or_swapQuarkSinglets_or_mk_zero_neg`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/Representation.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.GenerationAssignments.isAnomalyFree_iff_exists_eq_smul_standardModel_or_swapQuarkSinglets_or_mk_zero_neg)). This is the accurate form of the README's "unique up to scale", which has to allow these two exceptions.
- **Electric charge as the unbroken generator** — for a nonzero vacuum `(0, v)`, the generators of `su(2) ⊕ u(1)` that annihilate the Higgs vacuum form exactly one line ([`doubletStabilizer_higgsVacuum`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/ElectricCharge.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.doubletStabilizer_higgsVacuum)).
- **The charge formula `Q = T³ + Y/2`** — that unbroken generator acts on a doublet of hypercharge `Y` as `T³ + Y/2` and on a singlet as `Y/2` ([`doubletAction_electricChargeGenerator`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/ElectricCharge.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.doubletAction_electricChargeGenerator)).
- **The two definitions of the weak mixing angle agree** — a rotation of `(W³, B)` diagonalises the neutral mass matrix with a massless photon if and only if its angle is `arctan(g'/g)` ([`rotation_conj_neutralMassMatrix_eq_diagonal_iff`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/Mixing.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.rotation_conj_neutralMassMatrix_eq_diagonal_iff)).
- **Exactly one massless neutral boson** — for a nonzero vacuum expectation value, a combination of `W³` and `B` is massless exactly when it is a multiple of `g' W³ + g B` ([`neutralMassMatrix_mulVec_eq_zero_iff`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/Mixing.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.neutralMassMatrix_mulVec_eq_zero_iff)).

### Notable definitions and infrastructure

- **Hypercharge assignments of a generation** ([`GenerationAssignments`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/Representation.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.GenerationAssignments)) — the five multiplets with chirality, colour and isospin data, in the `Q = T³ + Y/2` normalisation of Convention 3. Their anomaly conditions are shown to coincide with Physlib's one-family conditions, so later layers can use either.
- **The tree-level weak mixing angle** ([`weakMixingAngle`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/Mixing.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.weakMixingAngle)) — `arctan(g'/g)`, with its sine, cosine and tangent written in terms of the couplings. The existing parameter record's consistency condition is proved to be [`sin2ThetaW = sin² θ_W`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/QFT/Scattering/DIS/PVES/Electroweak/Mixing.html#EpsilonEridani.QFT.Scattering.DIS.PVES.Electroweak.weakMixingConsistency_iff_sin2ThetaW_eq_sin_sq_weakMixingAngle). This angle is a tree-level coupling ratio, not yet the scheme-tagged running parameter that Convention 1 requires.

### Roadmap coverage

Layer 0 is partial. §0.1 and §0.3 are proved. §0.2 is proved for a general doublet and singlet, but this material does not show the five physical multiplet charges computed explicitly, and the proof uses explicit matrices rather than the TauCeti weight machinery. §0.4 (general `g_V`/`g_A` and the bridge to the existing `NeutralCurrent` definitions), §0.5 (`C_{1q}`, `C_{2q}`), §0.6 (the mixing matrix as a unitary-group element) and §0.7 (the coupling flow) have not started. Layers 1 to 5 (electroweak cross sections, asymmetries, the dimension-six basis, blind directions, neighbouring-field connections) are untouched. Acceptance example 1 is met except for the explicit charge table. None of examples 2 to 23 is met.

## The frontier

- **General neutral-current couplings (§0.4)** — define `g_V`, `g_A`, `g_L` and `g_R` as functions of `(T³, Q, sin²θ_W)` and prove that the existing `NeutralCurrent` couplings are their values at the derived quantum numbers (acceptance example 2). The neutrino statement (zero charge, nonzero neutral-current coupling) follows from the same functions. The charge formula and mixing angle above are the inputs.
- **The five physical charges (§0.2)** — evaluate the doublet and singlet charge functions at the Standard Model hypercharges and record the quark and lepton charges as closed computations. This closes acceptance example 1.
- **`C_{1q}`, `C_{2q}` and Møller (§0.5)** — derive the Standard Model expressions in `sin²θ_W` and the `1 - 4 sin²θ_W` Møller combination (acceptance examples 3 and 4). These come straight after §0.4.
- **The quark mixing matrix (§0.6)** — introduce it as an element of the unitary group. Prove the row and column relations and count parameters as a quotient dimension. Physlib's CKM rows are available to consume.
- **The running mixing angle (§0.7)** — a scheme-tagged one-loop flow with existence, smooth dependence on the initial condition and a Gronwall stability bound. Nothing upstream provides an electroweak flow. The scalar-loop coefficient is a labelled hypothesis, not a milestone.

<!--epsiloneridani-status:v1 {"roadmap":"LightNuclei","to_sha":"02b225d29c4812b9bdfd55d2f4f06f4044799e54","ts":"2026-11-25T23:31:35+00:00"}-->
<!--epsiloneridani-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Bessel asymptotics and bounds, Riccati forms, Legendre bound and completeness, spherical harmonics, addition theorem, partial-wave expansion","state":"partial"},{"id":"Layer 1","remaining":"deuteron structure and Pauli channels, tensor operator and d-state probability, spin-one hadronic tensor, tensor structure function vs d-state","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"1cad9c2835594c1d634c0c79376c0091349168edce769e07577555ea5ce2c48f","roadmap":"LightNuclei","to_sha":"02b225d29c4812b9bdfd55d2f4f06f4044799e54"}-->
# Status: LightNuclei

This file documents the status of the LightNuclei roadmap up until `02b225d` (2026-11-25T23:31:35+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/eic/EpsilonEridaniProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0's core special functions are in place: the Legendre polynomials and both kinds of spherical Bessel function, with their equations, recurrences and behaviour at the origin. Layer 0 is still partial, though. Asymptotics, completeness, spherical harmonics and the partial-wave expansion are missing. Layer 1 has its spin-one density matrix and nothing else. Layers 2–5 have not begun.

### Named results

- **The Legendre orthogonality relation** — the integral of PₘPₙ over [-1, 1] is 0 for m ≠ n and 2/(2n+1) for m = n ([`integral_legendre_mul_legendre`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/Legendre/Basic.html#EpsilonEridani.Polynomial.integral_legendre_mul_legendre)). Legendre's differential equation in Sturm–Liouville form is also proved ([`derivative_one_sub_X_sq_mul_derivative_legendre`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/Legendre/Basic.html#EpsilonEridani.Polynomial.derivative_one_sub_X_sq_mul_derivative_legendre)).
- **The spherical Bessel equation** — jₗ satisfies x²j'' + 2xj' + (x² − l(l+1))j = 0 on the whole line, origin included ([`sphericalBesselJ_equation`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/SphericalBessel/Basic.html#EpsilonEridani.sphericalBesselJ_equation)). The second kind satisfies it off the origin ([`sphericalBesselY_equation`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/SphericalBessel/SecondKind.html#EpsilonEridani.sphericalBesselY_equation)).
- **The Wronskian of the two kinds** — jₗyₗ' − jₗ'yₗ = x⁻² for x ≠ 0, so the two kinds are independent solutions ([`wronskian_sphericalBesselJ_sphericalBesselY`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/SphericalBessel/SecondKind.html#EpsilonEridani.wronskian_sphericalBesselJ_sphericalBesselY)).
- **The spin-one decomposition** — every 3×3 matrix, and so every spin-one density matrix, is recovered from its trace, its vector polarisation and its tensor polarisation ([`spinOneMatrix_decomposition`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Nuclei/Light/SpinDensityMatrix.html#EpsilonEridani.Spin.spinOneMatrix_decomposition)). For spin one half, the tensor part vanishes identically ([`tensorPolarization_spinHalfMatrix`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Nuclei/Light/SpinDensityMatrix.html#EpsilonEridani.Spin.tensorPolarization_spinHalfMatrix)).
- **The positivity bound on spin-one polarisation** — positive semidefiniteness forces 3|Pₖ| ≤ 2 + Pₖₖ, alongside −2 ≤ Pᵢᵢ ≤ 1 and |Pₖ| ≤ 1 ([`three_mul_norm_vectorPolarization_spinOneMatrix_le`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Nuclei/Light/SpinDensityMatrix.html#EpsilonEridani.Spin.three_mul_norm_vectorPolarization_spinOneMatrix_le)).

### Notable definitions and infrastructure

- **The spherical Bessel functions of the first kind** ([`sphericalBesselJ`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/SphericalBessel/Basic.html#EpsilonEridani.sphericalBesselJ)) are defined as xˡ times an even, everywhere-analytic factor built by the Rayleigh formula. Because of that factor, the ladder relations, recurrence and limits at the origin hold on the whole line rather than only for x > 0. The second kind ([`sphericalBesselY`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Mathematics/SpecialFunctions/SphericalBessel/SecondKind.html#EpsilonEridani.sphericalBesselY)) uses the same idea, dividing an analytic factor by xˡ⁺¹.
- **Vector and tensor polarisation** ([`vectorPolarization`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Nuclei/Light/SpinDensityMatrix.html#EpsilonEridani.Spin.vectorPolarization), [`tensorPolarization`](https://eic.github.io/EpsilonEridani/docs/EpsilonEridani/Particles/Nuclei/Light/SpinDensityMatrix.html#EpsilonEridani.Spin.tensorPolarization)) are defined as traces against the spin matrices and the spin tensor operator, for any spin. These are the objects that the spin-one hadronic tensor of Layer 1.4 will be linear in.

### Roadmap coverage

**Layer 0** is partial:

- **0.1, Legendre polynomials:** the recurrence, degree, parity, values at ±1, orthogonality with normalisation, and closed forms through degree three are proved. The bound |Pₙ| ≤ 1, completeness in L² and the addition theorem are not.
- **0.3, first-kind Bessel functions:** the equation, values and leading behaviour at the origin, recurrence and ladder relations are proved. Large-argument asymptotics, the bound by one and the closure relation are not.
- **0.4, second kind:** the recurrence, divergence at the origin and the Wronskian are proved. Asymptotics and the Riccati-Bessel forms are not.
- **0.2 (spherical harmonics) and 0.5 (partial waves):** untouched.

**Layer 1** is partial. Only 1.3, the spin density matrix, has landed. It is done by hand in the Cartesian basis, with orthogonality as an explicit trace Gram matrix, rather than via the upstream Clebsch-Gordan theorem the README asks for. The deuteron structure (1.1), the tensor operator and d-state probability (1.2), the hadronic tensor (1.4) and 1.5 are untouched.

**Layers 2–5:** nothing has landed.

The declaration listing for the most recent work was truncated, so some smaller lemmas may be missing from this account.

## The frontier

- **Bessel asymptotics** — jₗ(x) ~ sin(x − lπ/2)/x and the cosine form for yₗ. Together with the bound |jₗ| ≤ 1, these complete 0.3 and 0.4 apart from the distributional closure relation.
- **Riccati-Bessel forms** — x·jₗ and x·yₗ with the equation free of first-derivative terms. This is the form in which Layer 5's radial equation is written, and it now follows directly from the existing equations.
- **Spherical harmonics and the Legendre addition theorem** — 0.2 needs the harmonic-polynomial definition, the dimension 2l + 1 and orthonormality on the sphere. The addition theorem in 0.1 waits on these.
- **Legendre completeness and |Pₙ| ≤ 1** — completeness is the Hilbert-basis statement on [-1, 1]. Orthogonality and the Sturm–Liouville equation are in place to build on.
- **The deuteron structure and tensor operator (1.1–1.2)** — the deuteron's channel labels come from Layer 0's partial-wave material (0.5). That dependency is the real blocker for most of Layer 1 beyond the density matrix.

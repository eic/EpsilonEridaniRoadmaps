# Deep Inelastic Scattering (DIS) Kinematics

This roadmap aims to formalize the mathematical foundation for Deep Inelastic Scattering (DIS) kinematics at the Electron-Ion Collider (EIC).
We want to define the core variables (Q², x, y, W²) and their relations in Lean 4.

## Milestones

1. **Four-Momenta**: Define four-momenta for the incoming electron ($k$), incoming hadron ($p$), and scattered electron ($k'$).
2. **Lorentz Invariants**: Define the standard DIS Lorentz invariant scalars:
   - $Q^2 = -(k - k')^2$
   - $x = Q^2 / (2 p \cdot q)$ where $q = k - k'$
   - $y = (p \cdot q) / (p \cdot k)$
   - $W^2 = (p + q)^2$
3. **Kinematic Relations**: Prove basic relations between these variables, such as:
   - $Q^2 = s x y$ (ignoring masses)
   - $W^2 = Q^2 (1 - x) / x + M^2$

## Guidance for Agents

- Use the Mathlib definitions for real inner product spaces and Lorentz metric where appropriate.
- Focus on establishing the definitions cleanly before attempting the proofs.

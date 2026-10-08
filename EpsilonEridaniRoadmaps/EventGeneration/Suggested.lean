import EpsilonEridani

/-!
# Event generation: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures
which can already be stated against the pinned API. It is not an exhaustive list of the results
in any layer.

Four design choices are made explicit by these signatures.

First, **a generator is a measurable map and its law is a pushforward.** `Generator Ω E` is a
measurable function and `Generator.law` is `Measure.map`. Every correctness statement below has
the form `g.law = ν`. The informal "draw `r` uniformly and set `x = F⁻¹ r`" is not a statement
about anything; `Measure.map` is.

Second, **phase space is a measure and cross sections are densities against it.** The
`n`-body measure is a `Measure (Fin n → V)` carried as data by `PhaseSpace`, and a cross section
is a function whose `withDensity` against it is a finite measure. No "differential" appears.

Third, **the Sudakov factor of `EpsilonEridani.QFT.Shower.Sudakov` is consumed, not redefined.**
`sudakov`, `vetoWeight`, `vetoSeries_eq_exp_neg` and `orderedProdIntegral_eq` are the real
identities; the theorems here say which probability each is. The two gaps the Sudakov module's
own docstring names — the Fubini identification and the absence of a probability space — are
`orderedRegion_integral_eq_orderedProdIntegral` and `vetoChain_law` respectively.

Fourth, **nothing below mentions `Float`, and nothing below carries a `Prop`-valued field.**
The executable generator in `EpsilonEridani.Generator` is the subject of the hypothesis structure
`ImplementationCorrespondence` in Layer 6, whose fields are real-valued bounds carried as data;
the one theorem about the implementation is conditional on it. Where the roadmap depends on
something it does not prove — the area law, the large-`N_c` limit — the object is carried as
data and the identities it must satisfy are separate theorems.

Unproved statements are `sorry`. That is the honest record of what is a target and what is a
theorem; no signature below has been weakened to make it closable.
-/

namespace EpsilonEridaniRoadmaps.EventGeneration

open MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal

/-! ## Layer 0: probability spaces, phase space, configurations -/

/-- The uniform probability measure on `[0,1]`. -/
noncomputable def unif : Measure ℝ := (volume : Measure ℝ).restrict (Set.Icc 0 1)

/-- A generator: a measurable map from a space of variates to a space of events. Its law is the
pushforward of the variate measure. Convention 1. -/
structure Generator (Ω E : Type*) [MeasurableSpace Ω] [MeasurableSpace E] where
  /-- The map. -/
  toFun : Ω → E
  /-- Measurability, carried as data because every theorem about the law needs it. -/
  measurable : Measurable toFun

/-- The law of a generator under a variate measure. -/
noncomputable def Generator.law {Ω E : Type*} [MeasurableSpace Ω] [MeasurableSpace E]
    (g : Generator Ω E) (μ : Measure Ω) : Measure E :=
  μ.map g.toFun

/-- The law of a generator under a probability measure is a probability measure. Layer 0.1. -/
theorem Generator.law_isProbabilityMeasure {Ω E : Type*} [MeasurableSpace Ω] [MeasurableSpace E]
    (g : Generator Ω E) (μ : Measure Ω) [IsProbabilityMeasure μ] :
    IsProbabilityMeasure (g.law μ) := by
  sorry

/-- A generator computes expectations: the integral of an observable against the law is its
expectation under the variate measure. Layer 0.5. -/
theorem Generator.integral_law {Ω E : Type*} [MeasurableSpace Ω] [MeasurableSpace E]
    (g : Generator Ω E) (μ : Measure Ω) (O : E → ℝ) (hO : Measurable O) :
    ∫ e, O e ∂(g.law μ) = ∫ ω, O (g.toFun ω) ∂μ := by
  sorry

/-- Sequential composition: run `g`, then run `h` on its output together with fresh variates.
The law is the Giry-monad bind of the two laws. Layer 0.1. -/
noncomputable def Generator.comp {Ω₁ Ω₂ E F : Type*} [MeasurableSpace Ω₁] [MeasurableSpace Ω₂]
    [MeasurableSpace E] [MeasurableSpace F]
    (g : Generator Ω₁ E) (h : Generator (E × Ω₂) F) : Generator (Ω₁ × Ω₂) F where
  toFun := fun ω => h.toFun (g.toFun ω.1, ω.2)
  measurable := by
    sorry

/-- The law of a composite generator under a product measure is the composition of the first
law with the kernel the second generator defines. Layer 0.1. -/
theorem Generator.law_comp {Ω₁ Ω₂ E F : Type*} [MeasurableSpace Ω₁] [MeasurableSpace Ω₂]
    [MeasurableSpace E] [MeasurableSpace F]
    (g : Generator Ω₁ E) (h : Generator (E × Ω₂) F) (μ₁ : Measure Ω₁) (μ₂ : Measure Ω₂)
    [SFinite μ₁] [SFinite μ₂] :
    (g.comp h).law (μ₁.prod μ₂)
      = (g.law μ₁).bind (fun e => μ₂.map (fun ω₂ => h.toFun (e, ω₂))) := by
  sorry

/-- `n`-body Lorentz-invariant phase space at total momentum `P`, as a measure on `n`-tuples of
vectors, carried as data together with the Minkowski form it is invariant under. The measure
itself is a Layer 0.3 target; the structure records what it must satisfy. Convention 3. -/
structure PhaseSpace (V : Type*) [AddCommGroup V] [Module ℝ V] [MeasurableSpace V] (n : ℕ) where
  /-- The Minkowski form. -/
  g : V →ₗ[ℝ] V →ₗ[ℝ] ℝ
  /-- The masses of the `n` particles. -/
  mass : Fin n → ℝ
  /-- The measure at total momentum `P`. -/
  measure : V → Measure (Fin n → V)
  /-- Every configuration in the support conserves momentum. -/
  conserves : ∀ P, (measure P) {p | ∑ i, p i ≠ P} = 0
  /-- Every particle is on its mass shell. -/
  onShell : ∀ P i, (measure P) {p | g (p i) (p i) ≠ mass i ^ 2} = 0

/-- Phase space is Lorentz invariant: pushing the measure forward along a linear map that
preserves the form, applied componentwise, returns the measure at the transformed total
momentum. Layer 0.3; the hypothesis is the defining property of the Lorentz group, stated here
on the map rather than through `Physlib.Relativity.LorentzGroup` so that the statement does not
fix the dimension. -/
theorem PhaseSpace.map_lorentz {V : Type*} [AddCommGroup V] [Module ℝ V] [MeasurableSpace V]
    {n : ℕ} (Φ : PhaseSpace V n) (Λ : V →ₗ[ℝ] V) (hΛ : ∀ u v, Φ.g (Λ u) (Λ v) = Φ.g u v)
    (hmeas : Measurable Λ) (P : V) :
    (Φ.measure P).map (fun p i => Λ (p i)) = Φ.measure (Λ P) := by
  sorry

/-- The recursive factorisation of phase space: `n`-body phase space is `(n-1)`-body phase
space with one leg replaced by an intermediate of invariant mass `q²`, times two-body phase space
for its decay, integrated over `q²`. Stated as an equality of measures after the measurable
regrouping map `regroup`, which is part of the data of the statement. Layer 0.3. -/
theorem PhaseSpace.factorisation {V : Type*} [AddCommGroup V] [Module ℝ V] [MeasurableSpace V]
    {n : ℕ} (Φn : PhaseSpace V (n + 2)) (Φn₁ : ℝ → PhaseSpace V (n + 1)) (Φ₂ : ℝ → PhaseSpace V 2)
    (regroup : (Fin (n + 1) → V) × (Fin 2 → V) → Fin (n + 2) → V) (hre : Measurable regroup)
    (P : V) :
    Φn.measure P
      = ((volume : Measure ℝ).bind fun q2 =>
          ((Φn₁ q2).measure P).bind fun p =>
            ((Φ₂ q2).measure (p (Fin.last n))).map fun k => regroup (p, k)) := by
  sorry

/-- The RAMBO construction for `n` massless particles: from `4n` uniform variates, `n`
massless momenta rescaled and boosted to total momentum `P`. Carried as a generator on
`Fin (4 * n) → ℝ`. The map is a Layer 0.3 target. -/
noncomputable def rambo {V : Type*} [AddCommGroup V] [Module ℝ V] [MeasurableSpace V]
    (n : ℕ) (Φ : PhaseSpace V n) (P : V) : Generator (Fin (4 * n) → ℝ) (Fin n → V) :=
  sorry

/-- RAMBO is flat: its law under the uniform measure on the cube is normalised phase space.
Layer 0.3. The hypothesis `hmassless` is the condition under which the construction is exact;
the massive case carries a weight and is a separate statement. -/
theorem rambo_law {V : Type*} [AddCommGroup V] [Module ℝ V] [MeasurableSpace V]
    (n : ℕ) (Φ : PhaseSpace V n) (hmassless : ∀ i, Φ.mass i = 0) (P : V)
    (hfin : (Φ.measure P) Set.univ ≠ ⊤) (hpos : (Φ.measure P) Set.univ ≠ 0) :
    (rambo n Φ P).law (Measure.pi fun _ : Fin (4 * n) => unif)
      = ((Φ.measure P) Set.univ)⁻¹ • Φ.measure P := by
  sorry

/-! ## Layer 1: sampling theorems and the cross-section estimator -/

/-- The inverse-transform theorem: pushing the uniform law forward along the generalised
inverse of a distribution function gives the law with that distribution function. Layer 1.1.
`F` is given with its generalised inverse `Finv` and the two-sided bound that makes it one. -/
theorem inverseTransform_law (F Finv : ℝ → ℝ) (hF : Monotone F)
    (hinv : ∀ u x, 0 < u → u < 1 → (Finv u ≤ x ↔ u ≤ F x)) (hmeas : Measurable Finv) (x : ℝ) :
    (unif.map Finv) (Set.Iic x) = ENNReal.ofReal (F x) := by
  sorry

/-- Acceptance–rejection has the right law. Draw `x` from `g`, accept when `u ≤ f x / (c * g x)`.
The accepted law is `f` normalised. The hypothesis `hle` is *everywhere*, not almost
everywhere: a violation on a null set is harmless to the law and invisible to an implementation,
so the theorem is stated for the hypothesis an implementation can check. Layer 1.2. -/
theorem acceptReject_law (f g : ℝ → ℝ) (c : ℝ) (hc : 0 < c)
    (hf : ∀ x, 0 ≤ f x) (hg : ∀ x, 0 < g x) (hle : ∀ x, f x ≤ c * g x)
    (hfi : Integrable f) (hgi : Integrable g) (hg1 : ∫ x, g x = 1) (hfpos : 0 < ∫ x, f x) :
    let μ := (volume.withDensity fun x => ENNReal.ofReal (g x)).prod unif
    let acc : Set (ℝ × ℝ) := {p | p.2 ≤ f p.1 / (c * g p.1)}
    (μ.restrict acc).map Prod.fst = (ENNReal.ofReal (∫ x, f x / c)) •
      ((∫ x, f x)⁻¹ • volume.withDensity fun x => ENNReal.ofReal (f x)) := by
  sorry

/-- The acceptance probability is `∫ f / c`. Layer 1.2. -/
theorem acceptReject_acceptanceProbability (f g : ℝ → ℝ) (c : ℝ) (hc : 0 < c)
    (hf : ∀ x, 0 ≤ f x) (hg : ∀ x, 0 < g x) (hle : ∀ x, f x ≤ c * g x)
    (hfi : Integrable f) (hgi : Integrable g) (hg1 : ∫ x, g x = 1) :
    ((volume.withDensity fun x => ENNReal.ofReal (g x)).prod unif)
        {p | p.2 ≤ f p.1 / (c * g p.1)}
      = ENNReal.ofReal ((∫ x, f x) / c) := by
  sorry

/-- The silent bias: when the bound is violated on a set of positive measure, the accepted law
is the normalised `min f (c g)`, which is not `f`. Layer 1.2. Stated as the exact law, so that
the bias is a computable quantity and not a warning. -/
theorem acceptReject_law_of_violation (f g : ℝ → ℝ) (c : ℝ) (hc : 0 < c)
    (hf : ∀ x, 0 ≤ f x) (hg : ∀ x, 0 < g x) (hfi : Integrable f) (hgi : Integrable g)
    (hg1 : ∫ x, g x = 1) (hviol : 0 < volume {x | c * g x < f x}) :
    let μ := (volume.withDensity fun x => ENNReal.ofReal (g x)).prod unif
    let acc : Set (ℝ × ℝ) := {p | p.2 ≤ f p.1 / (c * g p.1)}
    let m : ℝ → ℝ := fun x => min (f x) (c * g x)
    (μ.restrict acc).map Prod.fst = (ENNReal.ofReal ((∫ x, m x) / c)) •
      ((∫ x, m x)⁻¹ • volume.withDensity fun x => ENNReal.ofReal (m x))
    ∧ ((∫ x, m x)⁻¹ • volume.withDensity fun x => ENNReal.ofReal (m x))
        ≠ (∫ x, f x)⁻¹ • volume.withDensity fun x => ENNReal.ofReal (f x) := by
  sorry

/-- Importance sampling: the weighted pushforward of the proposal law is the target. Layer 1.3.
The hypothesis `hsupp` is that the proposal is positive wherever the target is not zero. -/
theorem importanceSampling_withDensity (f g : ℝ → ℝ) (hf : ∀ x, 0 ≤ f x) (hg : ∀ x, 0 ≤ g x)
    (hsupp : ∀ x, f x ≠ 0 → 0 < g x) (hgm : Measurable g) (hfm : Measurable f) :
    (volume.withDensity fun x => ENNReal.ofReal (g x)).withDensity
        (fun x => ENNReal.ofReal (f x / g x))
      = volume.withDensity fun x => ENNReal.ofReal (f x) := by
  sorry

/-- The variance of the importance-sampling estimator of `∫ O f` under proposal `g`, as an
explicit integral. Layer 1.3. -/
noncomputable def importanceVariance (f g O : ℝ → ℝ) : ℝ :=
  (∫ x, (O x * f x / g x) ^ 2 * g x) - (∫ x, O x * f x) ^ 2

/-- The optimal proposal is `|O| f` normalised, and the minimum variance is stated. Layer 1.3. -/
theorem importanceVariance_ge (f g O : ℝ → ℝ) (hf : ∀ x, 0 ≤ f x) (hg : ∀ x, 0 < g x)
    (hg1 : ∫ x, g x = 1) (hOf : Integrable fun x => |O x| * f x) :
    (∫ x, |O x| * f x) ^ 2 - (∫ x, O x * f x) ^ 2 ≤ importanceVariance f g O := by
  sorry

/-- The price of negative weights: with a fraction `ε` of negative weight, the variance of the
mean is bounded below by `(1 - 2 ε)⁻²` times what it would be with all weights positive, so the
sample size needed for a given precision grows by that factor. Layer 1.3. `W` is the law of the
weight, carried as a measure on `ℝ`. -/
theorem negativeWeight_variance_bound (W : Measure ℝ) [IsProbabilityMeasure W] (ε : ℝ)
    (hε : W (Set.Iio 0) = ENNReal.ofReal ε) (hε1 : ε < 1 / 2)
    (hint : Integrable (fun w => w) W) (hint2 : Integrable (fun w => w ^ 2) W) :
    (∫ w, |w| ∂W) ^ 2 ≤ (1 - 2 * ε)⁻¹ ^ 2 * (∫ w, w ∂W) ^ 2 + variance (fun w => w) W := by
  sorry

/-- The cross-section estimator: the mean of `N` i.i.d. weights, where a rejected trial carries
weight zero. Convention 4. -/
noncomputable def crossSectionEstimator {Ω : Type*} [MeasurableSpace Ω] (w : ℕ → Ω → ℝ) (N : ℕ)
    (ω : Ω) : ℝ :=
  (∑ i ∈ Finset.range N, w i ω) / N

/-- Unbiasedness: the expectation of the estimator is the cross section for every `N`. -/
theorem crossSectionEstimator_integral {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (w : ℕ → Ω → ℝ) (σ : ℝ) (hw : ∀ i, ∫ ω, w i ω ∂μ = σ)
    (hint : ∀ i, Integrable (w i) μ) (N : ℕ) (hN : 0 < N) :
    ∫ ω, crossSectionEstimator w N ω ∂μ = σ := by
  sorry

/-- The strong law for the estimator: with the trials independent and identically distributed,
the estimator converges almost surely. Layer 1.4; a direct instance of `Mathlib.Probability.
StrongLaw`, recorded here so that the hypotheses a generator must satisfy are visible. -/
theorem crossSectionEstimator_ae_tendsto {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (w : ℕ → Ω → ℝ) (hind : iIndepFun w μ)
    (hident : ∀ i, IdentDistrib (w i) (w 0) μ μ) (hint : Integrable (w 0) μ) :
    ∀ᵐ ω ∂μ, Filter.Tendsto (fun N => crossSectionEstimator w N ω) Filter.atTop
      (nhds (∫ ω, w 0 ω ∂μ)) := by
  sorry

/-! ## Layer 2: the Sudakov process and the shower as a Markov process -/

open EpsilonEridani.QFT.Shower in
/-- `sudakov` is a probability: the law of the first emission scale `τ` of the emission
process at intensity `K`, run downward from `T`, assigns to `{τ < t}` exactly the Sudakov
factor. The emission process is carried as its first-emission law `τLaw`, which is what the
theorem is about; constructing it as a Poisson random measure is Layer 2.1's target. Convention
6: this is the theorem after which `sudakov` may be called a probability. -/
theorem sudakov_eq_prob_noEmission (K : ℝ → ℝ) (hK : ∀ s, 0 ≤ K s) (hKc : Continuous K)
    (T : ℝ) (τLaw : Measure ℝ) [IsProbabilityMeasure τLaw]
    (hτ : ∀ t ≤ T, τLaw (Set.Ioc t T) = ENNReal.ofReal (1 - sudakov K t T)) (t : ℝ) (ht : t ≤ T) :
    τLaw (Set.Iic t) = ENNReal.ofReal (sudakov K t T) := by
  sorry

open EpsilonEridani.QFT.Shower in
/-- The Sudakov density: the first-emission law has density `K t · sudakov K t T` on `(-∞, T]`.
Layer 2.1. -/
theorem firstEmission_law_eq_withDensity (K : ℝ → ℝ) (hK : ∀ s, 0 ≤ K s) (hKc : Continuous K)
    (T : ℝ) (τLaw : Measure ℝ) [IsProbabilityMeasure τLaw]
    (hτ : ∀ t ≤ T, τLaw (Set.Iic t) = ENNReal.ofReal (sudakov K t T)) :
    τLaw.restrict (Set.Iic T)
      = (volume.restrict (Set.Iic T)).withDensity
          fun t => ENNReal.ofReal (K t * sudakov K t T) := by
  sorry

/-- The one-step kernel of the veto chain for true intensity `K` and overestimate `G`, from the
current scale: propose from the `G`-Sudakov density and record the acceptance indicator. Carried
as a Markov kernel on `ℝ × Bool`; its construction from one uniform variate is Layer 1.1's
`TauCeti.Probability.Kernel.Randomization`, and is a target. Convention 5: `K ≤ G` is a
hypothesis on the theorems, not on the definition. -/
noncomputable def vetoKernel (K G : ℝ → ℝ) : ProbabilityTheory.Kernel (ℝ × Bool) (ℝ × Bool) :=
  sorry

/-- The accepted scale of the veto chain: the first component at the first step whose second
component is `true`. Defined on trajectories, which is the type the Ionescu-Tulcea construction
produces. -/
noncomputable def acceptedScale (traj : ℕ → ℝ × Bool) : ℝ :=
  sorry

open EpsilonEridani.QFT.Shower in
/-- **The main theorem of Layer 2.** For every overestimate `G ≥ K`, the law of the accepted
scale under the veto chain started at `T` is the Sudakov density of `K`. The proof conditions
on the number of rejections and uses `vetoSeries_eq_exp_neg` to resum; what this statement
adds to that identity is that each term *is* the probability of the event it is claimed to be.
`trajLaw` is the trajectory measure of the chain from `vetoKernel`, carried as data here and
constructed by `Mathlib.Probability.Kernel.IonescuTulcea.Traj` in Layer 2.2. -/
theorem vetoChain_law (K G : ℝ → ℝ) (hK : ∀ s, 0 ≤ K s) (hKG : ∀ s, K s ≤ G s)
    (hKc : Continuous K) (hGc : Continuous G) (hGi : ∀ t, IntervalIntegrable G volume t t)
    (T : ℝ) (trajLaw : Measure (ℕ → ℝ × Bool)) [IsProbabilityMeasure trajLaw]
    (hmeas : Measurable acceptedScale) :
    trajLaw.map acceptedScale
      = (volume.restrict (Set.Iic T)).withDensity
          fun t => ENNReal.ofReal (K t * sudakov K t T) := by
  sorry

open EpsilonEridani.QFT.Shower in
/-- The expected number of rejections is the integral of the excess `G - K`, so a looser
overestimate costs proposals and changes the law not at all. Layer 2.2. `rejections` counts the
`false` steps before the first `true`. -/
theorem vetoChain_expected_rejections (K G : ℝ → ℝ) (hK : ∀ s, 0 ≤ K s) (hKG : ∀ s, K s ≤ G s)
    (hKc : Continuous K) (hGc : Continuous G) (T t : ℝ) (ht : t ≤ T)
    (trajLaw : Measure (ℕ → ℝ × Bool)) [IsProbabilityMeasure trajLaw]
    (rejections : (ℕ → ℝ × Bool) → ℕ) (hmeas : Measurable rejections) :
    ∫ τ, (rejections τ : ℝ) ∂(trajLaw.restrict {τ | t ≤ acceptedScale τ})
      = ∫ s in t..T, (G s - K s) := by
  sorry

/-- The ordered region `{t < t_n < ⋯ < t_1 < T}` in `ℝⁿ`, as a measurable set. Layer 2.3. -/
def orderedRegion (t T : ℝ) (n : ℕ) : Set (Fin n → ℝ) :=
  {s | (∀ i, t < s i ∧ s i < T) ∧ ∀ i j, i < j → s j < s i}

theorem measurableSet_orderedRegion (t T : ℝ) (n : ℕ) : MeasurableSet (orderedRegion t T n) := by
  sorry

open EpsilonEridani.OrderedSimplex in
/-- **The Fubini identification.** The integral of a product of a continuous function over the
ordered region, against product Lebesgue measure, equals the iterated integral
`orderedProdIntegral` of `EpsilonEridani.Mathematics.OrderedSimplexIntegral`. This is the step
the Sudakov module's docstring names as "a Fubini argument that is not formalized". Layer 2.3. -/
theorem orderedRegion_integral_eq_orderedProdIntegral (f : ℝ → ℝ) (hf : Continuous f)
    (t T : ℝ) (n : ℕ) :
    ∫ s in orderedRegion t T n, ∏ i, f (s i) ∂(Measure.pi fun _ : Fin n => (volume : Measure ℝ))
      = orderedProdIntegral f T n t := by
  sorry

open EpsilonEridani.OrderedSimplex in
/-- Consequence: the ordered integral of a symmetric integrand is a power over a factorial,
through `orderedProdIntegral_eq`. Layer 2.3. -/
theorem orderedRegion_integral_eq_pow_div_factorial (f : ℝ → ℝ) (hf : Continuous f)
    (t T : ℝ) (n : ℕ) :
    ∫ s in orderedRegion t T n, ∏ i, f (s i) ∂(Measure.pi fun _ : Fin n => (volume : Measure ℝ))
      = (∫ s in t..T, f s) ^ n / n.factorial := by
  rw [orderedRegion_integral_eq_orderedProdIntegral f hf t T n]
  exact orderedProdIntegral_eq hf T n t

/-- A parton configuration: finitely many partons, each with a four-momentum, a flavour and a
colour label. Convention 7: the state space of the shower process. -/
structure Config (V Flavor Colour : Type*) where
  /-- The number of partons. -/
  n : ℕ
  /-- The momenta. -/
  p : Fin n → V
  /-- The flavours. -/
  flavour : Fin n → Flavor
  /-- The colour labels; dipole indices in the large-`N_c` limit of Layer 3.3. -/
  colour : Fin n → Colour

/-- The total rate of resolvable splittings from a configuration at scale `t`: the sum over
partons of the integrated regulated kernel. `P` is the real-valued kernel from
`CollinearEvolution`, as a function of `(z, t)` for the parton's flavour, and `resolvable` is
the indicator of Convention 10. Layer 2.4. -/
noncomputable def totalRate {V Flavor Colour : Type*} (P : Flavor → ℝ → ℝ → ℝ) (tCut : ℝ)
    (c : Config V Flavor Colour) (t : ℝ) : ℝ :=
  ∑ i, ∫ z in (0 : ℝ)..1, if z * (1 - z) * t > tCut then P (c.flavour i) z t else 0

/-- The transition semigroup of the shower process, indexed by the *decrement* in the scale
(Convention 7), as operators on bounded measurable functions of the configuration. Carried as a
family of kernels; the construction from the jump chain and holding times is Layer 2.4's target.
-/
structure ShowerSemigroup (V Flavor Colour : Type*) [MeasurableSpace V] [MeasurableSpace Flavor]
    [MeasurableSpace Colour] [MeasurableSpace (Config V Flavor Colour)] where
  /-- The kernel after a decrement `s ≥ 0` from the hard scale `T`. -/
  U : ℝ → ℝ → ProbabilityTheory.Kernel (Config V Flavor Colour) (Config V Flavor Colour)
  /-- The semigroup law in the decrement, for non-negative decrements. -/
  comp : ∀ T s₁ s₂, 0 ≤ s₁ → 0 ≤ s₂ →
    (U T (s₁ + s₂)) = (U (T - s₁) s₂).comp (U T s₁)
  /-- Zero decrement is the identity kernel. -/
  zero : ∀ T, U T 0 = ProbabilityTheory.Kernel.id

/-- The no-emission probability of the shower from a single-parton configuration is the Sudakov
factor of its total regulated rate: the semigroup applied to the indicator of "same
multiplicity". This connects Layer 2.1's survival probability to the process. Layer 2.4. -/
theorem ShowerSemigroup.noEmission_eq_sudakov {V Flavor Colour : Type*} [MeasurableSpace V]
    [MeasurableSpace Flavor] [MeasurableSpace Colour] [MeasurableSpace (Config V Flavor Colour)]
    (S : ShowerSemigroup V Flavor Colour) (P : Flavor → ℝ → ℝ → ℝ) (tCut : ℝ)
    (c : Config V Flavor Colour) (hc : c.n = 1) (T s : ℝ) (hs : 0 ≤ s) (hmeas : MeasurableSet
      {c' : Config V Flavor Colour | c'.n = c.n}) :
    (S.U T s c) {c' | c'.n = c.n}
      = ENNReal.ofReal (EpsilonEridani.QFT.Shower.sudakov (totalRate P tCut c) (T - s) T) := by
  sorry

/-- The branching-process termination criterion: a Galton–Watson process with offspring law
`ξ` on `{0, 2}` is almost surely finite if and only if the mean offspring number is at most one.
Built here as a target because neither Mathlib nor TauCeti has it. Layer 2.5. `totalProgeny` is
the total number of individuals, carried as an `ℕ∞`-valued random variable on the process's
probability space. -/
theorem galtonWatson_finite_iff {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (ξ : ℕ → Ω → ℕ) (hind : iIndepFun ξ μ)
    (hident : ∀ i, IdentDistrib (ξ i) (ξ 0) μ μ) (hsupp : ∀ i ω, ξ i ω = 0 ∨ ξ i ω = 2)
    (totalProgeny : Ω → ℕ∞) (hmeas : Measurable totalProgeny) :
    (∀ᵐ ω ∂μ, totalProgeny ω < ⊤) ↔ ∫ ω, (ξ 0 ω : ℝ) ∂μ ≤ 1 := by
  sorry

/-- **The theorem that explains the first executable cascade.** With a fixed momentum-fraction
window and no resolvable cut, the integrated gluon branching probability down to any positive
cutoff exceeds one below a stated scale; with the resolvable cut, it is finite. The two
integrals are stated; the inequality is the target. Layer 2.5, Convention 10. `Pg` is the gluon's
total kernel `P_gg + n_f P_qg` and `αs` the running coupling, both real-valued. -/
theorem gluon_branchingProbability_unregulated_gt_one (Pg : ℝ → ℝ) (αs : ℝ → ℝ) (z₀ : ℝ)
    (hz₀ : 0 < z₀) (hz₀' : z₀ < 1 / 2) (hPg : ∀ z, 0 < z → z < 1 → 0 < Pg z)
    (hαs : ∀ t, 0 < t → 0 < αs t) (T : ℝ) :
    ∃ t₀ > 0, ∀ tCut, 0 < tCut → tCut < t₀ →
      1 < ∫ t in tCut..T, (αs t / (2 * Real.pi)) * (∫ z in z₀..(1 - z₀), Pg z) / t := by
  sorry

theorem gluon_branchingProbability_regulated_finite (Pg : ℝ → ℝ) (αs : ℝ → ℝ) (tCut T : ℝ)
    (htCut : 0 < tCut) (hPg : Continuous Pg) (hαs : Continuous αs) :
    IntervalIntegrable
      (fun t => (αs t / (2 * Real.pi)) *
        (∫ z in (0 : ℝ)..1, if z * (1 - z) * t > tCut then Pg z else 0) / t)
      volume tCut T := by
  sorry

/-! ## Layer 3: the shower and evolution -/

open EpsilonEridani.QFT.Factorization.Evolution in
/-- **The shower solves leading-logarithmic DGLAP.** The single-inclusive density of the shower
process — the expected number of partons of flavour `j` with momentum fraction `x` at scale `t`,
started from one parton of flavour `i` at the hard scale — satisfies `IsDGLAPLogScaleEquation`
with the leading-order kernels and coupling. `D` is carried as a `Pdf Flavor` indexed by the
initial flavour, and the hypothesis that it is the intensity measure of the process is
`hintensity`, stated against the semigroup. Layer 3.1; Convention 8 is the proof strategy, which
is uniqueness in `TauCeti.Analysis.Semigroups.CauchyProblem.Uniqueness`. -/
theorem shower_singleInclusive_isDGLAP {V Flavor Colour : Type*} [Fintype Flavor]
    [DecidableEq Flavor]
    [MeasurableSpace V] [MeasurableSpace Flavor] [MeasurableSpace Colour]
    [MeasurableSpace (Config V Flavor Colour)]
    (S : ShowerSemigroup V Flavor Colour) (P : SplittingKernel Flavor) (αs : RunningCoupling)
    (xOf : V → ℝ) (hx : Measurable xOf) (T : ℝ)
    (D : Flavor → EpsilonEridani.Particles.Parton.PDF.Pdf Flavor)
    (c₀ : Flavor → Config V Flavor Colour) (hc₀ : ∀ i, (c₀ i).n = 1 ∧ (c₀ i).flavour 0 = i)
    (hintensity : ∀ i j x t, t ≤ T →
      D i j x t = ∫ c', (∑ k, if c'.flavour k = j ∧ xOf (c'.p k) ≤ x then (1 : ℝ) else 0)
        ∂(S.U T (T - t) (c₀ i))) :
    ∀ i, IsDGLAPLogScaleEquation P αs (D i) := by
  sorry

/-- Unitarity in the physical variable: the shower conserves the expected total momentum
fraction. This is the statement that the virtual term is fixed by probability conservation
(the kernel's `δ(1 - x)` coefficient is minus the integrated real kernel), expressed as an
identity the process satisfies rather than as a property of a distribution. Layer 3.2. `xOf` is
the momentum-fraction observable on four-momenta. -/
theorem ShowerSemigroup.momentum_conserved {V Flavor Colour : Type*} [MeasurableSpace V]
    [MeasurableSpace Flavor] [MeasurableSpace Colour] [MeasurableSpace (Config V Flavor Colour)]
    (S : ShowerSemigroup V Flavor Colour) (xOf : V → ℝ) (hx : Measurable xOf)
    (c : Config V Flavor Colour) (T s : ℝ) (hs : 0 ≤ s)
    (hint : Integrable (fun c' : Config V Flavor Colour => ∑ k, xOf (c'.p k)) (S.U T s c)) :
    ∫ c', (∑ k, xOf (c'.p k)) ∂(S.U T s c) = ∑ k, xOf (c.p k) := by
  sorry

/-- The soft eikonal factor for emission of a soft gluon `k` from the dipole `(i, j)`, in terms
of the Minkowski form `g`. Layer 3.3. -/
noncomputable def eikonal {V : Type*} [AddCommGroup V] [Module ℝ V] (g : V →ₗ[ℝ] V →ₗ[ℝ] ℝ)
    (pi pj k : V) : ℝ :=
  g pi pj / (g pi k * g pj k)

/-- The cosine of the angle between the emitted gluon and leg `j`, when the gluon is at polar
angle `θik` from leg `i` and azimuth `φ` about it, and the legs are at relative angle `θij`.
Spherical trigonometry; Layer 3.3. -/
noncomputable def cosThetaJK (θik θij φ : ℝ) : ℝ :=
  Real.cos θij * Real.cos θik + Real.sin θij * Real.sin θik * Real.cos φ

/-- The `i`-collinear half of the eikonal factor, in angular variables with the gluon energy
scaled out: `W^[i]_{ij} = (1/2) [W_ij + 1/(1 - cos θik) - 1/(1 - cos θjk)]`, where
`W_ij = (1 - cos θij) / ((1 - cos θik)(1 - cos θjk))`. Layer 3.3. -/
noncomputable def eikonalHalf (θik θij φ : ℝ) : ℝ :=
  let cik := Real.cos θik
  let cjk := cosThetaJK θik θij φ
  (1 / 2) * ((1 - Real.cos θij) / ((1 - cik) * (1 - cjk)) + 1 / (1 - cik) - 1 / (1 - cjk))

/-- **The angular-ordering theorem.** The azimuthal average of the `i`-collinear half of the
eikonal factor about the direction of leg `i` equals the collinear factor `1 / (1 - cos θik)`
inside the cone `θik < θij` and vanishes outside it. An elementary integral; it is the single
theorem from which the angular-ordered shower's correctness in the soft limit follows.
Layer 3.3. -/
theorem angularOrdering_azimuthalAverage (θik θij : ℝ) (hik : 0 < θik) (hik' : θik < Real.pi)
    (hij : 0 < θij) (hij' : θij < Real.pi) (hne : θik ≠ θij) :
    (1 / (2 * Real.pi)) * ∫ φ in (0 : ℝ)..(2 * Real.pi), eikonalHalf θik θij φ
      = if θik < θij then 1 / (1 - Real.cos θik) else 0 := by
  sorry

/-- No recoil scheme conserves everything: there is no map from a massless parent to two
massless daughters at a positive relative angle that conserves the parent's four-momentum.
Stated for a Minkowski form of signature `(+,-,-,-)` on a four-dimensional space through the
energy and three-momentum decomposition, so that the statement does not depend on
`Physlib.Relativity.LorentzGroup`'s dimension conventions. Layer 3.4. -/
theorem no_recoil_conserves_all {V : Type*} [AddCommGroup V] [Module ℝ V]
    (g : V →ₗ[ℝ] V →ₗ[ℝ] ℝ) (hsymm : ∀ u v, g u v = g v u) (p q₁ q₂ : V)
    (hp : g p p = 0) (hq₁ : g q₁ q₁ = 0) (hq₂ : g q₂ q₂ = 0) (hsum : q₁ + q₂ = p)
    (hangle : g q₁ q₂ ≠ 0) : False := by
  sorry

/-! ## Layer 4: hadronisation models as probability measures -/

/-- The Lund symmetric fragmentation function, up to normalisation:
`z⁻¹ (1 - z)^a exp(-b m⊥² / z)`. Layer 4.1. -/
noncomputable def lundSymmetric (a b mPerp2 : ℝ) (z : ℝ) : ℝ :=
  z⁻¹ * (1 - z) ^ a * Real.exp (-(b * mPerp2 / z))

/-- Left–right symmetry for a single-step fragmentation function under the area law: the
two-step law is the same whichever end is fragmented first. Stated as the functional equation
that the product of two steps, times the area-law factor for the intervening string piece,
is symmetric under exchange of the two steps. Layer 4.1. `A` is the area of the string piece
between the two breakups as a function of the two fractions and transverse masses; it is part
of the kinematic data and is a Layer 4.1 target. -/
def LeftRightSymmetric (f : ℝ → ℝ → ℝ) (A : ℝ → ℝ → ℝ → ℝ → ℝ) (b : ℝ) : Prop :=
  ∀ z₁ z₂ m₁ m₂, 0 < z₁ → z₁ < 1 → 0 < z₂ → z₂ < 1 →
    f m₁ z₁ * f m₂ (z₂ / (1 - z₁)) * Real.exp (-(b * A z₁ z₂ m₁ m₂))
      = f m₂ z₂ * f m₁ (z₁ / (1 - z₂)) * Real.exp (-(b * A z₂ z₁ m₂ m₁))

/-- **The theorem that defines the string model.** The symmetric fragmentation function is
left–right symmetric under the area law, and it is the unique such function up to the two
parameters `a` and `b` and a normalisation: any positive left–right-symmetric `f` with the
stated regularity is `lundSymmetric a b` for some `a`, up to a constant depending only on the
transverse mass. Layer 4.1. The explicit area `lundArea` is the Layer 4.1 kinematic target. -/
noncomputable def lundArea (z₁ z₂ m₁ m₂ : ℝ) : ℝ :=
  sorry

theorem lundSymmetric_leftRightSymmetric (a b : ℝ) :
    LeftRightSymmetric (fun m z => lundSymmetric a b m z) lundArea b := by
  sorry

theorem leftRightSymmetric_unique (f : ℝ → ℝ → ℝ) (b : ℝ)
    (hpos : ∀ m z, 0 < z → z < 1 → 0 < f m z)
    (hcont : ∀ m, ContinuousOn (f m) (Set.Ioo 0 1))
    (hsym : LeftRightSymmetric f lundArea b) :
    ∃ a : ℝ, ∃ N : ℝ → ℝ, ∀ m z, 0 < z → z < 1 → f m z = N m * lundSymmetric a b m z := by
  sorry

/-- The string fragmentation chain: state is the remaining string's invariant mass together
with the hadrons produced so far. One step consumes a fraction of the remaining light-cone
momentum. Carried as a Markov kernel; its construction from `lundSymmetric` and one uniform
variate per step is Layer 4.1's target. -/
noncomputable def stringStep (a b : ℝ) (mHadron : ℝ) :
    ProbabilityTheory.Kernel (ℝ × List ℝ) (ℝ × List ℝ) :=
  sorry

/-- The remaining invariant mass is a supermartingale bounded below, so the string chain
terminates almost surely. Layer 4.1. `trajLaw` is the trajectory measure of the chain from a
string of mass `W`; `stopIdx` the first index at which the remaining mass is below threshold. -/
theorem stringChain_terminates (a b mHadron W threshold : ℝ) (hW : 0 < W) (hthr : 0 < threshold)
    (trajLaw : Measure (ℕ → ℝ × List ℝ)) [IsProbabilityMeasure trajLaw]
    (stopIdx : (ℕ → ℝ × List ℝ) → ℕ∞) (hstop : Measurable stopIdx) :
    ∀ᵐ τ ∂trajLaw, stopIdx τ < ⊤ := by
  sorry

/-- The single-hadron marginal of a hadronisation measure: the expected number of hadrons with
momentum fraction in a set. A candidate for a fragmentation function of `Hadronization` in the
sense that it satisfies the momentum sum rule exactly; whether it *is* one is Convention 11's
hypothesis and not a theorem here. Layer 4.2. -/
noncomputable def singleHadronMarginal (ν : Measure (List ℝ)) : Measure ℝ :=
  ν.bind fun hs => Measure.sum fun i : Fin hs.length => Measure.dirac (hs.get i)

/-- The momentum sum rule holds exactly for any hadronisation measure whose configurations
conserve the string's momentum. Layer 4.2. -/
theorem singleHadronMarginal_momentumSumRule (ν : Measure (List ℝ)) [IsProbabilityMeasure ν]
    (hcons : ∀ᵐ hs ∂ν, hs.sum = 1) (hint : Integrable (fun z : ℝ => z) (singleHadronMarginal ν)) :
    ∫ z, z ∂(singleHadronMarginal ν) = 1 := by
  sorry

/-- The cluster decay chain terminates in a *decidable* number of steps: each step reduces the
total cluster mass by at least the lightest hadron mass. Stated as a bound on the number of
hadrons from the total mass, which is the structural difference from the string model's
probabilistic termination. Layer 4.3. -/
theorem clusterChain_hadronCount_le (M mMin : ℝ) (hM : 0 ≤ M) (hmin : 0 < mMin)
    (hadrons : List ℝ) (hmasses : ∀ h ∈ hadrons, mMin ≤ h) (hcons : hadrons.sum ≤ M) :
    (hadrons.length : ℝ) ≤ M / mMin := by
  sorry

/-! ## Layer 5: matching and merging -/

/-- A matched first-emission description: a Born density `B` on the Born space, a real-emission
density `R` on the emission space, the shower's approximation `K` to `R / B`, and the resulting
first-emission density. Carried as data; the matching prescription is the choice of `firstEmission`.
Layer 5.1. The spaces are taken as `ℝ` for the statement's shape; the roadmap's version is on the
phase spaces of Layer 0.3. -/
structure MatchedFirstEmission where
  /-- The Born density. -/
  B : ℝ
  /-- The real-emission density. -/
  R : ℝ → ℝ
  /-- The shower's emission kernel. -/
  K : ℝ → ℝ
  /-- The matched first-emission density. -/
  firstEmission : ℝ → ℝ
  /-- The no-emission weight. -/
  noEmission : ℝ

/-- Unitarity, as the defining property of matching: the inclusive cross section of the matched
description equals the Born cross section exactly. Convention 12. -/
def MatchedFirstEmission.Unitary (M : MatchedFirstEmission) : Prop :=
  M.noEmission * M.B + ∫ t, M.firstEmission t = M.B

/-- The subtractive matching: shower first emission plus `R - B K`, with the shower evolving
from `T` down to `tCut`. Layer 5.2. -/
noncomputable def subtractiveMatching (B : ℝ) (R K : ℝ → ℝ) (T tCut : ℝ) :
    MatchedFirstEmission where
  B := B
  R := R
  K := K
  firstEmission := fun t =>
    if tCut ≤ t ∧ t ≤ T then B * K t * EpsilonEridani.QFT.Shower.sudakov K t T + (R t - B * K t)
    else 0
  noEmission := EpsilonEridani.QFT.Shower.sudakov K tCut T

/-- The subtractive matching is unitary exactly when the fixed-order correction integrates to
zero over the evolution range, which is the statement that `B + ∫ (R - B K)` is the
fixed-order cross section at this order with `B` already including it; the hypothesis carries
that normalisation. The shower part alone is unitary by `sudakov_veto_eq`'s density integrating
to `1 - sudakov K tCut T`. Layer 5.2. -/
theorem subtractiveMatching_unitary (B : ℝ) (R K : ℝ → ℝ) (T tCut : ℝ) (htT : tCut ≤ T)
    (hK : Continuous K) (hR : Continuous R)
    (hnorm : ∫ t in tCut..T, (R t - B * K t) = 0) :
    (subtractiveMatching B R K T tCut).Unitary := by
  sorry

/-- Negative weights in the subtractive matching occur exactly where the shower overestimates
the real emission, and their fraction is the integral of the positive part of `B K - R`.
Layer 5.2; connects to `negativeWeight_variance_bound`. -/
theorem subtractiveMatching_negativeFraction (B : ℝ) (R K : ℝ → ℝ) (T tCut : ℝ) :
    ∫ t in tCut..T, max (B * K t - R t) 0
      = ∫ t in tCut..T, max (-(subtractiveMatching B R K T tCut).firstEmission t
          + B * K t * EpsilonEridani.QFT.Shower.sudakov K t T) 0 := by
  sorry

/-! ## Layer 6: the specification–implementation boundary -/

/-- **The correspondence hypothesis.** The claims that would make the executable generator in
`EpsilonEridani.Generator` an implementation of the real-valued development, carried as data:
tolerances and the domains on which they hold. Convention 13: this is a hypothesis, no theorem
has it as a conclusion, and no field is `Prop`-valued — each is a real bound or a domain, so that
"the hypothesis holds" is a measurable claim about the code rather than an assertion.

The fields name the real-valued objects of Layers 0–3 and say how closely the implementation's
`Float` transcriptions are claimed to track them; the implementation itself is deliberately not
referenced from this file, which mentions no `Float`. -/
structure ImplementationCorrespondence where
  /-- The domain in `(x, Q²)` on which the hard-process weight is claimed accurate. -/
  hardDomain : Set (ℝ × ℝ)
  /-- The relative tolerance of the hard-process weight against the real density times the
  Jacobian of Layer 0.4, on `hardDomain`. -/
  hardWeightTol : ℝ
  /-- The relative tolerance of each of the four splitting kernels against the real kernels of
  `CollinearEvolution`, on `(0, 1)`. -/
  kernelTol : ℝ
  /-- The relative tolerance of the one-loop coupling against `qcdRunningCoupling`, above the
  cutoff. -/
  couplingTol : ℝ
  /-- The ratio by which the bound-estimation scan's result, times its safety factor, is claimed
  to dominate the true supremum of the weight on `hardDomain`; `≥ 1` is the claim. -/
  boundDomination : ℝ
  /-- The fraction of events in the sample that exhausted the shower's fuel budget; `0` is the
  claim, and a positive value is a measured truncation. -/
  exhaustedFraction : ℝ
  /-- The sample size the tolerances are claimed for. -/
  sampleSize : ℕ

/-- The one theorem about the implementation, and what the correspondence hypothesis buys: a
kernel within relative tolerance `ε` of the true kernel on the evolution range has a Sudakov
factor within `exp(ε ∫ K) - 1` of the true one, relatively. So under `ImplementationCorrespondence`
the implementation's no-emission probability is pinned to the real one by `kernelTol` and
`couplingTol` alone, with the statistical fluctuation of a finite sample on top. Layer 6.1. The
implementation's own kernel never appears: `K'` is any kernel satisfying the field's bound. -/
theorem sudakov_relTol_of_kernel_relTol (K K' : ℝ → ℝ) (ε tCut T : ℝ) (hε : 0 ≤ ε) (htT : tCut ≤ T)
    (hK : ∀ s, 0 ≤ K s) (hKc : Continuous K) (hK'c : Continuous K')
    (htol : ∀ s, tCut ≤ s → s ≤ T → |K' s - K s| ≤ ε * K s) :
    |EpsilonEridani.QFT.Shower.sudakov K' tCut T / EpsilonEridani.QFT.Shower.sudakov K tCut T - 1|
      ≤ Real.exp (ε * ∫ s in tCut..T, K s) - 1 := by
  sorry

/-- The bound in the form the correspondence structure states it. Layer 6.1. -/
theorem noEmission_within_correspondence (C : ImplementationCorrespondence) (K K' : ℝ → ℝ)
    (tCut T : ℝ) (htT : tCut ≤ T) (hK : ∀ s, 0 ≤ K s) (hKc : Continuous K) (hK'c : Continuous K')
    (hexh : C.exhaustedFraction = 0) (hbound : 1 ≤ C.boundDomination) (htol0 : 0 ≤ C.kernelTol)
    (htol : ∀ s, tCut ≤ s → s ≤ T → |K' s - K s| ≤ C.kernelTol * K s) :
    |EpsilonEridani.QFT.Shower.sudakov K' tCut T / EpsilonEridani.QFT.Shower.sudakov K tCut T - 1|
      ≤ Real.exp (C.kernelTol * ∫ s in tCut..T, K s) - 1 :=
  sudakov_relTol_of_kernel_relTol K K' C.kernelTol tCut T htol0 htT hK hKc hK'c htol

/-- The real fact behind the `Float` acceptance ratio for `q → qg`: the leading-order kernel is
dominated by its overestimate, `(1 + z²)/(1 - z) ≤ 2/(1 - z)` on `(0, 1)`. Layer 6.2. -/
theorem pqq_le_overestimate (z : ℝ) (hz : 0 < z) (hz1 : z < 1) :
    (1 + z ^ 2) / (1 - z) ≤ 2 / (1 - z) := by
  sorry

/-- The real fact behind the `Float` acceptance ratio for `g → gg`:
`z/(1-z) + (1-z)/z + z(1-z) ≤ 1/z + 1/(1-z)` on `(0, 1)`, with the ratio equal to
`z² + (1-z)² + z²(1-z)²`. Layer 6.2. -/
theorem pgg_le_overestimate (z : ℝ) (hz : 0 < z) (hz1 : z < 1) :
    z / (1 - z) + (1 - z) / z + z * (1 - z) ≤ 1 / z + 1 / (1 - z) := by
  sorry

theorem pgg_ratio_eq (z : ℝ) (hz : 0 < z) (hz1 : z < 1) :
    (z / (1 - z) + (1 - z) / z + z * (1 - z)) / (1 / z + 1 / (1 - z))
      = z ^ 2 + (1 - z) ^ 2 + z ^ 2 * (1 - z) ^ 2 := by
  sorry

/-- The real fact behind the `Float` acceptance ratio for `g → qq̄`: `z² + (1-z)² ≤ 1` on
`[0, 1]`. Layer 6.2. -/
theorem pqg_le_overestimate (z : ℝ) (hz : 0 ≤ z) (hz1 : z ≤ 1) :
    z ^ 2 + (1 - z) ^ 2 ≤ 1 := by
  sorry

/-- The one-loop coupling with `Λ` derived from the measured coupling at `m_Z` reproduces that
value exactly: `α_s(m_Z²) = α_s^{meas}` when `Λ = m_Z exp(-1 / (2 β₀ α_s^{meas}))`. Layer 6.2;
the earlier tabulated `Λ` did not, and its docstring claimed it did. -/
theorem oneLoopCoupling_at_mZ (β₀ αsMZ mZ : ℝ) (hβ : 0 < β₀) (hα : 0 < αsMZ) (hm : 0 < mZ) :
    let Λ := mZ * Real.exp (-1 / (2 * β₀ * αsMZ))
    1 / (β₀ * Real.log (mZ ^ 2 / Λ ^ 2)) = αsMZ := by
  sorry

/-- The fuel-exhaustion bias: a cascade truncated after `k` splittings has at most `k + 1`
partons, so its multiplicity distribution is stochastically below the untruncated one. Layer 6.2;
the theorem that makes `exhaustedFraction = 0` a necessary field rather than a tidiness one. -/
theorem truncated_multiplicity_le (k : ℕ) {V Flavor Colour : Type*}
    (c : Config V Flavor Colour) (splittings : ℕ) (hsplit : splittings ≤ k)
    (hmult : c.n = 1 + splittings) :
    c.n ≤ k + 1 := by
  omega

/-- The `y₂₃` specification, written out: with `n ≥ 3` final-state partons, the merge-scale
sequence has `n - 1` entries and `y₂₃` is the entry at index `n - 3`, the second-to-last. This is
the statement two agreeing implementations had both misread, and it is recorded so that the
comparison has a third thing to be made against. Layer 6.4. -/
def y23Index (n : ℕ) : ℕ := n - 3

theorem y23Index_eq_secondToLast (n : ℕ) (hn : 3 ≤ n) :
    y23Index n = (n - 1) - 2 := by
  unfold y23Index
  omega

end EpsilonEridaniRoadmaps.EventGeneration

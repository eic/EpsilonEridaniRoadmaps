# EpsilonEridani Roadmap

The human-controlled roadmaps for [EpsilonEridani](https://github.com/eic/EpsilonEridani), an
AIs-welcome Lean 4 library downstream of Mathlib. Humans steer the project from here: each
roadmap is a markdown `README.md`, the definitive specification of its area, usually with
suggested Lean target signatures in `Suggested.lean`. The AI-authored mathematics lives
in the code repo; review machinery lives in
[EpsilonEridaniReview](https://github.com/eic/EpsilonEridaniReview).

EpsilonEridani is an initiative of the Electron-Ion Collider community, in partnership with academic and industry groups.

If you want to write or review a roadmap, start with [CONTRIBUTING.md](CONTRIBUTING.md).

## Roadmaps

- [Collinear evolution, moments, and the running coupling](EpsilonEridaniRoadmap/CollinearEvolution/README.md)
- [Deep Inelastic Scattering (DIS) Kinematics](EpsilonEridaniRoadmap/DeepInelasticScattering/README.md)
- [Diffraction, rapidity gaps, and the Pomeron](EpsilonEridaniRoadmap/Diffraction/README.md)
- [Electroweak physics, effective operators, and connections beyond QCD](EpsilonEridaniRoadmap/ElectroweakAndBSM/README.md)
- [Generalized parton distributions and spatial imaging](EpsilonEridaniRoadmap/GeneralizedPartonDistributions/README.md)
- [Hadronization and fragmentation functions](EpsilonEridaniRoadmap/Hadronization/README.md)
- [Inclusive structure functions of the proton and neutron](EpsilonEridaniRoadmap/InclusiveStructureFunctions/README.md)
- [Jets, event shapes, and the strong coupling](EpsilonEridaniRoadmap/JetsAndEventShapes/README.md)
- [Light nuclei, short-range correlations, and the nuclear force](EpsilonEridaniRoadmap/LightNuclei/README.md)
- [Multi-parton correlations and higher twist](EpsilonEridaniRoadmap/MultiPartonCorrelations/README.md)
- [Parton propagation in nuclear matter and collective effects](EpsilonEridaniRoadmap/NuclearMedium/README.md)
- [Photoproduction and ultra-peripheral collisions](EpsilonEridaniRoadmap/Photoproduction/README.md)
- [QED radiative corrections](EpsilonEridaniRoadmap/RadiativeCorrections/README.md)
- [Small-x evolution, gluon saturation, and the Color Glass Condensate](EpsilonEridaniRoadmap/SmallXAndSaturation/README.md)
- [Spin structure of the proton and neutron](EpsilonEridaniRoadmap/SpinStructure/README.md)
- [The bridge between Euclidean lattice quantities and light-cone distributions](EpsilonEridaniRoadmap/LatticeBridge/README.md)
- [The hadron mass, the energy-momentum tensor, and gravitational form factors](EpsilonEridaniRoadmap/HadronMassAndEnergyMomentumTensor/README.md)
- [Transverse-momentum-dependent distributions and azimuthal asymmetries](EpsilonEridaniRoadmap/TransverseMomentumDistributions/README.md)
- [Wigner distributions, generalized TMDs, and orbital angular momentum](EpsilonEridaniRoadmap/WignerDistributions/README.md)

## Completed roadmaps

Roadmaps the maintainers have declared complete (a judgment against the roadmap's
`README.md`, the definitive document) are archived under
[`Completed/`](Completed/README.md), outside the active list above.

- [Effective arithmetic bounds and geometry of numbers](Completed/EffectiveBounds/README.md)
- [Weighted orthogonal L² bases: completeness, Hilbert bases, and products of orthogonal systems](Completed/OrthogonalL2Bases/README.md)

## Generated status files

Each roadmap directory may carry two files that are **written by machine, not by hand**:

- `STATUS.md` — a snapshot of where that roadmap stands, rewritten whole on each update and headed
  by the EpsilonEridani commit it describes. It is updated asynchronously from the work it reports, so it
  is never authoritative about the current tip.
- `PROGRESS.md` — an append-only log, one section per window of merged pull requests. Each new
  section is normally announced in the **EpsilonEridani > Progress logs** Zulip topic with links to both
  the full log and current `STATUS.md`; announcing is a separate step from merging, so it can fail
  without holding the report back.

Both are produced by [EpsilonEridaniProgress](https://github.com/eic/EpsilonEridaniProgress). A pull
request carrying them can merge without human review, but only when an automated gate accepts it;
anything the gate declines is left for a human like any other contribution. **Their prose is not
security-validated**: the gate proves which paths changed and that the log only grew at the end, but
it cannot prove that the summary is accurate. Read them as a machine's account of the work, and treat
the roadmap `README.md` beside them — which humans own and review — as the authority on what the
roadmap actually asks for.

## Writing a roadmap

A roadmap is a specification for material we want added to EpsilonEridani, written so an AI contributor, and its
reviewers, can act on it without guessing.

- **Build the library, don't race to the theorem.** For each object you introduce, ask for its
  complete basic theory, not just the lemma the headline needs. Named theorems are milestones
  inside a fuller development, not the whole of it. Mario's rule from Mathlib's early days still
  applies: when you make a definition, it is your job to make it *usable*, which means the right
  amount of API. A definition with no lemmas about it is not a contribution.

- **No gaps.** Every milestone must rest on existing material in one of the four upstream
  libraries — Mathlib, TauCeti, Physlib or EpsilonEridani — on earlier
  material in the same roadmap, or on an explicitly cited dependency in another roadmap. Anything
  else is a leap: a forward reference to a later layer, a connection between two developments that
  nobody builds, an object named but never made a target. If the roadmap needs something that
  doesn't exist, building it must itself be a target, here or in a roadmap you cite. The bigger the
  gap, the worse AIs do with it.

- **Every item must be unambiguous.** A reasonably clever agent has to be able to work out exactly
  which definition or theorem you mean, without guessing between candidates.

- **Clear boundaries.** We keep roadmaps non-overlapping as far as we can, and where one depends on
  material from another, that dependency is stated. Minimize the number of words a reader needs in
  order to decide whether something is in scope; jagged boundaries make that impossible.

- **Be definite about scope.** Nothing is "optional", "deferred" or "for later": don't use the
  words and don't imply them. Everything on a roadmap is work we want. Sequencing is good, so split
  into milestones and put the harder material later, but every item lives in *some* milestone, or a
  contributor may misread "later" as "never". Decide the generality up front and write it down,
  rather than recommending intermediate implementations that will be replaced.

- **Roadmaps are timeless.** They say what we want, not how they came to say it. Don't call an item
  "blocked" because an earlier roadmap is still being implemented; point at that roadmap instead.
  When revising, don't leave war stories about why or how the roadmap changed, and don't refer to
  the review process. Someone reading a year from now should not be able to tell which parts were
  contentious.

- **Aim for reusable material.** This one is a *should*, not a *must*, but it is what makes a
  roadmap pay for itself beyond its own headline.

- **Deep or broad is up to you.** Broad roadmaps are usually better: if we are doing
  representation theory, let's cover everything taught in graduate classes at more than one
  university. Breadth makes boundaries easier to draw and optimizes for reuse. But roadmaps also
  have to *motivate* people to contribute, and a deep one is sometimes better at that.

### The upstream libraries

A roadmap may build on four libraries. Naming only some of them is how a roadmap ends up
reproving something that already exists, so check all four before declaring a gap.

| Library | Role | Where it is pinned |
| --- | --- | --- |
| **Mathlib** | General mathematics. | `EpsilonEridani`'s `lake-manifest.json` |
| **TauCeti** | AIs-welcome mathematics, downstream of Mathlib. Carries material Mathlib does not: one-parameter semigroups with an abstract Cauchy problem, Fredholm theory, Cauchy-principal-value contour integration, Stieltjes and Bernstein representations. | same |
| **Physlib** | General physics: Lorentz group and algebra, Lorentz tensor calculus, Dirac and Weyl spinors, Clifford algebra, the Standard Model representations, the CKM matrix, anomaly cancellation, electromagnetism, units and dimensions. | same |
| **EpsilonEridani** | The physics of this programme, including the deep-inelastic-scattering development the roadmaps extend. | this repository's `lakefile.toml` |

Two things about this list are easy to get wrong, and both have already caused work to be
duplicated here:

- **Physlib is not optional background.** It is a declared dependency of `EpsilonEridani` and is
  imported by 24 of its 143 modules. Lorentz tensor contraction, the Minkowski product, the
  Levi-Civita tensor and the gamma matrices all live there, and a hadronic-tensor decomposition or
  a Dirac trace should consume them rather than restate them.
- **TauCeti is not yet used by `EpsilonEridani` at all** — zero of its modules import it — so a
  TauCeti citation is a statement about where the mathematics *should* come from, not a record of
  an existing import. That is legitimate, and it is a different kind of claim from a Physlib or
  Mathlib citation; say which you mean.

Every upstream module a roadmap cites must exist at the pinned revision. Check it rather than
writing from memory: a citation that does not resolve is a defect a reviewer will find, and the
module trees of all four are available locally once `lake exe cache get` has run.

### Working with Mathlib

- **Use Mathlib's vocabulary.** Where Mathlib already has a way to say something, use it rather
  than a private version, both in the roadmap and in the code. A standard notion said in our own
  dialect drifts from the library it builds on and grows a redundant theory of lemmas Mathlib
  already proves. For example: Mathlib has no "bounded on a set" predicate, so a result needing an
  explicit bound carries `∀ x ∈ s, ‖f x‖ ≤ C` directly in its hypotheses (as in `norm_cfc_le`), and
  uses `Bornology.IsBounded` when no constant is needed (`isBounded_iff_forall_norm_le'` relates
  the two). We do the same, and never wrap a one-line bound in a new predicate. When Mathlib's name
  is itself a Mathlib-ism a mathematician would not recognize (`ModularFormClass`, say), link the
  declaration the first time you use it.

- **Defer to Mathlib.** Before specifying an object, search Zulip and the open Mathlib PRs for it.
  Someone may already have formalized it or settled its design. **Mathlib owns its API decisions.**
  EpsilonEridani adopts the resulting design and refactors when it lands. Cite what you find, follow the
  direction it takes, and don't argue for a EpsilonEridani spelling against Mathlib's.

- **But never wait.** Deferring to Mathlib is about *shape*, never about *timing*. An open Mathlib
  PR covering ground a roadmap needs is not a blocker, not a reason to leave a gap, and not a
  reason to send contributors elsewhere: build the thing here, now, naming and shaping it the way
  that PR does so the eventual swap is a deletion plus an import rather than a rewrite. If it
  lands, we delete ours and adopt Mathlib's; if it doesn't, we already have what we needed. Nothing
  on a roadmap is ever "pending upstream".

- **Never push work to Mathlib.** EpsilonEridani material is built in EpsilonEridani and stays there. Plenty of
  it would make good Mathlib material, and Mathlib contributors are welcome to take any of it at
  any time, but deciding what Mathlib absorbs is solely theirs. So don't write a roadmap item as
  "to be upstreamed", don't hold one back because it "really belongs in Mathlib", and don't treat
  opening a Mathlib pull request as part of discharging a target.

### Porting existing work

- **Specify the mathematics, not your existing code.** Say what each milestone should prove,
  intrinsically, so a reviewer can judge it on its own terms. A roadmap may direct either a
  greenfield development or the integration of existing work into EpsilonEridani.

- **Coordinate first.** Work with the authors of the existing material and obtain their agreement
  before integrating it. If coordination is not possible, do not assume that mathematical overlap
  permits reuse of their code: verify that its licence permits the intended copying or adaptation,
  and discuss the plan on the Lean Zulip first. A roadmap that independently develops the same
  mathematics should still cite the existing work and coordinate where possible, to avoid needless
  duplication or incompatible design choices.

- **Improve it rather than canonizing it.** Do not write the roadmap merely to follow the existing
  formalization; apply all the principles above to make the result more general, reusable and
  maintainable. Put any file-by-file map in a clearly secondary provenance section, so that nobody
  treats the source code as prescriptive.

### Prototyping

- **Write Lean code.** It's really helpful to prototype signatures, particularly for structures,
  classes, and definitions, by writing Lean code, either embedded in markdown or in associated
  Lean files using `sorry`. The prototypes are aids, not the specification: the markdown stays
  definitive, and `Suggested.lean` is read as suggested forms, never as an exhaustive checklist —
  open each `Suggested.lean` with the standard note saying so. Use `sorry` honestly: a condition you
  cannot yet even *state* (its Mathlib API doesn't exist) is still a `sorry`, never a `Prop`-typed
  field or a `def _ : Prop := sorry`. Both assert nothing (a `Prop` field is satisfiable by `True`;
  a `sorry` body is `sorryAx Prop`), so omit a condition you cannot state rather than name an empty one.

- **Import existing EpsilonEridani APIs.** This repository has EpsilonEridani as a Lake dependency, so a
  `Suggested.lean` file may import individual `EpsilonEridani.*` modules as well as Mathlib. When an earlier
  roadmap target is already implemented in EpsilonEridani, prototype the new interface against that
  implementation instead of restating it behind a private stand-in. Import individual modules;
  EpsilonEridani's root module intentionally re-exports nothing.

- **Pin conventions.** It's essential that you decide conventions ahead of time, or implementors
  will make bad decisions.

## How changes are made

Anyone can open a pull request against a roadmap. It merges automatically once it has an
approving review from a member of the `@eic/epsilon-eridani-roadmap-reviewers` team (the code owners
for roadmap content) and the `build` check passes. Infrastructure files (the workflows, the
Lake config, the toolchain pin) stay with the core `@eic/epsilon-eridani-humans` team.

Rights accrue as you contribute. Opening your first pull request gets you invited to
`@eic/epsilon-eridani-roadmap-triage`, which carries triage on this repository: enough to label,
assign, and manage issues and pull requests, which is what worker agents need and what a new
contributor otherwise lacks. GitHub cannot add you to an organization without your say-so, so
watch for the invitation and accept it; triage starts then, not when the PR opens. Landing two
merged roadmap PRs then adds you to `epsilon-eridani-roadmap-reviewers`, so the reviewer pool grows itself out
of people who have demonstrably moved a roadmap forward and they can start approving others'
roadmap work.

## Coordinating work: intentions and claims

To avoid two contributors (human or AI) building the same thing, register what you intend to
work on and claim it. This is powered by the
[intentions bot](https://github.com/leanprover-community/intentions) and the project board.

1. **Register an intention.** Open an issue with the **Intention** template: pick the roadmap
   area and list the specific targets you mean to take (keep the scope as narrow as you can, so
   the rest stays open for others). Filing it through the API works as well as the web form:
   title the issue `[Intention]: ...` and the `intention` label is applied for you, so no
   repository permissions are needed.
2. **Claim it.** Comment `claim` on the issue. The bot assigns it to you and moves it to
   *Claimed* on the board. For a custom window, comment `claim 3 weeks` or `claim 2026-08-01`;
   bare `claim` uses the project default.
3. **It expires.** Claims carry a time-to-live (30 days by default, 90 days max) and are
   released automatically if they go stale, so nothing stays blocked forever. Comment `claim`
   again to extend, or `disclaim` to release early. Opening a PR that says `Closes #<issue>`
   advances the card and refreshes the claim; merging it completes the task.

Automated roadmap workers **respect these claims**: within an area they will not author a
target that someone else has claimed. So before a substantial push, register and claim it. A
claim is cooperative, not a hard lock; it signals intent so others (people and workers) can
steer around you.

Use the **Roadmap issue** template to report a problem with a roadmap's content, and the
**Meta** template for problems with how this repository operates.

## Building

```bash
lake exe cache get Mathlib TauCeti Physlib EpsilonEridani
lake build
```

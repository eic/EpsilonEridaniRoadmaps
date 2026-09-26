# Completed roadmaps

Roadmaps the maintainers have declared complete. Completion is a human judgment against
the roadmap's `README.md`, which is the definitive document; it is never inferred from
`Suggested.lean`, which only records suggested declaration forms for particular milestones
and is not exhaustive.

A declared-complete roadmap is archived here, outside `EpsilonEridaniRoadmap/`, so it no longer
appears in the list of active areas offered to contributors (human or AI): the worker
tooling, the issue-template dropdowns, and the root README all enumerate the directories
under `EpsilonEridaniRoadmap/` only.

The archived `Suggested.lean` files remain part of the default CI build. They elaborate against
the same EpsilonEridani revision as the active roadmaps, so a discharged file continues to certify that
the current library realizes its archived statements. If a EpsilonEridani API change breaks such a
certificate without changing the mathematics, the certificate is updated along with the
dependency pin. Git history and each revision's `lake-manifest.json` retain the exact dependency
revision against which an earlier version elaborated.


# Development & contributions

## Source of truth

- **Accepted release:** v0.7.0, accepted upstream (per project author, 18 October 2026). Preserve its historical release files.
- **Current development baseline:** `src/windhawk-mawaqit-v0.7.1-dev6.9.3-iqamah-scale-limit.wh.cpp`.
- The repository's canonical `src/windhawk-mawaqit.wh.cpp` should remain the accepted/release baseline until deliberately updated for a release. It is **not included** in this documentation update because the author explicitly excluded older source files.

## Working on changes

Keep changes small and review settings YAML for duplicate keys. Test Windhawk compilation, settings migration, live updates, both monitor paths, popup materials, offline/cache behavior, and Explorer restart/reload. Document what was statically reviewed versus actually tested. Do not assume local tests establish compatibility across Windows 11 builds.

## Suggested release workflow

1. Keep development source separate from accepted release source.
2. Update README, THEMES, CONFIGURATION, troubleshooting, changelog and release notes when behavior changes.
3. Run compile and regression checks; record results accurately.
4. Update canonical release source and version metadata only when preparing a deliberate release.
5. Check relative screenshot links and run `git diff --check` before committing.

Historical review notes: [REVIEW.md](REVIEW.md), [AGENT_REVIEW.md](AGENT_REVIEW.md). These reflect earlier candidates and are not current release approval.

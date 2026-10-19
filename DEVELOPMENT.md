# Development & contributions

## Source of truth

- **Accepted release:** v0.7.0, accepted upstream (per project author, 18 October 2026). Preserve its historical release files.
- **Current development baseline:** v0.7.1 consolidated source, as maintained by the project author. Verify the actual filename and Windhawk `@version` in the repository before release; the earlier `dev6.9.3` filename is no longer an authoritative current baseline.
- The repository's canonical `src/windhawk-mawaqit.wh.cpp` should remain the accepted/release baseline until deliberately updated for a release. It is **not included** in this documentation update because the author explicitly excluded older source files.

## Current v0.7.1 implementation notes

- Calendar parser supports verified six- and seven-entry day layouts; seven-entry schedules can include Imsak. Cache format v4 invalidates incompatible older mappings.
- `Display.ShowFajrWindowCountdown` remains the stored setting key; the UI labels it **Show Shuruq and Imsak**.
- The popup measures wrapped mosque names and adjusts its layout to available rows; verify across font/DPI settings.
- Windows/System accent pill and Emberveil Daybreak are included; the pill appearance-change refresh limitation is tracked in [ROADMAP.md](ROADMAP.md).

## Working on changes

Keep changes small and review settings YAML for duplicate keys. Test Windhawk compilation, settings migration, live updates, both monitor paths, popup materials, offline/cache behavior, and Explorer restart/reload. Document what was statically reviewed versus actually tested. Do not assume local tests establish compatibility across Windows 11 builds.

## Suggested release workflow

1. Keep development source separate from accepted release source.
2. Update README, THEMES, CONFIGURATION, troubleshooting, changelog and release notes when behavior changes.
3. Run compile and regression checks; record results accurately.
4. Update canonical release source and version metadata only when preparing a deliberate release.
5. Check relative screenshot links and run `git diff --check` before committing.

Historical review notes: [REVIEW.md](REVIEW.md), [AGENT_REVIEW.md](AGENT_REVIEW.md). These reflect earlier candidates and are not current release approval.

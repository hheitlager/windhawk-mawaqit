# Development & Contributions

This document outlines the development workflow, versioning conventions, and release guidelines for Mawaqit.

## Source of Truth

- **Latest accepted release at this update:** v0.7.1, accepted upstream on 21 October 2026.
- **Current milestone:** v0.8.0 is feature complete and in final testing; see the [roadmap](../planning/ROADMAP.md).
- **Canonical source:** `src/windhawk-mawaqit.wh.cpp`. Update this file only when preparing a deliberate release. Keep development changes separate until ready.
    
Historical release files should remain preserved.

## Implementation Considerations

- **Calendar parsing:** Preserve support for verified six- and seven-entry day layouts, including optional Imsak data. Validate cache compatibility when changing the parser or storage format.
- **Prayer display:** Preserve existing stored setting keys where possible, even when user-facing labels change.
- **Popup layout:** Test wrapped mosque names and varying row counts across font sizes and DPI settings.
- **Themes:** Check both pill and popup appearance, including Windows accent colors, material effects, and custom overrides. See the [roadmap](../planning/ROADMAP.md) for planned improvements.

## Development Workflow

1. Keep development changes separate from the accepted release baseline.
2. Make focused changes and review settings YAML for duplicate keys.
3. Test compilation, upgrade behavior, live updates, monitor positioning, popup appearance, offline/cache behavior, and Explorer reload where applicable. Record manual migration limits clearly when no helper is shipped.
4. Update affected documentation when functionality or behavior changes.
5. Record what was actually tested versus statically reviewed. Local testing does not guarantee compatibility across all Windows 11 builds.
    
Before committing, verify relative documentation and screenshot links and run `git diff --check`.

## Versioning & Releases

Mawaqit follows [Semantic Versioning](https://semver.org/) using `MAJOR.MINOR.PATCH`.

|Version|Purpose|
|---|---|
|`0.x.0`|New features and intentional changes during development|
|`0.x.y`|Bug fixes, security fixes, and internal improvements|
|`0.x.y-dev.N`|Internal development and testing builds|
|`1.0.0`|First stable release; planned core functionality complete|
|`1.x.0`|New backward-compatible features|
|`1.x.y`|Backward-compatible fixes|
|`2.0.0`|Breaking changes after 1.0|

### Release Conventions

- New features increment MINOR; fixes increment PATCH. Lower-order version components reset to zero.
- Before `1.0.0`, breaking changes are permitted but must be documented, especially when existing settings or user configurations are affected.
- After `1.0.0`, incompatible changes require a MAJOR release.
- Windhawk metadata uses a supported development version during testing and the final numeric version when publishing. Do not put internal testing labels into `@version` metadata or public release documentation.
- Keep Windhawk version metadata, GitHub release tags, and release documentation consistent.
- Existing releases retain their original version numbers. These conventions apply to future releases.
    
### Release Process

**Develop → Test → Document → Release**

Before publishing:
1. Confirm the version number matches the scope of the changes.
2. Complete relevant compilation and regression testing.
3. Verify the exact Windhawk source metadata and ensure it uses a version accepted by Windhawk.
4. Update the changelog, release notes, and affected user documentation.
5. Document breaking changes, known issues, and settings migration requirements; distinguish built-in migration from separate optional tools.
6. Update the canonical release source and numeric version metadata when ready to publish.
    
Keep the release process lightweight and proportional to the changes.

## Code Review Guidelines

Use these guidelines for human and AI-assisted reviews. Apply checks proportionally to the change; do not treat a checklist as proof of a successful test.

- **Correctness and regressions:** Check the changed behavior against existing prayer display, Adhan/Iqamah transitions, popup interactions, settings compatibility, and monitor positioning.
- **Security and network:** Review mosque URL normalization, HTTPS/WinHTTP requests, timeouts, parsing of untrusted responses, cache validity, and failure handling.
- **Lifetime and threading:** Inspect HWND and XAML UI-thread ownership, event-token cleanup, timers, worker shutdown, and GDI/DC/resource release, especially during mod reloads, Explorer restarts, and taskbar rebuilds.
- **Appearance:** Test theme presets and custom color overrides, foreground contrast, pill/popup materials and opacity, DPI scaling, and top/bottom taskbar layouts. Do not silently alter author-tested defaults or user-selected colors without a demonstrated reason.
- **Performance:** Check periodic countdown and layout updates for unnecessary work or excessive logging.
- **Release readiness:** Verify Windhawk metadata and build conventions, settings YAML, links/screenshots, credits/license, and documentation consistency.

### Suggested Regression Coverage

- **Themes:** Representative light and dark presets, Windows/System, Custom, empty/partial/full overrides, and invalid color values.
- **Materials:** Solid, Transparent, Blur, and Acrylic; pill and popup independently where supported.
- **Popup:** Click and hover interactions, dismissal timers, long mosque names, changing prayer rows, and varying DPI.
- **Schedules:** Valid/invalid mosque IDs, fresh/stale cache, offline mode, failed fetch/retry, year boundaries, and source-provided Iqamah times crossing midnight.
- **Taskbar:** Primary and secondary monitors, all supported positions, display reconnect, taskbar rebuild, Explorer restart, repeated enable/disable, and sleep/resume.

### Review Reporting

Report actionable findings with severity, relevant source locations, expected versus observed behavior, and reproduction steps where available. Distinguish **static inspection**, **successful compilation**, **author-reported testing**, and **independently executed runtime tests**. Do not claim a release is approved solely because a review checklist was completed. Avoid unrelated refactoring when reviewing a focused change.

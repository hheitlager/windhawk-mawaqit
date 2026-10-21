# Development & Contributions

This document outlines the development workflow, versioning conventions, and release guidelines for Mawaqit.

## Source of Truth

- **Accepted release:** v0.7.0, accepted upstream on 18 October 2026.
- **Current development baseline:** v0.7.1, maintained by the project author. Verify the source filename and Windhawk `@version` before publishing.
- **Canonical source:** `src/windhawk-mawaqit.wh.cpp`. Update this file only when preparing a deliberate release. Keep development changes separate until ready.
    
Historical release files should remain preserved.

## Current Implementation Notes

The following notes apply to the v0.7.1 development baseline:

- **Calendar parsing:** Supports verified six- and seven-entry day layouts, including optional Imsak entries. Cache format v4 invalidates incompatible older mappings.
- **Prayer display:** `Display.ShowFajrWindowCountdown` remains the stored setting key, while the interface labels it **Show Shuruq and Imsak**.
- **Popup layout:** Wrapped mosque names are measured dynamically, with layout adjustments based on available rows. Verify across different font sizes and DPI settings.
- **Themes:** Windows/System accent pill and Emberveil Daybreak are included. The pill appearance-change refresh limitation is tracked in [ROADMAP.md](https://chatgpt.com/planning/ROADMAP.md).
    

## Development Workflow

1. Keep development changes separate from the accepted release baseline.
2. Make focused changes and review settings YAML for duplicate keys.
3. Test compilation, settings migration, live updates, monitor positioning, popup appearance, offline/cache behavior, and Explorer reload where applicable.
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
- Development builds use the `-dev.N` suffix. Separate alpha, beta, and release-candidate stages are not required.
- Keep Windhawk version metadata, GitHub release tags, and release documentation consistent.
- Existing releases retain their original version numbers. These conventions apply to future releases.
    
### Release Process

**Develop → Test → Document → Release**

Before publishing:
1. Confirm the version number matches the scope of the changes.
2. Complete relevant compilation and regression testing.
3. Update the changelog, release notes, and affected user documentation.
4. Document breaking changes, known issues, and settings migration requirements.
5. Update the canonical release source and version metadata when ready to publish.
    
Keep the release process lightweight and proportional to the changes.

## Historical Reviews

Earlier review documents are retained for reference:
- [REVIEW.md](https://chatgpt.com/c/REVIEW.md)
- [AGENT_REVIEW.md](https://chatgpt.com/c/AGENT_REVIEW.md) 

These documents describe earlier candidates and do not constitute approval of the current release.
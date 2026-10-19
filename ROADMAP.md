# Mawaqit Prayer Clock — Roadmap

This roadmap outlines planned improvements and ideas under consideration. Features and release targets may change as development and testing progress.

## v0.8.0 — Dynamic Dark/Light Themes

**Goal:** Make Mawaqit's appearance respond consistently to Windows while preserving manual customization.

### Planned

- [ ] Detect Windows light/dark appearance, accounting for separate app and system preferences.
- [ ] Refresh both the taskbar pill and prayer popup when Windows appearance changes, without requiring a mod reload.
- [ ] Introduce light and dark palettes for existing theme presets, preserving today's approved palettes as compatibility baselines.
- [ ] Offer appearance selection: **Follow Windows**, **Always Dark**, and **Always Light**.
- [ ] Resolve theme colors consistently for the pill and popup, while continuing to respect custom overrides.
- [ ] Improve contrast-aware foreground selection for Windows accent-colored surfaces.
- [ ] Keep existing theme settings compatible wherever possible.

### Investigate / design decisions

- [ ] Determine whether the taskbar should follow Windows *system* appearance while the popup follows *app* appearance, or whether both should share one user-selectable preference.
- [ ] Evaluate reading the Windows accent color and reacting to accent changes.
- [ ] Investigate reliable taskbar background-color detection for standard Windows configurations. **Do not assume compatibility with third-party taskbar styling mods.**
- [ ] Decide how existing presets map to automatic light/dark variants without altering their approved looks.

## v0.9.0 — Localization & Religious Calendar Integration

**Status:** Planned — Internal development milestone

### Planned investigations and features

- [ ] **Localization overhaul:** Investigate multilingual UI support, including automatic language detection and manual language selection. Evaluate whether existing Mawaqit translations can be reused or whether a dedicated translation system would be more appropriate.
- [ ] **Ramadan & holy moments:** Investigate Ramadan-specific features, important Islamic dates, and integration with available Mawaqit data.
- [ ] **Community feature review:** Revisit previously collected suggestions, including the Claude-assisted proposals, and evaluate them for adoption based on usefulness, feasibility, and compatibility.

### Potential graduation to v1.0.0

If the v0.9.0 development cycle successfully delivers the planned functionality and passes stability, compatibility, and release testing, the project may be promoted directly to **v1.0.0**, marking its first stable release and the end of its beta development stage.

This promotion is a goal, not a guaranteed release commitment.

## Current release boundary — v0.7.1

- Windows/System Default uses an accent-colored taskbar pill with white text.
- Imsak and Shuruq use primary text colors; Iqamah offsets retain secondary colors.
- Existing popup styling and approved Emberveil presets remain unchanged.
- **Known limitation:** The pill may not immediately refresh when Windows switches light/dark mode. A unified live appearance refresh is planned for v0.8.0.

---

*Roadmap items are plans, not promises. Implementation details and release timing remain subject to testing and review.*
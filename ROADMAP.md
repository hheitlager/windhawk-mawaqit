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
- [ ] Decide how existing standalone presets such as **Emberveil**, **Emberveil Midnight**, and **Emberveil Daybreak** map to automatic light/dark variants without altering their approved looks.

## v0.9.0 — To be defined

Reserved for the next feature discussion. No features are committed yet.

## Current release boundary — v0.7.1

- Windows/System Default uses an accent-colored taskbar pill with white text.
- Imsak and Shuruq use primary text colors; Iqamah offsets retain secondary colors.
- Existing popup styling and approved Emberveil presets remain unchanged.
- **Known limitation:** The pill may not immediately refresh when Windows switches light/dark mode. A unified live appearance refresh is planned for v0.8.0.

---

*Roadmap items are plans, not promises. Implementation details and release timing remain subject to testing and review.*

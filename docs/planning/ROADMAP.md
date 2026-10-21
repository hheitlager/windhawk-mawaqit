# Mawaqit Prayer Clock — Roadmap

## v0.8.0 — Appearance & Usability

**Goal:** Improve Windows appearance integration, popup customization, and taskbar usability while preserving existing settings and theme behavior.

### Dark/light appearance

- [ ] Add **Automatic dark/light mode** (on/off). When off, preserve the selected theme's v0.7.1 appearance.
- [ ] Add **Dark/light mode style**: **Unified** (pill and popup follow Windows system appearance) or **Windows-native** (pill follows system appearance; popup follows app appearance).
- [ ] Detect Windows appearance changes and refresh both the pill and popup without reloading the mod.
- [ ] Introduce light/dark variants where appropriate; preserve established palettes and allow intentionally fixed-appearance themes.
- [ ] Continue respecting custom color overrides, and improve contrast on Windows accent-colored surfaces.
- [ ] Investigate live Windows accent-color updates and reliable appearance detection for standard taskbars; compatibility with third-party taskbar styling mods is not assumed.

### Schedule refresh

- [ ] Replace the hourly refresh interval entry with **1 day**, **1 week** (proposed default), and **1 month** options.
- [ ] Keep essential refresh triggers independent of the chosen interval: mosque changes, missing or invalid cache data, and calendar-year rollover.
- [ ] Retain appropriate failure retries and investigate whether Iqamah schedule updates require more frequent retrieval than the annual prayer calendar.

### Popup and display

- [ ] Add **Show Prayer Icons** in Display settings, using an icon set to be reviewed during implementation; consider icons for Imsak and Shuruq.
- [ ] Add **Popup Scale** from **50% to 200%** (100% preserves current appearance), scaling fonts, icons, row heights, padding, and spacing with dynamic layout measurement. Apply explicit user-defined size overrides after scaling.
- [ ] Add **Bold Next Prayer** for the popup.
- [ ] Add **Highlight Next Prayer**, using the theme accent with adjustable opacity (proposed default: 60%) and a row-appropriate corner radius derived from popup styling.
- [ ] Add **Show Hijri Date** to the taskbar pill: **Off**, **Full**, or **Numeric**. Prefer the date supplied by Mawaqit and use existing automatic pill sizing.

### Compatibility

- [ ] Preserve existing setting keys and custom overrides wherever possible; document any necessary migration.
- [ ] Regression-test primary/secondary taskbars, live theme changes, popup scaling, schedule caching, and Explorer reload behavior.

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
- **Known limitation:** The pill may not immediately refresh when Windows switches light/dark mode; live appearance refresh is targeted for v0.8.0.

---

*Roadmap items are subject to change based on development, testing, and community feedback.*

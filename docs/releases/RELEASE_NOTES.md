# Mawaqit Prayer Clock v0.7.1

**Author-tested source release — pending upstream Windhawk update**

This release builds on v0.7.0 with scheduled Iqamah support, optional Imsak, automatic pill sizing, adaptive popup layouts, and expanded appearance controls. Prayer and Iqamah times come from the selected mosque's published Mawaqit schedule; the mod does not estimate unavailable Iqamah times.

### Highlights
- Show an optional Iqamah suffix beside the taskbar countdown, with adjustable font scaling.
- Between a scheduled Adhan and its Iqamah, retain the current prayer and show `--:--` consistently in the pill and popup footer, even when the optional Iqamah suffix is hidden.
- Handle Isha Iqamah intervals crossing midnight using the previous day's published schedule; missing Iqamah data falls back to Adhan-to-Adhan behavior.
- Automatically size and center visible pill contents, with manual width still available.
- Offer **Show Shuruq and Imsak** (off by default): include Shuruq and mosque-provided Imsak rows in the popup; retain the Fajr-to-Shuruq countdown. Imsak is informational, not a prayer countdown.
- Support six- and seven-entry Mawaqit calendar formats with corrected prayer-time mapping; refresh older incompatible schedule caches using format v4.
- Dynamically size popup mosque-name headers for wrapped names and refine optional-row/footer spacing.
- Add Emberveil Daybreak and refine the Emberveil palette family.
- Style the Windows/System taskbar pill with a Windows accent background and white text. Imsak and Shuruq rows use primary popup text; Iqamah offsets retain secondary text.
- Separate popup appearance/material controls, optional borders and separators, and expanded custom theme overrides.
- Remove the experimental native Windows popup shadow option.

### Validation
The author confirmed all 10/10 final audit-fix regression checks, including midnight rollover, unavailable Iqamah, primary/secondary taskbars, and unload/reload. Earlier focused checks covered popup materials, borders, auto width, and text alignment. Subsequent visual checks confirmed optional prayer rows, wrapped headers, and Emberveil palettes in tested examples; a consolidated post-merge regression pass has not been reported. This is not a guarantee of compatibility with every Windows 11 build or taskbar modification.

### Known limitations
- Light custom popup colors can appear washed out with Blur or Acrylic because of Windows composition. See [Themes](../guides/THEMES.md#light-popup-colors-with-blur-and-acrylic) and [Troubleshooting](../../TROUBLESHOOTING.md#light-popup-background-looks-white-or-washed-out).
- Dynamic center remains experimental on crowded taskbars.
- Only published Mawaqit schedule data is used; missing Iqamah times are not fabricated.
- Localization is a future enhancement, not part of v0.7.1.
- The Windows/System pill may not refresh immediately when switching Windows light/dark mode; live appearance refresh is planned for v0.8.0.
- Imsak only appears if the selected mosque provides it in its schedule.

### Installation
Use `src/windhawk-mawaqit.wh.cpp` in Windhawk's mod editor, compile, enable, and configure your mosque. Existing settings should be reviewed after upgrading. This repository commit does not itself update the upstream Windhawk catalog.

---

# Mawaqit Prayer Clock v0.7.0

**Multi-monitor release candidate — author-tested**

This release candidate adds a prayer clock to secondary Windows 11 taskbars, with independent primary/secondary visibility and the same five positioning choices on both displays. It preserves the existing Mawaqit schedule retrieval, caching, themes, and popup behavior.

### Highlights
- Native XAML clock on primary and secondary taskbars.
- Unified positions: before tray, after tray, before icons, after icons, and experimental dynamic center.
- Independent visibility controls for primary and secondary monitors.
- Monitor-aware popup placement and recovery following display changes and Explorer restart.
- Hardened event-token cleanup, popup teardown, UI-thread dispatch, worker coordination, and taskbar rebuild detection.
- Bounded Explorer startup recovery (approximately 60 seconds) for taskbars created after mod initialization.
- Optional hover-open popup with configurable mouse-leave delay.
- All 26 author-run functional regression checks passed, including theme changes, offline schedule use, prayer rollover, monitor reconnect, and repeated enable/disable.

### Known limitations
- A narrow, crowded, or portrait taskbar may not have room for the selected clock position, especially alongside other taskbar customization mods. Selecting another position can help.
- Dynamic center remains experimental and may overlap other taskbar elements.
- Windows 11 taskbar XAML structures can change between builds; broader compatibility is unverified.
- Schedule retrieval depends on Mawaqit's public website and published data.

### Installation and upgrade
Use `src/windhawk-mawaqit.wh.cpp` in Windhawk's mod editor, compile, enable, and configure the mosque identifier. Existing setting keys are retained; the new `General.ShowPrimaryMonitor` and `General.ShowSecondaryMonitors` switches default to enabled. This is a source release; no precompiled binary is provided.

### Status
Release candidate for review, not a final v0.7.0 release. The author reports successful compilation and functional testing of the formatted `dev.7f.1` baseline, including Explorer restart recovery. Packaging changed only the Windhawk `@version` metadata in C++; this RC-specific metadata edit has not been independently compiled in this environment. Upstream Windhawk acceptance remains subject to maintainer review.

---

# Mawaqit Prayer Clock v0.6.9

**Reliability and compatibility improvements**

This release builds on v0.6.8.4 and the tested dev-9 baseline. It focuses on stable taskbar integration, popup behavior, settings updates, and schedule caching rather than new visual features.

### Highlights
- **Taskbar recovery:** Reinsert the prayer clock if Windows recreates the taskbar’s XAML elements, with a periodic health check.
- **Safer popup handling:** Native activation and dismissal replace the system-wide mouse hook and Escape polling.
- **Improved display scaling:** Better handling of DPI for the pill and popup.
- **Cache management:** Store schedules in Windhawk-managed mod storage and reuse a fresh cache after Explorer restarts.
- **Year-boundary refresh:** Wake around New Year so the next calendar year's schedule can be requested.
- **Settings stability:** Apply UI-owned settings on the taskbar UI thread, retry failed dispatch on the countdown tick, and remove the redundant advanced-settings visibility toggle.
- **Faster shutdown:** Interrupt the startup worker wait when the mod is disabled or reloaded.

### Compatibility and limitations
- All five taskbar positions remain available. **Dynamic center is experimental** and can overlap other taskbar elements.
- Prayer times are supplied by Mawaqit; the mod cannot supply dates missing from Mawaqit's published schedule. December 31 after Isha may show tomorrow as unavailable until January's data is obtained.
- The actual New Year transition and recovery after a taskbar XAML-only recreation have not been conclusively tested. Broader Windows 11 compatibility remains unverified.
- The mod makes HTTPS requests to `mawaqit.net` for public schedule data. The website format or availability may change.

### Upgrade notes
- Existing mosque, theme, display, layout, custom-color and taskbar-position setting keys are retained.
- The legacy `%LOCALAPPDATA%\EmberveilMawaqit` cache folder is no longer used. v0.6.9 uses Windhawk-managed mod storage; any old folder may require manual cleanup.
- The mod-specific advanced-settings visibility switch was removed. Advanced settings remain available in Windhawk.

### Validation
Author regression tests passed for startup, theme and position switching, popup behavior, repeated enable/disable cycles, Explorer restart, and normal shutdown. The final settings-exception safeguard still requires compilation and regression testing. This is not a claim of compatibility with every Windows 11 build or taskbar mod.

### Installation
Install or update the source in Windhawk using `src/windhawk-mawaqit.wh.cpp`, compile and enable it, then configure your mosque. See [README.md](../../README.md) and [CONFIGURATION.md](../../CONFIGURATION.md).

### Notes
- Source release; no precompiled binary.
- Unofficial community project, not affiliated with Mawaqit.
- Upstream Windhawk submission remains subject to maintainer review.

---

# Mawaqit Prayer Clock v0.6.8

**Selectable taskbar positions — release**

This update adds five selectable positions for the native XAML prayer clock, with live switching directly from the **General → Taskbar position** setting. The prayer schedule updater, themes, popup, and existing customization options remain available.

### Highlights

- **Before system tray** — the default, with the clock participating in the tray layout.
- **After system tray** — places the clock beyond the tray.
- **Before taskbar icons** — anchors the clock before application buttons.
- **After taskbar icons** — follows the application buttons as their position changes.
- **Dynamic center (experimental)** — starts at the physical taskbar center and moves right when application buttons approach.
- Switch positions without restarting Windows Explorer.
- Taskbar position is a **General** setting, not hidden under advanced customization.

### Known limitation

**Dynamic center (experimental)** is an overlay and does not reserve space in the application-button layout. Windows may not automatically combine or resize taskbar buttons to accommodate it. On crowded taskbars, the clock can overlap other elements. Use one of the four anchored positions if you prefer native layout spacing.

### Upgrade notes

The new setting is `General.Position`, defaulting to `before-tray`. The four other choices are `after-tray`, `before-icons`, `after-icons`, and `center`. Existing mosque, theme, display, layout, and custom-color settings remain in their current groups. If you use other taskbar customization mods, verify the clock placement after updating.

### Validation

Author-tested: all five positions, live position switching, dynamic-center movement, and a subsequent cleanup regression pass. This does not establish compatibility with every Windows 11 build or combination of taskbar mods.

### Installation

Install Windhawk, create or update the mod using `src/windhawk-mawaqit.wh.cpp`, compile and enable it, then configure your mosque. See [README.md](../../README.md) and [CONFIGURATION.md](../../CONFIGURATION.md).

### Notes

- Source release; no precompiled binary.
- Unofficial community project, not affiliated with Mawaqit.
- Schedule retrieval depends on Mawaqit's website format and availability.

---

# Mawaqit Prayer Clock v0.6.7

**Native XAML taskbar integration — release**

This update moves the taskbar prayer clock to a native XAML slot while retaining the existing Mawaqit schedule updater and prayer schedule popup.

### Highlights

- Native Windows 11 XAML taskbar pill with reserved taskbar space and live countdown.
- 13 appearance themes: Windows / System, Traditional Islamic, Catppuccin Mocha, Emberveil, Emberveil Midnight, Emerald Mosque, Dracula, Nord, Gruvbox Dark, Tokyo Night, Solarized Dark, Solarized Light, and Custom.
- Ten independent custom colors for pill and popup.
- Optional popup auto-close (0 = disabled; 1–300 seconds).
- Layout controls for width, height, margins, padding, tray gap, corner radius, and font size.
- Popup class lifecycle improvements to avoid stale registrations during hot reloads.
- Operational logs consistently prefixed `[Mawaqit]`.

### Upgrade notes

Existing setting keys for mosque, theme, display, layout, and custom colors are retained. The taskbar pill implementation changes from GDI to native XAML. The popup remains Win32-based. If you use third-party taskbar mods, verify the pill position after updating.

### Validation

Author-tested: settings/behavior (8/8), popup auto-close (6/6), and visual inspection (7/7), plus all eight new theme presets. These tests do not establish compatibility with every Windows 11 build or taskbar customization.

### Installation

Install Windhawk, create or update the mod using `src/windhawk-mawaqit.wh.cpp`, compile and enable it, then configure your mosque. See [README.md](../../README.md) and [CONFIGURATION.md](../../CONFIGURATION.md).

### Notes

- Source release; no precompiled binary.
- Unofficial community project, not affiliated with Mawaqit.
- Schedule retrieval depends on Mawaqit's website format and availability.

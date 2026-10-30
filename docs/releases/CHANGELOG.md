# Changelog
Notable changes to Mawaqit Prayer Clock are documented here.

## [Unreleased] — v0.8.0

The v0.8.0 feature set is complete and undergoing final testing. This section summarizes the planned release; it is not a claim that v0.8.0 is already available in the Windhawk catalog.

### Added
- 12-hour and 24-hour prayer-time formats with optional AM/PM, a mosque icon option, a Monochrome theme, border opacity, expanded theme color overrides, and a configurable popup hover-open delay.
- Popup click pinning and hover intent, plus improved taskbar placement and dynamic-center space handling.
- Separate pill and popup typography, updated appearance controls, and 26 predefined themes.

### Changed
- Reorganized the settings hierarchy and raised the minimum fixed pill width to 190 px; automatic width remains available.
- Upgrades retain the mosque identifier, selected theme, and taskbar position. Other v0.7.1 settings use the v0.8.0 defaults.

### Upgrade notes
- The v0.8.0 settings structure does not automatically migrate other v0.7.1 preferences. Back up settings and reapply preferences manually.
- The optional PowerShell migration helper discussed during development is not bundled with the release.
- The exact release version remains under final testing; this changelog entry should be finalized when v0.8.0 is published.

## [0.7.1] — Iqamah schedule and appearance improvements

### Added
- Optional Iqamah suffix with configurable font scaling.
- Source-scheduled Adhan-to-Iqamah interval handling with `--:--` in the pill and popup footer, including midnight-crossing Isha.
- Automatic taskbar pill width and additional popup/theme appearance controls.
- Optional Imsak support for seven-entry Mawaqit calendars, while retaining six-entry calendar support.
- Emberveil Daybreak theme preset.

### Improved
- Fajr–Shuruq visibility consistency and pill text alignment on primary/secondary monitors.
- **Show Shuruq and Imsak** popup option (existing setting key retained); Imsak appears only when published by the mosque.
- Dynamic mosque-name header height for wrapped names, plus more consistent popup row and footer spacing.
- Emberveil palette refinement and Windows/System accent-filled pill with white text.
- Primary text color for Imsak and Shuruq; secondary color retained for Iqamah offsets.
- Separate popup appearance controls, optional popup borders and separators.
- Documentation for light popup colors under Blur/Acrylic.

### Fixed
- Do not skip scheduled Iqamah when its optional display suffix is hidden.
- Handle previous-day Isha Iqamah after midnight without inventing missing times.
- Clean up event handles on initialization failure.
- Remove the experimental native Windows popup shadow setting.
- Correct seven-entry calendar indexing and invalidate incompatible schedule caches (cache format v4).

### Validation
- Final author-run audit regression checks: 10/10 passed.
- Accepted, merged, and published in the upstream Windhawk catalog on 21 October 2026.
- Additional focused visual checks covered wrapped mosque names, optional prayer rows, and Emberveil presets; consolidated regression results are not yet documented here.
- Known limitation: Windows/System pill may not refresh immediately on Windows appearance changes (planned for v0.8.0).

## [0.7.0] — Multi-monitor support

### Added
- Independent clock visibility for primary and secondary Windows 11 taskbars.
- Five unified taskbar positions on both displays: before/after tray, before/after icons, and dynamic center.
- Monitor-aware prayer popup placement and secondary-taskbar XAML lifecycle handling.

### Improved
- Secondary before-icons placement reserves a native XAML layout slot.
- Taskbar recovery following monitor reconnects, primary-display changes, and Explorer restarts.
- Reduced repetitive secondary layout diagnostic logging.
- Hardened XAML event-token cleanup, popup lifecycle and fallback, UI-thread dispatch, schedule-worker synchronization, and shutdown.
- Validated taskbar attachment before reuse and rebuilt stale primary/secondary clock placements.
- Added a bounded Explorer startup retry window (approximately 60 seconds) so late-created taskbar windows do not permanently prevent clock initialization.
- Formatted the source consistently as UTF-8 without BOM; no functional C++ changes were made during release packaging.

### Validation and limitations
- All 26 author-run functional regression checks passed on the tested dual-monitor setup.
- Narrow or crowded taskbars, particularly portrait layouts and configurations with other taskbar mods, may not have enough room for some positions.
- Broader Windows 11 build compatibility has not been established. The author-tested build was subsequently accepted upstream; no standalone precompiled binary was provided.

## [0.6.9] — Reliability and pre-release hardening

### Improved
- Reuse a fresh, matching Mawaqit schedule cache after Explorer restarts instead of downloading unnecessarily.
- Store cache files in Windhawk-managed mod storage, allowing cleanup on uninstall.
- Refresh scheduling wakes around the December 31–January 1 boundary so the new year’s schedule can be requested promptly.
- Scale the taskbar widget and popup consistently across DPI settings.
- Recover the native XAML widget if taskbar elements are recreated, using the existing taskbar hook and a periodic health check.

### Fixed
- Retry pending settings on the taskbar countdown tick if dispatch fails, and preserve the retry request if settings application throws.
- Wake the startup worker immediately on shutdown rather than waiting for its fixed 1.5-second sleep.
- Keep native XAML object lifetime and settings updates on the appropriate UI thread.
- Replace system-wide mouse-hook dismissal and Escape-key polling with native popup activation and keyboard handling.
- Remove the advanced-settings visibility toggle that could leave hidden settings active.

### Notes
- Mawaqit remains the source of prayer times. The mod does not calculate or fabricate unavailable future schedules.
- Dynamic center remains experimental and may overlap taskbar elements.
- Author regression tests passed for settings, enable/disable cycles, Explorer restart, and popup behavior; a taskbar XAML-only recreation and the actual New Year transition have not been conclusively exercised.
- External network access to `mawaqit.net` is documented. At the time of these release notes, upstream acceptance was still pending.

## [0.6.8] - Selectable taskbar positions

### Added
- Five selectable taskbar positions, including experimental dynamic centering

## [0.6.7] — Native XAML taskbar integration and theme expansion

### Added
- Native XAML taskbar pill with reserved space and a live countdown.
- Optional popup auto-close timer (0 disables; 1–300 seconds).
- Eight themes: Emberveil Midnight, Emerald Mosque, Dracula, Nord, Gruvbox Dark, Tokyo Night, Solarized Dark, and Solarized Light; 13 total including Custom.

### Changed
- Replaced the GDI taskbar pill with native XAML integration while retaining the Win32 prayer popup.
- Preserved layout settings, custom pill/popup colors, and mosque-specific schedule updates.
- Standardized diagnostic and operational log prefixes to `[Mawaqit]`.

### Fixed
- Avoided stale popup window-class registrations across Windhawk reloads by using unique class names and teardown cleanup.
- Improved popup dismissal and first-open stability in the tested environment.

## [0.6.6] — Taskbar-aware layout and settings cleanup

### Added
- Automatic clock height that adapts to Windows taskbar size; `PillHeight = 0` enables automatic sizing.
- Manual height override with taskbar-height bounds.
- Four-sided `Margins` positioning and four-sided `Padding` for the internal text area.

### Changed
- Replaced the old horizontal and vertical offset controls with one margin setting.
- Replaced the legacy left-only padding control with four-sided padding.
- Simplified and reordered layout labels: Width, Height, Margin, Padding, Gap before system tray, Corner radius, and Fontsize.
- Kept margin positioning, padding, sizing, and corner rendering independent.

### Fixed
- Restored rounded-corner rendering with automatic height.
- Resolved Windows `RECT` coordinate type mismatches in padding calculations.

## [0.6.2] — Initial public release

### Changed
- Reorganized settings labels and descriptions into Mawaqit, Appearance, Display, Custom pill, Custom popup, Layout, and Advanced groups.
- Clarified that custom colors only apply to the Custom theme.
- Retained existing settings keys and `PillPadding` compatibility.

## [0.6.1]

### Added
- Show/hide next prayer label.
- Show/hide live countdown.
- Enable/disable prayer schedule popup.
- Live application of visibility settings.

## [0.6.0]

### Added
- Unified appearance theme engine for pill and popup.
- Emberveil, Windows / System, Traditional Islamic, Custom, and Catppucchin Mocha presets.
- Independent custom pill and popup color options.

## [0.5.4]

### Improved
- Live settings handling without restarting Explorer.
- Stable GDI rounded-pill rendering.
- Native background schedule updater and prayer popup baseline.

Earlier development builds were internal iterations; this changelog summarizes the milestones rather than claiming a complete historical release record.

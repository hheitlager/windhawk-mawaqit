# Troubleshooting

Start with the installed Windhawk version and the mod's current settings. This guide covers **v0.7.1**, available in the Windhawk catalog.

## No prayer times

Confirm your mosque ID or full Mawaqit URL is valid, the mosque publishes a schedule, and `mawaqit.net` is reachable. Verify your Windows date/time. The mod cannot invent missing Mawaqit schedule data. A valid local cache may continue working temporarily while offline.

**Can’t find your mosque on Mawaqit?** Try [Google’s search for Mawaqit mosques near you](https://www.google.com/search?q=mawaqit+mosque+near+me). Open the relevant Mawaqit mosque page result and copy its complete URL or the final URL segment (mosque ID) into **General → Mosque**. See the [configuration guide](CONFIGURATION.md#finding-your-mosque) for an example and screenshot. A Google result alone does not guarantee the mosque has a Mawaqit schedule.

## Settings missing or not working after an update

An update may reorganize settings or change internal configuration keys. Windhawk can retain older values even when the current settings interface expects a different structure.

### Before updating (recommended)

1. Open **Windhawk → Mawaqit Prayer Clock → Advanced → Mod settings**.
2. Copy your settings JSON into a local text file and keep it as a **pre-update backup**.
3. Review the latest [Release Notes](docs/releases/RELEASE_NOTES.md) for any configuration changes before installing the update.

### If settings stop working after updating

1. **Keep your backup.** If you did not save settings beforehand, copy the currently displayed JSON before making further changes. This may not contain every value from the previous version.
2. Open the mod's normal **Settings** tab and check the affected options.
3. Compare the saved JSON and current settings with the [Configuration Guide](CONFIGURATION.md), particularly any renamed or reorganized options.
4. Reapply affected options through the normal Settings interface, then check whether they work as expected.
5. If an individual option still fails, try resetting **only that option** to its default and configuring it again.

**Important:** Do not paste an entire older JSON configuration over the new one. Keys, groups, and accepted values can change between versions. The mod does not guarantee automatic migration of every advanced setting.

If the problem persists, report the mod version, affected settings, and reproduction steps. Remove personal or sensitive information before sharing configuration or logs.

## Settings compatibility between versions

We aim to preserve core preferences under **General** across normal updates:

- **Mosque** (`General.Mosque`) — your selected Mawaqit mosque ID or URL.
- **Theme** (`General.Theme`) — your selected appearance preset.
- **Taskbar position** (`General.Position`) — your preferred clock placement.

These are compatibility priorities, not a guarantee that every future update will preserve every setting unchanged. Advanced appearance, layout, and experimental options may evolve; where changes are necessary, we aim to retain existing values or provide a migration path.

Any update requiring manual configuration changes should be documented in the [Release Notes](docs/releases/RELEASE_NOTES.md) and [Changelog](docs/releases/CHANGELOG.md).

## Imsak or Shuruq missing from the popup

Enable **Display → Show Shuruq and Imsak** (the existing `ShowFajrWindowCountdown` setting key). Shuruq appears when enabled; Imsak appears only if the selected mosque publishes an Imsak time. These are informational rows, not additional obligatory prayers. If times look incorrect after switching mosques, verify the source schedule and allow the mod to refresh its cache.

## Clock missing or misplaced

Confirm the mod is enabled, the relevant primary/secondary monitor toggle is on, and Explorer's taskbar is running. Try `before-tray` rather than experimental `center`. Crowded or customized taskbars can lack space; restart Explorer only if normal reload/recovery fails.

## Popup does not appear or closes unexpectedly

Check **Advanced → Popup appearance → Show popup**. If using hover mode, inspect the hover close delay and auto-close timer; these are independent. On a multi-monitor setup, test the popup from each taskbar.

## Colors don't match the selected theme

Check **Advanced → Custom theme settings** for nonempty overrides. They apply to *all* presets in v0.7.1. Clear a field to inherit its theme color. `PillIqamah` and `PillBorder` inherit the countdown accent when empty. Transparent/Blur/Acrylic material and opacity settings can affect perceived colors.

## Windows/System pill colors or appearance do not update

The Windows/System preset uses an accent-colored pill with white text. If you choose a very pale accent or disable the pill background, use **Advanced → Custom theme settings** to select legible pill text and countdown colors. Unlike the popup, the pill may not immediately reflect a Windows light/dark switch; reloading the mod can refresh it. Unified live appearance updates are planned for v0.8.0.

## Light popup background looks white or washed out

With **Blur** or **Acrylic** selected for the popup, a pale `PopupBackground` override may appear nearly white even when its hex value is valid. Windows blends the popup tint with what is behind it, so the displayed color is not necessarily the literal `#RRGGBB` value.

To narrow it down:

1. Temporarily switch the **popup** background style to **Solid**. If the color looks right, the difference is likely caused by the Windows backdrop effect.
2. If you want to keep Blur or Acrylic, try a darker `PopupBackground` color and experiment with the popup opacity setting. The visible result can vary with the desktop background and windows behind the popup.
3. Check **Advanced → Custom theme settings → PopupBackground** for a saved override. Clear it if you want to use the selected theme's default color instead.

This behavior is a visual limitation of translucent Windows materials, not necessarily a theme parsing error. See [Themes & customization](docs/guides/THEMES.md#light-popup-colors-with-blur-and-acrylic).

## Iqamah missing or too small (v0.7.1)

Enable **Display → Show Iqamah time** and the main countdown; the suffix depends on both. Iqamah information also depends on the mosque's available data. Adjust **Iqamah font scale (%)** between 50 and 100, and ensure the pill has enough width.

The optional Iqamah suffix setting only controls whether the suffix is displayed. When the mosque publishes an Iqamah time, the clock still retains the current prayer between Adhan and Iqamah and shows `--:--` in the pill and popup footer. Missing Iqamah data falls back to the normal next-Adhan countdown.

## Reporting an issue

Include Windows 11 build, Windhawk version, mod version, taskbar position, monitor count/DPI, relevant settings, and reproducible steps. Attach a screenshot and sanitized Windhawk logs when helpful. Do not share personal paths or sensitive information unnecessarily.

See [CONFIGURATION.md](CONFIGURATION.md) and [DEVELOPMENT.md](docs/development/DEVELOPMENT.md).


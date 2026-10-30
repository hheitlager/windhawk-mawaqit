# Troubleshooting

This guide covers the upcoming **v0.8.0** settings. The update is still in final testing; the latest public Windhawk catalog release remains v0.7.1, so settings in the two versions are organized differently.

## No prayer times

Confirm your mosque identifier or full Mawaqit URL is valid, the mosque publishes a schedule, and `mawaqit.net` is reachable. Verify your Windows date and time. The mod cannot invent missing schedule data. A valid local cache may continue working temporarily while offline.

## Settings changed after upgrading

Before updating from v0.7.1, back up the current settings JSON. The v0.8.0 settings structure is new: the mosque identifier, selected theme, and taskbar position are preserved, while other settings use v0.8.0 defaults. **No migration helper is included with this release.** Reapply other preferences manually using the [Configuration Reference](CONFIGURATION.md).

Do not paste a complete v0.7.1 JSON object into the v0.8.0 settings. Key names and accepted values changed. Keep the backup in case you need to refer to your previous choices.

## Clock missing or misplaced

Check that the mod is enabled and the relevant primary/secondary monitor option is on. Try an anchored position such as **Before system tray** if **Dynamic center** has no room. Crowded or customized taskbars may limit available space. If the taskbar was recreated, allow the mod to recover; restart Explorer only if normal recovery fails.

## Popup does not open or closes unexpectedly

Check **Popup → Show popup** and **Open popup when hovering over clock**. Hover opening waits for the configured open delay; leaving the pill or pressing a mouse button cancels it. Hover-opened popups close after the pointer leaves both the pill and popup. Clicking the pill or interacting with the popup pins it. Auto-close is paused while the pointer is over either surface; the hover-close delay and auto-close timer have separate settings.

If behavior differs on one monitor, verify the popup from each enabled taskbar and confirm the secondary monitor setting is on.

## Imsak or Shuruq is missing

Enable **Taskbar pill → Content → Show Shuruq and Imsak**. Shuruq appears when enabled; Imsak appears only if the selected mosque publishes an Imsak time. These are schedule information rows, not additional obligatory prayers. After Fajr begins, the countdown can show the remaining time to Shuruq.

## Colors do not match the selected theme

Review **Theme color overrides**. Nonempty values apply to all themes until cleared. Each field accepts `#RRGGBB` or `RRGGBB`; invalid values are ignored and inherit the theme color. Transparent, Blur, and Acrylic materials blend with Windows composition and may look different from the literal color value. Try a Solid background to compare.

The Monochrome theme follows Windows light/dark appearance when automatic theme switching is enabled. The Windows / System theme can also reflect Windows appearance and accent colors.

## Text or popup is clipped

For the pill, use automatic width (`Width = 0`) or a fixed width of at least 190 px, and check margins, padding, font size, and taskbar space. For the popup, reduce its base font size or overall scale. Long mosque names and optional schedule rows increase the required popup space.

## Reporting an issue

Include the Windows build, Windhawk version, mod version, selected taskbar position, monitor count and scaling, relevant settings, and steps to reproduce. A screenshot and sanitized Windhawk logs can help. Remove personal paths or other sensitive information before sharing.

See the [Configuration Reference](CONFIGURATION.md), [Themes Guide](docs/guides/THEMES.md), and [Release Notes](docs/releases/RELEASE_NOTES.md).

# Troubleshooting

Start with the installed Windhawk version and the mod's current settings. This guide describes the v0.7.1 development features where indicated.

## No prayer times

Confirm your mosque ID or full Mawaqit URL is valid, the mosque publishes a schedule, and `mawaqit.net` is reachable. Verify your Windows date/time. The mod cannot invent missing Mawaqit schedule data. A valid local cache may continue working temporarily while offline.

**Can’t find your mosque on Mawaqit?** Try [Google’s search for Mawaqit mosques near you](https://www.google.com/search?q=mawaqit+mosque+near+me), open the relevant Mawaqit mosque page and copy its complete URL or the final URL segment (mosque ID) into **General → Mosque**. See the [configuration guide](CONFIGURATION.md#finding-your-mosque) for an example and screenshot. A Google result alone does not guarantee the mosque has a Mawaqit schedule.

![Where to find the mosque ID](screenshots/Mawaqit-Mosque-Identifier.png)

## Clock missing or misplaced

Confirm the mod is enabled, the relevant primary/secondary monitor toggle is on, and Explorer's taskbar is running. Try `before-tray` rather than experimental `center`. Crowded or customized taskbars can lack space; restart Explorer only if normal reload/recovery fails.

## Popup does not appear or closes unexpectedly

Check **Advanced → Popup appearance → Show popup**. If using hover mode, inspect the hover close delay and auto-close timer; these are independent. On a multi-monitor setup, test the popup from each taskbar.

## Colors don't match the selected theme

Check **Advanced → Custom theme settings** for nonempty overrides. They apply to *all* presets in the development build. Clear a field to inherit its theme color. `PillIqamah` and `PillBorder` inherit the countdown accent when empty. Transparent/Blur/Acrylic material and opacity settings can affect perceived colors.

## Iqamah missing or too small (v0.7.1 development)

Enable **Display → Show Iqamah time** and the main countdown; the suffix depends on both. Iqamah information also depends on the mosque's available data. Adjust **Iqamah font scale (%)** between 50 and 100, and ensure the pill has enough width.

## Reporting an issue

Include Windows 11 build, Windhawk version, mod version, taskbar position, monitor count/DPI, relevant settings, and reproducible steps. Attach a screenshot and sanitized Windhawk logs when helpful. Do not share personal paths or sensitive information unnecessarily.

See [CONFIGURATION.md](CONFIGURATION.md) and [DEVELOPMENT.md](DEVELOPMENT.md).

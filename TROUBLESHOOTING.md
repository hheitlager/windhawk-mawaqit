# Troubleshooting

Start with the installed Windhawk version and the mod's current settings. This guide covers the v0.7.1 repository source release; the upstream Windhawk catalog may still provide v0.7.0.

## No prayer times

Confirm your mosque ID or full Mawaqit URL is valid, the mosque publishes a schedule, and `mawaqit.net` is reachable. Verify your Windows date/time. The mod cannot invent missing Mawaqit schedule data. A valid local cache may continue working temporarily while offline.

**Can’t find your mosque on Mawaqit?** Try [Google’s search for Mawaqit mosques near you](https://www.google.com/search?q=mawaqit+mosque+near+me), since Mawaqit does not currently have a convenient nearby-mosque search on its website. Open the relevant Mawaqit mosque page and copy its complete URL or the final URL segment (mosque ID) into **General → Mosque**. See the [configuration guide](CONFIGURATION.md#finding-your-mosque) for an example and screenshot. A Google result alone does not guarantee the mosque has a Mawaqit schedule.

## Clock missing or misplaced

Confirm the mod is enabled, the relevant primary/secondary monitor toggle is on, and Explorer's taskbar is running. Try `before-tray` rather than experimental `center`. Crowded or customized taskbars can lack space; restart Explorer only if normal reload/recovery fails.

## Popup does not appear or closes unexpectedly

Check **Advanced → Popup appearance → Show popup**. If using hover mode, inspect the hover close delay and auto-close timer; these are independent. On a multi-monitor setup, test the popup from each taskbar.

## Colors don't match the selected theme

Check **Advanced → Custom theme settings** for nonempty overrides. They apply to *all* presets in the development build. Clear a field to inherit its theme color. `PillIqamah` and `PillBorder` inherit the countdown accent when empty. Transparent/Blur/Acrylic material and opacity settings can affect perceived colors.

## Light popup background looks white or washed out

With **Blur** or **Acrylic** selected for the popup, a pale `PopupBackground` override may appear nearly white even when its hex value is valid. Windows blends the popup tint with what is behind it, so the displayed color is not necessarily the literal `#RRGGBB` value.

To narrow it down:

1. Temporarily switch the **popup** background style to **Solid**. If the color looks right, the difference is likely caused by the Windows backdrop effect.
2. If you want to keep Blur or Acrylic, try a darker `PopupBackground` color and experiment with the popup opacity setting. The visible result can vary with the desktop background and windows behind the popup.
3. Check **Advanced → Custom theme settings → PopupBackground** for a saved override. Clear it if you want to use the selected theme's default color instead.

This behavior is a visual limitation of translucent Windows materials, not necessarily a theme parsing error. See [Themes & customization](THEMES.md#light-popup-colors-with-blur-and-acrylic).

## Iqamah missing or too small (v0.7.1)

Enable **Display → Show Iqamah time** and the main countdown; the suffix depends on both. Iqamah information also depends on the mosque's available data. Adjust **Iqamah font scale (%)** between 50 and 100, and ensure the pill has enough width.

The optional Iqamah suffix setting only controls whether the suffix is displayed. When the mosque publishes an Iqamah time, the clock still retains the current prayer between Adhan and Iqamah and shows `--:--` in the pill and popup footer. Missing Iqamah data falls back to the normal next-Adhan countdown.

## Reporting an issue

Include Windows 11 build, Windhawk version, mod version, taskbar position, monitor count/DPI, relevant settings, and reproducible steps. Attach a screenshot and sanitized Windhawk logs when helpful. Do not share personal paths or sensitive information unnecessarily.

See [CONFIGURATION.md](CONFIGURATION.md) and [DEVELOPMENT.md](DEVELOPMENT.md).

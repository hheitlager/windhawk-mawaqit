# Configuration reference

This guide describes the planned **v0.8.0** settings. The update is still in final testing; v0.7.1 remains the latest public catalog release. Configure options in Windhawk’s normal **Settings** tab. The names below are the setting paths within their groups.

> **Upgrading from v0.7.1:** back up your settings first. The new structure preserves your mosque identifier, selected theme, and taskbar position. Other display, layout, appearance, popup, and custom-color settings reset to the v0.8 defaults. There is no migration helper bundled with this release; reapply other preferences manually.

## General

| Setting | Default | Values / purpose |
|---|---:|---|
| `Mosque` | `al-haram-makkah-saudi-arabia` | Mawaqit mosque identifier or full URL |
| `Theme` | `system` | `system`, `monochrome`, `traditional`, `catppuccin`, `catppuccin-latte`, `emberveil`, `emberveil-midnight`, `emberveil-daybreak`, `emerald-mosque`, `dracula`, `dracula-light`, `nord`, `nord-light`, `gruvbox`, `gruvbox-light`, `tokyo-night`, `tokyo-night-day`, `solarized-dark`, `solarized-light`, `rose-pine`, `everforest`, `synthwave-84`, `flexoki`, `kanagawa`, `ayu`, `one-dark`, `custom` |
| `AutomaticTheme` | `false` | Switch between supported light/dark counterparts when Windows appearance changes |
| `Position` | `before-tray` | `before-tray`, `after-tray`, `before-start`, `before-icons`, `after-icons`, `center` (experimental) |
| `TimeFormat` | `24h` | `24h` or `12h`; affects scheduled times, not countdowns or Iqamah offsets |
| `ShowAmPm` | `true` | Show AM/PM for 12-hour times; ignored in 24-hour format |

To find your mosque, open its page on [Mawaqit](https://mawaqit.net/) and copy the full URL or final URL segment into `Mosque`.

## Taskbar pill

### Monitors

| Setting | Default | Meaning |
|---|---:|---|
| `ShowPrimaryMonitor` | `true` | Show the clock on the primary taskbar |
| `ShowSecondaryMonitors` | `false` | Also show it on secondary taskbars |

### Layout

| Setting | Default | Values / meaning |
|---|---:|---|
| `Style` | `floating` | `floating` or `attached` to the taskbar |
| `Width` | `0` | `0` sizes automatically; fixed width is 190–400 px |
| `Height` | `0` | `0` follows taskbar height; otherwise 1–100 px |
| `Margins` | `0, 0, 0, 0` | Left, top, right, bottom offsets; −100 to 100 px each |
| `Padding` | `0, 0, 0, 0` | Inner spacing in left, top, right, bottom order; 0–100 px each |

### Content

| Setting | Default | Values / meaning |
|---|---:|---|
| `ShowNextPrayer` | `name` | `none`, `name`, `icon`, or `both` |
| `NextPrayerIconStyle` | `prayer-period` | `prayer-period` or `mosque`; used when the selected next-prayer display includes an icon |
| `ShowCountdown` | `true` | Show time remaining until the next prayer |
| `ShowIqamahTime` | `true` | Show published Iqamah delays beside the countdown and in the popup |
| `ShowFajrWindowCountdown` | `false` | Add Shuruq and mosque-provided Imsak rows; after Fajr, count down to Shuruq. Imsak is informational. |
| `HijriDate` | `off` | `off`, `numeric`, or `full` in the pill |

### Typography

| Setting | Default | Values / meaning |
|---|---:|---|
| `FontWeight` | `normal` | `normal`, `medium`, `semibold`, or `bold` |
| `FontSize` | `15` | 10–24 px |
| `IqamahFontScale` | `80` | Iqamah suffix size as 50–100% of pill font size |
| `TextShadow` | `false` | Add a subtle shadow behind pill text |

### Appearance

| Setting | Default | Values / meaning |
|---|---:|---|
| `BackgroundStyle` | `solid` | `solid`, `transparent`, `blur`, or `acrylic` |
| `BackgroundOpacity` | `100` | 0–100%; effects may render differently with Windows composition |
| `CornerRadius` | `13` | 0–30 px |
| `ShowBorder` | `false` | Show a pill border; attached layout draws only the left and right edges |
| `BorderOpacity` | `20` | Border opacity, 0–100%; applies when the border is enabled |

## Popup

### Behavior

| Setting | Default | Values / meaning |
|---|---:|---|
| `Enabled` | `true` | Enable the prayer schedule popup |
| `OpenOnHover` | `true` | Allow the popup to open from hovering over the pill |
| `AutoCloseSeconds` | `5` | 0 disables; otherwise 1–300 seconds outside the pill and popup |
| `HoverOpenDelayMs` | `500` | 0–5000 ms before hover opens; leaving or pressing a mouse button cancels the pending open |
| `HoverCloseDelayMs` | `500` | 0–5000 ms after leaving both pill and popup |

Hover-opened popups close after the pointer leaves both the pill and popup. Clicking the pill or interacting with the popup pins it. Auto-close does not run down while the pointer is using the popup.

### Layout

| Setting | Default | Values / meaning |
|---|---:|---|
| `Placement` | `floating` | `floating` or `attached` to the pill |
| `AttachedCornerStyle` | `adaptive` | `adaptive`, `rounded`, or `square` |
| `ScalePercent` | `100` | 50–200%; scales the popup as a whole |

### Content

| Setting | Default | Meaning |
|---|---:|---|
| `ShowPrayerIcons` | `true` | Show an icon beside each prayer |
| `HighlightNextPrayer` | `true` | Highlight the upcoming prayer |
| `ShowNextPrayerBorder` | `true` | Draw a border around the upcoming prayer row |
| `HighlightOpacity` | `20` | Highlight strength, 0–100% |
| `BoldNextPrayer` | `true` | Use bold text for the upcoming prayer |
| `HijriDate` | `full` | `off`, `numeric`, or `full` |

### Appearance and typography

| Setting | Default | Values / meaning |
|---|---:|---|
| `BackgroundStyle` | `follow-pill` | `follow-pill`, `solid`, `transparent`, `blur`, or `acrylic` |
| `BackgroundOpacity` | `-1` | `-1` follows pill opacity; otherwise 0–100% |
| `ShowBorder` | `true` | Show the popup outline |
| `ShowSeparators` | `true` | Show popup divider lines |
| `FontSize` | `15` | Popup base font size, 10–24 px; larger text expands the layout |
| `FontWeight` | `normal` | `normal`, `medium`, `semibold`, or `bold` |
| `TextShadow` | `false` | Add a subtle shadow behind popup text |

## Theme color overrides

All values are empty by default and accept `#RRGGBB` or `RRGGBB` (six hexadecimal digits). Surrounding whitespace is ignored. Empty or invalid values inherit the resolved theme color. Nonempty overrides apply to any selected theme until cleared.

| Group | Available color roles |
|---|---|
| `Pill` | `Background`, `Border`, `Icon`, `Text`, `Countdown`, `Iqamah`, `HijriDate`, `Separator` |
| `Popup` | `Background`, `Border`, `MosqueName`, `HijriDate`, `Icon`, `Text`, `Muted`, `Iqamah`, `Rule`, `NextPrayerBackground`, `NextPrayerBorder`, `NextPrayerText`, `Footer` |

The mod settings editor is the authority for the exact stored key paths. Empty fields inherit the theme role described in the settings. `ShowBorder` must be on for the pill border to appear; popup border and separators have their own controls.

## Refresh interval

`Advanced → Refresh interval (hours)` accepts **1–720 hours** and defaults to **168 hours (7 days)**. For example, 24 is daily and 720 is every 30 days. Failed requests retry after one hour; matching cached schedule data may be reused after Explorer restarts.

## Upgrade from v0.7.1

The v0.8.0 settings structure is new. Mosque, theme, and taskbar position are retained; other existing values are not automatically migrated and will use v0.8.0 defaults. The release does **not** bundle or run the optional PowerShell migration helper discussed during development. To carry over other preferences, save a copy of your old settings and re-enter those values in the new settings page.

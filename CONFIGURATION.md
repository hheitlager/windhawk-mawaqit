# Configuration reference

This reference covers the **v0.7.1 repository source release**. The accepted upstream Windhawk v0.7.0 may not expose all controls until the catalog is updated. Configure options in Windhawk's normal **Settings** tab; Advanced → Mod settings provides the underlying JSON if needed. Back up your existing JSON before editing it.

## Finding your mosque

If you do not know your mosque’s Mawaqit page, [search Google for a Mawaqit mosque near you](https://www.google.com/search?q=mawaqit+mosque+near+me). Mawaqit’s website does not currently provide a convenient nearby-mosque finder. Open a result for your mosque on [Mawaqit](https://mawaqit.net/) and copy either the **full Mawaqit URL** or its **mosque ID** (the final URL segment) into **General → Mosque**.

For example, both `https://mawaqit.net/en/al-haram-makkah-saudi-arabia` and `al-haram-makkah-saudi-arabia` identify the same mosque. The Google search helps locate a page; it does not replace the Mawaqit URL or ID in the setting.

![Mawaqit URL and mosque ID](screenshots/Mawaqit-Mosque-Identifier.png)

## General

| Setting | Values / purpose |
|---|---|
| `Mosque` | Mawaqit mosque slug or full URL |
| `Theme` | `system`, `traditional`, `catppuccin`, `emberveil`, `emberveil-midnight`, `emerald-mosque`, `dracula`, `nord`, `gruvbox`, `tokyo-night`, `solarized-dark`, `solarized-light`, `custom` |
| `Position` | `before-tray`, `after-tray`, `before-icons`, `after-icons`, `center` (experimental) |

## Display settings

| Setting | Default | Meaning |
|---|---|---|
| `ShowNextPrayer` | true | Prayer name and time |
| `ShowCountdown` | true | Main countdown |
| `ShowIqamahTime` | true | Iqamah suffix and popup delay information |
| `ShowFajrWindowCountdown` | false | After Fajr and before Shuruq, count down to sunrise |
| `ShowPrimaryMonitor` | true | Show clock on primary taskbar |
| `ShowSecondaryMonitors` | true | Show clocks on secondary taskbars |

## Advanced → Layout settings

| Setting | Default | Valid values / notes |
|---|---|---|
| `Width` | 200 | 180–400 px; invalid values use 200 |
| `PillHeight` | 0 | 0 automatic, otherwise 1–100 px |
| `Margins` | `0, 0, 0, 0` | left, top, right, bottom; −100 to 100 each |
| `Padding` | `0, 0, 0, 0` | left, top, right, bottom; 0–100 each |
| `TrayGap` | 5 | 0–100 px |
| `CornerRadius` | 13 | 0–30 px |
| `BackgroundStyle` | `solid` | `solid`, `transparent`, `blur`, `acrylic` |
| `BackgroundOpacity` | 100 | 0–100% |
| `ShowPillBorder` | false | 1 px accent border |
| `TextShadow` | false | Subtle pill text shadow |
| `FontSize` | 15 | 10–24 px |
| `IqamahFontScale` | 80 | 50–100% of pill font size |

## Advanced → Popup appearance

| Setting | Default | Values / meaning |
|---|---|---|
| `EnablePopup` | true | Enable popup |
| `OpenPopupOnHover` | false | Hover opens popup |
| `HoverCloseDelayMs` | 500 | 0–5000 ms |
| `PopupAutoCloseSeconds` | 5 | 0 disabled; 1–300 seconds |
| `BackgroundStyle` | `follow-pill` | `follow-pill`, `solid`, `transparent`, `blur`, `acrylic` |
| `BackgroundOpacity` | -1 | -1 follows pill; 0–100 independently |
| `ShowBorder` | true | Popup border visibility |
| `ShowSeparators` | true | Popup divider visibility |
| `NativeShadow` | false | Experimental native Windows popup shadow |

## Advanced → Custom theme settings

All fields default to **empty** and accept optional `#RRGGBB` overrides. Unlike older releases, **overrides apply to any selected preset**. Empty or invalid values inherit the selected theme. The `custom` theme has its own built-in fallback palette.

| Pill | Popup |
|---|---|
| `PillBackground` | `PopupBackground` |
| `PillText` | `PopupBorder` |
| `PillSeparator` | `PopupText` |
| `PillCountdown` | `PopupMuted` |
| `PillIqamah` | `PopupRule` |
| `PillBorder` | `PopupFooter` |

When empty, `PillIqamah` and `PillBorder` inherit the **resolved** countdown color. `ShowPillBorder` must be enabled for the pill border to appear.

For all preset colors and examples, see [THEMES.md](THEMES.md).

## Advanced → Mod settings

`RefreshHours`: 1–168 hours, default 24. Failed updates retry after one hour; fresh matching cache data may be reused after Explorer restarts. The mod stores cache data in Windhawk-managed mod storage.

## Example: change only an accent

Select **Nord** as the theme, then enter `#FFBC5E` into **Advanced → Custom theme settings → Pill countdown**. Leave **Pill Iqamah** empty to inherit that accent. Clear **Pill countdown** to return to Nord's default accent.

**Note:** The settings groups and JSON key paths changed since the older v0.7.0 documentation. Always use the current installed mod's settings editor as the authority for your build rather than pasting an old full JSON object.

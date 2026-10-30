# Themes & customization

This guide describes the themes and color customization planned for **v0.8.0**. The update is still in final testing; the latest public Windhawk catalog release remains v0.7.1. Screenshots currently in the repository were captured with v0.7.1 and are illustrative; they do not show every v0.8.0 theme or option.

## Available themes

There are **26 predefined themes** and a **Custom** option:

| Theme | Theme | Theme |
|---|---|---|
| Windows / System | Monochrome | Traditional Islamic |
| Catppuccin Mocha | Catppuccin Latte | Emberveil |
| Emberveil Midnight | Emberveil Daybreak | Emerald Mosque |
| Dracula | Dracula Light | Nord |
| Nord Light | Gruvbox Dark | Gruvbox Light |
| Tokyo Night | Tokyo Night Day | Solarized Dark |
| Solarized Light | Rosé Pine | Everforest |
| SynthWave ’84 | Flexoki | Kanagawa |
| Ayu | One Dark | Custom |

With **Automatic light/dark theme** enabled, the mod switches among supported paired themes: Catppuccin Mocha/Latte, Emberveil/Daybreak, Dracula/Dracula Light, Nord/Nord Light, Gruvbox Dark/Light, Tokyo Night/Tokyo Night Day, and Solarized Dark/Light. Monochrome adapts its own palette to Windows light/dark appearance. Themes without a counterpart retain their selected palette.

## Color overrides

Open **Theme color overrides** and enter a six-digit hexadecimal color, with or without `#` (for example, `#FFBC5E` or `FFBC5E`). The input ignores surrounding whitespace. Leave a field empty to inherit its theme color. Invalid values also fall back to the theme. Nonempty overrides remain active when you change themes until you clear them.

The override groups follow the pill and popup color roles:

| Pill role | What it colors |
|---|---|
| `Background` | Pill fill |
| `Border` | Optional pill outline |
| `Icon` | Next-prayer icon |
| `Text` | Prayer name and scheduled time |
| `Countdown` | Countdown text |
| `Iqamah` | Iqamah delay |
| `HijriDate` | Hijri date in the pill |
| `Separator` | Divider between pill content |

| Popup role | What it colors |
|---|---|
| `Background` / `Border` | Popup surface and outline |
| `MosqueName` / `HijriDate` | Header and date |
| `Icon` / `Text` / `Muted` / `Iqamah` | Prayer rows and secondary information |
| `Rule` / `Footer` | Dividers and popup footer |
| `NextPrayerBackground` / `NextPrayerBorder` / `NextPrayerText` | Upcoming-prayer row highlight |

The pill border must be enabled to display; **Border opacity** adjusts its visibility from 0–100%. Popup highlight opacity and border are controlled separately under Popup → Content. Empty overrides inherit their documented theme role; for example, an empty pill border uses the countdown accent.

## Mix and match

1. Choose a theme under **General → Theme**.
2. Open **Theme color overrides**.
3. Change only the roles you want; leave the rest empty to use the theme palette.
4. To return to a theme color, clear that role’s override.

For example, select **Nord**, set **Pill → Countdown** to `FFBC5E`, and leave **Pill → Iqamah** empty to let it inherit the resolved accent.

## Materials and color appearance

Pill and popup backgrounds can use Solid, Transparent, Blur, or Acrylic materials, with separate opacity controls. Windows composition blends Blur and Acrylic with the content behind the popup, so the displayed tint may differ from the entered hex value. Try Solid for a predictable color or adjust the tint and opacity for translucent materials.

For full settings and defaults, see the [Configuration Reference](../../CONFIGURATION.md). For common display issues, see [Troubleshooting](../../TROUBLESHOOTING.md).

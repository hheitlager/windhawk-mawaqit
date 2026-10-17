# Mawaqit v0.7.1 — pre-submission review for Git-Claude / Windhawk agent

## Review scope
Source: `windhawk-mawaqit.wh.cpp` (based on author-tested `0.7.1-dev5.9.10`). This is a **review candidate**, not a signed-off release. No local Windows/Windhawk compile or runtime test was performed. Changes from dev5.9.10 in this package are limited to embedded documentation/comments; no functional C++ logic was intentionally changed.

## Confirmed by static inspection
- `@id windhawk-mawaqit`, `@include explorer.exe`, x86-64 architecture, compiler options and WinHTTP use present.
- Theme palette resolves base theme then per-field nonempty valid `#RRGGBB` overrides, for both pill and popup.
- Popup `PopupBackground` override changes ACCENT_POLICY tint RGB while preserving style alpha (`0xCC` Acrylic, `0x50` Transparent, `0x60` Blur).
- Transparent popup uses accent state 4, not `UpdateLayeredWindow`; pill transparency is separately implemented.
- Transparent, Blur, Acrylic popup radius is fixed to 8 DIP; Solid popup radius follows configured corner radius. DWM uses its own Windows-defined rounding, so exact geometric equivalence is not guaranteed.
- Optional pill text shadow is available and defaults to off.
- Documentation previously claimed colors only applied in Custom theme and claimed Transparent opacity always zero; corrected in this review copy.

## Items requiring agent attention (do not auto-approve)
1. **Material/theme semantics:** The base theme's `PopupBackground` does *not* automatically feed ACCENT_POLICY tint. Only an explicit `PopupBackground` override changes tint. Check whether this is intended. Preserve the author-tested default tint unless deliberately changing behavior.
2. **Custom theme migration:** Windhawk may retain old nonempty default values in persisted settings. Those now act as overrides even for non-Custom themes. Validate migration/user instructions.
3. **Opaque-on-opaque contrast:** `#000000` text with `#000000` background can be invisible; this is user-selectable, not necessarily a bug. Do not silently change user colors.
4. **Backdrop API compatibility:** `SetWindowCompositionAttribute` is undocumented; test success/fallback on supported Windows 11 builds, including multi-monitor/DPI and taskbar at top/bottom.
5. **Security/network:** Check Mawaqit URL normalization, HTTPS/WinHTTP timeouts, HTML parsing robustness, cache persistence, and untrusted data handling.
6. **Lifetime/threading:** Review `HWND` lifetime, XAML UI-thread dispatch, worker shutdown, event token cleanup, popup timer and GDI/DC/resource ownership, especially Explorer restart/reload.
7. **Performance:** Verify center-layout and countdown update loops do not cause avoidable work or noisy logging at ordinary Windhawk logging levels.
8. **Release metadata:** Verify screenshot URLs, project links, credits/license, `@version` policy, release notes, and Windhawk store submission conventions. Avoid shipping development notes as release copy.

## Suggested regression matrix
- Theme: System, Tokyo Night, Catppuccin, Custom; empty override, one override, all overrides, malformed hex.
- Material: Solid 100%/50%, Transparent, Blur, Acrylic; popup and pill independently.
- Text shadow: on/off; countdown updates; primary/secondary taskbar.
- Popup: click/hover, auto-close, open/close animation, high DPI, multi-monitor, top/bottom taskbar, no mosque/network error.
- Refresh: cached/uncached, offline, invalid mosque, failed fetch/retry, settings changed while worker runs.
- Stability: reload mod, disable mod, Explorer restart, sleep/resume, taskbar rebuild.

## Review instructions for agent
Review for correctness, regressions, security, resource lifetime, Windhawk conventions and build compatibility. Prioritize reproducible issues with file line references and severity. Do not rewrite stable working UI or change tint/opacity/color defaults without a clear defect. Compile with the actual Windhawk toolchain, run static checks, and report separately what is inspected vs tested. Treat this as pre-release candidate until checks pass.

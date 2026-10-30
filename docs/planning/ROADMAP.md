# Mawaqit Prayer Clock — Roadmap

## v0.8.0 — Appearance & usability

**Status:** Feature complete; in final testing. The latest public catalog release remains v0.7.1.

### Completed for v0.8.0

- Windows light/dark appearance updates, theme counterparts, and the Monochrome theme.
- Six taskbar positions, primary/secondary monitor controls, and crowded-taskbar handling for Dynamic center.
- Pill and popup layout, typography, materials, opacity, borders, and custom color roles.
- Configurable hover-open delay, hover-close behavior, click pinning, and popup auto-close handling.
- 12/24-hour prayer-time display with optional AM/PM; countdowns remain duration-based.
- Expanded theme choices and `#RRGGBB` / `RRGGBB` custom-color entry.
- Revised settings hierarchy and user documentation.

### Upgrade behavior

The v0.8.0 settings structure preserves the mosque identifier, selected theme, and taskbar position. Other v0.7.1 settings are not automatically migrated and reset to v0.8.0 defaults. The optional PowerShell migration helper discussed during development is **not included** in the release, so users need to reapply other preferences manually.

## v0.9.0 — Localization & religious calendar integration

**Status:** Planned — internal development milestone.

### Planned investigations and features

- **Localization:** Investigate multilingual UI support, automatic language detection, and manual language selection.
- **Ramadan & holy moments:** Investigate Ramadan-specific features, important Islamic dates, and integration with available Mawaqit data.
- **Community feature review:** Revisit collected suggestions and evaluate usefulness, feasibility, and compatibility.

### Potential graduation to v1.0.0

If v0.9.0 delivers its planned functionality and passes stability, compatibility, and release testing, the project may move directly to **v1.0.0**, marking the first stable release. This is a goal, not a guaranteed release commitment.

---

*Roadmap items may change based on development, testing, and community feedback.*

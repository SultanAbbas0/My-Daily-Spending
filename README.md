# My Daily Spending

A cross-platform Flutter app for managing money on a daily allowance model: set a balance and a recurring budget, deduct spending as it happens, track savings, and watch your balance replenish automatically each day.

![Flutter](https://img.shields.io/badge/Flutter-Dart-02569B?logo=flutter)
![Riverpod](https://img.shields.io/badge/State-Riverpod-1E88E5)
![Supabase](https://img.shields.io/badge/Backend-Supabase-3ECF8E?logo=supabase)
![Melos](https://img.shields.io/badge/Monorepo-Melos-orange)

---

## Overview

My Daily Spending turns budgeting into a daily habit instead of a monthly spreadsheet. A user sets a starting balance and a budget amount; the app auto-replenishes the daily balance and lets the user deduct against it (and against savings) as they spend. Everything is backed by Supabase (Postgres + Auth), with English/Arabic localization and a fully responsive UI.

Built as a Melos-managed monorepo (`apps/my_daily_spending`) so the workspace is ready to grow into shared packages without restructuring later.

---

## Engineering Highlights

What this project demonstrates, for anyone skimming the code:

- **Monorepo structure from day one** — Melos workspace (`melos.yaml`, `pubspec.yaml`) with an `apps/**` / `packages/**` layout, so business logic can be extracted into shared packages without a rewrite.
- **Unidirectional state with Riverpod** — screens read from `FutureProvider`/`StateProvider` (`providers/providers.dart`) and repositories own all data access; widgets never talk to Supabase directly.
- **Thin repository layer over Supabase** — `AuthRepository`, `BalanceRepository`, `BudgetRepository`, `SavingRepository`, `UserRepository` each wrap one Supabase concern, keeping the client (`DataBaseRepository.database`) as the single source of truth for the current session/user.
- **Real internationalization, not just string swapping** — `easy_localization` with full English/Arabic translation JSON (`assets/translations/`) and RTL-aware layout, including a runtime locale switcher in Settings.
- **Responsive UI across form factors** — `flutter_screenutil` for density-independent sizing, `flutter_hooks`/`hooks_riverpod` for lifecycle-aware widget state, custom reusable components (gradient containers, dialogs, buttons) shared across screens.
- **Multi-platform target** — single codebase ships to Android, iOS, web, Windows, macOS, and Linux (all platform folders present and configured).
- **Secrets kept out of source control** — Supabase URL/anon key loaded from a gitignored `auth/secrets.dart`, not hardcoded in `main.dart`.

---

## Features

- **Daily balance system** — set an initial balance and budget; the balance replenishes automatically on a daily cycle.
- **Spend & save deductions** — a dedicated deduct screen subtracts from either the daily balance or savings, with undo support.
- **Savings tracking** — savings accumulate independently of the daily spending balance and are visible on the dashboard.
- **Authentication** — email/password signup and login via Supabase Auth, with a user profile row created on signup.
- **Profile management** — change profile picture (via `image_picker`) and username.
- **Localization** — switch between English and Arabic at runtime, including RTL layout support.
- **Dashboard** — at-a-glance view of current balance, budget, and savings.

---

## Architecture

```
melos.yaml, pubspec.yaml          # workspace root (Melos monorepo config)

apps/my_daily_spending/
├── lib/
│   ├── main.dart                  # app bootstrap: Supabase init, EasyLocalization, ProviderScope
│   ├── app.dart                   # MaterialApp / theming root
│   ├── constants.dart
│   │
│   ├── providers/                 # Riverpod providers — the app's state layer
│   │   └── providers.dart         # balance, budget, saving, user, locale, nav state
│   │
│   ├── repositories/              # data access layer, one repo per domain concern
│   │   ├── database_repository.dart   # Supabase client + current user accessor
│   │   ├── auth_repository.dart       # login / signup
│   │   ├── balance_repository.dart
│   │   ├── budget_repository.dart
│   │   └── saving_repository.dart
│   │
│   ├── routes/                    # one folder per screen, colocated reusable components
│   │   ├── splash_screen.dart
│   │   ├── landing_screen.dart
│   │   ├── auth/                  # login_screen, signup_screen
│   │   ├── dashboard/
│   │   ├── deduct/
│   │   ├── set_balance/
│   │   ├── settings/
│   │   └── navigation_screen.dart # bottom nav shell
│   │
│   └── reusable_components/       # shared widgets (buttons, dialogs, gradient containers)
│
└── assets/
    ├── translations/              # en-US.json, ar-SA.json (easy_localization)
    └── logos/
```

**Data flow:** widget → Riverpod provider → repository → Supabase (Postgres + Auth) → response flows back through the provider to rebuild the widget.

---

## Tech Stack

| Concern | Technology |
|---|---|
| Framework | Flutter / Dart |
| State management | `flutter_riverpod`, `hooks_riverpod`, `flutter_hooks` |
| Backend | Supabase (`supabase_flutter`) — Postgres + Auth |
| Responsive UI | `flutter_screenutil` |
| Localization | `easy_localization` (English / Arabic) |
| Navigation | `persistent_bottom_nav_bar` |
| Media | `image_picker`, `flutter_svg` |
| Fonts | `google_fonts` |
| Monorepo tooling | Melos |

---

## Key Design Decisions

**Repository pattern over a direct Supabase client in widgets** — every screen goes through a repository (`BalanceRepository`, `BudgetRepository`, etc.) rather than calling `Supabase.instance.client` inline, keeping data-access logic swappable and testable independent of the UI.

**Riverpod as the single state boundary** — providers are the only thing widgets depend on for async/data state, so screens stay declarative and don't manage `FutureBuilder`/`setState` boilerplate themselves.

**Melos monorepo from the start** — even with a single app today, the `apps/**` / `packages/**` workspace layout means shared logic (e.g. a future API package or design system) can be split out without moving the app.

**Locale-driven layout, not just translated strings** — `easy_localization` is wired through the provider layer (`localization` state provider) so switching language also drives layout direction, not just label text.

---

## Getting Started

### Prerequisites

- Flutter SDK (Dart `>=2.19.3 <3.0.0`)
- A Supabase project (URL + anon key)
- Melos (`dart pub global activate melos`) — optional, only needed for workspace-wide commands

### Setup

```bash
# 1. Clone the repo
git clone <repo-url>
cd My-Daily-Spending-master

# 2. Bootstrap the workspace (or just `flutter pub get` inside apps/my_daily_spending)
melos bootstrap

# 3. Add Supabase credentials
# Create apps/my_daily_spending/lib/auth/secrets.dart (gitignored):
#   const String supabaseUrl = 'https://<project>.supabase.co';
#   const String supabaseAnonKey = '<anon-key>';

# 4. Run
cd apps/my_daily_spending
flutter run
```

### Melos scripts

```bash
melos bootstrap   # install deps across the workspace
melos clean       # clean all packages
```

---

## License

Personal project.

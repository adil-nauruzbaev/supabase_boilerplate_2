# Supabase Flutter Boilerplate

Boilerplate Flutter app with Supabase integration, `flutter_bloc`, `get_it`, `go_router`, and light/dark themes. Use it as a starting point for new Supabase-powered projects.

## Features

- Supabase authentication (sign up, sign in, sign out, update profile metadata)
- Dependency injection via `get_it`
- Routing/guards with `go_router`
- App-wide state management with `flutter_bloc` (Auth + Theme)
- Light/Dark themes with a dedicated `ThemeBloc`
- Ready-to-use login, signup, and protected home screens

## Project Structure

```
lib/
├─ app/
│  ├─ di/                 # get_it registrations + Supabase init
│  ├─ router/             # go_router setup with guards
│  └─ theme/              # light/dark themes + ThemeBloc
├─ core/
│  ├─ models/             # shared models (e.g., AppUser)
│  └─ services/           # Supabase service layer
├─ features/
│  └─ auth/
│     ├─ bloc/            # AuthBloc + events/states
│     └─ ui/              # Login, Signup, Home screens
└─ main.dart              # App bootstrap + BLoC providers
```

## Environment Variables

Create an `.env` file (see `.env.example`) assets folder with your Supabase credentials:

```
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_ANON_KEY=public-anon-key
```

> The app loads these values via `flutter_dotenv` before initializing Supabase.

## Getting Started

```bash
flutter pub get
cp .env.example .env   # fill with real Supabase values
flutter run
```

The home route is protected. Once authenticated, the router automatically redirects between `/login`, `/signup`, and `/home`.

## Extending

- Add more features under `lib/features/`
- Register new services/blocs inside `lib/app/di/injection_container.dart`
- Extend Supabase data access in `lib/core/services/supabase_service.dart`

Happy building! Remember to enable RLS and configure Supabase tables/policies for production use.

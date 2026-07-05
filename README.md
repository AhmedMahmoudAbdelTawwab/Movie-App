Cinema — Movie App

A Flutter movie discovery app built with Clean Architecture, BLoC/Cubit state management, and The Movie Database (TMDB) API. Browse popular movies, search the entire catalog, view rich movie details with cast & similar titles, and save favorites to a personal watchlist.

📱 Overview

Cinema is a portfolio project that demonstrates production-style Flutter architecture: a fully decoupled data / domain / presentation layering per feature, dependency injection with get_it + injectable, and predictable state management using Bloc (for async/event-driven flows like search) and Cubit (for simpler, direct-emit flows like movie details and recommendations).

✨ Features


🏠 Home — Browse currently popular movies fetched live from TMDB.
🔍 Search — Real-time movie search with loading skeletons, empty states, and error handling.
🎞️ Movie Details — Poster, overview, rating, runtime, genre, and more.
🎯 Similar & Recommended Movies — Discover related titles from the details screen.
⭐ Watchlist — Save/remove movies locally (persisted with SharedPreferences) to watch later.
💀 Skeleton Loading — Smooth shimmer placeholders while content loads (skeletonizer).


🏗️ Architecture

The project follows Clean Architecture, split into independent feature modules:

lib/
├── features/
│   ├── populer/       # Home / Popular movies
│   ├── search/        # Movie search
│   ├── detailes/      # Movie details (+ similar movies)
│   ├── recommend/     # Recommended movies section
│   └── watchlist/     # Local watchlist
│       ├── data/           → API clients, DTOs, repository implementations
│       ├── domain/         → Entities, repository interfaces, use cases
│       └── presentation/   → Bloc/Cubit, states, events, UI screens & widgets
├── bottom_nav_bar/     # Bottom navigation shell & screens
└── core/
    ├── constant/       # DI service locator, shared widgets/lists
    ├── network/        # Generic Success/Failure result wrapper
    └── utils/          # Colors, fonts, icons, image assets

Each feature is structured as:

LayerResponsibilityDataREST API calls (http), DTO ↔ JSON mapping, repository implementationDomainEntities, abstract repository contracts, use casesPresentationBloc/Cubit + states/events, screens & widgets

State management pattern:


Bloc → used where flows are event-driven (e.g. SearchBloc reacting to ExecuteSearch/ClearSearch events).
Cubit → used for simpler, direct state emission (e.g. DetailesCubit, SimilarCubit, RecommendedCubit).


🧰 Tech Stack


Flutter & Dart
flutter_bloc — Bloc/Cubit state management
get_it + injectable — Dependency injection / service locator
http — REST API networking
shared_preferences — Local watchlist persistence
skeletonizer — Shimmer loading skeletons
flutter_svg — SVG icon rendering
TMDB API — Movie data source


🚀 Getting Started

Prerequisites


Flutter SDK installed
A free TMDB API key


Setup

bash# 1. Clone the repository
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>

# 2. Install dependencies
flutter pub get

# 3. Add your TMDB API key
# Replace the apiKey constant in each *_api.dart file under lib/features/**/data/api/
# (or, better, move it into a .env / --dart-define for security)

# 4. Run the app
flutter run


⚠️ Note: API keys are currently hardcoded as constants in the API classes for simplicity. For production, move them to environment variables (e.g. flutter_dotenv or --dart-define) and never commit real keys to version control.



📸 Screenshots

HomeSearchDetailsWatchlistadd screenshotadd screenshotadd screenshotadd screenshot


Add your screenshots to a screenshots/ folder in the repo root and update the table above, e.g.:
![Home](screenshots/home.png)



📂 Project Status

🚧 Actively developed as a personal learning & portfolio project — focused on practicing Clean Architecture, Bloc/Cubit internals, and REST API integration in Flutter.

👤 Author

Ahmed Mahmoud Abdeltawwab
Flutter Developer
LinkedIn

📄 License

This project is open source and available for learning purposes.

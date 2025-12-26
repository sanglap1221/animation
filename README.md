# 🌍 Language Learning Onboarding App

> A polished Flutter onboarding experience showcasing smooth animations, clean architecture, and modern UI patterns.

✨ What This App Shows

Smooth onboarding flow with animated transitions

Language selection screen with interactive UI

Clean and scalable project structure

Professional animation timing and motion design

Proper separation of UI and logic using BLoC

The app is simple by design so the animations and UX speak for themselves.

📱 App Flow

Onboarding Screens

Swipe or tap through onboarding slides

Animated hero element shared across screens

Skip option to move ahead

Language Selection

Grid-based language choices

Smooth selection feedback

Subtle entrance animations

Continue flow after selection

🧠 Architecture

State Management: BLoC (flutter_bloc)

UI Layer: Pure Flutter widgets

Logic Layer: Event-driven state updates

Animations: Built using Flutter’s native animation system

The architecture is kept clean and readable, making it easy to extend or test later.

🛠️ Tech Stack

Flutter

Dart

flutter_bloc

Native Flutter animations (no third-party animation libraries)

📁 Project Structure
lib/
├── bloc/ # Onboarding business logic
├── screens/ # UI screens
├── widgets/ # Reusable UI components
└── main.dart # App entry point

🚀 Getting Started
Prerequisites

Flutter SDK (3.9.2 or above)

Android Studio / Xcode

Emulator or physical device

Run the App
flutter pub get
flutter run

The app works on Android, iOS, Web, and Desktop.

🎯 Why This Project

This project was built to demonstrate:

How real onboarding animations are structured

How BLoC keeps UI clean and predictable

How to create smooth, non-distracting animations

How production-ready Flutter code is organized

🔮 Possible Enhancements

Save selected language locally

Add haptic feedback

Light/Dark theme switch

Localization support (i18n)

Unit & widget tests

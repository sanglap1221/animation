# 🌍 Language Learning Onboarding App

> A polished Flutter onboarding experience showcasing smooth animations, clean architecture, and modern UI patterns.

---

## ✨ What's Inside

- **Smooth Animations**: Hero transitions, bouncing icons, fade-slide effects
- **Clean BLoC Architecture**: Separation of business logic and UI
- **Interactive Language Selection**: Beautiful gradient cards with smooth feedback
- **Production-Ready Code**: Organized, scalable, and easy to maintain
- **Multi-Platform**: Works on Android, iOS, Web, Windows, macOS, and Linux

---

## 📱 App Features

### Onboarding Screen

- 3-slide carousel with animated transitions
- Animated hero icon that transitions smoothly
- Skip button to jump ahead
- Progress indicator
- Descriptive text with fade-in animations

### Language Selection Screen

- 6 language options in a responsive grid
- Smooth color transitions on selection
- Continuous bouncing icon animation
- Grid entrance with fade + slide animation
- Professional dark theme with gradient accents

---

## 🎬 Animations Used

| Animation           | Provider                              | Duration | Effect                   |
| ------------------- | ------------------------------------- | -------- | ------------------------ |
| **Hero Morph**      | `Hero` widget                         | 500ms    | Smooth icon transition   |
| **Bouncing Icon**   | `AnimationController`                 | 2s loop  | Continuous vertical bob  |
| **Card Selection**  | `AnimatedContainer`                   | 300ms    | Gradient background fade |
| **Grid Entrance**   | `AnimatedOpacity` + `AnimatedPadding` | 600ms    | Fade in + slide up       |
| **Page Transition** | `PageRouteBuilder`                    | 900ms    | Fade + slide up effect   |
| **Text Switch**     | `AnimatedSwitcher`                    | 500ms    | Slide + fade text change |

---

## 🧠 State Management: BLoC

```dart
// Simple event → state flow
context.read<OnboardingBloc>().add(NextPageEvent());

// UI rebuilds automatically based on new state
BlocBuilder<OnboardingBloc, OnboardingState>(
  builder: (context, state) {
    return Text('Slide: ${state.index}');
  },
);
```

**Why BLoC?**

- Clean separation of business logic from UI
- Predictable state updates
- Easy to test
- Scales well for larger apps

---

## 🛠️ Tech Stack

- **Framework**: Flutter 3.9.2+
- **State Management**: flutter_bloc ^9.1.1
- **Animations**: Native Flutter (no external libraries)
- **Language**: Dart
- **Design**: Material Design with custom gradients

---

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry & theme
├── bloc/
│   ├── onboarding_bloc.dart     # Business logic
│   ├── onboarding_event.dart    # Events
│   └── onboarding_state.dart    # State
├── screens/
│   ├── onboarding_screen.dart   # Carousel slides
│   └── language_screen.dart     # Language grid
└── widgets/
    └── hoppie_hero.dart         # Gradient icon widget
```

---

## 🚀 Quick Start

### Prerequisites

- Flutter SDK 3.9.2+
- Dart SDK
- Android Studio / Xcode (optional)

### Installation

```bash
# Navigate to project
cd animation_app

# Get dependencies
flutter pub get

# Run on default emulator
flutter run

# Or run on specific device
flutter run -d chrome      # Web
flutter run -d windows     # Windows Desktop
flutter run -d macos       # macOS Desktop
```

---

## 🎯 Design Highlights

- **Dark Theme**: Professional dark blue (#0A192F) background
- **Color Palette**: Purple (#6366F1) and blue (#0F3460) gradients
- **Animations**: Smooth curves, proper easing, no jarring effects
- **Responsive**: Adapts beautifully to all screen sizes
- **Performance**: Optimized for 60fps on all platforms

---

## 💡 Key Learnings

This project demonstrates:

✅ How to structure professional Flutter apps  
✅ How BLoC keeps code clean and testable  
✅ How to create smooth, polished animations  
✅ Proper use of Flutter's animation system  
✅ Best practices for state management

---

## 🔮 Future Enhancements

- Persist language selection to local storage
- Add haptic feedback on card taps
- Light theme with theme switcher
- Multi-language UI (i18n)
- Swipe gestures for navigation
- Unit & widget tests
- Sound effects and audio cues

---

## 📚 Resources

- [Flutter Docs](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Flutter Animations](https://docs.flutter.dev/ui/animations)
- [Material Design](https://material.io/design)

---

**Built as an internship project to showcase real-world Flutter development practices.**

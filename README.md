# Animation App - Language Learning Onboarding

A beautiful Flutter onboarding app showcasing smooth animations and modern UI design patterns for a language learning platform.

## Features

✨ **Smooth Animations**

- Hero animations for seamless transitions
- Animated page indicators
- Floating action button with gradient effects
- Bouncing icon animations

🎯 **BLoC State Management**

- Clean separation of business logic
- Equatable for efficient state comparison
- Event-driven architecture

🌍 **Interactive Language Selection**

- 6 language options with flags
- Selectable language cards with animations
- Real-time visual feedback
- Difficulty level indicators

🎨 **Modern UI/UX**

- Dark theme with gradient accents
- Skip functionality for quick navigation
- Progress indicators
- Responsive design

## Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- A device or emulator (Android/iOS/Web/Desktop)

### Installation & Running

1. **Clone or navigate to the project directory:**

```bash
cd animation_app
```

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Run the app:**

**On Android/iOS emulator:**

```bash
flutter run
```

**On connected device:**

```bash
flutter run
```

**On web:**

```bash
flutter run -d chrome
```

**On desktop (Windows):**

```bash
flutter run -d windows
```

**On desktop (macOS):**

```bash
flutter run -d macos
```

**On desktop (Linux):**

```bash
flutter run -d linux
```

4. **Build for release (Android APK):**

```bash
flutter build apk
```

5. **Build for iOS:**

```bash
flutter build ios
```

### Running in Debug Mode

```bash
flutter run
```

### Running in Release Mode

```bash
flutter run --release
```

### Hot Reload & Hot Restart

- **Hot Reload** (after saving file): `r` key in terminal
- **Hot Restart** (full app restart): `R` key in terminal
- **Quit**: `q` key in terminal

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── bloc/                     # BLoC pattern implementation
│   ├── onboarding_bloc.dart
│   ├── onboarding_event.dart
│   └── onboarding_state.dart
├── screens/                  # UI screens
│   ├── onboarding_screen.dart
│   └── language_screen.dart
└── widgets/                  # Reusable widgets
    └── hoppie_hero.dart     # Animated hero widget
```

## Dependencies

- `flutter_bloc: ^9.1.1` - State management
- `equatable: ^2.0.7` - Value equality
- `cupertino_icons: ^1.0.8` - iOS-style icons

## 🎬 Animations Implemented

### 1. **Hero Animation**

- **Location:** `HoppieHero` widget (used in all screens)
- **Effect:** Smooth morphing transition of the purple gradient circle with language icon
- **Duration:** 500ms
- **Usage:**
  - Onboarding screens show the logo smoothly transitioning
  - Language selection screen maintains the same hero tag for continuity
- **Code:** Uses Flutter's built-in `Hero` widget with shared tag 'hoppie'

### 2. **Animated Page Transitions**

- **Location:** `OnboardingScreen` → `LanguageScreen`
- **Effect:** Combined fade-in and slide-up transition
- **Duration:** 900ms with easing curve (`CurvedAnimation` with `Curves.easeInOutQuart`)
- **Details:**
  - Fades in the new page (0 to 1 opacity)
  - Slides up from bottom (Offset: 0, 0.2 to 0, 0)
  - Smooth curve for natural motion

### 3. **Bouncing/Bob Animation**

- **Location:** `LanguageScreen`
- **Effect:** Continuous vertical bobbing motion of the hero icon
- **Duration:** 2 seconds per cycle (repeats indefinitely)
- **Details:**
  - Moves between -6 to +6 pixel offset vertically
  - Uses `AnimationController` with `repeat(reverse: true)`
  - Eased with `CurvedAnimation` using `Curves.easeInOut`
- **Code:**

```dart
bob = Tween(begin: -6.0, end: 6.0)
    .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
```

### 4. **Animated Text Transitions (Onboarding)**

- **Location:** `OnboardingScreen` - Title updates on each page
- **Effect:** Slide + Fade transition when switching between onboarding pages
- **Duration:** 500ms
- **Details:**
  - Slides in from right with slight horizontal offset (0.2, 0)
  - Fades in simultaneously with opacity animation
  - Uses `AnimatedSwitcher` for automatic animation on key change
- **Code:**

```dart
SlideTransition(
  position: Tween(begin: Offset(0.2, 0), end: Offset.zero)
      .animate(animation),
  child: FadeTransition(opacity: animation, child: child),
)
```

### 5. **Language Card Selection Animation**

- **Location:** `LanguageScreen` - Grid of language cards
- **Effect:** Smooth color and border transition when tapping a card
- **Duration:** 300ms
- **Details:**
  - Selected card shows purple-blue gradient background
  - Border disappears on selection
  - Non-selected cards show semi-transparent white background
  - Uses `AnimatedContainer` for smooth transitions
- **Code:**

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  decoration: BoxDecoration(
    gradient: isSelected ? LinearGradient(...) : null,
    color: isSelected ? null : Colors.white.withValues(alpha: 0.1),
  ),
)
```

### 6. **Opacity & Padding Animation (Language Grid)**

- **Location:** `LanguageScreen` - Entire grid appears on load
- **Effect:** Fades in and slides up from below
- **Duration:** 600ms
- **Details:**
  - `AnimatedOpacity`: 0 to 1 opacity fade-in
  - `AnimatedPadding`: Starts with 30px top padding, animates to 0
  - Triggered by `animate` state variable after 200ms delay
- **Code:**

```dart
AnimatedOpacity(
  opacity: animate ? 1 : 0,
  duration: const Duration(milliseconds: 600),
  child: AnimatedPadding(
    padding: EdgeInsets.only(top: animate ? 0 : 30),
    ...
  ),
)
```

### 7. **Floating Action Button (FAB) Animation**

- **Location:** `OnboardingScreen`
- **Effect:** Implicit scale and shadow effects
- **Details:**
  - FAB appears at bottom with built-in Material elevation
  - Ripple effect on tap (Material design default)
  - Smooth transitions between states
  - Uses `ElevatedButton` on language screen with gradient background

### 8. **Back Navigation Animation (Language Screen)**

- **Location:** `LanguageScreen` - Back button in AppBar
- **Effect:** AppBar appears with implicit animation
- **Details:**
  - Default Material AppBar animation
  - Smooth fade-in of navigation elements

### Summary of Animation Timings:

| Animation       | Duration | Effect               |
| --------------- | -------- | -------------------- |
| Hero            | 500ms    | Smooth icon morphing |
| Page Transition | 900ms    | Fade + Slide Up      |
| Bob/Bounce      | 2000ms   | Infinite loop        |
| Text Switch     | 500ms    | Slide + Fade         |
| Card Selection  | 300ms    | Gradient & Border    |
| Grid Entrance   | 600ms    | Opacity + Padding    |

## Key Improvements

- ✅ Replaced image assets with gradient-based icon (no external images needed)
- ✅ Added Equatable for proper state comparison
- ✅ Implemented interactive language selection with 6 languages
- ✅ Added skip functionality on onboarding screens
- ✅ Progress indicators for better UX
- ✅ Descriptions for each onboarding step
- ✅ Back navigation support
- ✅ Improved code organization with constants

## Additional Notes & Improvements

### Current Features

- ✅ **Multi-platform support**: Works on Android, iOS, Web, and Desktop (Windows, macOS, Linux)
- ✅ **No external image dependencies**: Uses pure Flutter widgets (icons + gradients)
- ✅ **Responsive design**: Adapts to different screen sizes
- ✅ **Smooth 60fps animations**: All animations optimized for performance
- ✅ **Dark theme**: Professional dark blue color scheme (#0A192F)
- ✅ **BLoC pattern**: Clean separation of UI and business logic

### Performance Optimizations

- `AnimatedContainer` instead of full rebuild
- `AnimatedSwitcher` for efficient widget transitions
- `AnimationController` properly disposed in `dispose()`
- `Equatable` prevents unnecessary rebuilds in BLoC
- Lazy rendering of grid items

### Known Deprecation Warnings

- `withOpacity()` is deprecated in favor of `withValues()`
- These warnings don't affect functionality but can be updated in future versions:

```dart
// Old
Colors.white.withOpacity(0.7)

// New
Colors.white.withValues(alpha: 0.7)
```

### Future Enhancement Ideas

1. **Persistence**: Save selected language to `SharedPreferences`
2. **Animations**: Add page swipe gestures for onboarding navigation
3. **Content**: Implement actual language learning lessons
4. **Audio**: Add pronunciation audio for each language
5. **Theming**: Light mode support with theme switcher
6. **Localization**: Multi-language UI support (i18n)
7. **Testing**: Unit tests and widget tests
8. **Analytics**: Track user selections and engagement
9. **Sound Effects**: Add subtle sound feedback to interactions
10. **Haptic Feedback**: Vibration feedback on card selection

### Testing the Animations

To see all animations in action:

1. Run: `flutter run`
2. Navigate through the onboarding screens (notice text slide + fade)
3. Skip to language selection (notice page transition)
4. Watch the hero icon bob continuously
5. Tap language cards (notice gradient animation)
6. Select a language and see the continue button activate

### Build Information

- **Minimum SDK**: Flutter 3.9.2
- **Target SDK**: Latest stable
- **Android**: Compiled successfully to APK
- **iOS**: Ready for Xcode build
- **Web**: Can be deployed as web app
- **Desktop**: Windows, macOS, Linux support

## Resources

- [Flutter Animation Documentation](https://docs.flutter.dev/ui/animations)
- [AnimatedContainer](https://docs.flutter.dev/ui/widgets/implicit-animations)
- [Hero Animation](https://docs.flutter.dev/ui/animations/hero-animations)
- [BLoC Pattern](https://bloclibrary.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For more help, view the [official Flutter documentation](https://docs.flutter.dev/).

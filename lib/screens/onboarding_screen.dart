import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../widgets/hoppie_hero.dart';
import 'language_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const titles = [
    "Learn languages\nwith fun",
    "Talk confidently",
    "Let’s get started",
  ];
  static const descriptions = [
    "Master new languages through\ninteractive lessons",
    "Practice speaking with\nconfidence",
    "Begin your language\nlearning journey",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F),
      body: SafeArea(
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: state.index < 2
                        ? TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LanguageScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          )
                        : const SizedBox(height: 48),
                  ),
                ),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(0.2, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: Column(
                    key: ValueKey(state.index),
                    children: [
                      Text(
                        titles[state.index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        descriptions[state.index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const HoppieHero(),

                // Progress indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: state.index == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: state.index == index
                            ? Colors.purple.shade400
                            : Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 20),
                  child: FloatingActionButton(
                    backgroundColor: Colors.purple.shade400,
                    onPressed: () {
                      if (state.index == 2) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                              milliseconds: 900,
                            ),
                            pageBuilder: (_, __, ___) => const LanguageScreen(),
                            transitionsBuilder: (_, animation, __, child) {
                              final curved = CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInOutQuart,
                              );
                              return FadeTransition(
                                opacity: curved,
                                child: SlideTransition(
                                  position: Tween(
                                    begin: const Offset(0, 0.2),
                                    end: Offset.zero,
                                  ).animate(curved),
                                  child: child,
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        context.read<OnboardingBloc>().add(NextPageEvent());
                      }
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

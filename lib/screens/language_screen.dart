import 'package:flutter/material.dart';
import '../widgets/hoppie_hero.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen>
    with SingleTickerProviderStateMixin {
  bool animate = false;
  late AnimationController controller;
  late Animation<double> bob;
  String? selectedLanguage;

  static const languages = [
    {'name': 'English', 'icon': '🇬🇧', 'level': 'Beginner friendly'},
    {'name': 'Spanish', 'icon': '🇪🇸', 'level': 'Popular choice'},
    {'name': 'French', 'icon': '🇫🇷', 'level': 'Romantic language'},
    {'name': 'German', 'icon': '🇩🇪', 'level': 'Intermediate'},
    {'name': 'Japanese', 'icon': '🇯🇵', 'level': 'Advanced'},
    {'name': 'Korean', 'icon': '🇰🇷', 'level': 'Trending'},
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    bob = Tween(
      begin: -6.0,
      end: 6.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    Future.delayed(
      const Duration(milliseconds: 200),
      () => setState(() => animate = true),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A192F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          AnimatedBuilder(
            animation: bob,
            builder: (_, child) {
              return Transform.translate(
                offset: Offset(0, bob.value),
                child: child,
              );
            },
            child: const HoppieHero(size: 120),
          ),
          const SizedBox(height: 30),
          const Text(
            'Choose your language',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Select the language you want to learn',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 600),
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 600),
                padding: EdgeInsets.only(top: animate ? 0 : 30),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    final isSelected = selectedLanguage == language['name'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = language['name'] as String;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? LinearGradient(
                                  colors: [
                                    Colors.purple.shade400,
                                    Colors.blue.shade400,
                                  ],
                                )
                              : null,
                          color: isSelected
                              ? null
                              : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : Colors.white.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              language['icon'] as String,
                              style: const TextStyle(fontSize: 40),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              language['name'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              language['level'] as String,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: selectedLanguage != null
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Great! Let\'s learn $selectedLanguage',
                            ),
                            backgroundColor: Colors.purple.shade400,
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade400,
                  disabledBackgroundColor: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

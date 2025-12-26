import 'package:flutter/material.dart';

class HoppieHero extends StatelessWidget {
  final double size;
  const HoppieHero({super.key, this.size = 200});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hoppie',
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Icon(
          Icons.language_rounded,
          size: size * 0.6,
          color: Colors.white,
        ),
      ),
    );
  }
}

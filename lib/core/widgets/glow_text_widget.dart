import 'package:flutter/material.dart';

class GlowText extends StatelessWidget {
  const GlowText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: const Color(0xFF8924E7).withOpacity(0.6),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
          Shadow(
            color: const Color(0xFF6A46F9).withOpacity(0.6),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

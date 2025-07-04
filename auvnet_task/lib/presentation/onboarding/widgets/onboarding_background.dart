import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Positioned(
          top: -20,
          left: -104,
          child: Container(
            width: 342,
            height: 342,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment(-1.5, 0.5),
                end: Alignment(1.5, -0.5),
                colors: [
                  Color(0xFF8900FE),
                  Color(0xFFFFDE59),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -33,
          right: -53,
          child: Container(
            width: 216,
            height: 216,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //color: const Color(0xFF0EBE7E).withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                    blurRadius: 30,
                    spreadRadius: 2,
                    color: const Color(0xFF0EBE7E).withOpacity(0.3)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

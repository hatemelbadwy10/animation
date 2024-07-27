import 'package:flutter/material.dart';
class CustomToggleButton extends StatelessWidget {
  final bool isDarkTheme;
  final VoidCallback onToggle;

  const CustomToggleButton({
    super.key,
    required this.isDarkTheme,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image:  DecorationImage(
                image: AssetImage(   isDarkTheme
                    ? 'assets/image/moon_button.png'
                    : 'assets/image/sun_button.png',),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.linear,
            left: isDarkTheme ? 50.0 : 0.0,
            top: 0.0,
            bottom: 0.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Change this to fit your thumb style
              ),

            ),
          ),
        ],
      ),
    );
  }
}

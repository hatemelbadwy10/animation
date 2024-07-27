import 'package:flutter/material.dart';
import 'package:themeapp/widgets/animated_sun_moon.dart';
import 'package:themeapp/widgets/custom_toggle_button.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {super.key,
      required this.image,
      required this.isDarkTheme,
      required this.themeText,
      required this.onToggleTheme, required this.animationSlider});
  final String image, themeText;
  final bool isDarkTheme;
  final VoidCallback onToggleTheme;
  final Animation<Offset> animationSlider;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Column(
          children: [
            AnimatedSunMoon(isDarkTheme: isDarkTheme,animationSlider:animationSlider ,),
            const SizedBox(
              height: 120,
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Text(
                themeText,
                key: ValueKey<String>(themeText), // Ensures proper identification
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),            const SizedBox(
              height: 120,
            ),
            CustomToggleButton(
              isDarkTheme: isDarkTheme, onToggle: onToggleTheme,
            )
          ],
        ),
      ),
    );
  }
}


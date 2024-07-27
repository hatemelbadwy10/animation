import 'package:flutter/material.dart';
class AnimatedSunMoon extends StatelessWidget {
  final bool isDarkTheme;
  final Animation<Offset> animationSlider;

  const AnimatedSunMoon({
    super.key,
    required this.isDarkTheme,
    required this.animationSlider,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: animationSlider,
              child: child,
            );
          },
          child: Visibility(
            visible: !isDarkTheme,
            child: Image.asset(
              'assets/image/sun.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
        // Moon Image
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: animationSlider,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: Visibility(
            visible: isDarkTheme,
            child: Image.asset(
              'assets/image/moon.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ],
    );
  }
}

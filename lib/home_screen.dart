import 'package:flutter/material.dart';
import 'package:themeapp/base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isDarkTheme = false;
  late AnimationController animationController;
  late Animation<Offset> animationSlider;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
  }
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animationSlider =
        Tween<Offset>(
      begin: const Offset(0,.5),
      end: Offset.zero, // End position (center)
    ).animate(animationController);

    animationController.forward();
  }
  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
          image: isDarkTheme
              ? 'assets/image/dark_screen.png'
              : 'assets/image/light_screen.png',
          isDarkTheme: isDarkTheme,

          themeText: isDarkTheme?'Good Night!':'Good Morning!',
          onToggleTheme:(){
            setState(() {
              isDarkTheme = !isDarkTheme;
              animationController.reset();
              animationController.forward();
            });
          }, animationSlider: animationSlider,),
    );
  }
}

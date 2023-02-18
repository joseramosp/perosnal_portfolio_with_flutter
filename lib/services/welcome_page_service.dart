import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class WelcomePageService extends ChangeNotifier {
  String name = 'Jose';
  String title1 = 'Flutter and';
  String title2 = 'Cloud Enthusiast';

  Timer greetingsTimer = Timer(Duration.zero, () {});

  late AnimationController wavingAnimation;

  static List<String> greetings = [
    "Hello",
    "Hola",
    "Que Lo Que",
    "Bonjour",
    "Olá",
    "Ciao",
    "Namaste",
    "Kon'nichiwa"
  ];

  int greetingsCounter = 0;

  String currentGreeting = greetings[0];

  void initializeGreetings() {
    // cycle through the list of greetings every second
    greetingsTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (greetingsCounter == greetings.length) {
        greetingsCounter = 0;
      }

      currentGreeting = greetings[greetingsCounter];
      greetingsCounter++;

      // notify the change to the UI so it rebuilds
      notifyListeners();
    });
  }

  void disposeTimer() {
    greetingsTimer.cancel();
  }

  void initializeAnimation(TickerProvider provider) {
    wavingAnimation = AnimationController(
        vsync: provider, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
  }

  void disposeAnimation() {
    wavingAnimation.dispose();
  }

  @override
  void dispose() {
    disposeTimer();
    disposeAnimation();
    super.dispose();
  }
}

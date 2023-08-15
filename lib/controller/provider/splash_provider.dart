import 'package:flutter/material.dart';
import 'package:note_app/presentation/screens/home/home_screen.dart';

class SplashProvider extends ChangeNotifier {
  Future<void> navigateToHome({context}) async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }),
    );
    notifyListeners();
  }
}

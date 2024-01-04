import 'package:audio_reader/register/emails.dart';
import 'package:flutter/material.dart';
import 'my_shared_preferences.dart';
import 'myhome.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    bool isFirstTime = await MySharedPreferences.isFirstTime();
    bool hasVisitedHomePage = await MySharedPreferences.getHasVisitedHomePage();

    await Future.delayed(Duration(
        seconds:
            2)); // Simulating a delay, replace with actual initialization logic

    if (isFirstTime || !hasVisitedHomePage) {
      // If it's the first time or the user hasn't visited the home page
      // Navigate to the appropriate screen (e.g., IntroScreen or FirstScreen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FirstScreen(),
        ),
      );
    } else {
      // If the user has visited the home page before
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/changer2.png', // Adjust the path based on your project structure
              width: 100.0, // Adjust the width as needed
              height: 100.0, // Adjust the height as needed
            ),
            SizedBox(height: 16.0),
            Text(
              'LIFE CHANGER',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

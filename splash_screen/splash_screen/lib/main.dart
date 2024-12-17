import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(HenSellingApp());
}

class HenSellingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poultry App',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Orange theme color
        scaffoldBackgroundColor: Colors.orange, 
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and set the duration
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    // Define the sliding animation (from bottom to center)
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Start from bottom of the screen
      end: Offset.zero, // End at the center of the screen
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth animation
    ));

    // Start the animation
    _controller.forward();

    // Navigate to the login screen after the animation ends
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange, // Orange background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Slide animation for the hen image
            SlideTransition(
              position: _offsetAnimation,
              child: Image.asset(
                'assets/hen_151155842_1000.jpg',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Poultry App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text on orange background
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('splash screen'),
      ),
      body: Center(
        child: Text('sign up here dear'),
      ),
    );
  }
}

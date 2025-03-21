import 'dart:async';
import 'package:bus_tracking_management_system/screens/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _rotationAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _bounceAnimation =
        Tween<Offset>(begin: Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _controller.forward();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectionSignupScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blueAccent.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _rotationAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SlideTransition(
                position: _bounceAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Colors.white, Colors.blue.shade200],
                    ).createShader(bounds),
                    child: Text(
                      'Bus Tracking System',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

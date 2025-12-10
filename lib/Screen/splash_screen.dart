import 'package:explora/Screen/screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Logo için fade animasyonu
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    // 3 saniye sonra ana sayfaya geç
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MainScreen()),
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
      backgroundColor: Color(0xFF003B7B), // Arka plan rengin
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: CircleAvatar(
            radius: 150,
            child: Image.asset(
              'assets/icons/newlogo2.png', // Logo dosyan
              
            ),
          ),
        ),
      ),
    );
  }
}

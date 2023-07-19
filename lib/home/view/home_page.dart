import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// The home page of the application.
///
/// This widget represents the main screen of the application,
/// displaying a scaffold with a background color and a centered
/// text widget. Tapping anywhere on the screen will change the
/// background color to a randomly generated color.
class HomePage extends StatefulWidget {
  ///
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _backgroundColor = Colors.white;
  final opacity = 0.5;
  final radius = 4.0;
  final sigmaXY = 10.0;

  @override
  void initState() {
    _backgroundColor = getRandomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _backgroundColor = getRandomColor();
      }),
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigmaXY, sigmaY: sigmaXY),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(opacity),
                borderRadius: BorderRadius.circular(radius),
              ),
              child: const Text(
                'Hello there',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    final random = Random();

    final Color _color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );

    return _color;
  }
}

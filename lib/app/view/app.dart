import 'package:flutter/material.dart';
import 'package:solid_test/home/home.dart';

/// The main entry point for the application.
/// This widget represents the root of the widget tree.
///
/// It initializes the MaterialApp and provides basic configuration
/// such as theme, title, and initial route.
class App extends StatelessWidget {
  ///
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Solid.Software test app",
      home: HomePage(),
    );
  }
}

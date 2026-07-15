import 'package:flutter/material.dart';
import 'screens/tamagochi_screen.dart';

void main() {
  runApp(const TamagochiApp());
}

class TamagochiApp extends StatelessWidget {
  const TamagochiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tamagochi LCD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TamagochiScreen(),
    );
  }
}
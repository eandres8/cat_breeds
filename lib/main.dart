import 'package:flutter/material.dart';

import 'package:catbreets/ui/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CatBreeds',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

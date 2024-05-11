import 'package:catbreets/ui/screens/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(height: 100),
        body: Container(
          color: Colors.red,
          child: const Center(
            child: Text('Hello World!'),
          ),
        ),
      );
  }
}
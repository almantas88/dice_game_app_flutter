import 'package:flutter/material.dart';
import 'main_container.dart';

void main() {
  runApp(const MyApp());
}

const List<Color> colors = [
              Color.fromARGB(255, 90, 123, 255),
              Color.fromARGB(255, 172, 160, 255)
            ];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter First App',
      home: Scaffold(
        body: MainContainer(colors: colors)
      )
    );
  }
}


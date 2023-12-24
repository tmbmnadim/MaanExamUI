import 'package:flutter/material.dart';
import 'package:uimaanexamnadim/Screens/Home/home.dart';

void main() {
  runApp(const MaanExam());
}

class MaanExam extends StatelessWidget {
  const MaanExam({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Page UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

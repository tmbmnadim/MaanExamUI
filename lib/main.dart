import 'package:flutter/material.dart';

import 'Screens/Home/home.dart';

void main() {
  runApp(const MaanExam());
}

class MaanExam extends StatelessWidget {
  const MaanExam({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Three Page UI',
      home: Home(),
    );
  }
}

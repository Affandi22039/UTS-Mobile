import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // Mengimpor file quiz_screen.dart

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis untuk Maba',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(), // Memuat QuizScreen() dari quiz_screen.dart
    );
  }
}

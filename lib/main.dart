import 'package:flutter/material.dart';
import 'package:gallery_app/views/home/view.dart';
import 'package:gallery_app/views/images/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: false,
      ),
      home: HomeView(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:information_app/home.dart';
import 'package:information_app/result.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => const MyHome(),
        'result': (context) => const MyResult()
      },
    ),
  );
}

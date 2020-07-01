import 'package:flutter/material.dart';

import 'random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.teal[900],
        scaffoldBackgroundColor: Colors.teal[700],
      ),
      title: 'Word - Y',
      debugShowCheckedModeBanner: false,
    );
  }
}

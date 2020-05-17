import 'package:flutter/material.dart';
import 'package:ringingthebull/screens/play_screen.dart';

void main() {
  runApp(RingingTheBull());
}

class RingingTheBull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: PlayScreen(), //TODO Loading page
    );
  }
}

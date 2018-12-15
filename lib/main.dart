import 'package:flutter/material.dart';
import 'package:fluttask/state_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttask',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: StateRoute(),
    );
  }
}

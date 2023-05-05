import 'dart:async';

import 'package:flutter/material.dart';

class ChangeScreen extends StatefulWidget {
  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  late Timer _timer;
  int _counter = 0;
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter = (_counter + 1) % _colors.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _colors[_counter],
            _colors[(_counter + 1) % _colors.length],
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Gradient Container',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

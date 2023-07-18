import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  const Date({super.key});
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();

    return Scaffold(
        body: Text(
      'Current Time: ${time.hour}:${time.minute}:${time.second}',
      style: TextStyle(fontSize: 20),
    ));
  }
}
